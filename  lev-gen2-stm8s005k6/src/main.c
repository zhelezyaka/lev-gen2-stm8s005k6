/********************************************************************************
* Include																		*
********************************************************************************/
#include "Global_config.h"
#include "Module_Driver_Define.h"
#include "SystemInformation\User_Define_Parser.h"
#include "Module_Variable_Define.h"
#include "Module_Var_Bit_Define.h"

/********************************************************************************
* Define																		*
********************************************************************************/

/********************************************************************************
* Extern Function																*
********************************************************************************/
extern unsigned int FirstInitial_Func(void);
extern unsigned int Startup_Func(void);
extern unsigned int Normal_Func(void);
extern unsigned int Failure_Func(void);
extern unsigned int Shutdown_Func(void);
extern unsigned int Shipping_Func(void);
extern unsigned int Calibration_Func(void);
/********************************************************************************
* Extern Variable																*
********************************************************************************/

/********************************************************************************
* Global Variable																*
********************************************************************************/

unsigned int G_Var_Array[GVarArraySize];
unsigned int G_Communication_Array[GVarArraySize + 1 + CheckCodeIntSize];

//unsigned char c1,c1,c2,c4;
//unsigned int test_a[200];
//unsigned int temp_i;
//unsigned long temp_l;
//float temp_f;
/*******************************************************************************/
unsigned char _a_uchar;
unsigned char * _p_uchar;
unsigned int _a_uint;
signed char _a_char;
signed int _a_int;
float _a_float;
main()
{
#if _BURN_IN_EEPROM_SEG_BY_STVD_DEBUG_ > 0 
	/////////////////////////////////////////////////
	// for eeprom Burnning
	test_i = eeprom_uint_array[0];
	/////////////////////////////////////////////////
#endif	
	G_SysModeStatusCode = FirstInitial_Func(); 

  
#if _INITIAL_1_Sec_Delay_ > 0
  //delay 1 sec
  for(int i = 0; i < 1000;i++){
      delay_cycles(100); //about 960us at 4MHz
  }
#else
      //delay_cycles(100); //about 960us at 4MHz
#endif

  
//    for(int j = 0; j < 10;j++){
//        SetLed_DirectIO_BITs(0xff);
//        //delay 1 sec
//        for(int i = 0; i < 100;i++){
//            delay_cycles(100); //about 960us at 4MHz
//        }
//        SetLed_DirectIO_BITs(0);
//        //delay 1 sec
//        for(int i = 0; i < 100;i++){
//            delay_cycles(100); //about 960us at 4MHz
//        }
//    }
    
/*    
_a_uchar = CELL_TYPE_LENGTH                          ;
_p_uchar = &CELL_TYPE                                 ;
_a_uchar = MANUFACTURE_NAME_LENGTH                   ;
_p_uchar = &MANUFACTURE_NAME                          ;
_a_uchar = PRODUCT_NAME_LENGTH                       ;
_p_uchar = &PRODUCT_NAME                              ;
_a_uint = MANUFACTURE_DATE                          ;
_a_uint = VERSION                                   ;
_a_uint = MINOR_VERSION                             ;
_a_uint = SERIAL_NUMBER                             ;
_a_uint = NUMBER_OF_PARALLEL_CELLS                  ;
_a_uint = NUMBER_OF_SERIES_CELLS                    ;
_a_uint = ADC_CURRENT_DETECT_FOR_DSG_STATUS         ;
_a_uint = ADC_CURRENT_DETECT_FOR_CHG_STATUS         ;
_a_uint = ADC_DOC_PROTECTION                        ;
_a_uint = ADC_COC_PROTECTION                        ;
_a_uint = ADC_DSG_HIGH_CURRENT_DETECT               ;
_a_uint = ADC_BATTERY_OV_PROTECTION                 ;
_a_uint = ADC_BATTERY_OV_RELEASE                    ;
_a_uint = ADC_BATTERY_UV_PROTECTION                 ;
_a_uint = ADC_BATTERY_UV_RELEASE                    ;
_a_uint = ADC_DSG_OT_HIGH_PROTECTION                ;
_a_uint = ADC_DSG_OT_HIGH_RELEASE                   ;
_a_uint = ADC_DSG_OT_LOW_PROTECTION                 ;
_a_uint = ADC_DSG_OT_LOW_RELEASE                    ;
_a_uint = ADC_CHG_OT_PROTECTION                     ;
_a_uint = ADC_CHG_OT_RELEASE                        ;
_a_uint = ADC_UT_PROTECTION                         ;
_a_uint = ADC_UT_RELEASE                            ;
_a_uint = MIN_CELL_OV_VOLTAGE_FOR_SOC               ;
_a_uint = MAX_CELL_UV_VOLTAGE_FOR_SOC               ;
_a_float = CHG_mA_To_ADC_Factor                      ;
_a_float = DSG_mA_To_ADC_Factor                      ;
_a_float = VBAT_mV_To_ADC_Factor                     ;
_a_float = Thermistor_mV_To_ADC_Factor               ;
_a_char = CHG_OP_ADC_OFFSET                         ;
_a_char = DSG_OP_ADC_OFFSET                         ;
_a_char = VBAT_ADC_OFFSET                           ;
_a_char = NTC1_ADC_OFFSET                           ;
_a_char = NTC2_ADC_OFFSET                           ;
*/                                                    ;    

	while (1){
		
		switch (G_SysModeStatusCode)
		{
			case StartUp:
				G_SysModeStatusCode = Startup_Func();
				break;  
			
			case NormalMode:
				G_SysModeStatusCode = Normal_Func();
				//Coulomb Counter Stop
				//G_Activate_Action_Status &= ~ACCUMULATING_Q_ENABLE;
				//WriteCoulombCounterDataToFlash();
				break;
			
			case FailureMode:
				//G_SysModeStatusCode = Failure_Func();
				break;
			
			case ShutdownMode:
				G_SysModeStatusCode = Shutdown_Func();
				break;
			
			case CalibrationMode:
				//#if _5LEDs_Thick_TYPE_ > 0
				//G_Activate_Action_Status_Other1 |= Blink_TWO_LED;
				//G_SysModeStatusCode = Calibration_Func();
				//G_Activate_Action_Status_Other1 &= ~Blink_TWO_LED;
				//#else
				//setBlinkLED(ALL_LED_PORT, true);;
				//G_SysModeStatusCode = Calibration_Func();
				//setBlinkLED(ALL_LED_PORT, false);;
				//#endif      
				//break;
			//    case ShippingMode:
			//      G_SysModeStatusCode = Shipping_Func();
			//      break;
			default:
				G_SysModeStatusCode = StartUp;
				break;
		}//switch()
    }//while(1)
  
}// main

