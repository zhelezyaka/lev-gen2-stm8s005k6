
/********************************************************************************
* Include																		*
********************************************************************************/
#include "Global_config.h"
#include "Module_Driver_Define.h"
#include "Module_Flash_Information.h"
#include "Module_Variable_Define.h"
#include "Module_Var_Bit_Define.h"
/********************************************************************************
* Define																        *
********************************************************************************/
/////////////////////////////////////////////////
// Current Sub Functions Vairable Define
#define DSG_OC_Protection_Delay_Cycle       3   //times
#define CHG_OC_Protection_Delay_Cycle       3   //times
#define Battery_OV_Protection_Delay_Cycle   3   //times
#define Battery_UV_Protection_Delay_Cycle   3   //times
#define DSG_Low_OT_Protection_Delay_Cycle   3   //times
#define DSG_High_OT_Protection_Delay_Cycle  3   //times
#define CHG_OT_Protection_Delay_Cycle       3   //times
#define UT_Protection_Delay_Cycle           3   //times

/********************************************************************************
* Extern Function																*
********************************************************************************/
/********************************************************************************
* Current File Define Function													*
********************************************************************************/
void GetAllADCValuesAndSetDirection();

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
static unsigned char Battery_OV_Counter;
static unsigned char Battery_UV_Counter;
static unsigned char DSG_Low_OT_Counter;
static unsigned char DSG_High_OT_Counter;
static unsigned char CHG_OT_Counter;
static unsigned char UT_Counter;

