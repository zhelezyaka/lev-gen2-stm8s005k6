



/*****************************************************************
  The Flash Real Data are created in 
******************************************************************/

/////////////////////////////////////////////////////////////
//// Define Flash Segment Address (one segment = 128 bytes)
/////////////////////////////////////////////////////////////
//#define CONFIG_SEGMENT          0x4000   //EEPROM Start Address
//=====================================================================================================================
//=====================================================================================================================
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
#define _ee_address_CONFIG_SEGMENT          0x4000   //EEPROM Start Address

#define _ee_str_len_CELL_TYPE_LENGTH            8
#define _ee_str_CELL_TYPE                       "sony 26F"
#define _ee_str_len_MANUFACTURE_NAME_LENGTH     12
#define _ee_str_MANUFACTURE_NAME                "Dynapack"
#define _ee_str_len_PRODUCT_NAME_LENGTH         5
#define _ee_str_PRODUCT_NAME                    "LEV36"

//#define MANUFACTURE_DATE_YEAR   2012
//#define MANUFACTURE_DATE_MONTH  7
//#define MANUFACTURE_DATE_DAY    3
#define _ee_uint_MANUFACTURE_DATE           16611   //(MANUFACTURE_DATE_YEAR - 1980) * 512 + MANUFACTURE_DATE_MONTH * 32 + MANUFACTURE_DATE_DAY  // 2 bytes

#define _ee_uchar_VERSION		            1      // 1 bytes
#define _ee_uchar_MINOR_VERSION		        2       // 1 bytes

#define _ee_uchar_SERIAL_NUMBER                       10      // 1 bytes
#define _ee_uchar_NUMBER_OF_PARALLEL_CELLS            4       // 1 bytes
#define _ee_uchar_NUMBER_OF_SERIES_CELLS              10      // 1 bytes



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
// _CHG_mA_to_ADC_factor_    0.074473f   ==> (Rsense_mR * CHG_OP_Gain / ADC_Step / 1000)==>�p���I6��
// CHG_OP_ADC_OFFSET         (signed char)0    //��ڭ�-�z�׭� 
////////////////////////////////////////////////////////////////
// DSG_OP_Gain   82.0f
// _DSG_mA_to_ADC_factor_      0.05089f  ==> (Rsense_mR * DSG_OP_Gain/ADC_Step/1000)==>�p���I6��
// DSG_OP_ADC_OFFSET         (signed char)0    //��ڭ�-�z�׭� 
// �z�׭� = ��ڭ� - Offset
////////////////////////////////////////////////////////////////////////////////
//(�L����i��==> �|���ڭ��٤j�@�I)
//(�ϥΥ|�ˤ��J)
#define _ee_uint_ADC_CURRENT_DETECT_FOR_DSG_STATUS       4       //80mA; unit: mA; 2bytes; if current > the define, in discharging status
#define _ee_uint_ADC_CURRENT_DETECT_FOR_CHG_STATUS       7       //100mA; unit: mA; 2bytes; if current > the define, in charging status
#define _ee_uint_ADC_DOC_PROTECTION                      2544    // 50A; unit: 10mA; discharging current protection is positive
#define _ee_uint_ADC_COC_PROTECTION                      298     // 4A; unit: 10mA; charging current protection
#define _ee_uint_ADC_DSG_HIGH_CURRENT_DETECT             407     // 8000mA; 2bytes; for switch High/Low OT Protection
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
//VBAT_mV_To_ADC_Factor    (float)1/(ADC_Step/(VBAT_Resistor2/(VBAT_Resistor1+VBAT_Resistor2))==>�p���I6��
//ADC_Step        2.44140625f //  mv/step
// _VBAT_mV_To_ADC_Factor_      0.016962f ==> _VBAT_10mV_To_ADC_Factor_    0.16962f  ==> VBAT_mV_To_ADC_Factor * 10
//VBAT_ADC_OFFSET          (signed char)(-5)   //��ڭ�-�z�׭�
// �z�׭� = ��ڭ� - Offset
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
//NTC�ū�(C)	NTC (kR)	output (mV)
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

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
#define _ee_float_CHG_mA_To_ADC_Factor          0.098304f        // 4 bytes;
#define _ee_float_DSG_mA_To_ADC_Factor          0.0671744f       // 4 bytes;
#define _ee_float_VBAT_mV_To_ADC_Factor         0.016962f        // 4 bytes;
#define _ee_float_Thermistor_mV_To_ADC_Factor   0.4096f         // 4 bytes; = 1/ADC_Step
#define _ee_char_CHG_OP_ADC_OFFSET             0      //1byte ; ��ڭ�-�z�׭� (signed char)
#define _ee_char_DSG_OP_ADC_OFFSET             0      //1byte ; ��ڭ�-�z�׭� (signed char)
#define _ee_char_VBAT_ADC_OFFSET               0      //1byte ; ��ڭ�-�z�׭� (signed char)
#define _ee_char_NTC1_ADC_OFFSET               0      //1byte ; ��ڭ�-�z�׭� Thermistor (signed char)
#define _ee_char_NTC2_ADC_OFFSET               0      //1byte ; ��ڭ�-�z�׭� Thermistor (signed char)


//////////////////////////////////////////////////////////////////////////
//recording data to EEPROM
//////////////////////////////////////////////////////////////////////////
#define _ee_uint_RECORD_DATA_COUNT_EEPROM        0
#define _ee_uint_MAX_DSG_C_ADC_RECORD_EEPROM     0
#define _ee_uint_MAX_CHG_C_ADC_RECORD_EEPROM     0
#define _ee_uint_MAX_VBAT_ADC_RECORD_EEPROM      0
#define _ee_uint_MIN_VBAT_ADC_RECORD_EEPROM      65535
#define _ee_uint_MAX_TH1_ADC_RECORD_EEPROM       0
#define _ee_uint_MIN_TH1_ADC_RECORD_EEPROM       65535
#define _ee_uint_MAX_TH2_ADC_RECORD_EEPROM       0
#define _ee_uint_MIN_TH2_ADC_RECORD_EEPROM       65535