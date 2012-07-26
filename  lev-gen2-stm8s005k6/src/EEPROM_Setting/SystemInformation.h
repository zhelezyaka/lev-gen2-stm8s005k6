

#include "lev_global_config.h"


/********************************************************************************
* Define																		*
********************************************************************************/
///////////////////////////////////////////////////////////
// Define EEPROM Segment Address (one segment = 1024 bytes)
///////////////////////////////////////////////////////////
#define Eeprom_segment_Size			1024  // bytes
#define Eeprom_segment_Start_Add	0x4000// address
#define Eeprom_segment_End_Add		0x43FF// address
///////////////////////////////////////////////////////////
// Define EEPROM Array Size, have to follow the order
///////////////////////////////////////////////////////////
#define Record_Eeprom_Uint_Array_Size		10	//size * 2 bytes
#define Record_Eeprom_Ulong_Array_Size		2	//size * 4 bytes
#define Eeprom_Uint_Array_Size				200	//size * 2 bytes	//for config setting
#define Eeprom_Ulong_Array_Size				20	//size * 4 bytes	//for config setting
#define Eeprom_Float_Array_Size				20	//size * 4 bytes	//for config setting
#define Eeprom_Uchar_Array_Size				20	//size * 1 bytes	//for config setting
///////////////////////////////////////////////////////////
// Define EEPROM Array Address, have to follow the order
///////////////////////////////////////////////////////////
#define Record_Eeprom_Uint_Array_Address		(Eeprom_segment_Start_Add)
#define Record_Eeprom_Ulong_Array_Address		((Record_Eeprom_Uint_Array_Size * 2) + Record_Eeprom_Uint_Array_Address)
#define Eeprom_Uint_Array_Address				((Record_Eeprom_Ulong_Array_Size * 4) + Record_Eeprom_Ulong_Array_Address)
#define Eeprom_Ulong_Array_Address				((Eeprom_Uint_Array_Size * 2) + Eeprom_Uint_Array_Address)
#define Eeprom_Float_Array_Address				((Eeprom_Ulong_Array_Size * 4) + Eeprom_Ulong_Array_Address)
#define Eeprom_Uchat_Array_Address				((Eeprom_Float_Array_Size * 4) + Eeprom_Float_Array_Address)

/********************************************************************************
* Extern Function																*
********************************************************************************/

/********************************************************************************
* Extern Variable																*
********************************************************************************/
#if _BURN_IN_EEPROM_SEG_BY_STVD_DEBUG_ > 0 
extern EEPROM unsigned int record_eeprom_uint_array[];
extern EEPROM unsigned long record_eeprom_ulong_array[];
extern EEPROM unsigned int eeprom_uint_array[];
extern EEPROM unsigned long eeprom_ulong_array[];
extern EEPROM float eeprom_float_array[];
extern EEPROM unsigned char eeprom_uchar_array[];
#endif
/********************************************************************************
* Define																		*
********************************************************************************/
#define MANUFACTURE_DATE_YEAR   2012
#define MANUFACTURE_DATE_MONTH  5
#define MANUFACTURE_DATE_DAY    8
#define PRODUCT_NAME            "LEV"
#define PRODUCT_NAME_LENGTH     3

#define Serial_Number			1//2 bytes
#define Version					1//2 bytes	
#define MinorVersion			0//2 bytes

//////////////////////////////////////////////////////////////////////////////////////////////////
// LEV System Initial config Data
// Used by SystemConfigInitialData.s43 to save into Flash Memory while downloading code into MCU
//////////////////////////////////////////////////////////////////////////////////////////////////

#define _SERIAL_NUMBER_                       Serial_Number     //uint, 2 bytes
#define _VERSION_		                      Version			//uint, 2 bytes
#define _MINOR_VERSION_		                  MinorVersion		//uint, 2 bytes
#define _MANUFACTURE_DATE_                    (MANUFACTURE_DATE_YEAR - 1980) * 512 + MANUFACTURE_DATE_MONTH * 32 + MANUFACTURE_DATE_DAY //uint,  2 bytes

#define _NUMBER_OF_PARALLEL_CELLS_            4                 //uint, 2 bytes
#define _NUMBER_OF_SERIES_CELLS_              10                //uint, 2 bytes

