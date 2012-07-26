
#include "stm8s.h"
#include "SystemInformation.h"


#if _BURN_IN_EEPROM_SEG_BY_STVD_DEBUG_ > 0 

/********************************************************************************
* Golbal Variable																*
********************************************************************************/
EEPROM unsigned int record_eeprom_uint_array[Record_Eeprom_Uint_Array_Size]=
{
	0
};
EEPROM unsigned long record_eeprom_ulong_array[Record_Eeprom_Ulong_Array_Size]=
{
	0
};

EEPROM unsigned int eeprom_uint_array[Eeprom_Uint_Array_Size]=
{
	_SERIAL_NUMBER_,//
	_VERSION_,//
	_MINOR_VERSION_,//
	_MANUFACTURE_DATE_,//
	_NUMBER_OF_PARALLEL_CELLS_,//
	_NUMBER_OF_SERIES_CELLS_,//
	_ADC_DETECT_CURRENT_OF_DSG_STATUS_,//
	_ADC_DETECT_CURRENT_OF_CHG_STATUS_,//
	_ADC_DOC_PROTECTION_,//
	_ADC_COC_PROTECTION_,//
	_ADC_2ND_BATTERY_OV_PROTECTION_,//
	_ADC_2ND_BATTERY_OV_RELEASE_,//
	_ADC_2ND_BATTERY_UV_PROTECTION_,//
	_ADC_2ND_BATTERY_UV_RELEASE_,//
	_ADC_DSG_OT_PROTECTION_,//
	_ADC_DSG_OT_RELEASE_,//
	_ADC_CHG_OT_PROTECTION_,//
	_ADC_CHG_OT_RELEASE_,//
	_ADC_UT_PROTECTION_,//
	_ADC_UT_RELEASE_,//
	_OC_PROTECTION_RELEASE_TIME_,//
	_BUTTON_PRESS_TIME_,//
	_WAKE_UP_TIME_FROM_SUSPEND_MODE_,//
	_FIRST_TO_SUSPEND_MODE_IN_RELEASE_TIME_,//
	_SOC_CELL_OV_VOLTAGE_,//
	_SOC_CELL_UV_VOLTAGE_,//
	_CYCLECOUNT_FOR_CHG_LEVEL_1_,//
	_CYCLECOUNT_FOR_CHG_LEVEL_2_,//
	_ADC_LOOKUP_1st_OCV_CURRENT_RANGE_,//
	_ADC_LOOKUP_2nd_OCV_CURRENT_RANGE_,//
	_ADC_LOOKUP_3rd_OCV_CURRENT_RANGE_,//
	_CHG_OP_ADC_OFFSET_,//
	_DSG_OP_ADC_OFFSET_,//
	_VBAT_ADC_OFFSET_,//
	_NTC_ADC_OFFSET_,//
	_CURRENT_CYCLECOUNT_ //
};
EEPROM unsigned long eeprom_ulong_array[Eeprom_Ulong_Array_Size]=
{
	_ADC_CYCLECOUNT_THRESHOLD_,//
	_CURRENT_ADC_ACCUMULATING_Q_ //
};

EEPROM float eeprom_float_array[Eeprom_Float_Array_Size]=
{
	_CHG_mA_To_ADC_Factor_,//
	_DSG_mA_To_ADC_Factor_,//
	_VBAT_mV_To_ADC_Factor_,//
	_Thermistor_mV_To_ADC_Factor_ //
};
EEPROM unsigned char eeprom_uchar_array[Eeprom_Uchar_Array_Size]=
{
	0x25,
	0x24,
	0x23,
	0x22,
	0x21
};

#endif

