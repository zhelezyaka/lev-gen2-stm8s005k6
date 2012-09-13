

/********************************************************************************
* Include																		*
********************************************************************************/
#include "Devices.h"
#include "Global_config.h"
#include "Module_Driver_Define.h"
//#include "Module_Flash_Information.h"
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


//////////////////////////////////////////////////
// System Clock Setup  : (section start)
void System_clk_setup(){
    _Device_System_clk_setup();
}
// System Clock Setup  : (section stop)
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


void SetLedOnOff(unsigned char LEDNumBits, unsigned char enable){
    LEDNumBits = LEDNumBits & G_All_LED_Bits_Mask;
    if(enable == 0){
        _Device_Set_Led_OnOff(LEDNumBits, TurnOff);
        G_LED_Interface_Status1 &= ~LEDNumBits;
    }else{
        _Device_Set_Led_OnOff(LEDNumBits, TurnOn);
        G_LED_Interface_Status1 |= LEDNumBits;
    }    
}

void SetLedLightOnFlag(unsigned char LEDNumBits, unsigned char enable){
    LEDNumBits = LEDNumBits & G_All_LED_Bits_Mask;
    if(enable == 0){
        G_LED_Interface_Status1 &= ~(LEDNumBits << 8);
    }else{
        G_LED_Interface_Status1 |= (LEDNumBits << 8);
    }    
}

void SetLedBlinkFlag(unsigned char LEDNumBits, unsigned char enable){
    LEDNumBits = LEDNumBits & G_All_LED_Bits_Mask;
    if(enable == 0){
        G_LED_Interface_Status2 &= ~LEDNumBits;
    }else{
        G_LED_Interface_Status2 |= LEDNumBits;
    }    
}

void SetLedPWMFunction(unsigned char LEDNumBits, unsigned char enable){
    LEDNumBits = LEDNumBits & G_All_LED_Bits_Mask;
    if(enable == 0){
        _Device_Set_Led_PWM_Function(LEDNumBits, TurnOff);
        G_LED_Interface_Status2 &= ~(LEDNumBits << 8);
    }else{
        _Device_Set_Led_PWM_Function(LEDNumBits, TurnOn);
        G_LED_Interface_Status2 |= (LEDNumBits << 8);
    }
}
void SetLedPWM20Steps(unsigned char PWM_Steps){
    //LEDNumBits = LEDNumBits & G_All_LED_Bits_Mask;
    _Device_Set_Led_PWM_20_Steps(PWM_Steps);
}

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
void InitADCFunction(){
    G_Device_Interface_Status1 &= ~ADC_CONVERSION;
    _Device_Init_ADC_Function();
}

void startAdcConversion(){
    G_Device_Interface_Status1 |= ADC_CONVERSION;
    _Device_Start_ADC_Conversion();
}
void stopAdcConversion(){
    G_Device_Interface_Status1 &= ~ADC_CONVERSION;
    _Device_Stop_ADC_Conversion();
}
void Set_Interrupt_ADC_Conversion_Finish_Function(void (*calling_fun)()){
    _Device_Set_Interrupt_ADC_Conversion_Finish_Function(calling_fun);
}
void Reomve_Interrupt_ADC_Conversion_Finish_Function(){
    _Device_Remove_Interrupt_ADC_Conversion_Finish_Function();
}
void Get_ADC_Values(unsigned int *valueArray, unsigned char length){
    _Device_Get_ADC_Conversion_Values(valueArray, length);
}

// ADC Function Data Getting  : (section stop)
////////////////////////////////////////////

////////////////////////////////////////////
// Timer1 (50ms)  : (section start)
void InitTimer1Function(){
    _Device_Timer3_init();
}
void Set_Interrupt_Timer1_Calling_Function(unsigned char fun_index, void (*calling_fun)()){
    _Device_Set_Interrupt_Timer1_Calling_Function(fun_index, calling_fun);
}
void Remove_Interrupt_Timer1_Calling_Function(unsigned char fun_index, void (*calling_fun)()){
    _Device_Remove_Interrupt_Timer1_Calling_Function(fun_index);
}

// Timer1 (50ms)  : (section stop)
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
