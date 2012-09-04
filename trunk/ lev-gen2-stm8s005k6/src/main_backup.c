#if 0


/* MAIN.C file
 * 
 * Copyright (c) Dynapack
 */
/********************************************************************************
* Include																		*
********************************************************************************/
#include "lev_global_config.h"
#include "lev_device_define.h"
#include "Main_Enumeration_define.h"
#include "EEPROM_Setting\SystemInformation.h"

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

unsigned int G_Var_Array[GVARArraySize];
unsigned char c1,c1,c2,c4;

unsigned int test_a[200];

unsigned int temp_i;
unsigned long temp_l;
float temp_f;
/*******************************************************************************/
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
  //delay 2 sec
  for(int i = 0; i < 1000;i++){
	delay_cycles(50);	//1ms at 4MHz
  }
#else
	delay_cycles(50);	//1ms at 4MHz
#endif


	while (1){
		
		switch (G_SysModeStatusCode)
		{
			case StartUp:
				G_SysModeStatusCode = Startup_Func();
				break;
			
			case NormalMode:
				//G_SysModeStatusCode = Normal_Func();
				//Coulomb Counter Stop
				//G_Activate_Action_Status &= ~ACCUMULATING_Q_ENABLE;
				//WriteCoulombCounterDataToFlash();
				break;
			
			case FailureMode:
				//G_SysModeStatusCode = Failure_Func();
				break;
			
			case ShutdownMode:
				//G_SysModeStatusCode = Shutdown_Func();
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

		
		
/*		
		//L1_PORT->ODR |= (uint8_t)L1_PIN;
		c1 = GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN);
		c2 = GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN);
		c2 = SET;
		c2 = RESET;
		//L1_PORT->ODR &= (uint8_t)(~L1_PIN);
*/	
		delay_cycles(500);	//10ms at 4MHz
		delay_cycles(500);	//10ms at 4MHz
		delay_cycles(500);	//10ms at 4MHz
		delay_cycles(500);	//10ms at 4MHz
        temp_i =  SERIAL_NUMBER                        ;
        temp_i =  VERSION                              ;
        temp_i =  MINOR_VERSION                        ;
        temp_i =  MANUFACTURE_DATE                     ;
        temp_i =  NUMBER_OF_PARALLEL_CELLS             ;
        temp_i =  NUMBER_OF_SERIES_CELLS               ;
        temp_i =  ADC_DETECT_CURRENT_OF_DSG_STATUS     ;
        temp_i =  CURRENT_CYCLECOUNT                   ;
        temp_l =  ADC_CYCLECOUNT_THRESHOLD             ;
        temp_f =  Thermistor_mV_To_ADC_Factor          ;

        delay_cycles(500);	//10ms at 4MHz
		L2_PORT->ODR |= (uint8_t)(L2_PIN);
		//delay_cycles(20);	//400us at 4MHz
        ADC1_StartConversion();
		L2_PORT->ODR &= (uint8_t)(~L2_PIN);
		delay_cycles(500);	//10ms at 4MHz
		//wfi();
		//L2_PORT->ODR |= (uint8_t)(L2_PIN);
		//delay_cycles(50);	//1ms at 4MHz
		//L2_PORT->ODR &= (uint8_t)(~L2_PIN);
		//delay_cycles(500);	//10ms at 4MHz
		
	}//while(1);
}//main()


/*
		delay_cycles(10);	//200us at 4MHz
		delay_cycles(20);	//400us at 4MHz
		delay_cycles(30);	//600us at 4MHz
		delay_cycles(40);	//800us at 4MHz
		delay_cycles(50);	//1ms at 4MHz
*/
#endif