/********************************************************************************
* Include																		*
********************************************************************************/
#include "stm8s.h"
#include "Global_config.h"
#include "Module_Driver_Define.h"
#include "SystemInformation\User_Define_Parser.h"
#include "Module_Variable_Define.h"
#include "Module_Var_Bit_Define.h"
#include "SystemInformation\SystemInfo.h"

/********************************************************************************
* Define																		*
********************************************************************************/
#define INTO_HALT_MODE_DELAY_CYCLE  156     //10 sec = INTO_HALT_MODE_DELAY_CYCLE * TimerIntervalTimeBase_MS
/********************************************************************************
* Extern Function																*
********************************************************************************/


/********************************************************************************
* Extern Variable																*
********************************************************************************/

/********************************************************************************
* Global Variable																*
********************************************************************************/
/* Public functions ----------------------------------------------------------*/
/**
  * @brief Example firmware main entry point.
  * @par Parameters:
  * None
  * @retval
  * None
  */
//IN_RAM(void system_halt(void))
//{
//	while (1)
//	{
//            halt();
//	}
//}

//////////////////////////////////////////////////////////////////////////////
unsigned char check;
//unsigned char count;
//unsigned char testArray[128];
//unsigned char t1;
//unsigned int t2;
//unsigned long t3;
//float f;
//__no_init EEPROM unsigned int eeprom_t1;
//unsigned char __eeprom *p;
//unsigned int __eeprom *p1;
unsigned int FirstInitial_Func(){
	
	System_clk_setup();
    delay_cycles(100); //about 960us at 4MHz
/////////////////////////////////

//	/*Configure all the IO as Output Push pull at low level exept PA1 and PA2 (OSCIN and OSCOUT)*/
//	/*GPIOA*/
//	/*otherwise it's defined as Push pull at low level */
//	GPIOA->ODR = 0x00;
//	GPIOA->DDR = 0x7F;
//	GPIOA->CR1 = 0x7F;
//	/*GPIOB*/
//	GPIOB->ODR = 0x00;
//	GPIOB->DDR = 0xFF;
//	GPIOB->CR1 = 0xFF;
//	/*GPIOC*/
//	GPIOC->ODR = 0x00;
//	GPIOC->DDR = 0xFF;
//	GPIOC->CR1 = 0xFF;
//	/*GPIOD*/
//	GPIOD->ODR = 0x00;
//	GPIOD->DDR = 0xFF;
//	GPIOD->CR1 = 0xFF;
//	/*GPIOE*/
//	GPIOE->ODR = 0x00;
//	GPIOE->DDR = 0xFF;
//	GPIOE->CR1 = 0xFF;
//	/*GPIOF*/
//	GPIOF->ODR = 0x00;
//	GPIOF->DDR = 0xFF;
//	GPIOF->CR1 = 0xFF;
//
//    
//    system_halt();

    
//////////////////////////////    
    InitMosControl();
	InitLEDDisplay();
    
    
    //while(1);
   
    ////////////////////////////////
    
    SysInfo_init();
    G_DSG_Current_ADC = 1000;
    G_CHG_Current_ADC = 2000;
    G_VBAT_ADC = 3000;
    G_TH1_ADC = 4000;
    G_TH2_ADC = 5000;
   
    UpdatedSystemRecordingInfoForPolling();
    WriteSystemRecordingInfoToEEPROM();    
    while(1){
        //SysInfo_init();
        for(int i=0; i<128;i++){
            delay_cycles(100); //about 960us at 4MHz
        }
    }
    
    //InitTimerFunction();
	//enableInterrupts();  /* enable interrupts */
    while(0){
        //SetLed_DirectIO_BITs(0xff);
        //check = EEPROM_WriteByte(0, 3300);
        //check = EEPROM_WriteByte(0x22, 4400);
        check = EEPROM_WriteDoubleWord(4, 1430546039);
        check = EEPROM_WriteDoubleWord(0x10, 1430546039);
        
        //check = EEPROM_ReadWholeMemory(testArray, 128);
        //SetLed_DirectIO_BITs(0);
        delay_cycles(100); //about 960us at 4MHz
        if(check){
            //fail
//            SetLed_DirectIO_BITs(0xff);
//            SetLed_DirectIO_BITs(0);
//            SetLed_DirectIO_BITs(0xff);
//            SetLed_DirectIO_BITs(0);
//            SetLed_DirectIO_BITs(0xff);
//            SetLed_DirectIO_BITs(0);
        }else{
            //pass
//            SetLed_DirectIO_BITs(0xff);
//            SetLed_DirectIO_BITs(0);
//            SetLed_DirectIO_BITs(0xff);
//            SetLed_DirectIO_BITs(0);
        }
        
        delay_cycles(100); //about 960us at 4MHz
        delay_cycles(100); //about 960us at 4MHz
        delay_cycles(100); //about 960us at 4MHz
        delay_cycles(100); //about 960us at 4MHz
        delay_cycles(100); //about 960us at 4MHz
        delay_cycles(100); //about 960us at 4MHz
        delay_cycles(100); //about 960us at 4MHz
        delay_cycles(100); //about 960us at 4MHz
        delay_cycles(100); //about 960us at 4MHz
        delay_cycles(100); //about 960us at 4MHz
    }

    while(0);
    
    
//    SetLed_DirectIO_OnOff(LED1, TurnOn);
//    SetLed_DirectIO_OnOff(LED2, TurnOn);
//    SetLed_DirectIO_OnOff(LED3, TurnOn);
//    SetLed_DirectIO_OnOff(LED4, TurnOn);
//    SetLed_DirectIO_OnOff(LED5, TurnOn);

	// Initialize LEDs
	
	//Setup_USI_Slave();
	
      delay_cycles(5);  //about 90us at 4MHz
      delay_cycles(10); //about 132us at 4MHz
      delay_cycles(20); //about 224us at 4MHz
      delay_cycles(30); //about 318us at 4MHz
      delay_cycles(40); //about 410us at 4MHz
      delay_cycles(50); //about 502us at 4MHz
      delay_cycles(100); //about 960us at 4MHz
      delay_cycles(100); //about 960us at 4MHz
      delay_cycles(100); //about 960us at 4MHz
	
	
  return StartUp;
}


