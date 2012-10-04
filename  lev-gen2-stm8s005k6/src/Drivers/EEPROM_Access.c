
/********************************************************************************
* include file				        											*
********************************************************************************/
#include "stm8s.h"
#include "Devices.h"
//#include "stm8s.h"
//#include "lev_device_define.h"
/********************************************************************************
* extern include file															*
********************************************************************************/
#include "Module_Driver_Define.h"

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

/********************************************************************************
* local Variable																*
********************************************************************************/
unsigned char eepromArray[Eeprom_segment_Size];


void _Device_EEPROM_Init(){
    
    /* Define FLASH programming time */
    FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);

    
    for(int i=0; i < Eeprom_segment_Size; i++){
        eepromArray[i] = 0;
    }
        

//    /* Unlock Data memory */
//    FLASH_Unlock(FLASH_MEMTYPE_DATA);
//    
//    /* Lock Data memory */
//    FLASH_Lock(FLASH_MEMTYPE_DATA);
    
    

    //1.STM8S105 has no RWW function. So programming data in eeprom will halt the MCU
    //2.Customer should use the EOP bit to judge the STM8 EEPROM programming end instead of HV OFF. HV OFF means MCU go back to normal status from halt status.
    //3.Reserve bit is not for customer use. It is reserved for future or internal usage.
    //while(!(FLASH_IAPSR & 0x04));
}

// abour 5.6ms
unsigned char _Device_EEPROM_WriteByte(unsigned int Address_Offset, unsigned char Data){
    
    unsigned char val;
    
    if(Address_Offset >= Eeprom_segment_Size){
        return Data_Fail;   //fail
    }
    
    /* Define FLASH programming time */
    FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);

    /* Unlock Data memory */
    FLASH_Unlock(FLASH_MEMTYPE_DATA);

    /* Program byte at the address */
    FLASH_ProgramByte(Eeprom_segment_Start_Add + Address_Offset, Data);

    
    /* Check program action */
    val = FLASH_ReadByte(Eeprom_segment_Start_Add + Address_Offset);
    /* Lock Data memory */
    FLASH_Lock(FLASH_MEMTYPE_DATA);
    if (val != Data)
    {
        /* Error */
        //OperationStatus = FAILED;
        ///* OperationStatus = PASSED, if the data written/read to/from DATA EEPROM memory is correct */
        ///* OperationStatus = FAILED, if the data written/read to/from DATA EEPROM memory is corrupted */
        return Data_Fail;    //fail
    }else{
        return Data_Complete;    //pass
    }
}

// abour 5.6ms
unsigned char _Device_EEPROM_WriteDoubleWord(unsigned int Address_Offset, unsigned long Data){
    
    unsigned char val, val1, check;
    
    
    if(Address_Offset >= Eeprom_segment_Size){
        return Data_Fail;   //fail
    }
    
    /* Define FLASH programming time */
    FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);

    /* Unlock Data memory */
    FLASH_Unlock(FLASH_MEMTYPE_DATA);

    /* Program Dword at the address*/
    FLASH_ProgramWord(Eeprom_segment_Start_Add + Address_Offset, Data);

    
    /* Check program action */
    check = 0;
    for(int i=0; i<4; i++){
    //GPIO_WriteHigh(LED1_PORT, LED1_PIN);
        val = FLASH_ReadByte(Eeprom_segment_Start_Add + Address_Offset + i);
    //GPIO_WriteLow(LED1_PORT, LED1_PIN);
        val1 = *((unsigned char *)(&Data)+i);
        if (val != val1)
        {
            /* Error */
            //OperationStatus = FAILED;
            ///* OperationStatus = PASSED, if the data written/read to/from DATA EEPROM memory is correct */
            ///* OperationStatus = FAILED, if the data written/read to/from DATA EEPROM memory is corrupted */
            check += 1;    //fail
        }else{
            check += 0;    //pass
        }
        
    }
    
    /* Lock Data memory */
    FLASH_Lock(FLASH_MEMTYPE_DATA);
    
    if(check == 0){
        return Data_Complete;
    }else{
        return Data_Fail;
    }
}

unsigned char _Device_EEPROM_WriteWholeEEPROMMemory(unsigned char *array, unsigned char length){

    /*----------------------------- LOCAL VARIABLES -------------------------*/
    unsigned int Write_Block;
    /*---------------------------------- CODE -------------------------------*/
    if(length != Eeprom_segment_Size){
        return Data_Fail;   //fail
    }

//    for(int i=0; i < length; i++){
//        eepromArray[i] = array[i];
//    }

    /* Define FLASH programming time */
    FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);

    /* Unlock Data memory */
    FLASH_Unlock(FLASH_MEMTYPE_DATA);

    Write_Block = 0;    // write block 0 is first block of Data Memory: address in 0x4000
    FLASH_ProgramBlock(Write_Block, FLASH_MEMTYPE_DATA, FLASH_PROGRAMMODE_STANDARD, array);
    FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
    
    return Data_Complete;   //pass
}

unsigned char _Device_EEPROM_ReadWholeEEPROMMemory(unsigned char *array, unsigned char length){

    /*----------------------------- LOCAL VARIABLES -------------------------*/
    /*---------------------------------- CODE -------------------------------*/
    if(length != Eeprom_segment_Size){
        return Data_Fail;   //fail
    }

    for(int i=0; i < Eeprom_segment_Size; i++){
        array[i] = FLASH_ReadByte(Eeprom_segment_Start_Add + i);
    }

//    for(int i=0; i<length; i++){
//        array[i] = eepromArray[i];
//    }
    
    return Data_Complete;   //pass
}

unsigned char _Device_EEPROM_ReadWholeEEPROMToInternalMemory(){

    /*----------------------------- LOCAL VARIABLES -------------------------*/
    /*---------------------------------- CODE -------------------------------*/

    for(int i=0; i < Eeprom_segment_Size; i++){
        eepromArray[i] = FLASH_ReadByte(Eeprom_segment_Start_Add + i);
    }
    
    return Data_Complete;   //pass
}
unsigned char _Device_EEPROM_Set_Data_ToInternalMemory(unsigned char offset, unsigned char *array, unsigned char length){
    
    if((offset + length) > Eeprom_segment_Size){
        return Data_Fail;   //fail
    }
    for(int i=0; i < length; i++){
        eepromArray[offset + i] = array[i];
    }
    return Data_Complete;   //pass
}

unsigned char _Device_EEPROM_WriteWholeEEPROMFromInternalMemory(){

    /*----------------------------- LOCAL VARIABLES -------------------------*/
    unsigned int Write_Block;
    /*---------------------------------- CODE -------------------------------*/

    /* Define FLASH programming time */
    FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);

    /* Unlock Data memory */
    FLASH_Unlock(FLASH_MEMTYPE_DATA);
    
    Write_Block = 0;    // write block 0 is first block of Data Memory: address in 0x4000
    FLASH_EraseBlock(Write_Block, FLASH_MEMTYPE_DATA);
    FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);

    FLASH_ProgramBlock(Write_Block, FLASH_MEMTYPE_DATA, FLASH_PROGRAMMODE_STANDARD, eepromArray);
    FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
    
    /* Lock Data memory */
    FLASH_Lock(FLASH_MEMTYPE_DATA);

    return Data_Complete;   //pass
}