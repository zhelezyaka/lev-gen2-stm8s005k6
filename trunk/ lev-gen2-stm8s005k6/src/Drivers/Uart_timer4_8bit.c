

#include "stm8s.h"
#include "Devices.h"
//#include "stm8s.h"
//#include "lev_device_define.h"
/********************************************************************************
* tim4_init	8 bit																*
********************************************************************************/
// freq =4M / dTimer4Divided = 4M / TIM4_PRESCALER_64; 
//period = 1/freq * dTimer4CountValues = 4ms
#define dTimer4Divided				TIM4_PRESCALER_64
#define dTimer4CountValues			62 //max = 255
#define dTimer4IntervalTimeBase_ms	1


//extern unsigned char Receive_Fram_TimeOut_Flag;
//
void (*Intupt_Timer_Finish_ptr_fuc)(void);
unsigned int Set_Timers_Cycle_Count;
unsigned int Timers_Cycle_Count;
void empty_Timer_finish_fun(){}
/********************************************************************************
* tim4_init	8 bit,  1 ms delay													*
********************************************************************************/
void _Device_uart_tim4_init(void)
{
	Timers_Cycle_Count = 0;
    Set_Timers_Cycle_Count = 0;
    Intupt_Timer_Finish_ptr_fuc = empty_Timer_finish_fun;
    
    TIM4_DeInit();
	TIM4_TimeBaseInit(dTimer4Divided, dTimer4CountValues); // 1ms
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
//	TIM4_Cmd(ENABLE);
    
}

void _Device_Set_Function_to_Timer_counter(unsigned int count, void (*counterFinishCallingFun)(void)){

    Set_Timers_Cycle_Count = count;
    Intupt_Timer_Finish_ptr_fuc = counterFinishCallingFun;
    Timers_Cycle_Count = 0;
    TIM4_Cmd(ENABLE);

}
void _Device_Set_Uart_Timer_Disable(void){
    Intupt_Timer_Finish_ptr_fuc = empty_Timer_finish_fun;
    TIM4_Cmd(DISABLE);
    Timers_Cycle_Count = 0;
}

/********************************************************************************
* TIM4_UPDATE_OVFLOW_IRQHandler													*
*******************************************************************************/
#if defined(_IAR_)	
 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 {
#endif
#if defined(_COSMIC_)	
INTERRUPT void TIM4_UPD_OVF_IRQHandler(void)
{
#endif

	
    //GPIO_WriteHigh(LED1_PORT, LED1_PIN);
    if(Timers_Cycle_Count >= Set_Timers_Cycle_Count){
        Timers_Cycle_Count = 0;
        TIM4_Cmd(DISABLE);
        Intupt_Timer_Finish_ptr_fuc();
    }else{
        Timers_Cycle_Count++;
    }

    //GPIO_WriteLow(LED1_PORT, LED1_PIN);
	
	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);

	return;
}


