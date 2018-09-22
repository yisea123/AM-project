// shiyanDlg.h : 头文件
//

#pragma once
#include "TcpIpCommInterface.h"
#include "afxwin.h"

// CshiyanDlg 对话框
class CshiyanDlg : public CDialog
{
// 构造
public:
	CshiyanDlg(CWnd* pParent = NULL);	// 标准构造函数

// 对话框数据
	enum { IDD = IDD_SHIYAN_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV 支持
public:
	TcpIpCommInterface m_abb;
	bool status;
	void movejointto(double position[6]);
	CWinThread *pTriggerThread;


// 实现
protected:
	HICON m_hIcon;

	// 生成的消息映射函数
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
