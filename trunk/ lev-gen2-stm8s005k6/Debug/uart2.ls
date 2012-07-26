   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  47                     ; 23 void uart_init(void)
  47                     ; 24 {
  49                     	switch	.text
  50  0000               _uart_init:
  54                     ; 25 	UART2_DeInit();
  56  0000 cd0000        	call	_UART2_DeInit
  58                     ; 26 	UART2_Init(UratBaudRates, UART2_WORDLENGTH_8D, UART2_STOPBITS_1, UART2_PARITY_NO, UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TXRX_ENABLE);
  60  0003 4b0c          	push	#12
  61  0005 4b80          	push	#128
  62  0007 4b00          	push	#0
  63  0009 4b00          	push	#0
  64  000b 4b00          	push	#0
  65  000d aee100        	ldw	x,#57600
  66  0010 89            	pushw	x
  67  0011 ae0000        	ldw	x,#0
  68  0014 89            	pushw	x
  69  0015 cd0000        	call	_UART2_Init
  71  0018 5b09          	addw	sp,#9
  72                     ; 28 	Uart_Rx_index = 0;
  74  001a 5f            	clrw	x
  75  001b cf0036        	ldw	_Uart_Rx_index,x
  76                     ; 29 	SendingWhileTimeOutCount = 0;
  78  001e 5f            	clrw	x
  79  001f cf0000        	ldw	_SendingWhileTimeOutCount,x
  80                     ; 33 }
  83  0022 81            	ret
 118                     ; 34 void Uart_RX_Interrupt(unsigned char enable){
 119                     	switch	.text
 120  0023               _Uart_RX_Interrupt:
 122  0023 88            	push	a
 123       00000000      OFST:	set	0
 126                     ; 35   ClearUratRxBuffer();
 128  0024 ad0e          	call	_ClearUratRxBuffer
 130                     ; 36   ClearUratTxBuffer();
 132  0026 ad2a          	call	_ClearUratTxBuffer
 134                     ; 37   UART2_ITConfig(UART2_IT_RXNE, enable);
 136  0028 7b01          	ld	a,(OFST+1,sp)
 137  002a 88            	push	a
 138  002b ae0255        	ldw	x,#597
 139  002e cd0000        	call	_UART2_ITConfig
 141  0031 84            	pop	a
 142                     ; 38 }
 145  0032 84            	pop	a
 146  0033 81            	ret
 180                     ; 39 void ClearUratRxBuffer(){
 181                     	switch	.text
 182  0034               _ClearUratRxBuffer:
 184  0034 89            	pushw	x
 185       00000002      OFST:	set	2
 188                     ; 41 	for(i = 0; i < UratRXBufferSize; i++){
 190  0035 5f            	clrw	x
 191  0036 1f01          	ldw	(OFST-1,sp),x
 192  0038               L15:
 193                     ; 42 		Uart_Buffer_Rx[i] = 0;
 195  0038 1e01          	ldw	x,(OFST-1,sp)
 196  003a 724f0038      	clr	(_Uart_Buffer_Rx,x)
 197                     ; 41 	for(i = 0; i < UratRXBufferSize; i++){
 199  003e 1e01          	ldw	x,(OFST-1,sp)
 200  0040 1c0001        	addw	x,#1
 201  0043 1f01          	ldw	(OFST-1,sp),x
 204  0045 1e01          	ldw	x,(OFST-1,sp)
 205  0047 a3000a        	cpw	x,#10
 206  004a 25ec          	jrult	L15
 207                     ; 44 	Uart_Rx_index = 0;
 209  004c 5f            	clrw	x
 210  004d cf0036        	ldw	_Uart_Rx_index,x
 211                     ; 45 }
 214  0050 85            	popw	x
 215  0051 81            	ret
 249                     ; 46 void ClearUratTxBuffer(){
 250                     	switch	.text
 251  0052               _ClearUratTxBuffer:
 253  0052 89            	pushw	x
 254       00000002      OFST:	set	2
 257                     ; 48 	for(i = 0; i < UratTXBufferSize; i++){
 259  0053 5f            	clrw	x
 260  0054 1f01          	ldw	(OFST-1,sp),x
 261  0056               L37:
 262                     ; 49 		Uart_Buffer_Tx[i] = 0;
 264  0056 1e01          	ldw	x,(OFST-1,sp)
 265  0058 724f0004      	clr	(_Uart_Buffer_Tx,x)
 266                     ; 48 	for(i = 0; i < UratTXBufferSize; i++){
 268  005c 1e01          	ldw	x,(OFST-1,sp)
 269  005e 1c0001        	addw	x,#1
 270  0061 1f01          	ldw	(OFST-1,sp),x
 273  0063 1e01          	ldw	x,(OFST-1,sp)
 274  0065 a30032        	cpw	x,#50
 275  0068 25ec          	jrult	L37
 276                     ; 51 	Uart_Tx_Length = 0;
 278  006a 5f            	clrw	x
 279  006b cf0002        	ldw	_Uart_Tx_Length,x
 280                     ; 52 }
 283  006e 85            	popw	x
 284  006f 81            	ret
 329                     ; 56 void ReceivedDataParse(){
 330                     	switch	.text
 331  0070               _ReceivedDataParse:
 333  0070 5204          	subw	sp,#4
 334       00000004      OFST:	set	4
 337                     ; 58 	length = Uart_Rx_index - 2;
 339  0072 ce0036        	ldw	x,_Uart_Rx_index
 340  0075 5a            	decw	x
 341  0076 5a            	decw	x
 342                     ; 60 	switch(Uart_Buffer_Rx[0]){
 344  0077 c60038        	ld	a,_Uart_Buffer_Rx
 345  007a a190          	cp	a,#144
 346  007c 2618          	jrne	L301
 349  007e               L101:
 350                     ; 61 		case 0x90:
 350                     ; 62 			Uart_Buffer_Tx[0] = 0x00;
 352  007e 725f0004      	clr	_Uart_Buffer_Tx
 353                     ; 63 			Uart_Buffer_Tx[1] = 0x11;
 355  0082 35110005      	mov	_Uart_Buffer_Tx+1,#17
 356                     ; 64 			Uart_Buffer_Tx[2] = 0x22;
 358  0086 35220006      	mov	_Uart_Buffer_Tx+2,#34
 359                     ; 65 			Uart_Buffer_Tx[3] = 0x33;
 361  008a 35330007      	mov	_Uart_Buffer_Tx+3,#51
 362                     ; 66 			Uart_Tx_Length = 4;
 364  008e ae0004        	ldw	x,#4
 365  0091 cf0002        	ldw	_Uart_Tx_Length,x
 366                     ; 67 			break;
 368  0094 200a          	jra	L521
 369  0096               L301:
 370                     ; 68 		default:
 370                     ; 69 			Uart_Buffer_Tx[0] = 0x80;
 372  0096 35800004      	mov	_Uart_Buffer_Tx,#128
 373                     ; 70 			Uart_Tx_Length = 1;
 375  009a ae0001        	ldw	x,#1
 376  009d cf0002        	ldw	_Uart_Tx_Length,x
 377                     ; 71 			break;
 378  00a0               L521:
 379                     ; 75 	crc = usMBCRC16(Uart_Buffer_Tx, Uart_Tx_Length);
 381  00a0 ce0002        	ldw	x,_Uart_Tx_Length
 382  00a3 89            	pushw	x
 383  00a4 ae0004        	ldw	x,#_Uart_Buffer_Tx
 384  00a7 cd0000        	call	_usMBCRC16
 386  00aa 5b02          	addw	sp,#2
 387  00ac 1f03          	ldw	(OFST-1,sp),x
 388                     ; 76 	Uart_Buffer_Tx[Uart_Tx_Length] = crc;
 390  00ae 7b04          	ld	a,(OFST+0,sp)
 391  00b0 ce0002        	ldw	x,_Uart_Tx_Length
 392  00b3 d70004        	ld	(_Uart_Buffer_Tx,x),a
 393                     ; 77 	Uart_Buffer_Tx[Uart_Tx_Length + 1] = crc >> 8;
 395  00b6 7b03          	ld	a,(OFST-1,sp)
 396  00b8 ce0002        	ldw	x,_Uart_Tx_Length
 397  00bb d70005        	ld	(_Uart_Buffer_Tx+1,x),a
 398                     ; 78 	Uart_Tx_Length += 2;
 400  00be ce0002        	ldw	x,_Uart_Tx_Length
 401  00c1 1c0002        	addw	x,#2
 402  00c4 cf0002        	ldw	_Uart_Tx_Length,x
 403                     ; 81 	SendingParseData();
 405  00c7 ad03          	call	_SendingParseData
 407                     ; 82 }
 410  00c9 5b04          	addw	sp,#4
 411  00cb 81            	ret
 449                     ; 84 void SendingParseData(){
 450                     	switch	.text
 451  00cc               _SendingParseData:
 453  00cc 89            	pushw	x
 454       00000002      OFST:	set	2
 457                     ; 86 	for(i = 0; i < Uart_Tx_Length; i++){
 459  00cd 5f            	clrw	x
 460  00ce 1f01          	ldw	(OFST-1,sp),x
 462  00d0 2033          	jra	L151
 463  00d2               L541:
 464                     ; 87 		UART2_SendData8(Uart_Buffer_Tx[i]);
 466  00d2 1e01          	ldw	x,(OFST-1,sp)
 467  00d4 d60004        	ld	a,(_Uart_Buffer_Tx,x)
 468  00d7 cd0000        	call	_UART2_SendData8
 470                     ; 88 		SendingWhileTimeOutCount = 0;
 472  00da 5f            	clrw	x
 473  00db cf0000        	ldw	_SendingWhileTimeOutCount,x
 475  00de 201a          	jra	L161
 476  00e0               L551:
 477                     ; 90 			if(SendingWhileTimeOutCount >= SendingWhileTimeOutCycle){
 479  00e0 ce0000        	ldw	x,_SendingWhileTimeOutCount
 480  00e3 a303e8        	cpw	x,#1000
 481  00e6 2509          	jrult	L561
 482                     ; 91 				break;
 483  00e8               L361:
 484                     ; 86 	for(i = 0; i < Uart_Tx_Length; i++){
 486  00e8 1e01          	ldw	x,(OFST-1,sp)
 487  00ea 1c0001        	addw	x,#1
 488  00ed 1f01          	ldw	(OFST-1,sp),x
 489  00ef 2014          	jra	L151
 490  00f1               L561:
 491                     ; 93 			SendingWhileTimeOutCount++;
 493  00f1 ce0000        	ldw	x,_SendingWhileTimeOutCount
 494  00f4 1c0001        	addw	x,#1
 495  00f7 cf0000        	ldw	_SendingWhileTimeOutCount,x
 496  00fa               L161:
 497                     ; 89 		while (UART2_GetFlagStatus(UART2_FLAG_TXE) == RESET){
 499  00fa ae0080        	ldw	x,#128
 500  00fd cd0000        	call	_UART2_GetFlagStatus
 502  0100 4d            	tnz	a
 503  0101 27dd          	jreq	L551
 504  0103 20e3          	jra	L361
 505  0105               L151:
 506                     ; 86 	for(i = 0; i < Uart_Tx_Length; i++){
 508  0105 1e01          	ldw	x,(OFST-1,sp)
 509  0107 c30002        	cpw	x,_Uart_Tx_Length
 510  010a 25c6          	jrult	L541
 511                     ; 96 	ClearUratTxBuffer();
 513  010c cd0052        	call	_ClearUratTxBuffer
 515                     ; 97 }
 518  010f 85            	popw	x
 519  0110 81            	ret
 548                     ; 106 INTERRUPT void URAT2_RX_IRQHandler(void)
 548                     ; 107 {
 550                     	switch	.text
 551  0111               f_URAT2_RX_IRQHandler:
 553  0111 3b0002        	push	c_x+2
 554  0114 be00          	ldw	x,c_x
 555  0116 89            	pushw	x
 556  0117 3b0002        	push	c_y+2
 557  011a be00          	ldw	x,c_y
 558  011c 89            	pushw	x
 561                     ; 112 	if((G_Device_Action_Controls & URAT_RX_A_FRAM)==0){
 563  011d c60007        	ld	a,_G_Var_Array+7
 564  0120 a540          	bcp	a,#64
 565  0122 2624          	jrne	L771
 566                     ; 113 		G_Device_Action_Controls |= URAT_RX_INTERRUPT;
 568  0124 721a0007      	bset	_G_Var_Array+7,#5
 570                     ; 120 	Uart_Buffer_Rx[Uart_Rx_index] = UART2_ReceiveData8();
 572  0128 cd0000        	call	_UART2_ReceiveData8
 574  012b ce0036        	ldw	x,_Uart_Rx_index
 575  012e d70038        	ld	(_Uart_Buffer_Rx,x),a
 576                     ; 121 	Uart_Rx_index++;
 578  0131 ce0036        	ldw	x,_Uart_Rx_index
 579  0134 1c0001        	addw	x,#1
 580  0137 cf0036        	ldw	_Uart_Rx_index,x
 581                     ; 122 	if(Uart_Rx_index >= UratRXBufferSize){
 583  013a ce0036        	ldw	x,_Uart_Rx_index
 584  013d a3000a        	cpw	x,#10
 585  0140 2508          	jrult	L302
 586                     ; 123 		Uart_Rx_index = 0;
 588  0142 5f            	clrw	x
 589  0143 cf0036        	ldw	_Uart_Rx_index,x
 590  0146 2002          	jra	L302
 591  0148               L771:
 592                     ; 117 		return;
 594  0148 2006          	jra	L22
 595  014a               L302:
 596                     ; 128 	UART2_ClearITPendingBit(UART2_IT_RXNE);
 598  014a ae0255        	ldw	x,#597
 599  014d cd0000        	call	_UART2_ClearITPendingBit
 601                     ; 132 	return;
 602  0150               L22:
 605  0150 85            	popw	x
 606  0151 bf00          	ldw	c_y,x
 607  0153 320002        	pop	c_y+2
 608  0156 85            	popw	x
 609  0157 bf00          	ldw	c_x,x
 610  0159 320002        	pop	c_x+2
 611  015c 80            	iret
 667                     	switch	.bss
 668  0000               _SendingWhileTimeOutCount:
 669  0000 0000          	ds.b	2
 670                     	xdef	_SendingWhileTimeOutCount
 671                     	xref	_usMBCRC16
 672                     	xdef	f_URAT2_RX_IRQHandler
 673                     	xdef	_SendingParseData
 674                     	xdef	_ReceivedDataParse
 675                     	xdef	_ClearUratTxBuffer
 676                     	xdef	_ClearUratRxBuffer
 677                     	xdef	_Uart_RX_Interrupt
 678                     	xdef	_uart_init
 679  0002               _Uart_Tx_Length:
 680  0002 0000          	ds.b	2
 681                     	xdef	_Uart_Tx_Length
 682  0004               _Uart_Buffer_Tx:
 683  0004 000000000000  	ds.b	50
 684                     	xdef	_Uart_Buffer_Tx
 685  0036               _Uart_Rx_index:
 686  0036 0000          	ds.b	2
 687                     	xdef	_Uart_Rx_index
 688  0038               _Uart_Buffer_Rx:
 689  0038 000000000000  	ds.b	10
 690                     	xdef	_Uart_Buffer_Rx
 691                     	xref	_G_Var_Array
 692                     	xref	_UART2_ClearITPendingBit
 693                     	xref	_UART2_GetFlagStatus
 694                     	xref	_UART2_SendData8
 695                     	xref	_UART2_ReceiveData8
 696                     	xref	_UART2_ITConfig
 697                     	xref	_UART2_Init
 698                     	xref	_UART2_DeInit
 699                     	xref.b	c_x
 700                     	xref.b	c_y
 720                     	end
