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
#define CELL_TYPE_LENGTH_Offset                           0
#define CELL_TYPE_Offset                                  1
#define MANUFACTURE_NAME_LENGTH_Offset                    9
#define MANUFACTURE_NAME_Offset                           10
#define PRODUCT_NAME_LENGTH_Offset                        22
#define PRODUCT_NAME_Offset                               23
#define MANUFACTURE_DATE_Offset                           28
#define VERSION_Offset                                    30
#define MINOR_VERSION_Offset                              31
#define SERIAL_NUMBER_Offset                              32
#define NUMBER_OF_PARALLEL_CELLS_Offset                   33
#define NUMBER_OF_SERIES_CELLS_Offset                     34
#define ADC_CURRENT_DETECT_FOR_DSG_STATUS_Offset          35
#define ADC_CURRENT_DETECT_FOR_CHG_STATUS_Offset          37
#define ADC_DOC_PROTECTION_Offset                         39
#define ADC_COC_PROTECTION_Offset                         41
#define ADC_DSG_HIGH_CURRENT_DETECT_Offset                43
#define ADC_BATTERY_OV_PROTECTION_Offset                  45
#define ADC_BATTERY_OV_RELEASE_Offset                     47
#define ADC_BATTERY_UV_PROTECTION_Offset                  49
#define ADC_BATTERY_UV_RELEASE_Offset                     51
#define ADC_DSG_OT_HIGH_PROTECTION_Offset                 53
#define ADC_DSG_OT_HIGH_RELEASE_Offset                    55
#define ADC_DSG_OT_LOW_PROTECTION_Offset                  57
#define ADC_DSG_OT_LOW_RELEASE_Offset                     59
#define ADC_CHG_OT_PROTECTION_Offset                      61
#define ADC_CHG_OT_RELEASE_Offset                         63
#define ADC_UT_PROTECTION_Offset                          65
#define ADC_UT_RELEASE_Offset                             67
#define MIN_CELL_OV_VOLTAGE_FOR_SOC_Offset                69
#define MAX_CELL_UV_VOLTAGE_FOR_SOC_Offset                71
#define CHG_mA_To_ADC_Factor_Offset                       73
#define DSG_mA_To_ADC_Factor_Offset                       77
#define VBAT_mV_To_ADC_Factor_Offset                      81
#define Thermistor_mV_To_ADC_Factor_Offset                85
#define CHG_OP_ADC_OFFSET_Offset                          89
#define DSG_OP_ADC_OFFSET_Offset                          90
#define VBAT_ADC_OFFSET_Offset                            91
#define NTC1_ADC_OFFSET_Offset                            92
#define NTC2_ADC_OFFSET_Offset                            93
#define RECORD_DATA_COUNT_EEPROM_Offset                   94
#define MAX_DSG_C_ADC_RECORD_EEPROM_Offset                96
#define MAX_CHG_C_ADC_RECORD_EEPROM_Offset                98
#define MAX_VBAT_ADC_RECORD_EEPROM_Offset                 100
#define MIN_VBAT_ADC_RECORD_EEPROM_Offset                 102
#define MAX_TH1_ADC_RECORD_EEPROM_Offset                  104
#define MIN_TH1_ADC_RECORD_EEPROM_Offset                  106
#define MAX_TH2_ADC_RECORD_EEPROM_Offset                  108
#define MIN_TH2_ADC_RECORD_EEPROM_Offset                  110
// 
/////////////////////////////////////////////////////////////////////////// 
// 
// Data Var Point
#define CELL_TYPE_LENGTH                                  *((unsigned char *)(CONFIG_SEGMENT + CELL_TYPE_LENGTH_Offset ))
#define CELL_TYPE                                         *((unsigned char *)(CONFIG_SEGMENT + CELL_TYPE_Offset ))
#define MANUFACTURE_NAME_LENGTH                           *((unsigned char *)(CONFIG_SEGMENT + MANUFACTURE_NAME_LENGTH_Offset ))
#define MANUFACTURE_NAME                                  *((unsigned char *)(CONFIG_SEGMENT + MANUFACTURE_NAME_Offset ))
#define PRODUCT_NAME_LENGTH                               *((unsigned char *)(CONFIG_SEGMENT + PRODUCT_NAME_LENGTH_Offset ))
#define PRODUCT_NAME                                      *((unsigned char *)(CONFIG_SEGMENT + PRODUCT_NAME_Offset ))
#define MANUFACTURE_DATE                                  *((unsigned int *)(CONFIG_SEGMENT + MANUFACTURE_DATE_Offset ))
#define VERSION                                           *((unsigned char *)(CONFIG_SEGMENT + VERSION_Offset ))
#define MINOR_VERSION                                     *((unsigned char *)(CONFIG_SEGMENT + MINOR_VERSION_Offset ))
#define SERIAL_NUMBER                                     *((unsigned char *)(CONFIG_SEGMENT + SERIAL_NUMBER_Offset ))
#define NUMBER_OF_PARALLEL_CELLS                          *((unsigned char *)(CONFIG_SEGMENT + NUMBER_OF_PARALLEL_CELLS_Offset ))
#define NUMBER_OF_SERIES_CELLS                            *((unsigned char *)(CONFIG_SEGMENT + NUMBER_OF_SERIES_CELLS_Offset ))
#define ADC_CURRENT_DETECT_FOR_DSG_STATUS                 *((unsigned int *)(CONFIG_SEGMENT + ADC_CURRENT_DETECT_FOR_DSG_STATUS_Offset ))
#define ADC_CURRENT_DETECT_FOR_CHG_STATUS                 *((unsigned int *)(CONFIG_SEGMENT + ADC_CURRENT_DETECT_FOR_CHG_STATUS_Offset ))
#define ADC_DOC_PROTECTION                                *((unsigned int *)(CONFIG_SEGMENT + ADC_DOC_PROTECTION_Offset ))
#define ADC_COC_PROTECTION                                *((unsigned int *)(CONFIG_SEGMENT + ADC_COC_PROTECTION_Offset ))
#define ADC_DSG_HIGH_CURRENT_DETECT                       *((unsigned int *)(CONFIG_SEGMENT + ADC_DSG_HIGH_CURRENT_DETECT_Offset ))
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
#define CHG_mA_To_ADC_Factor                              *((float *)(CONFIG_SEGMENT + CHG_mA_To_ADC_Factor_Offset ))
#define DSG_mA_To_ADC_Factor                              *((float *)(CONFIG_SEGMENT + DSG_mA_To_ADC_Factor_Offset ))
#define VBAT_mV_To_ADC_Factor                             *((float *)(CONFIG_SEGMENT + VBAT_mV_To_ADC_Factor_Offset ))
#define Thermistor_mV_To_ADC_Factor                       *((float *)(CONFIG_SEGMENT + Thermistor_mV_To_ADC_Factor_Offset ))
#define CHG_OP_ADC_OFFSET                                 *((signed char *)(CONFIG_SEGMENT + CHG_OP_ADC_OFFSET_Offset ))
#define DSG_OP_ADC_OFFSET                                 *((signed char *)(CONFIG_SEGMENT + DSG_OP_ADC_OFFSET_Offset ))
#define VBAT_ADC_OFFSET                                   *((signed char *)(CONFIG_SEGMENT + VBAT_ADC_OFFSET_Offset ))
#define NTC1_ADC_OFFSET                                   *((signed char *)(CONFIG_SEGMENT + NTC1_ADC_OFFSET_Offset ))
#define NTC2_ADC_OFFSET                                   *((signed char *)(CONFIG_SEGMENT + NTC2_ADC_OFFSET_Offset ))
#define RECORD_DATA_COUNT_EEPROM                          *((unsigned int *)(CONFIG_SEGMENT + RECORD_DATA_COUNT_EEPROM_Offset ))
#define MAX_DSG_C_ADC_RECORD_EEPROM                       *((unsigned int *)(CONFIG_SEGMENT + MAX_DSG_C_ADC_RECORD_EEPROM_Offset ))
#define MAX_CHG_C_ADC_RECORD_EEPROM                       *((unsigned int *)(CONFIG_SEGMENT + MAX_CHG_C_ADC_RECORD_EEPROM_Offset ))
#define MAX_VBAT_ADC_RECORD_EEPROM                        *((unsigned int *)(CONFIG_SEGMENT + MAX_VBAT_ADC_RECORD_EEPROM_Offset ))
#define MIN_VBAT_ADC_RECORD_EEPROM                        *((unsigned int *)(CONFIG_SEGMENT + MIN_VBAT_ADC_RECORD_EEPROM_Offset ))
#define MAX_TH1_ADC_RECORD_EEPROM                         *((unsigned int *)(CONFIG_SEGMENT + MAX_TH1_ADC_RECORD_EEPROM_Offset ))
#define MIN_TH1_ADC_RECORD_EEPROM                         *((unsigned int *)(CONFIG_SEGMENT + MIN_TH1_ADC_RECORD_EEPROM_Offset ))
#define MAX_TH2_ADC_RECORD_EEPROM                         *((unsigned int *)(CONFIG_SEGMENT + MAX_TH2_ADC_RECORD_EEPROM_Offset ))
#define MIN_TH2_ADC_RECORD_EEPROM                         *((unsigned int *)(CONFIG_SEGMENT + MIN_TH2_ADC_RECORD_EEPROM_Offset ))
