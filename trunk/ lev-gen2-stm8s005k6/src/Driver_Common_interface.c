

/********************************************************************************
* Include																		*
********************************************************************************/
#include "Devices.h"
#include "Global_config.h"
#include "Module_Driver_Define.h"
//#include "SystemInformation\User_Define_Parser.h"
//#include "Module_Variable_Define.h"
//#include "Module_Var_Bit_Define.h"
/********************************************************************************
* Extern Function                       										*
********************************************************************************/



/********************************************************************************
* Enum Variable define  														*
********************************************************************************/

/********************************************************************************
* Local file Variable										                    *
********************************************************************************/
unsigned char G_All_LED_Bits_Mask;
static unsigned char Button_INT_counter;


//////////////////////////////////////////////////
// System Clock Setup  : (section start)
void System_clk_setup(){
    _Device_System_clk_setup();
}
// System Clock Setup  : (section stop)
//////////////////////////////////////////////////
//////////////////////////////////////////////////
// Last Polling Function  : (section start)
void LastPollingFunction(void){
    G_Add_Device_Interface_Status |= LAST_POLLING_FLAG;
}
// Last Polling Function  : (section stop)
//////////////////////////////////////////////////
//////////////////////////////////////////////////
// LED function  : (section start)
void InitLEDDisplay(){
    unsigned char i = 0;
    unsigned char bit;
    
    G_All_LED_Bits_Mask = 0;
    for(i=0; i<LEDNumbers; i++){
        bit = 1;
        bit <<= i;
        G_All_LED_Bits_Mask |= bit;
    }
    
    G_LED_Interface_Status1 = 0;
    G_LED_Interface_Status2 = 0;
    _Device_Init_Led_Function();
}


void SetLed_DirectIO_BITs(unsigned char LEDNumBits){
    unsigned int temp = 0;
    temp = LEDNumBits & G_All_LED_Bits_Mask;
    //LEDNumBits = LEDNumBits & G_All_LED_Bits_Mask;
    //temp |= LEDNumBits;
    
    G_LED_Interface_Status1 = G_LED_Interface_Status1 & 0xff00;
    G_LED_Interface_Status1 |= temp;

    _Device_Set_Led_OnOff_BITs((unsigned char)G_LED_Interface_Status1);
}

void SetLed_DirectIO_Pin_OnOff(unsigned char LEDNumPin){
    unsigned int temp;
    temp = LEDNumPin & G_All_LED_Bits_Mask;
    //LEDNumPin = LEDNumPin & G_All_LED_Bits_Mask;
    //temp = LEDNumPin;

    _Device_Set_Led_Pin_OnOff((unsigned char)temp);
}

void SetLedLightOnFlag(unsigned char LEDNumBits, unsigned char enable){
    unsigned int temp = 0;
    temp = LEDNumBits & G_All_LED_Bits_Mask;
    //LEDNumBits = LEDNumBits & G_All_LED_Bits_Mask;
    //temp = LEDNumBits;
    if(enable == 0){
        G_LED_Interface_Status1 &= ~(temp << 8);
    }else{
        G_LED_Interface_Status1 |= (temp << 8);
    }    
}

void SetLedBlinkFlag(unsigned char LEDNumBits, unsigned char enable){
	unsigned int temp = 0;
    temp = LEDNumBits & G_All_LED_Bits_Mask;
    //LEDNumBits = LEDNumBits & G_All_LED_Bits_Mask;
    if(enable == 0){
        G_LED_Interface_Status2 &= ~temp;
    }else{
        G_LED_Interface_Status2 |= temp;
    }    
}

void SetLedPWMFunction(unsigned char LEDNumBits, unsigned char enable){
    unsigned int temp = 0;
    temp = LEDNumBits & G_All_LED_Bits_Mask;
    //temp = LEDNumBits;
    
    if(enable){
        //turn on
        G_LED_Interface_Status2 |= (temp << 8);
        _Device_Set_Led_PWM_BITs((unsigned char)(G_LED_Interface_Status2 >> 8));
    }else{
        //turn off
        G_LED_Interface_Status2 &= ~(temp << 8);
        _Device_Set_Led_PWM_BITs(0);
    }
    //_Device_Set_Led_PWM_BITs((unsigned char)(G_LED_Interface_Status2 >> 8));
    
}
void SetLedPWM20Steps(unsigned char PWM_Steps){
    //LEDNumBits = LEDNumBits & G_All_LED_Bits_Mask;
    _Device_Set_Led_PWM_20_Steps((unsigned char)(G_LED_Interface_Status2 >> 8), PWM_Steps);
}


