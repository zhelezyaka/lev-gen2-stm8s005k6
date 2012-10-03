
#include "SOC_OCV_Table.h"
#include "..\Module_Flash_Information.h"

//#include "..\LEV_PrjDefine.h"
//unsigned char OV_Capacity;
//unsigned char UV_Capacity;


//=====================================================================================================================
// OCV TABLE Line Current Range, 3 ocv lines, (DSG)
// Battery for a cell capacity ==> 2600 mAH * 4p
// 0.5C DSG = 1300 mA, 1C DSG = 2600 mA, 1.5C DSG = 3900 mA
// 4p cell==> 0.5C DSG = 5200 mA, 1C DSG = 10400 mA, 1.5C DSG = 15600 mA
//  _DSG_mA_to_ADC_factor_      0.0671744f (參考上面之設定)
// ADC 10 bit==> max adc = 1024
#define ADC_LOOKUP_1st_LEVEL_OCV_DSG_CURRENT_VALUES     175    // 2600mA; 2bytes;  CURRENT_OF_DSG_STATUS ~ 2600mA for 4p cell==>OCV
#define ADC_LOOKUP_2nd_LEVEL_OCV_DSG_CURRENT_VALUES     524    // 7800mA; 2bytes; 2600mA ~ 7800mA for 4p cell==>0.5C
#define ADC_LOOKUP_3rd_LEVEL_OCV_DSG_CURRENT_VALUES     873    // 13000mA; 2bytes; 7800mA 以上 for 4p cell==1C

//=====================================================================================================================
// OCV TABLE Line Current Range, 2 ocv lines, (CHG) 
// Battery for a cell capacity ==> 2600 mAH * 4p
// 0.2C CHG = 520 mA, 0.5C CHG = 1300 mA
// 4p cell==> 0.2C CHG = 2080 mA, 0.5C CHG = 5200 mA
//  _CHG_mA_to_ADC_factor_      0.098304f (參考上面之設定)
// ADC 10 bit==> max adc = 1024
#define ADC_LOOKUP_1st_LEVEL_OCV_CHG_CURRENT_VALUES     89    // 910mA; 2bytes;  CURRENT_OF_DSG_STATUS ~ 2600mA for 4p cell==>OCV
#define ADC_LOOKUP_2nd_LEVEL_OCV_CHG_CURRENT_VALUES     358    // 3640mA; 2bytes; 2600mA ~ 7800mA for 4p cell==>0.5C



float getCapacityByTable(int real_mVoltage, unsigned char cap_Index);

//float temp_f1;

