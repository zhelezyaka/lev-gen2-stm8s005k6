

/********************************************************************************
* Include																		*
********************************************************************************/
#include "Global_config.h"
#include "Module_Driver_Define.h"
#include "Module_Flash_Information.h"
#include "Module_Variable_Define.h"
#include "Module_Var_Bit_Define.h"


/********************************************************************************
* Define	(could not be modified, because it's base on function define)       *
********************************************************************************/
// Timer 
#define TimerIntervalTimeBase_MS                50  // unit: ms
// PWM Function has 10 setp different frequency and light on and ligh off, so total PWM turn on is LED_PWM_One_Step_CycleTimes * LED_PWM_Whole_Steps
#define LED_PWM_Whole_Steps                     20  //could not be modified, because it's base on function define
/********************************************************************************
* Define	                                                                    *
********************************************************************************/
#define LED_PWM_One_Step_CycleTimes             3   //unit:cycles , 200ms = LED_PWM_One_Step_CycleTimes * TimerIntervalTimeBase_MS
#define LED_Blink_OnOffInterval_CycleTimes      10  //unit:cycles , 500 ms = LED_Blink_OnOffInterval_CycleTimes * TimerIntervalTimeBase_MS
#define Button_Click_CycleTimes                 12  //unit:cycles ,  600 ms = Button_Click_CycleTimes * TimerIntervalTimeBase_MS
#define Button_Long_Press_CycleTimes            100 //unit:cycles , 5 sec = Button_Long_Press_CycleTimes * TimerIntervalTimeBase_MS

#define OC_PROTECTION_CycleTimes                100 //unit:cycles , 5 sec = OC_PROTECTION_CycleTimes * TimerIntervalTimeBase_MS
#define COC_RELEASE_HOLDING_CycleTimes          20  //unit:cycles , 1 sec = COC_RELEASE_HOLDING_CycleTimes * TimerIntervalTimeBase_MS

#define System_1_Sec_Flag_CycleTimes            20  //unit:cycles , 1 sec = System_1_Sec_Flag_CycleTimes * TimerIntervalTimeBase_MS
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
static unsigned char LED_PWM_One_step_Cycle_Counter;
static unsigned char LED_PWM_Steps;
static unsigned char ButtonPressCounter;
static unsigned char DOC_ReleaseCounter;
static unsigned char COC_ReleaseCounter;
static unsigned char COC_ReleaseHoldingCounter;
static unsigned char System_1_Sec_Flag_Counter;

/********************************************************************************
* 															                    *
********************************************************************************/
void InitTimerPollingVariables(){
    
    LED_PWM_One_step_Cycle_Counter = 0;
    LED_PWM_Steps = 0;
    LED_Blink_inverse_Flag = 0;
    
    ButtonPressCounter = 0;
    DOC_ReleaseCounter = 0;
    COC_ReleaseCounter = 0;
    COC_ReleaseHoldingCounter = 0;
    System_1_Sec_Flag_Counter = 0;
//    InitTimer1Function();
//    Set_Interrupt_Timer1_Calling_Function(1, TimerCounterForPolling);
    
}
/********************************************************************************
* 															                    *
********************************************************************************/

