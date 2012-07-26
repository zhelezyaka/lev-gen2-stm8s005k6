   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  46                     ; 9 void clk_setup(void)
  46                     ; 10 {
  48                     	switch	.text
  49  0000               _clk_setup:
  53                     ; 11 	CLK_HSIPrescalerConfig(dSourceFreqDivided); // fMaster, speed 16MHz / 4 = 4MHz, for peripheral device
  55  0000 a610          	ld	a,#16
  56  0002 cd0000        	call	_CLK_HSIPrescalerConfig
  58                     ; 12 	CLK_SYSCLKConfig(dMCUFreqDivided); // CPU speed, 4MHz / 1 = 4MHz
  60  0005 a680          	ld	a,#128
  61  0007 cd0000        	call	_CLK_SYSCLKConfig
  63                     ; 13 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
  65  000a ae0001        	ldw	x,#1
  66  000d 4f            	clr	a
  67  000e 95            	ld	xh,a
  68  000f cd0000        	call	_CLK_PeripheralClockConfig
  70                     ; 15 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
  72  0012 ae0001        	ldw	x,#1
  73  0015 a613          	ld	a,#19
  74  0017 95            	ld	xh,a
  75  0018 cd0000        	call	_CLK_PeripheralClockConfig
  77                     ; 17 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
  79  001b ae0001        	ldw	x,#1
  80  001e a607          	ld	a,#7
  81  0020 95            	ld	xh,a
  82  0021 cd0000        	call	_CLK_PeripheralClockConfig
  84                     ; 19 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
  86  0024 ae0001        	ldw	x,#1
  87  0027 a605          	ld	a,#5
  88  0029 95            	ld	xh,a
  89  002a cd0000        	call	_CLK_PeripheralClockConfig
  91                     ; 21 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
  93  002d ae0001        	ldw	x,#1
  94  0030 a604          	ld	a,#4
  95  0032 95            	ld	xh,a
  96  0033 cd0000        	call	_CLK_PeripheralClockConfig
  98                     ; 23 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, ENABLE);
 100  0036 ae0001        	ldw	x,#1
 101  0039 a603          	ld	a,#3
 102  003b 95            	ld	xh,a
 103  003c cd0000        	call	_CLK_PeripheralClockConfig
 105                     ; 25 }
 108  003f 81            	ret
 121                     	xdef	_clk_setup
 122                     	xref	_CLK_SYSCLKConfig
 123                     	xref	_CLK_HSIPrescalerConfig
 124                     	xref	_CLK_PeripheralClockConfig
 143                     	end
