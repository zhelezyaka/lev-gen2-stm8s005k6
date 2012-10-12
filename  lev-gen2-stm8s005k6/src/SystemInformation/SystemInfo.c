

#include "stm8s.h"
#include "Global_config.h"
#include "Module_Driver_Define.h"
#include "User_Define_Parser.h"
//#include "Module_Variable_Define.h"
#include "Module_Var_Bit_Define.h"
#include "SystemInfo.h"
#include "DefinePollingFunctions.h"

/********************************************************************************
* Define																		*
********************************************************************************/
#define EEPROMWriteRetry    3

#define Recording_1_Sec_CycleTimes            15  //unit:cycles , 1 sec = System_1_Sec_Flag_CycleTimes * TimerIntervalTimeBase_MS
#define WriteRecordingData_Hours              24  //unit:hours
#define RecordingPolling_Start_Delay_CycleTimes            15  //unit:cycles , 1 sec = RecordingPolling_Start_Delay_CycleTimes * TimerIntervalTimeBase_MS

/********************************************************************************
* Extern Function																*
********************************************************************************/
/********************************************************************************
* Extern Variable																*
********************************************************************************/
void CoulombCounterForOneSecond(void);

/********************************************************************************
* Golbal Variable																*
********************************************************************************/


/********************************************************************************
* Local file Variable										                    *
********************************************************************************/
static unsigned int     _1_Sec_Counter;
static unsigned int     Total_Sec_Counter;
static unsigned int     Total_Hour_Counter;
static unsigned int     RecordingPolling_Start_Delay_Counter;
static unsigned long    sg_ADC_AccumulatingQ_RECORD;
//================================

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
    
    G_Cycle_Count_RECORD = Cycle_Count_RECORD_EEPROM;
    sg_ADC_AccumulatingQ_RECORD = ADC_AccumulatingQ_RECORD_EEPROM;
    
    _1_Sec_Counter = 0;
    Total_Sec_Counter = 0;
    Total_Hour_Counter = 0;
    RecordingPolling_Start_Delay_Counter = 0;
}

void UpdatedSystemRecordingInfoForPolling(){

    if(RecordingPolling_Start_Delay_Counter >= RecordingPolling_Start_Delay_CycleTimes){
        
        //Compare MAX/MIN data and updated
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
    }else{
        RecordingPolling_Start_Delay_Counter++;
    }
    
    // updated AccumulatingQ_RECORD
    G_ADC_AccumulatingQ_RECORD_Lo = (unsigned int)sg_ADC_AccumulatingQ_RECORD;
    G_ADC_AccumulatingQ_RECORD_Hi = (unsigned int)(sg_ADC_AccumulatingQ_RECORD >> 16);
    
    
    //Calculation Recording data time for writing to EEPROM
    if(_1_Sec_Counter >= Recording_1_Sec_CycleTimes){
        Total_Sec_Counter++;
        _1_Sec_Counter = 0;
        CoulombCounterForOneSecond();
    }else{
        _1_Sec_Counter++;
    }
    if(Total_Sec_Counter >= 3600){
        Total_Hour_Counter++;
        Total_Sec_Counter = 0;
    }
    if(Total_Hour_Counter >= WriteRecordingData_Hours){
        Total_Hour_Counter = 0;
        WriteSystemRecordingInfoToEEPROM();
    }
    
    ////////////////////////////////////////
    //  _Device_Set_ADP_SOC
    if((G_Cycle_Count_RECORD >= Cycle_Count_FOR_CHG_1st_TH) && (G_Cycle_Count_RECORD < Cycle_Count_FOR_CHG_2nd_TH)){
        SetADPSOC(TurnOn);
    }else{
        SetADPSOC(TurnOff);
    }
}
void CoulombCounterForOneSecond(void){
    if( G_Module_Status & Current_Dir_CHG){
        sg_ADC_AccumulatingQ_RECORD += G_CHG_Current_ADC;
        if(sg_ADC_AccumulatingQ_RECORD >= ADC_AccQ_FOR_CHG_TH){
            sg_ADC_AccumulatingQ_RECORD = 0;
            G_Cycle_Count_RECORD++;
        }
    }
    if(G_Cycle_Count_RECORD >= 0xfff0){
        G_Cycle_Count_RECORD = 0xfff0;
    }
}



