
/********************************************************************************
* include file				        											*
********************************************************************************/
#include "stm8s.h"
#include "Devices.h"
//#include "lev_device_define.h"

/********************************************************************************
* extern include file															*
********************************************************************************/
#include "Module_Driver_Define.h"


/********************************************************************************
* Define             															*
********************************************************************************/
#define _Frequency_Prescaler_               9999    // TIM1 frequency = fMaster / (999 + 1) = 4MHz / 1000 = 4KHz
#define _Init_Duty_                         0    // Duty = 2000 / Frequency_Prescaler = 2000 / 10000 = 0.2 (20%)
#define _One_Step_Frequency_Prescaler_      (unsigned int)((_Frequency_Prescaler_ + 1)/10)
#define _TIM1_Frequency_Prescaler_          _Frequency_Prescaler_    // TIM1 frequency = fMaster / (9999 + 1) = 4MHz / 10000 = 400Hz
#define _TIM2_Frequency_Prescaler_          _Frequency_Prescaler_    // TIM1 frequency = fMaster / (9999 + 1) = 4MHz / 10000 = 400Hz
void set_Led_PWM_Change_Duty(unsigned char LEDNumBits, unsigned int duty);
/********************************************************************************
* tim1_init																		*
********************************************************************************/
void tim1_PWM_init(void)
{
	TIM1_DeInit();
	/* Time Base configuration */
	/*
	TIM1_Period = 4095
	TIM1_Prescaler = 0
	TIM1_CounterMode = TIM1_COUNTERMODE_UP
	TIM1_RepetitionCounter = 0
	*/
	TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, _TIM1_Frequency_Prescaler_, 0);
	/* Channel 1, 2,3 and 4 Configuration in PWM mode */
	/*
	TIM1_OCMode = TIM1_OCMODE_PWM2
	TIM1_OutputState = TIM1_OUTPUTSTATE_ENABLE
	TIM1_OutputNState = TIM1_OUTPUTNSTATE_ENABLE
	TIM1_Pulse = CCR1_Val
	TIM1_OCPolarity = TIM1_OCPOLARITY_LOW
	TIM1_OCNPolarity = TIM1_OCNPOLARITY_HIGH
	TIM1_OCIdleState = TIM1_OCIDLESTATE_SET
	TIM1_OCNIdleState = TIM1_OCIDLESTATE_RESET
	*/
	/*TIM1_Pulse = CCR1_Val*/
	TIM1_OC1Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
				 _Init_Duty_, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_SET,
				 TIM1_OCNIDLESTATE_RESET); 
	/*TIM1_Pulse = CCR2_Val*/
	TIM1_OC2Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
				 _Init_Duty_, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_SET,
				 TIM1_OCNIDLESTATE_RESET);
	/*TIM1_Pulse = CCR3_Val*/
	TIM1_OC3Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
				 _Init_Duty_, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_SET,
				 TIM1_OCNIDLESTATE_RESET);
	/*TIM1_Pulse = CCR4_Val*/
	TIM1_OC4Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, _Init_Duty_, TIM1_OCPOLARITY_HIGH,
				 TIM1_OCIDLESTATE_SET);
	/* TIM1 counter enable */
	TIM1_Cmd(ENABLE);
	/* TIM1 Main Output Enable */
	TIM1_CtrlPWMOutputs(ENABLE);

	return;
}

/********************************************************************************
* tim2_init																		*
********************************************************************************/
void tim2_PWM_init(void)
{
	TIM2_DeInit();
	/* Time base configuration */
	TIM2_TimeBaseInit(TIM2_PRESCALER_1, _TIM2_Frequency_Prescaler_); 
	/* PWM1 Mode configuration: Channel1 */ 
    TIM2_OC1Init(TIM2_OCMODE_PWM2, TIM2_OUTPUTSTATE_ENABLE, _Init_Duty_, TIM2_OCPOLARITY_LOW);
    //TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, _Init_Duty_, TIM2_OCPOLARITY_HIGH); // Duty = 500 / prescaler = 500 / 1000 = 0.5 (50%)
	TIM2_OC1PreloadConfig(ENABLE);
	TIM2_ARRPreloadConfig(ENABLE);
	TIM2_Cmd(ENABLE);

	return;
}

/********************************************************************************
* LED I/O Control_init															*
********************************************************************************/

