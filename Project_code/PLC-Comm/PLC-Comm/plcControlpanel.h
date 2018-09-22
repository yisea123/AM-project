#pragma once
#include "PLCSetting.h"
#include "modbus.h"
class plcControlpanel
{
public:
	plcControlpanel(PLCSetting* plcSetting);
	~plcControlpanel(void);
public:
	void setVoltage();
private:
	PLCSetting* m_plcSetting;
	modbus_t *m_modbus;
};

