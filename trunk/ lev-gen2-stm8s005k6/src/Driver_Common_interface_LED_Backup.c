

/********************************************************************************
* Include																		*
********************************************************************************/
#include "Global_config.h"
//#include "Module_Interface_Define.h"
//#include "Module_Flash_Information.h"
//#include "Module_Variable_Define.h"
//#include "Module_Var_Bit_Define.h"
/********************************************************************************
* Extern Function for Device													*
********************************************************************************/
// LED control
void _Device_Init_Led_Function();
void _Device_Set_Led_PWM_Function(unsigned char LEDNumCode, unsigned char enable);
void _Device_Set_Led_OnOff(unsigned char LEDNumCode, unsigned char enable);
//Mos Fet Control
void _Device_Init_MosControl_Function();
void _Device_Set_MosFET(unsigned char MosFetCode, unsigned char enable);
void _Device_Set_Led_LightOnOff(unsigned char LEDNumCode, unsigned char enable);
//Button
void _Device_Init_Button_Event_Function();
unsigned char _Device_Get_Button_Status();
void Interrupt_Calling_ButtonEvent_Press_Trigger();
//void Interrupt_Calling_ButtonEvent_Release_Trigger();

/********************************************************************************
* Enum Variable define  														*
********************************************************************************/
#define LEDNumbers      4

#define TurnOff     0
#define TurnOn      1
enum forLEDNumberCode
{
    LED1 = 0x01,
    LED2 = 0x02,
    LED3 = 0x04,
    LED4 = 0x08,
    LED5 = 0x10
};
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
// LED function
void InitLEDDisplay(){
    G_LED_Interface_Status1 = 0;
    G_LED_Interface_Status2 = 0;
    _Device_Init_Led_Function();
}


void SetLedOnOff(unsigned char LEDNumCode, unsigned char enable){
    if(LEDNumCode >= LEDNumbers){
        return;
    }
    if(enable == 0){
        _Device_Set_Led_OnOff(LEDNumCode, TurnOff);
        switch(LEDNumCode){
            case LED1:    G_LED_Interface_Status1 &= ~LED1_Control;  break;
            case LED2:    G_LED_Interface_Status1 &= ~LED2_Control;  break;
            case LED3:    G_LED_Interface_Status1 &= ~LED3_Control;  break;
            case LED4:    G_LED_Interface_Status1 &= ~LED4_Control;  break;
            case LED5:    G_LED_Interface_Status1 &= ~LED5_Control;  break;
            default:  break;  
        }
    }else{
        _Device_Set_Led_OnOff(LEDNumCode, TurnOn);
        switch(LEDNumCode){
            case LED1:    G_LED_Interface_Status1 |= LED1_Control;  break;
            case LED2:    G_LED_Interface_Status1 |= LED2_Control;  break;
            case LED3:    G_LED_Interface_Status1 |= LED3_Control;  break;
            case LED4:    G_LED_Interface_Status1 |= LED4_Control;  break;
            case LED5:    G_LED_Interface_Status1 |= LED5_Control;  break;
            default:  break;      
        }
    }    
}
void SetLedLightOnFlag(unsigned char LEDNumCode, unsigned char enable){
    if(LEDNumCode >= LEDNumbers){
        return;
    }
    if(enable == 0){
        switch(LEDNumCode){
            case LED1:    G_LED_Interface_Status1 &= ~LED1_LightON;  break;
            case LED2:    G_LED_Interface_Status1 &= ~LED2_LightON;  break;
            case LED3:    G_LED_Interface_Status1 &= ~LED3_LightON;  break;
            case LED4:    G_LED_Interface_Status1 &= ~LED4_LightON;  break;
            case LED5:    G_LED_Interface_Status1 &= ~LED5_LightON;  break;
            default:  break;  
        }
    }else{
        switch(LEDNumCode){
            case LED1:    G_LED_Interface_Status1 |= LED1_LightON;  break;
            case LED2:    G_LED_Interface_Status1 |= LED2_LightON;  break;
            case LED3:    G_LED_Interface_Status1 |= LED3_LightON;  break;
            case LED4:    G_LED_Interface_Status1 |= LED4_LightON;  break;
            case LED5:    G_LED_Interface_Status1 |= LED5_LightON;  break;
            default:  break;      
        }
    }    
}
void SetLedBlinkFlag(unsigned char LEDNumCode, unsigned char enable){
    if(LEDNumCode >= LEDNumbers){
        return;
    }
    if(enable == 0){
        switch(LEDNumCode){
            case LED1:    G_LED_Interface_Status2 &= ~LED1_Blink;  break;
            case LED2:    G_LED_Interface_Status2 &= ~LED2_Blink;  break;
            case LED3:    G_LED_Interface_Status2 &= ~LED3_Blink;  break;
            case LED4:    G_LED_Interface_Status2 &= ~LED4_Blink;  break;
            case LED5:    G_LED_Interface_Status2 &= ~LED5_Blink;  break;
            default:  break;      
        }
    }else{
        switch(LEDNumCode){
            case LED1:    G_LED_Interface_Status2 |= LED1_Blink;  break;
            case LED2:    G_LED_Interface_Status2 |= LED2_Blink;  break;
            case LED3:    G_LED_Interface_Status2 |= LED3_Blink;  break;
            case LED4:    G_LED_Interface_Status2 |= LED4_Blink;  break;
            case LED5:    G_LED_Interface_Status2 |= LED5_Blink;  break;
            default:  break;      
        }
    }
}
void SetLedPWMFunction(unsigned char LEDNumCode, unsigned char enable){
    if(LEDNumCode >= LEDNumbers){
        return;
    }
    if(enable == 0){
        _Device_Set_Led_PWM_Function(LEDNumCode, TurnOff);
        switch(LEDNumCode){
            case LED1:    G_LED_Interface_Status2 &= ~LED1_PWM_ON;  break;
            case LED2:    G_LED_Interface_Status2 &= ~LED2_PWM_ON;  break;
            case LED3:    G_LED_Interface_Status2 &= ~LED3_PWM_ON;  break;
            case LED4:    G_LED_Interface_Status2 &= ~LED4_PWM_ON;  break;
            case LED5:    G_LED_Interface_Status2 &= ~LED5_PWM_ON;  break;
            default:  break;      
        }
    }else{
        _Device_Set_Led_PWM_Function(LEDNumCode, TurnOn);
        switch(LEDNumCode){
            case LED1:    G_LED_Interface_Status2 |= LED1_PWM_ON;  break;
            case LED2:    G_LED_Interface_Status2 |= LED2_PWM_ON;  break;
            case LED3:    G_LED_Interface_Status2 |= LED3_PWM_ON;  break;
            case LED4:    G_LED_Interface_Status2 |= LED4_PWM_ON;  break;
            case LED5:    G_LED_Interface_Status2 |= LED5_PWM_ON;  break;
            default:  break;      
        }
    }
}
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
//#define _No_Used_   (0x0020)    //
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

