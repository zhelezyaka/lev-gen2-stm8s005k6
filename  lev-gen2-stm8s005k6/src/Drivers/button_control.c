

//#include "stm8s.h"
#include "lev_device_define.h"

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
unsigned int gButtonPressCount;
unsigned int gButtonContinuesClickCount;
unsigned int gButtonClick2FunTimeCount;

/********************************************************************************
* Interrupt sensitivity init_setup																		*
********************************************************************************/
void button_init(void)
{
	// Button
	GPIO_Init(BUTTON_PORT, BUTTON_PIN, GPIO_MODE_IN_FL_IT);	
	/* Initialize the Interrupt sensitivity */
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOE, EXTI_SENSITIVITY_RISE_ONLY);
	
	gButtonPressCount = 0;
	gButtonContinuesClickCount = 0;
	gButtonClick2FunTimeCount = 0;
	
}


unsigned char getButtonStatus(){
  return (GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN)== 0)? false : true;
}


/********************************************************************************
* EXTI_PORTB_IRQHandler															*
*******************************************************************************/
#if defined(_IAR_)	
INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
{
#endif
#if defined(_COSMIC_)	
INTERRUPT void EXTI_PORTE_IRQHandler(void)
{
#endif
	//debounce
	delay_cycles(5);	//100us at 4MHz
	if (GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN))
	{ // press
		//runtime_data.btn_presstick = runtime_data.tick;
		//delay_cycles(10);	//200us at 4MHz
		G_Device_Action_Controls |= BUTTON_PRESS_TRIGGER;
		gButtonPressCount = 0;
	}
	return;
}
