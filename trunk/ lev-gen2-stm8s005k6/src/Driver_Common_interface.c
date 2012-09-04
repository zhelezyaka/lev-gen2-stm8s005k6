

/********************************************************************************
* Include																		*
********************************************************************************/
#include "Global_config.h"
#include "Module_Driver_Define.h"
//#include "Module_Flash_Information.h"
//#include "Module_Variable_Define.h"
//#include "Module_Var_Bit_Define.h"
/********************************************************************************
* Extern Function for Device													*
********************************************************************************/
// LED control
void _Device_Init_Led_Function();
void _Device_Set_Led_PWM_Function(unsigned char LEDNumBits, unsigned char enable);
void _Device_Set_Led_OnOff(unsigned char LEDNumBits, unsigned char enable);
//Mos Fet Control
void _Device_Init_MosControl_Function();
void _Device_Set_MosFET(unsigned char MosFetCode, unsigned char enable);
void _Device_Set_Led_LightOnOff(unsigned char LEDNumCode, unsigned char enable);
//Button
void _Device_Init_Button_Event_Function();
unsigned char _Device_Get_Button_Status();
void _Device_Interrupt_Calling_ButtonEvent_Press_Trigger();
//void Interrupt_Calling_ButtonEvent_Release_Trigger();
//Input_Signal_Pin
void _Device_Init_Input_Signal_Pin_Function();
unsigned char _Device_Get_PIC_UVP_Status();
unsigned char _Device_Get_PIC_OVP_Status();
//ADC Function
void _Device_Init_ADC_Function();
void _Device_Start_ADC_Conversion();
void _Device_Stop_ADC_Conversion();
unsigned int _Device_Get_CHG_ADC_Values();
unsigned int _Device_Get_DSG_ADC_Values();
unsigned int _Device_Get_VBAT_ADC_Values();
unsigned int _Device_Get_Thermal1_ADC_Values();
unsigned int _Device_Get_Thermal2_ADC_Values();


/********************************************************************************
* Enum Variable define  														*
********************************************************************************/

/********************************************************************************
* Local file Variable										                    *
********************************************************************************/


//////////////////////////////////////////////////
// LED function  : (section start)
void InitLEDDisplay(){
    G_LED_Interface_Status1 = 0;
    G_LED_Interface_Status2 = 0;
    _Device_Init_Led_Function();
}


void SetLedOnOff(unsigned char LEDNumBits, unsigned char enable){
    LEDNumBits = LEDNumBits & All_LED_Bits_Mask;
    if(enable == 0){
        _Device_Set_Led_OnOff(LEDNumBits, TurnOff);
        G_LED_Interface_Status1 &= ~LEDNumBits;
    }else{
        _Device_Set_Led_OnOff(LEDNumBits, TurnOn);
        G_LED_Interface_Status1 |= LEDNumBits;
    }    
}

void SetLedLightOnFlag(unsigned char LEDNumBits, unsigned char enable){
    LEDNumBits = LEDNumBits & All_LED_Bits_Mask;
    if(enable == 0){
        G_LED_Interface_Status1 &= ~(LEDNumBits << 8);
    }else{
        G_LED_Interface_Status1 |= (LEDNumBits << 8);
    }    
}

void SetLedBlinkFlag(unsigned char LEDNumBits, unsigned char enable){
    LEDNumBits = LEDNumBits & All_LED_Bits_Mask;
    if(enable == 0){
        G_LED_Interface_Status2 &= ~LEDNumBits;
    }else{
        G_LED_Interface_Status2 |= LEDNumBits;
    }    
}

void SetLedPWMFunction(unsigned char LEDNumBits, unsigned char enable){
    LEDNumBits = LEDNumBits & All_LED_Bits_Mask;
    if(enable == 0){
        _Device_Set_Led_PWM_Function(LEDNumBits, TurnOff);
        G_LED_Interface_Status2 &= ~(LEDNumBits << 8);
    }else{
        _Device_Set_Led_PWM_Function(LEDNumBits, TurnOn);
        G_LED_Interface_Status2 |= (LEDNumBits << 8);
    }
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
void InitButtonEvent(){
    G_Device_Interface_Status1 &= ~BUTTON_PRESS;
    _Device_Init_Button_Event_Function();
}
unsigned char GetButtonStatus(){
    if(_Device_Get_Button_Status() == ButtonRelease){
        return ButtonRelease;
    }else{
        return ButtonPress;
    }
}

void _Device_Interrupt_Calling_ButtonEvent_Press_Trigger(){
    G_Device_Interface_Status1 |= BUTTON_PRESS;
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
unsigned int getCHGCurrentADC(){
    return _Device_Get_CHG_ADC_Values();
}
unsigned int getDSGCurrentADC(){
    return _Device_Get_DSG_ADC_Values();
}
unsigned int getVbatADC(){
    return _Device_Get_VBAT_ADC_Values();
}
unsigned int getThermal1ADC(){
    return _Device_Get_Thermal1_ADC_Values();
}
unsigned int getThermal2ADC(){
    return _Device_Get_Thermal2_ADC_Values();
}
// ADC Function Data Getting  : (section stop)
////////////////////////////////////////////
