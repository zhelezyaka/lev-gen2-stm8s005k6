/********************************************************************************
* Enum Variable define  														*
********************************************************************************/
#define true            1
#define false           0

#define TurnOff     0
#define TurnOn      1

#define Signal_Low      TurnOff
#define Signal_High     TurnOn

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
#define LEDNumbers              5
//#define All_LED_Bits_Mask       (2^LEDNumbers) // 2^LEDNumbers - 1
//#define All_LED_Bits_Mask       0x0f  // 2^LEDNumbers - 1


/********************************************************************************
* Define																		*
********************************************************************************/

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
//#define LED_Serial_Light_On     (0x0040)    //
//#define LED_Serial_Light_Off    (0x0080)    //
//Hight byte
#define PIC_UVP_STATUS          (0x0100)    // pic uvp input pin
#define PIC_OVP_STATUS          (0x0200)    // pic ovp input pin
#define ENABLE_DOC_COUNTER      (0x0400)    //Start DSG Over current counting for releasing OC. if finish, will set DOC_COUNTING_FINISH flag
#define DOC_COUNTING_FINISH     (0x0800)    //DOC Over current counting Finish.
#define ENABLE_COC_COUNTER      (0x1000)    ///Start CHG Over current counting for releasing OC. if finish, will set COC_COUNTING_FINISH flag
#define COC_COUNTING_FINISH     (0x2000)    //COC Over current counting Finish.
#define COC_RELEASE_FOR_REPEATED_CHECK (0x4000)    //After COC release, this flag will set until holding time out.
#define BUTTON_CLICK_For_Polling    (0x8000)    //
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
/* G_Add_Device_Interface_Status Control Bits */
/* For G_Add_Device_Interface_Status ; unsigned int */
//Low byte
#define ADP_SOC_Status      (0x0001)    //adapter_soc signal output pin status
//#define _No_Used_                (0x0002) 
//#define _No_Used_     (0x0004)    // 
//#define _No_Used_     (0x0008)    //
//#define _No_Used_    (0x0010)    //
//#define _No_Used_      (0x0020)    //
//#define _No_Used_      (0x0040)    //
//#define _No_Used_      (0x0080)    //
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
void System_clk_setup();

extern unsigned char G_All_LED_Bits_Mask;
void InitLEDDisplay();
void SetLed_DirectIO_BITs(unsigned char LEDNumBits);
void SetLedLightOnFlag(unsigned char LEDNumBits, unsigned char enable);
void SetLedBlinkFlag(unsigned char LEDNumBits, unsigned char enable);
void SetLedPWMFunction(unsigned char LEDNumBits, unsigned char enable);
void SetLedPWM20Steps(unsigned char PWM_Steps);
void SetLedSerialTurnOnOff(unsigned char enable);
    
void InitMosControl();
void setMosFET(unsigned char MosFetCode, unsigned char enable);
    
void InitButtonEvent();
unsigned char GetButtonStatus();


void InitInputSignalPin();
unsigned char get_PIC_UVP_Status();
unsigned char get_PIC_OVP_Status();


void InitADCFunction();
void startAdcConversion();
void stopAdcConversion();
void Set_Interrupt_ADC_Conversion_Finish_Function(void (*calling_fun)());
void Reomve_Interrupt_ADC_Conversion_Finish_Function();
void Get_ADC_Values(unsigned int *valueArray, unsigned char length);



void InitTimer1Function();
void Set_Interrupt_Timer1_Calling_Function(unsigned char fun_index, void (*calling_fun)());
void Remove_Interrupt_Timer1_Calling_Function(unsigned char fun_index, void (*calling_fun)());



////////////////////////////////////
// Polling function
void InitSubPollingProtectionVariables();
void ProtectionForPolling();
void InitTimerPollingVariables();
void TimerCounterForPolling();
void delay_cycles(unsigned long cycleCount);


//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
void InitAdapterOutputSignal(void);
void SetADPSOC(unsigned char enable);
//////////////////////////////////////////////////////////////////////////////////////////////////////////
#define PrecedingCheckCode  0x80f8
#define EndCheckCode        0x70f7
void InitUARTFunction();
void Set_Uart_RX_Interrupt(unsigned char enable);
void UART_Send_Word_CRC(unsigned int *sendData, unsigned int length, unsigned char enable_with_PrecedingCode);
void ReceiveDataParsing(unsigned char *receiveData, unsigned int length);
unsigned int usMBCRC16( unsigned char * pucFrame, unsigned int usLen );

//////////////////////////////////////////////////////////////////////////////////////////////////////////
void device_function_test1();
void device_function_test2();





