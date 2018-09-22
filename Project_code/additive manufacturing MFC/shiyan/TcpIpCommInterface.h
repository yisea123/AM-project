#pragma once
#include <Winsock2.h>
#include <ASSERT.H>
#include <algorithm>

class TcpIpCommInterface
{
public:
	bool Connect(void);//����ABB������
	bool Disconnect(void);//�Ͽ�ABB������
	void MoveToolTo(double position[3], double euler[3],double vel);//ABB�����˹���������ָ���ٶ��˶�������λ�ú���̬
	void MoveJointTo(double position[6], double vel);//ABB�����˸����ؽ���ָ���ٶ��˶���ָ���Ƕ�
	bool GetCalibTool(double position[3], double euler[3]);//����ABB�����˹�������ϵλ�ú���̬��
	bool GetAng(double position[6]);//����ABB�����˸����ؽڽǶ�
	void SendMsg(char* command);//��ABB�����˷��������ַ���
	void WriteMod();
public:
	TcpIpCommInterface(void);
	~TcpIpCommInterface(void);
public:
	double position[6];
protected:
	SOCKET ClientSocket;//�ͻ����׽���
};