/********************************************************************************
* LED I/O Control_init															*
********************************************************************************/
void _Device_Init_Led_Function(void)
{
	GPIO_Init(LED1_PORT, LED1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);  // set as output and PP Low level
	GPIO_Init(LED2_PORT, LED2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);  // set as output and PP Low level
	GPIO_Init(LED3_PORT, LED3_PIN, GPIO_MODE_OUT_PP_LOW_FAST);  // set as output and PP Low level
	GPIO_Init(LED4_PORT, LED4_PIN, GPIO_MODE_OUT_PP_LOW_FAST);  // set as output and PP Low level
	GPIO_Init(LED5_PORT, LED5_PIN, GPIO_MODE_OUT_PP_LOW_FAST);  // set as output and PP Low level
}

void _Device_Set_Led_PWM_BITs(unsigned char LEDNumBits){
    if(LEDNumBits != 0){
        TIM1_DeInit();
        TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, _TIM1_Frequency_Prescaler_, 0);
        // turn on , set high
        if(LEDNumBits & LED1){
            /*TIM1_Pulse = CCR1_Val*/
            TIM1_OC1Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
                         _Init_Duty_, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_SET,
                         TIM1_OCNIDLESTATE_RESET);
        }
        if(LEDNumBits & LED2){
            /*TIM1_Pulse = CCR2_Val*/
            TIM1_OC2Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
                         _Init_Duty_, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_SET,
                         TIM1_OCNIDLESTATE_RESET);
        }
        if(LEDNumBits & LED3){
            /*TIM1_Pulse = CCR3_Val*/
            TIM1_OC3Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
                         _Init_Duty_, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_SET,
                         TIM1_OCNIDLESTATE_RESET);
        }
        if(LEDNumBits & LED4){
            /*TIM1_Pulse = CCR4_Val*/
            TIM1_OC4Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, _Init_Duty_, TIM1_OCPOLARITY_HIGH,
                         TIM1_OCIDLESTATE_SET);
        }
        if(LEDNumBits & LED5){
            tim2_PWM_init();
        }
        /* TIM1 Main Output Enable */
        TIM1_CtrlPWMOutputs(ENABLE);
        
        //TIM1_BDTRConfig(TIM1_OSSISTATE_ENABLE, TIM1_LOCKLEVEL_OFF, 11, TIM1_BREAK_DISABLE, TIM1_BREAKPOLARITY_LOW, TIM1_AUTOMATICOUTPUT_ENABLE);        
        /* TIM1 counter enable */
        TIM1_Cmd(ENABLE);
        
    }else{
            
        TIM2_Cmd(DISABLE);
        TIM1_CtrlPWMOutputs(DISABLE);
        TIM1_Cmd(DISABLE);
        TIM1_DeInit();
        TIM2_DeInit();
        //_Device_Init_Led_Function();
    }    
}

void set_Led_PWM_Change_Duty(unsigned char LEDNumBits, unsigned int duty){
        if(LEDNumBits & LED1){
            /*TIM1_Pulse = CCR1_Val*/
            TIM1_OC1Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
                         duty, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_SET,
                         TIM1_OCNIDLESTATE_RESET);
        }
        if(LEDNumBits & LED2){
            /*TIM1_Pulse = CCR2_Val*/
            TIM1_OC2Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
                         duty, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_SET,
                         TIM1_OCNIDLESTATE_RESET);
        }
        if(LEDNumBits & LED3){
            /*TIM1_Pulse = CCR3_Val*/
            TIM1_OC3Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
                         duty, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_SET,
                         TIM1_OCNIDLESTATE_RESET);
        }
        if(LEDNumBits & LED4){
            /*TIM1_Pulse = CCR4_Val*/
            TIM1_OC4Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, duty, TIM1_OCPOLARITY_HIGH,
                         TIM1_OCIDLESTATE_SET);
        }
        if(LEDNumBits & LED5){
            TIM2_OC1Init(TIM2_OCMODE_PWM2, TIM2_OUTPUTSTATE_ENABLE, duty, TIM2_OCPOLARITY_LOW);
            //TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, duty, TIM2_OCPOLARITY_HIGH); // Duty = 500 / prescaler = 500 / 1000 = 0.5 (50%)
        }
}

