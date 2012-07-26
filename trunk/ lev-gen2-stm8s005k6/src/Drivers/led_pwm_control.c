
//#include "stm8s.h"
#include "lev_device_define.h"



/********************************************************************************
* tim1_init																		*
********************************************************************************/
void tim1_init(void)
{
	TIM1_DeInit();
	/* Time Base configuration */
	/*
	TIM1_Period = 4095
	TIM1_Prescaler = 0
	TIM1_CounterMode = TIM1_COUNTERMODE_UP
	TIM1_RepetitionCounter = 0
	*/
	TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, 1000, 0);
	/* Channel 1, 2,3 and 4 Configuration in PWM mode */
	/*
	TIM1_OCMode = TIM1_OCMODE_PWM2
	TIM1_OutputState = TIM1_OUTPUTSTATE_ENABLE
	TIM1_OutputNState = TIM1_OUTPUTNSTATE_ENABLE
	TIM1_Pulse = CCR1_Val
	TIM1_OCPolarity = TIM1_OCPOLARITY_LOW
	TIM1_OCNPolarity = TIM1_OCNPOLARITY_HIGH
	TIM1_OCIdleState = TIM1_OCIDLESTATE_SET
	TIM1_OCNIdleState = TIM1_OCIDLESTATE_RESET
	*/
	TIM1_OC1Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
				 500, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
				 TIM1_OCNIDLESTATE_RESET); 
	/*TIM1_Pulse = CCR2_Val*/
	TIM1_OC2Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
				 500, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET, 
				 TIM1_OCNIDLESTATE_RESET);
	/*TIM1_Pulse = CCR3_Val*/
	TIM1_OC3Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
				 500, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
				 TIM1_OCNIDLESTATE_RESET);
	/*TIM1_Pulse = CCR4_Val*/
	TIM1_OC4Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, 500, TIM1_OCPOLARITY_LOW,
				 TIM1_OCIDLESTATE_SET);
	/* TIM1 counter enable */
	TIM1_Cmd(ENABLE);
	/* TIM1 Main Output Enable */
	TIM1_CtrlPWMOutputs(ENABLE);

	return;
}

/********************************************************************************
* tim2_init																		*
********************************************************************************/
void tim2_init(void)
{
	TIM2_DeInit();
	/* Time base configuration */
	TIM2_TimeBaseInit(TIM2_PRESCALER_1, 999); // TIM2 frequency = fMaster / (999 + 1) = 8MHz / 1000 = 8KHz
	/* PWM1 Mode configuration: Channel1 */ 
	TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 500, TIM2_OCPOLARITY_HIGH); // Duty = 500 / prescaler = 500 / 1000 = 0.5 (50%)
	TIM2_OC1PreloadConfig(ENABLE);
	TIM2_ARRPreloadConfig(ENABLE);
	TIM2_Cmd(ENABLE);

	return;
}

/********************************************************************************
* LED I/O Control_init															*
********************************************************************************/
void LED_test_init(void)
{
	GPIO_Init(L1_PORT, L1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(L2_PORT, L2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
}

