

//#include "stm8s.h"
#include "lev_device_define.h"


#define SendingWhileTimeOutCycle	1000
/********************************************************************************
* Golbal Variable																*
********************************************************************************/
unsigned char Uart_Buffer_Rx[UratRXBufferSize];
unsigned int Uart_Rx_index;

unsigned char Uart_Buffer_Tx[UratTXBufferSize];
unsigned int Uart_Tx_Length;

unsigned int SendingWhileTimeOutCount;


/********************************************************************************
* uart_init																		*
********************************************************************************/
void uart_init(void)
{
	UART2_DeInit();
	UART2_Init(UratBaudRates, UART2_WORDLENGTH_8D, UART2_STOPBITS_1, UART2_PARITY_NO, UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TXRX_ENABLE);

	Uart_Rx_index = 0;
	SendingWhileTimeOutCount = 0;
	
	//UART2_ITConfig(UART2_IT_RXNE, ENABLE);
	//UART2_ITConfig(UART2_IT_RXNE_OR, ENABLE);
}
void Uart_RX_Interrupt(unsigned char enable){
  ClearUratRxBuffer();
  ClearUratTxBuffer();
  UART2_ITConfig(UART2_IT_RXNE, enable);
}
void ClearUratRxBuffer(){
	unsigned int i;
	for(i = 0; i < UratRXBufferSize; i++){
		Uart_Buffer_Rx[i] = 0;
	}
	Uart_Rx_index = 0;
}
void ClearUratTxBuffer(){
	unsigned int i;
	for(i = 0; i < UratTXBufferSize; i++){
		Uart_Buffer_Tx[i] = 0;
	}
	Uart_Tx_Length = 0;
}



void ReceivedDataParse(){
	unsigned int length, i, crc;
	length = Uart_Rx_index - 2;
	
	switch(Uart_Buffer_Rx[0]){
		case 0x90:
			Uart_Buffer_Tx[0] = 0x00;
			Uart_Buffer_Tx[1] = 0x11;
			Uart_Buffer_Tx[2] = 0x22;
			Uart_Buffer_Tx[3] = 0x33;
			Uart_Tx_Length = 4;
			break;
		default:
			Uart_Buffer_Tx[0] = 0x80;
			Uart_Tx_Length = 1;
			break;
	}
	//ClearUratRxBuffer();
	
	crc = usMBCRC16(Uart_Buffer_Tx, Uart_Tx_Length);
	Uart_Buffer_Tx[Uart_Tx_Length] = crc;
	Uart_Buffer_Tx[Uart_Tx_Length + 1] = crc >> 8;
	Uart_Tx_Length += 2;
	
	
	SendingParseData();
}

void SendingParseData(){
	unsigned int i;
	for(i = 0; i < Uart_Tx_Length; i++){
		UART2_SendData8(Uart_Buffer_Tx[i]);
		SendingWhileTimeOutCount = 0;
		while (UART2_GetFlagStatus(UART2_FLAG_TXE) == RESET){
			if(SendingWhileTimeOutCount >= SendingWhileTimeOutCycle){
				break;
			}
			SendingWhileTimeOutCount++;
		}//while (UART2_GetFlagStatus(UART2_FLAG_TXE) == RESET)
	}//for(i = 0; i < Uart_Tx_Length; i++){
	ClearUratTxBuffer();
}
/********************************************************************************
* URAT2_RX_IRQHandler																*
*******************************************************************************/
#if defined(_IAR_)	
 INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 {
#endif
#if defined(_COSMIC_)	
INTERRUPT void URAT2_RX_IRQHandler(void)
{
#endif
	//uint8_t reg;
	//L2_PORT->ODR |= (uint8_t)(L2_PIN);
	//L1_PORT->ODR |= (uint8_t)(L1_PIN);
	if((G_Device_Action_Controls & URAT_RX_A_FRAM)==0){
		G_Device_Action_Controls |= URAT_RX_INTERRUPT;
	}else{
		//buffer did not be clear
		// don't receive data to buffer
		return;
	}
	
	Uart_Buffer_Rx[Uart_Rx_index] = UART2_ReceiveData8();
	Uart_Rx_index++;
	if(Uart_Rx_index >= UratRXBufferSize){
		Uart_Rx_index = 0;
	}
	//UART2_SendData8(0x05);
	//while (UART2_GetFlagStatus(UART2_FLAG_TXE) == RESET);

	UART2_ClearITPendingBit(UART2_IT_RXNE);
	//L2_PORT->ODR &= (uint8_t)(~L2_PIN);
	//L1_PORT->ODR &= (uint8_t)(~L1_PIN);
	
	return;
}