unsigned int Startup_Func()
{
  
	//Initialization
	disableInterrupts();  /* disable interrupts */

	
	G_Module_Status = 0;
    G_Auxiliary_Module_Status = 0;
	G_SystemFailureStatus = 0;
    G_LED_Interface_Status1 = 0;
    G_LED_Interface_Status2 = 0;
    G_Device_Interface_Status1 = 0;
    G_Add_Device_Interface_Status = 0;

 
    G_DSG_Current_ADC = 0;
    G_CHG_Current_ADC = 0;
    G_VBAT_ADC = 0;
    G_TH1_ADC = 0;
    G_TH2_ADC = 0;

	
	InitLEDDisplay();
    InitMosControl();
    InitButtonEvent();
    InitInputSignalPin();
    
    
    delay_cycles(5);
    InitAdapterOutputSignal();
    InitUARTFunction();
    
    /////////////////////////////////
    InitSubPollingProtectionVariables();
    InitADCFunction();
    Set_Interrupt_ADC_Conversion_Finish_Function(ProtectionForPolling); //wait for startAdcConversion()
    
    /////////////////////////////////
    InitTimerPollingVariables();
    //InitTimerFunction();
    InitAWUTimerFunction();
    Set_AWU_Shorter_Timer_Interval_Time_Base();

    
	enableInterrupts();  /* enable interrupts */
    
//    while(1){
//        SetLed_DirectIO_Pin_OnOff(LED2,1);
//        delay_cycles(100); //about 960us at 4MHz
//        SetLed_DirectIO_Pin_OnOff(LED2,0);
//        halt();
//        
//    }
//    while(1){
//    SetLedPWMFunction(0x1f, TurnOn);
//    
//    unsigned int i,j;
//    unsigned int loop_d = 150;
//    unsigned int ddelay = 100;
//    for(i = 0; i< loop_d; i++){
//        delay_cycles(ddelay);
//    }
//    
//    for(j=0; j< 20; j++){
//        SetLedPWM20Steps(j);
//        for(i = 0; i< loop_d; i++){
//            delay_cycles(ddelay);
//        }
//    }
//    
//    SetLedPWMFunction(0x00, TurnOff);
//    
//        for(i = 0; i< loop_d; i++){
//            delay_cycles(ddelay);
//        }
//    }

    
//unsigned char temp = 0;
//    if(temp == 0){
//        SetLed_DirectIO_OnOff(LED1, TurnOn);
//    }else{
//        SetLed_DirectIO_OnOff(LED1, TurnOff);
//    }
//    temp ^= 0x01;
    
    return NormalMode;
}

unsigned char inverse_led1_flag = 0;
unsigned char inverse_led2_flag = 0;