////////////////////////////////////////////
// MosFet control
void InitMosControl(){
    G_Device_Interface_Status1 &= ~CHG_MOSFET_STATUS;
    G_Device_Interface_Status1 &= ~DSG_MOSFET_STATUS;
    _Device_Init_MosControl_Function();
}
void setMosFET(unsigned char MosFetCode, unsigned char enable){
    if(enable == 0){
        _Device_Set_MosFET(MosFetCode, TurnOff);
        switch(MosFetCode){
            case CHG_MOSFET:
                G_Device_Interface_Status1 &= ~(CHG_MOSFET_STATUS);
                break;
            case DSG_MOSFET:
                G_Device_Interface_Status1 &= ~(DSG_MOSFET_STATUS);
                break;
            default:    break;
        }
    }else{
        _Device_Set_MosFET(MosFetCode, TurnOn);
        switch(MosFetCode){
            case CHG_MOSFET:
                G_Device_Interface_Status1 |= (CHG_MOSFET_STATUS);
                break;
            case DSG_MOSFET:
                G_Device_Interface_Status1 |= (DSG_MOSFET_STATUS);
                break;
            default:    break;
        }
    }
}

////////////////////////////////////////////
// Button control
void InitButtonEvent(){
    G_Device_Interface_Status1 &= ~BUTTON_PRESS;
    _Device_Init_Button_Event_Function();
}
unsigned char GetButtonStatus(){
    if(_Device_Get_Button_Status() == ButtonRelease){
        return ButtonRelease;
    }else{
        return ButtonPress;
    }
}

void Interrupt_Calling_ButtonEvent_Press_Trigger(){
    G_Device_Interface_Status1 |= BUTTON_PRESS;
}



void InitInputSignalPin(){
    G_Device_Interface_Status1 &= ~PIC_UVP_STATUS;
    G_Device_Interface_Status1 &= ~PIC_OVP_STATUS;
}


//void InitOutputSignalPin(){
//  
//}



