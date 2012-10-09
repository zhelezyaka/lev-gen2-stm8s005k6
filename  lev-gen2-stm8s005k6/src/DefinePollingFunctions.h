

/********************************************************************************
*   Define for TimerPollingFunction                                             *
* Define	(could not be modified, because it's base on function define)       *
********************************************************************************/
// Timer 
#define TimerIntervalTimeBase_MS                64  // unit: ms
// PWM Function has 10 setp different frequency and light on and ligh off, so total PWM turn on is LED_PWM_One_Step_CycleTimes * LED_PWM_Whole_Steps
#define LED_PWM_Whole_Steps                     20  //could not be modified, because it's base on function define
/********************************************************************************
* Define	                                                                    *
********************************************************************************/
#define LED_PWM_One_Step_CycleTimes             3   //unit:cycles , 150ms = LED_PWM_One_Step_CycleTimes * TimerIntervalTimeBase_MS
#define LED_Blink_OnOffInterval_CycleTimes      8  //unit:cycles , 500 ms = LED_Blink_OnOffInterval_CycleTimes * TimerIntervalTimeBase_MS
#define Button_Click_CycleTimes                 9  //unit:cycles ,  600 ms = Button_Click_CycleTimes * TimerIntervalTimeBase_MS
#define Button_Long_Press_CycleTimes            78 //unit:cycles , 5 sec = Button_Long_Press_CycleTimes * TimerIntervalTimeBase_MS

#define Button_MultiClick_DetectionCycleTimes   46  //unit:cycles ,  3 sec = Button_DoubleClick_IntervalCycleTimes * TimerIntervalTimeBase_MS

#define OC_PROTECTION_CycleTimes                100 //unit:cycles , 5 sec = OC_PROTECTION_CycleTimes * TimerIntervalTimeBase_MS

/* 
    COC_RELEASE_HOLDING_CycleTimes
    must biger than CHG_OC_Protection_Delay_Cycle
    for COC_RELEASE_FOR_REPEATED_CHECK
*/
//#define COC_RELEASE_HOLDING_CycleTimes        (CHG_OC_Protection_Delay_Cycle+3)  //unit:cycles , 1 sec = COC_RELEASE_HOLDING_CycleTimes * TimerIntervalTimeBase_MS
//#define COC_RELEASE_HOLDING_CycleTimes          18  //unit:cycles , 1.15 sec = COC_RELEASE_HOLDING_CycleTimes * TimerIntervalTimeBase_MS


#define System_1_Sec_Flag_CycleTimes            15  //unit:cycles , 1 sec = System_1_Sec_Flag_CycleTimes * TimerIntervalTimeBase_MS


/********************************************************************************
* Define	(for SUB Polling Protection)                                        *
********************************************************************************/
/////////////////////////////////////////////////
// Current Sub Functions Vairable Define
//1 time = 50ms, based on timer interval time
#define DSG_OC_Protection_Delay_Cycle       15   //times,1000 ms = 1sec = DSG_OC_Protection_Delay_Cycle * TimerIntervalTimeBase_MS
#define CHG_OC_Protection_Delay_Cycle       15   //times,1000 ms = 1sec = CHG_OC_Protection_Delay_Cycle * TimerIntervalTimeBase_MS

/* 
    COC_RELEASE_HOLDING_CycleTimes
    must biger than CHG_OC_Protection_Delay_Cycle about 3 cycle timies
    for COC_RELEASE_FOR_REPEATED_CHECK
*/
#define COC_RELEASE_HOLDING_CycleTimes        (CHG_OC_Protection_Delay_Cycle+3)  //unit:cycles , 1 sec = COC_RELEASE_HOLDING_CycleTimes * TimerIntervalTimeBase_MS
//#define COC_RELEASE_HOLDING_CycleTimes          18  //unit:cycles , 1.15 sec = COC_RELEASE_HOLDING_CycleTimes * TimerIntervalTimeBase_MS



#define Battery_OV_Protection_Delay_Cycle   46   //times, 3000 ms = 3sec = Battery_OV_Protection_Delay_Cycle * TimerIntervalTimeBase_MS
#define Battery_UV_Protection_Delay_Cycle   46   //times, 3000 ms = 3sec = Battery_UV_Protection_Delay_Cycle * TimerIntervalTimeBase_MS
#define DSG_Low_OT_Protection_Delay_Cycle   15   //times, 1000 ms = 1sec = DSG_Low_OT_Protection_Delay_Cycle * TimerIntervalTimeBase_MS
#define DSG_High_OT_Protection_Delay_Cycle  15   //times, 1000 ms = 1sec = DSG_High_OT_Protection_Delay_Cycle * TimerIntervalTimeBase_MS
#define CHG_OT_Protection_Delay_Cycle       15   //times, 1000 ms = 1sec = CHG_OT_Protection_Delay_Cycle * TimerIntervalTimeBase_MS
#define UT_Protection_Delay_Cycle           15   //times, 1000 ms = 1sec = UT_Protection_Delay_Cycle * TimerIntervalTimeBase_MS
//////////////////////////////////////////////////////////////////////////////////////////////
// the unit is cycles
#define COC_Repeat_For_LOCK_Times           3   //times, COC Repeat 3 times then LOCK



//////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////
// Polling function

void InitSubPollingProtectionVariables(void);
void ProtectionForPolling(void);
void GetAllADCValuesAndSetDirection(void);


void InitTimerPollingVariables(void);
void Set_IntoHaltModeDelay_Counter_Cycles(unsigned char cycles);
void Recount_IntoHaltModeDelay_Counter(void);
void TimerCounterForPolling(void);