void SetLedSerialTurnOnOff_ByIO(unsigned char enable){
    unsigned char bit;
    unsigned int i, j;
    SetLedPWMFunction(G_All_LED_Bits_Mask, TurnOff);
    SetLedBlinkFlag(G_All_LED_Bits_Mask, TurnOff);
    SetLedLightOnFlag(G_All_LED_Bits_Mask, TurnOff);
       
    if(enable){
        //turn on
        bit=0;
        for(i=0; i < LEDNumbers; i++){
            bit = (bit << 1) + 1;
            SetLed_DirectIO_Pin_OnOff(bit);
            for(j = 0; j < 1000;j++){
                delay_cycles(100); //about 960us at 4MHz
            }
        }
        SetLed_DirectIO_Pin_OnOff(0x00);
    }else{
        bit=G_All_LED_Bits_Mask;
        SetLed_DirectIO_Pin_OnOff(bit);
        for(i=0; i < LEDNumbers; i++){
            //SetLed_DirectIO_Pin_OnOff(~bit);
            for(j = 0; j < 1000;j++){
                delay_cycles(100); //about 960us at 4MHz
            }
            bit = (bit >> 1);
            SetLed_DirectIO_Pin_OnOff(bit);
        }
        SetLed_DirectIO_Pin_OnOff(0x00);
    }
}

void SetLedSerialTurnOnOff_ByTimer(unsigned char enable){
    unsigned char bit;
    unsigned int i, j;
    SetLedPWMFunction(G_All_LED_Bits_Mask, TurnOff);
    SetLedBlinkFlag(G_All_LED_Bits_Mask, TurnOff);
    SetLedLightOnFlag(G_All_LED_Bits_Mask, TurnOff);
       
    if(enable){
        //turn on
        bit=0;
        for(i=0; i < LEDNumbers; i++){
            bit = (bit << 1) + 1;
            SetLedLightOnFlag(bit, TurnOn);
            for(j = 0; j < 1000;j++){
                delay_cycles(100); //about 960us at 4MHz
            }
        }
        SetLedLightOnFlag(G_All_LED_Bits_Mask, TurnOff);
    }else{
        bit=G_All_LED_Bits_Mask;
        SetLedLightOnFlag(bit, TurnOn);
        for(i=0; i < LEDNumbers; i++){
            SetLedLightOnFlag(~bit, TurnOff);
            bit = (bit >> 1);
            for(j = 0; j < 1000;j++){
                delay_cycles(100); //about 960us at 4MHz
            }
        }
        SetLedLightOnFlag(G_All_LED_Bits_Mask, TurnOff);
    }
}


void SetLedFlashing(){
    unsigned char bit;
    unsigned int i, j;
    SetLedPWMFunction(G_All_LED_Bits_Mask, TurnOff);
    SetLedBlinkFlag(G_All_LED_Bits_Mask, TurnOff);
    SetLedLightOnFlag(G_All_LED_Bits_Mask, TurnOff);
    
    bit = 0;
    for(i=0; i < 15; i++){
        bit ^= 0x01;
        if(bit){
            SetLed_DirectIO_Pin_OnOff(0xff);
        }else{
            SetLed_DirectIO_Pin_OnOff(0x00);
        }
        for(j = 0; j < 100;j++){
            delay_cycles(100); //about 960us at 4MHz
        }
    }
    SetLed_DirectIO_Pin_OnOff(0x00);

}

