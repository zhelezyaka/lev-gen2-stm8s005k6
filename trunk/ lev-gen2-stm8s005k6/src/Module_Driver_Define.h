
#include "Global_config.h"
/********************************************************************************
* Enum Variable define  														*
********************************************************************************/
#define false           0
#define true            1

#define TurnOff         false
#define TurnOn          true

#define Signal_Low      TurnOff
#define Signal_High     TurnOn

#define Data_Error      false
#define Data_Success    true

enum forLEDNumberBits
{
    LED1 = 0x01,
    LED2 = 0x02,
    LED3 = 0x04,
    LED4 = 0x08,
    LED5 = 0x10
};
//enum forLEDNumberCodes
//{
//    LED1,
//    LED2,
//    LED3,
//    LED4,
//    LED5
//};

#if _USE_5_LED_DISPLAY_    ==  0
// 4 LEDs
#define LEDNumbers          4

#define CAPACITY_1          19
#define CAPACITY_2          46
#define CAPACITY_3          73

#else
// 5 LEDs
#define LEDNumbers              5
//#define All_LED_Bits_Mask       (2^LEDNumbers) // 2^LEDNumbers - 1
//#define All_LED_Bits_Mask       0x0f  // 2^LEDNumbers - 1

#define CAPACITY_1          16
#define CAPACITY_2          37
#define CAPACITY_3          58
#define CAPACITY_4          79
#endif
/********************************************************************************
* Define																		*
********************************************************************************/
//////////////////////////////////////////////////
/* System_Control_Bit_EEPROM: Control Bits */
/* define in User_Define.h ; unsigned char */
#define EnableSendSystemData    (0x01)  //send by one second.
#define EnableSendEEPROMData    (0x02)  //send by one second.
#define Calibration_Done        (0x04)    //
//#define LED4_Control    (0x08)    //
//#define Calibration_Done    (0x10)    //
//#define _No_Used_      (0x0020)    //
//#define _No_Used_      (0x0040)    //
//#define _No_Used_      (0x0080)    //

//////////////////////////////////////////////////
//////////////////////////////////////////////////
/* G_LED_Interface_Status1: Control Bits */
/* For G_LED_Interface_Status1 ; unsigned int */
//LED showing priority : PWM > Blink > Light ON
//Low byte
#define LED1_Control    (0x0001)    //Direct I/O On Off , it's control by Timer polling , not user
#define LED2_Control    (0x0002)    //
#define LED3_Control    (0x0004)    //
#define LED4_Control    (0x0008)    //
#define LED5_Control    (0x0010)    //
//#define _No_Used_      (0x0020)    //
//#define _No_Used_      (0x0040)    //
//#define _No_Used_      (0x0080)    //
//Hight byte
#define LED1_LightON     (0x0100)    //
#define LED2_LightON     (0x0200)    //
#define LED3_LightON     (0x0400)    //
#define LED4_LightON     (0x0800)    //
#define LED5_LightON     (0x1000)    //
//#define _No_Used_      (0x2000)    //
//#define _No_Used_      (0x4000)    //
//#define _No_Used_      (0x8000)    //
//////////////////////////////////////////////////
/* G_LED_Interface_Status2: Control Bits */
/* For G_LED_Interface_Status2 ; unsigned int */
//LED showing priority : PWM > Blink > Light ON
//Low byte
#define LED1_Blink    (0x0001)    //
#define LED2_Blink    (0x0002)    //
#define LED3_Blink    (0x0004)    //
#define LED4_Blink    (0x0008)    //
#define LED5_Blink    (0x0010)    //
//#define _No_Used_      (0x0020)    //
//#define _No_Used_      (0x0040)    //
//#define _No_Used_      (0x0080)    //
//Hight byte
#define LED1_PWM_ON     (0x0100)    //
#define LED2_PWM_ON     (0x0200)    //
#define LED3_PWM_ON     (0x0400)    //
#define LED4_PWM_ON     (0x0800)    //
#define LED5_PWM_ON     (0x1000)    //
//#define _No_Used_      (0x2000)    //
//#define _No_Used_      (0x4000)    //
//#define _No_Used_      (0x8000)    //
//////////////////////////////////////////////////


