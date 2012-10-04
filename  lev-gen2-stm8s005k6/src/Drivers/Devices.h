
/********************************************************************************
* Include																		*
********************************************************************************/

//#include "stm8s.h"

/********************************************************************************
* Define																*
********************************************************************************/

#define Disable     0
#define Enable      1

#define Data_Fail           0
#define Data_Complete       1
/********************************************************************************
* Enum Define																*
********************************************************************************/
enum Device_Enable
{
  DeviceOff,
  DeviceOn
};
/********************************************************************************
* Golbal Variable																*
********************************************************************************/

/********************************************************************************
* Control Bits Define															*
********************************************************************************/

/********************************************************************************
* Extern Function for Device													*
********************************************************************************/
/********************************************************************************
* clk_setup	,peripheral = 4MHz, CLK(CPU) freq = 4Mhz							*
********************************************************************************/
void _Device_System_clk_setup();

/********************************************************************************
* LED PWM Control_init															*
********************************************************************************/
// PWM Output
#define LED1_PORT	GPIOC
#define LED1_PIN	GPIO_PIN_1
#define LED2_PORT	GPIOC
#define LED2_PIN	GPIO_PIN_2
#define LED3_PORT	GPIOC
#define LED3_PIN	GPIO_PIN_3
#define LED4_PORT	GPIOC
#define LED4_PIN	GPIO_PIN_4
#define LED5_PORT	GPIOD
#define LED5_PIN	GPIO_PIN_4
////PWM tim1_init	
//void tim1_init(void);
////PWM tim2_init	
//void tim2_init(void);
// LED control (checked)
void _Device_Init_Led_Function();
void _Device_Set_Led_PWM_BITs(unsigned char LEDNumBits);
void _Device_Set_Led_PWM_20_Steps(unsigned char LEDNumBits, unsigned char steps);
//void _Device_Set_Led_PWM_20_Steps(unsigned char steps);
void _Device_Set_Led_OnOff_BITs(unsigned char LEDNumBits);
//void _Device_Set_Led_LightOnOff(unsigned char LEDNumCode, unsigned char enable);
void _Device_Set_Led_Pin_OnOff(unsigned char LEDNumPin, unsigned char enable);

/********************************************************************************
* Mos Fet Control_init															*
********************************************************************************/
#define C_MOS_PORT	GPIOC
#define C_MOS_PIN	GPIO_PIN_6
#define D_MOS_PORT	GPIOC
#define D_MOS_PIN	GPIO_PIN_7
//Mos Fet Control
void _Device_Init_MosControl_Function();
void _Device_Set_MosFET(unsigned char MosFetCode, unsigned char enable);
/********************************************************************************
* Button Control_init															*
********************************************************************************/
#define BUTTON_PORT	GPIOE
#define BUTTON_PIN	GPIO_PIN_5
//Button (checked, not ready)
void _Device_Init_Button_Event_Function();
unsigned char _Device_Get_Button_Status();
void _Device_Set_Interrupt_ButtonEvent_Press_Trigger_Function(void (*calling_fun)());
void _Device_Remove_Interrupt_ButtonEvent_Press_Trigger_Function();
//void Interrupt_Calling_ButtonEvent_Release_Trigger();
/********************************************************************************
* PIC OV UV init																		*
********************************************************************************/
#define UVP_PORT	GPIOD
#define UVP_PIN		GPIO_PIN_0
#define OVP_PORT	GPIOD
#define OVP_PIN		GPIO_PIN_2
//Input_Signal_Pin
void _Device_Init_Input_Signal_Pin_Function();
unsigned char _Device_Get_PIC_UVP_Status();
unsigned char _Device_Get_PIC_OVP_Status();

