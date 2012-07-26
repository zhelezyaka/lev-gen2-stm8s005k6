
/********************************************************************************
* Include																		*
********************************************************************************/

#include "stm8s.h"
#include "lev_global_config.h"



/********************************************************************************
* Define																*
********************************************************************************/
#define true            1
#define false           0

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
///////////////////////////////////////////////////////////////////////
//extern unsigned int G_Device_Action_Controls;
/* Device Action Control Bits , (G_Device_Action_Controls)
 * unsigned int (16 bits)   */
#define BUTTON_PRESS_TRIGGER		(0x0001)    //
#define BUTTON_CLICK				(0x0002)    //
#define BUTTON_LONG_PRESS			(0x0004)    //
#define START_BUTTON_2_FUN_FLAG		(0x0008)    //
#define BUTTON_2_FUN_ENABLE			(0x0010)    //	second function, for example click repert 5 times.
#define URAT_RX_INTERRUPT			(0x0020)    //
#define URAT_RX_A_FRAM				(0x0040)    //	a receive time set as a fram 
 
//#define LED_BLINK				(0x0001)    //Led blink flag at timer b
//#define CHG_MOSFET_STATUS		(0x0002)    //CHG MOSFET Status
//#define DSG_MOSFET_STATUS		(0x0004)    //DSG MOSFET Status
//#define SW_TRIGGER				(0x0008)    //SW Button Edge trigger status
//#define ADC_CONVERSION          (0x0010)    //ADC 12 Conversion Enable                  
//#define CH1_BALANCE				(0x0020)    //channel 1 being balancing
//#define CH2_BALANCE       	    (0x0040)    //channel 2 being balancing
//#define CH3_BALANCE				(0x0080)    //channel 3 being balancing
//#define BUTTON_CLICK            (0x0100)    //BUTTON_CLICK
//#define BUTTON_LONG_PRESS       (0x0200)    //BUTTON_LONG_PRESS                                                             
//#define BUTTON_PRESS			(0x0400)    //BUTTON_PRESS ; set by button interrupt
//#define CHG_MOS_TURNOFF_STABLE  (0x0800)    //CHG MosFet turn off to the stable time falg for mos fail checking
//#define DSG_MOS_TURNOFF_STABLE	(0x1000)    //DSG MosFet turn off to the stable time falg for mos fail checking
//#define CHG_MOS_TURNON_STABLE	(0x2000)    //CHG MosFet turn off to the stable time falg for ADC OC checking
//#define DSG_MOS_TURNON_STABLE   (0x4000)    //DSG MosFet turn off to the stable time falg for ADC OC checking
//#define OCA				          (0x8000)        //Over Charged Alarm

///////////////////////////////////////////////////////////////////////
//extern unsigned int G_Activate_Action_Status;
/* Activate Action Status Bits , (G_Activate_Action_Status)
 * unsigned int (16 bits)   */
#define CHG_MOSFET_STATUS			(0x0001)    //
#define DSG_MOSFET_STATUS			(0x0002)    //
#define ADP_SOC_STATUS				(0x0004)    //
#define URAT_SEND_OUT_PIN			(0x0008)    //
#define PIC_OVP_STATUS				(0x0010)    //
#define PIC_UVP_STATUS				(0x0020)    //



/********************************************************************************
* clk_setup	,peripheral = 4MHz, CLK(CPU) freq = 4Mhz							*
********************************************************************************/
#define dSourceFreqDivided			CLK_PRESCALER_HSIDIV4 //for fMaster freq = 16MHz / 4 = 4MHz, for peripheral device
#define dMCUFreqDivided				CLK_PRESCALER_CPUDIV1 //for MCLK(CPU) freq = 4MHz / 1 = 4MHz

void clk_setup(void);
/********************************************************************************
* tim3_init	16 bit	, for system Main function									*
********************************************************************************/
// freq =4M / dTimer3Divided = 4M / TIM3_PRESCALER_32; 
//period = 1/freq * dTimer3CountValues = 50ms
#define dTimer3Divided				TIM3_PRESCALER_32
#define dTimer3CountValues			6250
#define dTimer3IntervalTimeBase_ms	50
void tim3_init(void);
void delay_cycles(unsigned long cycleCount);

#if defined(_COSMIC_)	
INTERRUPT void TIM3_UPD_OVF_BRK_IRQHandler(void);
#endif

/********************************************************************************
* tim4_init	8 bit																*
********************************************************************************/
// freq =4M / dTimer4Divided = 4M / TIM4_PRESCALER_64; 
//period = 1/freq * dTimer4CountValues = 4ms
#define dTimer4Divided				TIM4_PRESCALER_64
#define dTimer4CountValues			250 //max = 255
#define dTimer4IntervalTimeBase_ms	4
void tim4_init(void);
void delay_ms(unsigned int msCount);

#if defined(_COSMIC_)	
INTERRUPT void TIM4_UPD_OVF_IRQHandler(void);
#endif