unsigned int Normal_Func(){
    
    //Set_Interrupt_Timer_Calling_Function(1, TimerCounterForPolling);   //64ms
    //Set_Interrupt_Timer_Calling_Function(2, startAdcConversion);       //64ms
    //G_Auxiliary_Module_Status &= ~Halt_Mode;
    
    Set_Interrupt_AWU_Timer_Calling_Function(1, TimerCounterForPolling);   //64ms
    Set_Interrupt_AWU_Timer_Calling_Function(2, startAdcConversion);       //64ms
    G_Auxiliary_Module_Status |= Halt_Mode;
    
    Set_Aux1_Counter_Cycles(INTO_HALT_MODE_DELAY_CYCLE);
    
    inverse_led1_flag = 0;
    inverse_led2_flag = 0;
    while(1){
        
        if(G_Device_Interface_Status1 & BUTTON_CLICK){
            G_Device_Interface_Status1 &= ~BUTTON_CLICK;
            
            ////////////////////////////////////////////////////////////
            // into normal wfi mode
            if(G_Auxiliary_Module_Status & Halt_Mode){
                DisableAWUTimerFunction();
                InitTimerFunction();
                Set_Interrupt_Timer_Calling_Function(1, TimerCounterForPolling);   //64ms
                Set_Interrupt_Timer_Calling_Function(2, startAdcConversion);       //64ms
                G_Auxiliary_Module_Status &= ~Halt_Mode;
                G_Add_Device_Interface_Status |= ENABLE_AUX1_COUNTER;
            }else{
                Reset_Aux1_Counter();
            }
            
            if(inverse_led1_flag == 0){
                SetLedPWMFunction(LED1+LED4+LED5, TurnOn);
                
                //SetLedLightOnFlag(LED1, TurnOn);
            }else{
                SetLedPWMFunction(LED1+LED4+LED5, TurnOff);
                //SetLedLightOnFlag(LED1, TurnOff);
            }
            inverse_led1_flag ^= 0x01;
        }
        
        if(G_Device_Interface_Status1 & BUTTON_LONG_PRESS){
            G_Device_Interface_Status1 &= ~BUTTON_LONG_PRESS;

            ////////////////////////////////////////////////////////////
            // into normal wfi mode
            if(G_Auxiliary_Module_Status & Halt_Mode){
                DisableAWUTimerFunction();
                InitTimerFunction();
                Set_Interrupt_Timer_Calling_Function(1, TimerCounterForPolling);   //64ms
                Set_Interrupt_Timer_Calling_Function(2, startAdcConversion);       //64ms
                G_Auxiliary_Module_Status &= ~Halt_Mode;
                G_Add_Device_Interface_Status |= ENABLE_AUX1_COUNTER;
            }else{
                Reset_Aux1_Counter();
            }

            
            if(inverse_led2_flag == 0){
                //SetLedLightOnFlag(LED2, TurnOn);
                SetLedSerialTurnOnOff(TurnOn);
            }else{
                //SetLedLightOnFlag(LED2, TurnOff);
                SetLedSerialTurnOnOff(TurnOff);
            }
            inverse_led2_flag ^= 0x01;
        }
        
        
        if(G_Auxiliary_Module_Status & SYS_1_SEC_FLAG){
            G_Auxiliary_Module_Status &= ~SYS_1_SEC_FLAG;
            UART_Send_Word_CRC(G_Var_Array, GVarArraySize, true);
        }
        
        
        ////////////////////////////////////////////////////////////
        // into Halt mode
        if(((G_Auxiliary_Module_Status & Halt_Mode)==0)&&(G_Add_Device_Interface_Status & AUX1_COUNTING_FINISH)){
            G_Add_Device_Interface_Status &= ~AUX1_COUNTING_FINISH;
            DisableTimerFunction();
            InitAWUTimerFunction();
            Set_Interrupt_AWU_Timer_Calling_Function(1, TimerCounterForPolling);   //64ms
            Set_Interrupt_AWU_Timer_Calling_Function(2, startAdcConversion);       //64ms
            G_Auxiliary_Module_Status |= Halt_Mode;
        }
        
        //delay_cycles(100); //about 960us at 4MHz
        if(G_Auxiliary_Module_Status & Halt_Mode){
            halt();
        }else{
            wfi();  /* Wait For Interrupt */
        }
        
        //SetLedPWMFunction(0x1f, TurnOn);
        //SetLed_DirectIO_OnOff(LED2, TurnOn);
        
//        SetLed_DirectIO_BITs(0xff);
//        //delay 1 sec
//        for(int i = 0; i < 200;i++){
//            delay_cycles(100); //about 960us at 4MHz
//        }
//        SetLed_DirectIO_BITs(0);
//        //delay 1 sec
//        for(int i = 0; i < 200;i++){
//            delay_cycles(100); //about 960us at 4MHz
//        }
        
        //wfi();
        
//        delay_cycles(5);  //about 90us at 4MHz
//        delay_cycles(10); //about 132us at 4MHz
//        delay_cycles(20); //about 224us at 4MHz
//        delay_cycles(30); //about 318us at 4MHz
//        delay_cycles(40); //about 410us at 4MHz
//        delay_cycles(50); //about 502us at 4MHz
//        delay_cycles(100); //about 960us at 4MHz
//        delay_cycles(100); //about 960us at 4MHz
//        delay_cycles(100); //about 960us at 4MHz
//        for(int i = 0; i < 10;i++){
//            //delay_cycles(100); //about 960us at 4MHz
//        }        
    }//while(1);   
    return ShutdownMode;
}