enum forMosFetNumberCode
{
    CHG_MOSFET,
    DSG_MOSFET
};
enum forButtonStatusCode
{
    ButtonRelease,
    ButtonPress
};
/* Driver G_Device_Interface_Status1 Control Bits */
/* For G_Device_Interface_Status1 ; unsigned int */
//Low byte
#define CHG_MOSFET_STATUS       (0x0001)    //CHG MOSFET Status, set = turn on
#define DSG_MOSFET_STATUS       (0x0002)    //DSG MOSFET Status, set = turn on
#define BUTTON_PRESS            (0x0004)    //
#define BUTTON_CLICK            (0x0008)    //
#define BUTTON_LONG_PRESS       (0x0010)    //
#define ADC_CONVERSION          (0x0020)    //
#define BUTTON_MULTI_CLICK      (0x0040)    //
#define ADC_SET_CONVERSION      (0x0080)    //
//Hight byte
#define PIC_UVP_STATUS          (0x0100)    // pic uvp input pin
#define PIC_OVP_STATUS          (0x0200)    // pic ovp input pin
#define ENABLE_DOC_COUNTER      (0x0400)    //Start DSG Over current counting for releasing OC. if finish, will set DOC_COUNTING_FINISH flag
#define DOC_COUNTING_FINISH     (0x0800)    //DOC Over current counting Finish.
#define ENABLE_COC_COUNTER      (0x1000)    ///Start CHG Over current counting for releasing OC. if finish, will set COC_COUNTING_FINISH flag
#define COC_COUNTING_FINISH     (0x2000)    //COC Over current counting Finish.
#define COC_RELEASE_FOR_REPEATED_CHECK (0x4000)    //After COC release, this flag will set until holding time out.
#define BUTTON_CLICK_For_Polling    (0x8000)    // to send click event to polling function
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
/* G_Add_Device_Interface_Status Control Bits */
/* For G_Add_Device_Interface_Status ; unsigned int */
//Low byte
#define ADP_SOC_Status                  (0x0001)    //adapter_soc signal output pin status
#define ENABLE_AUX1_COUNTER             (0x0002)    //
#define AUX1_COUNTING_FINISH            (0x0004)    // 
#define ENABLE_MULTI_CLICK_COUNTER      (0x0008)    //
#define MULTI_CLICK_COUNTING_FINISH     (0x0010)    //
#define SYSTEM_CHANGE_MODE              (0x0020)    //
#define LAST_POLLING_FLAG               (0x0040)    //
//#define LED_Serial_Light_Off      (0x0080)    //
//Hight byte
//#define _No_Used_     (0x0100)    //
//#define _No_Used_     (0x0200)    //
//#define _No_Used_     (0x0400)    //
//#define _No_Used_     (0x0800)    //
//#define _No_Used_     (0x1000)    //
//#define _No_Used_      (0x2000)    //
//#define _No_Used_      (0x4000)    //
//#define _No_Used_      (0x8000)    //

/********************************************************************************
* Define function   															*
********************************************************************************/
void System_clk_setup(void);

void LastPollingFunction(void);

extern unsigned char G_All_LED_Bits_Mask;
void InitLEDDisplay(void);
void SetLed_DirectIO_BITs(unsigned char LEDNumBits);
void SetLedLightOnFlag(unsigned char LEDNumBits, unsigned char enable);
void SetLedBlinkFlag(unsigned char LEDNumBits, unsigned char enable);
void SetLedPWMFunction(unsigned char LEDNumBits, unsigned char enable);
void SetLedPWM20Steps(unsigned char PWM_Steps);
void SetLedSerialTurnOnOff_ByIO(unsigned char enable);
void SetLedSerialTurnOnOff_ByTimer(unsigned char enable);
void SetLed_DirectIO_Pin_OnOff(unsigned char LEDNumPin);
void SetLed_DirectIO_Pin_OnOff_old(unsigned char LEDNumPin, unsigned char enable);
void DisplayCapacity(unsigned char capacity, char isOn); 
void SetLedFlashing();