#if _USE_5_LED_DISPLAY_    ==  0
// 4LEDs
void DisplayCapacity(unsigned char capacity, char isOn)
{
    if(isOn)
    {
        if(capacity <= CAPACITY_1){
            SetLedPWMFunction(LED1, TurnOn);
        }else if(capacity <= CAPACITY_2){
            SetLedPWMFunction(LED1 + LED2, TurnOn);
        }else if(capacity <= CAPACITY_3){
            SetLedPWMFunction(LED1 + LED2 + LED3, TurnOn);
        }else {
            SetLedPWMFunction(LED1 + LED2 + LED3 + LED4, TurnOn);
        }
    }
    else
    {
        SetLedPWMFunction(LED1 + LED2 + LED3 + LED4, TurnOff);
    }
}
#else
// 5LEDs
void DisplayCapacity(unsigned char capacity, char isOn)
{
    if(isOn)
    {
        if(capacity <= CAPACITY_1){
            SetLedPWMFunction(LED1, TurnOn);
        }else if(capacity <= CAPACITY_2){
            SetLedPWMFunction(LED1 + LED2, TurnOn);
        }else if(capacity <= CAPACITY_3){
            SetLedPWMFunction(LED1 + LED2 + LED3, TurnOn);
        }else if (capacity <= CAPACITY_4){
            SetLedPWMFunction(LED1 + LED2 + LED3 + LED4, TurnOn);
        }else{
            SetLedPWMFunction(LED1 + LED2 + LED3 + LED4 + LED5, TurnOn);
        }
    }
    else
    {
        SetLedPWMFunction(LED1 + LED2 + LED3 + LED4 + LED5, TurnOff);
    }
}
#endif
// LED function  : (section stop)
//////////////////////////////////////////////////



////////////////////////////////////////////
// MosFet control  : (section start)
void InitMosControl(){
    G_Device_Interface_Status1 &= ~CHG_MOSFET_STATUS;
    G_Device_Interface_Status1 &= ~DSG_MOSFET_STATUS;
    _Device_Init_MosControl_Function();
}
void setMosFET(unsigned char MosFetCode, unsigned char enable){
    if(enable == 0){
        _Device_Set_MosFET(MosFetCode, TurnOff);
        switch(MosFetCode){
            case CHG_MOSFET:
                G_Device_Interface_Status1 &= ~(CHG_MOSFET_STATUS);
                break;
            case DSG_MOSFET:
                G_Device_Interface_Status1 &= ~(DSG_MOSFET_STATUS);
                break;
            default:    break;
        }
    }else{
        _Device_Set_MosFET(MosFetCode, TurnOn);
        switch(MosFetCode){
            case CHG_MOSFET:
                G_Device_Interface_Status1 |= (CHG_MOSFET_STATUS);
                break;
            case DSG_MOSFET:
                G_Device_Interface_Status1 |= (DSG_MOSFET_STATUS);
                break;
            default:    break;
        }
    }
}
// MosFet control  : (section stop)
////////////////////////////////////////////

////////////////////////////////////////////
// Button control  : (section start)
void Interrupt_Calling_ButtonEvent_Press_Trigger(){
    G_Device_Interface_Status1 |= BUTTON_PRESS;
    if(G_Add_Device_Interface_Status & ENABLE_MULTI_CLICK_COUNTER){
        Button_INT_counter++;
        if(Button_INT_counter >= MULTI_CLICK_PRESS_TIMES){
            G_Device_Interface_Status1 |= BUTTON_MULTI_CLICK;
            G_Add_Device_Interface_Status &= ~ENABLE_MULTI_CLICK_COUNTER;
            Button_INT_counter = 0;
        }
    }else{
        G_Add_Device_Interface_Status |= ENABLE_MULTI_CLICK_COUNTER;
        Button_INT_counter = 1;
    }
}
void InitButtonEvent(){
    G_Device_Interface_Status1 &= ~BUTTON_PRESS;
    _Device_Init_Button_Event_Function();
    _Device_Set_Interrupt_ButtonEvent_Press_Trigger_Function(Interrupt_Calling_ButtonEvent_Press_Trigger);
}
unsigned char GetButtonStatus(){
    if(_Device_Get_Button_Status() == ButtonRelease){
        return ButtonRelease;
    }else{
        return ButtonPress;
    }
}

// Button control  : (section stop)
////////////////////////////////////////////


////////////////////////////////////////////
// Input Signal Pin control  : (section start)
void InitInputSignalPin(){
    G_Device_Interface_Status1 &= ~PIC_UVP_STATUS;
    G_Device_Interface_Status1 &= ~PIC_OVP_STATUS;
    _Device_Init_Input_Signal_Pin_Function();
}

