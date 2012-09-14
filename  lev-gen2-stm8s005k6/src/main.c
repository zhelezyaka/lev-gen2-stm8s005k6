/********************************************************************************
* Include																		*
********************************************************************************/
#include "Global_config.h"
#include "Module_Driver_Define.h"
#include "Module_Flash_Information.h"
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
unsigned int G_Communication_Array[GVarArraySize + 1];

//unsigned char c1,c1,c2,c4;
//unsigned int test_a[200];
//unsigned int temp_i;
//unsigned long temp_l;
//float temp_f;
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
      delay_cycles(100); //about 960us at 4MHz
  }
#else
      //delay_cycles(100); //about 960us at 4MHz
#endif


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

