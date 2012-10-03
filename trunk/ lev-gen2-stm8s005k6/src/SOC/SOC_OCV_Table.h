
//#include "..\SystemInitialData\SystemInformation.h"




/***********************************************
 * not put the data in memory
 * this is for SOC function to use
 ***********************************************/
//#define SOC_BATTERY_OV_VOLTAGE     __2ND_BATTERY_OV_PROTECTION_     //5600
//#define SOC_BATTERY_UV_VOLTAGE     __2ND_BATTERY_UV_PROTECTION_     //3700
//#define SOC_1st_CELL_OV_VOLTAGE     4250 //mV
//#define SOC_1st_CELL_UV_VOLTAGE     2500 //mV


#define OCV_TABLE_POINTS 51
#define NUM_OF_OCV_LINE  6
#define TERMINAL_VOLTAGE_INDEX 0
#define RESIDUAL_OCV_CAPACITY_INDEX 1
#define RESIDUAL_DSG_1st_CAPACITY_INDEX 2
#define RESIDUAL_DSG_2nd_CAPACITY_INDEX 3
#define RESIDUAL_DSG_3rd_CAPACITY_INDEX 4
#define RESIDUAL_CHG_1st_CAPACITY_INDEX 5
#define RESIDUAL_CHG_2nd_CAPACITY_INDEX 6
/*
; TERMINAL_VOLTAGE units is mV
; RESIDUAL_CAPACITY units is percentage * 100
; Please sort from largest to smallest
// 2600mAh cell, 25 degree, 0.5C OCV Table
*/

const int RealOCVTable[OCV_TABLE_POINTS][NUM_OF_OCV_LINE+1] =

