



/*****************************************************************
  The Flash Real Data are created in 
******************************************************************/

/////////////////////////////////////////////////////////////
//// Define Flash Segment Address (one segment = 128 bytes)
/////////////////////////////////////////////////////////////
//#define CONFIG_SEGMENT          0x4000   //EEPROM Start Address
//=====================================================================================================================
//=====================================================================================================================
// below vars List have to be use in Decimal
// put "_ee_" at head means the vars will be collected for burrning-in EEPROM by external appilication
// "str_len_",  Data type: unsigned char, 1 byte, show next string var length.
// "str_",      Data type: (unsigned char *), str_len_XX bytes,  show char string.
// "uchar_",    Data type: unsigned char, 1 byte.
// "char_",     Data type: signed char, 1 byte.
// "uint_",     Data type: unsigned int, 2 byte.
// "int_",      Data type: signed int, 2 byte.
// "float_",    Data type: float, 4 byte.
// "double_",   Data type: double, 4 byte.
//=====================================================================================================================
#define _ee_address_CONFIG_SEGMENT          0x4000   //EEPROM Start Address, must use Hexadecimal

#define _ee_uchar_System_Control_Bit_EEPROM        7      // 1 bytes
//#define MANUFACTURE_DATE_YEAR   2012
//#define MANUFACTURE_DATE_MONTH  7
//#define MANUFACTURE_DATE_DAY    3
#define _ee_uint_MANUFACTURE_DATE               16611   //(MANUFACTURE_DATE_YEAR - 1980) * 512 + MANUFACTURE_DATE_MONTH * 32 + MANUFACTURE_DATE_DAY  // 2 bytes
#define _ee_uint_SERIAL_NUMBER                  10      // 2 bytes

#define _ee_uchar_VERSION		                1      // 1 bytes
#define _ee_uchar_MINOR_VERSION		            2       // 1 bytes

#define _ee_uchar_NUMBER_OF_PARALLEL_CELLS      4       // 1 bytes
#define _ee_uchar_NUMBER_OF_SERIES_CELLS        13      // 1 bytes


//=====================================================================================================================
//First set String Length
//then second set String
#define _ee_str_len_CELL_TYPE_LENGTH            8
#define _ee_str_CELL_TYPE                       "sony 26F"
#define _ee_str_len_MANUFACTURE_NAME_LENGTH     8
#define _ee_str_MANUFACTURE_NAME                "Dynapack"
//#define _ee_str_len_PRODUCT_NAME_LENGTH         8
//#define _ee_str_PRODUCT_NAME                    "LEV36"

#define _ee_uchar_RESERVED_FOR_OFFSET1            0


