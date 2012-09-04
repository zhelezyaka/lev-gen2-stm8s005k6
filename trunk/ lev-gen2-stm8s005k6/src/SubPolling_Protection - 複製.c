
/********************************************************************************
* Include																		*
********************************************************************************/
#include "Global_config.h"
#include "Module_Interface_Define.h"
#include "Module_Flash_Information.h"
#include "Module_Variable_Define.h"
#include "Module_Var_Bit_Define.h"
/********************************************************************************
* Define																        *
********************************************************************************/

/********************************************************************************
* Extern Function																*
********************************************************************************/
/********************************************************************************
* Current File Define Function													*
********************************************************************************/
void GetCurrentValuesAndDirection();

/********************************************************************************
* Extern Variable																*
********************************************************************************/

/********************************************************************************
* Golbal Variable																*
********************************************************************************/


/********************************************************************************
* Local file Variable										                    *
********************************************************************************/
static unsigned char DSG_OC_Counter;
static unsigned char CHG_OC_Counter;

/********************************************************************************
* 															                    *
********************************************************************************/
void InitCurrentVariables(){
    DSG_OC_Counter = 0;
    CHG_OC_Counter = 0;
}
/********************************************************************************
* 															                    *
********************************************************************************/
void GetCurrentValuesAndDirection(){
  
      G_DSG_Current_ADC = getDSGCurrentADC();
      G_CHG_Current_ADC = getCHGCurrentADC();
      /////////////////////////////////////////////////////////////////////////////////////////////
      // checking Current Direction status
      if(G_CHG_Current_ADC > ADC_CURRENT_DETECT_FOR_CHG_STATUS){
        ////////////////////////////////////////////////////
        // in charging status
        ////////////////////////////////////////////////////
        G_Module_Status |= Current_Dir_CHG;
        G_Module_Status &= ~Current_Dir_Static;
        G_Module_Status &= ~Current_Dir_DSG;
      }else{
        ///////////////////////////////////////////////////
        //  in discharging status 
        //(current direction include discharging and relaxation )
        if(G_DSG_Current_ADC > ADC_CURRENT_DETECT_FOR_DSG_STATUS){
          // discharging
          G_Module_Status |= Current_Dir_DSG;
          G_Module_Status &= ~Current_Dir_Static;
          G_Module_Status &= ~Current_Dir_CHG;
        }else{
          // relaxation
          G_Module_Status |= Current_Dir_Static;
          G_Module_Status &= ~Current_Dir_CHG;
          G_Module_Status &= ~Current_Dir_DSG;
        }
      }//if(G_CHG_Current_ADC > ADC_CURRENT_DETECT_FOR_CHG_STATUS){ -else- 
}

void ProtectionForPolling(){
  
      /////////////////////////////////////////////////////////////////////////////////////////////
      // checking if it's D_OC
      // compare if Discharging Current greater than ADC_DOC_PROTECTION,
      // it will be into DSG OC protection.
      if(((G_Module_Status & Module_D_OC)==0) && G_DSG_Current_ADC > ADC_DOC_PROTECTION){
        DSG_OC_Counter++;
        if(DSG_OC_Counter >= DSG_OC_Protection_Delay_Cycle){
          G_Module_Status |= Module_D_OC;
          DSG_OC_Counter = 0;
          ///////////////////////////////////////////////////////////////////
          // Set Protection Flag,set counting time 100 (100 * 50 ms = 5 sec).
          //setDSGOverCurrentCounting(DeviceOn);
        }//if(gDSG_OC_Counter >= DSG_OC_Protection_Delay_Cycle){
      }else{
        DSG_OC_Counter = 0;
      }      
      /////////////////////////////////////////////////////////////////////////////////////////////
      // checking if it's C_OC
      // compare if Charging Current greater than ADC_COC_PROTECTION,
      // it will be into CHG OC protection.
      if(((G_Module_Status & Module_C_OC)==0) && G_CHG_Current_ADC > ADC_COC_PROTECTION){
        CHG_OC_Counter++;
        if(CHG_OC_Counter >= CHG_OC_Protection_Delay_Cycle){
          G_Module_Status |= Module_C_OC;
          CHG_OC_Counter = 0;
          ///////////////////////////////////////////////////////////////////
          // Set Protection Flag,set counting time 100 (100 * 50 ms = 5 sec).
          //setCHGOverCurrentCounting(DeviceOn);
        }//if(gCHG_OC_Counter >= CHG_OC_Protection_Delay_Cycle){
      }else{
        CHG_OC_Counter = 0;
      }       

  
//      /////////////////////////////////////////////////////////////////////////////////////////////
//      // Check whether DSG MOSFET Failure, when DSG mosfet turn off
//      if((G_SystemFailureStatus == 0) && (G_Device_Action_Controls & DSG_MOS_TURNOFF_STABLE)){
//        if(((G_Device_Action_Controls & DSG_MOSFET_STATUS)==0) && (G_Module_Active_Status & Current_Dir_DSG) && (G_DSG_Current_ADC > 100)){
//          if(DSGMosFet_Fail_Counter >= MosFET_Protection_Delay_Cycle){
//            G_Indication_FailureMode_Status |= DSGMOSFETFail;
//          }else{
//            DSGMosFet_Fail_Counter++;
//          }
//        }else{
//          DSGMosFet_Fail_Counter = 0;
//        }
//      }else{
//        DSGMosFet_Fail_Counter = 0;
//      }
//      /////////////////////////////////////////////////////////////////////////////////////////////
//      // Check whether CHG MOSFET Failure, when CHG mosfet turn off
//      if((G_SystemFailureStatus == 0) && (G_Device_Action_Controls & CHG_MOS_TURNOFF_STABLE)){
//        if(((G_Device_Action_Controls & CHG_MOSFET_STATUS)==0) && (G_Module_Active_Status & Current_Dir_CHG) && (G_CHG_Current_ADC > 100)){
//          if(CHGMosFet_Fail_Counter >= MosFET_Protection_Delay_Cycle){
//            G_Indication_FailureMode_Status |= CHGMOSFETFail;
//          }else{
//            CHGMosFet_Fail_Counter++;
//          }
//        }else{
//          CHGMosFet_Fail_Counter = 0;
//        }
//      }else{
//        CHGMosFet_Fail_Counter = 0;
//      }
      
      
      
}




