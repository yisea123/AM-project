// ���� ifdef ���Ǵ���ʹ�� DLL �������򵥵�
// ��ı�׼�������� DLL �е������ļ��������������϶���� TCPIPCOMM_EXPORTS
// ���ű���ġ���ʹ�ô� DLL ��
// �κ�������Ŀ�ϲ�Ӧ����˷��š�������Դ�ļ��а������ļ����κ�������Ŀ���Ὣ
// TCPIPCOMM_API ������Ϊ�Ǵ� DLL ����ģ����� DLL ���ô˺궨���
// ������Ϊ�Ǳ������ġ�
#pragma once
#ifdef TCPIPCOMM_EXPORTS
#define TCPIPCOMM_API __declspec(dllexport)
#else
#define TCPIPCOMM_API __declspec(dllimport)
#endif

// �����Ǵ� TcpipComm.dll ������
class TCPIPCOMM_API CTcpipComm {
public:
	CTcpipComm(void);
	// TODO: �ڴ�������ķ�����
public:
	static CTcpipComm* Instance();
	static void Release();
public:
	virtual bool Init(void)=0;
	virtual void SendMsg( char* command)=0;
	//virtual void Send(SOCKET socket,const char*buffer,int length);
	virtual void Receive(void)=0;
	virtual void Send(void)=0;
	int temp;
	//HANDLE m_loadingEvent;//������Ϣ����¼�
	//HANDLE m_ADDTaskEvent;
	//HANDLE m_unloadFinish;
	HANDLE m_hEvent[3]; 
	int m_TaskID;
};

extern TCPIPCOMM_API int nTcpipComm;

TCPIPCOMM_API int fnTcpipComm(void);
