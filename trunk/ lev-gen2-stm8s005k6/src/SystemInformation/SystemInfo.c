

//#include "Module_Driver_Define.h"

//#include "stm8s.h"
//#include "Devices.h"
//#include "stm8s.h"
//#include "lev_device_define.h"
#include "User_Define_Common_Information.h"
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
//********************************************************************************/
#define ReadMemory_RetryTimes   3
//union {
//    unsigned char eepromBytesArray[Eeprom_segment_Size];
//    unsigned int eepromUintArray[Eeprom_segment_Size/2];
//}uEEPROM_OBJ;
/********************************************************************************
* System_Information_init	                            						*
********************************************************************************/
unsigned char SysInfo_init(){

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


