// shiyanDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "shiyan.h"
#include "shiyanDlg.h"
#include "TcpIpCommInterface.h"
#include<string>

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// 用于应用程序“关于”菜单项的 CAboutDlg 对话框

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// 对话框数据
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

// 实现
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
END_MESSAGE_MAP()


// CshiyanDlg 对话框




CshiyanDlg::CshiyanDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CshiyanDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CshiyanDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	
}

BEGIN_MESSAGE_MAP(CshiyanDlg, CDialog)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//}}AFX_MSG_MAP
	ON_BN_CLICKED(IDC_BUTTON1, &CshiyanDlg::OnBnClickedButton1)
	ON_BN_CLICKED(IDC_BUTTON2, &CshiyanDlg::OnBnClickedButton2)
	ON_BN_CLICKED(IDC_BUTTON3, &CshiyanDlg::OnBnClickedButton3)
	ON_BN_CLICKED(IDC_BUTTON4, &CshiyanDlg::OnBnClickedButton4)
	ON_BN_CLICKED(IDC_BUTTON5, &CshiyanDlg::OnBnClickedButton5)
	ON_BN_CLICKED(IDC_BUTTON6, &CshiyanDlg::OnBnClickedButton6)
	ON_BN_CLICKED(IDC_BUTTON7, &CshiyanDlg::OnBnClickedButton7)
	ON_BN_CLICKED(IDC_BUTTON8, &CshiyanDlg::OnBnClickedButton8)
	ON_BN_CLICKED(IDC_WriteMod, &CshiyanDlg::OnBnClickedWritemod)
END_MESSAGE_MAP()


// CshiyanDlg 消息处理程序

BOOL CshiyanDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// 将“关于...”菜单项添加到系统菜单中。

	// IDM_ABOUTBOX 必须在系统命令范围内。
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// 设置此对话框的图标。当应用程序主窗口不是对话框时，框架将自动
	//  执行此操作
	SetIcon(m_hIcon, TRUE);			// 设置大图标
	SetIcon(m_hIcon, FALSE);		// 设置小图标

	// TODO: 在此添加额外的初始化代码

	return TRUE;  // 除非将焦点设置到控件，否则返回 TRUE
}

void CshiyanDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// 如果向对话框添加最小化按钮，则需要下面的代码
//  来绘制该图标。对于使用文档/视图模型的 MFC 应用程序，
//  这将由框架自动完成。

void CshiyanDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // 用于绘制的设备上下文

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// 使图标在工作矩形中居中
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// 绘制图标
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

//当用户拖动最小化窗口时系统调用此函数取得光标显示。
//
HCURSOR CshiyanDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}


void CshiyanDlg::OnBnClickedButton1()
{
	// TODO: 在此添加控件通知处理程序代码
	if (!m_abb.Connect())
	{
		AfxMessageBox("连接失败");
		return ;
	}
	else
		AfxMessageBox("连接成功");

	//机器人上电、启动
	//m_abb.SendMsg("#MotorOn@");
	//m_abb.SendMsg("#Init@");
}

void CshiyanDlg::OnBnClickedButton2()
{
	// TODO: 在此添加控件通知处理程序代码
	m_abb.Disconnect();
}

void CshiyanDlg::OnBnClickedButton3()
{
	// TODO: 在此添加控件通知处理程序代码
	CString str;
	double po[3];
	//double pos[3];
	double ori[3];

	GetDlgItem(IDC_Send1)->GetWindowText(str);
	po[0] = atof(str);
	GetDlgItem(IDC_Send2)->GetWindowText(str);
	po[1] = atof(str);
	GetDlgItem(IDC_Send3)->GetWindowText(str);
	po[2] = atof(str);
	GetDlgItem(IDC_Send4)->GetWindowText(str);;
	ori[0] = atof(str);
	GetDlgItem(IDC_Send5)->GetWindowText(str);;
	ori[1] = atof(str);
	GetDlgItem(IDC_Send6)->GetWindowText(str);;
	ori[2] = atof(str);

    this->m_abb.MoveToolTo(po,ori, 50);
}

void CshiyanDlg::OnBnClickedButton4()
{
	// TODO: 在此添加控件通知处理程序代码
	double pos[3];
	double ori[3];
	CString   str; 
	m_abb.GetCalibTool(pos,ori);
	str.Format("%lf", pos[0]);
	SetDlgItemText(IDC_Recv1,str);

	str.Format("%lf", pos[1]);
	SetDlgItemText(IDC_Recv2,str);

	str.Format("%lf", pos[2]);
	SetDlgItemText(IDC_Recv3,str);

	str.Format("%lf", ori[0]);
	SetDlgItemText(IDC_Recv4,str);

	str.Format("%lf", ori[1]);
	SetDlgItemText(IDC_Recv5,str);

	str.Format("%lf", ori[2]);
	SetDlgItemText(IDC_Recv6,str);
	
}

