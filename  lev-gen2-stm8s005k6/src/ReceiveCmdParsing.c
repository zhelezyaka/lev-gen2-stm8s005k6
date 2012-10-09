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
    
    if(length < 1){
        receivedData[0] = Uart_Send_Error_Code; //high byte first, low byte second
        return 1;
    }
    
    cmd = receivedData[0];
    
    switch(cmd){
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
                receivedData[i] = *((unsigned char *)(CONFIG_SEGMENT + temp1 + i ));
            }
            returnLength = temp2;
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
                receivedData[i] = *(((unsigned int *)(CONFIG_SEGMENT + temp1)) + i );
            }
            returnLength = temp2;
            break;
        // write one byte EEPROM Data
        //uint receivedData[1]:Offset
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
        default:
            receivedData[0] = Uart_Send_Error_Code; //high byte first, low byte second
            returnLength = 1;
            break;
    }
    return returnLength;
}



