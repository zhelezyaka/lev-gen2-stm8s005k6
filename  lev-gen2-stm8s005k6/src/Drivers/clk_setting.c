

//#include "stm8s.h"
#include "lev_device_define.h"

/********************************************************************************
* clk_setup																		*
********************************************************************************/
void clk_setup(void)
{
	CLK_HSIPrescalerConfig(dSourceFreqDivided); // fMaster, speed 16MHz / 4 = 4MHz, for peripheral device
	CLK_SYSCLKConfig(dMCUFreqDivided); // CPU speed, 4MHz / 1 = 4MHz
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	// V_BAT, T_SENSOR, I_CHARGE, I_DISCHARGE
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
	// LED 1 ~ 4, PWM
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
	// LED 0, PWM
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
	// tick
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
	// UART
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, ENABLE);
	
}



