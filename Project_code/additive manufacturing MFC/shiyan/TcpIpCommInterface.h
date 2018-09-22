#pragma once
#include <Winsock2.h>
#include <ASSERT.H>
#include <algorithm>

class TcpIpCommInterface
{
public:
	bool Connect(void);//连接ABB机器人
	bool Disconnect(void);//断开ABB机器人
	void MoveToolTo(double position[3], double euler[3],double vel);//ABB机器人工具坐标以指定速度运动到期望位置和姿态
	void MoveJointTo(double position[6], double vel);//ABB机器人各个关节以指定速度运动到指定角度
	bool GetCalibTool(double position[3], double euler[3]);//返回ABB机器人工具坐标系位置和姿态；
	bool GetAng(double position[6]);//返回ABB机器人各个关节角度
	void SendMsg(char* command);//向ABB机器人发送命令字符串
	void WriteMod();
public:
	TcpIpCommInterface(void);
	~TcpIpCommInterface(void);
public:
	double position[6];
protected:
	SOCKET ClientSocket;//客户端套接字
};
