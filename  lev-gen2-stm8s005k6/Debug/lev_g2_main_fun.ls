   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  46                     ; 26 unsigned int FirstInitial_Func(){
  48                     	switch	.text
  49  0000               _FirstInitial_Func:
  53                     ; 28 	clk_setup();
  55  0000 cd0000        	call	_clk_setup
  57                     ; 29 	LED_test_init();
  59  0003 cd0000        	call	_LED_test_init
  61                     ; 39 	delay_cycles(10);	//200us at 4MHz
  63  0006 ae000a        	ldw	x,#10
  64  0009 89            	pushw	x
  65  000a ae0000        	ldw	x,#0
  66  000d 89            	pushw	x
  67  000e cd0000        	call	_delay_cycles
  69  0011 5b04          	addw	sp,#4
  70                     ; 40 	delay_cycles(20);	//400us at 4MHz
  72  0013 ae0014        	ldw	x,#20
  73  0016 89            	pushw	x
  74  0017 ae0000        	ldw	x,#0
  75  001a 89            	pushw	x
  76  001b cd0000        	call	_delay_cycles
  78  001e 5b04          	addw	sp,#4
  79                     ; 41 	delay_cycles(30);	//600us at 4MHz
  81  0020 ae001e        	ldw	x,#30
  82  0023 89            	pushw	x
  83  0024 ae0000        	ldw	x,#0
  84  0027 89            	pushw	x
  85  0028 cd0000        	call	_delay_cycles
  87  002b 5b04          	addw	sp,#4
  88                     ; 42 	delay_cycles(40);	//800us at 4MHz
  90  002d ae0028        	ldw	x,#40
  91  0030 89            	pushw	x
  92  0031 ae0000        	ldw	x,#0
  93  0034 89            	pushw	x
  94  0035 cd0000        	call	_delay_cycles
  96  0038 5b04          	addw	sp,#4
  97                     ; 43 	delay_cycles(50);	//1ms at 4MHz
  99  003a ae0032        	ldw	x,#50
 100  003d 89            	pushw	x
 101  003e ae0000        	ldw	x,#0
 102  0041 89            	pushw	x
 103  0042 cd0000        	call	_delay_cycles
 105  0045 5b04          	addw	sp,#4
 106                     ; 46   return StartUp;
 108  0047 ae0001        	ldw	x,#1
 111  004a 81            	ret
 143                     ; 50 unsigned int Startup_Func()
 143                     ; 51 {
 144                     	switch	.text
 145  004b               _Startup_Func:
 149                     ; 54 	disableInterrupts();  /* disable interrupts */
 152  004b 9b            sim
 154                     ; 60 	G_Module_Status = 0;
 157  004c 5f            	clrw	x
 158  004d cf0002        	ldw	_G_Var_Array+2,x
 159                     ; 61 	G_SystemFailureCode = 0;
 161  0050 5f            	clrw	x
 162  0051 cf0004        	ldw	_G_Var_Array+4,x
 163                     ; 62 	G_Device_Action_Controls = 0;
 165  0054 5f            	clrw	x
 166  0055 cf0006        	ldw	_G_Var_Array+6,x
 167                     ; 63 	G_Activate_Action_Status = 0;
 169  0058 5f            	clrw	x
 170  0059 cf0008        	ldw	_G_Var_Array+8,x
 171                     ; 64 	G_Activate_Action_Status_Other1 = 0;
 173  005c 5f            	clrw	x
 174  005d cf000a        	ldw	_G_Var_Array+10,x
 175                     ; 67 	LED_test_init();
 177  0060 cd0000        	call	_LED_test_init
 179                     ; 69 	tim3_init();
 181  0063 cd0000        	call	_tim3_init
 183                     ; 71 	button_init();
 185  0066 cd0000        	call	_button_init
 187                     ; 72 	uart_init();
 189  0069 cd0000        	call	_uart_init
 191                     ; 73     adc_init();
 193  006c cd0000        	call	_adc_init
 195                     ; 75 	delay_cycles(50);	//1ms at 4MHz
 197  006f ae0032        	ldw	x,#50
 198  0072 89            	pushw	x
 199  0073 ae0000        	ldw	x,#0
 200  0076 89            	pushw	x
 201  0077 cd0000        	call	_delay_cycles
 203  007a 5b04          	addw	sp,#4
 204                     ; 76 	delay_cycles(50);	//1ms at 4MHz
 206  007c ae0032        	ldw	x,#50
 207  007f 89            	pushw	x
 208  0080 ae0000        	ldw	x,#0
 209  0083 89            	pushw	x
 210  0084 cd0000        	call	_delay_cycles
 212  0087 5b04          	addw	sp,#4
 213                     ; 77 	delay_cycles(50);	//1ms at 4MHz
 215  0089 ae0032        	ldw	x,#50
 216  008c 89            	pushw	x
 217  008d ae0000        	ldw	x,#0
 218  0090 89            	pushw	x
 219  0091 cd0000        	call	_delay_cycles
 221  0094 5b04          	addw	sp,#4
 222                     ; 91 	enableInterrupts();  /* enable interrupts */
 225  0096 9a            rim
 227                     ; 109   return NormalMode;
 230  0097 ae0003        	ldw	x,#3
 233  009a 81            	ret
 255                     	xdef	_Startup_Func
 256                     	xdef	_FirstInitial_Func
 257                     	switch	.bss
 258  0000               _values:
 259  0000 0000          	ds.b	2
 260                     	xdef	_values
 261                     	xref	_adc_init
 262                     	xref	_uart_init
 263                     	xref	_button_init
 264                     	xref	_LED_test_init
 265                     	xref	_delay_cycles
 266                     	xref	_tim3_init
 267                     	xref	_clk_setup
 268                     	xref	_G_Var_Array
 288                     	end
