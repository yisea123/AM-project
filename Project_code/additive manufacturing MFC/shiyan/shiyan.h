// shiyan.h : PROJECT_NAME Ӧ�ó������ͷ�ļ�
//

#pragma once

#ifndef __AFXWIN_H__
	#error "�ڰ������ļ�֮ǰ������stdafx.h�������� PCH �ļ�"
#endif

#include "resource.h"		// ������


// CshiyanApp:
// �йش����ʵ�֣������ shiyan.cpp
//

class CshiyanApp : public CWinApp
{
public:
	CshiyanApp();

// ��д
	public:
	virtual BOOL InitInstance();

// ʵ��

	DECLARE_MESSAGE_MAP()
};

extern CshiyanApp theApp;