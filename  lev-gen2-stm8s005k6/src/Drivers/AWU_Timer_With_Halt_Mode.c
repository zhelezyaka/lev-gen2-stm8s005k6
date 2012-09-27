

#include "stm8s.h"
#include "Devices.h"
//#include "stm8s.h"
//#include "lev_device_define.h"

/********************************************************************************
* Define																		*
********************************************************************************/

/********************************************************************************
* Extern Function																*
********************************************************************************/

/********************************************************************************
* Extern Variable																*
********************************************************************************/

/********************************************************************************
* Golbal Variable																*
********************************************************************************/
/********************************************************************************
* AWU_timer_init	                            								*
********************************************************************************/
#define dAWU_ShorterTimerIntervalTimeBase_ms	AWU_TIMEBASE_64MS
//#define dAWU_ShorterTimerIntervalTimeBase_ms	AWU_TIMEBASE_128MS
//#define dAWU_ShorterTimerIntervalTimeBase_ms	AWU_TIMEBASE_1S
#define dAWU_LongerTimerIntervalTimeBase_ms	    AWU_TIMEBASE_1S

#define Max_AWU_INTERRUPT_Calling_Function  5

void (*Intupt_AWUTimer_ptr_fuc[Max_AWU_INTERRUPT_Calling_Function])();
void empty_awu_timer_fun(){};

/********************************************************************************
* awu_halt_init																		*
********************************************************************************/
void _Device_AWU_HALT_Timer_Init(){
    
    AWU_DeInit();
    // CLK setup
    //設定AWU，和進halt模式時MVR和Flash的電源關閉
    CLK_SlowActiveHaltWakeUpCmd(ENABLE);
    CLK_FastHaltWakeUpCmd(DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, ENABLE);
    FLASH_SetLowPowerMode(FLASH_LPMODE_POWERDOWN);
    
    AWU_Init(dAWU_ShorterTimerIntervalTimeBase_ms);
    //AWU_Init(AWU_TIMEBASE_128MS);
    //AWU_Init(AWU_TIMEBASE_32MS);
    AWU_Cmd(ENABLE);

    for(int i = 0; i < Max_AWU_INTERRUPT_Calling_Function; i++){
        Intupt_AWUTimer_ptr_fuc[i] = empty_awu_timer_fun;
    }
}


void _Device_Disable_AWU_HALT_Timer(){
    AWU_Cmd(DISABLE);
    AWU_DeInit();

    for(int i = 0; i < Max_AWU_INTERRUPT_Calling_Function; i++){
        Intupt_AWUTimer_ptr_fuc[i] = empty_awu_timer_fun;
    }
}
void _Device_Set_AWU_Shorter_Timer_Interval_Time_Base(){
    AWU_Init(dAWU_ShorterTimerIntervalTimeBase_ms);
}
void _Device_Set_AWU_Longer_Timer_Interval_Time_Base(){
    AWU_Init(dAWU_LongerTimerIntervalTimeBase_ms);
}
void _Device_Set_AWU_Interrupt_Timer_Calling_Function(unsigned char fun_index, void (*calling_fun)()){
    if(fun_index >= Max_AWU_INTERRUPT_Calling_Function){
        return;
    }
    Intupt_AWUTimer_ptr_fuc[fun_index] = calling_fun;
}
void _Device_Remove_AWU_Interrupt_Timer_Calling_Function(unsigned char fun_index){
    if(fun_index >= Max_AWU_INTERRUPT_Calling_Function){
        return;
    }
    Intupt_AWUTimer_ptr_fuc[fun_index] = empty_awu_timer_fun;
}


#if defined(_IAR_)	
INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 {
#endif
#if defined(_COSMIC_)	
INTERRUPT void AWU_IRQHandler(void)
{
#endif
    //GPIO_WriteHigh(LED1_PORT, LED1_PIN);
    
    for(int i = 0; i < Max_AWU_INTERRUPT_Calling_Function; i++){
        (*Intupt_AWUTimer_ptr_fuc[i])();
    }

    AWU_GetFlagStatus();
    //GPIO_WriteLow(LED1_PORT, LED1_PIN);
}

