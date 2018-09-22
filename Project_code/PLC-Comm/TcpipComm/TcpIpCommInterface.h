#pragma once
#include <Winsock2.h>
#include <ASSERT.H>
#include <algorithm>
#include "TcpipComm.h"
class TcpIpCommInterface:public CTcpipComm
{
public:
	TcpIpCommInterface(void);
	~TcpIpCommInterface(void);
public:
	bool Init(void);
	void SendMsg( char* command);
	//void Send(SOCKET socket,const char*buffer,int length);
	void Receive();
	void Send();
	
public:
	SOCKET ClientSocket;
	//static char recvtemp[100];
	//	CWinThread *pTriggerThread;
	//bool WillTriggerThreadEnd;

public:
	HANDLE hRecvThreadHandle;
	WSAEVENT g_socket;
};

