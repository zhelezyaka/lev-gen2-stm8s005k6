



/*****************************************************************
  The Flash Real Data are created in 
******************************************************************/

/////////////////////////////////////////////////////////////
//// Define Flash Segment Address (one segment = 64 bytes)
/////////////////////////////////////////////////////////////
//#define Flash_segment_Size 64  // bytes
//#define Flash_segment_A   0x10C0  // protected
//#define Flash_segment_B   0x1080  // for user
//#define Flash_segment_C   0x1040  // can not burning data
//#define Flash_segment_D   0x1000  // has already data inside
//
//#define CONFIG_SEGMENT        Flash_segment_B
//#define CALIBRATION_SEGMENT   Flash_segment_C

#define MANUFACTURE_DATE_YEAR   2012
#define MANUFACTURE_DATE_MONTH  7
#define MANUFACTURE_DATE_DAY    3

//=====================================================================================================================
//=====================================================================================================================

#define CELL_TYPE_STRING                "sony 26F"
#define CELL_TYPE_NAME_LENGTH           8
#define MANUFACTURE_NAME_STRING         "Dynapack"
#define MANUFACTURE_NAME_LENGTH         12
#define MANUFACTURE_DATE                (MANUFACTURE_DATE_YEAR - 1980) * 512 + MANUFACTURE_DATE_MONTH * 32 + MANUFACTURE_DATE_DAY  // 2 bytes
#define PRODUCT_NAME                    "LEV36"
#define PRODUCT_NAME_LENGTH              5

#define VERSION		                        30      // 1 bytes
#define MINOR_VERSION		                2       // 1 bytes

#define SERIAL_NUMBER                       10      // 1 bytes
#define NUMBER_OF_PARALLEL_CELLS            4       // 1 bytes
#define NUMBER_OF_SERIES_CELLS              10      // 1 bytes

//=====================================================================================================================
// CHG / DSG Current Detector (op amp)
////////////////////////////////////////////////////////////////////////////////
//ADC_resolution  1024    // 10 bit ADC
//ADC_Ref         2500    // mV
//ADC_Step        2.44140625f  ==>(float)ADC_Ref /  ADC_resolution ==> (mV)
////////////////////////////////////////////////////////////////////////////////
//Rsense                  3.3333f    //mR
////////////////////////////////////////////////////////////////////////////////
//mA to ADC factor 
//Factor = Rsense(R) * op_gain / ADC step(mV) => Multiplicative inverse Factor
////////////////////////////////////////////////////////////////
// CHG_OP_Gain             120.0f
// _CHG_mA_to_ADC_factor_    0.098304f   ==> (Rsense_mR * CHG_OP_Gain / ADC_Step / 1000)==>小數點6位
// CHG_OP_ADC_OFFSET         (signed char)0    //實際值-理論值 
////////////////////////////////////////////////////////////////
// DSG_OP_Gain   82.0f
// _DSG_mA_to_ADC_factor_      0.0671744f  ==> (Rsense_mR * DSG_OP_Gain/ADC_Step/1000)==>小數點6位
// DSG_OP_ADC_OFFSET         (signed char)0    //實際值-理論值 
// 理論值 = 實際值 - Offset
////////////////////////////////////////////////////////////////////////////////
//(無條件進位==> 會比實際值還大一點)
//(使用四捨五入)
#define ADC_CURRENT_DETECT_FOR_DSG_STATUS       5       //80mA; unit: mA; 2bytes; if current > the define, in discharging status
#define ADC_CURRENT_DETECT_FOR_CHG_STATUS       5       //50mA; unit: mA; 2bytes; if current > the define, in charging status
#define ADC_DOC_PROTECTION                      1352    // 20A; unit: 10mA; discharging current protection is positive
#define ADC_COC_PROTECTION                      393     // 4A; unit: 10mA; charging current protection
#define ADC_DSG_HIGH_CURRENT_DETECT             537     //; 8000mA; 2bytes; for switch High/Low OT Protection
//remove //#define OC_PROTECTION_RELEASE_TIME              5         // 5 sec; unit: sec.; 1byte; over current protection release time


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
#define ADC_BATTERY_OV_PROTECTION             721 // 42.5V; unit: 10mV; 2bytes; 2nd level BATTERY OV PROTECTION
//#define ADC_BATTERY_OV_RELEASE                704 // 41.5V; unit: 10mV; 2bytes; 2nd level BATTERY OV RELEASE
#define ADC_BATTERY_UV_PROTECTION             475 // 28V; unit: 10mV; 2bytes; 2nd level BATTERY UV PROTECTION
//#define ADC_BATTERY_UV_RELEASE                543 // 32V; unit: 10mV; 2bytes; 2nd level BATTERY UV RELEASE 


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
//=====================================================================================================================
#define ADC_DSG_OT_HIGH_PROTECTION              174    //unit: 425.56 mV; 85 Celcius; Over temperature protection for discharging(Low divided voltage)
#define ADC_DSG_OT_HIGH_RELEASE                 196    //unit: 479 mV; 80 Celcius; Over temperature release for discharging(Low divided voltage)
#define ADC_DSG_OT_LOW_PROTECTION               249    //unit: 607.42 mV; 70 Celcius; Over temperature protection for discharging(Low divided voltage)
#define ADC_DSG_OT_LOW_RELEASE                  280    //unit: 683.94 mV; 65 Celcius; Over temperature release for discharging(Low divided voltage)
#define ADC_CHG_OT_PROTECTION                   398    //unit: 971 mV; 50 Celcius; Over temperature protection for charging(Low divided voltage)
#define ADC_CHG_OT_RELEASE                      445    //unit: 1087 mV; 45 Celcius; Over temperature release for charging(Low divided voltage)
#define ADC_UT_PROTECTION                       990    //unit: 2417 mV; 0 Celcius;  Under temperature protection(Low divided voltage)
#define ADC_UT_RELEASE                          931    //unit: 2272 mV; 5 Celcius;  Under temperature release(Low divided voltage)
//
//#define BUTTON_PRESS_TIME                       5         // 5 sec; unit: sec.; 1byte; button press delay time


//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//#define CHG_mA_To_ADC_Factor          0.098304f        // 4 bytes;
//#define DSG_mA_To_ADC_Factor          0.0671744f       // 4 bytes;
//#define VBAT_mV_To_ADC_Factor         0.016962f        // 4 bytes;
//#define Thermistor_mV_To_ADC_Factor   0.4096f         // 4 bytes; = 1/ADC_Step
//#define CHG_OP_ADC_OFFSET             0      //1byte ; 實際值-理論值 (signed char)
//#define DSG_OP_ADC_OFFSET             0      //1byte ; 實際值-理論值 (signed char)
//#define VBAT_ADC_OFFSET               0      //1byte ; 實際值-理論值 (signed char)
//#define NTC_ADC_OFFSET                0      //1byte ; 實際值-理論值 Thermistor (signed char)