unsigned int Shutdown_Func(){
    
    return StartUp;
}
#if 0
unsigned int Normal_Func(){
  //////////////////////////////////////////////////////////////////////////////
  // 2012/05/07 Remove DOC Propection, hsinmo
  //unsigned int DSG_OC_Delay_Count;
  unsigned int CHG_OC_Delay_Count;
  unsigned int _2ND_OV_Delay_Count;
  unsigned int _2ND_UV_Delay_Count;
  unsigned int iTemp1, iTemp2;
  
  //DSG_OC_Delay_Count = 0;
  CHG_OC_Delay_Count = 0;
  _2ND_OV_Delay_Count = 0;
  _2ND_UV_Delay_Count = 0;
  
  setMosFET(MOSFET_CHG, DeviceOn);
  setMosFET(MOSFET_DSG, DeviceOn);


  //Clear Activate Action Flag
  G_Activate_Action_Status = 0;
  G_Activate_Action_Status_Other1  = 0;
  //G_CHG_CV_MODE_Cycle_Count = 0;
  //G_DSG_CHG_OC_Delay_Count = 0;
  
  //Coulomb Counter Start
  G_Activate_Action_Status |= ACCUMULATING_Q_ENABLE;
  
  while(1){

    
    __delay_cycles(3000);  // 3ms ==> 1MHz clock
    StartAdcConversion();
    
    ///////////////////////////////////////
    // Current Detection
    iTemp1 = GetADCValue(ICHG_ADC);
    iTemp2 = GetADCValue(IDSG_ADC);
    if( iTemp1 >= ADC_DETECT_CURRENT_OF_CHG_STATUS){
      // in charging status
      G_Module_Status &= ~Module_DSG;
      G_Module_Status &= ~Module_RELAX;
    }else if( iTemp2 < ADC_DETECT_CURRENT_OF_DSG_STATUS ){
      // in relaxation mode or Quiescent current
      G_Module_Status |= Module_DSG;
      G_Module_Status |= Module_RELAX;
    }else{
      // in discharging
      G_Module_Status &= ~Module_RELAX;
      G_Module_Status |= Module_DSG;
    }
  
    
    if( iTemp1 >= ADC_COC_PROTECTION && ((G_Module_Status & Module_C_OC) == 0 )){
      CHG_OC_Delay_Count++;
      if(CHG_OC_Delay_Count >= OC_PROTECTION_DELAY_LOOP_COUNT){
        G_Module_Status |= Module_C_OC;
        //setBlinkLED(OC_BlinkLED, true);
      }
    }else{
      CHG_OC_Delay_Count = 0;
    }
//////////////////////////////////////////////////////////////////////////////
// 2012/05/07 Remove DOC Propection, hsinmo
//    if( iTemp2 >= ADC_DOC_PROTECTION && ((G_Module_Status & Module_D_OC) == 0 )){
//      G_DSG_CHG_OC_Delay_Count += (1 << 4);
//      if((G_DSG_CHG_OC_Delay_Count & 0xf0) >= (PROTECTION_DELAY_LOOP_COUNT << 4 )){
//        G_Module_Status |= Module_D_OC;
//        setBlinkLED(OC_BlinkLED, true);
//      }
//    }else{
//      G_DSG_CHG_OC_Delay_Count &= ~(0xf0);
//    }
    
    
    
    ///////////////////////////////////////
    //  Voltage control
    //Vbat Voltage check ==> 2nd level
    iTemp1 = GetADCValue(Vbat_ADC);
   
    if( iTemp1 > ADC_2ND_BATTERY_OV_PROTECTION &&
        (G_Module_Status & Module_2nd_OV) == 0)
    {
      _2ND_OV_Delay_Count++;
      if(_2ND_OV_Delay_Count >= OV_PROTECTION_DELAY_LOOP_COUNT){
        G_Module_Status |= Module_2nd_OV;
        //setBlinkLED(OV_UV_BlinkLED, true);
      }
    }else if( iTemp1 < ADC_2ND_BATTERY_UV_PROTECTION && 
        (G_Module_Status & Module_2nd_UV) == 0)
    {
      _2ND_UV_Delay_Count++;
      if(_2ND_UV_Delay_Count >= UV_PROTECTION_DELAY_LOOP_COUNT){
        G_Module_Status |= Module_2nd_UV;
        //setBlinkLED(OV_UV_BlinkLED, true);
      }
    }else{
      _2ND_UV_Delay_Count = 0;
      _2ND_OV_Delay_Count = 0;
    }
    
    //Cell OV/UV protection and release
    if(get_PIC_UVP_Status()){
      G_Module_Status |= Module_UV;
    }else{
      G_Module_Status &= ~Module_UV;
    }
    if(get_PIC_OVP_Status()){
      G_Module_Status |= Module_OV;
    }else{
      G_Module_Status &= ~Module_OV;
    }   
    

    ///////////////////////////////////////
    //Thermal protection
    iTemp1 = GetADCValue(T1_ADC);
    if( iTemp1 <= ADC_CHG_OT_PROTECTION){
      G_Module_Status |= Module_CHG_OT;
    }
    if( iTemp1 <= ADC_DSG_OT_PROTECTION){
      G_Module_Status |= Module_DSG_OT;
    }
    
    if( iTemp1 >= ADC_UT_PROTECTION){
      G_Module_Status |= Module_UT;
    }
    if(G_Module_Status & Module_DSG_OT ||
       G_Module_Status & Module_CHG_OT ||
       G_Module_Status & Module_UT  ||
       G_Module_Status & Module_OV  ||
       G_Module_Status & Module_UV){
      //setBlinkLED(OT_UT_BlinkLED, true);
//      setBlinkLED(OV_UV_BlinkLED, true);
    }else{
      //setBlinkLED(OT_UT_BlinkLED, false);
//      setBlinkLED(OV_UV_BlinkLED, false);
    }
    
    /////////////////////////////////////////////////////////
    // Check abnormal Flag
    /////////////////////////////////////////////////////////
//    if((G_Module_Status & Module_2nd_OV) && (G_Module_Status & Module_2nd_UV)) {
//      G_uc_SystemFailureCode = _2nd_Level_Vol_Fail;
//      return FailureMode;
//    }
    /////////////////////////////////////////////////////////
    //2012/05/21 remove Fail mode function, hsinmo
//    if((G_Module_Status & Module_RELAX) && ((G_Module_Status & Module_DSG)==0)){
//      G_uc_SystemFailureCode = AbnormalFlagFail;
//      return FailureMode;
//    }
//    if((G_Module_Status & Module_C_OC) && (G_Module_Status & Module_D_OC)){
//      G_uc_SystemFailureCode = AbnormalFlagFail;
//      return FailureMode;
//    }
//    if((G_Module_Status & Module_UV) && (G_Module_Status & Module_OV)){
//      G_uc_SystemFailureCode = AbnormalFlagFail;
//      return FailureMode;
//    }
//    if((G_Module_Status & Module_DSG_OT) && (G_Module_Status & Module_UT)){
//      G_uc_SystemFailureCode = ThermalFail;
//      return FailureMode;
//    }
//    if((G_Module_Status & Module_CHG_OT) && (G_Module_Status & Module_UT)){
//      G_uc_SystemFailureCode = ThermalFail;
//      return FailureMode;
//    }
    
    /////////////////////////////////////////////////////////
    // Comparation protection and active function section
    /////////////////////////////////////////////////////////
    //check suspend mode
    if(G_Module_Status & Module_RELAX){
      G_Activate_Action_Status |= ENABLE_SUSPEND_COUNTER;
    }else{
      G_Activate_Action_Status &= ~ENABLE_SUSPEND_COUNTER;
      G_Activate_Action_Status &= ~SUSPEND_COUNTING_FINISH;
    }
    
    
    if(G_Module_Status & (Module_D_OC)){
//////////////////////////////////////////////////////////////////////////////
// 2012/05/07 Remove DOC Propection, hsinmo
//      setMosFET(MOSFET_CHG, DeviceOff);
//      setMosFET(MOSFET_DSG, DeviceOff);
//      if((G_Activate_Action_Status & ENABLE_OC_COUNTER)==0){
//        G_Activate_Action_Status |= ENABLE_OC_COUNTER;
//      }
//      //OC Release and clear Flag
//      if(G_Activate_Action_Status & OC_COUNTING_FINISH){
//        G_Activate_Action_Status &= ~ENABLE_OC_COUNTER;
//        G_Activate_Action_Status &= ~OC_COUNTING_FINISH;
//        OC_Timer_Counter = 0;
//        G_Module_Status &= ~Module_D_OC;
//        setMosFET(MOSFET_CHG, DeviceOn);
//        setMosFET(MOSFET_DSG, DeviceOn);
//        setBlinkLED(OC_BlinkLED, false);
//      }
    }else if(G_Module_Status & (Module_C_OC)){
      setMosFET(MOSFET_CHG, DeviceOff);
      setMosFET(MOSFET_DSG, DeviceOff);
      if((G_Activate_Action_Status & ENABLE_OC_COUNTER)==0){
        G_Activate_Action_Status |= ENABLE_OC_COUNTER;
      }
      //OC Release and clear Flag
      if(G_Activate_Action_Status & OC_COUNTING_FINISH){
        OC_Timer_Counter = 0;
        G_Activate_Action_Status &= ~ENABLE_OC_COUNTER;
        G_Activate_Action_Status &= ~OC_COUNTING_FINISH;
        G_Module_Status &= ~Module_C_OC;
        setMosFET(MOSFET_CHG, DeviceOn);
        setMosFET(MOSFET_DSG, DeviceOn);
        //setBlinkLED(OC_BlinkLED, false);
      }
    }else if(G_Module_Status & (Module_DSG_OT+ Module_CHG_OT + Module_UT)){
      
      iTemp1 = GetADCValue(T1_ADC);
      //////////////////////////////////////////////////////////////////////////////
      // 2012/05/08 Remove T2 temperature, hsinmo
      if(G_Module_Status & (Module_CHG_OT + Module_UT)){
        setMosFET(MOSFET_CHG, DeviceOff);
        if(G_Module_Status & Module_CHG_OT){
          if( iTemp1 > ADC_CHG_OT_RELEASE){
            G_Module_Status &= ~Module_CHG_OT;
          }
        }
        if(G_Module_Status & Module_UT){
          if( iTemp1 < ADC_UT_RELEASE){
            G_Module_Status &= ~Module_UT;
          }
        }
        if((G_Module_Status & (Module_CHG_OT + Module_UT))== 0){
          setMosFET(MOSFET_CHG, DeviceOn);
        }
        
      }//if(G_Module_Status & (Module_CHG_OT + Module_UT){
      if(G_Module_Status & Module_DSG_OT){
        setMosFET(MOSFET_DSG, DeviceOff);
        if(G_Module_Status & Module_DSG_OT){
          if( iTemp1 > ADC_DSG_OT_RELEASE){
            G_Module_Status &= ~Module_DSG_OT;
            setMosFET(MOSFET_DSG, DeviceOn);
          }
        }        
      }//if(G_Module_Status & (Module_DSG_OT){
      
    }else if(G_Module_Status & Module_2nd_OV){
        setMosFET(MOSFET_CHG, DeviceOff);
        //relese 2nd_OV
        iTemp1 = GetADCValue(Vbat_ADC);
        if( iTemp1 < ADC_2ND_BATTERY_OV_RELEASE){
          G_Module_Status &= ~Module_2nd_OV;
          setMosFET(MOSFET_CHG, DeviceOn);
        }
    }else if(G_Module_Status & Module_2nd_UV){
        
        /////////////////////////////////////////////////
        //remove by hsinmo 2012/05/23, because of retry pack voltage 
        //relese 2nd_UV By Release Voltage
        /////////////////////////////////////////////////
        //setMosFET(MOSFET_DSG, DeviceOff);
        //iTemp1 = GetADCValue(Vbat_ADC);
        //if( iTemp1 > ADC_2ND_BATTERY_UV_RELEASE){
        //  G_Module_Status &= ~Module_2nd_UV;
        //  setMosFET(MOSFET_DSG, DeviceOn);
        //}
      
        /////////////////////////////////////////////////
        //add by hsinmo 2012/05/23
        //relese 2nd_UV By Charger staus
        if((G_Module_Status & Module_DSG)==0){
          // CHG status
          G_Module_Status &= ~Module_2nd_UV;
          setMosFET(MOSFET_DSG, DeviceOn);
        }else{
          // DSG status
          setMosFET(MOSFET_DSG, DeviceOff);
        }
    }else{  //else #1 start
      
      setMosFET(MOSFET_DSG, DeviceOn);
      setMosFET(MOSFET_CHG, DeviceOn);
      ////////////////////////////////////////////////////////////////////////////
      // if charging status and voltage higher then ADC_CHG_CV_MODE_LIMIT_VOLTAGE
      // set CHG_CV_MODE_START flag
      ////////////////////////////////////////////////////////////////////////////
      if((G_Module_Status & Module_DSG)==0){
        //charging status
//        iTemp1 = GetADCValue(Vbat_ADC);
//        if(iTemp1 >= ADC_CHG_CV_MODE_LIMIT_VOLTAGE && ((G_Activate_Action_Status & CHG_CV_MODE_START) == 0)){
//          G_Activate_Action_Status |= CHG_CV_MODE_START;
//        }
//        if((G_Activate_Action_Status & CHG_CV_MODE_START) == 0){
//          setMosFET(MOSFET_CHG, DeviceOn);
//        }
//        setMosFET(MOSFET_DSG, DeviceOn);
      }else{
        //discharging and releax status
        ////////////////////////////////////////////////////////////////////////////
        // if CHG_CV_MODE_START be set then RELAX status not for discharging
        ////////////////////////////////////////////////////////////////////////////
//        if((G_Module_Status & Module_RELAX) && (G_Activate_Action_Status & CHG_CV_MODE_START)){
//          //Still in CV_MODE
//          //do nothing
//        }else{
//          // release CV_MODE COUNTER
//          G_Activate_Action_Status &= ~CHG_CV_MODE_START;
//          G_CHG_CV_MODE_Cycle_Count = 0;
//          G_Activate_Action_Status &= ~ENABLE_CV_MODE_COUNTER;
//          G_Activate_Action_Status &= ~CV_MODE_RELEASE_COUNTING_FINISH;
//          
//          setMosFET(MOSFET_CHG, DeviceOn);
//          setMosFET(MOSFET_DSG, DeviceOn);
//        }
      }
    } //else #1 end

    ////////////////////////////////////////////////////////////////////////////
    // CHG_CV_MODE_START Process
    ////////////////////////////////////////////////////////////////////////////
//    if((G_Activate_Action_Status & CHG_CV_MODE_START)&&(G_CHG_CV_MODE_Cycle_Count < CHG_CV_MODE_REPEATING_CYCLE)){
//      iTemp1 = GetADCValue(Vbat_ADC);
//      if((iTemp1 >= ADC_CHG_CV_MODE_LIMIT_VOLTAGE) && (G_Activate_Action_Status & ENABLE_CV_MODE_COUNTER) == 0){
//        setMosFET(MOSFET_CHG, DeviceOff);
//        G_CHG_CV_MODE_Cycle_Count++;
//        G_Activate_Action_Status |= ENABLE_CV_MODE_COUNTER;
//      }
//      /////////////////////////////////////////////////////
//      //Last cycle will not be into this section
//      // it's mean Last cycle Chg mos will be turned off
//      if(G_Activate_Action_Status & CV_MODE_RELEASE_COUNTING_FINISH){
//        setMosFET(MOSFET_CHG, DeviceOn);
//        G_Activate_Action_Status &= ~ENABLE_CV_MODE_COUNTER;
//        G_Activate_Action_Status &= ~CV_MODE_RELEASE_COUNTING_FINISH;
//        CHG_CV_MODE_Timer_Counter = 0;
//      }
//    }
//    
    
    
    
    ///////////////////////////////////////////////////////////////////////////////
    // Button Function
    ///////////////////////////////////////////////////////////////////////////////
    if(G_Activate_Action_Status & BUTTON_LONG_PRESS_FLAG){
      G_Activate_Action_Status = 0;
      G_Activate_Action_Status_Other1 = 0;
      G_Activate_Action_Status_Other1 |= LightOff_Seq_LED;
      return ShutdownMode;
    }
    if(G_Activate_Action_Status & BUTTON_CLICK_FLAG){
      G_Activate_Action_Status &= ~BUTTON_CLICK_FLAG;
      if((G_Module_Status & Module_DSG)==0){
        iTemp1 = ADC_LOOKUP_1st_OCV_CURRENT_RANGE - 2;//charger=2A ==>4p cell=0.1C
        //iTemp1 = GetADCValue(ICHG_ADC);
      }else{
        iTemp1 = GetADCValue(IDSG_ADC);
      }
      iTemp2 = GetADCValue(Vbat_ADC);
      DisplayCapacity(getRealCapacityByCell(iTemp2,iTemp1), true);
    }
    
#if _SUSPEND_ENABLE_ > 0
    //into suspend mode
    if(G_Activate_Action_Status & SUSPEND_COUNTING_FINISH){
      //Coulomb Counter Stop
      G_Activate_Action_Status &= ~ACCUMULATING_Q_ENABLE;
      G_uc_SysModeStatusCode = Suspend_Func();
      //Coulomb Counter Start
      G_Activate_Action_Status |= ACCUMULATING_Q_ENABLE;
    }
#endif
    
    __delay_cycles(6000);  // 6ms ==> 1MHz clock
    if(G_uc_SysModeStatusCode != NormalMode){
      return G_uc_SysModeStatusCode;
    }

  } //while(1)
  
  return NormalMode;
  
}