void InitMosControl(void);
void setMosFET(unsigned char MosFetCode, unsigned char enable);

#define MULTI_CLICK_PRESS_TIMES     3   //press times
void InitButtonEvent(void);
unsigned char GetButtonStatus(void);


void InitInputSignalPin(void);
unsigned char get_PIC_UVP_Status(void);
unsigned char get_PIC_OVP_Status(void);


void InitADCFunction(void);
void startAdcConversion(void);
void stopAdcConversion(void);
void Set_Interrupt_ADC_Conversion_Finish_Function(void (*calling_fun)(void));
void Reomve_Interrupt_ADC_Conversion_Finish_Function(void);
void Get_ADC_Values(unsigned int *valueArray, unsigned char length);



void InitTimerFunction(void);
void DisableTimerFunction(void);
void Set_Interrupt_Timer_Calling_Function(unsigned char fun_index, void (*calling_fun)(void));
void Remove_Interrupt_Timer_Calling_Function(unsigned char fun_index, void (*calling_fun)(void));

void InitAWUTimerFunction(void);
void DisableAWUTimerFunction(void);
void Set_AWU_Shorter_Timer_Interval_Time_Base(void);
void Set_AWU_Longer_Timer_Interval_Time_Base(void);
void Set_Interrupt_AWU_Timer_Calling_Function(unsigned char fun_index, void (*calling_fun)(void));
void Remove_Interrupt_AWU_Timer_Calling_Function(unsigned char fun_index, void (*calling_fun)(void));



//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
void InitAdapterOutputSignal(void);
void SetADPSOC(unsigned char enable);
//////////////////////////////////////////////////////////////////////////////////////////////////////////
#define PrecedingCheckCode      0x80f8
#define EndCheckCode            0x70f7
#define Uart_Send_Error_Code    0x83f0
#define Uart_Send_Response_Code 0x8301
#define Slave_Address           0x48
#define Read_funcition_code     0x8003
#define Write_funcition_code    0x8004

void InitUARTFunction(void);
void Set_Uart_RX_Interrupt(unsigned char enable);
void UART_Send_Word_CRC(unsigned int *sendData, unsigned int length, unsigned char enable_with_PrecedingCode);
void UART_Send_EEPROM_DATA_CRC_with_PrecedingCheckCode();
void ReceiveDataParsing(unsigned char *receiveData, unsigned int length);
unsigned int usMBCRC16( unsigned char * pucFrame, unsigned int usLen );
//////////////////////////////////////////////////////////////////////////////////////////////////////////
#define EEPROM_SIZE 128 //bytes
void Init_EEPROM(void);
unsigned char EEPROM_WriteByte(unsigned int Address_Offset, unsigned char Data);
unsigned char EEPROM_WriteDoubleWord(unsigned int Address_Offset, unsigned long Data);
unsigned char EEPROM_WriteWholeMemory(unsigned char *array, unsigned char length);
unsigned char EEPROM_ReadWholeMemory(unsigned char *array, unsigned char length);
unsigned char EEPROM_ReadWholeEEPROMToInternalMemory(void);
unsigned char EEPROM_Set_Data_ToInternalMemory(unsigned char offset, unsigned char *array, unsigned char length);
unsigned char EEPROM_WriteWholeEEPROMFromInternalMemory(void);

void delay_cycles(unsigned long cycleCount);

unsigned int ReceiveCmdParsing(unsigned int *receivedData, unsigned int length);
//////////////////////////////////////////////////////////////////////////////////////////////////////////
void device_function_test1(void);
void device_function_test2(void);





