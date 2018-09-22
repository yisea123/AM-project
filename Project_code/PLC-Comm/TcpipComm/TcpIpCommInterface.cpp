#include "StdAfx.h"
#include "TcpIpCommInterface.h"
#include "stdio.h"
#include <atlstr.h>
#include "math.h"
#include "stdlib.h"
#include <process.h>
TcpIpCommInterface::TcpIpCommInterface(void)
{
}


TcpIpCommInterface::~TcpIpCommInterface(void)
{
}
unsigned APIENTRY AGVCaptureThread(LPVOID pParam)
{
	TcpIpCommInterface* pDlg=(TcpIpCommInterface*)pParam;
	while(TRUE)
	{	
		WaitForSingleObject(pDlg->g_socket,INFINITE);
		pDlg->Receive();
		WSAResetEvent(pDlg->g_socket);
		Sleep(100);
	}
	_endthreadex(0);
	return 0;

}
bool TcpIpCommInterface::Init(void)
{
	unsigned int dwDummy;
	WSAData wsadata;
	WORD wVersionRequested;
	wVersionRequested=MAKEWORD(2,2);
	/*m_loadingEvent=CreateEvent(NULL,TRUE,FALSE,NULL);
	m_ADDTaskEvent=CreateEvent(NULL,TRUE,FALSE,NULL);
	m_unloadFinish=CreateEvent(NULL,TRUE,FALSE,NULL);*/
	m_hEvent[0]=CreateEvent(NULL, TRUE, FALSE, NULL);	
	m_hEvent[1]=CreateEvent(NULL, TRUE, FALSE, NULL);
	m_hEvent[2]=CreateEvent(NULL, TRUE, FALSE, NULL);
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
	ClientSocket=socket(AF_INET,SOCK_STREAM,0 );
	//addr.sin_addr.S_un.S_addr=inet_addr("101.6.58.194");
	addr.sin_addr.S_un.S_addr=inet_addr("192.168.7.226");

	addr.sin_family=AF_INET;
	addr.sin_port=htons(20006);
	int rc;
	rc=connect(ClientSocket,(SOCKADDR*)&addr,sizeof(addr));
	if (rc==0)
	{
		hRecvThreadHandle = (HANDLE)_beginthreadex(
			0, // No security
			0, // stack size same as caller
			AGVCaptureThread, // Thread proc
			this, // No data to pass (we use global variables)
			0, // Create flags
			&dwDummy);

		if (!hRecvThreadHandle)
		{
			MessageBoxA(NULL,"Failed to run data receiver Thread!","Error",MB_ICONERROR|MB_SYSTEMMODAL|MB_SETFOREGROUND);
			return false;
		}
		g_socket=WSACreateEvent();
		if (g_socket == WSA_INVALID_EVENT)
		{
			MessageBoxA(NULL,"Failed to create event!","Error",MB_ICONERROR|MB_SYSTEMMODAL|MB_SETFOREGROUND);
		}

		WSAEventSelect(ClientSocket,g_socket,FD_READ);
		return true;
	} 
	else
	{
		return false;
		MessageBoxA(NULL,"false","text",MB_OKCANCEL);
	}
}
void TcpIpCommInterface::SendMsg( char* command)
{
	int length = strlen(command); 

	send(ClientSocket, command, length,0);
}
void TcpIpCommInterface::Receive(void)
{
	char data[100]="";
	char revbuf[100]="";
	CString str;
	CString strtemp;
	CString ID;
	int length= recv(ClientSocket,revbuf,100,0);
	str.Format("%s",revbuf);
	//MessageBoxA(NULL,str,"caption",MB_OK);
	int end=str.Find("#");
	int start=str.Find("$");
	str=str.Left(end);
	str=str.Right(end-start-1);
	start=str.Find(":");
	ID=str.Right(end-start-2);
	strtemp=str.Left(start);
	//MessageBoxA(NULL,strtemp,"caption",MB_OK);

	if (strtemp.Compare("addTask")==0)
	{
		str=str.Right(1);
		//MessageBoxA(NULL,str,"caption",MB_OK);
		m_TaskID=atoi(ID);
		SetEvent(m_hEvent[0]);
	}
	if (strtemp=="updateTask")
	{
		str=str.Right(1);
		//MessageBoxA(NULL,str,"caption",MB_OK);
	}
	if (strtemp=="cancelTask")
	{
		str=str.Right(1);
		//MessageBoxA(NULL,str,"caption",MB_OK);

	}
	//装货完成后根据任务号查询当前任务的车辆ID，并将车辆运动置true，开始下一阶段运动
	if (strtemp.Compare("loadFinish")==0)
	{
		str=str.Right(1);
		m_TaskID=atoi(ID);
		SetEvent(m_hEvent[1]);
	}
	if (strtemp.Compare("unloadFinish")==0)
	{
		str=str.Right(1);
		m_TaskID=atoi(ID);
		SetEvent(m_hEvent[2]);
	}

}
void TcpIpCommInterface::Send()
{
	int temp=1;
	if (temp<=8)
	{
		switch (temp)
		{
		case 1:
			SendMsg("$loadWaiting:1#\n");
			break;
		case 2:
			SendMsg("$loadStart:1#\n");
			break;
		case 3:
			SendMsg("$loadWaiting:1#\n");
			break;
		case 4:
			SendMsg("$unloadStart:1#\n");
			break;
		case 5:
			SendMsg("$failTask:1#\n");
			break;
		case 6:
			SendMsg("$finishTask:1#\n");
			break;
		case 7:
			SendMsg("$agvCharge:1#\n");
			break;
		case 8:
			SendMsg("$agvOffline:1#\n");
			break;
		}
	}
	Sleep(100);
}