//=====================================================================================================================
// CHG / DSG Current Detector (op amp)
////////////////////////////////////////////////////////////////////////////////
//ADC_resolution  1024    // 10 bit ADC
//ADC_Ref         3300    // mV
//ADC_Step        3.22265625f  ==>(float)ADC_Ref /  ADC_resolution ==> (mV)
////////////////////////////////////////////////////////////////////////////////
//Rsense          3.3333f    //mR
////////////////////////////////////////////////////////////////////////////////
//mA to ADC factor 
//Factor = Rsense(R) * op_gain / ADC step(mV) => Multiplicative inverse Factor
////////////////////////////////////////////////////////////////
// CHG_OP_Gain               120.0f ==>max current 8.25A
// _CHG_mA_to_ADC_factor_    0.12412f   ==> (Rsense * CHG_OP_Gain / ADC_Step / 1000)==>小數點6位
// CHG_OP_ADC_OFFSET         (signed char)0    //實際值-理論值 
// 理論值 = 實際值 - Offset
#define _CHG_mA_To_ADC_Factor_          0.12412f        //float, 4 bytes;
////////////////////////////////////////////////////////////////
// DSG_OP_Gain                120.0f ==>max current 8.25A
// _DSG_mA_to_ADC_factor_      0.12412f  ==> (Rsense*DSG_OP_Gain/ADC_Step/1000)==>小數點6位
// DSG_OP_ADC_OFFSET         (signed char)0    //實際值-理論值 
// 理論值 = 實際值 - Offset
#define _DSG_mA_To_ADC_Factor_          0.12412f       //float,  4 bytes;
////////////////////////////////////////////////////////////////////////////////
//(無條件進位==> 會比實際值還大一點)
//(使用四捨五入)
#define _ADC_DETECT_CURRENT_OF_DSG_STATUS_     6      //50mA; unit: ADC code; uint, 2bytes; if current > the define, in discharging status
#define _ADC_DETECT_CURRENT_OF_CHG_STATUS_     6      //50mA; unit: ADC code; uint, 2bytes; if current > the define, in charging status
#define _ADC_DOC_PROTECTION_                   2482   // 20A; unit: ADC code; uint, 2bytes; discharging current protection is positive
#define _ADC_COC_PROTECTION_                   620    // 5A; unit: ADC code; uint, 2bytes; charging current protection

//=====================================================================================================================
// Battery Voltage circuit and setting
////////////////////////////////////////////////////////////////
//    Battery |------Resistor1----+---Resistor2-----|GND
//    Vltage  |       1000KR      |   43.2KR
//                                |
//                                |
//                       voltage output 
//                       to MCU ADC in
////////////////////////////////////////////////////////////////
//VBAT_mV_To_ADC_Factor    (float)1/(ADC_Step/(VBAT_Resistor2/(VBAT_Resistor1+VBAT_Resistor2))==>小數點6位
//ADC_Step        2.44140625f //  mv/step
// _VBAT_mV_To_ADC_Factor_      0.016962f ==> _VBAT_10mV_To_ADC_Factor_    0.16962f  ==> VBAT_mV_To_ADC_Factor * 10
//VBAT_ADC_OFFSET          (signed char)(-5)   //實際值-理論值
#define _VBAT_mV_To_ADC_Factor_         0.016962f        //float,   4 bytes;
// 理論值 = 實際值 - Offset
////////////////////////////////////////////////////////////////
#define _ADC_2ND_BATTERY_OV_PROTECTION_       717 // 42.3V; unit:  ADC code; uint, 2bytes; 2nd level BATTERY OV PROTECTION
#define _ADC_2ND_BATTERY_OV_RELEASE_          704 // 41.5V; unit: ADC code; uint, 2bytes; 2nd level BATTERY OV RELEASE
#define _ADC_2ND_BATTERY_UV_PROTECTION_       526 // 31V; unit: ADC code; uint, 2bytes; 2nd level BATTERY UV PROTECTION
#define _ADC_2ND_BATTERY_UV_RELEASE_          543 // 32V; unit: ADC code; uint, 2bytes; 2nd level BATTERY UV RELEASE 

