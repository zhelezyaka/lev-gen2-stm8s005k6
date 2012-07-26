   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 47 void UART2_DeInit(void)
  43                     ; 48 {
  45                     	switch	.text
  46  0000               _UART2_DeInit:
  50                     ; 51     (void) UART2->SR;
  52  0000 c65240        	ld	a,21056
  53                     ; 52     (void)UART2->DR;
  55  0003 c65241        	ld	a,21057
  56                     ; 54     UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  58  0006 725f5243      	clr	21059
  59                     ; 55     UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  61  000a 725f5242      	clr	21058
  62                     ; 57     UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  64  000e 725f5244      	clr	21060
  65                     ; 58     UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  67  0012 725f5245      	clr	21061
  68                     ; 59     UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  70  0016 725f5246      	clr	21062
  71                     ; 60     UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  73  001a 725f5247      	clr	21063
  74                     ; 61     UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  76  001e 725f5248      	clr	21064
  77                     ; 62     UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  79  0022 725f5249      	clr	21065
  80                     ; 64 }
  83  0026 81            	ret
 394                     .const:	section	.text
 395  0000               L01:
 396  0000 00000064      	dc.l	100
 397                     ; 80 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 397                     ; 81 {
 398                     	switch	.text
 399  0027               _UART2_Init:
 401  0027 520e          	subw	sp,#14
 402       0000000e      OFST:	set	14
 405                     ; 82     uint8_t BRR2_1 = 0, BRR2_2 = 0;
 409                     ; 83     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 413                     ; 86     assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 415                     ; 87     assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 417                     ; 88     assert_param(IS_UART2_STOPBITS_OK(StopBits));
 419                     ; 89     assert_param(IS_UART2_PARITY_OK(Parity));
 421                     ; 90     assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 423                     ; 91     assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 425                     ; 94     UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 427  0029 72195244      	bres	21060,#4
 428                     ; 96     UART2->CR1 |= (uint8_t)WordLength; 
 430  002d c65244        	ld	a,21060
 431  0030 1a15          	or	a,(OFST+7,sp)
 432  0032 c75244        	ld	21060,a
 433                     ; 99     UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 435  0035 c65246        	ld	a,21062
 436  0038 a4cf          	and	a,#207
 437  003a c75246        	ld	21062,a
 438                     ; 101     UART2->CR3 |= (uint8_t)StopBits; 
 440  003d c65246        	ld	a,21062
 441  0040 1a16          	or	a,(OFST+8,sp)
 442  0042 c75246        	ld	21062,a
 443                     ; 104     UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 445  0045 c65244        	ld	a,21060
 446  0048 a4f9          	and	a,#249
 447  004a c75244        	ld	21060,a
 448                     ; 106     UART2->CR1 |= (uint8_t)Parity;
 450  004d c65244        	ld	a,21060
 451  0050 1a17          	or	a,(OFST+9,sp)
 452  0052 c75244        	ld	21060,a
 453                     ; 109     UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 455  0055 725f5242      	clr	21058
 456                     ; 111     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 458  0059 c65243        	ld	a,21059
 459  005c a40f          	and	a,#15
 460  005e c75243        	ld	21059,a
 461                     ; 113     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 463  0061 c65243        	ld	a,21059
 464  0064 a4f0          	and	a,#240
 465  0066 c75243        	ld	21059,a
 466                     ; 116     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 468  0069 96            	ldw	x,sp
 469  006a 1c0011        	addw	x,#OFST+3
 470  006d cd0000        	call	c_ltor
 472  0070 a604          	ld	a,#4
 473  0072 cd0000        	call	c_llsh
 475  0075 96            	ldw	x,sp
 476  0076 1c0001        	addw	x,#OFST-13
 477  0079 cd0000        	call	c_rtol
 479  007c cd0000        	call	_CLK_GetClockFreq
 481  007f 96            	ldw	x,sp
 482  0080 1c0001        	addw	x,#OFST-13
 483  0083 cd0000        	call	c_ludv
 485  0086 96            	ldw	x,sp
 486  0087 1c000b        	addw	x,#OFST-3
 487  008a cd0000        	call	c_rtol
 489                     ; 117     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 491  008d 96            	ldw	x,sp
 492  008e 1c0011        	addw	x,#OFST+3
 493  0091 cd0000        	call	c_ltor
 495  0094 a604          	ld	a,#4
 496  0096 cd0000        	call	c_llsh
 498  0099 96            	ldw	x,sp
 499  009a 1c0001        	addw	x,#OFST-13
 500  009d cd0000        	call	c_rtol
 502  00a0 cd0000        	call	_CLK_GetClockFreq
 504  00a3 a664          	ld	a,#100
 505  00a5 cd0000        	call	c_smul
 507  00a8 96            	ldw	x,sp
 508  00a9 1c0001        	addw	x,#OFST-13
 509  00ac cd0000        	call	c_ludv
 511  00af 96            	ldw	x,sp
 512  00b0 1c0007        	addw	x,#OFST-7
 513  00b3 cd0000        	call	c_rtol
 515                     ; 121     BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 515                     ; 122                         << 4) / 100) & (uint8_t)0x0F); 
 517  00b6 96            	ldw	x,sp
 518  00b7 1c000b        	addw	x,#OFST-3
 519  00ba cd0000        	call	c_ltor
 521  00bd a664          	ld	a,#100
 522  00bf cd0000        	call	c_smul
 524  00c2 96            	ldw	x,sp
 525  00c3 1c0001        	addw	x,#OFST-13
 526  00c6 cd0000        	call	c_rtol
 528  00c9 96            	ldw	x,sp
 529  00ca 1c0007        	addw	x,#OFST-7
 530  00cd cd0000        	call	c_ltor
 532  00d0 96            	ldw	x,sp
 533  00d1 1c0001        	addw	x,#OFST-13
 534  00d4 cd0000        	call	c_lsub
 536  00d7 a604          	ld	a,#4
 537  00d9 cd0000        	call	c_llsh
 539  00dc ae0000        	ldw	x,#L01
 540  00df cd0000        	call	c_ludv
 542  00e2 b603          	ld	a,c_lreg+3
 543  00e4 a40f          	and	a,#15
 544  00e6 6b05          	ld	(OFST-9,sp),a
 545                     ; 123     BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 547  00e8 96            	ldw	x,sp
 548  00e9 1c000b        	addw	x,#OFST-3
 549  00ec cd0000        	call	c_ltor
 551  00ef a604          	ld	a,#4
 552  00f1 cd0000        	call	c_lursh
 554  00f4 b603          	ld	a,c_lreg+3
 555  00f6 a4f0          	and	a,#240
 556  00f8 b703          	ld	c_lreg+3,a
 557  00fa 3f02          	clr	c_lreg+2
 558  00fc 3f01          	clr	c_lreg+1
 559  00fe 3f00          	clr	c_lreg
 560  0100 b603          	ld	a,c_lreg+3
 561  0102 6b06          	ld	(OFST-8,sp),a
 562                     ; 125     UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 564  0104 7b05          	ld	a,(OFST-9,sp)
 565  0106 1a06          	or	a,(OFST-8,sp)
 566  0108 c75243        	ld	21059,a
 567                     ; 127     UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 569  010b 7b0e          	ld	a,(OFST+0,sp)
 570  010d c75242        	ld	21058,a
 571                     ; 130     UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 573  0110 c65245        	ld	a,21061
 574  0113 a4f3          	and	a,#243
 575  0115 c75245        	ld	21061,a
 576                     ; 132     UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 578  0118 c65246        	ld	a,21062
 579  011b a4f8          	and	a,#248
 580  011d c75246        	ld	21062,a
 581                     ; 134     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 581                     ; 135                                               UART2_CR3_CPHA | UART2_CR3_LBCL));
 583  0120 7b18          	ld	a,(OFST+10,sp)
 584  0122 a407          	and	a,#7
 585  0124 ca5246        	or	a,21062
 586  0127 c75246        	ld	21062,a
 587                     ; 137     if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 589  012a 7b19          	ld	a,(OFST+11,sp)
 590  012c a504          	bcp	a,#4
 591  012e 2706          	jreq	L171
 592                     ; 140         UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 594  0130 72165245      	bset	21061,#3
 596  0134 2004          	jra	L371
 597  0136               L171:
 598                     ; 145         UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 600  0136 72175245      	bres	21061,#3
 601  013a               L371:
 602                     ; 147     if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 604  013a 7b19          	ld	a,(OFST+11,sp)
 605  013c a508          	bcp	a,#8
 606  013e 2706          	jreq	L571
 607                     ; 150         UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 609  0140 72145245      	bset	21061,#2
 611  0144 2004          	jra	L771
 612  0146               L571:
 613                     ; 155         UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 615  0146 72155245      	bres	21061,#2
 616  014a               L771:
 617                     ; 159     if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 619  014a 7b18          	ld	a,(OFST+10,sp)
 620  014c a580          	bcp	a,#128
 621  014e 2706          	jreq	L102
 622                     ; 162         UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 624  0150 72175246      	bres	21062,#3
 626  0154 200a          	jra	L302
 627  0156               L102:
 628                     ; 166         UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 630  0156 7b18          	ld	a,(OFST+10,sp)
 631  0158 a408          	and	a,#8
 632  015a ca5246        	or	a,21062
 633  015d c75246        	ld	21062,a
 634  0160               L302:
 635                     ; 168 }
 638  0160 5b0e          	addw	sp,#14
 639  0162 81            	ret
 694                     ; 176 void UART2_Cmd(FunctionalState NewState)
 694                     ; 177 {
 695                     	switch	.text
 696  0163               _UART2_Cmd:
 700                     ; 179     if (NewState != DISABLE)
 702  0163 4d            	tnz	a
 703  0164 2706          	jreq	L332
 704                     ; 182         UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 706  0166 721b5244      	bres	21060,#5
 708  016a 2004          	jra	L532
 709  016c               L332:
 710                     ; 187         UART2->CR1 |= UART2_CR1_UARTD; 
 712  016c 721a5244      	bset	21060,#5
 713  0170               L532:
 714                     ; 189 }
 717  0170 81            	ret
 845                     ; 206 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 845                     ; 207 {
 846                     	switch	.text
 847  0171               _UART2_ITConfig:
 849  0171 89            	pushw	x
 850  0172 89            	pushw	x
 851       00000002      OFST:	set	2
 854                     ; 208     uint8_t uartreg = 0, itpos = 0x00;
 858                     ; 211     assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 860                     ; 212     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 862                     ; 215     uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
 864  0173 9e            	ld	a,xh
 865  0174 6b01          	ld	(OFST-1,sp),a
 866                     ; 218     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
 868  0176 9f            	ld	a,xl
 869  0177 a40f          	and	a,#15
 870  0179 5f            	clrw	x
 871  017a 97            	ld	xl,a
 872  017b a601          	ld	a,#1
 873  017d 5d            	tnzw	x
 874  017e 2704          	jreq	L61
 875  0180               L02:
 876  0180 48            	sll	a
 877  0181 5a            	decw	x
 878  0182 26fc          	jrne	L02
 879  0184               L61:
 880  0184 6b02          	ld	(OFST+0,sp),a
 881                     ; 220     if (NewState != DISABLE)
 883  0186 0d07          	tnz	(OFST+5,sp)
 884  0188 273a          	jreq	L313
 885                     ; 223         if (uartreg == 0x01)
 887  018a 7b01          	ld	a,(OFST-1,sp)
 888  018c a101          	cp	a,#1
 889  018e 260a          	jrne	L513
 890                     ; 225             UART2->CR1 |= itpos;
 892  0190 c65244        	ld	a,21060
 893  0193 1a02          	or	a,(OFST+0,sp)
 894  0195 c75244        	ld	21060,a
 896  0198 2066          	jra	L133
 897  019a               L513:
 898                     ; 227         else if (uartreg == 0x02)
 900  019a 7b01          	ld	a,(OFST-1,sp)
 901  019c a102          	cp	a,#2
 902  019e 260a          	jrne	L123
 903                     ; 229             UART2->CR2 |= itpos;
 905  01a0 c65245        	ld	a,21061
 906  01a3 1a02          	or	a,(OFST+0,sp)
 907  01a5 c75245        	ld	21061,a
 909  01a8 2056          	jra	L133
 910  01aa               L123:
 911                     ; 231         else if (uartreg == 0x03)
 913  01aa 7b01          	ld	a,(OFST-1,sp)
 914  01ac a103          	cp	a,#3
 915  01ae 260a          	jrne	L523
 916                     ; 233             UART2->CR4 |= itpos;
 918  01b0 c65247        	ld	a,21063
 919  01b3 1a02          	or	a,(OFST+0,sp)
 920  01b5 c75247        	ld	21063,a
 922  01b8 2046          	jra	L133
 923  01ba               L523:
 924                     ; 237             UART2->CR6 |= itpos;
 926  01ba c65249        	ld	a,21065
 927  01bd 1a02          	or	a,(OFST+0,sp)
 928  01bf c75249        	ld	21065,a
 929  01c2 203c          	jra	L133
 930  01c4               L313:
 931                     ; 243         if (uartreg == 0x01)
 933  01c4 7b01          	ld	a,(OFST-1,sp)
 934  01c6 a101          	cp	a,#1
 935  01c8 260b          	jrne	L333
 936                     ; 245             UART2->CR1 &= (uint8_t)(~itpos);
 938  01ca 7b02          	ld	a,(OFST+0,sp)
 939  01cc 43            	cpl	a
 940  01cd c45244        	and	a,21060
 941  01d0 c75244        	ld	21060,a
 943  01d3 202b          	jra	L133
 944  01d5               L333:
 945                     ; 247         else if (uartreg == 0x02)
 947  01d5 7b01          	ld	a,(OFST-1,sp)
 948  01d7 a102          	cp	a,#2
 949  01d9 260b          	jrne	L733
 950                     ; 249             UART2->CR2 &= (uint8_t)(~itpos);
 952  01db 7b02          	ld	a,(OFST+0,sp)
 953  01dd 43            	cpl	a
 954  01de c45245        	and	a,21061
 955  01e1 c75245        	ld	21061,a
 957  01e4 201a          	jra	L133
 958  01e6               L733:
 959                     ; 251         else if (uartreg == 0x03)
 961  01e6 7b01          	ld	a,(OFST-1,sp)
 962  01e8 a103          	cp	a,#3
 963  01ea 260b          	jrne	L343
 964                     ; 253             UART2->CR4 &= (uint8_t)(~itpos);
 966  01ec 7b02          	ld	a,(OFST+0,sp)
 967  01ee 43            	cpl	a
 968  01ef c45247        	and	a,21063
 969  01f2 c75247        	ld	21063,a
 971  01f5 2009          	jra	L133
 972  01f7               L343:
 973                     ; 257             UART2->CR6 &= (uint8_t)(~itpos);
 975  01f7 7b02          	ld	a,(OFST+0,sp)
 976  01f9 43            	cpl	a
 977  01fa c45249        	and	a,21065
 978  01fd c75249        	ld	21065,a
 979  0200               L133:
 980                     ; 260 }
 983  0200 5b04          	addw	sp,#4
 984  0202 81            	ret
