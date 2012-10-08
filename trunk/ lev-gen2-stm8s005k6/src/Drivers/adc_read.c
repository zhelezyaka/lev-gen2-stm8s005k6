

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
#define NUM_OF_ADC_CHANNEL      6
#define NUM_OF_ADC_CONVERSION  1

//static unsigned char adc_second_scan_flag;
//static unsigned int adc_array_Prt;
static unsigned int ADC_Results[NUM_OF_ADC_CHANNEL];
//static unsigned int ADC_Results[NUM_OF_ADC_CHANNEL][NUM_OF_ADC_CONVERSION];
static unsigned char adc_scan_times_flag;

void (*Intupt_ADC_Finish_ptr_fuc)(void);


void empty_ADC_finish_fun(){}

/********************************************************************************
* adc_init																		*
********************************************************************************/
void adc_channel_init(void){
	//io init
	GPIO_Init(IDSG_PORT, IDSG_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(ICHG_PORT, ICHG_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(VBAT_PORT, VBAT_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(THS1_PORT, THS1_PIN, GPIO_MODE_IN_FL_NO_IT);
	//io init
	GPIO_Init(THS2_PORT, THS2_PIN, GPIO_MODE_IN_FL_NO_IT);

	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_0, ADC1_PRESSEL_FCPU_D18,
			  ADC1_EXTTRIG_GPIO, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3,
			  DISABLE); //ADC1_CONVERSIONMODE_SINGLE
	ADC1_ScanModeCmd(ENABLE);
	//ADC1_ScanModeCmd(DISABLE);
    
    adc_scan_times_flag = 0;

    
}

void adc_4_channel_scan_init(void){
//	//io init
//	GPIO_Init(IDSG_PORT, IDSG_PIN, GPIO_MODE_IN_FL_NO_IT);
//	GPIO_Init(ICHG_PORT, ICHG_PIN, GPIO_MODE_IN_FL_NO_IT);
//	GPIO_Init(VBAT_PORT, VBAT_PIN, GPIO_MODE_IN_FL_NO_IT);
//	GPIO_Init(THS1_PORT, THS1_PIN, GPIO_MODE_IN_FL_NO_IT);
////	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D18,
////			  ADC1_EXTTRIG_GPIO, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3,
////			  DISABLE); //ADC1_CONVERSIONMODE_CONTINUOUS
//	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D18,
//			  ADC1_EXTTRIG_GPIO, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3,
//			  DISABLE); //ADC1_CONVERSIONMODE_SINGLE
//	ADC1_ScanModeCmd(ENABLE);

    /* Clear the ADC1 channels */
    ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
    /* Select the ADC1 channel */
    ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_3);
    
    //ADC1_ScanMode   ENABLE
    ADC1->CR2 |= ADC1_CR2_SCAN;
    
}

void adc_AIN12_channel_init(void){
//	//io init
//	GPIO_Init(THS2_PORT, THS2_PIN, GPIO_MODE_IN_FL_NO_IT);
//    
//	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_12, ADC1_PRESSEL_FCPU_D18,
//			  ADC1_EXTTRIG_GPIO, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3,
//			  DISABLE);
//	ADC1_ScanModeCmd(DISABLE);  //Disable scan mode

    
    /* Clear the ADC1 channels */
    ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
    /* Select the ADC1 channel */
    ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_12);
    //ADC1_ScanMode   DISABLE
    ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
}

void adc_enable_Data_Buffer_and_EOC_interrupt(void){
	ADC1_DataBufferCmd(ENABLE);     //Enable the ADC1 data store into the Data Buffer registers
	ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);   //Enable EOC interrupt
}
////////////////////////////////////////////////////////////////////////////////////
void _Device_Init_ADC_Function(void)
{

    //adc_second_scan_flag = 0;
    adc_scan_times_flag = 0;
    Intupt_ADC_Finish_ptr_fuc = empty_ADC_finish_fun;
        
    //adc_4_channel_scan_init();
    
//    adc_second_scan_flag = 1;
//    adc_AIN12_channel_init();
    
    
    
    adc_channel_init();
    adc_enable_Data_Buffer_and_EOC_interrupt();
    
}

