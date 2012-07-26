   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     .const:	section	.text
  16  0000               _HSIDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  21  0004               _CLKPrescTable:
  22  0004 01            	dc.b	1
  23  0005 02            	dc.b	2
  24  0006 04            	dc.b	4
  25  0007 08            	dc.b	8
  26  0008 0a            	dc.b	10
  27  0009 10            	dc.b	16
  28  000a 14            	dc.b	20
  29  000b 28            	dc.b	40
  58                     ; 66 void CLK_DeInit(void)
  58                     ; 67 {
  60                     	switch	.text
  61  0000               _CLK_DeInit:
  65                     ; 69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  67  0000 350150c0      	mov	20672,#1
  68                     ; 70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  70  0004 725f50c1      	clr	20673
  71                     ; 71     CLK->SWR  = CLK_SWR_RESET_VALUE;
  73  0008 35e150c4      	mov	20676,#225
  74                     ; 72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  76  000c 725f50c5      	clr	20677
  77                     ; 73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  79  0010 351850c6      	mov	20678,#24
  80                     ; 74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  82  0014 35ff50c7      	mov	20679,#255
  83                     ; 75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  85  0018 35ff50ca      	mov	20682,#255
  86                     ; 76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  88  001c 725f50c8      	clr	20680
  89                     ; 77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  91  0020 725f50c9      	clr	20681
  93  0024               L52:
  94                     ; 78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  96  0024 c650c9        	ld	a,20681
  97  0027 a501          	bcp	a,#1
  98  0029 26f9          	jrne	L52
  99                     ; 80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
 101  002b 725f50c9      	clr	20681
 102                     ; 81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 104  002f 725f50cc      	clr	20684
 105                     ; 82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 107  0033 725f50cd      	clr	20685
 108                     ; 84 }
 111  0037 81            	ret
 167                     ; 95 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 167                     ; 96 {
 168                     	switch	.text
 169  0038               _CLK_FastHaltWakeUpCmd:
 173                     ; 99     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 175                     ; 101     if (NewState != DISABLE)
 177  0038 4d            	tnz	a
 178  0039 2706          	jreq	L75
 179                     ; 104         CLK->ICKR |= CLK_ICKR_FHWU;
 181  003b 721450c0      	bset	20672,#2
 183  003f 2004          	jra	L16
 184  0041               L75:
 185                     ; 109         CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 187  0041 721550c0      	bres	20672,#2
 188  0045               L16:
 189                     ; 112 }
 192  0045 81            	ret
 227                     ; 119 void CLK_HSECmd(FunctionalState NewState)
 227                     ; 120 {
 228                     	switch	.text
 229  0046               _CLK_HSECmd:
 233                     ; 123     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 235                     ; 125     if (NewState != DISABLE)
 237  0046 4d            	tnz	a
 238  0047 2706          	jreq	L101
 239                     ; 128         CLK->ECKR |= CLK_ECKR_HSEEN;
 241  0049 721050c1      	bset	20673,#0
 243  004d 2004          	jra	L301
 244  004f               L101:
 245                     ; 133         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 247  004f 721150c1      	bres	20673,#0
 248  0053               L301:
 249                     ; 136 }
 252  0053 81            	ret
 287                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 287                     ; 144 {
 288                     	switch	.text
 289  0054               _CLK_HSICmd:
 293                     ; 147     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 295                     ; 149     if (NewState != DISABLE)
 297  0054 4d            	tnz	a
 298  0055 2706          	jreq	L321
 299                     ; 152         CLK->ICKR |= CLK_ICKR_HSIEN;
 301  0057 721050c0      	bset	20672,#0
 303  005b 2004          	jra	L521
 304  005d               L321:
 305                     ; 157         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 307  005d 721150c0      	bres	20672,#0
 308  0061               L521:
 309                     ; 160 }
 312  0061 81            	ret
 347                     ; 167 void CLK_LSICmd(FunctionalState NewState)
 347                     ; 168 {
 348                     	switch	.text
 349  0062               _CLK_LSICmd:
 353                     ; 171     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 355                     ; 173     if (NewState != DISABLE)
 357  0062 4d            	tnz	a
 358  0063 2706          	jreq	L541
 359                     ; 176         CLK->ICKR |= CLK_ICKR_LSIEN;
 361  0065 721650c0      	bset	20672,#3
 363  0069 2004          	jra	L741
 364  006b               L541:
 365                     ; 181         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 367  006b 721750c0      	bres	20672,#3
 368  006f               L741:
 369                     ; 184 }
 372  006f 81            	ret
 407                     ; 192 void CLK_CCOCmd(FunctionalState NewState)
 407                     ; 193 {
 408                     	switch	.text
 409  0070               _CLK_CCOCmd:
 413                     ; 196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 415                     ; 198     if (NewState != DISABLE)
 417  0070 4d            	tnz	a
 418  0071 2706          	jreq	L761
 419                     ; 201         CLK->CCOR |= CLK_CCOR_CCOEN;
 421  0073 721050c9      	bset	20681,#0
 423  0077 2004          	jra	L171
 424  0079               L761:
 425                     ; 206         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 427  0079 721150c9      	bres	20681,#0
 428  007d               L171:
 429                     ; 209 }
 432  007d 81            	ret
 467                     ; 218 void CLK_ClockSwitchCmd(FunctionalState NewState)
 467                     ; 219 {
 468                     	switch	.text
 469  007e               _CLK_ClockSwitchCmd:
 473                     ; 222     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 475                     ; 224     if (NewState != DISABLE )
 477  007e 4d            	tnz	a
 478  007f 2706          	jreq	L112
 479                     ; 227         CLK->SWCR |= CLK_SWCR_SWEN;
 481  0081 721250c5      	bset	20677,#1
 483  0085 2004          	jra	L312
 484  0087               L112:
 485                     ; 232         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 487  0087 721350c5      	bres	20677,#1
 488  008b               L312:
 489                     ; 235 }
 492  008b 81            	ret
 528                     ; 245 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 528                     ; 246 {
 529                     	switch	.text
 530  008c               _CLK_SlowActiveHaltWakeUpCmd:
 534                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 536                     ; 251     if (NewState != DISABLE)
 538  008c 4d            	tnz	a
 539  008d 2706          	jreq	L332
 540                     ; 254         CLK->ICKR |= CLK_ICKR_SWUAH;
 542  008f 721a50c0      	bset	20672,#5
 544  0093 2004          	jra	L532
 545  0095               L332:
 546                     ; 259         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 548  0095 721b50c0      	bres	20672,#5
 549  0099               L532:
 550                     ; 262 }
 553  0099 81            	ret
 712                     ; 272 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 712                     ; 273 {
 713                     	switch	.text
 714  009a               _CLK_PeripheralClockConfig:
 716  009a 89            	pushw	x
 717       00000000      OFST:	set	0
 720                     ; 276     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 722                     ; 277     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 724                     ; 279     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 726  009b 9e            	ld	a,xh
 727  009c a510          	bcp	a,#16
 728  009e 2633          	jrne	L123
 729                     ; 281         if (NewState != DISABLE)
 731  00a0 0d02          	tnz	(OFST+2,sp)
 732  00a2 2717          	jreq	L323
 733                     ; 284             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 735  00a4 7b01          	ld	a,(OFST+1,sp)
 736  00a6 a40f          	and	a,#15
 737  00a8 5f            	clrw	x
 738  00a9 97            	ld	xl,a
 739  00aa a601          	ld	a,#1
 740  00ac 5d            	tnzw	x
 741  00ad 2704          	jreq	L62
 742  00af               L03:
 743  00af 48            	sll	a
 744  00b0 5a            	decw	x
 745  00b1 26fc          	jrne	L03
 746  00b3               L62:
 747  00b3 ca50c7        	or	a,20679
 748  00b6 c750c7        	ld	20679,a
 750  00b9 2049          	jra	L723
 751  00bb               L323:
 752                     ; 289             CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 754  00bb 7b01          	ld	a,(OFST+1,sp)
 755  00bd a40f          	and	a,#15
 756  00bf 5f            	clrw	x
 757  00c0 97            	ld	xl,a
 758  00c1 a601          	ld	a,#1
 759  00c3 5d            	tnzw	x
 760  00c4 2704          	jreq	L23
 761  00c6               L43:
 762  00c6 48            	sll	a
 763  00c7 5a            	decw	x
 764  00c8 26fc          	jrne	L43
 765  00ca               L23:
 766  00ca 43            	cpl	a
 767  00cb c450c7        	and	a,20679
 768  00ce c750c7        	ld	20679,a
 769  00d1 2031          	jra	L723
 770  00d3               L123:
 771                     ; 294         if (NewState != DISABLE)
 773  00d3 0d02          	tnz	(OFST+2,sp)
 774  00d5 2717          	jreq	L133
 775                     ; 297             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 777  00d7 7b01          	ld	a,(OFST+1,sp)
 778  00d9 a40f          	and	a,#15
 779  00db 5f            	clrw	x
 780  00dc 97            	ld	xl,a
 781  00dd a601          	ld	a,#1
 782  00df 5d            	tnzw	x
 783  00e0 2704          	jreq	L63
 784  00e2               L04:
 785  00e2 48            	sll	a
 786  00e3 5a            	decw	x
 787  00e4 26fc          	jrne	L04
 788  00e6               L63:
 789  00e6 ca50ca        	or	a,20682
 790  00e9 c750ca        	ld	20682,a
 792  00ec 2016          	jra	L723
 793  00ee               L133:
 794                     ; 302             CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 796  00ee 7b01          	ld	a,(OFST+1,sp)
 797  00f0 a40f          	and	a,#15
 798  00f2 5f            	clrw	x
 799  00f3 97            	ld	xl,a
 800  00f4 a601          	ld	a,#1
 801  00f6 5d            	tnzw	x
 802  00f7 2704          	jreq	L24
 803  00f9               L44:
 804  00f9 48            	sll	a
 805  00fa 5a            	decw	x
 806  00fb 26fc          	jrne	L44
 807  00fd               L24:
 808  00fd 43            	cpl	a
 809  00fe c450ca        	and	a,20682
 810  0101 c750ca        	ld	20682,a
 811  0104               L723:
 812                     ; 306 }
 815  0104 85            	popw	x
 816  0105 81            	ret
