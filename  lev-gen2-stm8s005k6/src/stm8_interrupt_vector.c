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
	{0x82, NonHandledInterrupt}, /* irq0  TLI �~���̰��Ť��_ */
	{0x82, (interrupt_handler_t)AWU_IRQHandler}, /* irq1  AWU �۰ʳ��HALT�Ҧ����_*/
	{0x82, NonHandledInterrupt}, /* irq2  CLK �������*/
	{0x82, NonHandledInterrupt}, /* irq3  EXTI0 �ݤfA�~�����_*/
	{0x82, NonHandledInterrupt}, /* irq4  EXTI1 �ݤfB�~�����_*/
	{0x82, NonHandledInterrupt}, /* irq5  EXTI2 �ݤfC�~�����_*/
	{0x82, NonHandledInterrupt}, /* irq6  EXTI3 �ݤfD�~�����_*/
	{0x82, (interrupt_handler_t)EXTI_PORTE_IRQHandler}, /* irq7  EXTI4 �ݤfE�~�����_*/
	{0x82, NonHandledInterrupt}, /* irq8  CAN RX ���_*/
	{0x82, NonHandledInterrupt}, /* irq9  CAN TX/ER/SC ���_*/
	{0x82, NonHandledInterrupt}, /* irq10 SPI �o�e����*/
	{0x82, NonHandledInterrupt}, /* irq11 TM1 ��s/�W���X/�U���X/Ĳ�o/�b��*/
	{0x82, NonHandledInterrupt}, /* irq12 TM1 ����/���*/
	{0x82, NonHandledInterrupt}, /* irq13 TM2 ��s/�W���X*/
	{0x82, NonHandledInterrupt}, /* irq14 TM2 ����/���*/
	{0x82, (interrupt_handler_t)TIM3_UPD_OVF_BRK_IRQHandler}, /* irq15 TM3 ��s/�W���X*/
	{0x82, NonHandledInterrupt}, /* irq16 TM3 ����/���*/
	{0x82, NonHandledInterrupt}, /* irq17 UART1 �o�e����*/
	{0x82, NonHandledInterrupt}, /* irq18 UART1 �����H�s����*/
	{0x82, NonHandledInterrupt}, /* irq19 I2C I2C���_*/
	{0x82, NonHandledInterrupt}, /* irq20 UART2/3 �o�e����*/
	{0x82, (interrupt_handler_t)URAT2_RX_IRQHandler}, /* irq21 UART2/3 �����H�s����*/
	{0x82, (interrupt_handler_t)ADC1_IRQHandler}, /* irq22 ADC �ഫ����*/
	{0x82, (interrupt_handler_t)TIM4_UPD_OVF_IRQHandler}, /* irq23 TIM4 ��s/�W���X*/
	{0x82, NonHandledInterrupt}, /* irq24 FLASH �s�{����/�T��s�{*/
	{0x82, NonHandledInterrupt}, /* irq25 */
	{0x82, NonHandledInterrupt}, /* irq26 */
	{0x82, NonHandledInterrupt}, /* irq27 */
	{0x82, NonHandledInterrupt}, /* irq28 */
	{0x82, NonHandledInterrupt}, /* irq29 */
};


#endif