#ifdef RAM_EXECUTION
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
#else
void WriteSystemRecordingInfoToEEPROM(){

    unsigned char count;
    unsigned char flag;
    
    unsigned long data;
    unsigned int intData;
    unsigned char chData1, chData2;
    //write word data (max dsg and chg adc) to eeprom
    data = G_MAX_DSG_C_ADC_RECORD;
    data = data << 16;
    data |= G_MAX_CHG_C_ADC_RECORD;
    count = 0;
    do{
        flag = EEPROM_WriteDoubleWord(MAX_DSG_C_ADC_RECORD_EEPROM_Offset, data);
        count++;
        if(count > EEPROMWriteRetry){
            break;
        }
    }while(flag == Data_Error);
    //write word data (max/min vbat adc) to eeprom
    data = G_MAX_VBAT_ADC_RECORD;
    data = data << 16;
    data |= G_MIN_VBAT_ADC_RECORD;
    count = 0;
    do{
        flag = EEPROM_WriteDoubleWord(MAX_VBAT_ADC_RECORD_EEPROM_Offset, data);
        count++;
        if(count > EEPROMWriteRetry){
            break;
        }
    }while(flag == Data_Error);
    //write word data (max/min th1 adc) to eeprom
    data = G_MAX_TH1_ADC_RECORD;
    data = data << 16;
    data |= G_MIN_TH1_ADC_RECORD;
    count = 0;
    do{
        flag = EEPROM_WriteDoubleWord(MAX_TH1_ADC_RECORD_EEPROM_Offset, data);
        count++;
        if(count > EEPROMWriteRetry){
            break;
        }
    }while(flag == Data_Error);
    //write word data (max/min th2 adc) to eeprom
    data = G_MAX_TH2_ADC_RECORD;
    data = data << 16;
    data |= G_MIN_TH2_ADC_RECORD;
    count = 0;
    do{
        flag = EEPROM_WriteDoubleWord(MAX_TH2_ADC_RECORD_EEPROM_Offset, data);
        count++;
        if(count > EEPROMWriteRetry){
            break;
        }
    }while(flag == Data_Error);
    
    //write bytes data ( G_RECORD_DATA_COUNT ) to eeprom
    //write record data count
    G_RECORD_DATA_COUNT++;
    
//    intData = G_RECORD_DATA_COUNT;
//    chData2 = (unsigned char)intData;   //Low byte
//    chData1 = (unsigned char)(intData >> 8);   //High byte
//    count = 0;
//    do{
//        flag = EEPROM_WriteByte(RECORD_DATA_COUNT_EEPROM_Offset, chData1);
//        count++;
//        if(count > EEPROMWriteRetry){
//            break;
//        }
//    }while(flag == Data_Error);
//    count = 0;
//    do{
//        flag = EEPROM_WriteByte(RECORD_DATA_COUNT_EEPROM_Offset + 1, chData2);
//        count++;
//        if(count > EEPROMWriteRetry){
//            break;
//        }
//    }while(flag == Data_Error);

    //write word data (G_RECORD_DATA_COUNT and Cycle_Count_RECORD ) to eeprom
    data = G_RECORD_DATA_COUNT;
    data = data << 16;
    data |= G_Cycle_Count_RECORD;
    count = 0;
    do{
        flag = EEPROM_WriteDoubleWord(RECORD_DATA_COUNT_EEPROM_Offset, data);
        count++;
        if(count > EEPROMWriteRetry){
            break;
        }
    }while(flag == Data_Error);    
    
    //write word data (G_ADC_AccumulatingQ_RECORD_Hi and Lo ) to eeprom
    data = G_ADC_AccumulatingQ_RECORD_Hi;
    data = data << 16;
    data |= G_ADC_AccumulatingQ_RECORD_Lo;
    count = 0;
    do{
        flag = EEPROM_WriteDoubleWord(ADC_AccumulatingQ_RECORD_EEPROM_Offset, data);
        count++;
        if(count > EEPROMWriteRetry){
            break;
        }
    }while(flag == Data_Error);    
    
}
#endif
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