//=====================================================================================================================
// NTC Thermistor setting by voltage
////////////////////////////////////////////////////////////////
//    VDD (3.3V) |------Resistor1--+---NTC-----|GND     (Resistor1 = 10kR)
//                                 |
//                                 |
//                       thermal voltage output
////////////////////////////////////////////////////////////////
//NTC溫度(C)	NTC (kR)	output (mV)
//0						27.391		2417.43
//3	          24.083    2331.78
//5	          22.132    2272.99
//25					10	  		1650
//40					5.8281		1215.1
//45					4.9183		1087.95
//50					4.1709		971.28
//55					3.5539		865.28
//60					3.0417		769.66
//65					2.6144		683.94
//70					2.2559		607.42
//75					1.9538		539.37
//80					1.698			479
//85					1.4805		425.56
//////////////////////////////////////////////////////////////////
//Thermistor_mV_To_ADC_Factor     0.4096f   // = 1/ADC_Step
#define _Thermistor_mV_To_ADC_Factor_   0.4096f         //float,  4 bytes; = 1/ADC_Step
//=====================================================================================================================
#define _ADC_DSG_OT_PROTECTION_            249    //unit: 607 mV; 70 Celcius; ADC code; uint, 2bytes;  Over temperature protection for discharging(Low divided voltage)
#define _ADC_DSG_OT_RELEASE_               280    //unit: 684 mV; 65 Celcius; ADC code; uint, 2bytes;  Over temperature release for discharging(Low divided voltage)
#define _ADC_CHG_OT_PROTECTION_            398    //unit: 971 mV; 50 Celcius; ADC code; uint, 2bytes;  Over temperature protection for charging(Low divided voltage)
#define _ADC_CHG_OT_RELEASE_               445    //unit: 1087 mV; 45 Celcius; ADC code; uint, 2bytes; Over temperature release for charging(Low divided voltage)
#define _ADC_UT_PROTECTION_                990    //unit: 2417 mV; 0 Celcius; ADC code; uint, 2bytes;  Under temperature protection(Low divided voltage)
#define _ADC_UT_RELEASE_                   931    //unit: 2272 mV; 5 Celcius; ADC code; uint, 2bytes;  Under temperature release(Low divided voltage)

//////////////////////////////////////////////////////////////////////////////
//=====================================================================================================================
#define _OC_PROTECTION_RELEASE_TIME_          5         // 5 sec; unit: sec.; 2byte; over current protection release time
#define _BUTTON_PRESS_TIME_                   5         // 5 sec; unit: sec.; 2byte; button press delay time
//=====================================================================================================================

// Sleep (suspend) Mode Var
#define _WAKE_UP_TIME_FROM_SUSPEND_MODE_          1 // 5 second; unit: sec.; 2byte; Wake Up Times from Suspending mode
#define _FIRST_TO_SUSPEND_MODE_IN_RELEASE_TIME_   60 // second; unit: sec.; 2byte; into SUSPEND_MODE time at first
//=====================================================================================================================
//=====================================================================================================================

#define _SOC_CELL_OV_VOLTAGE_             4250 //mV, PIC/ hw 4250, 找較小值
#define _SOC_CELL_UV_VOLTAGE_             3100 //mV, PIC/ hw 2500, 找較大值