1041                     ; 267 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1041                     ; 268 {
1042                     	switch	.text
1043  0203               _UART2_IrDAConfig:
1047                     ; 269     assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1049                     ; 271     if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1051  0203 4d            	tnz	a
1052  0204 2706          	jreq	L573
1053                     ; 273         UART2->CR5 |= UART2_CR5_IRLP;
1055  0206 72145248      	bset	21064,#2
1057  020a 2004          	jra	L773
1058  020c               L573:
1059                     ; 277         UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1061  020c 72155248      	bres	21064,#2
1062  0210               L773:
1063                     ; 279 }
1066  0210 81            	ret
1101                     ; 287 void UART2_IrDACmd(FunctionalState NewState)
1101                     ; 288 {
1102                     	switch	.text
1103  0211               _UART2_IrDACmd:
1107                     ; 290     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1109                     ; 292     if (NewState != DISABLE)
1111  0211 4d            	tnz	a
1112  0212 2706          	jreq	L714
1113                     ; 295         UART2->CR5 |= UART2_CR5_IREN;
1115  0214 72125248      	bset	21064,#1
1117  0218 2004          	jra	L124
1118  021a               L714:
1119                     ; 300         UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1121  021a 72135248      	bres	21064,#1
1122  021e               L124:
1123                     ; 302 }
1126  021e 81            	ret
1185                     ; 311 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1185                     ; 312 {
1186                     	switch	.text
1187  021f               _UART2_LINBreakDetectionConfig:
1191                     ; 314     assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1193                     ; 316     if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1195  021f 4d            	tnz	a
1196  0220 2706          	jreq	L154
1197                     ; 318         UART2->CR4 |= UART2_CR4_LBDL;
1199  0222 721a5247      	bset	21063,#5
1201  0226 2004          	jra	L354
1202  0228               L154:
1203                     ; 322         UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1205  0228 721b5247      	bres	21063,#5
1206  022c               L354:
1207                     ; 324 }
1210  022c 81            	ret
1331                     ; 336 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1331                     ; 337                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1331                     ; 338                      UART2_LinDivUp_TypeDef UART2_DivUp)
1331                     ; 339 {
1332                     	switch	.text
1333  022d               _UART2_LINConfig:
1335  022d 89            	pushw	x
1336       00000000      OFST:	set	0
1339                     ; 341     assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1341                     ; 342     assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1343                     ; 343     assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1345                     ; 345     if (UART2_Mode != UART2_LIN_MODE_MASTER)
1347  022e 9e            	ld	a,xh
1348  022f 4d            	tnz	a
1349  0230 2706          	jreq	L335
1350                     ; 347         UART2->CR6 |=  UART2_CR6_LSLV;
1352  0232 721a5249      	bset	21065,#5
1354  0236 2004          	jra	L535
1355  0238               L335:
1356                     ; 351         UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1358  0238 721b5249      	bres	21065,#5
1359  023c               L535:
1360                     ; 354     if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1362  023c 0d02          	tnz	(OFST+2,sp)
1363  023e 2706          	jreq	L735
1364                     ; 356         UART2->CR6 |=  UART2_CR6_LASE ;
1366  0240 72185249      	bset	21065,#4
1368  0244 2004          	jra	L145
1369  0246               L735:
1370                     ; 360         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1372  0246 72195249      	bres	21065,#4
1373  024a               L145:
1374                     ; 363     if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1376  024a 0d05          	tnz	(OFST+5,sp)
1377  024c 2706          	jreq	L345
1378                     ; 365         UART2->CR6 |=  UART2_CR6_LDUM;
1380  024e 721e5249      	bset	21065,#7
1382  0252 2004          	jra	L545
1383  0254               L345:
1384                     ; 369         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1386  0254 721f5249      	bres	21065,#7
1387  0258               L545:
1388                     ; 371 }
1391  0258 85            	popw	x
1392  0259 81            	ret
1427                     ; 379 void UART2_LINCmd(FunctionalState NewState)
1427                     ; 380 {
1428                     	switch	.text
1429  025a               _UART2_LINCmd:
1433                     ; 381     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1435                     ; 383     if (NewState != DISABLE)
1437  025a 4d            	tnz	a
1438  025b 2706          	jreq	L565
1439                     ; 386         UART2->CR3 |= UART2_CR3_LINEN;
1441  025d 721c5246      	bset	21062,#6
1443  0261 2004          	jra	L765
1444  0263               L565:
1445                     ; 391         UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1447  0263 721d5246      	bres	21062,#6
1448  0267               L765:
1449                     ; 393 }
1452  0267 81            	ret
1487                     ; 400 void UART2_SmartCardCmd(FunctionalState NewState)
1487                     ; 401 {
1488                     	switch	.text
1489  0268               _UART2_SmartCardCmd:
1493                     ; 403     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1495                     ; 405     if (NewState != DISABLE)
1497  0268 4d            	tnz	a
1498  0269 2706          	jreq	L706
1499                     ; 408         UART2->CR5 |= UART2_CR5_SCEN;
1501  026b 721a5248      	bset	21064,#5
1503  026f 2004          	jra	L116
1504  0271               L706:
1505                     ; 413         UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1507  0271 721b5248      	bres	21064,#5
1508  0275               L116:
1509                     ; 415 }
1512  0275 81            	ret
1548                     ; 423 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1548                     ; 424 {
1549                     	switch	.text
1550  0276               _UART2_SmartCardNACKCmd:
1554                     ; 426     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1556                     ; 428     if (NewState != DISABLE)
1558  0276 4d            	tnz	a
1559  0277 2706          	jreq	L136
1560                     ; 431         UART2->CR5 |= UART2_CR5_NACK;
1562  0279 72185248      	bset	21064,#4
1564  027d 2004          	jra	L336
1565  027f               L136:
1566                     ; 436         UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1568  027f 72195248      	bres	21064,#4
1569  0283               L336:
1570                     ; 438 }
1573  0283 81            	ret
1630                     ; 446 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1630                     ; 447 {
1631                     	switch	.text
1632  0284               _UART2_WakeUpConfig:
1636                     ; 448     assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1638                     ; 450     UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
1640  0284 72175244      	bres	21060,#3
1641                     ; 451     UART2->CR1 |= (uint8_t)UART2_WakeUp;
1643  0288 ca5244        	or	a,21060
1644  028b c75244        	ld	21060,a
1645                     ; 452 }
1648  028e 81            	ret
1684                     ; 460 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1684                     ; 461 {
1685                     	switch	.text
1686  028f               _UART2_ReceiverWakeUpCmd:
1690                     ; 462     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1692                     ; 464     if (NewState != DISABLE)
1694  028f 4d            	tnz	a
1695  0290 2706          	jreq	L107
1696                     ; 467         UART2->CR2 |= UART2_CR2_RWU;
1698  0292 72125245      	bset	21061,#1
1700  0296 2004          	jra	L307
1701  0298               L107:
1702                     ; 472         UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
1704  0298 72135245      	bres	21061,#1
1705  029c               L307:
1706                     ; 474 }
1709  029c 81            	ret
1732                     ; 481 uint8_t UART2_ReceiveData8(void)
1732                     ; 482 {
1733                     	switch	.text
1734  029d               _UART2_ReceiveData8:
1738                     ; 483     return ((uint8_t)UART2->DR);
1740  029d c65241        	ld	a,21057
1743  02a0 81            	ret
1775                     ; 491 uint16_t UART2_ReceiveData9(void)
1775                     ; 492 {
1776                     	switch	.text
1777  02a1               _UART2_ReceiveData9:
1779  02a1 89            	pushw	x
1780       00000002      OFST:	set	2
1783                     ; 493   uint16_t temp = 0;
1785                     ; 495   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
1787  02a2 c65244        	ld	a,21060
1788  02a5 5f            	clrw	x
1789  02a6 a480          	and	a,#128
1790  02a8 5f            	clrw	x
1791  02a9 02            	rlwa	x,a
1792  02aa 58            	sllw	x
1793  02ab 1f01          	ldw	(OFST-1,sp),x
1794                     ; 497   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
1796  02ad c65241        	ld	a,21057
1797  02b0 5f            	clrw	x
1798  02b1 97            	ld	xl,a
1799  02b2 01            	rrwa	x,a
1800  02b3 1a02          	or	a,(OFST+0,sp)
1801  02b5 01            	rrwa	x,a
1802  02b6 1a01          	or	a,(OFST-1,sp)
1803  02b8 01            	rrwa	x,a
1804  02b9 01            	rrwa	x,a
1805  02ba a4ff          	and	a,#255
1806  02bc 01            	rrwa	x,a
1807  02bd a401          	and	a,#1
1808  02bf 01            	rrwa	x,a
1811  02c0 5b02          	addw	sp,#2
1812  02c2 81            	ret
1844                     ; 505 void UART2_SendData8(uint8_t Data)
1844                     ; 506 {
1845                     	switch	.text
1846  02c3               _UART2_SendData8:
1850                     ; 508     UART2->DR = Data;
1852  02c3 c75241        	ld	21057,a
1853                     ; 509 }
1856  02c6 81            	ret
1888                     ; 516 void UART2_SendData9(uint16_t Data)
1888                     ; 517 {
1889                     	switch	.text
1890  02c7               _UART2_SendData9:
1892  02c7 89            	pushw	x
1893       00000000      OFST:	set	0
1896                     ; 519     UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
1898  02c8 721d5244      	bres	21060,#6
1899                     ; 522     UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
1901  02cc 54            	srlw	x
1902  02cd 54            	srlw	x
1903  02ce 9f            	ld	a,xl
1904  02cf a440          	and	a,#64
1905  02d1 ca5244        	or	a,21060
1906  02d4 c75244        	ld	21060,a
1907                     ; 525     UART2->DR   = (uint8_t)(Data);                    
1909  02d7 7b02          	ld	a,(OFST+2,sp)
1910  02d9 c75241        	ld	21057,a
1911                     ; 527 }
1914  02dc 85            	popw	x
1915  02dd 81            	ret
1938                     ; 534 void UART2_SendBreak(void)
1938                     ; 535 {
1939                     	switch	.text
1940  02de               _UART2_SendBreak:
1944                     ; 536     UART2->CR2 |= UART2_CR2_SBK;
1946  02de 72105245      	bset	21061,#0
1947                     ; 537 }
1950  02e2 81            	ret
1982                     ; 544 void UART2_SetAddress(uint8_t UART2_Address)
1982                     ; 545 {
1983                     	switch	.text
1984  02e3               _UART2_SetAddress:
1986  02e3 88            	push	a
1987       00000000      OFST:	set	0
1990                     ; 547     assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
1992                     ; 550     UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
1994  02e4 c65247        	ld	a,21063
1995  02e7 a4f0          	and	a,#240
1996  02e9 c75247        	ld	21063,a
1997                     ; 552     UART2->CR4 |= UART2_Address;
1999  02ec c65247        	ld	a,21063
2000  02ef 1a01          	or	a,(OFST+1,sp)
2001  02f1 c75247        	ld	21063,a
2002                     ; 553 }
2005  02f4 84            	pop	a
2006  02f5 81            	ret
2038                     ; 561 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2038                     ; 562 {
2039                     	switch	.text
2040  02f6               _UART2_SetGuardTime:
2044                     ; 564     UART2->GTR = UART2_GuardTime;
2046  02f6 c7524a        	ld	21066,a
2047                     ; 565 }
2050  02f9 81            	ret
2082                     ; 589 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2082                     ; 590 {
2083                     	switch	.text
2084  02fa               _UART2_SetPrescaler:
2088                     ; 592     UART2->PSCR = UART2_Prescaler;
2090  02fa c7524b        	ld	21067,a
2091                     ; 593 }
2094  02fd 81            	ret
2251                     ; 601 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2251                     ; 602 {
2252                     	switch	.text
2253  02fe               _UART2_GetFlagStatus:
2255  02fe 89            	pushw	x
2256  02ff 88            	push	a
2257       00000001      OFST:	set	1
2260                     ; 603     FlagStatus status = RESET;
2262                     ; 606     assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2264                     ; 609     if (UART2_FLAG == UART2_FLAG_LBDF)
2266  0300 a30210        	cpw	x,#528
2267  0303 2610          	jrne	L3211
2268                     ; 611         if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2270  0305 9f            	ld	a,xl
2271  0306 c45247        	and	a,21063
2272  0309 2706          	jreq	L5211
2273                     ; 614             status = SET;
2275  030b a601          	ld	a,#1
2276  030d 6b01          	ld	(OFST+0,sp),a
2278  030f 2039          	jra	L1311
2279  0311               L5211:
2280                     ; 619             status = RESET;
2282  0311 0f01          	clr	(OFST+0,sp)
2283  0313 2035          	jra	L1311
2284  0315               L3211:
2285                     ; 622     else if (UART2_FLAG == UART2_FLAG_SBK)
2287  0315 1e02          	ldw	x,(OFST+1,sp)
2288  0317 a30101        	cpw	x,#257
2289  031a 2611          	jrne	L3311
2290                     ; 624         if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2292  031c c65245        	ld	a,21061
2293  031f 1503          	bcp	a,(OFST+2,sp)
2294  0321 2706          	jreq	L5311
2295                     ; 627             status = SET;
2297  0323 a601          	ld	a,#1
2298  0325 6b01          	ld	(OFST+0,sp),a
2300  0327 2021          	jra	L1311
2301  0329               L5311:
2302                     ; 632             status = RESET;
2304  0329 0f01          	clr	(OFST+0,sp)
2305  032b 201d          	jra	L1311
2306  032d               L3311:
2307                     ; 635     else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2309  032d 1e02          	ldw	x,(OFST+1,sp)
2310  032f a30302        	cpw	x,#770
2311  0332 2707          	jreq	L5411
2313  0334 1e02          	ldw	x,(OFST+1,sp)
2314  0336 a30301        	cpw	x,#769
2315  0339 2614          	jrne	L3411
2316  033b               L5411:
2317                     ; 637         if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2319  033b c65249        	ld	a,21065
2320  033e 1503          	bcp	a,(OFST+2,sp)
2321  0340 2706          	jreq	L7411
2322                     ; 640             status = SET;
2324  0342 a601          	ld	a,#1
2325  0344 6b01          	ld	(OFST+0,sp),a
2327  0346 2002          	jra	L1311
2328  0348               L7411:
2329                     ; 645             status = RESET;
2331  0348 0f01          	clr	(OFST+0,sp)
2332  034a               L1311:
2333                     ; 663     return  status;
2335  034a 7b01          	ld	a,(OFST+0,sp)
2338  034c 5b03          	addw	sp,#3
2339  034e 81            	ret
2340  034f               L3411:
2341                     ; 650         if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2343  034f c65240        	ld	a,21056
2344  0352 1503          	bcp	a,(OFST+2,sp)
2345  0354 2706          	jreq	L5511
2346                     ; 653             status = SET;
2348  0356 a601          	ld	a,#1
2349  0358 6b01          	ld	(OFST+0,sp),a
2351  035a 20ee          	jra	L1311
2352  035c               L5511:
2353                     ; 658             status = RESET;
2355  035c 0f01          	clr	(OFST+0,sp)
2356  035e 20ea          	jra	L1311
2391                     ; 693 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2391                     ; 694 {
2392                     	switch	.text
2393  0360               _UART2_ClearFlag:
2395  0360 89            	pushw	x
2396       00000000      OFST:	set	0
2399                     ; 695     assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2401                     ; 698     if (UART2_FLAG == UART2_FLAG_RXNE)
2403  0361 a30020        	cpw	x,#32
2404  0364 2606          	jrne	L7711
2405                     ; 700         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2407  0366 35df5240      	mov	21056,#223
2409  036a 201e          	jra	L1021
2410  036c               L7711:
2411                     ; 703     else if (UART2_FLAG == UART2_FLAG_LBDF)
2413  036c 1e01          	ldw	x,(OFST+1,sp)
2414  036e a30210        	cpw	x,#528
2415  0371 2606          	jrne	L3021
2416                     ; 705         UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2418  0373 72195247      	bres	21063,#4
2420  0377 2011          	jra	L1021
2421  0379               L3021:
2422                     ; 708     else if (UART2_FLAG == UART2_FLAG_LHDF)
2424  0379 1e01          	ldw	x,(OFST+1,sp)
2425  037b a30302        	cpw	x,#770
2426  037e 2606          	jrne	L7021
2427                     ; 710         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2429  0380 72135249      	bres	21065,#1
2431  0384 2004          	jra	L1021
2432  0386               L7021:
2433                     ; 715         UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2435  0386 72115249      	bres	21065,#0
2436  038a               L1021:
2437                     ; 717 }
2440  038a 85            	popw	x
2441  038b 81            	ret
2515                     ; 732 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2515                     ; 733 {
2516                     	switch	.text
2517  038c               _UART2_GetITStatus:
2519  038c 89            	pushw	x
2520  038d 89            	pushw	x
2521       00000002      OFST:	set	2
2524                     ; 734     ITStatus pendingbitstatus = RESET;
2526                     ; 735     uint8_t itpos = 0;
2528                     ; 736     uint8_t itmask1 = 0;
2530                     ; 737     uint8_t itmask2 = 0;
2532                     ; 738     uint8_t enablestatus = 0;
2534                     ; 741     assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2536                     ; 744     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
2538  038e 9f            	ld	a,xl
2539  038f a40f          	and	a,#15
2540  0391 5f            	clrw	x
2541  0392 97            	ld	xl,a
2542  0393 a601          	ld	a,#1
2543  0395 5d            	tnzw	x
2544  0396 2704          	jreq	L27
2545  0398               L47:
2546  0398 48            	sll	a
2547  0399 5a            	decw	x
2548  039a 26fc          	jrne	L47
2549  039c               L27:
2550  039c 6b01          	ld	(OFST-1,sp),a
2551                     ; 746     itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
2553  039e 7b04          	ld	a,(OFST+2,sp)
2554  03a0 4e            	swap	a
2555  03a1 a40f          	and	a,#15
2556  03a3 6b02          	ld	(OFST+0,sp),a
2557                     ; 748     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2559  03a5 7b02          	ld	a,(OFST+0,sp)
2560  03a7 5f            	clrw	x
2561  03a8 97            	ld	xl,a
2562  03a9 a601          	ld	a,#1
2563  03ab 5d            	tnzw	x
2564  03ac 2704          	jreq	L67
2565  03ae               L001:
2566  03ae 48            	sll	a
2567  03af 5a            	decw	x
2568  03b0 26fc          	jrne	L001
2569  03b2               L67:
2570  03b2 6b02          	ld	(OFST+0,sp),a
2571                     ; 751     if (UART2_IT == UART2_IT_PE)
2573  03b4 1e03          	ldw	x,(OFST+1,sp)
2574  03b6 a30100        	cpw	x,#256
2575  03b9 261c          	jrne	L5421
2576                     ; 754         enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
2578  03bb c65244        	ld	a,21060
2579  03be 1402          	and	a,(OFST+0,sp)
2580  03c0 6b02          	ld	(OFST+0,sp),a
2581                     ; 757         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2583  03c2 c65240        	ld	a,21056
2584  03c5 1501          	bcp	a,(OFST-1,sp)
2585  03c7 270a          	jreq	L7421
2587  03c9 0d02          	tnz	(OFST+0,sp)
2588  03cb 2706          	jreq	L7421
2589                     ; 760             pendingbitstatus = SET;
2591  03cd a601          	ld	a,#1
2592  03cf 6b02          	ld	(OFST+0,sp),a
2594  03d1 2064          	jra	L3521
2595  03d3               L7421:
2596                     ; 765             pendingbitstatus = RESET;
2598  03d3 0f02          	clr	(OFST+0,sp)
2599  03d5 2060          	jra	L3521
2600  03d7               L5421:
2601                     ; 768     else if (UART2_IT == UART2_IT_LBDF)
2603  03d7 1e03          	ldw	x,(OFST+1,sp)
2604  03d9 a30346        	cpw	x,#838
2605  03dc 261c          	jrne	L5521
2606                     ; 771         enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
2608  03de c65247        	ld	a,21063
2609  03e1 1402          	and	a,(OFST+0,sp)
2610  03e3 6b02          	ld	(OFST+0,sp),a
2611                     ; 773         if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2613  03e5 c65247        	ld	a,21063
2614  03e8 1501          	bcp	a,(OFST-1,sp)
2615  03ea 270a          	jreq	L7521
2617  03ec 0d02          	tnz	(OFST+0,sp)
2618  03ee 2706          	jreq	L7521
2619                     ; 776             pendingbitstatus = SET;
2621  03f0 a601          	ld	a,#1
2622  03f2 6b02          	ld	(OFST+0,sp),a
2624  03f4 2041          	jra	L3521
2625  03f6               L7521:
2626                     ; 781             pendingbitstatus = RESET;
2628  03f6 0f02          	clr	(OFST+0,sp)
2629  03f8 203d          	jra	L3521
2630  03fa               L5521:
2631                     ; 784     else if (UART2_IT == UART2_IT_LHDF)
2633  03fa 1e03          	ldw	x,(OFST+1,sp)
2634  03fc a30412        	cpw	x,#1042
2635  03ff 261c          	jrne	L5621
2636                     ; 787         enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
2638  0401 c65249        	ld	a,21065
2639  0404 1402          	and	a,(OFST+0,sp)
2640  0406 6b02          	ld	(OFST+0,sp),a
2641                     ; 789         if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2643  0408 c65249        	ld	a,21065
2644  040b 1501          	bcp	a,(OFST-1,sp)
2645  040d 270a          	jreq	L7621
2647  040f 0d02          	tnz	(OFST+0,sp)
2648  0411 2706          	jreq	L7621
2649                     ; 792             pendingbitstatus = SET;
2651  0413 a601          	ld	a,#1
2652  0415 6b02          	ld	(OFST+0,sp),a
2654  0417 201e          	jra	L3521
2655  0419               L7621:
2656                     ; 797             pendingbitstatus = RESET;
2658  0419 0f02          	clr	(OFST+0,sp)
2659  041b 201a          	jra	L3521
2660  041d               L5621:
2661                     ; 803         enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
2663  041d c65245        	ld	a,21061
2664  0420 1402          	and	a,(OFST+0,sp)
2665  0422 6b02          	ld	(OFST+0,sp),a
2666                     ; 805         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2668  0424 c65240        	ld	a,21056
2669  0427 1501          	bcp	a,(OFST-1,sp)
2670  0429 270a          	jreq	L5721
2672  042b 0d02          	tnz	(OFST+0,sp)
2673  042d 2706          	jreq	L5721
2674                     ; 808             pendingbitstatus = SET;
2676  042f a601          	ld	a,#1
2677  0431 6b02          	ld	(OFST+0,sp),a
2679  0433 2002          	jra	L3521
2680  0435               L5721:
2681                     ; 813             pendingbitstatus = RESET;
2683  0435 0f02          	clr	(OFST+0,sp)
2684  0437               L3521:
2685                     ; 817     return  pendingbitstatus;
2687  0437 7b02          	ld	a,(OFST+0,sp)
2690  0439 5b04          	addw	sp,#4
2691  043b 81            	ret
2727                     ; 846 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
2727                     ; 847 {
2728                     	switch	.text
2729  043c               _UART2_ClearITPendingBit:
2731  043c 89            	pushw	x
2732       00000000      OFST:	set	0
2735                     ; 848     assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
2737                     ; 851     if (UART2_IT == UART2_IT_RXNE)
2739  043d a30255        	cpw	x,#597
2740  0440 2606          	jrne	L7131
2741                     ; 853         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2743  0442 35df5240      	mov	21056,#223
2745  0446 2011          	jra	L1231
2746  0448               L7131:
2747                     ; 856     else if (UART2_IT == UART2_IT_LBDF)
2749  0448 1e01          	ldw	x,(OFST+1,sp)
2750  044a a30346        	cpw	x,#838
2751  044d 2606          	jrne	L3231
2752                     ; 858         UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
2754  044f 72195247      	bres	21063,#4
2756  0453 2004          	jra	L1231
2757  0455               L3231:
2758                     ; 863         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2760  0455 72135249      	bres	21065,#1
2761  0459               L1231:
2762                     ; 865 }
2765  0459 85            	popw	x
2766  045a 81            	ret
2779                     	xdef	_UART2_ClearITPendingBit
2780                     	xdef	_UART2_GetITStatus
2781                     	xdef	_UART2_ClearFlag
2782                     	xdef	_UART2_GetFlagStatus
2783                     	xdef	_UART2_SetPrescaler
2784                     	xdef	_UART2_SetGuardTime
2785                     	xdef	_UART2_SetAddress
2786                     	xdef	_UART2_SendBreak
2787                     	xdef	_UART2_SendData9
2788                     	xdef	_UART2_SendData8
2789                     	xdef	_UART2_ReceiveData9
2790                     	xdef	_UART2_ReceiveData8
2791                     	xdef	_UART2_ReceiverWakeUpCmd
2792                     	xdef	_UART2_WakeUpConfig
2793                     	xdef	_UART2_SmartCardNACKCmd
2794                     	xdef	_UART2_SmartCardCmd
2795                     	xdef	_UART2_LINCmd
2796                     	xdef	_UART2_LINConfig
2797                     	xdef	_UART2_LINBreakDetectionConfig
2798                     	xdef	_UART2_IrDACmd
2799                     	xdef	_UART2_IrDAConfig
2800                     	xdef	_UART2_ITConfig
2801                     	xdef	_UART2_Cmd
2802                     	xdef	_UART2_Init
2803                     	xdef	_UART2_DeInit
2804                     	xref	_CLK_GetClockFreq
2805                     	xref.b	c_lreg
2806                     	xref.b	c_x
2825                     	xref	c_lursh
2826                     	xref	c_lsub
2827                     	xref	c_smul
2828                     	xref	c_ludv
2829                     	xref	c_rtol
2830                     	xref	c_llsh
2831                     	xref	c_ltor
2832                     	end
