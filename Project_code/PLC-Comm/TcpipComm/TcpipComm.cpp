// TcpipComm.cpp : 定义 DLL 应用程序的导出函数。
//

#include "stdafx.h"
#include "TcpipComm.h"
#include "TcpIpCommInterface.h"

// 这是导出变量的一个示例
TCPIPCOMM_API int nTcpipComm=0;

// 这是导出函数的一个示例。
TCPIPCOMM_API int fnTcpipComm(void)
{
	return 42;
}

// 这是已导出类的构造函数。
// 有关类定义的信息，请参阅 TcpipComm.h
CTcpipComm::CTcpipComm()
{
	return;
}
static CTcpipComm* _instance = NULL;
void CTcpipComm::Release()
{
	if(_instance)
	{
		delete _instance;
		_instance=NULL;
	}
}
CTcpipComm* CTcpipComm::Instance()
{
	if( _instance == NULL )
	{
		_instance = new TcpIpCommInterface();
	}
	return _instance;
}