//=====================================================================================================================
// CHG / DSG Current Detector (op amp)
////////////////////////////////////////////////////////////////////////////////
//ADC_resolution  1024    // 10 bit ADC
//ADC_Ref         3300    // mV
//ADC_Step        3.22265625f  ==>(float)ADC_Ref /  ADC_resolution ==> (mV)
////////////////////////////////////////////////////////////////////////////////
//Rsense                  2.0f    //mR
////////////////////////////////////////////////////////////////////////////////
//mA to ADC factor 
//Factor = Rsense(R) * op_gain / ADC step(mV) => Multiplicative inverse Factor
////////////////////////////////////////////////////////////////
// CHG_OP_Gain             120.0f
// _CHG_mA_to_ADC_factor_    0.074473f   ==> (Rsense_mR * CHG_OP_Gain / ADC_Step / 1000)==>小數點6位
// CHG_OP_ADC_OFFSET         (signed char)0    //實際值-理論值 
////////////////////////////////////////////////////////////////
// DSG_OP_Gain   82.0f
// _DSG_mA_to_ADC_factor_      0.05089f  ==> (Rsense_mR * DSG_OP_Gain/ADC_Step/1000)==>小數點6位
// DSG_OP_ADC_OFFSET         (signed char)0    //實際值-理論值 
// 理論值 = 實際值 - Offset
////////////////////////////////////////////////////////////////////////////////
//(無條件進位==> 會比實際值還大一點)
//(使用四捨五入)
#define _ee_uint_ADC_CURRENT_DETECT_FOR_DSG_STATUS       4       //80mA; unit: mA; 2bytes; if current > the define, in discharging status
#define _ee_uint_ADC_CURRENT_DETECT_FOR_CHG_STATUS       7       //100mA; unit: mA; 2bytes; if current > the define, in charging status
#define _ee_uint_ADC_DOC_PROTECTION                      2544    // 50A; unit: 10mA; discharging current protection is positive
#define _ee_uint_ADC_COC_PROTECTION                      298     // 4A; unit: 10mA; charging current protection
#define _ee_uint_ADC_DSG_HIGH_CURRENT_DETECT             407     // 8000mA; 2bytes; for switch High/Low OT Protection
//remove //#define OC_PROTECTION_RELEASE_TIME              5         // 5 sec; unit: sec.; 1byte; over current protection release time
//////////////////////////////////////////////////////////////////////////////////
//for one cycle count
// 4* 2600mah * 0.8 = 8320mah = 620ADC / _CHG_mA_to_ADC_factor_,
// Accumulating interval time = 1 second. ==> 1 hour = 3600 second.
// 620 ADC * 3600 = 2232000 ADC
#define _ee_ulong_ADC_AccQ_FOR_CHG_TH           2232000       //one Cycle Count Threshold
#define _ee_uint_Cycle_Count_FOR_CHG_1st_TH     150          // 150 times; unit: times; 2byte; Cycle Count times for charger to set CHG voltage                    
#define _ee_uint_Cycle_Count_FOR_CHG_2nd_TH     500          // 500 times; unit: times; 2byte; Cycle Count times for charger to set CHG voltage                   


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
// 理論值 = 實際值 - Offset
////////////////////////////////////////////////////////////////
#define _ee_uint_ADC_BATTERY_OV_PROTECTION             708 // 55.12V(cell:4.24); unit: 10mV; 2bytes; 2nd level BATTERY OV PROTECTION
#define _ee_uint_ADC_BATTERY_OV_RELEASE                693 // 53.95V(cell:4.15); unit: 10mV; 2bytes; 2nd level BATTERY OV RELEASE
#define _ee_uint_ADC_BATTERY_UV_PROTECTION             468 // 36.4V(cell:2.8); unit: 10mV; 2bytes; 2nd level BATTERY UV PROTECTION
#define _ee_uint_ADC_BATTERY_UV_RELEASE                534 // 41.6V(cell:3.2); unit: 10mV; 2bytes; 2nd level BATTERY UV RELEASE 


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
//80					1.698       479
//85					1.4805		425.56
//////////////////////////////////////////////////////////////////
//Thermistor_mV_To_ADC_Factor     0.310303f   // = 1/ADC_Step
//=====================================================================================================================
#define _ee_uint_ADC_DSG_OT_HIGH_PROTECTION              132    //unit: 425.56 mV; 85 Celcius; Over temperature protection for discharging(Low divided voltage)
#define _ee_uint_ADC_DSG_OT_HIGH_RELEASE                 148    //unit: 479 mV; 80 Celcius; Over temperature release for discharging(Low divided voltage)
#define _ee_uint_ADC_DSG_OT_LOW_PROTECTION               188    //unit: 607.42 mV; 70 Celcius; Over temperature protection for discharging(Low divided voltage)
#define _ee_uint_ADC_DSG_OT_LOW_RELEASE                  212    //unit: 683.94 mV; 65 Celcius; Over temperature release for discharging(Low divided voltage)
#define _ee_uint_ADC_CHG_OT_PROTECTION                   301    //unit: 971 mV; 50 Celcius; Over temperature protection for charging(Low divided voltage)
#define _ee_uint_ADC_CHG_OT_RELEASE                      337    //unit: 1087 mV; 45 Celcius; Over temperature release for charging(Low divided voltage)
#define _ee_uint_ADC_UT_PROTECTION                       750    //unit: 2417 mV; 0 Celcius;  Under temperature protection(Low divided voltage)
#define _ee_uint_ADC_UT_RELEASE                          705    //unit: 2272 mV; 5 Celcius;  Under temperature release(Low divided voltage)
//
//#define BUTTON_PRESS_TIME                       5         // 5 sec; unit: sec.; 1byte; button press delay time

//////////////////////////////////////////////////////////////////////////
#define _ee_uint_MIN_CELL_OV_VOLTAGE_FOR_SOC    4200 //mv
#define _ee_uint_MAX_CELL_UV_VOLTAGE_FOR_SOC    3200 //mv
//=====================================================================================================================
//=====================================================================================================================
// OCV TABLE Line Current Range, 3 ocv lines, (DSG)
// Battery for a cell capacity ==> 2600 mAH * 4p
// 0.5C DSG = 1300 mA, 1C DSG = 2600 mA, 1.5C DSG = 3900 mA
// 4p cell==> 0.5C DSG = 5200 mA, 1C DSG = 10400 mA, 1.5C DSG = 15600 mA
//  _DSG_mA_to_ADC_factor_      0.0671744f (參考上面之設定)
// ADC 10 bit==> max adc = 1024
#define _ee_uint_ADC_LOOKUP_1st_LEVEL_OCV_DSG_CURRENT_VALUES     175    // 2600mA; 2bytes;  CURRENT_OF_DSG_STATUS ~ 2600mA for 4p cell==>OCV
#define _ee_uint_ADC_LOOKUP_2nd_LEVEL_OCV_DSG_CURRENT_VALUES     524    // 7800mA; 2bytes; 2600mA ~ 7800mA for 4p cell==>0.5C
#define _ee_uint_ADC_LOOKUP_3rd_LEVEL_OCV_DSG_CURRENT_VALUES     873    // 13000mA; 2bytes; 7800mA 以上 for 4p cell==1C

