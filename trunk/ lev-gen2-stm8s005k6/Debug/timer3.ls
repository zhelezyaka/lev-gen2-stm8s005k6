   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  48                     ; 14 void tim3_init(void)
  48                     ; 15 {
  50                     	switch	.text
  51  0000               _tim3_init:
  55                     ; 17 	TIM3_DeInit();
  57  0000 cd0000        	call	_TIM3_DeInit
  59                     ; 18 	TIM3_TimeBaseInit(dTimer3Divided, dTimer3CountValues); // 50ms
  61  0003 ae186a        	ldw	x,#6250
  62  0006 89            	pushw	x
  63  0007 a605          	ld	a,#5
  64  0009 cd0000        	call	_TIM3_TimeBaseInit
  66  000c 85            	popw	x
  67                     ; 19 	TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);
  69  000d ae0001        	ldw	x,#1
  70  0010 a601          	ld	a,#1
  71  0012 95            	ld	xh,a
  72  0013 cd0000        	call	_TIM3_ITConfig
  74                     ; 20 	TIM3_Cmd(ENABLE);
  76  0016 a601          	ld	a,#1
  77  0018 cd0000        	call	_TIM3_Cmd
  79                     ; 22 	startReceiveCount = 0;
  81  001b 725f0004      	clr	_startReceiveCount
  82                     ; 23 }
  85  001f 81            	ret
 124                     ; 30 void delay_cycles(unsigned long cycleCount)
 124                     ; 31 {
 125                     	switch	.text
 126  0020               _delay_cycles:
 128  0020 5204          	subw	sp,#4
 129       00000004      OFST:	set	4
 132                     ; 33 	for(count = 0l; count < cycleCount; count++){
 134  0022 ae0000        	ldw	x,#0
 135  0025 1f03          	ldw	(OFST-1,sp),x
 136  0027 ae0000        	ldw	x,#0
 137  002a 1f01          	ldw	(OFST-3,sp),x
 139  002c 2009          	jra	L34
 140  002e               L73:
 143  002e 96            	ldw	x,sp
 144  002f 1c0001        	addw	x,#OFST-3
 145  0032 a601          	ld	a,#1
 146  0034 cd0000        	call	c_lgadc
 148  0037               L34:
 151  0037 96            	ldw	x,sp
 152  0038 1c0001        	addw	x,#OFST-3
 153  003b cd0000        	call	c_ltor
 155  003e 96            	ldw	x,sp
 156  003f 1c0007        	addw	x,#OFST+3
 157  0042 cd0000        	call	c_lcmp
 159  0045 25e7          	jrult	L73
 160                     ; 35 }
 163  0047 5b04          	addw	sp,#4
 164  0049 81            	ret
 204                     ; 45 INTERRUPT void TIM3_UPD_OVF_BRK_IRQHandler(void)
 204                     ; 46 {
 206                     	switch	.text
 207  004a               f_TIM3_UPD_OVF_BRK_IRQHandler:
 209  004a 3b0002        	push	c_x+2
 210  004d be00          	ldw	x,c_x
 211  004f 89            	pushw	x
 212  0050 3b0002        	push	c_y+2
 213  0053 be00          	ldw	x,c_y
 214  0055 89            	pushw	x
 217                     ; 54 	if(G_Device_Action_Controls & BUTTON_PRESS_TRIGGER){
 219  0056 c60007        	ld	a,_G_Var_Array+7
 220  0059 a501          	bcp	a,#1
 221  005b 274d          	jreq	L75
 222                     ; 55 		gButtonPressCount++;
 224  005d ce0000        	ldw	x,_gButtonPressCount
 225  0060 1c0001        	addw	x,#1
 226  0063 cf0000        	ldw	_gButtonPressCount,x
 227                     ; 56 		if(GPIO_ReadInputPin(BUTTON_PORT, BUTTON_PIN)){
 229  0066 4b20          	push	#32
 230  0068 ae5014        	ldw	x,#20500
 231  006b cd0000        	call	_GPIO_ReadInputPin
 233  006e 5b01          	addw	sp,#1
 234  0070 4d            	tnz	a
 235  0071 2712          	jreq	L16
 236                     ; 57 			if(gButtonPressCount >= BUTTON_LONG_PRESS_COUNT){
 238  0073 ce0000        	ldw	x,_gButtonPressCount
 239  0076 a30064        	cpw	x,#100
 240  0079 252f          	jrult	L75
 241                     ; 58 				G_Device_Action_Controls &= ~BUTTON_PRESS_TRIGGER;
 243  007b 72110007      	bres	_G_Var_Array+7,#0
 244                     ; 59 				G_Device_Action_Controls |= BUTTON_LONG_PRESS;
 246  007f 72140007      	bset	_G_Var_Array+7,#2
 247  0083 2025          	jra	L75
 248  0085               L16:
 249                     ; 62 			G_Device_Action_Controls &= ~BUTTON_PRESS_TRIGGER;
 251  0085 72110007      	bres	_G_Var_Array+7,#0
 252                     ; 63 			if(gButtonPressCount <= BUTTON_CLICK_MAX_COUNT){
 254  0089 ce0000        	ldw	x,_gButtonPressCount
 255  008c a30015        	cpw	x,#21
 256  008f 2415          	jruge	L76
 257                     ; 64 				G_Device_Action_Controls |= BUTTON_CLICK;
 259  0091 72120007      	bset	_G_Var_Array+7,#1
 260                     ; 65 				G_Device_Action_Controls |= START_BUTTON_2_FUN_FLAG;
 262  0095 72160007      	bset	_G_Var_Array+7,#3
 263                     ; 66 				gButtonContinuesClickCount++;
 265  0099 ce0000        	ldw	x,_gButtonContinuesClickCount
 266  009c 1c0001        	addw	x,#1
 267  009f cf0000        	ldw	_gButtonContinuesClickCount,x
 268                     ; 67 				gButtonClick2FunTimeCount = 0;
 270  00a2 5f            	clrw	x
 271  00a3 cf0000        	ldw	_gButtonClick2FunTimeCount,x
 272  00a6               L76:
 273                     ; 69 			gButtonPressCount = 0;
 275  00a6 5f            	clrw	x
 276  00a7 cf0000        	ldw	_gButtonPressCount,x
 277  00aa               L75:
 278                     ; 78 	if(G_Device_Action_Controls & START_BUTTON_2_FUN_FLAG){
 280  00aa c60007        	ld	a,_G_Var_Array+7
 281  00ad a508          	bcp	a,#8
 282  00af 2719          	jreq	L17
 283                     ; 79 		gButtonClick2FunTimeCount++;
 285  00b1 ce0000        	ldw	x,_gButtonClick2FunTimeCount
 286  00b4 1c0001        	addw	x,#1
 287  00b7 cf0000        	ldw	_gButtonClick2FunTimeCount,x
 288                     ; 80 		if(gButtonClick2FunTimeCount >= BUTTON_CLICK_2_FUN_COUNT){
 290  00ba ce0000        	ldw	x,_gButtonClick2FunTimeCount
 291  00bd a30014        	cpw	x,#20
 292  00c0 2508          	jrult	L17
 293                     ; 81 			G_Device_Action_Controls &= ~START_BUTTON_2_FUN_FLAG;
 295  00c2 72170007      	bres	_G_Var_Array+7,#3
 296                     ; 82 			gButtonContinuesClickCount = 0;
 298  00c6 5f            	clrw	x
 299  00c7 cf0000        	ldw	_gButtonContinuesClickCount,x
 300  00ca               L17:
 301                     ; 85 	if( gButtonContinuesClickCount >= BUTTON_2_FUN_CLICK_TIME){
 303  00ca ce0000        	ldw	x,_gButtonContinuesClickCount
 304  00cd a30005        	cpw	x,#5
 305  00d0 250c          	jrult	L57
 306                     ; 86 		G_Device_Action_Controls |= BUTTON_2_FUN_ENABLE;
 308  00d2 72180007      	bset	_G_Var_Array+7,#4
 309                     ; 87 		gButtonContinuesClickCount = 0;
 311  00d6 5f            	clrw	x
 312  00d7 cf0000        	ldw	_gButtonContinuesClickCount,x
 313                     ; 88 		G_Device_Action_Controls &= ~START_BUTTON_2_FUN_FLAG;
 315  00da 72170007      	bres	_G_Var_Array+7,#3
 316  00de               L57:
 317                     ; 94 	if(getPIC_OVP_Status()){
 319  00de cd0000        	call	_getPIC_OVP_Status
 321  00e1 4d            	tnz	a
 322  00e2 2706          	jreq	L77
 323                     ; 95 		G_Activate_Action_Status |= PIC_OVP_STATUS;
 325  00e4 72180009      	bset	_G_Var_Array+9,#4
 327  00e8 2004          	jra	L101
 328  00ea               L77:
 329                     ; 97 		G_Activate_Action_Status &= ~PIC_OVP_STATUS;
 331  00ea 72190009      	bres	_G_Var_Array+9,#4
 332  00ee               L101:
 333                     ; 99 	if(getPIC_UVP_Status()){
 335  00ee cd0000        	call	_getPIC_UVP_Status
 337  00f1 4d            	tnz	a
 338  00f2 2706          	jreq	L301
 339                     ; 100 		G_Activate_Action_Status |= PIC_UVP_STATUS;
 341  00f4 721a0009      	bset	_G_Var_Array+9,#5
 343  00f8 2004          	jra	L501
 344  00fa               L301:
 345                     ; 102 		G_Activate_Action_Status &= ~PIC_UVP_STATUS;
 347  00fa 721b0009      	bres	_G_Var_Array+9,#5
 348  00fe               L501:
 349                     ; 108 	if((G_Device_Action_Controls & URAT_RX_INTERRUPT)&&((G_Device_Action_Controls & URAT_RX_A_FRAM)==0)){
 351  00fe c60007        	ld	a,_G_Var_Array+7
 352  0101 a520          	bcp	a,#32
 353  0103 271e          	jreq	L701
 355  0105 c60007        	ld	a,_G_Var_Array+7
 356  0108 a540          	bcp	a,#64
 357  010a 2617          	jrne	L701
 358                     ; 109 		if(startReceiveCount >= UratDataReceiveFramCount){
 360  010c c60004        	ld	a,_startReceiveCount
 361  010f a102          	cp	a,#2
 362  0111 250c          	jrult	L111
 363                     ; 111 			G_Device_Action_Controls &= ~URAT_RX_INTERRUPT;
 365  0113 721b0007      	bres	_G_Var_Array+7,#5
 366                     ; 112 			G_Device_Action_Controls |= URAT_RX_A_FRAM;
 368  0117 721c0007      	bset	_G_Var_Array+7,#6
 369                     ; 113 			startReceiveCount = 0;
 371  011b 725f0004      	clr	_startReceiveCount
 372  011f               L111:
 373                     ; 116 		startReceiveCount++;
 375  011f 725c0004      	inc	_startReceiveCount
 376  0123               L701:
 377                     ; 119 	if(G_Device_Action_Controls & URAT_RX_A_FRAM){
 379  0123 c60007        	ld	a,_G_Var_Array+7
 380  0126 a540          	bcp	a,#64
 381  0128 273c          	jreq	L311
 382                     ; 120 		UratCRC16 = (unsigned int)(Uart_Buffer_Rx[Uart_Rx_index - 1] << 8) | Uart_Buffer_Rx[Uart_Rx_index - 2];
 384  012a ce0000        	ldw	x,_Uart_Rx_index
 385  012d 5a            	decw	x
 386  012e d60000        	ld	a,(_Uart_Buffer_Rx,x)
 387  0131 5f            	clrw	x
 388  0132 97            	ld	xl,a
 389  0133 90ce0000      	ldw	y,_Uart_Rx_index
 390  0137 905a          	decw	y
 391  0139 905a          	decw	y
 392  013b 90d60000      	ld	a,(_Uart_Buffer_Rx,y)
 393  013f 02            	rlwa	x,a
 394  0140 cf0002        	ldw	_UratCRC16,x
 395                     ; 121 		UratCRC16_compute = usMBCRC16(Uart_Buffer_Rx, Uart_Rx_index - 2);
 397  0143 ce0000        	ldw	x,_Uart_Rx_index
 398  0146 5a            	decw	x
 399  0147 5a            	decw	x
 400  0148 89            	pushw	x
 401  0149 ae0000        	ldw	x,#_Uart_Buffer_Rx
 402  014c cd0000        	call	_usMBCRC16
 404  014f 5b02          	addw	sp,#2
 405  0151 cf0000        	ldw	_UratCRC16_compute,x
 406                     ; 122 		if(UratCRC16_compute == UratCRC16){
 408  0154 ce0000        	ldw	x,_UratCRC16_compute
 409  0157 c30002        	cpw	x,_UratCRC16
 410  015a 2603          	jrne	L511
 411                     ; 125 			ReceivedDataParse();
 413  015c cd0000        	call	_ReceivedDataParse
 415  015f               L511:
 416                     ; 128 		ClearUratRxBuffer();
 418  015f cd0000        	call	_ClearUratRxBuffer
 420                     ; 129 		G_Device_Action_Controls &= ~URAT_RX_A_FRAM;
 422  0162 721d0007      	bres	_G_Var_Array+7,#6
 423  0166               L311:
 424                     ; 135 	TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
 426  0166 a601          	ld	a,#1
 427  0168 cd0000        	call	_TIM3_ClearITPendingBit
 429                     ; 139 	return;
 432  016b 85            	popw	x
 433  016c bf00          	ldw	c_y,x
 434  016e 320002        	pop	c_y+2
 435  0171 85            	popw	x
 436  0172 bf00          	ldw	c_x,x
 437  0174 320002        	pop	c_x+2
 438  0177 80            	iret
 473                     	switch	.bss
 474  0000               _UratCRC16_compute:
 475  0000 0000          	ds.b	2
 476                     	xdef	_UratCRC16_compute
 477  0002               _UratCRC16:
 478  0002 0000          	ds.b	2
 479                     	xdef	_UratCRC16
 480  0004               _startReceiveCount:
 481  0004 00            	ds.b	1
 482                     	xdef	_startReceiveCount
 483                     	xref	_getPIC_UVP_Status
 484                     	xref	_getPIC_OVP_Status
 485                     	xref	_usMBCRC16
 486                     	xref	_ReceivedDataParse
 487                     	xref	_ClearUratRxBuffer
 488                     	xref	_Uart_Rx_index
 489                     	xref	_Uart_Buffer_Rx
 490                     	xref	_gButtonClick2FunTimeCount
 491                     	xref	_gButtonContinuesClickCount
 492                     	xref	_gButtonPressCount
 493                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 494                     	xdef	_delay_cycles
 495                     	xdef	_tim3_init
 496                     	xref	_G_Var_Array
 497                     	xref	_TIM3_ClearITPendingBit
 498                     	xref	_TIM3_ITConfig
 499                     	xref	_TIM3_Cmd
 500                     	xref	_TIM3_TimeBaseInit
 501                     	xref	_TIM3_DeInit
 502                     	xref	_GPIO_ReadInputPin
 503                     	xref.b	c_x
 504                     	xref.b	c_y
 524                     	xref	c_lcmp
 525                     	xref	c_ltor
 526                     	xref	c_lgadc
 527                     	end
