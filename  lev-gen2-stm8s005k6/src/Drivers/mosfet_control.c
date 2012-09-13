

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
* Mos Fet Control_init															*
********************************************************************************/
void _Device_Init_MosControl_Function(void)
{
	// MOSFET
	GPIO_Init(C_MOS_PORT, C_MOS_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(D_MOS_PORT, D_MOS_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	//GPIO_WriteHigh(D_MOS_PORT, D_MOS_PIN);
}

void _Device_Set_MosFET(unsigned char MosFetCode, unsigned char enable){
    if( MosFetCode == CHG_MOSFET){
        if(enable){
            //DeviceOn
            GPIO_WriteHigh(C_MOS_PORT, C_MOS_PIN);
        }else{
            //DeviceOff
            GPIO_WriteLow(C_MOS_PORT, C_MOS_PIN);
        }
    }
    
    if( MosFetCode == DSG_MOSFET){
        if(enable){
            //DeviceOn
            GPIO_WriteHigh(D_MOS_PORT, D_MOS_PIN);
        }else{
            //DeviceOff
            GPIO_WriteLow(D_MOS_PORT, D_MOS_PIN);
        }
    }
    
}


