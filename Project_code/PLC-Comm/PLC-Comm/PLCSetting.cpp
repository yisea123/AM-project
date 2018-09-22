#include "StdAfx.h"
#include "PLCSetting.h"
#include "eutils.h"
#define  plcOpen 0x0801
#define  setVoltageValue1 0x0802
#define  setVoltageValue2 0x0803
#define  setCurrentValue1 0x0804
#define  setCurrentValue2 0x0805
#define  OUTPUT0 0x0806
#define  OUTPUT1 0x0807
#define  OUTPUT2 0x0808
#define  OUTPUT3 0x0809
#define  OUTPUT4 0x080A
#define  OUTPUT5 0x080B
#define  OUTPUT6 0x080C
#define  OUTPUT7 0x080D
#define  voltageValue1 0x1064
#define  voltageValue2 0x1065
#define  currentValue1 0x1066
#define  currentValue2 0x1067

PLCSetting::PLCSetting(ModbusCommSettings *settings)
	:m_modbusCommSettings(settings),m_modbus(NULL)
{
	//ModbusCommSettings(settings);
	//m_m odbus(NULL);
	m_slave=1;
	m_connected=false;
	QString port=m_modbusCommSettings->serialPort();
	int baud=m_modbusCommSettings->baud().toInt();
	QChar parity=EUtils::parity(m_modbusCommSettings->parity());
	int dataBits=m_modbusCommSettings->dataBits().toInt();
	int stopBits=m_modbusCommSettings->stopBits().toInt();
	int RTS=m_modbusCommSettings->RTS().toInt();
	int timeOut=m_modbusCommSettings->timeOut().toInt();
}


PLCSetting::~PLCSetting(void)
{
}
void PLCSetting::modbusConnectRTU()
{

	QString port=m_modbusCommSettings->serialPort();
	int baud=m_modbusCommSettings->baud().toInt();
	QChar parity=EUtils::parity(m_modbusCommSettings->parity());
	int dataBits=m_modbusCommSettings->dataBits().toInt();
	int stopBits=m_modbusCommSettings->stopBits().toInt();
	int RTS=m_modbusCommSettings->RTS().toInt();
	int timeOut=m_modbusCommSettings->timeOut().toInt();

	modbusDisConnect();
	m_modbus = modbus_new_rtu(port.toLatin1().constData(),baud,parity.toLatin1(),dataBits,stopBits,RTS);

	m_timeOut = timeOut;

	if(m_modbus && modbus_connect(m_modbus) == -1) {
		
		//QMessageBox::critical(NULL, "Connection failed", "Could not connect to serial port!");
		MessageBox(NULL,LPCWSTR("fail"),LPCWSTR("fail"),MB_OK);
		//AfxMessageBox("fail");
		m_connected = false;
	}
	else {
		//ReadPos();
		m_connected = true;
		//m_pollTimer->start(m_timeOut);
	}
	modbus_set_slave(m_modbus, m_slave);

}
void PLCSetting::modbusDisConnect()
{
	if(m_modbus) {
		m_pollTimer->stop();
		modbus_close(m_modbus);
		modbus_free(m_modbus);
		m_modbus = NULL;
	}
	m_connected = false;
}
void PLCSetting::setVoltage(int chanel,double value)
{
	switch (chanel)
	{
	case 1:
		modbus_write_register(m_modbus,voltageValue1 ,value);
		break;
	case 2:
		modbus_write_register(m_modbus,voltageValue2 ,value);
		break;
	case 3:
		modbus_write_register(m_modbus,currentValue1 ,value);
		break;
	case 4:
		modbus_write_register(m_modbus,currentValue2 ,value);
		break;
	}
}
void PLCSetting::plcStart()
{
	int ret=modbus_write_bit(m_modbus,plcOpen,1);
}
void PLCSetting::closePLC()
{
	int ret=modbus_write_bit(m_modbus,plcOpen,0);

}
void PLCSetting::openChanel(int ID)
{
	switch (ID)
	{
	case 1:
		modbus_write_bit(m_modbus,setVoltageValue1,1);
		break;
	case 2:
		modbus_write_bit(m_modbus,setVoltageValue2,1);
		break;
	case 3:
		modbus_write_bit(m_modbus,setCurrentValue1,1);
		break;
	case 4:
		modbus_write_bit(m_modbus,setCurrentValue2,1);
		break;
	}
}
void PLCSetting::closeChanel(int ID)
{
	switch (ID)
	{
	case 1:
		modbus_write_bit(m_modbus,setVoltageValue1,0);
		break;
	case 2:
		modbus_write_bit(m_modbus,setVoltageValue2,0);
		break;
	case 3:
		modbus_write_bit(m_modbus,setCurrentValue1,0);
		break;
	case 4:
		modbus_write_bit(m_modbus,setCurrentValue2,0);
		break;
	}
}
void PLCSetting::openOutpot(int ID)
{
	switch (ID)
	{
	case 0:
		modbus_write_bit(m_modbus,OUTPUT0,1);
		break;
	case 1:
		modbus_write_bit(m_modbus,OUTPUT1,1);
		break;
	case 2:
		modbus_write_bit(m_modbus,OUTPUT2,1);
		break;
	case 3:
		modbus_write_bit(m_modbus,OUTPUT3,1);
		break;
	case 4:
		modbus_write_bit(m_modbus,OUTPUT4,1);
		break;
	case 5:
		modbus_write_bit(m_modbus,OUTPUT5,1);
		break;
	case 6:
		modbus_write_bit(m_modbus,OUTPUT6,1);
		break;
	case 7:
		modbus_write_bit(m_modbus,OUTPUT7,1);
		break;
	}
}
void PLCSetting::closeOutpot(int ID)
{
	switch (ID)
	{
	case 0:
		modbus_write_bit(m_modbus,OUTPUT0,0);
		break;
	case 1:
		modbus_write_bit(m_modbus,OUTPUT1,0);
		break;
	case 2:
		modbus_write_bit(m_modbus,OUTPUT2,0);
		break;
	case 3:
		modbus_write_bit(m_modbus,OUTPUT3,0);
		break;
	case 4:
		modbus_write_bit(m_modbus,OUTPUT4,0);
		break;
	case 5:
		modbus_write_bit(m_modbus,OUTPUT5,0);
		break;
	case 6:
		modbus_write_bit(m_modbus,OUTPUT6,0);
		break;
    case 7:
		modbus_write_bit(m_modbus,OUTPUT7,0);
		break;
	}
}