/********************************************************************************
* ADC 10 bit init																*
********************************************************************************/
// ADC IN
#define IDSG_PORT	GPIOB
#define IDSG_PIN	GPIO_PIN_0
#define ICHG_PORT	GPIOB
#define ICHG_PIN	GPIO_PIN_1
#define VBAT_PORT	GPIOB
#define VBAT_PIN	GPIO_PIN_2
#define THS1_PORT	GPIOB
#define THS1_PIN	GPIO_PIN_3
#define THS2_PORT	GPIOF
#define THS2_PIN	GPIO_PIN_4
//ADC Function
void _Device_Init_ADC_Function();
void _Device_Start_ADC_Conversion();
void _Device_Stop_ADC_Conversion();
void _Device_Set_Interrupt_ADC_Conversion_Finish_Function(void (*calling_fun)());
void _Device_Remove_Interrupt_ADC_Conversion_Finish_Function();
void _Device_Get_ADC_Conversion_Values(unsigned int *valueArray, unsigned char length);

//unsigned int _Device_Get_CHG_ADC_Values();
//unsigned int _Device_Get_DSG_ADC_Values();
//unsigned int _Device_Get_VBAT_ADC_Values();
//unsigned int _Device_Get_Thermal1_ADC_Values();
//unsigned int _Device_Get_Thermal2_ADC_Values();

/********************************************************************************
* Timer 3 init  																*
********************************************************************************/
//Timer3 function (checked)
void _Device_Timer3_init();
void _Device_Disable_Timer3(void);
void _Device_Set_Interrupt_Timer3_Calling_Function(unsigned char fun_index, void (*calling_fun)());
void _Device_Remove_Interrupt_Timer3_Calling_Function(unsigned char fun_index);

/********************************************************************************
* AWU Timer init  																*
********************************************************************************/
void _Device_AWU_HALT_Timer_Init();
void _Device_Disable_AWU_HALT_Timer();
void _Device_Set_AWU_Shorter_Timer_Interval_Time_Base();
void _Device_Set_AWU_Longer_Timer_Interval_Time_Base();
void _Device_Set_AWU_Interrupt_Timer_Calling_Function(unsigned char fun_index, void (*calling_fun)());
void _Device_Remove_AWU_Interrupt_Timer_Calling_Function(unsigned char fun_index);

/********************************************************************************
* ADP SOC Init																	*
********************************************************************************/
#define ADP_SOC_PORT	GPIOC
#define ADP_SOC_PIN		GPIO_PIN_5
void _Device_Init_Adapter_Output_Signal_Pin_Function(void);
void _Device_Set_ADP_SOC(unsigned char enable);

/********************************************************************************
* Uart2 Init																	*
********************************************************************************/
#define URAT_TX_Setting_PORT	GPIOD
#define URAT_TX_Setting_PIN	    GPIO_PIN_3

void _Device_Init_Uart(void);
void _Device_Set_Uart_RX_Interrupt(unsigned char enable);
void _Device_Uart_Send_Byte(unsigned char *sendByte, unsigned int length);
void _Device_Set_Uart_Receive_Fram_Data_Calling_Function(void (*calling_fun)(unsigned char *receiveData, unsigned int length));
void _Device_Remove_Interrupt_Uart_Receive_Frame_Calling_Function();
//////// four urat I/O Control TX/RX

//////// four urat data frame
void _Device_uart_tim4_init(void);
void _Device_Set_Function_to_Timer_counter(unsigned int count, void (*counterFinishCallingFun)(void));
void _Device_Set_Uart_Timer_Disable();

/********************************************************************************
* EEPROM Init																	*
********************************************************************************/
#define Eeprom_segment_Size			128  // bytes
#define Eeprom_segment_Start_Add	0x4000// address
#define Eeprom_segment_End_Add		0x407F// address

void _Device_EEPROM_Init();
unsigned char _Device_EEPROM_WriteByte(unsigned int Address_Offset, unsigned char Data);
unsigned char _Device_EEPROM_WriteDoubleWord(unsigned int Address_Offset, unsigned long Data);
unsigned char _Device_EEPROM_WriteWholeEEPROMMemory(unsigned char *array, unsigned char length);
unsigned char _Device_EEPROM_ReadWholeEEPROMMemory(unsigned char *array, unsigned char length);
unsigned char _Device_EEPROM_ReadWholeEEPROMToInternalMemory();
unsigned char _Device_EEPROM_Set_Data_ToInternalMemory(unsigned char offset, unsigned char *array, unsigned char length);
unsigned char _Device_EEPROM_WriteWholeEEPROMFromInternalMemory();




