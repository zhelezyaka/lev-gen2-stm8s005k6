

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
#define TimerIntervalTimeBase_MS                64  // unit: ms
// PWM Function has 10 setp different frequency and light on and ligh off, so total PWM turn on is LED_PWM_One_Step_CycleTimes * LED_PWM_Whole_Steps
#define LED_PWM_Whole_Steps                     20  //could not be modified, because it's base on function define
/********************************************************************************
* Define	                                                                    *
********************************************************************************/
#define LED_PWM_One_Step_CycleTimes             3   //unit:cycles , 150ms = LED_PWM_One_Step_CycleTimes * TimerIntervalTimeBase_MS
#define LED_Blink_OnOffInterval_CycleTimes      8  //unit:cycles , 500 ms = LED_Blink_OnOffInterval_CycleTimes * TimerIntervalTimeBase_MS
#define Button_Click_CycleTimes                 9  //unit:cycles ,  600 ms = Button_Click_CycleTimes * TimerIntervalTimeBase_MS
#define Button_Long_Press_CycleTimes            78 //unit:cycles , 5 sec = Button_Long_Press_CycleTimes * TimerIntervalTimeBase_MS

#define Button_MultiClick_DetectionCycleTimes   46  //unit:cycles ,  3 sec = Button_DoubleClick_IntervalCycleTimes * TimerIntervalTimeBase_MS

#define OC_PROTECTION_CycleTimes                100 //unit:cycles , 5 sec = OC_PROTECTION_CycleTimes * TimerIntervalTimeBase_MS

/* 
    COC_RELEASE_HOLDING_CycleTimes
    must biger than CHG_OC_Protection_Delay_Cycle
    for COC_RELEASE_FOR_REPEATED_CHECK
*/
#define COC_RELEASE_HOLDING_CycleTimes          18  //unit:cycles , 1.15 sec = COC_RELEASE_HOLDING_CycleTimes * TimerIntervalTimeBase_MS
//#define COC_RELEASE_HOLDING_CycleTimes        (CHG_OC_Protection_Delay_Cycle+3)  //unit:cycles , 1 sec = COC_RELEASE_HOLDING_CycleTimes * TimerIntervalTimeBase_MS


#define System_1_Sec_Flag_CycleTimes            15  //unit:cycles , 1 sec = System_1_Sec_Flag_CycleTimes * TimerIntervalTimeBase_MS
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
static unsigned char ButtonMultiPressCounter;
////////////////////////////////
static unsigned char AUX1_Settting_CycleTimes;
static unsigned char AUX1_Counter;

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
    ButtonMultiPressCounter = 0;
    
    
    //////////////////////////
    AUX1_Settting_CycleTimes = 0;
    AUX1_Counter = 0;
//    InitTimerFunction();
//    Set_Interrupt_Timer_Calling_Function(1, TimerCounterForPolling);
    
}
/********************************************************************************
* 															                    *
********************************************************************************/
void Set_Aux1_Counter_Cycles(unsigned char cycles){
    AUX1_Settting_CycleTimes = cycles;
    G_Add_Device_Interface_Status &= ~ENABLE_AUX1_COUNTER;
    G_Add_Device_Interface_Status &= ~AUX1_COUNTING_FINISH;
}
void Reset_Aux1_Counter(){
    AUX1_Counter = 0;
    G_Add_Device_Interface_Status &= ~ENABLE_AUX1_COUNTER;
    G_Add_Device_Interface_Status &= ~AUX1_COUNTING_FINISH;
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
                G_Device_Interface_Status1 |= BUTTON_CLICK_For_Polling;
            }
            G_Device_Interface_Status1 &= ~BUTTON_PRESS;
            ButtonPressCounter = 0;
        }
    }
    if(G_Add_Device_Interface_Status & ENABLE_MULTI_CLICK_COUNTER){
        ButtonMultiPressCounter++;
        if(ButtonMultiPressCounter >= Button_MultiClick_DetectionCycleTimes){
            G_Add_Device_Interface_Status &= ~ENABLE_MULTI_CLICK_COUNTER;
            //G_Add_Device_Interface_Status |= MULTI_CLICK_COUNTING_FINISH;
            ButtonMultiPressCounter = 0;
        }
    }else{
        ButtonMultiPressCounter = 0;
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
 
    //////////////////////////////////////////////////////////////////////////
    //AUX1 Counter : (section start)
    if(G_Add_Device_Interface_Status & ENABLE_AUX1_COUNTER){
        AUX1_Counter++;
        if(AUX1_Counter >= AUX1_Settting_CycleTimes){
            G_Add_Device_Interface_Status |= AUX1_COUNTING_FINISH;
            G_Add_Device_Interface_Status &= ~ENABLE_AUX1_COUNTER;
            AUX1_Counter = 0;
        }
    }else{
        AUX1_Counter = 0;
    }
    //AUX1 Counter : (section stop)
    //////////////////////////////////////////////////////////////////////////

}