unsigned char get_PIC_UVP_Status(){
    if(_Device_Get_PIC_UVP_Status() == TurnOff){
        G_Device_Interface_Status1 &= ~PIC_UVP_STATUS;
        return TurnOff;
    }else{
        G_Device_Interface_Status1 |= PIC_UVP_STATUS;
        return TurnOn;
    }
}

unsigned char get_PIC_OVP_Status(){
    if(_Device_Get_PIC_OVP_Status() == TurnOff){
        G_Device_Interface_Status1 &= ~PIC_OVP_STATUS;
        return TurnOff;
    }else{
        G_Device_Interface_Status1 |= PIC_OVP_STATUS;
        return TurnOn;
    }
}
// Input Signal Pin control  : (section stop)
////////////////////////////////////////////


////////////////////////////////////////////
// ADC Function Data Getting  : (section start)
////////////////////////////////////////////
void (*Intupt_For_ADC_Finish_ptr_fuc)(void);
void empty_For_ADC_finish_fun(void){}
void Exe_For_ADC_finish_fun(void){
    (*Intupt_For_ADC_Finish_ptr_fuc)();
    G_Device_Interface_Status1 &= ~ADC_SET_CONVERSION;
}
////////////////////////////////////////////
void InitADCFunction(){
    G_Device_Interface_Status1 &= ~ADC_CONVERSION;
    Intupt_For_ADC_Finish_ptr_fuc = empty_For_ADC_finish_fun;
    _Device_Init_ADC_Function();
}

void startAdcConversion(){
    G_Device_Interface_Status1 |= ADC_CONVERSION;
    G_Device_Interface_Status1 |= ADC_SET_CONVERSION;
    _Device_Start_ADC_Conversion();
}
void stopAdcConversion(){
    G_Device_Interface_Status1 &= ~ADC_CONVERSION;
    _Device_Stop_ADC_Conversion();
}
void Set_Interrupt_ADC_Conversion_Finish_Function(void (*calling_fun)()){
    Intupt_For_ADC_Finish_ptr_fuc = calling_fun;
    _Device_Set_Interrupt_ADC_Conversion_Finish_Function(Exe_For_ADC_finish_fun);
}
void Reomve_Interrupt_ADC_Conversion_Finish_Function(){
    Intupt_For_ADC_Finish_ptr_fuc = empty_For_ADC_finish_fun;
    _Device_Remove_Interrupt_ADC_Conversion_Finish_Function();
}
void Get_ADC_Values(unsigned int *valueArray, unsigned char length){
    _Device_Get_ADC_Conversion_Values(valueArray, length);
}

// ADC Function Data Getting  : (section stop)
////////////////////////////////////////////

////////////////////////////////////////////
// Timer (50ms)  : (section start)
void InitTimerFunction(){
    _Device_Timer3_init();
}
void DisableTimerFunction(){
    _Device_Disable_Timer3();
}
void Set_Interrupt_Timer_Calling_Function(unsigned char fun_index, void (*calling_fun)()){
    _Device_Set_Interrupt_Timer3_Calling_Function(fun_index, calling_fun);
}
void Remove_Interrupt_Timer_Calling_Function(unsigned char fun_index, void (*calling_fun)()){
    _Device_Remove_Interrupt_Timer3_Calling_Function(fun_index);
}
// Timer (50ms)  : (section stop)
////////////////////////////////////////////
////////////////////////////////////////////
// AWU Timer (50ms)  : (section start)
void InitAWUTimerFunction(){
    _Device_AWU_HALT_Timer_Init();
}
void DisableAWUTimerFunction(){
    _Device_Disable_AWU_HALT_Timer();
}
void Set_AWU_Shorter_Timer_Interval_Time_Base(){
    _Device_Set_AWU_Shorter_Timer_Interval_Time_Base();
}
void Set_AWU_Longer_Timer_Interval_Time_Base(){
    _Device_Set_AWU_Longer_Timer_Interval_Time_Base();
}
void Set_Interrupt_AWU_Timer_Calling_Function(unsigned char fun_index, void (*calling_fun)()){
    _Device_Set_AWU_Interrupt_Timer_Calling_Function(fun_index, calling_fun);
}
void Remove_Interrupt_AWU_Timer_Calling_Function(unsigned char fun_index, void (*calling_fun)()){
    _Device_Remove_AWU_Interrupt_Timer_Calling_Function(fun_index);
}
// AWU Timer (50ms)  : (section stop)
////////////////////////////////////////////
////////////////////////////////////////////
// Adapter SOC  : (section start)	
void InitAdapterOutputSignal(){
    G_Add_Device_Interface_Status &= ~ADP_SOC_Status;
    _Device_Init_Adapter_Output_Signal_Pin_Function();
}
void SetADPSOC(unsigned char enable){
    if(enable){
        G_Add_Device_Interface_Status |= ADP_SOC_Status;
    }else{
        G_Add_Device_Interface_Status &= ~ADP_SOC_Status;
    }
    _Device_Set_ADP_SOC(enable);
}
// Adapter SOC  : (section stop)	
////////////////////////////////////////////
////////////////////////////////////////////
// Uart2  : (section start)	