/********************************************************************************
* 															                    *
********************************************************************************/
void InitSubPollingProtectionVariables(){
    G_Module_Status = 0;
    G_Auxiliary_Module_Status = 0;
    
    
    DSG_OC_Counter = 0;
    CHG_OC_Counter = 0;
    Battery_OV_Counter = 0;
    Battery_UV_Counter = 0;
    DSG_Low_OT_Counter = 0;
    DSG_High_OT_Counter = 0;
    CHG_OT_Counter = 0;
    UT_Counter = 0;
}
/********************************************************************************
* 															                    *
********************************************************************************/
void GetAllADCValuesAndSetDirection(){
  
      G_DSG_Current_ADC = getDSGCurrentADC();
      G_CHG_Current_ADC = getCHGCurrentADC();
      G_VBAT_ADC = getVbatADC();
      G_TH1_ADC = getThermal1ADC();
      G_TH2_ADC = getThermal2ADC();

      /////////////////////////////////////////////////////////////////////////////////////////////
      // checking Current Direction status
      if(G_CHG_Current_ADC >= ADC_CURRENT_DETECT_FOR_CHG_STATUS){
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
        if(G_DSG_Current_ADC >= ADC_CURRENT_DETECT_FOR_DSG_STATUS){
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
    
    GetAllADCValuesAndSetDirection();
  
    /////////////////////////////////////////////////////////////////////////////////////////////
    // checking if it's D_OC
    // compare if Discharging Current greater than ADC_DOC_PROTECTION,
    // it will be into DSG OC protection.
    if(((G_Module_Status & Module_D_OC)==0) && G_DSG_Current_ADC >= ADC_DOC_PROTECTION){
    DSG_OC_Counter++;
    if(DSG_OC_Counter >= DSG_OC_Protection_Delay_Cycle){
      G_Module_Status |= Module_D_OC;
      DSG_OC_Counter = 0;
      ///////////////////////////////////////////////////////////////////
      // Set Protection Flag,set counting time 100 (100 * 50 ms = 5 sec).
      //setDSGOverCurrentCounting(DeviceOn);
    }//if(((G_Module_Status & Module_D_OC)==0) && G_DSG_Current_ADC >= ADC_DOC_PROTECTION){
    }else{
    DSG_OC_Counter = 0;
    }      
    /////////////////////////////////////////////////////////////////////////////////////////////
    // checking if it's C_OC
    // compare if Charging Current greater than ADC_COC_PROTECTION,
    // it will be into CHG OC protection.
    if(((G_Module_Status & Module_C_OC)==0) && G_CHG_Current_ADC >= ADC_COC_PROTECTION){
    CHG_OC_Counter++;
    if(CHG_OC_Counter >= CHG_OC_Protection_Delay_Cycle){
      G_Module_Status |= Module_C_OC;
      CHG_OC_Counter = 0;
      ///////////////////////////////////////////////////////////////////
      // Set Protection Flag,set counting time 100 (100 * 50 ms = 5 sec).
      //setCHGOverCurrentCounting(DeviceOn);
    }//if(((G_Module_Status & Module_C_OC)==0) && G_CHG_Current_ADC >= ADC_COC_PROTECTION){
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
 
      
    /////////////////////////////////////////////////////////////////////////////////////////////
    // checking if it's Battery OV
    if(((G_Module_Status & Module_BAT_OV)==0) && G_VBAT_ADC >= ADC_BATTERY_OV_PROTECTION){
    Battery_OV_Counter++;
    if(Battery_OV_Counter >= Battery_OV_Protection_Delay_Cycle){
      G_Module_Status |= Module_BAT_OV;
      Battery_OV_Counter = 0;
    }//if(((G_Module_Status & Module_BAT_OV)==0) && G_VBAT_ADC >= ADC_BATTERY_OV_PROTECTION){
    }else{
    Battery_OV_Counter = 0;
    }      
    
    /////////////////////////////////////////////////////////////////////////////////////////////
    // checking if it's Battery UV
    if(((G_Module_Status & Module_BAT_UV)==0) && G_VBAT_ADC >= ADC_BATTERY_UV_PROTECTION){
    Battery_UV_Counter++;
    if(Battery_UV_Counter >= Battery_UV_Protection_Delay_Cycle){
      G_Module_Status |= Module_BAT_UV;
      Battery_UV_Counter = 0;
    }//if(((G_Module_Status & Module_BAT_UV)==0) && G_VBAT_ADC >= ADC_BATTERY_UV_PROTECTION){
    }else{
    Battery_UV_Counter = 0;
    }      
    
    /////////////////////////////////////////////////////////////////////////////////////////////
    //Cell OV/UV protection and release
    if(get_PIC_UVP_Status()){
      G_Module_Status |= Module_PIC_UV;
    }else{
      G_Module_Status &= ~Module_PIC_UV;
    }
    if(get_PIC_OVP_Status()){
      G_Module_Status |= Module_PIC_OV;
    }else{
      G_Module_Status &= ~Module_PIC_OV;
    }   

    /////////////////////////////////////////////////////////////////////////////////////////////
    // checking if it's Aux OT without current direction
    // set DSG Low OT without current direction
    if((G_Auxiliary_Module_Status & DSG_LOW_OTA)==0){
        if((G_TH1_ADC <= ADC_DSG_OT_LOW_PROTECTION) || (G_TH2_ADC <= ADC_DSG_OT_LOW_PROTECTION)){
            DSG_Low_OT_Counter++;
            if(DSG_Low_OT_Counter >= DSG_Low_OT_Protection_Delay_Cycle){
                G_Auxiliary_Module_Status |= DSG_LOW_OTA;
                DSG_Low_OT_Counter = 0;
            }
        }else{
            DSG_Low_OT_Counter = 0;
        }
    }else{
        DSG_Low_OT_Counter = 0;
    }
    // set DSG High OT without current direction
    if((G_Auxiliary_Module_Status & DSG_HIGH_OTA)==0){
        if((G_TH1_ADC <= ADC_DSG_OT_HIGH_PROTECTION) || (G_TH2_ADC <= ADC_DSG_OT_HIGH_PROTECTION)){
            DSG_High_OT_Counter++;
            if(DSG_High_OT_Counter >= DSG_High_OT_Protection_Delay_Cycle){
                G_Auxiliary_Module_Status |= DSG_HIGH_OTA;
                DSG_High_OT_Counter = 0;
            }
        }else{
            DSG_High_OT_Counter = 0;
        }
    }else{
        DSG_High_OT_Counter = 0;
    }
    // release DSG High OT without current direction
    if(G_Auxiliary_Module_Status & DSG_HIGH_OTA){
        if((G_TH1_ADC > ADC_DSG_OT_HIGH_RELEASE) && (G_TH2_ADC > ADC_DSG_OT_HIGH_RELEASE)){
            G_Auxiliary_Module_Status &= ~DSG_HIGH_OTA;
        }
    }
    // release DSG Low OT without current direction
    if(G_Auxiliary_Module_Status & DSG_LOW_OTA){
        if((G_TH1_ADC > ADC_DSG_OT_LOW_RELEASE) && (G_TH2_ADC > ADC_DSG_OT_LOW_RELEASE)){
            G_Auxiliary_Module_Status &= ~DSG_LOW_OTA;
        }
    }
    
    ///////////////////////////////////////////////////////////////////////////
    //Check High current for DSG OT_PROTECTION
    if( G_DSG_Current_ADC >=  ADC_DSG_HIGH_CURRENT_DETECT){
      G_Auxiliary_Module_Status |= DSG_HIGH_CURRENT_FOR_OT;
    }else{
      G_Auxiliary_Module_Status &= ~DSG_HIGH_CURRENT_FOR_OT;
    }
    
    ///////////////////////////////////////////////////////////////////////////
    // set DSG OT Protection Level
    // when current reach high, use high OT setting for protection
    if(((G_Auxiliary_Module_Status & USE_DSG_HIGH_OT_SETTING)==0) && (G_Auxiliary_Module_Status & DSG_HIGH_CURRENT_FOR_OT)){
      G_Auxiliary_Module_Status |= USE_DSG_HIGH_OT_SETTING;
    }
    if((G_Auxiliary_Module_Status & USE_DSG_HIGH_OT_SETTING) &&((G_Auxiliary_Module_Status & DSG_HIGH_CURRENT_FOR_OT)==0)){
        if((G_Auxiliary_Module_Status & (DSG_LOW_OTA + DSG_HIGH_OTA)) == 0){
            G_Auxiliary_Module_Status &= ~USE_DSG_HIGH_OT_SETTING;
        }
    }

    ///////////////////////////////////////////////////////////////////////////
    // set System DSG OT Protection without current 
    if((G_Auxiliary_Module_Status & DSG_HIGH_OTA) && (G_Auxiliary_Module_Status & USE_DSG_HIGH_OT_SETTING)){
        G_Module_Status |= Module_DSG_OT;
    }else if((G_Auxiliary_Module_Status & DSG_LOW_OTA) && ((G_Auxiliary_Module_Status & USE_DSG_HIGH_OT_SETTING)==0)){
        G_Module_Status |= Module_DSG_OT;
    }else if((G_Auxiliary_Module_Status & (DSG_LOW_OTA + DSG_HIGH_OTA)) == 0){
        G_Module_Status &= ~Module_DSG_OT;
    }
    
    
    ///////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////
    //checking if it's CHG_OT without current direction
    if((G_Module_Status & Module_CHG_OT)==0){
        if((G_TH1_ADC <= ADC_CHG_OT_PROTECTION) || (G_TH2_ADC <= ADC_CHG_OT_PROTECTION)){
            CHG_OT_Counter++;
            if(CHG_OT_Counter >= CHG_OT_Protection_Delay_Cycle){
                G_Module_Status |= Module_CHG_OT;
                CHG_OT_Counter = 0;
            }
        }else{
            CHG_OT_Counter = 0;
        }
    }else{
        CHG_OT_Counter = 0;
    }
    ///////////////////////////////////////////////////////////////////////////
    // release CHG OT without current direction
    if(G_Module_Status & Module_CHG_OT){
        if((G_TH1_ADC > ADC_CHG_OT_RELEASE) && (G_TH2_ADC > ADC_CHG_OT_RELEASE)){
            G_Module_Status &= ~Module_CHG_OT;
        }
    }

    ///////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////
    //checking if it's UT without current direction
    if((G_Module_Status & Module_UT)==0){
        if((G_TH1_ADC >= ADC_UT_PROTECTION) || (G_TH2_ADC >= ADC_UT_PROTECTION)){
            UT_Counter++;
            if(UT_Counter >= UT_Protection_Delay_Cycle){
                G_Module_Status |= Module_UT;
                UT_Counter = 0;
            }
        }else{
            UT_Counter = 0;
        }
    }else{
        UT_Counter = 0;
    }
    ///////////////////////////////////////////////////////////////////////////
    // release UT without current direction
    if(G_Module_Status & Module_UT){
        if((G_TH1_ADC < ADC_UT_RELEASE) && (G_TH2_ADC < ADC_UT_RELEASE)){
            G_Module_Status &= ~Module_UT;
        }
    }
        
    
    
}



