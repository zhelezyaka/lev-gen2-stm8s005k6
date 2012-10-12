/********************************************************************************
* Include																		*
********************************************************************************/
#include "Devices.h"
#include "Global_config.h"
#include "Module_Driver_Define.h"
#include "SystemInformation\User_Define_Parser.h"
//#include "Module_Variable_Define.h"
//#include "Module_Var_Bit_Define.h"


/********************************************************************************
* Define																		*
********************************************************************************/

/********************************************************************************
* Extern Function                       										*
********************************************************************************/



/********************************************************************************
* Enum Variable define  														*
********************************************************************************/

/********************************************************************************
* Local file Variable										                    *
********************************************************************************/

// return trasnmit length
unsigned int ReceiveCmdParsing(unsigned int *receivedData, unsigned int length){
    
    unsigned char flag;
    unsigned int cmd;
    unsigned int returnLength;
    unsigned int i, temp1, temp2;
    unsigned long word;
    
    if(length < 1){
        receivedData[0] = Uart_Send_Error_Code; //high byte first, low byte second
        return 1;
    }
    
    cmd = receivedData[0];
    
    switch(cmd){
        // read All ADC Data
        case 0xB000:
            receivedData[0] = Uart_Send_Response_Code; //high byte first, low byte second
            receivedData[1] = G_DSG_Current_ADC;
            receivedData[2] = G_CHG_Current_ADC;
            receivedData[3] = G_VBAT_ADC;
            receivedData[4] = G_TH1_ADC;
            receivedData[5] = G_SOC_ADC;
            receivedData[6] = G_TH2_ADC;
            returnLength = 7;
            break;        
        // From Calibation change to StartUp
        case 0xB100:
            if(length != 1){
                returnLength = 0;
                break;
            }
            G_Add_Device_Interface_Status |= SYSTEM_CHANGE_MODE;
            receivedData[0] = Uart_Send_Response_Code; //high byte first, low byte second
            returnLength = 1;
            break;        
        // read byte EEPROM Data
        //uint receivedData[1]: Offset
        //uint receivedData[2]: 1 byte Length
        case 0xd000:
            if(length != 3){
                returnLength = 0;
                break;
            }
            if(((receivedData[1] + receivedData[2]) > EEPROM_SIZE) || (receivedData[2] > 64)){
                returnLength = 0;
                break;
            }
            temp1 = receivedData[1];
            temp2 = receivedData[2];
            for(i=0; i< temp2; i++){
                receivedData[i+1] = *((unsigned char *)(CONFIG_SEGMENT + temp1 + i ));
            }
            receivedData[0] = Uart_Send_Response_Code; //high byte first, low byte second
            returnLength = temp2 + 1;
            break;
        // read 2bytes EEPROM Data
        //uint receivedData[1]: Offset
        //uint receivedData[2]: 2 bytes Length
        case 0xd001:
            if(length != 3){
                returnLength = 0;
                break;
            }
            if(((receivedData[1] + receivedData[2]) > EEPROM_SIZE) || (receivedData[2] > 64)){
                returnLength = 0;
                break;
            }
            temp1 = receivedData[1];
            temp2 = receivedData[2];
            for(i=0; i< temp2; i++){
                receivedData[i + 1] = *(((unsigned int *)(CONFIG_SEGMENT + temp1)) + i );
            }
            receivedData[0] = Uart_Send_Response_Code; //high byte first, low byte second
            returnLength = temp2 + 1;
            break;
        // write one byte EEPROM Data
        //uint receivedData[1]: Offset
        //uint receivedData[2]: write 1 byte Length
        //uint receivedData[3] ~ receivedData[3+Length]: write 1 byte data
        case 0xd100:
            if(length != (receivedData[2] + 3)){
                returnLength = 0;
                break;
            }
            if(((receivedData[1] + receivedData[2]) > EEPROM_SIZE) || (receivedData[2] > 64)){
                returnLength = 0;
                break;
            }
            for(i=0; i< receivedData[2]; i++){
                flag = EEPROM_WriteByte(receivedData[1] + i, (unsigned char)receivedData[ 3 + i ]);
                if(flag == Data_Error){
                    flag = EEPROM_WriteByte(receivedData[1] + i, (unsigned char)receivedData[ 3 + i ]);
                }
                if(flag == Data_Error){
                    break;
                }
            }
            if(flag == Data_Success){
                receivedData[0] = Uart_Send_Response_Code; //high byte first, low byte second
                returnLength = 1;
            }else{
                returnLength = 0;
            }
            break;
           
        // write word (4 bytes) EEPROM Data
        //uint receivedData[1]: Offset ==> offset 尾數必需為 0, 4, 8, F
        //uint receivedData[2]: write 1st and 2nd byte data
        //uint receivedData[3]: write 3rd and 4th byte data
        case 0xd101:
            if((length != 4)||(receivedData[1] >= 0x007c)){
                returnLength = 0;
                break;
            }
            flag = receivedData[1] & 0x0f;
            if((flag != 0) && (flag != 4) && (flag != 8) && (flag != 0x0c) &&(flag != 0x0f)){
                returnLength = 0;
                break;
            }
            word = receivedData[2];
            word = word << 16;
            word |= receivedData[3];
            flag = EEPROM_WriteDoubleWord(receivedData[1], word);
            if(flag == Data_Error){
                flag = EEPROM_WriteDoubleWord(receivedData[1], word);
            }
            if(flag == Data_Success){
                receivedData[0] = Uart_Send_Response_Code; //high byte first, low byte second
                returnLength = 1;
            }else{
                returnLength = 0;
            }
            break;            
        default:
            receivedData[0] = Uart_Send_Error_Code; //high byte first, low byte second
            returnLength = 1;
            break;
    }
    return returnLength;
}



