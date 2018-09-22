#pragma once
#include "modbus.h"
#include "ModbusCommSettings.h"
#include "QtCore/QTimer"
#include "QtWidgets/QMessageBox"
class PLCSetting
{
public:
	PLCSetting(ModbusCommSettings *settings);
	~PLCSetting(void);
public:
	void modbusConnectRTU();
	void modbusDisConnect();
	bool IsConnect() {return m_connected;}
	void setVoltage(int chanel,double value);
	void plcStart();
	void closePLC();
	void openChanel(int ID);
	void closeChanel(int ID);
	void openOutpot(int ID);
	void closeOutpot(int ID);

protected:
	bool m_connected;
	ModbusCommSettings *m_modbusCommSettings;
	modbus_t * m_modbus;
	//bool m_connected;
	int m_timeOut;
	QTimer *m_pollTimer;
	int m_slave;

};

