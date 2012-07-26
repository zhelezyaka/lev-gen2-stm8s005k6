   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  48                     ; 30 void adc_init(void)
  48                     ; 31 {
  50                     	switch	.text
  51  0000               _adc_init:
  55                     ; 33 	GPIO_Init(ID_PORT, ID_PIN, GPIO_MODE_IN_FL_NO_IT);
  57  0000 4b00          	push	#0
  58  0002 4b01          	push	#1
  59  0004 ae5005        	ldw	x,#20485
  60  0007 cd0000        	call	_GPIO_Init
  62  000a 85            	popw	x
  63                     ; 34 	GPIO_Init(IC_PORT, IC_PIN, GPIO_MODE_IN_FL_NO_IT);
  65  000b 4b00          	push	#0
  66  000d 4b02          	push	#2
  67  000f ae5005        	ldw	x,#20485
  68  0012 cd0000        	call	_GPIO_Init
  70  0015 85            	popw	x
  71                     ; 35 	GPIO_Init(VBAT_PORT, VBAT_PIN, GPIO_MODE_IN_FL_NO_IT);
  73  0016 4b00          	push	#0
  74  0018 4b04          	push	#4
  75  001a ae5005        	ldw	x,#20485
  76  001d cd0000        	call	_GPIO_Init
  78  0020 85            	popw	x
  79                     ; 36 	GPIO_Init(TS1_PORT, TS1_PIN, GPIO_MODE_IN_FL_NO_IT);
  81  0021 4b00          	push	#0
  82  0023 4b08          	push	#8
  83  0025 ae5005        	ldw	x,#20485
  84  0028 cd0000        	call	_GPIO_Init
  86  002b 85            	popw	x
  87                     ; 37 	GPIO_Init(TS2_PORT, TS2_PIN, GPIO_MODE_IN_FL_NO_IT);
  89  002c 4b00          	push	#0
  90  002e 4b10          	push	#16
  91  0030 ae5019        	ldw	x,#20505
  92  0033 cd0000        	call	_GPIO_Init
  94  0036 85            	popw	x
  95                     ; 39 	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D18,
  95                     ; 40 			  ADC1_EXTTRIG_GPIO, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3,
  95                     ; 41 			  DISABLE);
  97  0037 4b00          	push	#0
  98  0039 4b03          	push	#3
  99  003b 4b08          	push	#8
 100  003d 4b00          	push	#0
 101  003f 4b10          	push	#16
 102  0041 4b70          	push	#112
 103  0043 ae0003        	ldw	x,#3
 104  0046 a601          	ld	a,#1
 105  0048 95            	ld	xh,a
 106  0049 cd0000        	call	_ADC1_Init
 108  004c 5b06          	addw	sp,#6
 109                     ; 42 	ADC1_ScanModeCmd(ENABLE);
 111  004e a601          	ld	a,#1
 112  0050 cd0000        	call	_ADC1_ScanModeCmd
 114                     ; 56 	ADC1_DataBufferCmd(ENABLE);
 116  0053 a601          	ld	a,#1
 117  0055 cd0000        	call	_ADC1_DataBufferCmd
 119                     ; 57 	ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
 121  0058 4b01          	push	#1
 122  005a ae0020        	ldw	x,#32
 123  005d cd0000        	call	_ADC1_ITConfig
 125  0060 84            	pop	a
 126                     ; 62 }
 129  0061 81            	ret
 155                     ; 74 INTERRUPT void ADC1_IRQHandler(void)
 155                     ; 75 {
 157                     	switch	.text
 158  0062               f_ADC1_IRQHandler:
 160  0062 3b0002        	push	c_x+2
 161  0065 be00          	ldw	x,c_x
 162  0067 89            	pushw	x
 163  0068 3b0002        	push	c_y+2
 164  006b be00          	ldw	x,c_y
 165  006d 89            	pushw	x
 168                     ; 78 	L1_PORT->ODR |= (uint8_t)(L1_PIN);
 170  006e 7214500a      	bset	20490,#2
 171                     ; 81 	G_DSG_ADC = ADC1_GetBufferValue(0);
 173  0072 4f            	clr	a
 174  0073 cd0000        	call	_ADC1_GetBufferValue
 176  0076 cf000c        	ldw	_G_Var_Array+12,x
 177                     ; 82 	G_CHG_ADC = ADC1_GetBufferValue(1);
 179  0079 a601          	ld	a,#1
 180  007b cd0000        	call	_ADC1_GetBufferValue
 182  007e cf000e        	ldw	_G_Var_Array+14,x
 183                     ; 83 	G_VBAT_ADC = ADC1_GetBufferValue(2);
 185  0081 a602          	ld	a,#2
 186  0083 cd0000        	call	_ADC1_GetBufferValue
 188  0086 cf0010        	ldw	_G_Var_Array+16,x
 189                     ; 84 	G_Th1_ADC = ADC1_GetBufferValue(3);
 191  0089 a603          	ld	a,#3
 192  008b cd0000        	call	_ADC1_GetBufferValue
 194  008e cf0012        	ldw	_G_Var_Array+18,x
 195                     ; 88 	ADC1_ClearITPendingBit(ADC1_IT_EOC);  //clear end of conversion flag, for one signal channel
 197  0091 ae0080        	ldw	x,#128
 198  0094 cd0000        	call	_ADC1_ClearITPendingBit
 200                     ; 93 	L1_PORT->ODR &= (uint8_t)(~L1_PIN);
 202  0097 7215500a      	bres	20490,#2
 203                     ; 95 	return;
 206  009b 85            	popw	x
 207  009c bf00          	ldw	c_y,x
 208  009e 320002        	pop	c_y+2
 209  00a1 85            	popw	x
 210  00a2 bf00          	ldw	c_x,x
 211  00a4 320002        	pop	c_x+2
 212  00a7 80            	iret
 237                     	switch	.bss
 238  0000               _ADC_Results:
 239  0000 000000000000  	ds.b	40
 240                     	xdef	_ADC_Results
 241                     	xdef	f_ADC1_IRQHandler
 242                     	xdef	_adc_init
 243                     	xref	_G_Var_Array
 244                     	xref	_GPIO_Init
 245                     	xref	_ADC1_ClearITPendingBit
 246                     	xref	_ADC1_GetBufferValue
 247                     	xref	_ADC1_ITConfig
 248                     	xref	_ADC1_DataBufferCmd
 249                     	xref	_ADC1_ScanModeCmd
 250                     	xref	_ADC1_Init
 251                     	xref.b	c_x
 252                     	xref.b	c_y
 272                     	end
