// shiyanDlg.h : ͷ�ļ�
//

#pragma once
#include "TcpIpCommInterface.h"
#include "afxwin.h"

// CshiyanDlg �Ի���
class CshiyanDlg : public CDialog
{
// ����
public:
	CshiyanDlg(CWnd* pParent = NULL);	// ��׼���캯��

// �Ի�������
	enum { IDD = IDD_SHIYAN_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV ֧��
public:
	TcpIpCommInterface m_abb;
	bool status;
	void movejointto(double position[6]);
	CWinThread *pTriggerThread;


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
	afx_msg void OnBnClickedButton1();
public:
	afx_msg void OnBnClickedButton2();
public:
	afx_msg void OnBnClickedButton3();
public:
	afx_msg void OnBnClickedButton4();
public:
	afx_msg void OnBnClickedButton5();
public:
	afx_msg void OnBnClickedButton6();
	afx_msg void OnBnClickedButton7();

	afx_msg void OnBnClickedButton8();
	afx_msg void OnBnClickedWritemod();
};