void _Device_Start_ADC_Conversion(){
    adc_channel_init();
    //adc_second_scan_flag = 0;
    adc_scan_times_flag = 0;
    //adc_4_channel_scan_init();
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
	int i;
    if(length > NUM_OF_ADC_CHANNEL){
        length = NUM_OF_ADC_CHANNEL;
    }
    for(  i = 0; i < length; i++){
        valueArray[i] = ADC_Results[i];
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
        //GPIO_WriteHigh(LED1_PORT, LED1_PIN);
	    ADC1_ClearITPendingBit(ADC1_IT_EOC);  //clear end of conversion flag, for one signal channel
        
        switch(adc_scan_times_flag){
            case 0:
                ADC_Results[0] = ADC1_GetBufferValue(0);
                ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH); /* Clear the ADC1 channels */
                ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_1);/* Select the ADC1 channel */
                ADC1_StartConversion();
                break;
            case 1:
                ADC_Results[1] = ADC1_GetBufferValue(1);
                ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH); /* Clear the ADC1 channels */
                ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_2);/* Select the ADC1 channel */
                ADC1_StartConversion();
                break;
            case 2:
                ADC_Results[2] = ADC1_GetBufferValue(2);
                ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH); /* Clear the ADC1 channels */
                ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_3);/* Select the ADC1 channel */
                ADC1_StartConversion();
                break;
            case 3:
                ADC_Results[3] = ADC1_GetBufferValue(3);
                ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH); /* Clear the ADC1 channels */
                ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_4);/* Select the ADC1 channel */
                ADC1_StartConversion();
                break;
            case 4:
                ADC_Results[1] = ADC1_GetBufferValue(1);
                ADC_Results[2] = ADC1_GetBufferValue(2);
                ADC_Results[3] = ADC1_GetBufferValue(3);
                ADC_Results[4] = ADC1_GetBufferValue(4);
                ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH); /* Clear the ADC1 channels */
                ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_12);/* Select the ADC1 channel */
                    
                ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN); //ADC1_ScanMode   DISABLE
                
                ADC1_StartConversion();                
                break;
            case 5:
                ADC_Results[5] = ADC1_GetConversionValue();
                ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH); /* Clear the ADC1 channels */
                ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_0);/* Select the ADC1 channel */
                
                ADC1->CR2 |= ADC1_CR2_SCAN; //ADC1_ScanMode   ENABLE
                adc_scan_times_flag = 0;
                
                (*Intupt_ADC_Finish_ptr_fuc)();
                break;
            default:
                break;
        }
        
        adc_scan_times_flag++;
    
//    if(adc_second_scan_flag == 0){
//        ADC_Results[0] = ADC1_GetBufferValue(0);
//        ADC_Results[1] = ADC1_GetBufferValue(1);
//        ADC_Results[2] = ADC1_GetBufferValue(2);
//        ADC_Results[3] = ADC1_GetBufferValue(3);
//	    //ADC1_ClearITPendingBit(ADC1_IT_EOC);  //clear end of conversion flag, for one signal channel
//        
//        adc_second_scan_flag = 1;
//        adc_AIN12_channel_init();
//        ADC1_StartConversion();
//        //(*Intupt_ADC_Finish_ptr_fuc)();
//    }else{
//        //adc_second_scan_flag = 0;
//        ADC_Results[4] = ADC1_GetConversionValue(); // for AIN12 values
//	    //ADC1_ClearITPendingBit(ADC1_IT_EOC);  //clear end of conversion flag, for one signal channel
//        //adc_4_channel_scan_init();
//        (*Intupt_ADC_Finish_ptr_fuc)();
//
//    }
  
        //GPIO_WriteLow(LED1_PORT, LED1_PIN);
	return;
}