unsigned int Failure_Func(){

  setMosFET(MOSFET_CHG, DeviceOff);
  setMosFET(MOSFET_DSG, DeviceOff);
  //setBlinkLED(LED_SET_ALL, false);
  __delay_cycles(1000);  // 1ms ==> 1MHz clock
  //setBlinkLED(SystemFailBlinkLED, true);
  
  G_Activate_Action_Status =0;
  G_Activate_Action_Status_Other1 = 0;
  while(1){
    if(G_uc_SysModeStatusCode != FailureMode){
      return G_uc_SysModeStatusCode;
    }
    if(G_Activate_Action_Status & BUTTON_LONG_PRESS_FLAG){
      G_Activate_Action_Status = 0;
      G_Activate_Action_Status_Other1 = 0;
      return ShutdownMode;
    }
  };
  
  return FailureMode;
}

unsigned int Shutdown_Func(){

  unsigned char icount;
  setMosFET(MOSFET_CHG, DeviceOff);
  setMosFET(MOSFET_DSG, DeviceOff);
  //setBlinkLED(LED_SET_ALL, false);
  __delay_cycles(1000);  // 1ms ==> 1MHz clock
  //BlinkLED(SystemFailBlinkLED, true);

#if _5LEDs_Thick_TYPE_ == 0
  unsigned char i,j, bit;
  bit = LED_PORT4;
  P2OUT |= ALL_LED_PORT;
  
  for(i=0; i<4; i++){
    for(j=0; j< 5;j++){
      __delay_cycles(100000);  // 100ms ==> 1MHz clock
    }
    P2OUT &= ~ALL_LED_PORT;
    P2OUT |= ALL_LED_PORT & (~bit);
    bit = (bit >> 1)  | LED_PORT4;
  }
  P2OUT &=~ALL_LED_PORT;
#endif
  
  G_Activate_Action_Status = 0;
  //G_Activate_Action_Status_Other1 = 0;
  while(1){
      TimerAStop();
      ///////////////////////////////////////////////////////
      // into Low Power Mode
      G_Activate_Action_Status_Other1 |= Low_Power_Mode;
      _BIS_SR(LPM3_bits);                       // Enter LPM3 w/interrupt
      ///////////////////////////////////////////////////////
      __delay_cycles(100); 
      InitTimerA();
      __delay_cycles(100000);  // 100ms ==> 1MHz clock
      icount = 0;
      while(1){
        if(G_uc_SysModeStatusCode != ShutdownMode){
          return G_uc_SysModeStatusCode;
        }
        if(G_Activate_Action_Status & BUTTON_LONG_PRESS_FLAG){
          G_Activate_Action_Status = 0;
          G_Activate_Action_Status_Other1 = 0;
          return StartUp;
        }
        if(icount > 200){
          icount = 0;
          break;
        }else{
          __delay_cycles(100000);  // 100ms ==> 1MHz clock
          icount++;
        }
      };    
    
  }//while(1){

  return StartUp;
}
unsigned int Calibration_Func(){

  setMosFET(MOSFET_CHG, DeviceOn);
  setMosFET(MOSFET_DSG, DeviceOn);
  //setBlinkLED(LED_SET_ALL, false);
  //DisplayLED(LED_SET_ALL, DeviceOn);
  G_Activate_Action_Status = 0;
  //G_Activate_Action_Status_Other1 = 0;


  __delay_cycles(10000);  // 10ms ==> 1MHz clock
  //BlinkLED(SystemFailBlinkLED, true);
  
  while(1){
    if(G_uc_SysModeStatusCode != CalibrationMode){
      break;
    }
    if(G_Activate_Action_Status & BUTTON_LONG_PRESS_FLAG){

      break;
    }
    __delay_cycles(10000);  // 10ms ==> 1MHz clock
    StartAdcConversion();

  };
  G_Activate_Action_Status = 0;
  G_Activate_Action_Status_Other1 = 0;
  setMosFET(MOSFET_CHG, DeviceOff);
  setMosFET(MOSFET_DSG, DeviceOff);
  return StartUp;
}

