

/********************************************************************************
* include           															*
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
* gpio_init																		*
********************************************************************************/
void _Device_Init_Input_Signal_Pin_Function(void){
    
	// UVP & OVP
	GPIO_Init(UVP_PORT, UVP_PIN, GPIO_MODE_IN_FL_NO_IT);
    GPIO_Init(OVP_PORT, OVP_PIN, GPIO_MODE_IN_FL_NO_IT);
    
//	// ADP Soc
//	GPIO_Init(ADP_SOC_PORT, ADP_SOC_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
//	//for Urat TX continues send out control
//	GPIO_Init(URAT_OUTPUT_CONTROL_PORT, URAT_OUTPUT_CONTROL_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
}

unsigned char _Device_Get_PIC_UVP_Status(){
  return (GPIO_ReadInputPin(UVP_PORT, UVP_PIN)== 0)? Signal_Low : Signal_High;
}
unsigned char _Device_Get_PIC_OVP_Status(){
  return (GPIO_ReadInputPin(OVP_PORT, OVP_PIN)== 0)? Signal_Low : Signal_High;
}

//void setADP_SOC(unsigned char enable){
//  if(enable){
//    //DeviceOn
//    GPIO_WriteHigh(ADP_SOC_PORT, ADP_SOC_PIN);
//    G_Activate_Action_Status |= (ADP_SOC_STATUS);
//  }else{
//    //DeviceOff
//    GPIO_WriteLow(ADP_SOC_PORT, ADP_SOC_PIN);
//    G_Activate_Action_Status &= ~(ADP_SOC_STATUS);
//  }
////  if(G_Activate_Action_Status & (ADP_SOC_STATUS)){
////  }else{
////  }
//}
//void setURAT_OUTPUT_CONTROL_PIN(unsigned char enable){
//  if(enable){
//    //DeviceOn
//    GPIO_WriteHigh(URAT_OUTPUT_CONTROL_PORT, URAT_OUTPUT_CONTROL_PIN);
//    G_Activate_Action_Status |= (URAT_SEND_OUT_PIN);
//  }else{
//    //DeviceOff
//    GPIO_WriteLow(URAT_OUTPUT_CONTROL_PORT, URAT_OUTPUT_CONTROL_PIN);
//    G_Activate_Action_Status &= ~(URAT_SEND_OUT_PIN);
//  }
////  if(G_Activate_Action_Status & (URAT_SEND_OUT_PIN)){
////  }else{
////  }
//}
