/********************************************************************************
* Enum Variable define  														*
********************************************************************************/

#define TurnOff     0
#define TurnOn      1
enum forLEDNumberBits
{
    LED1 = 0x01,
    LED2 = 0x02,
    LED3 = 0x04,
    LED4 = 0x08,
    LED5 = 0x10
};
#define LEDNumbers              4
#define All_LED_Bits_Mask       0x0f  // 2^LEDNumbers - 1


/********************************************************************************
* Define																		*
********************************************************************************/

//////////////////////////////////////////////////
/* G_LED_Interface_Status1: Control Bits */
/* For G_LED_Interface_Status1 ; unsigned int */
//LED showing priority : PWM > Blink > Light ON
//Low byte
#define LED1_Control    (0x0001)    //
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
//#define _No_Used_   (0x0040)    //
//#define _No_Used_   (0x0080)    //
//Hight byte
#define PIC_UVP_STATUS   (0x0100)    // pic uvp input pin
#define PIC_OVP_STATUS   (0x0200)    // pic ovp input pin
//#define _No_Used_   (0x0400)    //
//#define _No_Used_   (0x0800)    //
//#define _No_Used_   (0x1000)    //
//#define _No_Used_   (0x2000)    //
//#define _No_Used_   (0x4000)    //
//#define _No_Used_   (0x8000)    //


/********************************************************************************
* Define function   															*
********************************************************************************/

void InitLEDDisplay();
void SetLedOnOff(unsigned char LEDNumBits, unsigned char enable);
void SetLedLightOnFlag(unsigned char LEDNumBits, unsigned char enable);
void SetLedBlinkFlag(unsigned char LEDNumBits, unsigned char enable);
void SetLedPWMFunction(unsigned char LEDNumBits, unsigned char enable);
    
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
unsigned int getCHGCurrentADC();
unsigned int getDSGCurrentADC();
unsigned int getVbatADC();
unsigned int getThermal1ADC();
unsigned int getThermal2ADC();











