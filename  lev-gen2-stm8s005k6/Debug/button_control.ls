   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  48                     ; 28 void button_init(void)
  48                     ; 29 {
  50                     	switch	.text
  51  0000               _button_init:
  55                     ; 31 	GPIO_Init(BUTTON_PORT, BUTTON_PIN, GPIO_MODE_IN_FL_IT);	
  57  0000 4b20          	push	#32
  58  0002 4b20          	push	#32
  59  0004 ae5014        	ldw	x,#20500
  60  0007 cd0000        	call	_GPIO_Init
  62  000a 85            	popw	x
  63                     ; 33 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOE, EXTI_SENSITIVITY_RISE_ONLY);
  65  000b ae0001        	ldw	x,#1
  66  000e a604          	ld	a,#4
  67  0010 95            	ld	xh,a
  68  0011 cd0000        	call	_EXTI_SetExtIntSensitivity
  70                     ; 35 	gButtonPressCount = 0;
  72  0014 5f            	clrw	x
  73  0015 cf0004        	ldw	_gButtonPressCount,x
  74                     ; 36 	gButtonContinuesClickCount = 0;
  76  0018 5f            	clrw	x
  77  0019 cf0002        	ldw	_gButtonContinuesClickCount,x
  78                     ; 37 	gButtonClick2FunTimeCount = 0;
  80  001c 5f            	clrw	x
  81  001d cf0000        	ldw	_gButtonClick2FunTimeCount,x
  82                     ; 39 }
  85  0020 81            	ret
 109                     ; 42 unsigned char getButtonStatus(){
 110                     	switch	.text
 111  0021               _getButtonStatus:
 115                     ; 43   return (GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN)== 0)? false : true;
 117  0021 4b20          	push	#32
 118  0023 ae5014        	ldw	x,#20500
 119  0026 cd0000        	call	_GPIO_ReadInputPin
 121  0029 5b01          	addw	sp,#1
 122  002b 4d            	tnz	a
 123  002c 2603          	jrne	L01
 124  002e 4f            	clr	a
 125  002f 2002          	jra	L21
 126  0031               L01:
 127  0031 a601          	ld	a,#1
 128  0033               L21:
 131  0033 81            	ret
 159                     ; 55 INTERRUPT void EXTI_PORTE_IRQHandler(void)
 159                     ; 56 {
 161                     	switch	.text
 162  0034               f_EXTI_PORTE_IRQHandler:
 164  0034 3b0002        	push	c_x+2
 165  0037 be00          	ldw	x,c_x
 166  0039 89            	pushw	x
 167  003a 3b0002        	push	c_y+2
 168  003d be00          	ldw	x,c_y
 169  003f 89            	pushw	x
 172                     ; 59 	delay_cycles(5);	//100us at 4MHz
 174  0040 ae0005        	ldw	x,#5
 175  0043 89            	pushw	x
 176  0044 ae0000        	ldw	x,#0
 177  0047 89            	pushw	x
 178  0048 cd0000        	call	_delay_cycles
 180  004b 5b04          	addw	sp,#4
 181                     ; 60 	if (GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN))
 183  004d 4b20          	push	#32
 184  004f ae5014        	ldw	x,#20500
 185  0052 cd0000        	call	_GPIO_ReadInputPin
 187  0055 5b01          	addw	sp,#1
 188  0057 4d            	tnz	a
 189  0058 2708          	jreq	L14
 190                     ; 64 		G_Device_Action_Controls |= BUTTON_PRESS_TRIGGER;
 192  005a 72100007      	bset	_G_Var_Array+7,#0
 193                     ; 65 		gButtonPressCount = 0;
 195  005e 5f            	clrw	x
 196  005f cf0004        	ldw	_gButtonPressCount,x
 197  0062               L14:
 198                     ; 67 	return;
 201  0062 85            	popw	x
 202  0063 bf00          	ldw	c_y,x
 203  0065 320002        	pop	c_y+2
 204  0068 85            	popw	x
 205  0069 bf00          	ldw	c_x,x
 206  006b 320002        	pop	c_x+2
 207  006e 80            	iret
 244                     	xdef	f_EXTI_PORTE_IRQHandler
 245                     	xdef	_getButtonStatus
 246                     	xdef	_button_init
 247                     	switch	.bss
 248  0000               _gButtonClick2FunTimeCount:
 249  0000 0000          	ds.b	2
 250                     	xdef	_gButtonClick2FunTimeCount
 251  0002               _gButtonContinuesClickCount:
 252  0002 0000          	ds.b	2
 253                     	xdef	_gButtonContinuesClickCount
 254  0004               _gButtonPressCount:
 255  0004 0000          	ds.b	2
 256                     	xdef	_gButtonPressCount
 257                     	xref	_delay_cycles
 258                     	xref	_G_Var_Array
 259                     	xref	_GPIO_ReadInputPin
 260                     	xref	_GPIO_Init
 261                     	xref	_EXTI_SetExtIntSensitivity
 262                     	xref.b	c_x
 263                     	xref.b	c_y
 283                     	end