unsigned int Suspend_Func(){
  
  G_uc_SysModeStatusCode = SuspendMode;
  //setBlinkLED(LED2, true);
  
  

  while(1){
    setMosFET(MOSFET_CHG, DeviceOff);
    
    setMosFET(MOSFET_DSG, DeviceOff);
    ///////////////////////////////////////////////////////
    //解決 BUTTON_LONG_PRESS 進入 SuspendMode 時，
    // BUTTON_CLICK 無作用.
    G_Activate_Action_Status &= ~BUTTON_LONG_PRESS_FLAG;
    
    ///////////////////////////////////////////////////////
    //解決 進入 SuspendMode 時，無法跳到 CalibrationMode
    if(G_uc_SysModeStatusCode != SuspendMode){
      return CalibrationMode;
    }
    ///////////////////////////////////////////////////////
    // into Low Power Mode
    G_Activate_Action_Status |= ENABLE_SUSPEND_WAKE_UP_COUNTER;
    
    ///////////////////////////////////////////////////////
    G_Activate_Action_Status_Other1 |= Low_Power_Mode;
    _BIS_SR(LPM3_bits);                       // Enter LPM3 w/interrupt
    ///////////////////////////////////////////////////////

    
    __delay_cycles(10);
    if(G_Activate_Action_Status & SUSPEND_WAKE_UP_COUNTING_FINISH){
      G_Activate_Action_Status &= ~SUSPEND_WAKE_UP_COUNTING_FINISH;
      G_Activate_Action_Status &= ~ENABLE_SUSPEND_WAKE_UP_COUNTER;
    }
    setMosFET(MOSFET_CHG, DeviceOn);
    setMosFET(MOSFET_DSG, DeviceOn);
    //initial
    //InitAdcReader();
    __delay_cycles(100000);  // 100ms ==> 1MHz clock
    __delay_cycles(100000);  // 100ms ==> 1MHz clock
    if(G_Activate_Action_Status & (BUTTON_CLICK_FLAG + BUTTON_LONG_PRESS_FLAG)){
      //BUTTON_CLICK 離開susspend mode 並顯示 capacity
      //G_Activate_Action_Status &= ~BUTTON_CLICK_FLAG;
      break;
    }
    
    // Start ADC conversion
    StartAdcConversion();
    // get current
    if( GetADCValue(ICHG_ADC) >= ADC_DETECT_CURRENT_OF_CHG_STATUS || GetADCValue(IDSG_ADC) >= ADC_DETECT_CURRENT_OF_DSG_STATUS){
      //Wake-up and into Normal mode
      G_Activate_Action_Status &= ~SUSPEND_COUNTING_FINISH;
      G_Activate_Action_Status &= ~ENABLE_SUSPEND_COUNTER;
      break;
    }
//    //////////////////////////////////////////////
//    //for test 起來後會直接進入Normal
//      G_Activate_Action_Status &= ~SUSPEND_COUNTING_FINISH;
//      G_Activate_Action_Status &= ~ENABLE_SUSPEND_COUNTER;
//      break;
  }
  
  
  G_Activate_Action_Status = (G_Activate_Action_Status & (BUTTON_CLICK_FLAG + BUTTON_LONG_PRESS_FLAG)); //僅留button click 狀態
  G_Activate_Action_Status_Other1 = 0;
  
  return NormalMode;
}

  //_BIS_SR(LPM3_bits);                       // Enter LPM3 w/interrupt
  //__bic_SR_register_on_exit(LPM0_bits);  // Clear LPM0 bits from 0(SR) use in interrupt



