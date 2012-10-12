






enum For_G_SysModeStatusCode  //unsigned char
{
  UnKnowStatus,
  StartUp,
  POSTMode, //Power-on self-test
  NormalMode,
  FailureMode,
  ShutdownMode,
  CalibrationMode,
  ShippingMode,
  SuspendMode
};


/********************************************************************************
* Extern Function																*
********************************************************************************/


/********************************************************************************
* Golbal Variable Control Bits	Define											*
********************************************************************************/
/////////////////////////////////////////////////////////////////////////////////
/* Module Status Control Bits */
/* For G_Module_Status ; unsigned int */
//Low byte
#define Current_Dir_CHG          	(0x0001)    //Charging
#define Current_Dir_Static          (0x0002)    //relaxation mode or Quiescent current, usually equal to discharging
#define Current_Dir_DSG        		(0x0004)    //Discharging,
#define NoUse2        				(0x0008)    //No Use,
#define NoUse3        				(0x0010)    //No Use,
#define Charger_Plug_In				(0x0020)    //No Use,
#define Module_UT                   (0x0040)    // Under Temperature Alarm
#define Module_C_OC_LOCK            (0x0080)    // Repeat COC for setting times, CHG Mos will be lock, until dsg current
//Hight byte
#define Module_D_OC                 (0x0100)    //=D_OC, DisCharge over current flag
#define Module_C_OC                 (0x0200)    //=C_OC, Charge over current flag
#define Module_BAT_OV               (0x0400)    // Over Voltage Alarm, Whole Battery voltage
#define Module_BAT_UV               (0x0800)    // Under Voltage Alarm, Whole Battery voltage
#define Module_PIC_OV               (0x1000)    // Cell Voltage Over Voltage Alarm
#define Module_PIC_UV               (0x2000)    // Cell Voltage Under Voltage Alarm
#define Module_CHG_OT               (0x4000)    // CHG Over Temperature Alarm
#define Module_DSG_OT               (0x8000)    // DSG Over Temperature Alarm 

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
/* G_Auxiliary_Module_Status Control Bits */
/* For G_Auxiliary_Module_Status ; unsigned int */
//Low byte
#define DSG_LOW_OTA                 (0x0001)    // if temperature reach low level OT setting
#define DSG_HIGH_OTA                (0x0002)    // if temperature reach High level OT setting
#define DSG_HIGH_CURRENT_FOR_OT     (0x0004)    // if current over High currentsetting or not
#define USE_DSG_HIGH_OT_SETTING     (0x0008)    ////1 = Use DSG HIGH OT Protection setting, 0 = Use (Normal) OT Protection setting.
#define SYS_1_SEC_FLAG              (0x0010)    // every 1 second will be set
#define Halt_Mode                   (0x0020)    // halt mode, very low power mode, if it's not set, it's normal mode (wait for interrupr)
#define _3RD_Function_ON            (0x0040)    //
//#define _No_Used_      (0x0080)    //
//Hight byte
//#define _No_Used_      (0x0100)    //
//#define _No_Used_    (0x0200)    //
//#define _No_Used_     (0x0400)    //
//#define _No_Used_     (0x0800)    //
//#define _No_Used_     (0x1000)    //
//#define _No_Used_      (0x2000)    //
//#define _No_Used_      (0x4000)    //
//#define _No_Used_      (0x8000)    //




/* Indication Failure Status in fail shutdown mode (unsigned int G_SystemFailureStatus)
   define G_SystemFailureStatus bit */
#define AbnormalFail            (0x0001)    //
#define DSGMOSFETFail           (0x0002)    //
#define CHGMOSFETFail           (0x0004)    //
#define ADCFail                 (0x0008)    //
#define OCFail                  (0x0010)    //
#define CalibrationFail         (0x0020)    //
#define NoUse15                 (0x0040)    //
#define NoUse16                 (0x0080)    // 
//Hight byte
//#define NoUse0                  (0x0100)    //
//#define NoUse1                  (0x0200)    //
//#define NoUse2                  (0x0400)    // 
//#define NoUse3                  (0x0800)    // 
//#define NoUse4                  (0x1000)    // 
//#define NoUse5                  (0x2000)    // 
//#define NoUse6                  (0x4000)    // 
//#define NoUse7                  (0x8000)    // 



///* Module Status Control Bits */
///* For G_Activate_Action_Status ; unsigned int */
////Low byte
//#define BUTTON_PRESS_FLAG               (0x0001)    //if button has been pressed, will set BUTTON_PRESS_FLAG flag
//#define BUTTON_LONG_PRESS_FLAG          (0x0002)    //if button has been pressed longer than setting time, will set BUTTON_LONG_PRESS_Flag flag
//#define ENABLE_OC_COUNTER               (0x0004)    //Start Over current counting. if finish, will set OC_COUNTING_FINISH flag
//#define OC_COUNTING_FINISH              (0x0008)    //Over current counting Finish.
//#define CHG_CV_MODE_START               (0x0010)    //Start CV_MODE_RELEASE waiting time counting. if finish, will set CV_MODE_RELEASE_COUNTING_FINISH flag
//#define ENABLE_CV_MODE_COUNTER          (0x0020)    //Start CV_MODE_RELEASE waiting time counting. if finish, will set CV_MODE_RELEASE_COUNTING_FINISH flag
//#define CV_MODE_RELEASE_COUNTING_FINISH (0x0040)    //CV_MODE_RELEASE waiting time counting Finish.
//#define BUTTON_CLICK_FLAG               (0x0080)    //if button has been pressed and then release with out BUTTON_LONG_PRESS_FLAG is set
////Hight byte
//#define ENABLE_WAKE_UP_COUNTER          (0x0100)    //
//#define WAKE_UP_COUNTING_FINISH         (0x0200)    //
//#define ENABLE_SUSPEND_COUNTER          (0x0400)    // 
//#define SUSPEND_COUNTING_FINISH         (0x0800)    // 
//#define ENABLE_SUSPEND_WAKE_UP_COUNTER  (0x1000)    // 
//#define SUSPEND_WAKE_UP_COUNTING_FINISH (0x2000)    // 
//#define CAPACITY_DISLALY                (0x4000)    // 
//#define ACCUMULATING_Q_ENABLE           (0x8000)    // 