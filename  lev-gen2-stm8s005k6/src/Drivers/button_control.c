

/********************************************************************************
* include file				        											*
********************************************************************************/
#include "stm8s.h"
#include "Devices.h"
//#include "stm8s.h"
//#include "lev_device_define.h"
/********************************************************************************
* extern include file															*
********************************************************************************/
#include "Module_Driver_Define.h"

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


void (*Intupt_Button_ptr_fuc)();
void empty_ButtonEvent_Press_Trigger_fun(){};

/********************************************************************************
* Interrupt sensitivity init_setup																		*
********************************************************************************/
void _Device_Init_Button_Event_Function(void)
{
     GPIO_DeInit(GPIOE);
	// Button
//	GPIO_Init(BUTTON_PORT, GPIO_PIN_0, GPIO_MODE_IN_FL_NO_IT);	
//	GPIO_Init(BUTTON_PORT, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT);	
//	GPIO_Init(BUTTON_PORT, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT);	
//	GPIO_Init(BUTTON_PORT, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT);	
//	GPIO_Init(BUTTON_PORT, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);	
     
     
	GPIO_Init(BUTTON_PORT, BUTTON_PIN, GPIO_MODE_IN_FL_IT);	
	//GPIO_Init(BUTTON_PORT, BUTTON_PIN, GPIO_MODE_IN_FL_NO_IT);	
    
    //ITC_DeInit();
	/* Initialize the Interrupt sensitivity */
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOE, EXTI_SENSITIVITY_RISE_ONLY);
	//EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOE, EXTI_SENSITIVITY_FALL_ONLY);
    
    Intupt_Button_ptr_fuc = empty_ButtonEvent_Press_Trigger_fun;
	
}


unsigned char _Device_Get_Button_Status(){
  return (GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN)== 0)? ButtonRelease : ButtonPress;
}


void _Device_Set_Interrupt_ButtonEvent_Press_Trigger_Function(void (*calling_fun)()){
    Intupt_Button_ptr_fuc = calling_fun;
}
void _Device_Remove_Interrupt_ButtonEvent_Press_Trigger_Function(){
    Intupt_Button_ptr_fuc = empty_ButtonEvent_Press_Trigger_fun;
}

unsigned char aa;
/********************************************************************************
* EXTI_PORTE_IRQHandler															*
*******************************************************************************/
#if defined(_IAR_)	
INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
{
#endif
#if defined(_COSMIC_)	
INTERRUPT void EXTI_PORTE_IRQHandler(void)
{
#endif
    
    //GPIO_WriteHigh(LED1_PORT, LED1_PIN);
	//debounce
    //aa = GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN);
	delay_cycles(5);	//90us at 4MHz
	if(GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN) != RESET)
	{ // press
        (*Intupt_Button_ptr_fuc)();
	}
    //GPIO_WriteHigh(LED1_PORT, LED1_PIN);
    return;
    
}
//
//#if 0
//#if defined(_IAR_)	
//INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
//{
//#endif
//#if defined(_COSMIC_)	
//INTERRUPT void EXTI_PORTE_IRQHandler(void)
//{
//#endif
//	//debounce
//	delay_cycles(5);	//100us at 4MHz
//	if (GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN))
//	{ // press
//		//runtime_data.btn_presstick = runtime_data.tick;
//		//delay_cycles(10);	//200us at 4MHz
//		G_Device_Action_Controls |= BUTTON_PRESS_TRIGGER;
//		gButtonPressCount = 0;
//	}
//	return;
//}
//#endif

