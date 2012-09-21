

#include "stm8s.h"
#include "Devices.h"
//#include "lev_device_define.h"

/********************************************************************************
* clk_setup	,peripheral = 4MHz, CLK(CPU) freq = 4Mhz							*
********************************************************************************/
// System Clock Setup
#define dSourceFreqDivided			CLK_PRESCALER_HSIDIV4 //for fMaster freq = 16MHz / 4 = 4MHz, for peripheral device
#define dMCUFreqDivided				CLK_PRESCALER_CPUDIV1 //for MCLK(CPU) freq = 4MHz / 1 = 4MHz

/********************************************************************************
* clk_setup																		*
********************************************************************************/
void _Device_System_clk_setup(void)
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
    
//  GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
//  CLK_CCOConfig(CLK_OUTPUT_CPUDIV8);
//    CLK_CCOConfig(CLK_OUTPUT_CPU);
//  CLK_CCOCmd(ENABLE);    
	
}



