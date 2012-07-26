   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  51                     ; 10 void tim1_init(void)
  51                     ; 11 {
  53                     	switch	.text
  54  0000               _tim1_init:
  58                     ; 12 	TIM1_DeInit();
  60  0000 cd0000        	call	_TIM1_DeInit
  62                     ; 20 	TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, 1000, 0);
  64  0003 4b00          	push	#0
  65  0005 ae03e8        	ldw	x,#1000
  66  0008 89            	pushw	x
  67  0009 4b00          	push	#0
  68  000b 5f            	clrw	x
  69  000c cd0000        	call	_TIM1_TimeBaseInit
  71  000f 5b04          	addw	sp,#4
  72                     ; 32 	TIM1_OC1Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
  72                     ; 33 				 500, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
  72                     ; 34 				 TIM1_OCNIDLESTATE_RESET); 
  74  0011 4b00          	push	#0
  75  0013 4b55          	push	#85
  76  0015 4b00          	push	#0
  77  0017 4b22          	push	#34
  78  0019 ae01f4        	ldw	x,#500
  79  001c 89            	pushw	x
  80  001d 4b44          	push	#68
  81  001f ae0011        	ldw	x,#17
  82  0022 a660          	ld	a,#96
  83  0024 95            	ld	xh,a
  84  0025 cd0000        	call	_TIM1_OC1Init
  86  0028 5b07          	addw	sp,#7
  87                     ; 36 	TIM1_OC2Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
  87                     ; 37 				 500, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET, 
  87                     ; 38 				 TIM1_OCNIDLESTATE_RESET);
  89  002a 4b00          	push	#0
  90  002c 4b55          	push	#85
  91  002e 4b00          	push	#0
  92  0030 4b22          	push	#34
  93  0032 ae01f4        	ldw	x,#500
  94  0035 89            	pushw	x
  95  0036 4b44          	push	#68
  96  0038 ae0011        	ldw	x,#17
  97  003b a660          	ld	a,#96
  98  003d 95            	ld	xh,a
  99  003e cd0000        	call	_TIM1_OC2Init
 101  0041 5b07          	addw	sp,#7
 102                     ; 40 	TIM1_OC3Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
 102                     ; 41 				 500, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
 102                     ; 42 				 TIM1_OCNIDLESTATE_RESET);
 104  0043 4b00          	push	#0
 105  0045 4b55          	push	#85
 106  0047 4b00          	push	#0
 107  0049 4b22          	push	#34
 108  004b ae01f4        	ldw	x,#500
 109  004e 89            	pushw	x
 110  004f 4b44          	push	#68
 111  0051 ae0011        	ldw	x,#17
 112  0054 a660          	ld	a,#96
 113  0056 95            	ld	xh,a
 114  0057 cd0000        	call	_TIM1_OC3Init
 116  005a 5b07          	addw	sp,#7
 117                     ; 44 	TIM1_OC4Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, 500, TIM1_OCPOLARITY_LOW,
 117                     ; 45 				 TIM1_OCIDLESTATE_SET);
 119  005c 4b55          	push	#85
 120  005e 4b22          	push	#34
 121  0060 ae01f4        	ldw	x,#500
 122  0063 89            	pushw	x
 123  0064 ae0011        	ldw	x,#17
 124  0067 a660          	ld	a,#96
 125  0069 95            	ld	xh,a
 126  006a cd0000        	call	_TIM1_OC4Init
 128  006d 5b04          	addw	sp,#4
 129                     ; 47 	TIM1_Cmd(ENABLE);
 131  006f a601          	ld	a,#1
 132  0071 cd0000        	call	_TIM1_Cmd
 134                     ; 49 	TIM1_CtrlPWMOutputs(ENABLE);
 136  0074 a601          	ld	a,#1
 137  0076 cd0000        	call	_TIM1_CtrlPWMOutputs
 139                     ; 51 	return;
 142  0079 81            	ret
 171                     ; 57 void tim2_init(void)
 171                     ; 58 {
 172                     	switch	.text
 173  007a               _tim2_init:
 177                     ; 59 	TIM2_DeInit();
 179  007a cd0000        	call	_TIM2_DeInit
 181                     ; 61 	TIM2_TimeBaseInit(TIM2_PRESCALER_1, 999); // TIM2 frequency = fMaster / (999 + 1) = 8MHz / 1000 = 8KHz
 183  007d ae03e7        	ldw	x,#999
 184  0080 89            	pushw	x
 185  0081 4f            	clr	a
 186  0082 cd0000        	call	_TIM2_TimeBaseInit
 188  0085 85            	popw	x
 189                     ; 63 	TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 500, TIM2_OCPOLARITY_HIGH); // Duty = 500 / prescaler = 500 / 1000 = 0.5 (50%)
 191  0086 4b00          	push	#0
 192  0088 ae01f4        	ldw	x,#500
 193  008b 89            	pushw	x
 194  008c ae0011        	ldw	x,#17
 195  008f a660          	ld	a,#96
 196  0091 95            	ld	xh,a
 197  0092 cd0000        	call	_TIM2_OC1Init
 199  0095 5b03          	addw	sp,#3
 200                     ; 64 	TIM2_OC1PreloadConfig(ENABLE);
 202  0097 a601          	ld	a,#1
 203  0099 cd0000        	call	_TIM2_OC1PreloadConfig
 205                     ; 65 	TIM2_ARRPreloadConfig(ENABLE);
 207  009c a601          	ld	a,#1
 208  009e cd0000        	call	_TIM2_ARRPreloadConfig
 210                     ; 66 	TIM2_Cmd(ENABLE);
 212  00a1 a601          	ld	a,#1
 213  00a3 cd0000        	call	_TIM2_Cmd
 215                     ; 68 	return;
 218  00a6 81            	ret
 242                     ; 74 void LED_test_init(void)
 242                     ; 75 {
 243                     	switch	.text
 244  00a7               _LED_test_init:
 248                     ; 76 	GPIO_Init(L1_PORT, L1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 250  00a7 4be0          	push	#224
 251  00a9 4b04          	push	#4
 252  00ab ae500a        	ldw	x,#20490
 253  00ae cd0000        	call	_GPIO_Init
 255  00b1 85            	popw	x
 256                     ; 77 	GPIO_Init(L2_PORT, L2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 258  00b2 4be0          	push	#224
 259  00b4 4b10          	push	#16
 260  00b6 ae500a        	ldw	x,#20490
 261  00b9 cd0000        	call	_GPIO_Init
 263  00bc 85            	popw	x
 264                     ; 79 }
 267  00bd 81            	ret
 280                     	xdef	_LED_test_init
 281                     	xdef	_tim2_init
 282                     	xdef	_tim1_init
 283                     	xref	_TIM2_OC1PreloadConfig
 284                     	xref	_TIM2_ARRPreloadConfig
 285                     	xref	_TIM2_Cmd
 286                     	xref	_TIM2_OC1Init
 287                     	xref	_TIM2_TimeBaseInit
 288                     	xref	_TIM2_DeInit
 289                     	xref	_TIM1_CtrlPWMOutputs
 290                     	xref	_TIM1_Cmd
 291                     	xref	_TIM1_OC4Init
 292                     	xref	_TIM1_OC3Init
 293                     	xref	_TIM1_OC2Init
 294                     	xref	_TIM1_OC1Init
 295                     	xref	_TIM1_TimeBaseInit
 296                     	xref	_TIM1_DeInit
 297                     	xref	_GPIO_Init
 316                     	end
