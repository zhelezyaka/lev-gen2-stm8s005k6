

#define GVarArraySize	21

extern unsigned int G_Var_Array[GVarArraySize];

#define CheckCodeIntSize       4
extern unsigned int G_Communication_Array[];

#define G_SysModeStatusCode             (G_Var_Array[ 0])
#define G_Module_Status                 (G_Var_Array[ 1])   //use
#define G_Auxiliary_Module_Status       (G_Var_Array[ 2])   //use
#define G_SystemFailureStatus           (G_Var_Array[ 3])
#define G_LED_Interface_Status1         (G_Var_Array[ 4])   //use
#define G_LED_Interface_Status2         (G_Var_Array[ 5])   //use
#define G_Device_Interface_Status1      (G_Var_Array[ 6])  //use
#define G_Add_Device_Interface_Status   (G_Var_Array[ 7])  //use
#define G_DSG_Current_ADC               (G_Var_Array[ 8])
#define G_CHG_Current_ADC               (G_Var_Array[ 9])
#define G_VBAT_ADC                      (G_Var_Array[ 10])
#define G_TH1_ADC                       (G_Var_Array[ 11])
#define G_TH2_ADC                       (G_Var_Array[ 12])
//////////////////////////////
//recording data
#define RECORDING_DATA_Start_Array_Index    13         
#define RECORDING_DATA_NUMBER               8    
#define G_MAX_DSG_C_ADC_RECORD          (G_Var_Array[ 13])
#define G_MAX_CHG_C_ADC_RECORD          (G_Var_Array[ 14])
#define G_MAX_VBAT_ADC_RECORD           (G_Var_Array[ 15])
#define G_MIN_VBAT_ADC_RECORD           (G_Var_Array[ 16])
#define G_MAX_TH1_ADC_RECORD            (G_Var_Array[ 17])
#define G_MIN_TH1_ADC_RECORD            (G_Var_Array[ 18])
#define G_MAX_TH2_ADC_RECORD            (G_Var_Array[ 19])
#define G_MIN_TH2_ADC_RECORD            (G_Var_Array[ 20])


//#define G_Device_Action_Status          (G_Var_Array[10])   //no use
//#define G_Module_Active_Status          (G_Var_Array[ 3])




