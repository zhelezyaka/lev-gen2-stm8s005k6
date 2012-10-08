
#include "stm8s.h"
#include "Devices.h"
//#include "stm8s.h"
//#include "lev_device_define.h"



/********************************************************************************
* tim3_init	16 bit	, for system Main function									*
********************************************************************************/
// freq =4M / dTimer3Divided = 4M / TIM3_PRESCALER_32; 
//period = 1/freq * dTimer3CountValues = 50ms
#define dTimer3Divided				TIM3_PRESCALER_32
//#define dTimer3CountValues			6250
//#define dTimer3IntervalTimeBase_ms	50

#define dTimer3CountValues			8000
#define dTimer3IntervalTimeBase_ms	64

#define Max_INTERRUPT_Calling_Function  5

void (*Intupt_Timer1_ptr_fuc[Max_INTERRUPT_Calling_Function])(void);

void empty_timer_fun(){}
/********************************************************************************
* tim3_init	16 bit																*
********************************************************************************/
void _Device_Timer3_init(void)
{
	int i;
	//runtime_data.tick = 0;
	TIM3_DeInit();
	TIM3_TimeBaseInit(dTimer3Divided, dTimer3CountValues); // 64ms
	TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);
	TIM3_Cmd(ENABLE);
	
    for(  i = 0; i < Max_INTERRUPT_Calling_Function; i++){
        Intupt_Timer1_ptr_fuc[i] = empty_timer_fun;
    }
}
void _Device_Disable_Timer3(void)
{
	int i;
	TIM3_ITConfig(TIM3_IT_UPDATE, DISABLE);
	TIM3_Cmd(DISABLE);
	TIM3_DeInit();
    for(  i = 0; i < Max_INTERRUPT_Calling_Function; i++){
        Intupt_Timer1_ptr_fuc[i] = empty_timer_fun;
    }
}

void _Device_Set_Interrupt_Timer3_Calling_Function(unsigned char fun_index, void (*calling_fun)()){
    if(fun_index >= Max_INTERRUPT_Calling_Function){
        return;
    }
    Intupt_Timer1_ptr_fuc[fun_index] = calling_fun;
}
void _Device_Remove_Interrupt_Timer3_Calling_Function(unsigned char fun_index){
    if(fun_index >= Max_INTERRUPT_Calling_Function){
        return;
    }
    Intupt_Timer1_ptr_fuc[fun_index] = empty_timer_fun;
}
                                                        
/********************************************************************************
* Timer3 Update/Overflow/Break Interrupt routine.								*
*******************************************************************************/
#if defined(_IAR_)	
INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
{
#endif
#if defined(_COSMIC_)	
INTERRUPT void TIM3_UPD_OVF_BRK_IRQHandler(void)
{
#endif
	int i;
    GPIO_WriteHigh(LED2_PORT, LED2_PIN);
	TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
    
    for(  i = 0; i < Max_INTERRUPT_Calling_Function; i++){
        (*Intupt_Timer1_ptr_fuc[i])();
    }

    GPIO_WriteLow(LED2_PORT, LED2_PIN);
	return;
}






