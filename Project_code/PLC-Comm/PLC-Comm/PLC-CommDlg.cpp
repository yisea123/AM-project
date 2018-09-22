
// PLC-CommDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "PLC-Comm.h"
#include "PLC-CommDlg.h"
#include "afxdialogex.h"
//#include "modbuscommsettings.h"
#include "PLCSetting.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// ����Ӧ�ó��򡰹��ڡ��˵���� CAboutDlg �Ի���

class CAboutDlg : public CDialogEx
{
public:
	CAboutDlg();

// �Ի�������
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

// ʵ��
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialogEx(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialogEx)
END_MESSAGE_MAP()


// CPLCCommDlg �Ի���




CPLCCommDlg::CPLCCommDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(CPLCCommDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CPLCCommDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CPLCCommDlg, CDialogEx)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_initConnect, &CPLCCommDlg::OnBnClickedinitconnect)
	ON_BN_CLICKED(IDC_setVoltage, &CPLCCommDlg::OnBnClickedsetvoltage)
	ON_BN_CLICKED(IDC_closePLC, &CPLCCommDlg::OnBnClickedcloseplc)
	ON_BN_CLICKED(IDC_openCH1, &CPLCCommDlg::OnBnClickedopench1)
	ON_BN_CLICKED(IDC_openCH2, &CPLCCommDlg::OnBnClickedopench2)
	ON_BN_CLICKED(IDC_openCH3, &CPLCCommDlg::OnBnClickedopench3)
	ON_BN_CLICKED(IDC_openCH4, &CPLCCommDlg::OnBnClickedopench4)
	ON_BN_CLICKED(IDC_closeCH1, &CPLCCommDlg::OnBnClickedclosech1)
	//ON_BN_CLICKED(IDC_BUTTON6, &CPLCCommDlg::OnBnClickedButton6)
	ON_BN_CLICKED(IDC_closeCH2, &CPLCCommDlg::OnBnClickedclosech2)
	ON_BN_CLICKED(IDC_closeCH3, &CPLCCommDlg::OnBnClickedclosech3)
	ON_BN_CLICKED(IDC_closeCH4, &CPLCCommDlg::OnBnClickedclosech4)
	ON_BN_CLICKED(IDC_setVoltage2, &CPLCCommDlg::OnBnClickedsetvoltage2)
	ON_BN_CLICKED(IDC_setCurent1, &CPLCCommDlg::OnBnClickedsetcurent1)
	ON_BN_CLICKED(IDC_setCurent2, &CPLCCommDlg::OnBnClickedsetcurent2)
	ON_BN_CLICKED(IDC_openOutput1, &CPLCCommDlg::OnBnClickedopenoutput1)
	ON_BN_CLICKED(IDC_openOutput2, &CPLCCommDlg::OnBnClickedopenoutput2)
	ON_BN_CLICKED(IDC_openOutput3, &CPLCCommDlg::OnBnClickedopenoutput3)
	ON_BN_CLICKED(IDC_openOutput4, &CPLCCommDlg::OnBnClickedopenoutput4)
	ON_BN_CLICKED(IDC_openOutput5, &CPLCCommDlg::OnBnClickedopenoutput5)
	ON_BN_CLICKED(IDC_openOutput6, &CPLCCommDlg::OnBnClickedopenoutput6)
	ON_BN_CLICKED(IDC_openOutput7, &CPLCCommDlg::OnBnClickedopenoutput7)
	ON_BN_CLICKED(IDC_openOutput8, &CPLCCommDlg::OnBnClickedopenoutput8)
	ON_BN_CLICKED(IDC_closeOutput1, &CPLCCommDlg::OnBnClickedcloseoutput1)
	ON_BN_CLICKED(IDC_closeOutput2, &CPLCCommDlg::OnBnClickedcloseoutput2)
	ON_BN_CLICKED(IDC_closeOutput3, &CPLCCommDlg::OnBnClickedcloseoutput3)
	ON_BN_CLICKED(IDC_closeOutput4, &CPLCCommDlg::OnBnClickedcloseoutput4)
	ON_BN_CLICKED(IDC_closeOutput5, &CPLCCommDlg::OnBnClickedcloseoutput5)
	ON_BN_CLICKED(IDC_closeOutput6, &CPLCCommDlg::OnBnClickedcloseoutput6)
	ON_BN_CLICKED(IDC_closeOutput7, &CPLCCommDlg::OnBnClickedcloseoutput7)
	ON_BN_CLICKED(IDC_closeOutput8, &CPLCCommDlg::OnBnClickedcloseoutput8)
	ON_BN_CLICKED(IDC_WriteData, &CPLCCommDlg::OnBnClickedWritedata)
END_MESSAGE_MAP()


// CPLCCommDlg ��Ϣ�������

BOOL CPLCCommDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// ��������...���˵�����ӵ�ϵͳ�˵��С�

	// IDM_ABOUTBOX ������ϵͳ���Χ�ڡ�
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		BOOL bNameValid;
		CString strAboutMenu;
		bNameValid = strAboutMenu.LoadString(IDS_ABOUTBOX);
		ASSERT(bNameValid);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// ���ô˶Ի����ͼ�ꡣ��Ӧ�ó��������ڲ��ǶԻ���ʱ����ܽ��Զ�
	//  ִ�д˲���
	SetIcon(m_hIcon, TRUE);			// ���ô�ͼ��
	SetIcon(m_hIcon, FALSE);		// ����Сͼ��

	// TODO: �ڴ���Ӷ���ĳ�ʼ������

	return TRUE;  // ���ǽ��������õ��ؼ������򷵻� TRUE
}

void CPLCCommDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialogEx::OnSysCommand(nID, lParam);
	}
}

// �����Ի��������С����ť������Ҫ����Ĵ���
//  �����Ƹ�ͼ�ꡣ����ʹ���ĵ�/��ͼģ�͵� MFC Ӧ�ó���
//  �⽫�ɿ���Զ���ɡ�

void CPLCCommDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // ���ڻ��Ƶ��豸������

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// ʹͼ���ڹ����������о���
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// ����ͼ��
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialogEx::OnPaint();
	}
}

//���û��϶���С������ʱϵͳ���ô˺���ȡ�ù��
//��ʾ��
HCURSOR CPLCCommDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}



void CPLCCommDlg::OnBnClickedinitconnect()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	CString FilePath;
	GetModuleFileNameW(NULL,FilePath.GetBuffer(MAX_PATH), MAX_PATH);
	FilePath.ReleaseBuffer();
	FilePath = FilePath.Left(FilePath.ReverseFind('\\'));
	FilePath += "\\Config\\FeedingSettings.ini";
	std::wstring ss = (LPCTSTR)FilePath;  
	QString filename = QString::fromStdWString(ss); 
	m_modbusCommSettings=new ModbusCommSettings(filename,QSettings::IniFormat);
	m_plcSetting=new PLCSetting(m_modbusCommSettings);
	if (m_plcSetting->IsConnect()==false)
	{
		m_plcSetting->modbusConnectRTU();
	}
	m_plcSetting->plcStart();

}


void CPLCCommDlg::OnBnClickedsetvoltage()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
   // int ret=modbus_write_bit(m_modbus,setVoltageValue,1);
	CString str;
	double value;
	GetDlgItem(IDC_Value)->GetWindowText(str);
	value=_ttof(str);
	value=value*16;
	m_plcSetting->setVoltage(1,value);
}


void CPLCCommDlg::OnBnClickedcloseplc()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->closePLC();
}


void CPLCCommDlg::OnBnClickedopench1()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->openChanel(1);
}


void CPLCCommDlg::OnBnClickedopench2()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->openChanel(2);

}


void CPLCCommDlg::OnBnClickedopench3()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
		m_plcSetting->openChanel(3);

}


void CPLCCommDlg::OnBnClickedopench4()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->openChanel(4);

}


void CPLCCommDlg::OnBnClickedclosech1()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->closeChanel(1);
}


void CPLCCommDlg::OnBnClickedButton6()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������

}


void CPLCCommDlg::OnBnClickedclosech2()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->closeChanel(2);
}


void CPLCCommDlg::OnBnClickedclosech3()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->closeChanel(3);
}


void CPLCCommDlg::OnBnClickedclosech4()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->closeChanel(4);
}


void CPLCCommDlg::OnBnClickedsetvoltage2()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	CString str;
	double value;
	GetDlgItem(IDC_Value)->GetWindowText(str);
	value=_ttof(str);
	value=value*16;
	m_plcSetting->setVoltage(2,value);
}


void CPLCCommDlg::OnBnClickedsetcurent1()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	CString str;
	double value;
	GetDlgItem(IDC_Value)->GetWindowText(str);
	value=_ttof(str);
	value=value*8;
	m_plcSetting->setVoltage(3,value);
}


void CPLCCommDlg::OnBnClickedsetcurent2()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	CString str;
	double value;
	GetDlgItem(IDC_Value)->GetWindowText(str);
	value=_ttof(str);
	value=value*8;
	m_plcSetting->setVoltage(4,value);
}


void CPLCCommDlg::OnBnClickedopenoutput1()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->openOutpot(0);
}


void CPLCCommDlg::OnBnClickedopenoutput2()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->openOutpot(1);
}


void CPLCCommDlg::OnBnClickedopenoutput3()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->openOutpot(2);
}


void CPLCCommDlg::OnBnClickedopenoutput4()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->openOutpot(3);
}


void CPLCCommDlg::OnBnClickedopenoutput5()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->openOutpot(4);
}


void CPLCCommDlg::OnBnClickedopenoutput6()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->openOutpot(5);
}


void CPLCCommDlg::OnBnClickedopenoutput7()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->openOutpot(6);
}


void CPLCCommDlg::OnBnClickedopenoutput8()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->openOutpot(7);
}


void CPLCCommDlg::OnBnClickedcloseoutput1()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->closeOutpot(0);
}


void CPLCCommDlg::OnBnClickedcloseoutput2()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->closeOutpot(1);
}


void CPLCCommDlg::OnBnClickedcloseoutput3()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->closeOutpot(2);
}


void CPLCCommDlg::OnBnClickedcloseoutput4()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->closeOutpot(3);
}


void CPLCCommDlg::OnBnClickedcloseoutput5()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->closeOutpot(4);
}


void CPLCCommDlg::OnBnClickedcloseoutput6()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->closeOutpot(5);
}


void CPLCCommDlg::OnBnClickedcloseoutput7()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->closeOutpot(6);
}


void CPLCCommDlg::OnBnClickedcloseoutput8()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_plcSetting->closeOutpot(7);
}


void CPLCCommDlg::OnBnClickedWritedata()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	//m_abb.WriteMod();
}