//=====================================================================================================================
// SOC Cycle Count
// time based = 0.5 sec = 0.0001388f hours (1/7200, 1 hour = 60min. = 3600 sec.)
// sum(adc1+adc2+...) / current_mA_to_ADC_factor * time based = Q(mah)
// CYCLECOUNT_CAP_THRESHOLD = 2600*4p*0.9 = 9360 mAh ==> Cycle Count Threshold for total DSG/CHG capacity
// Using in Charging Status
// _ADC_CYCLECOUNT_THRESHOLD_ = 9360 mAh * _CHG_mA_to_ADC_factor_ (0.09280f) / time based(0.0001388f)
//#define _ADC_CYCLECOUNT_THRESHOLD_               11048508        // 2600*4p*0.9 = 9360 mAh; unit: maH.; 4byte; Cycle Count Threshold for total DSG capacity
#define _ADC_CYCLECOUNT_THRESHOLD_                  6257982        // 2600*4p*0.9 = 9360 mAh; unit: maH.; 4byte; Cycle Count Threshold for total CHG capacity
#define _CYCLECOUNT_FOR_CHG_LEVEL_1_                500         // 500 times; unit: times; 2byte; Cycle Count times for charger to set CHG voltage
#define _CYCLECOUNT_FOR_CHG_LEVEL_2_                1000        // 1000 times; unit: times; 2byte; Cycle Count times for charger to set CHG voltage
//=====================================================================================================================
// OCV TABLE Line Current Range, 4 ocv lines
// Battery for a cell capacity ==> 2600 mAH * 4p
// 0.5C DSG = 1300 mA, 1C DSG = 2600 mA, 2C DSG = 5200 mA
// 4p cell==> 0.5C DSG = 5200 mA, 1C DSG = 10400 mA, 2C DSG = 20800 mA
//  _DSG_mA_to_ADC_factor_      0.163839f (參考上面之設定)
// ADC 10 bit==> max adc = 1024
#define _ADC_LOOKUP_1st_OCV_CURRENT_RANGE_     425    // 2600mA; 2bytes;  CURRENT_OF_DSG_STATUS ~ 2600mA for 4p cell==>OCV
#define _ADC_LOOKUP_2nd_OCV_CURRENT_RANGE_     1010    //==>(1010=6164mA) 7800mA; 2bytes; 2600mA ~ 7800mA for 4p cell==>0.5C
#define _ADC_LOOKUP_3rd_OCV_CURRENT_RANGE_     2555   // 15600mA; 2bytes; 7800mA ~ 15600mA 以上 for 4p cell==1C
//=====================================================================================================================
//=====================================================================================================================
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
// Define LEV System  CALIBRATION_SEGMENT Data
// Used by SystemConfigInitialData.s43 to save into Flash Memory while downloading code into MCU
//////////////////////////////////////////////////////////////////////////////////////
#define _CHG_OP_ADC_OFFSET_             0      //2byte ; 實際值-理論值 (signed int)
#define _DSG_OP_ADC_OFFSET_             0      //2byte ; 實際值-理論值 (signed int)
#define _VBAT_ADC_OFFSET_               0      //2byte ; 實際值-理論值 (signed int)
#define _NTC_ADC_OFFSET_                0      //2byte ; 實際值-理論值 Thermistor (signed int)
#define _CURRENT_CYCLECOUNT_            0      //; 2 bytes	
#define _CURRENT_ADC_ACCUMULATING_Q_    0      //; 4 bytes	





/************************************************************************************************
*************************************************************************************************
* Define Unsigned Int EEPROM Array Index	 (EEPROM unsigned int eeprom_uint_array[])			*
************************************************************************************************/
enum eeprom_uint_array_index{

		SERIAL_NUMBER_offset,                         
		VERSION_offset,                               
		MINOR_VERSION_offset,                         
		MANUFACTURE_DATE_offset,                      
		NUMBER_OF_PARALLEL_CELLS_offset,              
		NUMBER_OF_SERIES_CELLS_offset,                
		ADC_DETECT_CURRENT_OF_DSG_STATUS_offset,      
		ADC_DETECT_CURRENT_OF_CHG_STATUS_offset,      
		ADC_DOC_PROTECTION_offset,                    
		ADC_COC_PROTECTION_offset,                    
		ADC_2ND_BATTERY_OV_PROTECTION_offset,         
		ADC_2ND_BATTERY_OV_RELEASE_offset,            
		ADC_2ND_BATTERY_UV_PROTECTION_offset,         
		ADC_2ND_BATTERY_UV_RELEASE_offset,            
		ADC_DSG_OT_PROTECTION_offset,                 
		ADC_DSG_OT_RELEASE_offset,                    
		ADC_CHG_OT_PROTECTION_offset,                 
		ADC_CHG_OT_RELEASE_offset,                    
		ADC_UT_PROTECTION_offset,                     
		ADC_UT_RELEASE_offset,                        
		OC_PROTECTION_RELEASE_TIME_offset,            
		BUTTON_PRESS_TIME_offset,                     
		WAKE_UP_TIME_FROM_SUSPEND_MODE_offset,        
		FIRST_TO_SUSPEND_MODE_IN_RELEASE_TIME_offset, 
		SOC_CELL_OV_VOLTAGE_offset,                   
		SOC_CELL_UV_VOLTAGE_offset,                   
		CYCLECOUNT_FOR_CHG_LEVEL_1_offset,            
		CYCLECOUNT_FOR_CHG_LEVEL_2_offset,            
		ADC_LOOKUP_1st_OCV_CURRENT_RANGE_offset,      
		ADC_LOOKUP_2nd_OCV_CURRENT_RANGE_offset,      
		ADC_LOOKUP_3rd_OCV_CURRENT_RANGE_offset,      
		CHG_OP_ADC_OFFSET_offset,                     
		DSG_OP_ADC_OFFSET_offset,                     
		VBAT_ADC_OFFSET_offset,                       
		NTC_ADC_OFFSET_offset,                        
		CURRENT_CYCLECOUNT_offset,                    
		Eeprom_Uint_Array_Last_Index
};