//=====================================================================================================================
// OCV TABLE Line Current Range, 2 ocv lines, (CHG) 
// Battery for a cell capacity ==> 2600 mAH * 4p
// 0.2C CHG = 520 mA, 0.5C CHG = 1300 mA
// 4p cell==> 0.2C CHG = 2080 mA, 0.5C CHG = 5200 mA
//  _CHG_mA_to_ADC_factor_      0.098304f (參考上面之設定)
// ADC 10 bit==> max adc = 1024
#define _ee_uint_ADC_LOOKUP_1st_LEVEL_OCV_CHG_CURRENT_VALUES     89    // 910mA; 2bytes;  CURRENT_OF_DSG_STATUS ~ 2600mA for 4p cell==>OCV
#define _ee_uint_ADC_LOOKUP_2nd_LEVEL_OCV_CHG_CURRENT_VALUES     358    // 3640mA; 2bytes; 2600mA ~ 7800mA for 4p cell==>0.5C


//////////////////////////////////////////////////////////////////////////
//recording data to EEPROM
//////////////////////////////////////////////////////////////////////////
// they have to set the start offset at 4的倍數 below vars.
// and the order could not be changed below vars.
/////////////////////////////////////////////////////////////////////////
//#define _ee_uchar_RESERVED_FOR_OFFSET1            0
//#define _ee_uint_RESERVED_FOR_OFFSET2            0
#define _ee_uint_MAX_DSG_C_ADC_RECORD_EEPROM     0
#define _ee_uint_MAX_CHG_C_ADC_RECORD_EEPROM     0
#define _ee_uint_MAX_VBAT_ADC_RECORD_EEPROM      0
#define _ee_uint_MIN_VBAT_ADC_RECORD_EEPROM      65535
#define _ee_uint_MAX_TH1_ADC_RECORD_EEPROM       0
#define _ee_uint_MIN_TH1_ADC_RECORD_EEPROM       65535
#define _ee_uint_MAX_TH2_ADC_RECORD_EEPROM       0
#define _ee_uint_MIN_TH2_ADC_RECORD_EEPROM       65535
// record count
#define _ee_uint_RECORD_DATA_COUNT_EEPROM        0
#define _ee_uint_Cycle_Count_RECORD_EEPROM       0
#define _ee_ulong_ADC_AccumulatingQ_RECORD_EEPROM   0


//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//#define _ee_float_CHG_mA_To_ADC_Factor          0.098304f        // 4 bytes;
//#define _ee_float_DSG_mA_To_ADC_Factor          0.0671744f       // 4 bytes;
#define _ee_float_VBAT_mV_To_ADC_Factor         0.016962f        // 4 bytes;
//#define _ee_float_Thermistor_mV_To_ADC_Factor   0.4096f         // 4 bytes; = 1/ADC_Step
#define _ee_char_DSG_OP_ADC_OFFSET             0      //1byte ; 實際值-理論值 (signed char)
#define _ee_char_CHG_OP_ADC_OFFSET             0      //1byte ; 實際值-理論值 (signed char)
#define _ee_char_VBAT_ADC_OFFSET               0      //1byte ; 實際值-理論值 (signed char)
#define _ee_char_NTC1_ADC_OFFSET               0      //1byte ; 實際值-理論值 Thermistor (signed char)
#define _ee_char_NTC2_ADC_OFFSET               0      //1byte ; 實際值-理論值 Thermistor (signed char)
#define _ee_char_SOC_ADC_OFFSET                0      //1byte ; 實際值-理論值 (signed char)

//=====================================================================================================================
// charger detector by voltage over 0.5V
/////////////////////////////////////////////////////////////////////////////////////////////////
//    source voltage (~2.0V) |------Resistor1--+---Resistor2-----|GND     
//    (Resistor1 = 4.7MR)                      |
//    (Resistor2 = 3.3MR)                      |
//                                  to ADC SOC voltage output
/////////////////////////////////////////////////////////////////////////////////////////////////
//CHARGER_DETECTOR_mV_To_ADC_Factor     0.310303f   // = 1/ADC_Step
#define _ee_uint_ADC_CHARGER_DETECTOR_TH       155    //unit:500 mV; 