/********************************************************************************
* Mos Fet Control_init															*
********************************************************************************/
#define C_MOS_PORT	GPIOC
#define C_MOS_PIN	GPIO_PIN_6
#define D_MOS_PORT	GPIOC
#define D_MOS_PIN	GPIO_PIN_7

void mosfetControl_init(void);
void setMosCHG(unsigned char enable);
void setMosDSG(unsigned char enable);

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
//PWM tim1_init	
void tim1_init(void);
//PWM tim2_init	
void tim2_init(void);
// Test
#define L1_PORT			GPIOC
#define L1_PIN		GPIO_PIN_2
#define L2_PORT			GPIOC
#define L2_PIN		GPIO_PIN_4
void LED_test_init(void);

/********************************************************************************
* Button Control_init															*
********************************************************************************/
#define BUTTON_PORT	GPIOE
#define BUTTON_PIN	GPIO_PIN_5

#define BUTTON_CLICK_MAX_DURATION_MS		1000
#define BUTTON_LONG_PRESS_MS				5000

#define BUTTON_CLICK_MAX_COUNT				(unsigned int)(BUTTON_CLICK_MAX_DURATION_MS / dTimer3IntervalTimeBase_ms)
#define BUTTON_LONG_PRESS_COUNT				(unsigned int)(BUTTON_LONG_PRESS_MS / dTimer3IntervalTimeBase_ms)

#define BUTTON_CLICK_2_FUN_DURATION_MS		1000	// 1sec,按CLick 後1秒，若未再按，就reset 
#define BUTTON_CLICK_2_FUN_COUNT			(unsigned int)(BUTTON_CLICK_2_FUN_DURATION_MS / dTimer3IntervalTimeBase_ms)
#define BUTTON_2_FUN_CLICK_TIME				5

extern unsigned int gButtonPressCount;
extern unsigned int gButtonContinuesClickCount;
extern unsigned int gButtonClick2FunTimeCount;

void button_init(void);
unsigned char getButtonStatus(void);

#if defined(_COSMIC_)	
INTERRUPT void EXTI_PORTE_IRQHandler(void);
#endif


/********************************************************************************
* uart_init																		*
********************************************************************************/
#define UratRXBufferSize	10
#define UratTXBufferSize	50
//#define UratBaudRates		115200
#define UratBaudRates		57600

extern unsigned char Uart_Buffer_Rx[UratRXBufferSize];
extern unsigned int Uart_Rx_index;
extern unsigned char Uart_Buffer_Tx[UratTXBufferSize];
extern unsigned int Uart_Tx_Length;

void uart_init(void);
void Uart_RX_Interrupt(unsigned char enable);
void ClearUratRxBuffer(void);
void ClearUratTxBuffer(void);
void ReceivedDataParse(void);
void SendingParseData(void);

#if defined(_COSMIC_)	
INTERRUPT void URAT2_RX_IRQHandler(void);
#endif
/********************************************************************************
* Utility CRC check										*
********************************************************************************/
//3.5 character times, ((1/BaudRate) * 11 bits * 3.5 char)/timer interval, 
#define UratDataFram_3p5C_Count			1
#define UratDataReceiveFramCount		2	//about 100~150ms, FramCount * timer interval
unsigned int usMBCRC16( unsigned char * pucFrame, unsigned int usLen );

/********************************************************************************
* ADC 10 bit init																		*
********************************************************************************/
// ADC IN
#define ID_PORT		GPIOB
#define ID_PIN		GPIO_PIN_0
#define IC_PORT		GPIOB
#define IC_PIN		GPIO_PIN_1
#define VBAT_PORT	GPIOB
#define VBAT_PIN	GPIO_PIN_2
#define TS1_PORT	GPIOB
#define TS1_PIN		GPIO_PIN_3
#define TS2_PORT	GPIOF
#define TS2_PIN		GPIO_PIN_4

void adc_init(void);

#if defined(_COSMIC_)	
INTERRUPT void ADC1_IRQHandler(void);
#endif

/********************************************************************************
* PIC OV UV init																		*
********************************************************************************/
#define UVP_PORT	GPIOD
#define UVP_PIN		GPIO_PIN_0
#define OVP_PORT	GPIOD
#define OVP_PIN		GPIO_PIN_2
unsigned char getPIC_OVP_Status(void);
unsigned char getPIC_UVP_Status(void);

/********************************************************************************
* ADP SOC Init																		*
********************************************************************************/
void gpio_init(void);

#define ADP_SOC_PORT	GPIOC
#define ADP_SOC_PIN		GPIO_PIN_5
void setADP_SOC(unsigned char enable);


/********************************************************************************
* URAT_OUTPUT_CONTROL Init through SOC Line										*
********************************************************************************/
//for Urat TX continues send out control
#define URAT_OUTPUT_CONTROL_PORT	GPIOD
#define URAT_OUTPUT_CONTROL_PIN		GPIO_PIN_7
void setURAT_OUTPUT_CONTROL_PIN(unsigned char enable);



