
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
#define dTimer3CountValues			6250
#define dTimer3IntervalTimeBase_ms	50

#define Max_INTERRUPT_Calling_Function  5

void (*Intupt_Timer1_ptr_fuc[Max_INTERRUPT_Calling_Function])();
void empty_timer_fun(){};
/********************************************************************************
* tim3_init	16 bit																*
********************************************************************************/
void _Device_Timer3_init(void)
{
	//runtime_data.tick = 0;
	TIM3_DeInit();
	TIM3_TimeBaseInit(dTimer3Divided, dTimer3CountValues); // 50ms
	TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);
	TIM3_Cmd(ENABLE);
	
    for(int i = 0; i < Max_INTERRUPT_Calling_Function; i++){
        Intupt_Timer1_ptr_fuc[i] = empty_timer_fun;
    }
}

void _Device_Set_Interrupt_Timer1_Calling_Function(unsigned char fun_index, void (*calling_fun)()){
    if(fun_index >= Max_INTERRUPT_Calling_Function){
        return;
    }
    Intupt_Timer1_ptr_fuc[fun_index] = calling_fun;
}
void _Device_Remove_Interrupt_Timer1_Calling_Function(unsigned char fun_index){
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
    
    for(int i = 0; i < Max_INTERRUPT_Calling_Function; i++){
        (*Intupt_Timer1_ptr_fuc[i])();
    }

    
	TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
	return;
}

#if 0

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
#endif