void InitUARTFunction(){
    _Device_Init_Uart();
    
    _Device_Set_Uart_Receive_Fram_Data_Calling_Function(ReceiveDataParsing);
    _Device_Set_Uart_RX_Interrupt(TurnOn);
}
void Set_Uart_RX_Interrupt(unsigned char enable){
    _Device_Set_Uart_RX_Interrupt(enable);
}
void UART_Send_Word_CRC(unsigned int *sendData, unsigned int length, unsigned char enable_with_PrecedingCode){
	unsigned int sendingLength, usCRC16;
    int i;
    
    if(length > GVarArraySize){
        length = GVarArraySize;
    }
	for(i = 0; i < length; i++){
        G_Communication_Array[i] = (*(sendData + i));
    }
    
    /* Calculate CRC16 checksum for Modbus-Serial-Line-PDU. */
    usCRC16 = usMBCRC16( ( unsigned char * ) G_Communication_Array, length * 2 );
    G_Communication_Array[length] = usCRC16;
    sendingLength = (length + 1) * 2;
    if(enable_with_PrecedingCode){
        //shift two arrays back
        for(i = length; i >= 0; i--){
            G_Communication_Array[i + 2] = G_Communication_Array[i];
        }
        
        G_Communication_Array[0] = PrecedingCheckCode;
        G_Communication_Array[1] = PrecedingCheckCode;
        G_Communication_Array[length + 2 + 1] = EndCheckCode;
        G_Communication_Array[length + 2 + 2] = EndCheckCode;
        sendingLength = (length + 1 + 2 + 2) * 2;
    }//if(enable_with_PrecedingCode){
    
//        /* Calculate CRC16 checksum for Modbus-Serial-Line-PDU. */
//        usCRC16 = usMBCRC16( ( UCHAR * ) pucSndBufferCur, usSndBufferCount );
//        ucRTUBuf[usSndBufferCount++] = ( UCHAR )( usCRC16 & 0xFF );
//        ucRTUBuf[usSndBufferCount++] = ( UCHAR )( usCRC16 >> 8 );
    _Device_Uart_Send_Byte(( unsigned char * ) G_Communication_Array, sendingLength); // send high byte first, send low byte second
}
void UART_Send_EEPROM_DATA_CRC_with_PrecedingCheckCode(){
	unsigned int sendingLength, usCRC16, val;
    int i;
    //unsigned char enable_with_PrecedingCode = true;
    unsigned int length = 64;
    //(*(PointerAttr uint8_t *) (uint16_t)Address)
    G_Communication_Array[0] = PrecedingCheckCode;
    G_Communication_Array[1] = PrecedingCheckCode;

    sendingLength = 0;
	for(i = 0; i < length; i++){
        val = (*((unsigned char *)(0x4000 + sendingLength)));
        sendingLength++;
        val = val << 8;
        val |= (*((unsigned char *)(0x4000 + sendingLength)));
        sendingLength++;
        G_Communication_Array[i + 2] = val;
    }
    
    /* Calculate CRC16 checksum for Modbus-Serial-Line-PDU. */
    usCRC16 = usMBCRC16( (( unsigned char * ) &(G_Communication_Array[2])), length * 2 );
    G_Communication_Array[length + 2] = usCRC16;
    G_Communication_Array[length + 2 + 1] = EndCheckCode;
    G_Communication_Array[length + 2 + 2] = EndCheckCode;
    sendingLength = (length + 1 + 2 + 2) * 2;
    _Device_Uart_Send_Byte(( unsigned char * ) G_Communication_Array, sendingLength); // send high byte first, send low byte second
}