//#define SERIAL_NUMBER_offset                               0  // 2 bytes
//#define VERSION_offset                                     1  // 2 bytes 
//#define MINOR_VERSION_offset                               2  // 2 bytes 
//#define MANUFACTURE_DATE_offset                            3  // 2 bytes 
//#define NUMBER_OF_PARALLEL_CELLS_offset                    4  // 2 bytes
//#define NUMBER_OF_SERIES_CELLS_offset                      5  // 2 bytes
//#define ADC_DETECT_CURRENT_OF_DSG_STATUS_offset            6  // 2 bytes
//#define ADC_DETECT_CURRENT_OF_CHG_STATUS_offset            7  // 2 bytes
//#define ADC_DOC_PROTECTION_offset                          8  // 2 bytes
//#define ADC_COC_PROTECTION_offset                          9  // 2 bytes
//#define ADC_2ND_BATTERY_OV_PROTECTION_offset              10  // 2 bytes
//#define ADC_2ND_BATTERY_OV_RELEASE_offset                 11  // 2 bytes
//#define ADC_2ND_BATTERY_UV_PROTECTION_offset              12  // 2 bytes
//#define ADC_2ND_BATTERY_UV_RELEASE_offset                 13  // 2 bytes
//#define ADC_DSG_OT_PROTECTION_offset                      14  // 2 bytes
//#define ADC_DSG_OT_RELEASE_offset                         15  // 2 bytes
//#define ADC_CHG_OT_PROTECTION_offset                      16  // 2 bytes
//#define ADC_CHG_OT_RELEASE_offset                         17  // 2 bytes
//#define ADC_UT_PROTECTION_offset                          18  // 2 bytes
//#define ADC_UT_RELEASE_offset                             19  // 2 bytes
//#define OC_PROTECTION_RELEASE_TIME_offset                 20  // 2 bytes
//#define BUTTON_PRESS_TIME_offset                          21  // 2 bytes
//#define WAKE_UP_TIME_FROM_SUSPEND_MODE_offset             22  // 2 bytes
//#define FIRST_TO_SUSPEND_MODE_IN_RELEASE_TIME_offset      23  // 2 bytes
//#define SOC_CELL_OV_VOLTAGE_offset                        24  // 2 bytes
//#define SOC_CELL_UV_VOLTAGE_offset                        25  // 2 bytes
//#define CYCLECOUNT_FOR_CHG_LEVEL_1_offset                 26  // 2 bytes
//#define CYCLECOUNT_FOR_CHG_LEVEL_2_offset                 27  // 2 bytes
//#define ADC_LOOKUP_1st_OCV_CURRENT_RANGE_offset           28  // 2 bytes
//#define ADC_LOOKUP_2nd_OCV_CURRENT_RANGE_offset           29  // 2 bytes
//#define ADC_LOOKUP_3rd_OCV_CURRENT_RANGE_offset           30  // 2 bytes
//#define CHG_OP_ADC_OFFSET_offset                          31  // 2 bytes
//#define DSG_OP_ADC_OFFSET_offset                          32  // 2 bytes
//#define VBAT_ADC_OFFSET_offset                            33  // 2 bytes
//#define NTC_ADC_OFFSET_offset                             34  // 2 bytes
//#define CURRENT_CYCLECOUNT_offset                         35  // 2 bytes
/************************************************************************************************
* Define Unsigned Int EEPROM Array Mapping	 (EEPROM unsigned int eeprom_uint_array[])			*
************************************************************************************************/
#define  SERIAL_NUMBER                          (*(((unsigned int *)Eeprom_Uint_Array_Address) + SERIAL_NUMBER_offset                        ))
#define  VERSION                                (*(((unsigned int *)Eeprom_Uint_Array_Address) + VERSION_offset                              ))
#define  MINOR_VERSION                          (*(((unsigned int *)Eeprom_Uint_Array_Address) + MINOR_VERSION_offset                        ))
#define  MANUFACTURE_DATE                       (*(((unsigned int *)Eeprom_Uint_Array_Address) + MANUFACTURE_DATE_offset                     ))
#define  NUMBER_OF_PARALLEL_CELLS               (*(((unsigned int *)Eeprom_Uint_Array_Address) + NUMBER_OF_PARALLEL_CELLS_offset             ))
#define  NUMBER_OF_SERIES_CELLS                 (*(((unsigned int *)Eeprom_Uint_Array_Address) + NUMBER_OF_SERIES_CELLS_offset               ))
#define  ADC_DETECT_CURRENT_OF_DSG_STATUS       (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_DETECT_CURRENT_OF_DSG_STATUS_offset     ))
#define  ADC_DETECT_CURRENT_OF_CHG_STATUS       (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_DETECT_CURRENT_OF_CHG_STATUS_offset     ))
#define  ADC_DOC_PROTECTION                     (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_DOC_PROTECTION_offset                   ))
#define  ADC_COC_PROTECTION                     (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_COC_PROTECTION_offset                   ))
#define  ADC_2ND_BATTERY_OV_PROTECTION          (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_2ND_BATTERY_OV_PROTECTION_offset        ))
#define  ADC_2ND_BATTERY_OV_RELEASE             (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_2ND_BATTERY_OV_RELEASE_offset           ))
#define  ADC_2ND_BATTERY_UV_PROTECTION          (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_2ND_BATTERY_UV_PROTECTION_offset        ))
#define  ADC_2ND_BATTERY_UV_RELEASE             (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_2ND_BATTERY_UV_RELEASE_offset           ))
#define  ADC_DSG_OT_PROTECTION                  (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_DSG_OT_PROTECTION_offset                ))
#define  ADC_DSG_OT_RELEASE                     (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_DSG_OT_RELEASE_offset                   ))
#define  ADC_CHG_OT_PROTECTION                  (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_CHG_OT_PROTECTION_offset                ))
#define  ADC_CHG_OT_RELEASE                     (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_CHG_OT_RELEASE_offset                   ))
#define  ADC_UT_PROTECTION                      (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_UT_PROTECTION_offset                    ))
#define  ADC_UT_RELEASE                         (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_UT_RELEASE_offset                       ))
#define  OC_PROTECTION_RELEASE_TIME             (*(((unsigned int *)Eeprom_Uint_Array_Address) + OC_PROTECTION_RELEASE_TIME_offset           ))
#define  BUTTON_PRESS_TIME                      (*(((unsigned int *)Eeprom_Uint_Array_Address) + BUTTON_PRESS_TIME_offset                    ))
#define  WAKE_UP_TIME_FROM_SUSPEND_MODE         (*(((unsigned int *)Eeprom_Uint_Array_Address) + WAKE_UP_TIME_FROM_SUSPEND_MODE_offset       ))
#define  FIRST_TO_SUSPEND_MODE_IN_RELEASE_TIME  (*(((unsigned int *)Eeprom_Uint_Array_Address) + FIRST_TO_SUSPEND_MODE_IN_RELEASE_TIME_offset))
#define  SOC_CELL_OV_VOLTAGE                    (*(((unsigned int *)Eeprom_Uint_Array_Address) + SOC_CELL_OV_VOLTAGE_offset                  ))
#define  SOC_CELL_UV_VOLTAGE                    (*(((unsigned int *)Eeprom_Uint_Array_Address) + SOC_CELL_UV_VOLTAGE_offset                  ))
#define  CYCLECOUNT_FOR_CHG_LEVEL_1             (*(((unsigned int *)Eeprom_Uint_Array_Address) + CYCLECOUNT_FOR_CHG_LEVEL_1_offset           ))
#define  CYCLECOUNT_FOR_CHG_LEVEL_2             (*(((unsigned int *)Eeprom_Uint_Array_Address) + CYCLECOUNT_FOR_CHG_LEVEL_2_offset           ))
#define  ADC_LOOKUP_1st_OCV_CURRENT_RANGE       (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_LOOKUP_1st_OCV_CURRENT_RANGE_offset     ))
#define  ADC_LOOKUP_2nd_OCV_CURRENT_RANGE       (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_LOOKUP_2nd_OCV_CURRENT_RANGE_offset     ))
#define  ADC_LOOKUP_3rd_OCV_CURRENT_RANGE       (*(((unsigned int *)Eeprom_Uint_Array_Address) + ADC_LOOKUP_3rd_OCV_CURRENT_RANGE_offset     ))
#define  CHG_OP_ADC_OFFSET                      (*(((unsigned int *)Eeprom_Uint_Array_Address) + CHG_OP_ADC_OFFSET_offset                    ))
#define  DSG_OP_ADC_OFFSET                      (*(((unsigned int *)Eeprom_Uint_Array_Address) + DSG_OP_ADC_OFFSET_offset                    ))
#define  VBAT_ADC_OFFSET                        (*(((unsigned int *)Eeprom_Uint_Array_Address) + VBAT_ADC_OFFSET_offset                      ))
#define  NTC_ADC_OFFSET                         (*(((unsigned int *)Eeprom_Uint_Array_Address) + NTC_ADC_OFFSET_offset                       ))
#define  CURRENT_CYCLECOUNT                     (*(((unsigned int *)Eeprom_Uint_Array_Address) + CURRENT_CYCLECOUNT_offset                   ))

