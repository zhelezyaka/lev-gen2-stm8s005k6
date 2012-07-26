
//#include "stm8s.h"
#include "lev_device_define.h"



unsigned char startReceiveCount;
unsigned int UratCRC16;
unsigned int UratCRC16_compute;

/********************************************************************************
* tim3_init	16 bit																*
********************************************************************************/
void tim3_init(void)
{
	//runtime_data.tick = 0;
	TIM3_DeInit();
	TIM3_TimeBaseInit(dTimer3Divided, dTimer3CountValues); // 50ms
	TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);
	TIM3_Cmd(ENABLE);
	
	startReceiveCount = 0;
}

//delay_cycles(10);	//200us at 4MHz
//delay_cycles(20);	//400us at 4MHz
//delay_cycles(30);	//600us at 4MHz
//delay_cycles(40);	//800us at 4MHz
//delay_cycles(50);	//1ms at 4MHz
void delay_cycles(unsigned long cycleCount)
{
	unsigned long count;
	for(count = 0l; count < cycleCount; count++){
	}
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
  
	//runtime_data.tick++;
	//L1_PORT->ODR |= (uint8_t)L1_PIN;
//	GPIO_WriteReverse(D_MOS_PORT, D_MOS_PIN);
	//////////////////////////////////////////////////////////////////////
	// Button Start
	if(G_Device_Action_Controls & BUTTON_PRESS_TRIGGER){
		gButtonPressCount++;
		if(GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN)){
			if(gButtonPressCount >= BUTTON_LONG_PRESS_COUNT){
				G_Device_Action_Controls &= ~BUTTON_PRESS_TRIGGER;
				G_Device_Action_Controls |= BUTTON_LONG_PRESS;
			}
		}else{
			G_Device_Action_Controls &= ~BUTTON_PRESS_TRIGGER;
			if(gButtonPressCount <= BUTTON_CLICK_MAX_COUNT){
				G_Device_Action_Controls |= BUTTON_CLICK;
				G_Device_Action_Controls |= START_BUTTON_2_FUN_FLAG;
				gButtonContinuesClickCount++;
				gButtonClick2FunTimeCount = 0;
			}
			gButtonPressCount = 0;
		}//if(GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN) == SET){
	}//if(G_Device_Action_Controls & BUTTON_PRESS_TRIGGER){
	// Button Stop
	//////////////////////////////////////////////////////////////////////
	
	//////////////////////////////////////////////////////////////////////
	// Button second function count start
	//超出時間未再按，就reset 
	if(G_Device_Action_Controls & START_BUTTON_2_FUN_FLAG){
		gButtonClick2FunTimeCount++;
		if(gButtonClick2FunTimeCount >= BUTTON_CLICK_2_FUN_COUNT){
			G_Device_Action_Controls &= ~START_BUTTON_2_FUN_FLAG;
			gButtonContinuesClickCount = 0;
		}
	}
	if( gButtonContinuesClickCount >= BUTTON_2_FUN_CLICK_TIME){
		G_Device_Action_Controls |= BUTTON_2_FUN_ENABLE;
		gButtonContinuesClickCount = 0;
		G_Device_Action_Controls &= ~START_BUTTON_2_FUN_FLAG;
	}
	// Button second function count stop
	//////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////
	// Get PIC OVP UVP Status	start
	if(getPIC_OVP_Status()){
		G_Activate_Action_Status |= PIC_OVP_STATUS;
	}else{
		G_Activate_Action_Status &= ~PIC_OVP_STATUS;
	}
	if(getPIC_UVP_Status()){
		G_Activate_Action_Status |= PIC_UVP_STATUS;
	}else{
		G_Activate_Action_Status &= ~PIC_UVP_STATUS;
	}
	// Get PIC OVP UVP Status	stop
	//////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////
	// Start Urat receive count	, Start
	if((G_Device_Action_Controls & URAT_RX_INTERRUPT)&&((G_Device_Action_Controls & URAT_RX_A_FRAM)==0)){
		if(startReceiveCount >= UratDataReceiveFramCount){
			//L1_PORT->ODR |= (uint8_t)L1_PIN;
			G_Device_Action_Controls &= ~URAT_RX_INTERRUPT;
			G_Device_Action_Controls |= URAT_RX_A_FRAM;
			startReceiveCount = 0;
			//L1_PORT->ODR &= ~(uint8_t)L1_PIN;
		}
		startReceiveCount++;
	}
	// check CRC16
	if(G_Device_Action_Controls & URAT_RX_A_FRAM){
		UratCRC16 = (unsigned int)(Uart_Buffer_Rx[Uart_Rx_index - 1] << 8) | Uart_Buffer_Rx[Uart_Rx_index - 2];
		UratCRC16_compute = usMBCRC16(Uart_Buffer_Rx, Uart_Rx_index - 2);
		if(UratCRC16_compute == UratCRC16){
			//CRC check ok
			//L1_PORT->ODR |= (uint8_t)L1_PIN;
			ReceivedDataParse();
			//L1_PORT->ODR &= ~(uint8_t)L1_PIN;
		}
		ClearUratRxBuffer();
		G_Device_Action_Controls &= ~URAT_RX_A_FRAM;
	}
	// Start Urat receive count	, Stop
	//////////////////////////////////////////////////////////////////////
		
		
	TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
	
    //L1_PORT->ODR &= (uint8_t)(~L1_PIN);

	return;
}