void ReceiveDataParsing(unsigned char *receiveData, unsigned int length){
	unsigned int i, usCRC16;
    
    if(length > GVarArraySize + GVarArraySize){
        length = GVarArraySize + GVarArraySize;
    }
	for( i = 0; i < length; i++){
        ((unsigned char *)G_Communication_Array)[i] = (*(receiveData + i));
    }
    
    /* Calculate CRC16 checksum for Modbus-Serial-Line-PDU. */
    usCRC16 = usMBCRC16( ( unsigned char * ) G_Communication_Array, length - 2 );
    
    if(     (( unsigned char )( usCRC16 & 0xFF )) != ((unsigned char *)G_Communication_Array)[length - 1] || //llow byte
            (( unsigned char )( usCRC16 >> 8 ))  != ((unsigned char *)G_Communication_Array)[length - 2]){  // high byte
        // CRC16 checksum fail
        G_Communication_Array[0] = Uart_Send_Error_Code;
        UART_Send_Word_CRC(G_Communication_Array, 1, false);
        return;
    }else{
        // CRC16 checksum Pass
        i = ReceiveCmdParsing(G_Communication_Array, ((length - 2)>>1));
        //G_Communication_Array[0] = Read_funcition_code;
        if(i == 0){
           G_Communication_Array[0] = Uart_Send_Error_Code;
           i = 1;
        }
        UART_Send_Word_CRC(G_Communication_Array, i, false);
        
    }
    
}

// Uart2  : (section stop)	
////////////////////////////////////////////

////////////////////////////////////////////
// EEPROM  : (section start)	
void Init_EEPROM(){
    _Device_EEPROM_Init();
}
unsigned char EEPROM_WriteByte(unsigned int Address_Offset, unsigned char Data){
    if( _Device_EEPROM_WriteByte(Address_Offset, Data) == Data_Complete){
        return Data_Success;
    }else{
        return Data_Error;
    }
}
unsigned char EEPROM_WriteDoubleWord(unsigned int Address_Offset, unsigned long Data){
    if( _Device_EEPROM_WriteDoubleWord(Address_Offset, Data) == Data_Complete){
        return Data_Success;
    }else{
        return Data_Error;
    }
}
#ifdef RAM_EXECUTION
unsigned char EEPROM_WriteWholeMemory(unsigned char *array, unsigned char length){
    if( _Device_EEPROM_WriteWholeEEPROMMemory(array, length) == Data_Complete){
        return Data_Success;
    }else{
        return Data_Error;
    }
}
unsigned char EEPROM_ReadWholeMemory(unsigned char *array, unsigned char length){
    if( _Device_EEPROM_ReadWholeEEPROMMemory(array, length) == Data_Complete){
        return Data_Success;
    }else{
        return Data_Error;
    }
}

unsigned char EEPROM_ReadWholeEEPROMToInternalMemory( ){
    if( _Device_EEPROM_ReadWholeEEPROMToInternalMemory( ) == Data_Complete){
        return Data_Success;
    }else{
        return Data_Error;
    }
}
unsigned char EEPROM_Set_Data_ToInternalMemory(unsigned char offset, unsigned char *array, unsigned char length){
    if( _Device_EEPROM_Set_Data_ToInternalMemory(offset, array, length) == Data_Complete){
        return Data_Success;
    }else{
        return Data_Error;
    }
}
unsigned char EEPROM_WriteWholeEEPROMFromInternalMemory( ){
    if( _Device_EEPROM_WriteWholeEEPROMFromInternalMemory( ) == Data_Complete){
        return Data_Success;
    }else{
        return Data_Error;
    }
}
#endif
// EEPROM  : (section stop)	
////////////////////////////////////////////

////////////////////////////////////////////
////////////////////////////////////////////
////////////////////////////////////////////
void device_function_test(){ 
//    SetLed_DirectIO_OnOff(LED2, TurnOn);
//    SetLed_DirectIO_OnOff(LED2, TurnOff);
}
void device_function_test1(){
    _Device_uart_tim4_init();
    _Device_Set_Function_to_Timer_counter(10, device_function_test);
}
void device_function_test2(){
    _Device_Set_Function_to_Timer_counter(6, device_function_test);
}
