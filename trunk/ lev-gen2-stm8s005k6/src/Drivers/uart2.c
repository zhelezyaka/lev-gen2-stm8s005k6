

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
//#define UratBaudRates		57600
//#define UratBaudRates		38400
#define UratBaudRates		38400

#define SendingTimeOutCycle	1000
#define UratRXBufferSize	16
#define UratRXFrameInternalGapTime	10  // 10 ms
/********************************************************************************
* Golbal Variable																*
********************************************************************************/
static unsigned char Uart_RX_Buffer[UratRXBufferSize + 2];
static unsigned int Uart_RX_Count;


static unsigned int SendingWhileTimeOutCount;

void (*Interrupt_Uart_Receive_frame_ptr_fuc)(unsigned char *receiveData, unsigned int length);


void empty_uart_receive_frame_fun(unsigned char *receiveData, unsigned int length){}

///////////////////////////////////

/********************************************************************************
* uart_init																		*
********************************************************************************/
void _Device_Init_Uart(void)
{
    
    GPIO_Init(URAT_TX_Setting_PORT, URAT_TX_Setting_PIN, GPIO_MODE_OUT_PP_LOW_FAST);    //  normal set as RX Status

    
    _Device_uart_tim4_init();
    
    
	UART2_DeInit();
	UART2_Init(UratBaudRates, UART2_WORDLENGTH_8D, UART2_STOPBITS_1, UART2_PARITY_NO, UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TXRX_ENABLE);

	SendingWhileTimeOutCount = 0;
    
    Uart_RX_Count = 0;
    
    Interrupt_Uart_Receive_frame_ptr_fuc = empty_uart_receive_frame_fun;
	
	//UART2_ITConfig(UART2_IT_RXNE, ENABLE);
	//UART2_ITConfig(UART2_IT_RXNE_OR, ENABLE);
    

}
void _Device_Set_Uart_RX_Interrupt(unsigned char enable){
    if(enable){
        UART2_ClearITPendingBit(UART2_IT_RXNE);
        UART2_ITConfig(UART2_IT_RXNE, ENABLE);
    }else{
        UART2_ITConfig(UART2_IT_RXNE, DISABLE);
        UART2_ClearITPendingBit(UART2_IT_RXNE);
    }
}

void _Device_Uart_Send_Byte(unsigned char *sendByte, unsigned int length){
	unsigned int i;
    
    //GPIO_WriteHigh(LED2_PORT, LED2_PIN);

    
    //set TX status
    GPIO_WriteHigh(URAT_TX_Setting_PORT, URAT_TX_Setting_PIN);
    GPIO_WriteHigh(URAT_TX_Setting_PORT, URAT_TX_Setting_PIN);  //for delay

	for(i = 0; i < length; i++){
		UART2_SendData8((*(sendByte + i))); 
		SendingWhileTimeOutCount = 0;
		//while (UART2_GetFlagStatus(UART2_FLAG_TXE) == RESET){     //Transmit Data Register Empty flag
		while (UART2_GetFlagStatus(UART2_FLAG_TC) == RESET){        //Transmission Complete flag
			if(SendingWhileTimeOutCount >= SendingTimeOutCycle){
				break;
			}
			SendingWhileTimeOutCount++;
		}//while (UART2_GetFlagStatus(UART2_FLAG_TXE) == RESET)
    }
    //disable TX status
    GPIO_WriteLow(URAT_TX_Setting_PORT, URAT_TX_Setting_PIN);
    GPIO_WriteLow(URAT_TX_Setting_PORT, URAT_TX_Setting_PIN);  //for delay
    
    
    //GPIO_WriteLow(LED2_PORT, LED2_PIN);

    
}

void _Device_Set_Uart_Receive_Fram_Data_Calling_Function(void (*calling_fun)(unsigned char *receiveData, unsigned int length)){
    Interrupt_Uart_Receive_frame_ptr_fuc = calling_fun;
}
void Uart_Receive_Frame_Finish_Function(){
    unsigned int length;
    length = Uart_RX_Count;
    Uart_RX_Count = 0;
    //_Device_Set_Uart_RX_Interrupt(DISABLE);
    //(*Interrupt_Uart_Receive_frame_ptr_fuc)(Uart_RX_Buffer, length);
    //_Device_Set_Uart_RX_Interrupt(ENABLE);
    _Device_Uart_Send_Byte(Uart_RX_Buffer, length);
}

void _Device_Remove_Interrupt_Uart_Receive_Frame_Calling_Function(){
    Interrupt_Uart_Receive_frame_ptr_fuc = empty_uart_receive_frame_fun;
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
    
    
	UART2_ClearITPendingBit(UART2_IT_RXNE);
    
    if(Uart_RX_Count < UratRXBufferSize){
        if(UART2->SR &UART2_SR_OR){
            Uart_RX_Buffer[Uart_RX_Count++]= UART2_ReceiveData8();
        }
        Uart_RX_Buffer[Uart_RX_Count++]= UART2_ReceiveData8();
    }else{
        Uart_RX_Buffer[Uart_RX_Count - 1]= UART2_ReceiveData8();
    }
    _Device_Set_Function_to_Timer_counter(UratRXFrameInternalGapTime, Uart_Receive_Frame_Finish_Function);
   
    //_Device_Uart_Send_Byte(Uart_RX_Buffer, 3);
	return;
}


