#include "StdAfx.h"
#include "TcpIpCommInterface.h"
#include "stdio.h"
#include <atlstr.h>
#include "math.h"
#include "stdlib.h"
#include <fstream>
#include <iostream>
#include "string"
using namespace std;
#define pi 3.141592653589793
TcpIpCommInterface::TcpIpCommInterface(void)
{
}

TcpIpCommInterface::~TcpIpCommInterface(void)
{
}


/*
通信的几个步骤
client端：1 WSAStartup；2 socket；3connect 4send/recv； 5closesocket
*/
bool TcpIpCommInterface::Connect()
{
	WSAData wsadata;
	WORD wVersionRequested;
	wVersionRequested=MAKEWORD(2,2);
	//step 1每一个使用windows socket的应用程序必须先进行WSAstartup函数加载套接字库
	if (WSAStartup(wVersionRequested,&wsadata)!=0)
	{
		MessageBoxA(NULL,"Socket Stack Error!","Error",MB_ICONERROR|MB_SYSTEMMODAL|MB_SETFOREGROUND);
		return false;
	}

	if (LOBYTE(wsadata.wVersion)!=2||HIBYTE(wsadata.wVersion)!=2)
	{
		WSACleanup();
		return false;
	}

	sockaddr_in addr;
	//step 2 所有通信之前都要调用socket函数创建套接字
	ClientSocket=socket(AF_INET,SOCK_STREAM,0 );
	addr.sin_addr.S_un.S_addr=inet_addr("192.168.125.1");
	addr.sin_family=AF_INET;
	addr.sin_port=htons(1502);
	int rc;
	if (rc=connect(ClientSocket,(SOCKADDR*)&addr,sizeof(addr))==0)
	{
		return true;
	} 
	else
	{
		return false;
	}
}
void TcpIpCommInterface::SendMsg(char* command)
{
	//向ABB机器人发送命令字符串
	send(ClientSocket, command, strlen(command),0);
}
void TcpIpCommInterface::MoveToolTo(double position[3], double euler[3],double vel)
{
	// 向下位机发一个目标点数据（double[3]），目标点姿态（四元数double[4]）
	char swrite[100];
	char stemp[100];
	char recvbuf[100];
	CString str;
	//发送程序文本
	strcpy(swrite,"#FileHead@");
	SendMsg(swrite);
	int FileCounter=0;

	//模块头
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"MODULE movproc\n");
	strcat(swrite,"@");
	SendMsg(swrite);

	//欧拉角转换为四元数
	double ax,ay,az;
	double q1,q2,q3,q4;//四元数各分量
	double x1,x2,x3;
	double y1,y2,y3;
	double z1,z2,z3;

	ax=euler[0];
	ay=euler[1];
	az=euler[2];

	x1=cos(ay)*cos(az);
	x2=cos(ay)*sin(az);
	x3=-sin(ay);
	y1=-cos(ax)*sin(az)+sin(ax)*sin(ay)*cos(az);
	y2=cos(ax)*cos(az)+sin(ax)*sin(ay)*sin(az);
	y3=sin(ax)*cos(ay);
	z1=sin(ax)*sin(az)+cos(ax)*sin(ay)*cos(az);
	z2=-sin(ax)*cos(az)+cos(ax)*sin(ay)*sin(az);
	z3=cos(ax)*cos(ay);

	q1=sqrt(x1+y2+z3+1)/2;
	if(y3>=z2)
		q2=sqrt(x1-y2-z3+1)/2;
	else
		q2=-sqrt(x1-y2-z3+1)/2;
	if(z1>=x3)
		q3=sqrt(y2-x1-z3+1)/2;
	else
		q3=-sqrt(y2-x1-z3+1)/2;
	if(x2>=y1)
		q4=sqrt(z3-x1-y2+1)/2;
	else
		q4=-sqrt(z3-x1-y2+1)/2;


	//目标点
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"\tCONST robtarget Target_1000:=[[");
	sprintf(stemp,"%.4lf",position[0]);
	strcat(swrite,stemp);
	strcat(swrite,",");
	sprintf(stemp,"%.4lf",position[1]);
	strcat(swrite,stemp);
	strcat(swrite,",");
	sprintf(stemp,"%.4lf",position[2]);
	strcat(swrite,stemp);
	strcat(swrite,"],");
	strcat(swrite,"@");
	SendMsg(swrite);

	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"\t[");
	sprintf(stemp,"%.4lf",q1);
	strcat(swrite,stemp);
	strcat(swrite,",");+
	sprintf(stemp,"%.4lf",q2);
	strcat(swrite,stemp);
	strcat(swrite,",");
	sprintf(stemp,"%.5lf",q3);
	strcat(swrite,stemp);
	strcat(swrite,",");
	sprintf(stemp,"%.5lf",q4);
	strcat(swrite,stemp);
	strcat(swrite,"],");
	strcat(swrite,"@");
	SendMsg(swrite);

	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"\t[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,0]];");
	strcat(swrite,"@");
	SendMsg(swrite);

	//子程序头
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"PROC Path_10()\n");
	strcat(swrite,"@");
	SendMsg(swrite);

	//SingArea \Wrist，允许出现奇异时机器人轻微地修改其姿态。
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"\tSingArea \\Wrist;");
	strcat(swrite,"@");
	SendMsg(swrite);

	//ConfL \Off，关闭对机器人位形的监控
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"\tConfL \\Off;");
	strcat(swrite,"@");
	SendMsg(swrite);

	//运动指令
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"\tMoveL Target_1000,userspeed\\V:=");
	sprintf(stemp,"%.5lf",vel);
	strcat(swrite,stemp);
	strcat(swrite,",z100,Tool0\\WObj:=wobj0;\n");
	strcat(swrite,"@");
	SendMsg(swrite);

	//MovtionFinish
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"	MovtionFinish;");
	strcat(swrite,"@");
	SendMsg(swrite);

	//ERROR_MovtionFinish
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"ERROR");
	strcat(swrite,"@");
	SendMsg(swrite);

	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"	MovtionFinish;");
	strcat(swrite,"@");
	SendMsg(swrite);

	//子程序尾
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"ENDPROC");
	strcat(swrite,"@");
	SendMsg(swrite);

	//模块尾
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"ENDMODULE");
	strcat(swrite,"@");
	SendMsg(swrite);

	//发送文件尾
	strcpy(swrite,"#FileEnd@");
	SendMsg(swrite);

	//接受机器人的确认信息,发指令使机器人运动
	Sleep(500);
	recv(ClientSocket,recvbuf,100,0);
	if(strstr(recvbuf,"Receive Over!")!=NULL)
	SendMsg("#WorkStart@");

	//等待机器人运动完成信号
	char* ptr;
	while((ptr=strstr(recvbuf,"MotionFinish"))==NULL)
	{
		Sleep(100);
		recv(ClientSocket,recvbuf,100,0);
	}
}
void TcpIpCommInterface::MoveJointTo(double position[6], double vel)
{
	char swrite[100];
	char stemp[100];
	int FileCounter=0;
	char recvbuf[100];
	//发送程序文本
	//发送文件头
	strcpy(swrite,"#FileHead@");
	SendMsg(swrite);
	//模块头
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"MODULE movproc\n");
	strcat(swrite,"@");
	SendMsg(swrite);
	
	//目标点
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"\tCONST jointtarget Target_1000:=");
	strcat(swrite,"@");
	SendMsg(swrite);

	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"\t[[");
	sprintf(stemp,"%.5lf",position[0]);
	strcat(swrite,stemp);
	strcat(swrite,",");
	sprintf(stemp,"%.5lf",position[1]);
	strcat(swrite,stemp);
	strcat(swrite,",");
	sprintf(stemp,"%.5lf",position[2]);
	strcat(swrite,stemp);
	strcat(swrite,",");
	sprintf(stemp,"%.5lf",position[3]);
	strcat(swrite,stemp);
	strcat(swrite,",");
	sprintf(stemp,"%.5lf",position[4]);
	strcat(swrite,stemp);
	strcat(swrite,",");
	sprintf(stemp,"%.5lf",position[5]);
	strcat(swrite,stemp);
	strcat(swrite,"],");
	strcat(swrite,"@");
	SendMsg(swrite);

	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"\t[0,9E9,9E9,9E9,9E9,9E9]];");
	strcat(swrite,"@");
	SendMsg(swrite);
	//子程序头
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"PROC Path_10()\n");
	strcat(swrite,"@");
	SendMsg(swrite);
	//运动指令
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"\tMoveAbsj Target_1000,userspeed\\V:=");
	sprintf(stemp,"%.5lf",vel);
	strcat(swrite,stemp);
	strcat(swrite,",z100,Tool0\\WObj:=wobj0;\n");
	strcat(swrite,"@");
	SendMsg(swrite);
	//MovtionFinish
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"	MovtionFinish;");
	strcat(swrite,"@");
	SendMsg(swrite);

	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"ERROR");
	strcat(swrite,"@");
	SendMsg(swrite);

	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"	MovtionFinish;");
	strcat(swrite,"@");
	SendMsg(swrite);
	//子程序尾
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"ENDPROC");
	strcat(swrite,"@");
	SendMsg(swrite);
	//模块尾
	FileCounter++;
	strcpy(swrite,"#FileData ");
	itoa(FileCounter,stemp,10);
	strcat(swrite,stemp);
	strcat(swrite," ");
	strcat(swrite,"ENDMODULE");
	strcat(swrite,"@");
	SendMsg(swrite);
	//发送文件尾
	strcpy(swrite,"#FileEnd@");
	SendMsg(swrite);
	//接受机器人的确认信息,发指令使机器人运动
	Sleep(500);
	recv(ClientSocket,recvbuf,100,0);
	if(strstr(recvbuf,"Receive Over!")!=NULL)
		SendMsg("#WorkStart@");

	//等待机器人运动完成信号
	char* ptr;
	while((ptr=strstr(recvbuf,"MotionFinish"))==NULL)
	{
		Sleep(100);
		recv(ClientSocket,recvbuf,100,0);
	}
}
bool TcpIpCommInterface::GetCalibTool(double position[3], double euler[3])
{
	char recvbuf[100]="";
	char data[100]="";
	char recvtemp[100]="";
	char *ptr;
	int rc;
	bool IsGetCorrect=FALSE;

	while(!IsGetCorrect)
	{
		SendMsg("#GetCalibPar@");

		//PX
		Sleep(500);
		if(strlen(recvbuf)==0)
			rc=recv(ClientSocket,recvbuf,100,0);
		if(strstr(recvbuf,"PX ")==NULL)
		{
			IsGetCorrect=FALSE;
		}
		else
		{
			memcpy(data,recvbuf+3,strlen(recvbuf)-3);
			data[strlen(recvbuf)-3]=NULL;
			position[0]=atof(data);
			IsGetCorrect=TRUE;
			ptr=strstr(recvbuf,"*");
			memcpy(recvtemp,ptr+1,strlen(recvbuf));
			memcpy(recvbuf,recvtemp,100);
		}


		//PY
		if(strlen(recvbuf)==0)
			rc=recv(ClientSocket,recvbuf,100,0);
		if(strstr(recvbuf,"PY ")==NULL)
		{
			IsGetCorrect=FALSE;
		}
		else
		{
			memcpy(data,recvbuf+3,strlen(recvbuf)-3);
			data[strlen(recvbuf)-3]=NULL;
			position[1]=atof(data);
			IsGetCorrect=TRUE;
			ptr=strstr(recvbuf,"*");
			memcpy(recvtemp,ptr+1,strlen(recvbuf));
			memcpy(recvbuf,recvtemp,100);
		}
		//PZ
		if(strlen(recvbuf)==0)
			rc=recv(ClientSocket,recvbuf,100,0);
		if(strstr(recvbuf,"PZ ")==NULL)
		{
			IsGetCorrect=FALSE;
		}
		else
		{
			memcpy(data,recvbuf+3,strlen(recvbuf)-3);
			data[strlen(recvbuf)-3]=NULL;
			position[2]=atof(data);
			IsGetCorrect=TRUE;
			ptr=strstr(recvbuf,"*");
			memcpy(recvtemp,ptr+1,strlen(recvbuf));
			memcpy(recvbuf,recvtemp,100);
		}
		//EX
		if(strlen(recvbuf)==0)
			rc=recv(ClientSocket,recvbuf,100,0);
		if(strstr(recvbuf,"EX ")==NULL)
		{
			IsGetCorrect=FALSE;
		}
		else
		{
			memcpy(data,recvbuf+3,strlen(recvbuf)-3);
			data[strlen(recvbuf)-3]=NULL;
			//euler[0]=atof(data);
            euler[0]=atof(data)/180.0*pi;
			IsGetCorrect=TRUE;
			ptr=strstr(recvbuf,"*");
			memcpy(recvtemp,ptr+1,strlen(recvbuf));
			memcpy(recvbuf,recvtemp,100);
		}
		//EY
		if(strlen(recvbuf)==0)
			rc=recv(ClientSocket,recvbuf,100,0);
		if(strstr(recvbuf,"EY ")==NULL)
		{
			IsGetCorrect=FALSE;
		}
		else
		{
			memcpy(data,recvbuf+3,strlen(recvbuf)-3);
			data[strlen(recvbuf)-3]=NULL;
			euler[1]=atof(data)/180.0*pi;
			IsGetCorrect=TRUE;
			ptr=strstr(recvbuf,"*");
			memcpy(recvtemp,ptr+1,strlen(recvbuf));
			memcpy(recvbuf,recvtemp,100);
		}
		//EZ
		if(strlen(recvbuf)==0)
			rc=recv(ClientSocket,recvbuf,100,0);
		if(strstr(recvbuf,"EZ ")==NULL)
		{
			IsGetCorrect=FALSE;
		}
		else
		{
			memcpy(data,recvbuf+3,strlen(recvbuf)-3);
			data[strlen(recvbuf)-3]=NULL;
			euler[2]=atof(data)/180.0*pi;
			IsGetCorrect=TRUE;
			ptr=strstr(recvbuf,"*");
			memcpy(recvtemp,ptr+1,strlen(recvbuf));
			memcpy(recvbuf,recvtemp,100);
		}
	}

	if(rc==SOCKET_ERROR)
		return false;
	else
		return true;
}
bool TcpIpCommInterface::GetAng(double position[6])
{
	char recvbuf[100]="";
	char data[100]="";
	char recvtemp[100]="";
	char *ptr;
	int rc;
	bool IsGetCorrect=FALSE;

	while(!IsGetCorrect)
	{
		SendMsg("#GetAng@");
		Sleep(300);
		if(strlen(recvbuf)==0)
			rc=recv(ClientSocket,recvbuf,100,0);
        //A1
		if(NULL==strstr(recvbuf,"AA "))
		{
			IsGetCorrect=FALSE;
		}
		else
		{
			memcpy(data,recvbuf+3,strlen(recvbuf)-3);
			data[strlen(recvbuf)-3]=NULL;
			position[0]=atof(data);
			IsGetCorrect=TRUE;
			ptr=strstr(recvbuf,"*");
			memcpy(recvtemp,ptr+1,strlen(recvbuf));
			memcpy(recvbuf,recvtemp,100);
		}


		//A2
		if(NULL==strstr(recvbuf,"AB "))
		{
			IsGetCorrect=FALSE;
		}
		else
		{
			memcpy(data,recvbuf+3,strlen(recvbuf)-3);
			data[strlen(recvbuf)-3]=NULL;
			position[1]=atof(data);
			IsGetCorrect=TRUE;
			ptr=strstr(recvbuf,"*");
			memcpy(recvtemp,ptr+1,strlen(recvbuf));
			memcpy(recvbuf,recvtemp,100);
		}
		//A3
		if(NULL==strstr(recvbuf,"AC "))
		{
			IsGetCorrect=FALSE;
		}
		else
		{
			memcpy(data,recvbuf+3,strlen(recvbuf)-3);
			data[strlen(recvbuf)-3]=NULL;
			position[2]=atof(data);
			IsGetCorrect=TRUE;
			ptr=strstr(recvbuf,"*");
			memcpy(recvtemp,ptr+1,strlen(recvbuf));
			memcpy(recvbuf,recvtemp,100);
		}
		//A4
		if(NULL==strstr(recvbuf,"AD "))
		{
			IsGetCorrect=FALSE;
		}
		else
		{
			memcpy(data,recvbuf+3,strlen(recvbuf)-3);
			data[strlen(recvbuf)-3]=NULL;
			position[3]=atof(data);
			IsGetCorrect=TRUE;
			ptr=strstr(recvbuf,"*");
			memcpy(recvtemp,ptr+1,strlen(recvbuf));
			memcpy(recvbuf,recvtemp,100);
		}
		//A5
		if(NULL==strstr(recvbuf,"AE "))
		{
			IsGetCorrect=FALSE;
		}
		else
		{
			memcpy(data,recvbuf+3,strlen(recvbuf)-3);
			data[strlen(recvbuf)-3]=NULL;
			position[4]=atof(data);
			IsGetCorrect=TRUE;
			ptr=strstr(recvbuf,"*");
			memcpy(recvtemp,ptr+1,strlen(recvbuf));
			memcpy(recvbuf,recvtemp,100);
		}
		//A6
		if(NULL==strstr(recvbuf,"AF "))
		{
			IsGetCorrect=FALSE;
		}
		else
		{
			memcpy(data,recvbuf+3,strlen(recvbuf)-3);
			data[strlen(recvbuf)-3]=NULL;
			position[5]=atof(data);
			IsGetCorrect=TRUE;
			ptr=strstr(recvbuf,"*");
			memcpy(recvtemp,ptr+1,strlen(recvbuf));
			memcpy(recvbuf,recvtemp,100);
		}
	}
	if(rc==SOCKET_ERROR)
		return false;
	else
		return true;
}
bool TcpIpCommInterface::Disconnect()
{
	if(closesocket(ClientSocket)==0)
	{
		
			return TRUE;
	}
	else
		return FALSE;
}
void TcpIpCommInterface::WriteMod()
{
	//读取数据
	int i=0;
	double pos[1000][3]={0};
	double ori[1000][4]={0};
	double  A1,A2,A3,D1,D2,D3,D4;

	CString FilePath;
	GetModuleFileNameA(NULL, FilePath.GetBuffer(MAX_PATH), MAX_PATH);
	FilePath.ReleaseBuffer();
	FilePath = FilePath.Left(FilePath.ReverseFind('\\'));
	FilePath += "\\config\\robot.txt";
	FILE *fp;
    fp=fopen(FilePath,"r+");
	/*if (fp!=NULL)
	{
		fscanf(fp,"%lf %lf %lf %lf %lf %lf %lf\n",&(pos[i][0]),&(pos[i][1]),&(pos[i][2]),&(ori[i][0]),&(ori[i][1]),&(ori[i][2]),&(ori[i][3]));
		i++;
		fscanf(fp,"%lf %lf %lf %lf %lf %lf %lf\n",&(pos[i][0]),&(pos[i][1]),&(pos[i][2]),&(ori[i][0]),&(ori[i][1]),&(ori[i][2]),&(ori[i][3]));
	}*/
	while (fscanf(fp,"%lf %lf %lf %lf %lf %lf %lf\n",&(pos[i][0]),&(pos[i][1]),&(pos[i][2]),&(ori[i][0]),&(ori[i][1]),&(ori[i][2]),&(ori[i][3]))!= EOF)
	{
		//fscanf(fp,"%lf %lf %lf %lf %lf %lf %lf\n",&(pos[i][0]),&(pos[i][1]),&(pos[i][2]),&(ori[i][0]),&(ori[i][1]),&(ori[i][2]),&(ori[i][3]));
		i++;
	}
	int pointCount=i;
	 fclose(fp);
	 //发送数据
	 char swrite[100];
	 char stemp[100];
	 int FileCounter=0;
	 char recvbuf[100];
	 //发送程序文本
	 //发送文件头
	 strcpy(swrite,"#FileHead@");
	 SendMsg(swrite);
	 //模块头
	 FileCounter++;
	 strcpy(swrite,"#FileData ");
	 itoa(FileCounter,stemp,10);
	 strcat(swrite,stemp);
	 strcat(swrite," ");
	 strcat(swrite,"MODULE movproc\r\nCONST num length:= ");
	 itoa(pointCount,stemp,10);
	 strcat(swrite,stemp);
	 strcat(swrite," ;\n");
	 strcat(swrite,"@");
	 SendMsg(swrite);
	 //目标点
	 FileCounter++;
	 strcpy(swrite,"#FileData ");
	 itoa(FileCounter,stemp,10);
	 strcat(swrite,stemp);
	 strcat(swrite," ");
	 strcat(swrite,"\tCONST robtarget array{length}:=[");
	 strcat(swrite,"@");
	 SendMsg(swrite);

	 for(int j = 0; j < pointCount; j++)
	 {
		 string pathpoint;
		 if (j == pointCount - 1)
		 {
			 FileCounter++;
			 strcpy(swrite,"#FileData ");
			 itoa(FileCounter,stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite," ");
			 strcat(swrite,"[[");
			 //pos
			 sprintf(stemp,"%.4lf",pos[j][0]);
			 strcat(swrite,stemp);
			 strcat(swrite,",");
			 sprintf(stemp,"%.4lf",pos[j][1]);
			// itoa(pos[j][1],stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite,",");
			 sprintf(stemp,"%.4lf",pos[j][2]);
			// itoa(pos[j][2],stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite,"],[");
			 // ori
			 sprintf(stemp,"%.4lf",ori[j][0]);
			// itoa(ori[j][0],stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite,",");
			 sprintf(stemp,"%.4lf",ori[j][1]);
			 //itoa(ori[j][1],stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite,",");
			 sprintf(stemp,"%.4lf",ori[j][2]);
			// itoa(ori[j][2],stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite,",");
			 sprintf(stemp,"%.4lf",ori[j][3]);
			 //itoa(ori[j][3],stemp,10);
			 strcat(swrite,stemp);
			  strcat(swrite,"],");
			 strcat(swrite,"@");
			 SendMsg(swrite);

			 FileCounter++;
			 strcpy(swrite,"#FileData ");
			 itoa(FileCounter,stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite," ");
			 strcat(swrite,"[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]]];");
			 strcat(swrite,"@");
			 SendMsg(swrite);
		 }
		 else
		 {
			 FileCounter++;
			 strcpy(swrite,"#FileData ");
			 itoa(FileCounter,stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite," ");
			 strcat(swrite,"[[");
			 //pos
			 sprintf(stemp,"%.4lf",pos[j][0]);
			 strcat(swrite,stemp);
			 strcat(swrite,",");
			 sprintf(stemp,"%.4lf",pos[j][1]);
			 // itoa(pos[j][1],stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite,",");
			 sprintf(stemp,"%.4lf",pos[j][2]);
			 // itoa(pos[j][2],stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite,"],[");
			 // ori
			 sprintf(stemp,"%.4lf",ori[j][0]);
			 // itoa(ori[j][0],stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite,",");
			 sprintf(stemp,"%.4lf",ori[j][1]);
			 //itoa(ori[j][1],stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite,",");
			 sprintf(stemp,"%.4lf",ori[j][2]);
			 // itoa(ori[j][2],stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite,",");
			 sprintf(stemp,"%.4lf",ori[j][3]);
			 //itoa(ori[j][3],stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite,"],");
			 strcat(swrite,"@");
			 SendMsg(swrite);

			 FileCounter++;
			 strcpy(swrite,"#FileData ");
			 itoa(FileCounter,stemp,10);
			 strcat(swrite,stemp);
			 strcat(swrite," ");
			 strcat(swrite,"[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],");
			 strcat(swrite,"@");
			 SendMsg(swrite);
		 }
	 }

	 //模块尾
	 FileCounter++;
	 strcpy(swrite,"#FileData ");
	 itoa(FileCounter,stemp,10);
	 strcat(swrite,stemp);
	 strcat(swrite," ");
	 strcat(swrite,"ENDMODULE");
	 strcat(swrite,"@");
	 SendMsg(swrite);
	 //发送文件尾
	 strcpy(swrite,"#FileEnd@");
	 SendMsg(swrite);

	 Sleep(500);
	 recv(ClientSocket,recvbuf,100,0);
	 if(strstr(recvbuf,"Receive Over!")!=NULL)
		 SendMsg("#WorkStart@");
}