{
////////////// RESIDUAL CAPACITY /////////////////////////////////////////////////////////
//            OCV       1nd      2st     3rd     1nd      2st
//cell(mV),     OCV, DSG0.5C,   DSG1C, DSG1.5C,  CHG0.2C, CHG0.7C,      ///////////////////
    { 4200,   10000,   10000,   10000,   10000,    9723,    8811  },   //index = 00
    { 4176,    9824,   10000,   10000,   10000,    9533,    8556  },   //index = 01
    { 4152,    9651,   10000,   10000,   10000,    9350,    8361  },   //index = 02
    { 4128,    9479,   10000,   10000,   10000,    9160,    8161  },   //index = 03
    { 4104,    9280,   10000,   10000,   10000,    8966,    7956  },   //index = 04
    { 4080,    9082,    9964,   10000,   10000,    8765,    7744  },   //index = 05
    { 4056,    8883,    9853,   10000,   10000,    8560,    7527  },   //index = 06
    { 4032,    8684,    9696,   10000,   10000,    8347,    7303  },   //index = 07
    { 4008,    8479,    9523,    9979,   10000,    8130,    7073  },   //index = 08
    { 3984,    8260,    9344,    9917,   10000,    7907,    6834  },   //index = 09
    { 3960,    8040,    9161,    9807,   10000,    7677,    6583  },   //index = 10
    { 3936,    7816,    8972,    9658,   10000,    7442,    6319  },   //index = 11
    { 3912,    7591,    8778,    9491,    9941,    7200,    6037  },   //index = 12
    { 3888,    7364,    8577,    9314,    9865,    6946,    5725  },   //index = 13
    { 3864,    7120,    8374,    9132,    9754,    6678,    5372  },   //index = 14
    { 3840,    6880,    8164,    8948,    9607,    6391,    4948  },   //index = 15
    { 3816,    6626,    7950,    8754,    9445,    6087,    4428  },   //index = 16
    { 3792,    6375,    7729,    8556,    9267,    5746,    3801  },   //index = 17
    { 3768,    6096,    7506,    8350,    9082,    5339,    3173  },   //index = 18
    { 3744,    5831,    7279,    8139,    8888,    5004,    2566  },   //index = 19
    { 3720,    5603,    7043,    7922,    8691,    4633,    1932  },   //index = 20
    { 3696,    5373,    6795,    7697,    8485,    4073,    1502  },   //index = 21
    { 3672,    5074,    6535,    7472,    8271,    3359,    1218  },   //index = 22
    { 3648,    4662,    6250,    7237,    8056,    2567,     943  },   //index = 23
    { 3624,    3975,    5943,    6998,    7831,    1927,     636  },   //index = 24
    { 3600,    3141,    5595,    6746,    7605,    1542,     348  },   //index = 25
    { 3576,    2355,    5180,    6481,    7374,    1297,     107  },   //index = 26 
    { 3552,    1978,    4689,    6196,    7139,    1075,      56  },   //index = 27
    { 3528,    1720,    4107,    5886,    6900,     850,      27  },   //index = 28
    { 3504,    1523,    3460,    5543,    6646,     530,       7  },   //index = 29 
    { 3480,    1342,    2813,    5150,    6381,     159,       0  },   //index = 30
    { 3456,    1041,    2238,    4695,    6100,      44,       0  },   //index = 31
    { 3432,     627,    1775,    4179,    5791,       9,       0  },   //index = 32 
    { 3408,     451,    1435,    3617,    5453,       0,       0  },   //index = 33
    { 3384,     357,    1182,    3039,    5070,       0,       0  },   //index = 34
    { 3360,     264,     973,    2498,    4639,       0,       0  },   //index = 35 
    { 3336,     244,     723,    2010,    4158,       0,       0  },   //index = 36
    { 3312,     231,     531,    1583,    3642,       0,       0  },   //index = 37
    { 3288,     218,     387,    1209,    3111,       0,       0  },   //index = 38 
    { 3264,     205,     284,     913,    2566,       0,       0  },   //index = 39
    { 3240,     192,     213,     685,    2039,       0,       0  },   //index = 40
    { 3216,     179,     164,     513,    1582,       0,       0  },   //index = 41 
    { 3192,     166,     129,     379,    1206,       0,       0  },   //index = 42
    { 3168,     153,     101,     277,     906,       0,       0  },   //index = 43
    { 3144,     140,      80,     200,     666,       0,       0  },   //index = 44 
    { 3120,     127,      63,     147,     477,       0,       0  },   //index = 45
    { 3096,     114,      47,     104,     326,       0,       0  },   //index = 46
    { 3072,     101,      35,      71,     218,       0,       0  },   //index = 47 
    { 3048,      88,      23,      44,     129,       0,       0  },   //index = 48
    { 3024,      74,      11,      22,      57,       0,       0  },   //index = 49
    { 3000,      61,       0,       0,       0,       0,       0  }    //index = 50 
};                                                            
                                                              
//#define TERMINAL_VOLTAGE_INDEX 0                            
//#define RESIDUAL_CAPACITY_INDEX 1                           
//                                                            
//const int RealOCVTable[OCV_TABLE_POINTS][2] =               
//{                                                           
//  {  4087,  9994  },    //index=00,  1st                    
//  {  3997,  9496  },    //index=01,  2nd                    
//  {  3941,  8998  },    //index=02,  3rd                    
//  {  3890,  8499  },    //index=03,  4th                    
//  {  3843,  8000  },    //index=04,  5th                    
//  {  3800,  7501  },    //index=05,  6th                    
//  {  3761,  7002  },    //index=06,  7th                    
//  {  3727,  6504  },    //index=07,  8th                    
//  {  3695,  6005  },    //index=08,  9th                    
//  {  3666,  5507  },    //index=09,  10th                   
//  {  3641,  5009  },    //index=10,  11th                   
//  {  3618,  4510  },    //index=11,  12th                   
//  {  3596,  4012  },    //index=12,  13th                   
//  {  3572,  3513  },    //index=13,  14th                   
//  {  3544,  3015  },    //index=14,  15th                   
//  {  3511,  2515  },    //index=15,  16th                   
//  {  3473,  2016  },    //index=16,  17th                   
//  {  3432,  1518  },    //index=17,  18th                   
//  {  3381,  1019  },    //index=18,  19th                   
//  {  3299,  521   },    //index=19,  20th                   
//  {  2748,  0     }     //index=20,  21th                   
//};                                                          
                                                              
                                                              
                                                              