void CshiyanDlg::OnBnClickedButton5()
{
	// TODO: 在此添加控件通知处理程序代码
	double po[6];
	CString str;
	GetDlgItem(IDC_Send7)->GetWindowText(str);
	po[0]=atof(str);
	GetDlgItem(IDC_Send8)->GetWindowText(str);
	po[1] = atof(str);

	GetDlgItem(IDC_Send9)->GetWindowText(str);
	po[2] = atof(str);

	GetDlgItem(IDC_Send10)->GetWindowText(str);
	po[3] = atof(str);

	GetDlgItem(IDC_Send11)->GetWindowText(str);
	po[4] = atof(str);

	GetDlgItem(IDC_Send12)->GetWindowText(str);
	po[5] = atof(str);
	m_abb.MoveJointTo(po,50);
}

void CshiyanDlg::OnBnClickedButton6()
{
	// TODO: 在此添加控件通知处理程序代码
	
	double posread[6];
	CString   str; 
	m_abb.GetAng(posread);
	char *pszSection="Config";
	CStringA FilePath;
	FILE *fp;
	posread[0]=posread[0]-m_abb.position[0];
	posread[1]=posread[1]-m_abb.position[1];
	posread[2]=posread[2]-m_abb.position[2];
	posread[3]=posread[3]-m_abb.position[3];
	posread[4]=posread[4]-m_abb.position[4];
	posread[5]=posread[5]-m_abb.position[5];
	GetModuleFileNameA(NULL, FilePath.GetBuffer(MAX_PATH), MAX_PATH); //获得当前应用程序路径名称（即exe所在位置）
	FilePath.ReleaseBuffer();
	FilePath = FilePath.Left(FilePath.ReverseFind('\\'));
	FilePath += "\\data0825.txt";
	fp=fopen(FilePath,"a+");
	fprintf(fp,"RobotJoint %lf,%lf,%lf,%lf,%lf,%lf\n",posread[0],posread[1],posread[2],posread[3],posread[4],posread[5]);
	fclose(fp);

	str.Format("%lf", posread[0]);
	SetDlgItemText(IDC_Recv7,str);

	str.Format("%lf", posread[1]);
	SetDlgItemText(IDC_Recv8,str);

	str.Format("%lf", posread[2]);
	SetDlgItemText(IDC_Recv9,str);

	str.Format("%lf", posread[3]);
	SetDlgItemText(IDC_Recv10,str);

	str.Format("%lf", posread[4]);
	SetDlgItemText(IDC_Recv11,str);

	str.Format("%lf", posread[5]);
	SetDlgItemText(IDC_Recv12,str);
}
UINT ABBMovethread(LPVOID lpParam)
{
	FILE *fp;
	int count=84;
	double *pos=new double[6*count];
	CshiyanDlg* pDlg=(CshiyanDlg*)lpParam;

	fp=fopen("C:\\Users\\think\\Desktop\\shiyan\\pos0825.txt","r+");
	if (fp!=NULL)
	{
		for (int i=0;i<count;i++)
		{
			fscanf(fp,"%lf %lf %lf %lf %lf %lf\n",&pos[i*6],&pos[i*6+1],&pos[i*6+2],&pos[i*6+3],&pos[i*6+4],&pos[i*6+5]);
		}
	}
	while(pDlg->status)
	{
       for (int i=0;i<count;i++)
       {
		   for (int j=0;j<6;j++)
		   {
			   pDlg->m_abb.position[j]=pos[i*6+j];
		   }
		   pDlg->movejointto(pDlg->m_abb.position);
		   pDlg->OnBnClickedButton6();
		  // Sleep(100);
		 //  AfxMessageBox("屌屌的黄");
		   if (i==count-1)
		   {
			   pDlg->status=false;
		   }
		   if (!pDlg->status)
		   {
			   break;
		   }
       }
	}
	AfxEndThread(0);
	return 0;

}
void CshiyanDlg::OnBnClickedButton7()
{
	// TODO: 
	pTriggerThread=AfxBeginThread(ABBMovethread,this,0,0,0,NULL);
	status=true;
}
void CshiyanDlg::movejointto(double position[6])
{
	m_abb.MoveJointTo(position,50);
}
void CshiyanDlg::OnBnClickedButton8()
{
	// TODO: 在此添加控件通知处理程序代码
	status=false;
}


void CshiyanDlg::OnBnClickedWritemod()
{
	// TODO: 在此添加控件通知处理程序代码
	m_abb.WriteMod();
}
