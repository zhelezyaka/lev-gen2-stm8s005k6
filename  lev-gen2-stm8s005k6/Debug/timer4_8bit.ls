   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  47                     ; 10 void tim4_init(void)
  47                     ; 11 {
  49                     	switch	.text
  50  0000               _tim4_init:
  54                     ; 13 	TIM4_DeInit();
  56  0000 cd0000        	call	_TIM4_DeInit
  58                     ; 14 	TIM4_TimeBaseInit(dTimer4Divided, dTimer4CountValues); // 5ms
  60  0003 ae00fa        	ldw	x,#250
  61  0006 a606          	ld	a,#6
  62  0008 95            	ld	xh,a
  63  0009 cd0000        	call	_TIM4_TimeBaseInit
  65                     ; 15 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  67  000c ae0001        	ldw	x,#1
  68  000f a601          	ld	a,#1
  69  0011 95            	ld	xh,a
  70  0012 cd0000        	call	_TIM4_ITConfig
  72                     ; 16 	TIM4_Cmd(ENABLE);
  74  0015 a601          	ld	a,#1
  75  0017 cd0000        	call	_TIM4_Cmd
  77                     ; 17 }
  80  001a 81            	ret
 112                     ; 19 void delay_ms(unsigned int msCount)
 112                     ; 20 {
 113                     	switch	.text
 114  001b               _delay_ms:
 118                     ; 22 }
 121  001b 81            	ret
 149                     ; 33 INTERRUPT void TIM4_UPD_OVF_IRQHandler(void)
 149                     ; 34 {
 151                     	switch	.text
 152  001c               f_TIM4_UPD_OVF_IRQHandler:
 154  001c 3b0002        	push	c_x+2
 155  001f be00          	ldw	x,c_x
 156  0021 89            	pushw	x
 157  0022 3b0002        	push	c_y+2
 158  0025 be00          	ldw	x,c_y
 159  0027 89            	pushw	x
 162                     ; 39 	if(G_Device_Action_Controls & BUTTON_PRESS_TRIGGER){
 164  0028 c60007        	ld	a,_G_Var_Array+7
 165  002b a501          	bcp	a,#1
 166  002d 2732          	jreq	L54
 167                     ; 40 		gButtonPressCount++;
 169  002f ce0000        	ldw	x,_gButtonPressCount
 170  0032 1c0001        	addw	x,#1
 171  0035 cf0000        	ldw	_gButtonPressCount,x
 172                     ; 41 		if(GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN) == SET){
 174  0038 4b20          	push	#32
 175  003a ae5014        	ldw	x,#20500
 176  003d cd0000        	call	_GPIO_ReadInputPin
 178  0040 5b01          	addw	sp,#1
 179  0042 a101          	cp	a,#1
 180                     ; 46 		if(GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN) == RESET ){
 182  0044 4b20          	push	#32
 183  0046 ae5014        	ldw	x,#20500
 184  0049 cd0000        	call	_GPIO_ReadInputPin
 186  004c 5b01          	addw	sp,#1
 187  004e 4d            	tnz	a
 188  004f 2610          	jrne	L54
 189                     ; 47 			if(gButtonPressCount <= BUTTON_CLICK_MAX_DURATION_MS){
 191  0051 ce0000        	ldw	x,_gButtonPressCount
 192  0054 a303e9        	cpw	x,#1001
 193  0057 2408          	jruge	L54
 194                     ; 48 				G_Device_Action_Controls &= ~BUTTON_PRESS_TRIGGER;
 196  0059 72110007      	bres	_G_Var_Array+7,#0
 197                     ; 49 				G_Device_Action_Controls |= BUTTON_CLICK;
 199  005d 72120007      	bset	_G_Var_Array+7,#1
 200  0061               L54:
 201                     ; 58 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 203  0061 a601          	ld	a,#1
 204  0063 cd0000        	call	_TIM4_ClearITPendingBit
 206                     ; 62 	return;
 209  0066 85            	popw	x
 210  0067 bf00          	ldw	c_y,x
 211  0069 320002        	pop	c_y+2
 212  006c 85            	popw	x
 213  006d bf00          	ldw	c_x,x
 214  006f 320002        	pop	c_x+2
 215  0072 80            	iret
 227                     	xref	_gButtonPressCount
 228                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 229                     	xdef	_delay_ms
 230                     	xdef	_tim4_init
 231                     	xref	_G_Var_Array
 232                     	xref	_TIM4_ClearITPendingBit
 233                     	xref	_TIM4_ITConfig
 234                     	xref	_TIM4_Cmd
 235                     	xref	_TIM4_TimeBaseInit
 236                     	xref	_TIM4_DeInit
 237                     	xref	_GPIO_ReadInputPin
 238                     	xref.b	c_x
 239                     	xref.b	c_y
 258                     	end