void _Device_Set_Led_PWM_20_Steps(unsigned char LEDNumBits, unsigned char steps){
    unsigned int scaler;
    if( steps >= 20){
        
        scaler = 0;
        
        set_Led_PWM_Change_Duty(LEDNumBits, scaler);
        return;
    }
    
    
    if( steps > 10){
        steps = 10 - (steps - 10);
    }
    if(steps <= 0){
        scaler = 0;
    }else{
        scaler =( _One_Step_Frequency_Prescaler_ * steps ) - 1;
    }

    set_Led_PWM_Change_Duty(LEDNumBits, scaler);

}



void _Device_Set_Led_OnOff_BITs(unsigned char LEDNumBits)
{
        // turn on , set high
        // turn off , set low
        if(LEDNumBits & LED1){
            GPIO_WriteHigh(LED1_PORT, LED1_PIN);
        }else{
            GPIO_WriteLow(LED1_PORT, LED1_PIN);
        }
        if(LEDNumBits & LED2){
            GPIO_WriteHigh(LED2_PORT, LED2_PIN);
        }else{
            GPIO_WriteLow(LED2_PORT, LED2_PIN);
        }
        if(LEDNumBits & LED3){
            GPIO_WriteHigh(LED3_PORT, LED3_PIN);
        }else{
            GPIO_WriteLow(LED3_PORT, LED3_PIN);
        }
        if(LEDNumBits & LED4){
            GPIO_WriteHigh(LED4_PORT, LED4_PIN);
        }else{
            GPIO_WriteLow(LED4_PORT, LED4_PIN);
        }
        if(LEDNumBits & LED5){
            GPIO_WriteHigh(LED5_PORT, LED5_PIN);
        }else{
            GPIO_WriteLow(LED5_PORT, LED5_PIN);
        }
}

void _Device_Set_Led_Pin_OnOff(unsigned char LEDNumPin)
{
        // turn on , set high
        // turn off , set low
        if(LEDNumPin & LED1){
            GPIO_WriteHigh(LED1_PORT, LED1_PIN);
        }else{
            GPIO_WriteLow(LED1_PORT, LED1_PIN);
        }
        
        if(LEDNumPin & LED2){
            GPIO_WriteHigh(LED2_PORT, LED2_PIN);
        }else{
            GPIO_WriteLow(LED2_PORT, LED2_PIN);
        }
        if(LEDNumPin & LED3){
            GPIO_WriteHigh(LED3_PORT, LED3_PIN);
        }else{
            GPIO_WriteLow(LED3_PORT, LED3_PIN);
        }
        if(LEDNumPin & LED4){
            GPIO_WriteHigh(LED4_PORT, LED4_PIN);
        }else{
            GPIO_WriteLow(LED4_PORT, LED4_PIN);
        }
        if(LEDNumPin & LED5){
            GPIO_WriteHigh(LED5_PORT, LED5_PIN);
        }else{
            GPIO_WriteLow(LED5_PORT, LED5_PIN);
        }
}

void _Device_Set_Led_Pin_OnOff_old(unsigned char LEDNumPin, unsigned char enable)
{
        // turn on , set high
        // turn off , set low
        if(LEDNumPin & LED1){
            if(enable){
                GPIO_WriteHigh(LED1_PORT, LED1_PIN);
            }else{
                GPIO_WriteLow(LED1_PORT, LED1_PIN);
            }
        }
        
        if(LEDNumPin & LED2){
            if(enable){
                GPIO_WriteHigh(LED2_PORT, LED2_PIN);
            }else{
                GPIO_WriteLow(LED2_PORT, LED2_PIN);
            }
        }
        if(LEDNumPin & LED3){
            if(enable){
                GPIO_WriteHigh(LED3_PORT, LED3_PIN);
            }else{
                GPIO_WriteLow(LED3_PORT, LED3_PIN);
            }
        }
        if(LEDNumPin & LED4){
            if(enable){
                GPIO_WriteHigh(LED4_PORT, LED4_PIN);
            }else{
                GPIO_WriteLow(LED4_PORT, LED4_PIN);
            }
        }
        if(LEDNumPin & LED5){
            if(enable){
                GPIO_WriteHigh(LED5_PORT, LED5_PIN);
            }else{
                GPIO_WriteLow(LED5_PORT, LED5_PIN);
            }
        }
}
