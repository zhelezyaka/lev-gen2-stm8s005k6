   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  48                     ; 46 main()
  48                     ; 47 {
  50                     	switch	.text
  51  0000               _main:
  55                     ; 56 	G_SysModeStatusCode = FirstInitial_Func(); 
  57  0000 cd0000        	call	_FirstInitial_Func
  59  0003 cf019d        	ldw	_G_Var_Array,x
  60                     ; 64 	delay_cycles(50);	//1ms at 4MHz
  62  0006 ae0032        	ldw	x,#50
  63  0009 89            	pushw	x
  64  000a ae0000        	ldw	x,#0
  65  000d 89            	pushw	x
  66  000e cd0000        	call	_delay_cycles
  68  0011 5b04          	addw	sp,#4
  69  0013               L33:
  70                     ; 70 		switch (G_SysModeStatusCode)
  72  0013 ce019d        	ldw	x,_G_Var_Array
  74                     ; 107 				break;
  75  0016 5a            	decw	x
  76  0017 2710          	jreq	L3
  77  0019 1d0002        	subw	x,#2
  78  001c 2719          	jreq	L14
  79  001e 5a            	decw	x
  80  001f 2716          	jreq	L14
  81  0021 5a            	decw	x
  82  0022 2713          	jreq	L14
  83  0024 5a            	decw	x
  84  0025 270a          	jreq	L31
  85  0027 2008          	jra	L31
  86  0029               L3:
  87                     ; 72 			case StartUp:
  87                     ; 73 				G_SysModeStatusCode = Startup_Func();
  89  0029 cd0000        	call	_Startup_Func
  91  002c cf019d        	ldw	_G_Var_Array,x
  92                     ; 74 				break;
  94  002f 2006          	jra	L14
  95  0031               L31:
  96                     ; 91 			case CalibrationMode:
  96                     ; 92 				//#if _5LEDs_Thick_TYPE_ > 0
  96                     ; 93 				//G_Activate_Action_Status_Other1 |= Blink_TWO_LED;
  96                     ; 94 				//G_SysModeStatusCode = Calibration_Func();
  96                     ; 95 				//G_Activate_Action_Status_Other1 &= ~Blink_TWO_LED;
  96                     ; 96 				//#else
  96                     ; 97 				//setBlinkLED(ALL_LED_PORT, true);;
  96                     ; 98 				//G_SysModeStatusCode = Calibration_Func();
  96                     ; 99 				//setBlinkLED(ALL_LED_PORT, false);;
  96                     ; 100 				//#endif      
  96                     ; 101 				//break;
  96                     ; 102 			//    case ShippingMode:
  96                     ; 103 			//      G_SysModeStatusCode = Shipping_Func();
  96                     ; 104 			//      break;
  96                     ; 105 			default:
  96                     ; 106 				G_SysModeStatusCode = StartUp;
  98  0031 ae0001        	ldw	x,#1
  99  0034 cf019d        	ldw	_G_Var_Array,x
 100                     ; 107 				break;
 102  0037               L14:
 103                     ; 121 		delay_cycles(500);	//10ms at 4MHz
 105  0037 ae01f4        	ldw	x,#500
 106  003a 89            	pushw	x
 107  003b ae0000        	ldw	x,#0
 108  003e 89            	pushw	x
 109  003f cd0000        	call	_delay_cycles
 111  0042 5b04          	addw	sp,#4
 112                     ; 122 		delay_cycles(500);	//10ms at 4MHz
 114  0044 ae01f4        	ldw	x,#500
 115  0047 89            	pushw	x
 116  0048 ae0000        	ldw	x,#0
 117  004b 89            	pushw	x
 118  004c cd0000        	call	_delay_cycles
 120  004f 5b04          	addw	sp,#4
 121                     ; 123 		delay_cycles(500);	//10ms at 4MHz
 123  0051 ae01f4        	ldw	x,#500
 124  0054 89            	pushw	x
 125  0055 ae0000        	ldw	x,#0
 126  0058 89            	pushw	x
 127  0059 cd0000        	call	_delay_cycles
 129  005c 5b04          	addw	sp,#4
 130                     ; 124 		delay_cycles(500);	//10ms at 4MHz
 132  005e ae01f4        	ldw	x,#500
 133  0061 89            	pushw	x
 134  0062 ae0000        	ldw	x,#0
 135  0065 89            	pushw	x
 136  0066 cd0000        	call	_delay_cycles
 138  0069 5b04          	addw	sp,#4
 139                     ; 125 		delay_cycles(500);	//10ms at 4MHz
 141  006b ae01f4        	ldw	x,#500
 142  006e 89            	pushw	x
 143  006f ae0000        	ldw	x,#0
 144  0072 89            	pushw	x
 145  0073 cd0000        	call	_delay_cycles
 147  0076 5b04          	addw	sp,#4
 148                     ; 126 		L2_PORT->ODR |= (uint8_t)(L2_PIN);
 150  0078 7218500a      	bset	20490,#4
 151                     ; 128         ADC1_StartConversion();
 153  007c cd0000        	call	_ADC1_StartConversion
 155                     ; 129 		L2_PORT->ODR &= (uint8_t)(~L2_PIN);
 157  007f 7219500a      	bres	20490,#4
 158                     ; 130 		delay_cycles(500);	//10ms at 4MHz
 160  0083 ae01f4        	ldw	x,#500
 161  0086 89            	pushw	x
 162  0087 ae0000        	ldw	x,#0
 163  008a 89            	pushw	x
 164  008b cd0000        	call	_delay_cycles
 166  008e 5b04          	addw	sp,#4
 168  0090 2081          	jra	L33
 245                     	xdef	_main
 246                     	switch	.bss
 247  0000               _test_f:
 248  0000 00000000      	ds.b	4
 249                     	xdef	_test_f
 250  0004               _test_l:
 251  0004 00000000      	ds.b	4
 252                     	xdef	_test_l
 253  0008               _test_i:
 254  0008 0000          	ds.b	2
 255                     	xdef	_test_i
 256  000a               _test_a:
 257  000a 000000000000  	ds.b	400
 258                     	xdef	_test_a
 259  019a               _c4:
 260  019a 00            	ds.b	1
 261                     	xdef	_c4
 262  019b               _c2:
 263  019b 00            	ds.b	1
 264                     	xdef	_c2
 265  019c               _c1:
 266  019c 00            	ds.b	1
 267                     	xdef	_c1
 268                     	xref	_Startup_Func
 269                     	xref	_FirstInitial_Func
 270                     	xref	_delay_cycles
 271                     	xref	_ADC1_StartConversion
 272  019d               _G_Var_Array:
 273  019d 000000000000  	ds.b	22
 274                     	xdef	_G_Var_Array
 294                     	end
