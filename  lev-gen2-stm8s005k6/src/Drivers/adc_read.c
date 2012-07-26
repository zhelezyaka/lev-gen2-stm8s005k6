

//#include "stm8s.h"
#include "lev_device_define.h"

/********************************************************************************
* Define																		*
********************************************************************************/

/********************************************************************************
* Extern Function																*
********************************************************************************/

/********************************************************************************
* Extern Variable																*
********************************************************************************/

/********************************************************************************
* Golbal Variable																*
********************************************************************************/
#define NUM_OF_ADC_CHANNEL      5
#define NUM_OF_ADC_CONVERSION   4

unsigned int ADC_Results[NUM_OF_ADC_CHANNEL][NUM_OF_ADC_CONVERSION];


/********************************************************************************
* adc_init																		*
********************************************************************************/
void adc_init(void)
{
	//io init
	GPIO_Init(ID_PORT, ID_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(IC_PORT, IC_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(VBAT_PORT, VBAT_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(TS1_PORT, TS1_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(TS2_PORT, TS2_PIN, GPIO_MODE_IN_FL_NO_IT);
	
//	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D18,
//			  ADC1_EXTTRIG_GPIO, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3,
//			  DISABLE);
//	ADC1_ScanModeCmd(ENABLE);
	
	//////////////////////////////////////////////////////////////////////////////////
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D18,
			  ADC1_EXTTRIG_GPIO, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3,
			  DISABLE);
	ADC1_ScanModeCmd(ENABLE);
	//////////////////////////////////////////////////////////////////////////////////
//	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_12, ADC1_PRESSEL_FCPU_D18,
//			  ADC1_EXTTRIG_GPIO, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3,
//			  DISABLE);
//	ADC1_ScanModeCmd(DISABLE);
	//////////////////////////////////////////////////////////////////////////////////
	
	ADC1_DataBufferCmd(ENABLE);
	ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
    
    //ADC1_Cmd(DISABLE); //disable ADC,
    
    //ADC1_StartConversion();
}



/********************************************************************************
* ADC1_IRQHandler																*
*******************************************************************************/
#if defined(_IAR_)	
 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 {
#endif
#if defined(_COSMIC_)	
INTERRUPT void ADC1_IRQHandler(void)
{
#endif
    
	L1_PORT->ODR |= (uint8_t)(L1_PIN);
    
    
	G_DSG_ADC = ADC1_GetBufferValue(0);
	G_CHG_ADC = ADC1_GetBufferValue(1);
	G_VBAT_ADC = ADC1_GetBufferValue(2);
	G_Th1_ADC = ADC1_GetBufferValue(3);
//	//G_Th2_ADC = ADC1_GetConversionValue(4);
	

	ADC1_ClearITPendingBit(ADC1_IT_EOC);  //clear end of conversion flag, for one signal channel
  
  
  //ADC1_GetConversionValue(void) // for AIN12 values
  
	L1_PORT->ODR &= (uint8_t)(~L1_PIN);

	return;
}