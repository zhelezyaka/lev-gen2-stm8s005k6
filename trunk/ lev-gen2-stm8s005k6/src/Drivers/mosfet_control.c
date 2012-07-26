

//#include "stm8s.h"
#include "lev_device_define.h"


/********************************************************************************
* Mos Fet Control_init															*
********************************************************************************/
void mosfetControl_init(void)
{
	// MOSFET
	GPIO_Init(C_MOS_PORT, C_MOS_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(D_MOS_PORT, D_MOS_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	///////////////////////////////////////////////////
	G_Activate_Action_Status &= ~(CHG_MOSFET_STATUS);
	G_Activate_Action_Status &= ~(DSG_MOSFET_STATUS);
	
	//GPIO_WriteHigh(D_MOS_PORT, D_MOS_PIN);
}

void setMosCHG(unsigned char enable){
  if(enable){
    //DeviceOn
    GPIO_WriteHigh(C_MOS_PORT, C_MOS_PIN);
    G_Activate_Action_Status |= (CHG_MOSFET_STATUS);
  }else{
    //DeviceOff
    GPIO_WriteLow(C_MOS_PORT, C_MOS_PIN);
    G_Activate_Action_Status &= ~(CHG_MOSFET_STATUS);
  }
//  if(G_Activate_Action_Status & (CHG_MOSFET_STATUS)){
//    P1OUT |= BIT6;
//  }else{
//    P1OUT &= ~BIT6;
//  }
}

void setMosDSG(unsigned char enable){
  if(enable){
    //DeviceOn
    GPIO_WriteHigh(D_MOS_PORT, D_MOS_PIN);
    G_Activate_Action_Status |= (DSG_MOSFET_STATUS);
  }else{
    //DeviceOff
    GPIO_WriteLow(D_MOS_PORT, D_MOS_PIN);
    G_Activate_Action_Status &= ~(DSG_MOSFET_STATUS);
  }
//  if(G_Activate_Action_Status & (DSG_MOSFET_STATUS)){
//    P1OUT |= BIT5;
//  }else{
//    P1OUT &= ~BIT5;
//  }
  
}

