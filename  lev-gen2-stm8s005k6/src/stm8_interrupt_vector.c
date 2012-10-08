/*	BASIC INTERRUPT VECTOR TABLE FOR STM8 devices
 *	Copyright (c) 2007 STMicroelectronics
 */

#include "Drivers\devices.h"

#if defined(_COSMIC_)	

typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	unsigned char interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

@far @interrupt void NonHandledInterrupt (void)
{
	/* in order to detect unexpected events during development, 
	   it is recommended to set a breakpoint on the following instruction
	*/
	return;
}

extern void _stext();     /* startup routine */

struct interrupt_vector const _vectab[] = {
	{0x82, (interrupt_handler_t)_stext}, /* reset */
	{0x82, NonHandledInterrupt}, /* trap  */
	{0x82, NonHandledInterrupt}, /* irq0  TLI 外部最高級中斷 */
	{0x82, (interrupt_handler_t)AWU_IRQHandler}, /* irq1  AWU 自動喚醒HALT模式中斷*/
	{0x82, NonHandledInterrupt}, /* irq2  CLK 時鐘控制器*/
	{0x82, NonHandledInterrupt}, /* irq3  EXTI0 端口A外部中斷*/
	{0x82, NonHandledInterrupt}, /* irq4  EXTI1 端口B外部中斷*/
	{0x82, NonHandledInterrupt}, /* irq5  EXTI2 端口C外部中斷*/
	{0x82, NonHandledInterrupt}, /* irq6  EXTI3 端口D外部中斷*/
	{0x82, (interrupt_handler_t)EXTI_PORTE_IRQHandler}, /* irq7  EXTI4 端口E外部中斷*/
	{0x82, NonHandledInterrupt}, /* irq8  CAN RX 中斷*/
	{0x82, NonHandledInterrupt}, /* irq9  CAN TX/ER/SC 中斷*/
	{0x82, NonHandledInterrupt}, /* irq10 SPI 發送完成*/
	{0x82, NonHandledInterrupt}, /* irq11 TM1 更新/上溢出/下溢出/觸發/剎車*/
	{0x82, NonHandledInterrupt}, /* irq12 TM1 捕獲/比較*/
	{0x82, NonHandledInterrupt}, /* irq13 TM2 更新/上溢出*/
	{0x82, NonHandledInterrupt}, /* irq14 TM2 捕獲/比較*/
	{0x82, (interrupt_handler_t)TIM3_UPD_OVF_BRK_IRQHandler}, /* irq15 TM3 更新/上溢出*/
	{0x82, NonHandledInterrupt}, /* irq16 TM3 捕獲/比較*/
	{0x82, NonHandledInterrupt}, /* irq17 UART1 發送完成*/
	{0x82, NonHandledInterrupt}, /* irq18 UART1 接收寄存器滿*/
	{0x82, NonHandledInterrupt}, /* irq19 I2C I2C中斷*/
	{0x82, NonHandledInterrupt}, /* irq20 UART2/3 發送完成*/
	{0x82, (interrupt_handler_t)URAT2_RX_IRQHandler}, /* irq21 UART2/3 接收寄存器滿*/
	{0x82, (interrupt_handler_t)ADC1_IRQHandler}, /* irq22 ADC 轉換結束*/
	{0x82, (interrupt_handler_t)TIM4_UPD_OVF_IRQHandler}, /* irq23 TIM4 更新/上溢出*/
	{0x82, NonHandledInterrupt}, /* irq24 FLASH 編程結束/禁止編程*/
	{0x82, NonHandledInterrupt}, /* irq25 */
	{0x82, NonHandledInterrupt}, /* irq26 */
	{0x82, NonHandledInterrupt}, /* irq27 */
	{0x82, NonHandledInterrupt}, /* irq28 */
	{0x82, NonHandledInterrupt}, /* irq29 */
};


#endif