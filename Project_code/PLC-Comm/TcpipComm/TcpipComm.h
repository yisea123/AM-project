// 下列 ifdef 块是创建使从 DLL 导出更简单的
// 宏的标准方法。此 DLL 中的所有文件都是用命令行上定义的 TCPIPCOMM_EXPORTS
// 符号编译的。在使用此 DLL 的
// 任何其他项目上不应定义此符号。这样，源文件中包含此文件的任何其他项目都会将
// TCPIPCOMM_API 函数视为是从 DLL 导入的，而此 DLL 则将用此宏定义的
// 符号视为是被导出的。
#pragma once
#ifdef TCPIPCOMM_EXPORTS
#define TCPIPCOMM_API __declspec(dllexport)
#else
#define TCPIPCOMM_API __declspec(dllimport)
#endif

// 此类是从 TcpipComm.dll 导出的
class TCPIPCOMM_API CTcpipComm {
public:
	CTcpipComm(void);
	// TODO: 在此添加您的方法。
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
	//HANDLE m_loadingEvent;//接受信息完毕事件
	//HANDLE m_ADDTaskEvent;
	//HANDLE m_unloadFinish;
	HANDLE m_hEvent[3]; 
	int m_TaskID;
};

extern TCPIPCOMM_API int nTcpipComm;

TCPIPCOMM_API int fnTcpipComm(void);