1002                     ; 319 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1002                     ; 320 {
1003                     	switch	.text
1004  0106               _CLK_ClockSwitchConfig:
1006  0106 89            	pushw	x
1007  0107 5204          	subw	sp,#4
1008       00000004      OFST:	set	4
1011                     ; 323     uint16_t DownCounter = CLK_TIMEOUT;
1013  0109 ae0491        	ldw	x,#1169
1014  010c 1f03          	ldw	(OFST-1,sp),x
1015                     ; 324     ErrorStatus Swif = ERROR;
1017                     ; 327     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1019                     ; 328     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1021                     ; 329     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1023                     ; 330     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1025                     ; 333     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1027  010e c650c3        	ld	a,20675
1028  0111 6b01          	ld	(OFST-3,sp),a
1029                     ; 336     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1031  0113 7b05          	ld	a,(OFST+1,sp)
1032  0115 a101          	cp	a,#1
1033  0117 2639          	jrne	L344
1034                     ; 340         CLK->SWCR |= CLK_SWCR_SWEN;
1036  0119 721250c5      	bset	20677,#1
1037                     ; 343         if (ITState != DISABLE)
1039  011d 0d09          	tnz	(OFST+5,sp)
1040  011f 2706          	jreq	L544
1041                     ; 345             CLK->SWCR |= CLK_SWCR_SWIEN;
1043  0121 721450c5      	bset	20677,#2
1045  0125 2004          	jra	L744
1046  0127               L544:
1047                     ; 349             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1049  0127 721550c5      	bres	20677,#2
1050  012b               L744:
1051                     ; 353         CLK->SWR = (uint8_t)CLK_NewClock;
1053  012b 7b06          	ld	a,(OFST+2,sp)
1054  012d c750c4        	ld	20676,a
1056  0130 2007          	jra	L554
1057  0132               L154:
1058                     ; 357             DownCounter--;
1060  0132 1e03          	ldw	x,(OFST-1,sp)
1061  0134 1d0001        	subw	x,#1
1062  0137 1f03          	ldw	(OFST-1,sp),x
1063  0139               L554:
1064                     ; 355         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1066  0139 c650c5        	ld	a,20677
1067  013c a501          	bcp	a,#1
1068  013e 2704          	jreq	L164
1070  0140 1e03          	ldw	x,(OFST-1,sp)
1071  0142 26ee          	jrne	L154
1072  0144               L164:
1073                     ; 360         if (DownCounter != 0)
1075  0144 1e03          	ldw	x,(OFST-1,sp)
1076  0146 2706          	jreq	L364
1077                     ; 362             Swif = SUCCESS;
1079  0148 a601          	ld	a,#1
1080  014a 6b02          	ld	(OFST-2,sp),a
1082  014c 201b          	jra	L764
1083  014e               L364:
1084                     ; 366             Swif = ERROR;
1086  014e 0f02          	clr	(OFST-2,sp)
1087  0150 2017          	jra	L764
1088  0152               L344:
1089                     ; 374         if (ITState != DISABLE)
1091  0152 0d09          	tnz	(OFST+5,sp)
1092  0154 2706          	jreq	L174
1093                     ; 376             CLK->SWCR |= CLK_SWCR_SWIEN;
1095  0156 721450c5      	bset	20677,#2
1097  015a 2004          	jra	L374
1098  015c               L174:
1099                     ; 380             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1101  015c 721550c5      	bres	20677,#2
1102  0160               L374:
1103                     ; 384         CLK->SWR = (uint8_t)CLK_NewClock;
1105  0160 7b06          	ld	a,(OFST+2,sp)
1106  0162 c750c4        	ld	20676,a
1107                     ; 388         Swif = SUCCESS;
1109  0165 a601          	ld	a,#1
1110  0167 6b02          	ld	(OFST-2,sp),a
1111  0169               L764:
1112                     ; 393     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1114  0169 0d0a          	tnz	(OFST+6,sp)
1115  016b 260c          	jrne	L574
1117  016d 7b01          	ld	a,(OFST-3,sp)
1118  016f a1e1          	cp	a,#225
1119  0171 2606          	jrne	L574
1120                     ; 395         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1122  0173 721150c0      	bres	20672,#0
1124  0177 201e          	jra	L774
1125  0179               L574:
1126                     ; 397     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1128  0179 0d0a          	tnz	(OFST+6,sp)
1129  017b 260c          	jrne	L105
1131  017d 7b01          	ld	a,(OFST-3,sp)
1132  017f a1d2          	cp	a,#210
1133  0181 2606          	jrne	L105
1134                     ; 399         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1136  0183 721750c0      	bres	20672,#3
1138  0187 200e          	jra	L774
1139  0189               L105:
1140                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1142  0189 0d0a          	tnz	(OFST+6,sp)
1143  018b 260a          	jrne	L774
1145  018d 7b01          	ld	a,(OFST-3,sp)
1146  018f a1b4          	cp	a,#180
1147  0191 2604          	jrne	L774
1148                     ; 403         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1150  0193 721150c1      	bres	20673,#0
1151  0197               L774:
1152                     ; 406     return(Swif);
1154  0197 7b02          	ld	a,(OFST-2,sp)
1157  0199 5b06          	addw	sp,#6
1158  019b 81            	ret
1296                     ; 416 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1296                     ; 417 {
1297                     	switch	.text
1298  019c               _CLK_HSIPrescalerConfig:
1300  019c 88            	push	a
1301       00000000      OFST:	set	0
1304                     ; 420     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1306                     ; 423     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1308  019d c650c6        	ld	a,20678
1309  01a0 a4e7          	and	a,#231
1310  01a2 c750c6        	ld	20678,a
1311                     ; 426     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1313  01a5 c650c6        	ld	a,20678
1314  01a8 1a01          	or	a,(OFST+1,sp)
1315  01aa c750c6        	ld	20678,a
1316                     ; 428 }
1319  01ad 84            	pop	a
1320  01ae 81            	ret
1455                     ; 439 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1455                     ; 440 {
1456                     	switch	.text
1457  01af               _CLK_CCOConfig:
1459  01af 88            	push	a
1460       00000000      OFST:	set	0
1463                     ; 443     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1465                     ; 446     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1467  01b0 c650c9        	ld	a,20681
1468  01b3 a4e1          	and	a,#225
1469  01b5 c750c9        	ld	20681,a
1470                     ; 449     CLK->CCOR |= (uint8_t)CLK_CCO;
1472  01b8 c650c9        	ld	a,20681
1473  01bb 1a01          	or	a,(OFST+1,sp)
1474  01bd c750c9        	ld	20681,a
1475                     ; 452     CLK->CCOR |= CLK_CCOR_CCOEN;
1477  01c0 721050c9      	bset	20681,#0
1478                     ; 454 }
1481  01c4 84            	pop	a
1482  01c5 81            	ret
1547                     ; 464 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1547                     ; 465 {
1548                     	switch	.text
1549  01c6               _CLK_ITConfig:
1551  01c6 89            	pushw	x
1552       00000000      OFST:	set	0
1555                     ; 468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1557                     ; 469     assert_param(IS_CLK_IT_OK(CLK_IT));
1559                     ; 471     if (NewState != DISABLE)
1561  01c7 9f            	ld	a,xl
1562  01c8 4d            	tnz	a
1563  01c9 2719          	jreq	L307
1564                     ; 473         switch (CLK_IT)
1566  01cb 9e            	ld	a,xh
1568                     ; 481         default:
1568                     ; 482             break;
1569  01cc a00c          	sub	a,#12
1570  01ce 270a          	jreq	L736
1571  01d0 a010          	sub	a,#16
1572  01d2 2624          	jrne	L117
1573                     ; 475         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1573                     ; 476             CLK->SWCR |= CLK_SWCR_SWIEN;
1575  01d4 721450c5      	bset	20677,#2
1576                     ; 477             break;
1578  01d8 201e          	jra	L117
1579  01da               L736:
1580                     ; 478         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1580                     ; 479             CLK->CSSR |= CLK_CSSR_CSSDIE;
1582  01da 721450c8      	bset	20680,#2
1583                     ; 480             break;
1585  01de 2018          	jra	L117
1586  01e0               L146:
1587                     ; 481         default:
1587                     ; 482             break;
1589  01e0 2016          	jra	L117
1590  01e2               L707:
1592  01e2 2014          	jra	L117
1593  01e4               L307:
1594                     ; 487         switch (CLK_IT)
1596  01e4 7b01          	ld	a,(OFST+1,sp)
1598                     ; 495         default:
1598                     ; 496             break;
1599  01e6 a00c          	sub	a,#12
1600  01e8 270a          	jreq	L546
1601  01ea a010          	sub	a,#16
1602  01ec 260a          	jrne	L117
1603                     ; 489         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1603                     ; 490             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1605  01ee 721550c5      	bres	20677,#2
1606                     ; 491             break;
1608  01f2 2004          	jra	L117
1609  01f4               L546:
1610                     ; 492         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1610                     ; 493             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1612  01f4 721550c8      	bres	20680,#2
1613                     ; 494             break;
1614  01f8               L117:
1615                     ; 500 }
1618  01f8 85            	popw	x
1619  01f9 81            	ret
1620  01fa               L746:
1621                     ; 495         default:
1621                     ; 496             break;
1623  01fa 20fc          	jra	L117
1624  01fc               L517:
1625  01fc 20fa          	jra	L117
1660                     ; 507 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1660                     ; 508 {
1661                     	switch	.text
1662  01fe               _CLK_SYSCLKConfig:
1664  01fe 88            	push	a
1665       00000000      OFST:	set	0
1668                     ; 511     assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1670                     ; 513     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1672  01ff a580          	bcp	a,#128
1673  0201 2614          	jrne	L537
1674                     ; 515         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1676  0203 c650c6        	ld	a,20678
1677  0206 a4e7          	and	a,#231
1678  0208 c750c6        	ld	20678,a
1679                     ; 516         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1681  020b 7b01          	ld	a,(OFST+1,sp)
1682  020d a418          	and	a,#24
1683  020f ca50c6        	or	a,20678
1684  0212 c750c6        	ld	20678,a
1686  0215 2012          	jra	L737
1687  0217               L537:
1688                     ; 520         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1690  0217 c650c6        	ld	a,20678
1691  021a a4f8          	and	a,#248
1692  021c c750c6        	ld	20678,a
1693                     ; 521         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1695  021f 7b01          	ld	a,(OFST+1,sp)
1696  0221 a407          	and	a,#7
1697  0223 ca50c6        	or	a,20678
1698  0226 c750c6        	ld	20678,a
1699  0229               L737:
1700                     ; 524 }
1703  0229 84            	pop	a
1704  022a 81            	ret
1760                     ; 531 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1760                     ; 532 {
1761                     	switch	.text
1762  022b               _CLK_SWIMConfig:
1766                     ; 535     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1768                     ; 537     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1770  022b 4d            	tnz	a
1771  022c 2706          	jreq	L767
1772                     ; 540         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1774  022e 721050cd      	bset	20685,#0
1776  0232 2004          	jra	L177
1777  0234               L767:
1778                     ; 545         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1780  0234 721150cd      	bres	20685,#0
1781  0238               L177:
1782                     ; 548 }
1785  0238 81            	ret
1809                     ; 557 void CLK_ClockSecuritySystemEnable(void)
1809                     ; 558 {
1810                     	switch	.text
1811  0239               _CLK_ClockSecuritySystemEnable:
1815                     ; 560     CLK->CSSR |= CLK_CSSR_CSSEN;
1817  0239 721050c8      	bset	20680,#0
1818                     ; 561 }
1821  023d 81            	ret
1846                     ; 569 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1846                     ; 570 {
1847                     	switch	.text
1848  023e               _CLK_GetSYSCLKSource:
1852                     ; 571     return((CLK_Source_TypeDef)CLK->CMSR);
1854  023e c650c3        	ld	a,20675
1857  0241 81            	ret
1914                     ; 579 uint32_t CLK_GetClockFreq(void)
1914                     ; 580 {
1915                     	switch	.text
1916  0242               _CLK_GetClockFreq:
1918  0242 5209          	subw	sp,#9
1919       00000009      OFST:	set	9
1922                     ; 582     uint32_t clockfrequency = 0;
1924                     ; 583     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1926                     ; 584     uint8_t tmp = 0, presc = 0;
1930                     ; 587     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1932  0244 c650c3        	ld	a,20675
1933  0247 6b09          	ld	(OFST+0,sp),a
1934                     ; 589     if (clocksource == CLK_SOURCE_HSI)
1936  0249 7b09          	ld	a,(OFST+0,sp)
1937  024b a1e1          	cp	a,#225
1938  024d 2641          	jrne	L7301
1939                     ; 591         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1941  024f c650c6        	ld	a,20678
1942  0252 a418          	and	a,#24
1943  0254 6b09          	ld	(OFST+0,sp),a
1944                     ; 592         tmp = (uint8_t)(tmp >> 3);
1946  0256 0409          	srl	(OFST+0,sp)
1947  0258 0409          	srl	(OFST+0,sp)
1948  025a 0409          	srl	(OFST+0,sp)
1949                     ; 593         presc = HSIDivFactor[tmp];
1951  025c 7b09          	ld	a,(OFST+0,sp)
1952  025e 5f            	clrw	x
1953  025f 97            	ld	xl,a
1954  0260 d60000        	ld	a,(_HSIDivFactor,x)
1955  0263 6b09          	ld	(OFST+0,sp),a
1956                     ; 594         clockfrequency = HSI_VALUE / presc;
1958  0265 7b09          	ld	a,(OFST+0,sp)
1959  0267 b703          	ld	c_lreg+3,a
1960  0269 3f02          	clr	c_lreg+2
1961  026b 3f01          	clr	c_lreg+1
1962  026d 3f00          	clr	c_lreg
1963  026f 96            	ldw	x,sp
1964  0270 1c0001        	addw	x,#OFST-8
1965  0273 cd0000        	call	c_rtol
1967  0276 ae2400        	ldw	x,#9216
1968  0279 bf02          	ldw	c_lreg+2,x
1969  027b ae00f4        	ldw	x,#244
1970  027e bf00          	ldw	c_lreg,x
1971  0280 96            	ldw	x,sp
1972  0281 1c0001        	addw	x,#OFST-8
1973  0284 cd0000        	call	c_ludv
1975  0287 96            	ldw	x,sp
1976  0288 1c0005        	addw	x,#OFST-4
1977  028b cd0000        	call	c_rtol
1980  028e 201c          	jra	L1401
1981  0290               L7301:
1982                     ; 596     else if ( clocksource == CLK_SOURCE_LSI)
1984  0290 7b09          	ld	a,(OFST+0,sp)
1985  0292 a1d2          	cp	a,#210
1986  0294 260c          	jrne	L3401
1987                     ; 598         clockfrequency = LSI_VALUE;
1989  0296 aef400        	ldw	x,#62464
1990  0299 1f07          	ldw	(OFST-2,sp),x
1991  029b ae0001        	ldw	x,#1
1992  029e 1f05          	ldw	(OFST-4,sp),x
1994  02a0 200a          	jra	L1401
1995  02a2               L3401:
1996                     ; 602         clockfrequency = HSE_VALUE;
1998  02a2 ae2400        	ldw	x,#9216
1999  02a5 1f07          	ldw	(OFST-2,sp),x
2000  02a7 ae00f4        	ldw	x,#244
2001  02aa 1f05          	ldw	(OFST-4,sp),x
2002  02ac               L1401:
2003                     ; 605     return((uint32_t)clockfrequency);
2005  02ac 96            	ldw	x,sp
2006  02ad 1c0005        	addw	x,#OFST-4
2007  02b0 cd0000        	call	c_ltor
2011  02b3 5b09          	addw	sp,#9
2012  02b5 81            	ret
2111                     ; 616 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2111                     ; 617 {
2112                     	switch	.text
2113  02b6               _CLK_AdjustHSICalibrationValue:
2115  02b6 88            	push	a
2116       00000000      OFST:	set	0
2119                     ; 620     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2121                     ; 623     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2123  02b7 c650cc        	ld	a,20684
2124  02ba a4f8          	and	a,#248
2125  02bc 1a01          	or	a,(OFST+1,sp)
2126  02be c750cc        	ld	20684,a
2127                     ; 625 }
2130  02c1 84            	pop	a
2131  02c2 81            	ret
2155                     ; 636 void CLK_SYSCLKEmergencyClear(void)
2155                     ; 637 {
2156                     	switch	.text
2157  02c3               _CLK_SYSCLKEmergencyClear:
2161                     ; 638     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2163  02c3 721150c5      	bres	20677,#0
2164                     ; 639 }
2167  02c7 81            	ret
2316                     ; 648 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2316                     ; 649 {
2317                     	switch	.text
2318  02c8               _CLK_GetFlagStatus:
2320  02c8 89            	pushw	x
2321  02c9 5203          	subw	sp,#3
2322       00000003      OFST:	set	3
2325                     ; 651     uint16_t statusreg = 0;
2327                     ; 652     uint8_t tmpreg = 0;
2329                     ; 653     FlagStatus bitstatus = RESET;
2331                     ; 656     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2333                     ; 659     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2335  02cb 01            	rrwa	x,a
2336  02cc 9f            	ld	a,xl
2337  02cd a4ff          	and	a,#255
2338  02cf 97            	ld	xl,a
2339  02d0 4f            	clr	a
2340  02d1 02            	rlwa	x,a
2341  02d2 1f01          	ldw	(OFST-2,sp),x
2342  02d4 01            	rrwa	x,a
2343                     ; 662     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2345  02d5 1e01          	ldw	x,(OFST-2,sp)
2346  02d7 a30100        	cpw	x,#256
2347  02da 2607          	jrne	L5021
2348                     ; 664         tmpreg = CLK->ICKR;
2350  02dc c650c0        	ld	a,20672
2351  02df 6b03          	ld	(OFST+0,sp),a
2353  02e1 202f          	jra	L7021
2354  02e3               L5021:
2355                     ; 666     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2357  02e3 1e01          	ldw	x,(OFST-2,sp)
2358  02e5 a30200        	cpw	x,#512
2359  02e8 2607          	jrne	L1121
2360                     ; 668         tmpreg = CLK->ECKR;
2362  02ea c650c1        	ld	a,20673
2363  02ed 6b03          	ld	(OFST+0,sp),a
2365  02ef 2021          	jra	L7021
2366  02f1               L1121:
2367                     ; 670     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2369  02f1 1e01          	ldw	x,(OFST-2,sp)
2370  02f3 a30300        	cpw	x,#768
2371  02f6 2607          	jrne	L5121
2372                     ; 672         tmpreg = CLK->SWCR;
2374  02f8 c650c5        	ld	a,20677
2375  02fb 6b03          	ld	(OFST+0,sp),a
2377  02fd 2013          	jra	L7021
2378  02ff               L5121:
2379                     ; 674     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2381  02ff 1e01          	ldw	x,(OFST-2,sp)
2382  0301 a30400        	cpw	x,#1024
2383  0304 2607          	jrne	L1221
2384                     ; 676         tmpreg = CLK->CSSR;
2386  0306 c650c8        	ld	a,20680
2387  0309 6b03          	ld	(OFST+0,sp),a
2389  030b 2005          	jra	L7021
2390  030d               L1221:
2391                     ; 680         tmpreg = CLK->CCOR;
2393  030d c650c9        	ld	a,20681
2394  0310 6b03          	ld	(OFST+0,sp),a
2395  0312               L7021:
2396                     ; 683     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2398  0312 7b05          	ld	a,(OFST+2,sp)
2399  0314 1503          	bcp	a,(OFST+0,sp)
2400  0316 2706          	jreq	L5221
2401                     ; 685         bitstatus = SET;
2403  0318 a601          	ld	a,#1
2404  031a 6b03          	ld	(OFST+0,sp),a
2406  031c 2002          	jra	L7221
2407  031e               L5221:
2408                     ; 689         bitstatus = RESET;
2410  031e 0f03          	clr	(OFST+0,sp)
2411  0320               L7221:
2412                     ; 693     return((FlagStatus)bitstatus);
2414  0320 7b03          	ld	a,(OFST+0,sp)
2417  0322 5b05          	addw	sp,#5
2418  0324 81            	ret
2464                     ; 703 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2464                     ; 704 {
2465                     	switch	.text
2466  0325               _CLK_GetITStatus:
2468  0325 88            	push	a
2469  0326 88            	push	a
2470       00000001      OFST:	set	1
2473                     ; 706     ITStatus bitstatus = RESET;
2475                     ; 709     assert_param(IS_CLK_IT_OK(CLK_IT));
2477                     ; 711     if (CLK_IT == CLK_IT_SWIF)
2479  0327 a11c          	cp	a,#28
2480  0329 2611          	jrne	L3521
2481                     ; 714         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2483  032b c450c5        	and	a,20677
2484  032e a10c          	cp	a,#12
2485  0330 2606          	jrne	L5521
2486                     ; 716             bitstatus = SET;
2488  0332 a601          	ld	a,#1
2489  0334 6b01          	ld	(OFST+0,sp),a
2491  0336 2015          	jra	L1621
2492  0338               L5521:
2493                     ; 720             bitstatus = RESET;
2495  0338 0f01          	clr	(OFST+0,sp)
2496  033a 2011          	jra	L1621
2497  033c               L3521:
2498                     ; 726         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2500  033c c650c8        	ld	a,20680
2501  033f 1402          	and	a,(OFST+1,sp)
2502  0341 a10c          	cp	a,#12
2503  0343 2606          	jrne	L3621
2504                     ; 728             bitstatus = SET;
2506  0345 a601          	ld	a,#1
2507  0347 6b01          	ld	(OFST+0,sp),a
2509  0349 2002          	jra	L1621
2510  034b               L3621:
2511                     ; 732             bitstatus = RESET;
2513  034b 0f01          	clr	(OFST+0,sp)
2514  034d               L1621:
2515                     ; 737     return bitstatus;
2517  034d 7b01          	ld	a,(OFST+0,sp)
2520  034f 85            	popw	x
2521  0350 81            	ret
2557                     ; 747 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2557                     ; 748 {
2558                     	switch	.text
2559  0351               _CLK_ClearITPendingBit:
2563                     ; 751     assert_param(IS_CLK_IT_OK(CLK_IT));
2565                     ; 753     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2567  0351 a10c          	cp	a,#12
2568  0353 2606          	jrne	L5031
2569                     ; 756         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2571  0355 721750c8      	bres	20680,#3
2573  0359 2004          	jra	L7031
2574  035b               L5031:
2575                     ; 761         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2577  035b 721750c5      	bres	20677,#3
2578  035f               L7031:
2579                     ; 764 }
2582  035f 81            	ret
2617                     	xdef	_CLKPrescTable
2618                     	xdef	_HSIDivFactor
2619                     	xdef	_CLK_ClearITPendingBit
2620                     	xdef	_CLK_GetITStatus
2621                     	xdef	_CLK_GetFlagStatus
2622                     	xdef	_CLK_GetSYSCLKSource
2623                     	xdef	_CLK_GetClockFreq
2624                     	xdef	_CLK_AdjustHSICalibrationValue
2625                     	xdef	_CLK_SYSCLKEmergencyClear
2626                     	xdef	_CLK_ClockSecuritySystemEnable
2627                     	xdef	_CLK_SWIMConfig
2628                     	xdef	_CLK_SYSCLKConfig
2629                     	xdef	_CLK_ITConfig
2630                     	xdef	_CLK_CCOConfig
2631                     	xdef	_CLK_HSIPrescalerConfig
2632                     	xdef	_CLK_ClockSwitchConfig
2633                     	xdef	_CLK_PeripheralClockConfig
2634                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2635                     	xdef	_CLK_FastHaltWakeUpCmd
2636                     	xdef	_CLK_ClockSwitchCmd
2637                     	xdef	_CLK_CCOCmd
2638                     	xdef	_CLK_LSICmd
2639                     	xdef	_CLK_HSICmd
2640                     	xdef	_CLK_HSECmd
2641                     	xdef	_CLK_DeInit
2642                     	xref.b	c_lreg
2643                     	xref.b	c_x
2662                     	xref	c_ltor
2663                     	xref	c_ludv
2664                     	xref	c_rtol
2665                     	end
