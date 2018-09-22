// TcpipComm.cpp : ���� DLL Ӧ�ó���ĵ���������
//

#include "stdafx.h"
#include "TcpipComm.h"
#include "TcpIpCommInterface.h"

// ���ǵ���������һ��ʾ��
TCPIPCOMM_API int nTcpipComm=0;

// ���ǵ���������һ��ʾ����
TCPIPCOMM_API int fnTcpipComm(void)
{
	return 42;
}

// �����ѵ�����Ĺ��캯����
// �й��ඨ�����Ϣ������� TcpipComm.h
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