//unsigned char Shipping_Func(){
//
//  setMosFET(MOSFET_CHG, DeviceOff);
//  setMosFET(MOSFET_DSG, DeviceOff);
//  setBlinkLED(LED_SET_ALL, false);
//  
//  __delay_cycles(1000);  // 1ms ==> 1MHz clock
//  
//  while(1){
//    
//    //ADC Stop
//    ADC10CTL0 &= ~(ADC10SHT_2 + MSC + ADC10ON + ADC10IE +SREF_1+REFON+REF2_5V);
//    setMosFET(MOSFET_CHG, DeviceOff);
//    // power off 
//    //SetMainPowerAction( DeviceOff );
//    __delay_cycles(10000);  // 10ms ==> 1MHz clock
//    
//    ///////////////////////////////////////////////////////
//    // into Low Power Mode
//    G_Activate_Action_Status |= ENABLE_WAKE_UP_COUNTER;
//    _BIS_SR(LPM3_bits);                       // Enter LPM3 w/interrupt
//    G_Activate_Action_Status &= ~WAKE_UP_COUNTING_FINISH;
//    WAKE_UP_Timer_Counter = 0;
//    // power on 
//    //SetMainPowerAction( DeviceOn );
//    __delay_cycles(10000);  // 10ms ==> 1MHz clock
//    //ADC on
//    ADC10CTL0 |= (ADC10SHT_2 + MSC + ADC10ON + ADC10IE +SREF_1+REFON+REF2_5V);
//    //detect charging adapter plugging-in
//    setMosFET(MOSFET_CHG, DeviceOn);
//    __delay_cycles(10000);  // 10ms ==> 1MHz clock
//    // Start ADC conversion
//    StartAdcConversion();
//    // get current
//    if( GetADCValue(ICHG_ADC) >= ADC_DETECT_CURRENT_OF_CHG_STATUS){
//      //Wake-up and into Normal mode
//      break;
//    }
//  }
//  return StartUp;
//}


#endif