/************************************************************************************************
*************************************************************************************************
* Define Unsigned Long EEPROM Array Index	 (EEPROM unsigned long eeprom_ulong_array[])		*
************************************************************************************************/
#define ADC_CYCLECOUNT_THRESHOLD_offset                    0 // 4 bytes
#define CURRENT_ADC_ACCUMULATING_Q_offset                  1 // 4 bytes 
/************************************************************************************************
* Define Unsigned Long EEPROM Array Mapping	 (EEPROM unsigned long eeprom_ulong_array[])		*
************************************************************************************************/
#define ADC_CYCLECOUNT_THRESHOLD                (*(((unsigned long *)Eeprom_Ulong_Array_Address) +  ADC_CYCLECOUNT_THRESHOLD_offset  ))
#define CURRENT_ADC_ACCUMULATING_Q              (*(((unsigned long *)Eeprom_Ulong_Array_Address) +  CURRENT_ADC_ACCUMULATING_Q_offset))


/************************************************************************************************
*************************************************************************************************
* Define Float EEPROM Array Index	 (EEPROM float eeprom_float_array[])						*
************************************************************************************************/
#define CHG_mA_To_ADC_Factor_offset            0 // 4 bytes
#define DSG_mA_To_ADC_Factor_offset            1 // 4 bytes
#define VBAT_mV_To_ADC_Factor_offset           2 // 4 bytes
#define Thermistor_mV_To_ADC_Factor_offset     3 // 4 bytes
/************************************************************************************************
* Define Float EEPROM Array Mapping	 (EEPROM float eeprom_float_array[])						*
************************************************************************************************/
#define CHG_mA_To_ADC_Factor                    (*(((float *)Eeprom_Float_Array_Address) + CHG_mA_To_ADC_Factor_offset       ))
#define DSG_mA_To_ADC_Factor                    (*(((float *)Eeprom_Float_Array_Address) + DSG_mA_To_ADC_Factor_offset       ))
#define VBAT_mV_To_ADC_Factor                   (*(((float *)Eeprom_Float_Array_Address) + VBAT_mV_To_ADC_Factor_offset      ))
#define Thermistor_mV_To_ADC_Factor             (*(((float *)Eeprom_Float_Array_Address) + Thermistor_mV_To_ADC_Factor_offset))