void TimerCounterForPolling(){
    
//    if(temp == 0){
//        SetLed_DirectIO_OnOff(LED1, TurnOn);
//    }else{
//        SetLed_DirectIO_OnOff(LED1, TurnOff);
//    }
//    temp ^= 0x01;
    //return;
    
    
    unsigned temp_char1, temp_char2;
    //////////////////////////////////////////////////////////////////////////
    //get LED PWM bit Flag  : (section start)
    temp_char1 = (unsigned char)(G_LED_Interface_Status2 >> 8);
    if(temp_char1 > 0){
        if(LED_PWM_One_step_Cycle_Counter >=LED_PWM_One_Step_CycleTimes){
            LED_PWM_One_step_Cycle_Counter = 0;
            SetLedPWM20Steps(LED_PWM_Steps);
            LED_PWM_Steps++;
            if(LED_PWM_Steps > LED_PWM_Whole_Steps){
                LED_PWM_Steps = 0;
                SetLedPWMFunction(temp_char1, TurnOff);
            }
        }else{
            LED_PWM_One_step_Cycle_Counter++;
        }
    }else{
        LED_PWM_Steps = 0;
        LED_PWM_One_step_Cycle_Counter = 0;
    }
    //get LED PWM bit Flag  : (section stop)
    //////////////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////////////
    //get LED Blink Flag  : (section start)
    temp_char2 = (unsigned char)G_LED_Interface_Status2;
    temp_char2 = temp_char2 & (~temp_char1);   //and with mask PWM to get blink bits
    //Blinking
    if(temp_char2 > 0){
        if(LED_Blink_inverse_Flag == 0){
            SetLed_DirectIO_BITs(temp_char2);
        }else{
            SetLed_DirectIO_BITs(0);
        }
        LED_Blink_inverse_Flag ^= 0x01;
    }
    //get LED Blink Flag  : (section stop)
    //////////////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////////////
    //get light on flag excluding PWM and Blink flag  : (section start)
    temp_char1 = (unsigned char)(G_LED_Interface_Status2 >> 8); // get PWM bits
    temp_char2 = (unsigned char)G_LED_Interface_Status2;        // get Blink bits
    temp_char1 = ~(temp_char1 | temp_char2);    //OR with PWM and Blink to mask
    temp_char2 = (unsigned char)(G_LED_Interface_Status1 >> 8); // get light on bits
    temp_char2 = temp_char1 & temp_char2;
    SetLed_DirectIO_BITs(temp_char2);
//    if(temp_char2 > 0){
//        SetLed_DirectIO_BITs(temp_char2);
//    }else{
//        SetLed_DirectIO_BITs(0);
//    }
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
  
    //////////////////////////////////////////////////////////////////////////
    //DOC Counter : (section start)
    if(G_Device_Interface_Status1 & ENABLE_DOC_COUNTER){
        DOC_ReleaseCounter++;
        if(DOC_ReleaseCounter >= OC_PROTECTION_CycleTimes){
            G_Device_Interface_Status1 |= DOC_COUNTING_FINISH;
            G_Device_Interface_Status1 &= ~ENABLE_DOC_COUNTER;
            DOC_ReleaseCounter = 0;
        }
    }else{
        DOC_ReleaseCounter = 0;
    }
    //DOC Counter : (section stop)
    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    //COC Counter : (section start)
    if(G_Device_Interface_Status1 & ENABLE_COC_COUNTER){
        COC_ReleaseCounter++;
        if(COC_ReleaseCounter >= OC_PROTECTION_CycleTimes){
            G_Device_Interface_Status1 |= COC_COUNTING_FINISH;
            G_Device_Interface_Status1 &= ~ENABLE_COC_COUNTER;
            COC_ReleaseCounter = 0;
        }
    }else{
        COC_ReleaseCounter = 0;
    }
    //COC Counter : (section stop)
    //////////////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////////////
    //COC Holding Counter After Release : (section start)
    if(G_Device_Interface_Status1 & COC_RELEASE_FOR_REPEATED_CHECK){
        COC_ReleaseHoldingCounter++;
        if(COC_ReleaseHoldingCounter >= COC_RELEASE_HOLDING_CycleTimes){
            G_Device_Interface_Status1 &= ~COC_RELEASE_FOR_REPEATED_CHECK;
            COC_ReleaseHoldingCounter = 0;
        }
    }else{
        COC_ReleaseHoldingCounter = 0;
    }
    //COC Holding Counter After Release : (section stop)
    //////////////////////////////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////////////
    //System 1 sec Counter : (section start)
    System_1_Sec_Flag_Counter++;
    if(System_1_Sec_Flag_Counter >= System_1_Sec_Flag_CycleTimes){
        G_Auxiliary_Module_Status |= SYS_1_SEC_FLAG;
        System_1_Sec_Flag_Counter = 0;
    }
    //System 1 sec Counter : (section stop)
    //////////////////////////////////////////////////////////////////////////
    
}
