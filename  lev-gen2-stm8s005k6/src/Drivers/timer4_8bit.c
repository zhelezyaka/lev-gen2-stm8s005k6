

//#include "stm8s.h"
#include "lev_device_define.h"


/********************************************************************************
* tim4_init	8 bit,  1 ms delay													*
********************************************************************************/
void tim4_init(void)
{
	//runtime_data.tick = 0;
	TIM4_DeInit();
	TIM4_TimeBaseInit(dTimer4Divided, dTimer4CountValues); // 5ms
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	TIM4_Cmd(ENABLE);
}

void delay_ms(unsigned int msCount)
{
	
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
	//runtime_data.tick++;
	//L1_PORT->ODR |= (uint8_t)L1_PIN;
	//GPIO_WriteReverse(D_MOS_PORT, D_MOS_PIN);
	if(G_Device_Action_Controls & BUTTON_PRESS_TRIGGER){
		gButtonPressCount++;
		if(GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN) == SET){
			
			
		}//if(GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN) == SET){
		
		if(GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN) == RESET ){
			if(gButtonPressCount <= BUTTON_CLICK_MAX_DURATION_MS){
				G_Device_Action_Controls &= ~BUTTON_PRESS_TRIGGER;
				G_Device_Action_Controls |= BUTTON_CLICK;
			}
		}//if(GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN) == RESET ){
		
	}
	
	
	
	
	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	
    //L1_PORT->ODR &= (uint8_t)(~L1_PIN);

	return;
}


