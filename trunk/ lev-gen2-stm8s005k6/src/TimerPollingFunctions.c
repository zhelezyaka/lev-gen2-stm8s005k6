

/********************************************************************************
* Include																		*
********************************************************************************/
#include "Global_config.h"
#include "Module_Driver_Define.h"
#include "Module_Flash_Information.h"
#include "Module_Variable_Define.h"
#include "Module_Var_Bit_Define.h"


/********************************************************************************
* Define																        *
********************************************************************************/
// Timer 
#define TimerIntervalTimeBase_MS                50  // unit: ms
#define LED_PWM_TurnOn_CycleTimes               40  //unit:cycles , 2 sec = LED_PWM_TurnOn_CycleTimes * TimerIntervalTimeBase_MS
#define LED_Blink_OnOffInterval_CycleTimes      10  //unit:cycles , 500 ms = LED_Blink_OnOffInterval_CycleTimes * TimerIntervalTimeBase_MS
#define Button_Click_CycleTimes                 12 //unit:cycles ,  600 ms = Button_Click_CycleTimes * TimerIntervalTimeBase_MS
#define Button_Long_Press_CycleTimes            100 //unit:cycles , 5 sec = Button_Long_Press_CycleTimes * TimerIntervalTimeBase_MS
/********************************************************************************
* Extern Function																*
********************************************************************************/
/********************************************************************************
* Current File Define Function													*
********************************************************************************/
//void GetCurrentValuesAndDirection();

/********************************************************************************
* Extern Variable																*
********************************************************************************/

/********************************************************************************
* Golbal Variable																*
********************************************************************************/


/********************************************************************************
* Local file Variable										                    *
********************************************************************************/
static unsigned char LED_Blink_inverse_Flag;
static unsigned char LED_Blink_Counter;
static unsigned char LED_PWM_Counter;
static unsigned char ButtonPressCounter;

/********************************************************************************
* 															                    *
********************************************************************************/
void InitTimerPollingVariables(){
    
    LED_PWM_Counter = 0;
    LED_Blink_Counter = 0;
    LED_Blink_inverse_Flag = 0;
    ButtonPressCounter = 0;
}
/********************************************************************************
* 															                    *
********************************************************************************/

void TimerCounterForPolling(){
    unsigned temp_char1, temp_char2;
    
    //////////////////////////////////////////////////////////////////////////
    //get LED PWM bit Flag  : (section start)
    temp_char1 = (unsigned char)(G_LED_Interface_Status2 >> 8);
    if(temp_char1 > 0){
        if(LED_PWM_Counter >=LED_PWM_TurnOn_CycleTimes){
            SetLedPWMFunction(temp_char1, TurnOff);
            LED_PWM_Counter = 0;
        }else{
            LED_PWM_Counter++;
        }
    }
    //get LED PWM bit Flag  : (section stop)
    //////////////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////////////
    //get LED Blink Flag  : (section start)
    temp_char2 = (unsigned char)G_LED_Interface_Status2;
    temp_char2 = temp_char2 ^ temp_char1;   //XOR to get blink bits
    //Blinking
    if(temp_char2 > 0){
        if(LED_Blink_inverse_Flag == 0){
            SetLedOnOff(temp_char2, TurnOn);
        }else{
            SetLedOnOff(temp_char2, TurnOff);
        }
        LED_Blink_inverse_Flag ^= 0x01;
    }
    //get LED Blink Flag  : (section stop)
    //////////////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////////////
    //get light on flag excluding PWM and Blink flag  : (section start)
    temp_char1 = (temp_char1 | temp_char2) ^ (unsigned char)(G_LED_Interface_Status1 >> 8);
    if(temp_char1 > 0){
        SetLedOnOff(temp_char1, TurnOn);
    }else{
        SetLedOnOff(All_LED_Bits_Mask, TurnOn);
    }
    //get light on flag excluding PWM and Blink flag  : (section stop)
    //////////////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////////////
    //Button  : (section start)
    if(G_Device_Interface_Status1 & BUTTON_PRESS){
        if(GetButtonStatus() == ButtonPress){
            if(ButtonPressCounter >= Button_Long_Press_CycleTimes){
                G_Device_Interface_Status1 |= BUTTON_LONG_PRESS;
                G_Device_Interface_Status1 &= ~BUTTON_PRESS;
                ButtonPressCounter = 0;
            }else{
                ButtonPressCounter++;
            }
        }else{
            if(ButtonPressCounter <= Button_Click_CycleTimes){
                G_Device_Interface_Status1 |= BUTTON_CLICK;
            }
            G_Device_Interface_Status1 &= ~BUTTON_PRESS;
            ButtonPressCounter = 0;
        }
    }
    //Button  : (section stop)
    //////////////////////////////////////////////////////////////////////////
  

}