//void InitSOC(){
//  //////////////////////////////////////////////////////////////////
//  temp_f1 = SOC_1st_CELL_OV_VOLTAGE;
//  //temp_f1 = temp_f1 / NUMBER_OF_BATTERY_SERIES * 10;
//  OV_Capacity = getCapacityByTable(SOC_1st_CELL_OV_VOLTAGE);
//  
//  temp_f1 = SOC_1st_CELL_UV_VOLTAGE;
//  //temp_f1 = temp_f1 / NUMBER_OF_BATTERY_SERIES * 10;
//  UV_Capacity = getCapacityByTable((int)temp_f1);
//}
unsigned char getCapacityByCellVoltage(int ADC_Voltage, int ADC_current,  unsigned char isDSG){
  float temp_f2;
  float cap;
  float OV_Capacity;
  float UV_Capacity;
  unsigned char index;
  int real_vol;

  temp_f2 = ADC_Voltage;
  temp_f2 = temp_f2 / VBAT_mV_To_ADC_Factor;
  real_vol = (unsigned int)(temp_f2 / NUMBER_OF_SERIES_CELLS);

  if(  isDSG ){
    //DSG
      if(ADC_current <= ADC_LOOKUP_1st_LEVEL_OCV_DSG_CURRENT_VALUES){
        index = RESIDUAL_OCV_CAPACITY_INDEX;
      }else if(ADC_current <= ADC_LOOKUP_2nd_LEVEL_OCV_DSG_CURRENT_VALUES){
        index = RESIDUAL_DSG_1st_CAPACITY_INDEX;
      }else if(ADC_current <= ADC_LOOKUP_3rd_LEVEL_OCV_DSG_CURRENT_VALUES){
        index = RESIDUAL_DSG_2nd_CAPACITY_INDEX;
      }else{
        index = RESIDUAL_DSG_3rd_CAPACITY_INDEX;
      }
  }else{
    //CHG
      if(ADC_current <= ADC_LOOKUP_1st_LEVEL_OCV_CHG_CURRENT_VALUES){
        index = RESIDUAL_OCV_CAPACITY_INDEX;
      }else if(ADC_current <= ADC_LOOKUP_2nd_LEVEL_OCV_CHG_CURRENT_VALUES){
        index = RESIDUAL_CHG_1st_CAPACITY_INDEX;
      }else{
        index = RESIDUAL_CHG_2nd_CAPACITY_INDEX;
      }
  }
  
  OV_Capacity = getCapacityByTable(MIN_CELL_OV_VOLTAGE_FOR_SOC, index);
  UV_Capacity = getCapacityByTable(MAX_CELL_UV_VOLTAGE_FOR_SOC, index);
  cap = getCapacityByTable( real_vol, index);
  
  temp_f2 = OV_Capacity - UV_Capacity;
  temp_f2 = (cap - UV_Capacity) / temp_f2 * 100;
  return (unsigned char)temp_f2;
}
#if 0
//用內插法，計算SOC
float getCapacityByTable(int real_mVoltage, unsigned char cap_Index){
  float cap;
  float cap1, dv;
  unsigned char i;
  
  cap1 = 0.0f;
  if(real_mVoltage >= RealOCVTable[0][TERMINAL_VOLTAGE_INDEX]){
    cap1 = RealOCVTable[0][cap_Index];
  }else if(real_mVoltage <= RealOCVTable[OCV_TABLE_POINTS - 1][TERMINAL_VOLTAGE_INDEX]){
    cap1 = RealOCVTable[OCV_TABLE_POINTS - 1][cap_Index];
  }else{
    for(i = 1; i < OCV_TABLE_POINTS; i++){
      if(real_mVoltage > RealOCVTable[i][TERMINAL_VOLTAGE_INDEX]){
        if(real_mVoltage == RealOCVTable[i - 1][TERMINAL_VOLTAGE_INDEX]){
          cap1 = RealOCVTable[i - 1][cap_Index];
        }else{
          cap1 = RealOCVTable[i][cap_Index];
          cap1 = RealOCVTable[i - 1][cap_Index] - cap1;
          dv = real_mVoltage - RealOCVTable[i][TERMINAL_VOLTAGE_INDEX];
          dv = dv / (RealOCVTable[i - 1][TERMINAL_VOLTAGE_INDEX] - RealOCVTable[i][TERMINAL_VOLTAGE_INDEX]);
          cap1 =  RealOCVTable[i][cap_Index] + (cap1 * dv);
        }
        break;
      }
    }
  }
  cap = (cap1/100);
  return cap;
}
#else
//用查表法，計算SOC
float getCapacityByTable(int real_mVoltage, unsigned char cap_Index){

  float cap1;
  unsigned char i;
  
  cap1 = 0.0f;
  if(real_mVoltage >= RealOCVTable[0][TERMINAL_VOLTAGE_INDEX]){
    cap1 = RealOCVTable[0][cap_Index];
  }else if(real_mVoltage <= RealOCVTable[OCV_TABLE_POINTS - 1][TERMINAL_VOLTAGE_INDEX]){
    cap1 = RealOCVTable[OCV_TABLE_POINTS - 1][cap_Index];
  }else{
    for(i = 1; i < OCV_TABLE_POINTS; i++){
      if(real_mVoltage > RealOCVTable[i][TERMINAL_VOLTAGE_INDEX]){
        //取較大值
        //cap1 = RealOCVTable[i - 1][cap_Index];
        //取較小值
        cap1 = RealOCVTable[i][cap_Index];
        break;
      }
    }
  }
  cap1 = (cap1/100);
  return cap1;
}
#endif
/*
unsigned int getCapacity1(int mVoltage){
  unsigned int cap;
  float cap1;
  long rm_ADC;
  unsigned char i,j;
  
  cap1 = 0.0f;
  if(mVoltage >= RealOCVTable[0][TERMINAL_VOLTAGE_INDEX]){
    cap1 = RealOCVTable[0][RESIDUAL_CAPACITY_INDEX];
  }else if(mVoltage <= RealOCVTable[OCV_TABLE_POINTS - 1][TERMINAL_VOLTAGE_INDEX]){
    cap1 = RealOCVTable[OCV_TABLE_POINTS - 1][RESIDUAL_CAPACITY_INDEX];
  }else{
    for(i = 0; i < (OCV_TABLE_POINTS - 1); i++){
      if(mVoltage < RealOCVTable[i][TERMINAL_VOLTAGE_INDEX]){
        cap1 = RealOCVTable[i + 1][RESIDUAL_CAPACITY_INDEX];
      }
    }
  }
  cap = cap1/100;
  return cap;
}

*/
