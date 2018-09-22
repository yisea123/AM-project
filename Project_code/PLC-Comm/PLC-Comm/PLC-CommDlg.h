
// PLC-CommDlg.h : ͷ�ļ�
//

#pragma once
#include "modbuscommsettings.h"
#include "PLCSetting.h"
#include "plcControlpanel.h"
//#include "TcpIpCommInterface.h"
// CPLCCommDlg �Ի���
class CPLCCommDlg : public CDialogEx
{
// ����
public:
	CPLCCommDlg(CWnd* pParent = NULL);	// ��׼���캯��

// �Ի�������
	enum { IDD = IDD_PLCCOMM_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV ֧��


// ʵ��
protected:
	HICON m_hIcon;

	// ���ɵ���Ϣӳ�亯��
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	ModbusCommSettings * m_modbusCommSettings;
	PLCSetting *m_plcSetting;
	plcControlpanel *m_plcControlPanel;
	modbus_t *m_modbus;
	//TcpIpCommInterface m_abb;
	afx_msg void OnBnClickedinitconnect();
	afx_msg void OnBnClickedsetvoltage();
	afx_msg void OnBnClickedcloseplc();
	afx_msg void OnBnClickedopench1();
	afx_msg void OnBnClickedopench2();
	afx_msg void OnBnClickedopench3();
	afx_msg void OnBnClickedopench4();
	afx_msg void OnBnClickedclosech1();
	afx_msg void OnBnClickedButton6();
	afx_msg void OnBnClickedclosech2();
	afx_msg void OnBnClickedclosech3();
	afx_msg void OnBnClickedclosech4();
	afx_msg void OnBnClickedsetvoltage2();
	afx_msg void OnBnClickedsetcurent1();
	afx_msg void OnBnClickedsetcurent2();
	afx_msg void OnBnClickedopenoutput1();
	afx_msg void OnBnClickedopenoutput2();
	afx_msg void OnBnClickedopenoutput3();
	afx_msg void OnBnClickedopenoutput4();
	afx_msg void OnBnClickedopenoutput5();
	afx_msg void OnBnClickedopenoutput6();
	afx_msg void OnBnClickedopenoutput7();
	afx_msg void OnBnClickedopenoutput8();
	afx_msg void OnBnClickedcloseoutput1();
	afx_msg void OnBnClickedcloseoutput2();
	afx_msg void OnBnClickedcloseoutput3();
	afx_msg void OnBnClickedcloseoutput4();
	afx_msg void OnBnClickedcloseoutput5();
	afx_msg void OnBnClickedcloseoutput6();
	afx_msg void OnBnClickedcloseoutput7();
	afx_msg void OnBnClickedcloseoutput8();
	afx_msg void OnBnClickedWritedata();
};
