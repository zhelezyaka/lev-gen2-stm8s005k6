

/********************************************************************************
* include           															*
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
* uart_init																		*
********************************************************************************/
//#define UratBaudRates		115200
#define UratBaudRates		57600

#define SendingTimeOutCycle	1000
/********************************************************************************
* Golbal Variable																*
********************************************************************************/
unsigned int SendingWhileTimeOutCount;

void (*Interrupt_Uart_Receive_ptr_fuc)(unsigned char receiveData);
void empty_uart_receive_fun(unsigned char receiveData){};


/********************************************************************************
* uart_init																		*
********************************************************************************/
void _Device_Init_Uart(void)
{
	UART2_DeInit();
	UART2_Init(UratBaudRates, UART2_WORDLENGTH_8D, UART2_STOPBITS_1, UART2_PARITY_NO, UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TXRX_ENABLE);

	SendingWhileTimeOutCount = 0;
    
    Interrupt_Uart_Receive_ptr_fuc = empty_uart_receive_fun;
	
	//UART2_ITConfig(UART2_IT_RXNE, ENABLE);
	//UART2_ITConfig(UART2_IT_RXNE_OR, ENABLE);
}
void _Device_Set_Uart_RX_Interrupt(unsigned char enable){
  if(enable){
      UART2_ITConfig(UART2_IT_RXNE, ENABLE);
  }else{
      UART2_ITConfig(UART2_IT_RXNE, DISABLE);
  }
}

void _Device_Uart_Send_Data(unsigned int *sendData, unsigned char length){
	unsigned int i;
	unsigned int temp;
	for(i = 0; i < length; i++){
        temp = (*(sendData + i));
        
		UART2_SendData8(temp >> 8); // send high byte first
		SendingWhileTimeOutCount = 0;
		while (UART2_GetFlagStatus(UART2_FLAG_TXE) == RESET){
			if(SendingWhileTimeOutCount >= SendingTimeOutCycle){
				break;
			}
			SendingWhileTimeOutCount++;
		}//while (UART2_GetFlagStatus(UART2_FLAG_TXE) == RESET)
        
		UART2_SendData8(temp);  // send low byte second
		while (UART2_GetFlagStatus(UART2_FLAG_TXE) == RESET){
			if(SendingWhileTimeOutCount >= SendingTimeOutCycle){
				break;
			}
			SendingWhileTimeOutCount++;
		}//while (UART2_GetFlagStatus(UART2_FLAG_TXE) == RESET)
	}//for(i = 0; i < length; i++){
}

void _Device_Set_Interrupt_Uart_Receive_Calling_Function(void (*calling_fun)(unsigned char receiveData)){
    Interrupt_Uart_Receive_ptr_fuc = calling_fun;
}
void _Device_Remove_Interrupt_Uart_Receive_Calling_Function(){
    Interrupt_Uart_Receive_ptr_fuc = empty_uart_receive_fun;
}


//void ReceivedDataParse(){
//	unsigned int length, i, crc;
//	length = Uart_Rx_index - 2;
//	
//	switch(Uart_Buffer_Rx[0]){
//		case 0x90:
//			Uart_Buffer_Tx[0] = 0x00;
//			Uart_Buffer_Tx[1] = 0x11;
//			Uart_Buffer_Tx[2] = 0x22;
//			Uart_Buffer_Tx[3] = 0x33;
//			Uart_Tx_Length = 4;
//			break;
//		default:
//			Uart_Buffer_Tx[0] = 0x80;
//			Uart_Tx_Length = 1;
//			break;
//	}
//	//ClearUratRxBuffer();
//	
////	crc = usMBCRC16(Uart_Buffer_Tx, Uart_Tx_Length);
////	Uart_Buffer_Tx[Uart_Tx_Length] = crc;
////	Uart_Buffer_Tx[Uart_Tx_Length + 1] = crc >> 8;
////	Uart_Tx_Length += 2;
//	
//	
//	SendingParseData();
//}



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
    
    (*Interrupt_Uart_Receive_ptr_fuc)(UART2_ReceiveData8());
//	//uint8_t reg;
//	//L2_PORT->ODR |= (uint8_t)(L2_PIN);
//	//L1_PORT->ODR |= (uint8_t)(L1_PIN);
//	if((G_Device_Action_Controls & URAT_RX_A_FRAM)==0){
//		G_Device_Action_Controls |= URAT_RX_INTERRUPT;
//	}else{
//		//buffer did not be clear
//		// don't receive data to buffer
//		return;
//	}
//	
//	Uart_Buffer_Rx[Uart_Rx_index] = UART2_ReceiveData8();
//	Uart_Rx_index++;
//	if(Uart_Rx_index >= UratRXBufferSize){
//		Uart_Rx_index = 0;
//	}
//	//UART2_SendData8(0x05);
//	//while (UART2_GetFlagStatus(UART2_FLAG_TXE) == RESET);
//
//	UART2_ClearITPendingBit(UART2_IT_RXNE);
//	//L2_PORT->ODR &= (uint8_t)(~L2_PIN);
//	//L1_PORT->ODR &= (uint8_t)(~L1_PIN);
	
	return;
}


