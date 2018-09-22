#include "StdAfx.h"
#include "plcControlpanel.h"
#define  setVoltageValue 0x0821
plcControlpanel::plcControlpanel(PLCSetting* plcSetting)
{
	if(m_plcSetting->IsConnect()==false){m_plcSetting->modbusConnectRTU();}
}


plcControlpanel::~plcControlpanel(void)
{
}
void plcControlpanel::setVoltage()
{
	int ret=modbus_write_bit(m_modbus,setVoltageValue,1);
}
