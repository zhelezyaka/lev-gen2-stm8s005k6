

#include "stm8s.h"
#include "Devices.h"
//#include "stm8s.h"
//#include "lev_device_define.h"

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
#define NUM_OF_ADC_CONVERSION  1

static unsigned char adc_second_scan_flag;
//static unsigned int adc_array_Prt;
static unsigned int ADC_Results[NUM_OF_ADC_CHANNEL];
//static unsigned int ADC_Results[NUM_OF_ADC_CHANNEL][NUM_OF_ADC_CONVERSION];

void (*Intupt_ADC_Finish_ptr_fuc)();
void empty_ADC_finish_fun(){};

/********************************************************************************
* adc_init																		*
********************************************************************************/
void adc_4_channel_scan_init(){
	//io init
	GPIO_Init(IDSG_PORT, IDSG_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(ICHG_PORT, ICHG_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(VBAT_PORT, VBAT_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(THS1_PORT, THS1_PIN, GPIO_MODE_IN_FL_NO_IT);
//	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D18,
//			  ADC1_EXTTRIG_GPIO, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3,
//			  DISABLE); //ADC1_CONVERSIONMODE_CONTINUOUS
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D18,
			  ADC1_EXTTRIG_GPIO, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3,
			  DISABLE); //ADC1_CONVERSIONMODE_SINGLE
	ADC1_ScanModeCmd(ENABLE);
    
}

void adc_AIN12_channel_init(){
	//io init
	GPIO_Init(THS2_PORT, THS2_PIN, GPIO_MODE_IN_FL_NO_IT);
    
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_12, ADC1_PRESSEL_FCPU_D18,
			  ADC1_EXTTRIG_GPIO, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3,
			  DISABLE);
	ADC1_ScanModeCmd(DISABLE);  //Disable scan mode

}

void adc_enable_Data_Buffer_and_EOC_interrupt(){
	ADC1_DataBufferCmd(ENABLE);     //Enable the ADC1 data store into the Data Buffer registers
	ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);   //Enable EOC interrupt
}
////////////////////////////////////////////////////////////////////////////////////
void _Device_Init_ADC_Function(void)
{

    adc_second_scan_flag = 0;
    
    Intupt_ADC_Finish_ptr_fuc = empty_ADC_finish_fun;
        
    adc_4_channel_scan_init();
    
//    adc_second_scan_flag = 1;
//    adc_AIN12_channel_init();
    
    adc_enable_Data_Buffer_and_EOC_interrupt();
    
}

void _Device_Start_ADC_Conversion(){
    adc_second_scan_flag = 0;
    adc_4_channel_scan_init();
    ADC1_StartConversion();
}

void _Device_Stop_ADC_Conversion(){
    ADC1_Cmd(DISABLE); //disable ADC,//Close conversion
	ADC1_ITConfig(ADC1_IT_EOCIE, DISABLE);   //Disable EOC interrupt
}

void _Device_Set_Interrupt_ADC_Conversion_Finish_Function(void (*calling_fun)()){
    Intupt_ADC_Finish_ptr_fuc = calling_fun;
}
void _Device_Remove_Interrupt_ADC_Conversion_Finish_Function(){
    Intupt_ADC_Finish_ptr_fuc = empty_ADC_finish_fun;
}

void _Device_Get_ADC_Conversion_Values(unsigned int *valueArray, unsigned char length){
    if(length > NUM_OF_ADC_CHANNEL){
        length = NUM_OF_ADC_CHANNEL;
    }
    for(int i = 0; i < length; i++){
        valueArray[i] = ADC_Results[0];
    }
}

//
//unsigned int    G_DSG_ADC;
//unsigned int	G_CHG_ADC;
//unsigned int	G_VBAT_ADC;
//unsigned int	G_TH1_ADC;
//unsigned int	G_TH2_ADC;
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
        GPIO_WriteHigh(LED1_PORT, LED1_PIN);
	    ADC1_ClearITPendingBit(ADC1_IT_EOC);  //clear end of conversion flag, for one signal channel
    
    if(adc_second_scan_flag == 0){
        ADC_Results[0] = ADC1_GetBufferValue(0);
        ADC_Results[1] = ADC1_GetBufferValue(1);
        ADC_Results[2] = ADC1_GetBufferValue(2);
        ADC_Results[3] = ADC1_GetBufferValue(3);
	    //ADC1_ClearITPendingBit(ADC1_IT_EOC);  //clear end of conversion flag, for one signal channel
        
        adc_second_scan_flag = 1;
        adc_AIN12_channel_init();
        ADC1_StartConversion();
    }else{
        //adc_second_scan_flag = 0;
        ADC_Results[4] = ADC1_GetConversionValue(); // for AIN12 values
	    //ADC1_ClearITPendingBit(ADC1_IT_EOC);  //clear end of conversion flag, for one signal channel
        //adc_4_channel_scan_init();
        (*Intupt_ADC_Finish_ptr_fuc)();

    }
  
        GPIO_WriteLow(LED1_PORT, LED1_PIN);
	return;
}