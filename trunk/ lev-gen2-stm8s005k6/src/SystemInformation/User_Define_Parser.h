/////////////////////////////////////////////////////////////////////////// 
// 
// this file is created by Header Parser Application written by Hsinmo.
// this file is parsed from the file : 
// file Name: D:\Temp\ST_MCU_Codes\Lev_Gen2_stm8s005k6\EW_IAR_Project\..\src\SystemInformation\User_Define.h
// 
/////////////////////////////////////////////////////////////////////////// 
#define CONFIG_SEGMENT                                    0x4000
// 
// Data Offset
#define System_Control_Bit_EEPROM_Offset                  0
#define MANUFACTURE_DATE_Offset                           1
#define SERIAL_NUMBER_Offset                              3
#define VERSION_Offset                                    5
#define MINOR_VERSION_Offset                              6
#define NUMBER_OF_PARALLEL_CELLS_Offset                   7
#define NUMBER_OF_SERIES_CELLS_Offset                     8
#define CELL_TYPE_LENGTH_Offset                           9
#define CELL_TYPE_Offset                                  10
#define MANUFACTURE_NAME_LENGTH_Offset                    18
#define MANUFACTURE_NAME_Offset                           19
#define RESERVED_FOR_OFFSET1_Offset                       27
#define ADC_CURRENT_DETECT_FOR_DSG_STATUS_Offset          28
#define ADC_CURRENT_DETECT_FOR_CHG_STATUS_Offset          30
#define ADC_DOC_PROTECTION_Offset                         32
#define ADC_COC_PROTECTION_Offset                         34
#define ADC_DSG_HIGH_CURRENT_DETECT_Offset                36
#define ADC_AccQ_FOR_CHG_TH_Offset                        38
#define Cycle_Count_FOR_CHG_1st_TH_Offset                 42
#define Cycle_Count_FOR_CHG_2nd_TH_Offset                 44
#define ADC_BATTERY_OV_PROTECTION_Offset                  46
#define ADC_BATTERY_OV_RELEASE_Offset                     48
#define ADC_BATTERY_UV_PROTECTION_Offset                  50
#define ADC_BATTERY_UV_RELEASE_Offset                     52
#define ADC_DSG_OT_HIGH_PROTECTION_Offset                 54
#define ADC_DSG_OT_HIGH_RELEASE_Offset                    56
#define ADC_DSG_OT_LOW_PROTECTION_Offset                  58
#define ADC_DSG_OT_LOW_RELEASE_Offset                     60
#define ADC_CHG_OT_PROTECTION_Offset                      62
#define ADC_CHG_OT_RELEASE_Offset                         64
#define ADC_UT_PROTECTION_Offset                          66
#define ADC_UT_RELEASE_Offset                             68
#define MIN_CELL_OV_VOLTAGE_FOR_SOC_Offset                70
#define MAX_CELL_UV_VOLTAGE_FOR_SOC_Offset                72
#define ADC_LOOKUP_1st_LEVEL_OCV_DSG_CURRENT_VALUES_Offset 74
#define ADC_LOOKUP_2nd_LEVEL_OCV_DSG_CURRENT_VALUES_Offset 76
#define ADC_LOOKUP_3rd_LEVEL_OCV_DSG_CURRENT_VALUES_Offset 78
#define ADC_LOOKUP_1st_LEVEL_OCV_CHG_CURRENT_VALUES_Offset 80
#define ADC_LOOKUP_2nd_LEVEL_OCV_CHG_CURRENT_VALUES_Offset 82
#define MAX_DSG_C_ADC_RECORD_EEPROM_Offset                84
#define MAX_CHG_C_ADC_RECORD_EEPROM_Offset                86
#define MAX_VBAT_ADC_RECORD_EEPROM_Offset                 88
#define MIN_VBAT_ADC_RECORD_EEPROM_Offset                 90
#define MAX_TH1_ADC_RECORD_EEPROM_Offset                  92
#define MIN_TH1_ADC_RECORD_EEPROM_Offset                  94
#define MAX_TH2_ADC_RECORD_EEPROM_Offset                  96
#define MIN_TH2_ADC_RECORD_EEPROM_Offset                  98
#define RECORD_DATA_COUNT_EEPROM_Offset                   100
#define Cycle_Count_RECORD_EEPROM_Offset                  102
#define ADC_AccumulatingQ_RECORD_EEPROM_Offset            104
#define VBAT_mV_To_ADC_Factor_Offset                      108
#define DSG_OP_ADC_OFFSET_Offset                          112
#define CHG_OP_ADC_OFFSET_Offset                          113
#define VBAT_ADC_OFFSET_Offset                            114
#define NTC1_ADC_OFFSET_Offset                            115
#define NTC2_ADC_OFFSET_Offset                            116
#define SOC_ADC_OFFSET_Offset                             117
#define ADC_CHARGER_DETECTOR_TH_Offset                    118
// 
/////////////////////////////////////////////////////////////////////////// 
// 
// Data Var Point
#define System_Control_Bit_EEPROM                         *((unsigned char *)(CONFIG_SEGMENT + System_Control_Bit_EEPROM_Offset ))
#define MANUFACTURE_DATE                                  *((unsigned int *)(CONFIG_SEGMENT + MANUFACTURE_DATE_Offset ))
#define SERIAL_NUMBER                                     *((unsigned int *)(CONFIG_SEGMENT + SERIAL_NUMBER_Offset ))
#define VERSION                                           *((unsigned char *)(CONFIG_SEGMENT + VERSION_Offset ))
#define MINOR_VERSION                                     *((unsigned char *)(CONFIG_SEGMENT + MINOR_VERSION_Offset ))
#define NUMBER_OF_PARALLEL_CELLS                          *((unsigned char *)(CONFIG_SEGMENT + NUMBER_OF_PARALLEL_CELLS_Offset ))
#define NUMBER_OF_SERIES_CELLS                            *((unsigned char *)(CONFIG_SEGMENT + NUMBER_OF_SERIES_CELLS_Offset ))
#define CELL_TYPE_LENGTH                                  *((unsigned char *)(CONFIG_SEGMENT + CELL_TYPE_LENGTH_Offset ))
#define CELL_TYPE                                         *((unsigned char *)(CONFIG_SEGMENT + CELL_TYPE_Offset ))
#define MANUFACTURE_NAME_LENGTH                           *((unsigned char *)(CONFIG_SEGMENT + MANUFACTURE_NAME_LENGTH_Offset ))
#define MANUFACTURE_NAME                                  *((unsigned char *)(CONFIG_SEGMENT + MANUFACTURE_NAME_Offset ))
#define RESERVED_FOR_OFFSET1                              *((unsigned char *)(CONFIG_SEGMENT + RESERVED_FOR_OFFSET1_Offset ))
#define ADC_CURRENT_DETECT_FOR_DSG_STATUS                 *((unsigned int *)(CONFIG_SEGMENT + ADC_CURRENT_DETECT_FOR_DSG_STATUS_Offset ))
#define ADC_CURRENT_DETECT_FOR_CHG_STATUS                 *((unsigned int *)(CONFIG_SEGMENT + ADC_CURRENT_DETECT_FOR_CHG_STATUS_Offset ))
#define ADC_DOC_PROTECTION                                *((unsigned int *)(CONFIG_SEGMENT + ADC_DOC_PROTECTION_Offset ))
#define ADC_COC_PROTECTION                                *((unsigned int *)(CONFIG_SEGMENT + ADC_COC_PROTECTION_Offset ))
#define ADC_DSG_HIGH_CURRENT_DETECT                       *((unsigned int *)(CONFIG_SEGMENT + ADC_DSG_HIGH_CURRENT_DETECT_Offset ))
#define ADC_AccQ_FOR_CHG_TH                               *((unsigned long *)(CONFIG_SEGMENT + ADC_AccQ_FOR_CHG_TH_Offset ))
#define Cycle_Count_FOR_CHG_1st_TH                        *((unsigned int *)(CONFIG_SEGMENT + Cycle_Count_FOR_CHG_1st_TH_Offset ))
#define Cycle_Count_FOR_CHG_2nd_TH                        *((unsigned int *)(CONFIG_SEGMENT + Cycle_Count_FOR_CHG_2nd_TH_Offset ))
#define ADC_BATTERY_OV_PROTECTION                         *((unsigned int *)(CONFIG_SEGMENT + ADC_BATTERY_OV_PROTECTION_Offset ))
#define ADC_BATTERY_OV_RELEASE                            *((unsigned int *)(CONFIG_SEGMENT + ADC_BATTERY_OV_RELEASE_Offset ))
#define ADC_BATTERY_UV_PROTECTION                         *((unsigned int *)(CONFIG_SEGMENT + ADC_BATTERY_UV_PROTECTION_Offset ))
#define ADC_BATTERY_UV_RELEASE                            *((unsigned int *)(CONFIG_SEGMENT + ADC_BATTERY_UV_RELEASE_Offset ))
#define ADC_DSG_OT_HIGH_PROTECTION                        *((unsigned int *)(CONFIG_SEGMENT + ADC_DSG_OT_HIGH_PROTECTION_Offset ))
#define ADC_DSG_OT_HIGH_RELEASE                           *((unsigned int *)(CONFIG_SEGMENT + ADC_DSG_OT_HIGH_RELEASE_Offset ))
#define ADC_DSG_OT_LOW_PROTECTION                         *((unsigned int *)(CONFIG_SEGMENT + ADC_DSG_OT_LOW_PROTECTION_Offset ))
#define ADC_DSG_OT_LOW_RELEASE                            *((unsigned int *)(CONFIG_SEGMENT + ADC_DSG_OT_LOW_RELEASE_Offset ))
#define ADC_CHG_OT_PROTECTION                             *((unsigned int *)(CONFIG_SEGMENT + ADC_CHG_OT_PROTECTION_Offset ))
#define ADC_CHG_OT_RELEASE                                *((unsigned int *)(CONFIG_SEGMENT + ADC_CHG_OT_RELEASE_Offset ))
#define ADC_UT_PROTECTION                                 *((unsigned int *)(CONFIG_SEGMENT + ADC_UT_PROTECTION_Offset ))
#define ADC_UT_RELEASE                                    *((unsigned int *)(CONFIG_SEGMENT + ADC_UT_RELEASE_Offset ))
#define MIN_CELL_OV_VOLTAGE_FOR_SOC                       *((unsigned int *)(CONFIG_SEGMENT + MIN_CELL_OV_VOLTAGE_FOR_SOC_Offset ))
#define MAX_CELL_UV_VOLTAGE_FOR_SOC                       *((unsigned int *)(CONFIG_SEGMENT + MAX_CELL_UV_VOLTAGE_FOR_SOC_Offset ))
#define ADC_LOOKUP_1st_LEVEL_OCV_DSG_CURRENT_VALUES       *((unsigned int *)(CONFIG_SEGMENT + ADC_LOOKUP_1st_LEVEL_OCV_DSG_CURRENT_VALUES_Offset ))
#define ADC_LOOKUP_2nd_LEVEL_OCV_DSG_CURRENT_VALUES       *((unsigned int *)(CONFIG_SEGMENT + ADC_LOOKUP_2nd_LEVEL_OCV_DSG_CURRENT_VALUES_Offset ))
#define ADC_LOOKUP_3rd_LEVEL_OCV_DSG_CURRENT_VALUES       *((unsigned int *)(CONFIG_SEGMENT + ADC_LOOKUP_3rd_LEVEL_OCV_DSG_CURRENT_VALUES_Offset ))
#define ADC_LOOKUP_1st_LEVEL_OCV_CHG_CURRENT_VALUES       *((unsigned int *)(CONFIG_SEGMENT + ADC_LOOKUP_1st_LEVEL_OCV_CHG_CURRENT_VALUES_Offset ))
#define ADC_LOOKUP_2nd_LEVEL_OCV_CHG_CURRENT_VALUES       *((unsigned int *)(CONFIG_SEGMENT + ADC_LOOKUP_2nd_LEVEL_OCV_CHG_CURRENT_VALUES_Offset ))
#define MAX_DSG_C_ADC_RECORD_EEPROM                       *((unsigned int *)(CONFIG_SEGMENT + MAX_DSG_C_ADC_RECORD_EEPROM_Offset ))
#define MAX_CHG_C_ADC_RECORD_EEPROM                       *((unsigned int *)(CONFIG_SEGMENT + MAX_CHG_C_ADC_RECORD_EEPROM_Offset ))
#define MAX_VBAT_ADC_RECORD_EEPROM                        *((unsigned int *)(CONFIG_SEGMENT + MAX_VBAT_ADC_RECORD_EEPROM_Offset ))
#define MIN_VBAT_ADC_RECORD_EEPROM                        *((unsigned int *)(CONFIG_SEGMENT + MIN_VBAT_ADC_RECORD_EEPROM_Offset ))
#define MAX_TH1_ADC_RECORD_EEPROM                         *((unsigned int *)(CONFIG_SEGMENT + MAX_TH1_ADC_RECORD_EEPROM_Offset ))
#define MIN_TH1_ADC_RECORD_EEPROM                         *((unsigned int *)(CONFIG_SEGMENT + MIN_TH1_ADC_RECORD_EEPROM_Offset ))
#define MAX_TH2_ADC_RECORD_EEPROM                         *((unsigned int *)(CONFIG_SEGMENT + MAX_TH2_ADC_RECORD_EEPROM_Offset ))
#define MIN_TH2_ADC_RECORD_EEPROM                         *((unsigned int *)(CONFIG_SEGMENT + MIN_TH2_ADC_RECORD_EEPROM_Offset ))
#define RECORD_DATA_COUNT_EEPROM                          *((unsigned int *)(CONFIG_SEGMENT + RECORD_DATA_COUNT_EEPROM_Offset ))
#define Cycle_Count_RECORD_EEPROM                         *((unsigned int *)(CONFIG_SEGMENT + Cycle_Count_RECORD_EEPROM_Offset ))
#define ADC_AccumulatingQ_RECORD_EEPROM                   *((unsigned long *)(CONFIG_SEGMENT + ADC_AccumulatingQ_RECORD_EEPROM_Offset ))
#define VBAT_mV_To_ADC_Factor                             *((float *)(CONFIG_SEGMENT + VBAT_mV_To_ADC_Factor_Offset ))
#define DSG_OP_ADC_OFFSET                                 *((signed char *)(CONFIG_SEGMENT + DSG_OP_ADC_OFFSET_Offset ))
#define CHG_OP_ADC_OFFSET                                 *((signed char *)(CONFIG_SEGMENT + CHG_OP_ADC_OFFSET_Offset ))
#define VBAT_ADC_OFFSET                                   *((signed char *)(CONFIG_SEGMENT + VBAT_ADC_OFFSET_Offset ))
#define NTC1_ADC_OFFSET                                   *((signed char *)(CONFIG_SEGMENT + NTC1_ADC_OFFSET_Offset ))
#define NTC2_ADC_OFFSET                                   *((signed char *)(CONFIG_SEGMENT + NTC2_ADC_OFFSET_Offset ))
#define SOC_ADC_OFFSET                                    *((signed char *)(CONFIG_SEGMENT + SOC_ADC_OFFSET_Offset ))
#define ADC_CHARGER_DETECTOR_TH                           *((unsigned int *)(CONFIG_SEGMENT + ADC_CHARGER_DETECTOR_TH_Offset ))
// 
/////////////////////////////////////////////////////////////////////////// 
// 
// Define Var Type
// 
// ========================================
//  #define  _ee_address_CONFIG_SEGMENT                                                                           0x4000 //EEPROM Start Address, must use Hexadecimal
//  #define  _ee_uchar_System_Control_Bit_EEPROM                                                                  7 // 1 bytes
//  #define  _ee_uint_MANUFACTURE_DATE                                                                            16611 //(MANUFACTURE_DATE_YEAR - 1980) * 512 + MANUFACTURE_DATE_MONTH * 32 + MANUFACTURE_DATE_DAY // 2 bytes
//  #define  _ee_uint_SERIAL_NUMBER                                                                               10 // 2 bytes
//  #define  _ee_uchar_VERSION                                                                                    1 // 1 bytes
//  #define  _ee_uchar_MINOR_VERSION                                                                              2 // 1 bytes
//  #define  _ee_uchar_NUMBER_OF_PARALLEL_CELLS                                                                   4 // 1 bytes
//  #define  _ee_uchar_NUMBER_OF_SERIES_CELLS                                                                     13 // 1 bytes
//  #define  _ee_str_len_CELL_TYPE_LENGTH                                                                         8
//  #define  _ee_str_CELL_TYPE                                                                                    "sony 26F"
//  #define  _ee_str_len_MANUFACTURE_NAME_LENGTH                                                                  8
//  #define  _ee_str_MANUFACTURE_NAME                                                                             "Dynapack"
//  #define  _ee_uchar_RESERVED_FOR_OFFSET1                                                                       0
//  #define  _ee_uint_ADC_CURRENT_DETECT_FOR_DSG_STATUS                                                           4 //80mA; unit: mA; 2bytes; if current > the define, in discharging status
//  #define  _ee_uint_ADC_CURRENT_DETECT_FOR_CHG_STATUS                                                           7 //100mA; unit: mA; 2bytes; if current > the define, in charging status
//  #define  _ee_uint_ADC_DOC_PROTECTION                                                                          2544 // 50A; unit: 10mA; discharging current protection is positive
//  #define  _ee_uint_ADC_COC_PROTECTION                                                                          298 // 4A; unit: 10mA; charging current protection
//  #define  _ee_uint_ADC_DSG_HIGH_CURRENT_DETECT                                                                 407 // 8000mA; 2bytes; for switch High/Low OT Protection
//  #define  _ee_ulong_ADC_AccQ_FOR_CHG_TH                                                                        2232000 //one Cycle Count Threshold
//  #define  _ee_uint_Cycle_Count_FOR_CHG_1st_TH                                                                  150 // 150 times; unit: times; 2byte; Cycle Count times for charger to set CHG voltage
//  #define  _ee_uint_Cycle_Count_FOR_CHG_2nd_TH                                                                  500 // 500 times; unit: times; 2byte; Cycle Count times for charger to set CHG voltage
//  #define  _ee_uint_ADC_BATTERY_OV_PROTECTION                                                                   708 // 55.12V(cell:4.24); unit: 10mV; 2bytes; 2nd level BATTERY OV PROTECTION
//  #define  _ee_uint_ADC_BATTERY_OV_RELEASE                                                                      693 // 53.95V(cell:4.15); unit: 10mV; 2bytes; 2nd level BATTERY OV RELEASE
//  #define  _ee_uint_ADC_BATTERY_UV_PROTECTION                                                                   468 // 36.4V(cell:2.8); unit: 10mV; 2bytes; 2nd level BATTERY UV PROTECTION
//  #define  _ee_uint_ADC_BATTERY_UV_RELEASE                                                                      534 // 41.6V(cell:3.2); unit: 10mV; 2bytes; 2nd level BATTERY UV RELEASE
//  #define  _ee_uint_ADC_DSG_OT_HIGH_PROTECTION                                                                  132 //unit: 425.56 mV; 85 Celcius; Over temperature protection for discharging(Low divided voltage)
//  #define  _ee_uint_ADC_DSG_OT_HIGH_RELEASE                                                                     148 //unit: 479 mV; 80 Celcius; Over temperature release for discharging(Low divided voltage)
//  #define  _ee_uint_ADC_DSG_OT_LOW_PROTECTION                                                                   188 //unit: 607.42 mV; 70 Celcius; Over temperature protection for discharging(Low divided voltage)
//  #define  _ee_uint_ADC_DSG_OT_LOW_RELEASE                                                                      212 //unit: 683.94 mV; 65 Celcius; Over temperature release for discharging(Low divided voltage)
//  #define  _ee_uint_ADC_CHG_OT_PROTECTION                                                                       301 //unit: 971 mV; 50 Celcius; Over temperature protection for charging(Low divided voltage)
//  #define  _ee_uint_ADC_CHG_OT_RELEASE                                                                          337 //unit: 1087 mV; 45 Celcius; Over temperature release for charging(Low divided voltage)
//  #define  _ee_uint_ADC_UT_PROTECTION                                                                           750 //unit: 2417 mV; 0 Celcius; Under temperature protection(Low divided voltage)
//  #define  _ee_uint_ADC_UT_RELEASE                                                                              705 //unit: 2272 mV; 5 Celcius; Under temperature release(Low divided voltage)
//  #define  _ee_uint_MIN_CELL_OV_VOLTAGE_FOR_SOC                                                                 4200 //mv
//  #define  _ee_uint_MAX_CELL_UV_VOLTAGE_FOR_SOC                                                                 3200 //mv
//  #define  _ee_uint_ADC_LOOKUP_1st_LEVEL_OCV_DSG_CURRENT_VALUES                                                 132 // 2600mA; 2bytes; CURRENT_OF_DSG_STATUS ~ 2600mA for 4p cell==>OCV
//  #define  _ee_uint_ADC_LOOKUP_2nd_LEVEL_OCV_DSG_CURRENT_VALUES                                                 397 // 7800mA; 2bytes; 2600mA ~ 7800mA for 4p cell==>0.5C
//  #define  _ee_uint_ADC_LOOKUP_3rd_LEVEL_OCV_DSG_CURRENT_VALUES                                                 662 // 13000mA; 2bytes; 7800mA 以上 for 4p cell==1C
//  #define  _ee_uint_ADC_LOOKUP_1st_LEVEL_OCV_CHG_CURRENT_VALUES                                                 68 // 910mA; 2bytes; CURRENT_OF_DSG_STATUS ~ 2600mA for 4p cell==>OCV
//  #define  _ee_uint_ADC_LOOKUP_2nd_LEVEL_OCV_CHG_CURRENT_VALUES                                                 271 // 3640mA; 2bytes; 2600mA ~ 7800mA for 4p cell==>0.5C
//  #define  _ee_uint_MAX_DSG_C_ADC_RECORD_EEPROM                                                                 0
//  #define  _ee_uint_MAX_CHG_C_ADC_RECORD_EEPROM                                                                 0
//  #define  _ee_uint_MAX_VBAT_ADC_RECORD_EEPROM                                                                  0
//  #define  _ee_uint_MIN_VBAT_ADC_RECORD_EEPROM                                                                  65535
//  #define  _ee_uint_MAX_TH1_ADC_RECORD_EEPROM                                                                   0
//  #define  _ee_uint_MIN_TH1_ADC_RECORD_EEPROM                                                                   65535
//  #define  _ee_uint_MAX_TH2_ADC_RECORD_EEPROM                                                                   0
//  #define  _ee_uint_MIN_TH2_ADC_RECORD_EEPROM                                                                   65535
//  #define  _ee_uint_RECORD_DATA_COUNT_EEPROM                                                                    0
//  #define  _ee_uint_Cycle_Count_RECORD_EEPROM                                                                   0
//  #define  _ee_ulong_ADC_AccumulatingQ_RECORD_EEPROM                                                            0
//  #define  _ee_float_VBAT_mV_To_ADC_Factor                                                                      0.01285f // 4 bytes;
//  #define  _ee_char_DSG_OP_ADC_OFFSET                                                                           0 //1byte ; 實際值-理論值 (signed char)
//  #define  _ee_char_CHG_OP_ADC_OFFSET                                                                           0 //1byte ; 實際值-理論值 (signed char)
//  #define  _ee_char_VBAT_ADC_OFFSET                                                                             0 //1byte ; 實際值-理論值 (signed char)
//  #define  _ee_char_NTC1_ADC_OFFSET                                                                             0 //1byte ; 實際值-理論值 Thermistor (signed char)
//  #define  _ee_char_NTC2_ADC_OFFSET                                                                             0 //1byte ; 實際值-理論值 Thermistor (signed char)
//  #define  _ee_char_SOC_ADC_OFFSET                                                                              0 //1byte ; 實際值-理論值 (signed char)
//  #define  _ee_uint_ADC_CHARGER_DETECTOR_TH                                                                     465 //unit:1500 mV;
