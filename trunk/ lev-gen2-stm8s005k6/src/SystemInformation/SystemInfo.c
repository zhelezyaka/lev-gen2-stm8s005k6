

//#include "stm8s.h"
#include "Global_config.h"
#include "Module_Driver_Define.h"
#include "User_Define_Parser.h"
//#include "Module_Variable_Define.h"
//#include "Module_Var_Bit_Define.h"
//#include "SystemInformation\SystemInfo.h"
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
#define EEPROMWriteRetry    3
/********************************************************************************
* System_Information_init	                            						*
********************************************************************************/
void SysInfo_init(){

    //updated Data
    G_RECORD_DATA_COUNT    =  RECORD_DATA_COUNT_EEPROM;
    G_MAX_DSG_C_ADC_RECORD =  MAX_DSG_C_ADC_RECORD_EEPROM;
    G_MAX_CHG_C_ADC_RECORD =  MAX_CHG_C_ADC_RECORD_EEPROM;
    G_MAX_VBAT_ADC_RECORD  =  MAX_VBAT_ADC_RECORD_EEPROM;
    G_MIN_VBAT_ADC_RECORD  =  MIN_VBAT_ADC_RECORD_EEPROM;
    G_MAX_TH1_ADC_RECORD   =  MAX_TH1_ADC_RECORD_EEPROM;
    G_MIN_TH1_ADC_RECORD   =  MIN_TH1_ADC_RECORD_EEPROM;
    G_MAX_TH2_ADC_RECORD   =  MAX_TH2_ADC_RECORD_EEPROM;
    G_MIN_TH2_ADC_RECORD   =  MIN_TH2_ADC_RECORD_EEPROM;
}

void UpdatedSystemRecordingInfoForPolling(){
    
    if(G_DSG_Current_ADC > G_MAX_DSG_C_ADC_RECORD){
        G_MAX_DSG_C_ADC_RECORD = G_DSG_Current_ADC;
    }
    if(G_CHG_Current_ADC > G_MAX_CHG_C_ADC_RECORD){
        G_MAX_CHG_C_ADC_RECORD = G_CHG_Current_ADC;
    }
    if(G_VBAT_ADC > G_MAX_VBAT_ADC_RECORD){
        G_MAX_VBAT_ADC_RECORD = G_VBAT_ADC;
    }
    if(G_VBAT_ADC < G_MIN_VBAT_ADC_RECORD){
        G_MIN_VBAT_ADC_RECORD = G_VBAT_ADC;
    }
    if(G_TH1_ADC > G_MAX_TH1_ADC_RECORD){
        G_MAX_TH1_ADC_RECORD = G_TH1_ADC;
    }
    if(G_TH1_ADC < G_MIN_TH1_ADC_RECORD){
        G_MIN_TH1_ADC_RECORD = G_TH1_ADC;
    }
    if(G_TH2_ADC > G_MAX_TH2_ADC_RECORD){
        G_MAX_TH2_ADC_RECORD = G_TH2_ADC;
    }
    if(G_TH2_ADC < G_MIN_TH2_ADC_RECORD){
        G_MIN_TH2_ADC_RECORD = G_TH2_ADC;
    }
}

void WriteSystemRecordingInfoToEEPROM(){
    //
    //unsigned long data;
    unsigned char count;
    unsigned char flag;
    
    //write record data count
    G_RECORD_DATA_COUNT++;
    //read data to internal
    count = 0;
    do{
        flag = EEPROM_ReadWholeEEPROMToInternalMemory();
        count++;
        if(count > EEPROMWriteRetry){
            break;
        }
    }while(flag == Data_Error);
    
    //set data to internal
    count = 0;
    do{
        flag = EEPROM_Set_Data_ToInternalMemory(RECORD_DATA_COUNT_EEPROM_Offset, (unsigned char *)(&G_RECORD_DATA_COUNT), RECORDING_DATA_NUMBER + RECORDING_DATA_NUMBER);
        count++;
        if(count > EEPROMWriteRetry){
            break;
        }
    }while(flag == Data_Error);
    
    //write data from internal to EEPROM
    count = 0;
    do{
        flag = EEPROM_WriteWholeEEPROMFromInternalMemory();
        count++;
        if(count > EEPROMWriteRetry){
            break;
        }
    }while(flag == Data_Error);    
    
}

//unsigned char SysInfo_init(){
//    unsigned char retry;
//    unsigned char flag;
//    
//    flag = false;
//    retry = 0;
//    while(retry <= ReadMemory_RetryTimes){
//        //SetLed_DirectIO_BITs(0xff);
//        flag = EEPROM_ReadWholeMemory(uEEPROM_OBJ.eepromBytesArray, Eeprom_segment_Size);
//        //SetLed_DirectIO_BITs(0);
//        if(flag == Data_Success){
//            break;
//        }else{
//            retry++;
//        }
//    }
//    if(flag == Data_Error){
//        return Data_Error;
//    }
//    for(int i=0; i < Eeprom_segment_Size; i++){
//        uEEPROM_OBJ.eepromBytesArray[i] = 0;
//    }
//    return Data_Success;
//}


