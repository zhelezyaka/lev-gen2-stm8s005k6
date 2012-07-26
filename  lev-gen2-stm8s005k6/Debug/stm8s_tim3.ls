   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 45 void TIM3_DeInit(void)
  43                     ; 46 {
  45                     	switch	.text
  46  0000               _TIM3_DeInit:
  50                     ; 48     TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  52  0000 725f5320      	clr	21280
  53                     ; 49     TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  55  0004 725f5321      	clr	21281
  56                     ; 50     TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  58  0008 725f5323      	clr	21283
  59                     ; 53     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  61  000c 725f5327      	clr	21287
  62                     ; 56     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  64  0010 725f5327      	clr	21287
  65                     ; 57     TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  67  0014 725f5325      	clr	21285
  68                     ; 58     TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  70  0018 725f5326      	clr	21286
  71                     ; 59     TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  73  001c 725f5328      	clr	21288
  74                     ; 60     TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  76  0020 725f5329      	clr	21289
  77                     ; 61     TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  79  0024 725f532a      	clr	21290
  80                     ; 62     TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  82  0028 35ff532b      	mov	21291,#255
  83                     ; 63     TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  85  002c 35ff532c      	mov	21292,#255
  86                     ; 64     TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  88  0030 725f532d      	clr	21293
  89                     ; 65     TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  91  0034 725f532e      	clr	21294
  92                     ; 66     TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  94  0038 725f532f      	clr	21295
  95                     ; 67     TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
  97  003c 725f5330      	clr	21296
  98                     ; 68     TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
 100  0040 725f5322      	clr	21282
 101                     ; 69 }
 104  0044 81            	ret
 270                     ; 78 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 270                     ; 79                         uint16_t TIM3_Period)
 270                     ; 80 {
 271                     	switch	.text
 272  0045               _TIM3_TimeBaseInit:
 274  0045 88            	push	a
 275       00000000      OFST:	set	0
 278                     ; 82     TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 280  0046 c7532a        	ld	21290,a
 281                     ; 84     TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 283  0049 7b04          	ld	a,(OFST+4,sp)
 284  004b c7532b        	ld	21291,a
 285                     ; 85     TIM3->ARRL = (uint8_t)(TIM3_Period);
 287  004e 7b05          	ld	a,(OFST+5,sp)
 288  0050 c7532c        	ld	21292,a
 289                     ; 86 }
 292  0053 84            	pop	a
 293  0054 81            	ret
 448                     ; 96 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 448                     ; 97                   TIM3_OutputState_TypeDef TIM3_OutputState,
 448                     ; 98                   uint16_t TIM3_Pulse,
 448                     ; 99                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 448                     ; 100 {
 449                     	switch	.text
 450  0055               _TIM3_OC1Init:
 452  0055 89            	pushw	x
 453  0056 88            	push	a
 454       00000001      OFST:	set	1
 457                     ; 102     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 459                     ; 103     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 461                     ; 104     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 463                     ; 107     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 465  0057 c65327        	ld	a,21287
 466  005a a4fc          	and	a,#252
 467  005c c75327        	ld	21287,a
 468                     ; 109     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 470  005f 7b08          	ld	a,(OFST+7,sp)
 471  0061 a402          	and	a,#2
 472  0063 6b01          	ld	(OFST+0,sp),a
 473  0065 9f            	ld	a,xl
 474  0066 a401          	and	a,#1
 475  0068 1a01          	or	a,(OFST+0,sp)
 476  006a ca5327        	or	a,21287
 477  006d c75327        	ld	21287,a
 478                     ; 112     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 480  0070 c65325        	ld	a,21285
 481  0073 a48f          	and	a,#143
 482  0075 1a02          	or	a,(OFST+1,sp)
 483  0077 c75325        	ld	21285,a
 484                     ; 115     TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 486  007a 7b06          	ld	a,(OFST+5,sp)
 487  007c c7532d        	ld	21293,a
 488                     ; 116     TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 490  007f 7b07          	ld	a,(OFST+6,sp)
 491  0081 c7532e        	ld	21294,a
 492                     ; 117 }
 495  0084 5b03          	addw	sp,#3
 496  0086 81            	ret
 558                     ; 128 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 558                     ; 129                   TIM3_OutputState_TypeDef TIM3_OutputState,
 558                     ; 130                   uint16_t TIM3_Pulse,
 558                     ; 131                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 558                     ; 132 {
 559                     	switch	.text
 560  0087               _TIM3_OC2Init:
 562  0087 89            	pushw	x
 563  0088 88            	push	a
 564       00000001      OFST:	set	1
 567                     ; 134     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 569                     ; 135     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 571                     ; 136     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 573                     ; 140     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 575  0089 c65327        	ld	a,21287
 576  008c a4cf          	and	a,#207
 577  008e c75327        	ld	21287,a
 578                     ; 142     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 580  0091 7b08          	ld	a,(OFST+7,sp)
 581  0093 a420          	and	a,#32
 582  0095 6b01          	ld	(OFST+0,sp),a
 583  0097 9f            	ld	a,xl
 584  0098 a410          	and	a,#16
 585  009a 1a01          	or	a,(OFST+0,sp)
 586  009c ca5327        	or	a,21287
 587  009f c75327        	ld	21287,a
 588                     ; 146     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 590  00a2 c65326        	ld	a,21286
 591  00a5 a48f          	and	a,#143
 592  00a7 1a02          	or	a,(OFST+1,sp)
 593  00a9 c75326        	ld	21286,a
 594                     ; 150     TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 596  00ac 7b06          	ld	a,(OFST+5,sp)
 597  00ae c7532f        	ld	21295,a
 598                     ; 151     TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 600  00b1 7b07          	ld	a,(OFST+6,sp)
 601  00b3 c75330        	ld	21296,a
 602                     ; 152 }
 605  00b6 5b03          	addw	sp,#3
 606  00b8 81            	ret
 788                     ; 163 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 788                     ; 164                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 788                     ; 165                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 788                     ; 166                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 788                     ; 167                  uint8_t TIM3_ICFilter)
 788                     ; 168 {
 789                     	switch	.text
 790  00b9               _TIM3_ICInit:
 792  00b9 89            	pushw	x
 793       00000000      OFST:	set	0
 796                     ; 170     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 798                     ; 171     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 800                     ; 172     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 802                     ; 173     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 804                     ; 174     assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 806                     ; 176     if (TIM3_Channel != TIM3_CHANNEL_2)
 808  00ba 9e            	ld	a,xh
 809  00bb a101          	cp	a,#1
 810  00bd 2714          	jreq	L333
 811                     ; 179         TI1_Config((uint8_t)TIM3_ICPolarity,
 811                     ; 180                    (uint8_t)TIM3_ICSelection,
 811                     ; 181                    (uint8_t)TIM3_ICFilter);
 813  00bf 7b07          	ld	a,(OFST+7,sp)
 814  00c1 88            	push	a
 815  00c2 7b06          	ld	a,(OFST+6,sp)
 816  00c4 97            	ld	xl,a
 817  00c5 7b03          	ld	a,(OFST+3,sp)
 818  00c7 95            	ld	xh,a
 819  00c8 cd0360        	call	L3_TI1_Config
 821  00cb 84            	pop	a
 822                     ; 184         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 824  00cc 7b06          	ld	a,(OFST+6,sp)
 825  00ce cd0285        	call	_TIM3_SetIC1Prescaler
 828  00d1 2012          	jra	L533
 829  00d3               L333:
 830                     ; 189         TI2_Config((uint8_t)TIM3_ICPolarity,
 830                     ; 190                    (uint8_t)TIM3_ICSelection,
 830                     ; 191                    (uint8_t)TIM3_ICFilter);
 832  00d3 7b07          	ld	a,(OFST+7,sp)
 833  00d5 88            	push	a
 834  00d6 7b06          	ld	a,(OFST+6,sp)
 835  00d8 97            	ld	xl,a
 836  00d9 7b03          	ld	a,(OFST+3,sp)
 837  00db 95            	ld	xh,a
 838  00dc cd0390        	call	L5_TI2_Config
 840  00df 84            	pop	a
 841                     ; 194         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 843  00e0 7b06          	ld	a,(OFST+6,sp)
 844  00e2 cd0292        	call	_TIM3_SetIC2Prescaler
 846  00e5               L533:
 847                     ; 196 }
 850  00e5 85            	popw	x
 851  00e6 81            	ret
 941                     ; 206 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 941                     ; 207                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 941                     ; 208                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 941                     ; 209                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 941                     ; 210                      uint8_t TIM3_ICFilter)
 941                     ; 211 {
 942                     	switch	.text
 943  00e7               _TIM3_PWMIConfig:
 945  00e7 89            	pushw	x
 946  00e8 89            	pushw	x
 947       00000002      OFST:	set	2
 950                     ; 212     uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 952                     ; 213     uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 954                     ; 216     assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 956                     ; 217     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 958                     ; 218     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 960                     ; 219     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 962                     ; 222     if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 964  00e9 9f            	ld	a,xl
 965  00ea a144          	cp	a,#68
 966  00ec 2706          	jreq	L773
 967                     ; 224         icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
 969  00ee a644          	ld	a,#68
 970  00f0 6b01          	ld	(OFST-1,sp),a
 972  00f2 2002          	jra	L104
 973  00f4               L773:
 974                     ; 228         icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 976  00f4 0f01          	clr	(OFST-1,sp)
 977  00f6               L104:
 978                     ; 232     if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 980  00f6 7b07          	ld	a,(OFST+5,sp)
 981  00f8 a101          	cp	a,#1
 982  00fa 2606          	jrne	L304
 983                     ; 234         icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
 985  00fc a602          	ld	a,#2
 986  00fe 6b02          	ld	(OFST+0,sp),a
 988  0100 2004          	jra	L504
 989  0102               L304:
 990                     ; 238         icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 992  0102 a601          	ld	a,#1
 993  0104 6b02          	ld	(OFST+0,sp),a
 994  0106               L504:
 995                     ; 241     if (TIM3_Channel != TIM3_CHANNEL_2)
 997  0106 7b03          	ld	a,(OFST+1,sp)
 998  0108 a101          	cp	a,#1
 999  010a 2726          	jreq	L704
1000                     ; 244         TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1000                     ; 245                    (uint8_t)TIM3_ICFilter);
1002  010c 7b09          	ld	a,(OFST+7,sp)
1003  010e 88            	push	a
1004  010f 7b08          	ld	a,(OFST+6,sp)
1005  0111 97            	ld	xl,a
1006  0112 7b05          	ld	a,(OFST+3,sp)
1007  0114 95            	ld	xh,a
1008  0115 cd0360        	call	L3_TI1_Config
1010  0118 84            	pop	a
1011                     ; 248         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1013  0119 7b08          	ld	a,(OFST+6,sp)
1014  011b cd0285        	call	_TIM3_SetIC1Prescaler
1016                     ; 251         TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1018  011e 7b09          	ld	a,(OFST+7,sp)
1019  0120 88            	push	a
1020  0121 7b03          	ld	a,(OFST+1,sp)
1021  0123 97            	ld	xl,a
1022  0124 7b02          	ld	a,(OFST+0,sp)
1023  0126 95            	ld	xh,a
1024  0127 cd0390        	call	L5_TI2_Config
1026  012a 84            	pop	a
1027                     ; 254         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1029  012b 7b08          	ld	a,(OFST+6,sp)
1030  012d cd0292        	call	_TIM3_SetIC2Prescaler
1033  0130 2024          	jra	L114
1034  0132               L704:
1035                     ; 259         TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1035                     ; 260                    (uint8_t)TIM3_ICFilter);
1037  0132 7b09          	ld	a,(OFST+7,sp)
1038  0134 88            	push	a
1039  0135 7b08          	ld	a,(OFST+6,sp)
1040  0137 97            	ld	xl,a
1041  0138 7b05          	ld	a,(OFST+3,sp)
1042  013a 95            	ld	xh,a
1043  013b cd0390        	call	L5_TI2_Config
1045  013e 84            	pop	a
1046                     ; 263         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1048  013f 7b08          	ld	a,(OFST+6,sp)
1049  0141 cd0292        	call	_TIM3_SetIC2Prescaler
1051                     ; 266         TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1053  0144 7b09          	ld	a,(OFST+7,sp)
1054  0146 88            	push	a
1055  0147 7b03          	ld	a,(OFST+1,sp)
1056  0149 97            	ld	xl,a
1057  014a 7b02          	ld	a,(OFST+0,sp)
1058  014c 95            	ld	xh,a
1059  014d cd0360        	call	L3_TI1_Config
1061  0150 84            	pop	a
1062                     ; 269         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1064  0151 7b08          	ld	a,(OFST+6,sp)
1065  0153 cd0285        	call	_TIM3_SetIC1Prescaler
1067  0156               L114:
1068                     ; 271 }
1071  0156 5b04          	addw	sp,#4
1072  0158 81            	ret
1127                     ; 280 void TIM3_Cmd(FunctionalState NewState)
1127                     ; 281 {
1128                     	switch	.text
1129  0159               _TIM3_Cmd:
1133                     ; 283     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1135                     ; 286     if (NewState != DISABLE)
1137  0159 4d            	tnz	a
1138  015a 2706          	jreq	L144
1139                     ; 288         TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1141  015c 72105320      	bset	21280,#0
1143  0160 2004          	jra	L344
1144  0162               L144:
1145                     ; 292         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1147  0162 72115320      	bres	21280,#0
1148  0166               L344:
1149                     ; 294 }
1152  0166 81            	ret
1224                     ; 309 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1224                     ; 310 {
1225                     	switch	.text
1226  0167               _TIM3_ITConfig:
1228  0167 89            	pushw	x
1229       00000000      OFST:	set	0
1232                     ; 312     assert_param(IS_TIM3_IT_OK(TIM3_IT));
1234                     ; 313     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1236                     ; 315     if (NewState != DISABLE)
1238  0168 9f            	ld	a,xl
1239  0169 4d            	tnz	a
1240  016a 2709          	jreq	L105
1241                     ; 318         TIM3->IER |= (uint8_t)TIM3_IT;
1243  016c 9e            	ld	a,xh
1244  016d ca5321        	or	a,21281
1245  0170 c75321        	ld	21281,a
1247  0173 2009          	jra	L305
1248  0175               L105:
1249                     ; 323         TIM3->IER &= (uint8_t)(~TIM3_IT);
1251  0175 7b01          	ld	a,(OFST+1,sp)
1252  0177 43            	cpl	a
1253  0178 c45321        	and	a,21281
1254  017b c75321        	ld	21281,a
1255  017e               L305:
1256                     ; 325 }
1259  017e 85            	popw	x
1260  017f 81            	ret
1296                     ; 334 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1296                     ; 335 {
1297                     	switch	.text
1298  0180               _TIM3_UpdateDisableConfig:
1302                     ; 337     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1304                     ; 340     if (NewState != DISABLE)
1306  0180 4d            	tnz	a
1307  0181 2706          	jreq	L325
1308                     ; 342         TIM3->CR1 |= TIM3_CR1_UDIS;
1310  0183 72125320      	bset	21280,#1
1312  0187 2004          	jra	L525
1313  0189               L325:
1314                     ; 346         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1316  0189 72135320      	bres	21280,#1
1317  018d               L525:
1318                     ; 348 }
1321  018d 81            	ret
1379                     ; 358 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1379                     ; 359 {
1380                     	switch	.text
1381  018e               _TIM3_UpdateRequestConfig:
1385                     ; 361     assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1387                     ; 364     if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1389  018e 4d            	tnz	a
1390  018f 2706          	jreq	L555
1391                     ; 366         TIM3->CR1 |= TIM3_CR1_URS;
1393  0191 72145320      	bset	21280,#2
1395  0195 2004          	jra	L755
1396  0197               L555:
1397                     ; 370         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1399  0197 72155320      	bres	21280,#2
1400  019b               L755:
1401                     ; 372 }
1404  019b 81            	ret
1461                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1461                     ; 384 {
1462                     	switch	.text
1463  019c               _TIM3_SelectOnePulseMode:
1467                     ; 386     assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1469                     ; 389     if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1471  019c 4d            	tnz	a
1472  019d 2706          	jreq	L706
1473                     ; 391         TIM3->CR1 |= TIM3_CR1_OPM;
1475  019f 72165320      	bset	21280,#3
1477  01a3 2004          	jra	L116
1478  01a5               L706:
1479                     ; 395         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1481  01a5 72175320      	bres	21280,#3
1482  01a9               L116:
1483                     ; 398 }
1486  01a9 81            	ret
1554                     ; 429 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1554                     ; 430                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1554                     ; 431 {
1555                     	switch	.text
1556  01aa               _TIM3_PrescalerConfig:
1560                     ; 433     assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1562                     ; 434     assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1564                     ; 437     TIM3->PSCR = (uint8_t)Prescaler;
1566  01aa 9e            	ld	a,xh
1567  01ab c7532a        	ld	21290,a
1568                     ; 440     TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
1570  01ae 9f            	ld	a,xl
1571  01af c75324        	ld	21284,a
1572                     ; 441 }
1575  01b2 81            	ret
1633                     ; 452 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1633                     ; 453 {
1634                     	switch	.text
1635  01b3               _TIM3_ForcedOC1Config:
1637  01b3 88            	push	a
1638       00000000      OFST:	set	0
1641                     ; 455     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1643                     ; 458     TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
1645  01b4 c65325        	ld	a,21285
1646  01b7 a48f          	and	a,#143
1647  01b9 1a01          	or	a,(OFST+1,sp)
1648  01bb c75325        	ld	21285,a
1649                     ; 459 }
1652  01be 84            	pop	a
1653  01bf 81            	ret
1689                     ; 470 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1689                     ; 471 {
1690                     	switch	.text
1691  01c0               _TIM3_ForcedOC2Config:
1693  01c0 88            	push	a
1694       00000000      OFST:	set	0
1697                     ; 473     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1699                     ; 476     TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
1701  01c1 c65326        	ld	a,21286
1702  01c4 a48f          	and	a,#143
1703  01c6 1a01          	or	a,(OFST+1,sp)
1704  01c8 c75326        	ld	21286,a
1705                     ; 477 }
1708  01cb 84            	pop	a
1709  01cc 81            	ret
1745                     ; 486 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1745                     ; 487 {
1746                     	switch	.text
1747  01cd               _TIM3_ARRPreloadConfig:
1751                     ; 489     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1753                     ; 492     if (NewState != DISABLE)
1755  01cd 4d            	tnz	a
1756  01ce 2706          	jreq	L727
1757                     ; 494         TIM3->CR1 |= TIM3_CR1_ARPE;
1759  01d0 721e5320      	bset	21280,#7
1761  01d4 2004          	jra	L137
1762  01d6               L727:
1763                     ; 498         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
1765  01d6 721f5320      	bres	21280,#7
1766  01da               L137:
1767                     ; 500 }
1770  01da 81            	ret
1806                     ; 509 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1806                     ; 510 {
1807                     	switch	.text
1808  01db               _TIM3_OC1PreloadConfig:
1812                     ; 512     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1814                     ; 515     if (NewState != DISABLE)
1816  01db 4d            	tnz	a
1817  01dc 2706          	jreq	L157
1818                     ; 517         TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1820  01de 72165325      	bset	21285,#3
1822  01e2 2004          	jra	L357
1823  01e4               L157:
1824                     ; 521         TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1826  01e4 72175325      	bres	21285,#3
1827  01e8               L357:
1828                     ; 523 }
1831  01e8 81            	ret
1867                     ; 532 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1867                     ; 533 {
1868                     	switch	.text
1869  01e9               _TIM3_OC2PreloadConfig:
1873                     ; 535     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1875                     ; 538     if (NewState != DISABLE)
1877  01e9 4d            	tnz	a
1878  01ea 2706          	jreq	L377
1879                     ; 540         TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1881  01ec 72165326      	bset	21286,#3
1883  01f0 2004          	jra	L577
1884  01f2               L377:
1885                     ; 544         TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1887  01f2 72175326      	bres	21286,#3
1888  01f6               L577:
1889                     ; 546 }
1892  01f6 81            	ret
1957                     ; 557 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1957                     ; 558 {
1958                     	switch	.text
1959  01f7               _TIM3_GenerateEvent:
1963                     ; 560     assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1965                     ; 563     TIM3->EGR = (uint8_t)TIM3_EventSource;
1967  01f7 c75324        	ld	21284,a
1968                     ; 564 }
1971  01fa 81            	ret
2007                     ; 575 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2007                     ; 576 {
2008                     	switch	.text
2009  01fb               _TIM3_OC1PolarityConfig:
2013                     ; 578     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2015                     ; 581     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2017  01fb 4d            	tnz	a
2018  01fc 2706          	jreq	L5401
2019                     ; 583         TIM3->CCER1 |= TIM3_CCER1_CC1P;
2021  01fe 72125327      	bset	21287,#1
2023  0202 2004          	jra	L7401
2024  0204               L5401:
2025                     ; 587         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2027  0204 72135327      	bres	21287,#1
2028  0208               L7401:
2029                     ; 589 }
2032  0208 81            	ret
2068                     ; 600 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2068                     ; 601 {
2069                     	switch	.text
2070  0209               _TIM3_OC2PolarityConfig:
2074                     ; 603     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2076                     ; 606     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2078  0209 4d            	tnz	a
2079  020a 2706          	jreq	L7601
2080                     ; 608         TIM3->CCER1 |= TIM3_CCER1_CC2P;
2082  020c 721a5327      	bset	21287,#5
2084  0210 2004          	jra	L1701
2085  0212               L7601:
2086                     ; 612         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2088  0212 721b5327      	bres	21287,#5
2089  0216               L1701:
2090                     ; 614 }
2093  0216 81            	ret
2138                     ; 627 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2138                     ; 628 {
2139                     	switch	.text
2140  0217               _TIM3_CCxCmd:
2142  0217 89            	pushw	x
2143       00000000      OFST:	set	0
2146                     ; 630     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2148                     ; 631     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2150                     ; 633     if (TIM3_Channel == TIM3_CHANNEL_1)
2152  0218 9e            	ld	a,xh
2153  0219 4d            	tnz	a
2154  021a 2610          	jrne	L5111
2155                     ; 636         if (NewState != DISABLE)
2157  021c 9f            	ld	a,xl
2158  021d 4d            	tnz	a
2159  021e 2706          	jreq	L7111
2160                     ; 638             TIM3->CCER1 |= TIM3_CCER1_CC1E;
2162  0220 72105327      	bset	21287,#0
2164  0224 2014          	jra	L3211
2165  0226               L7111:
2166                     ; 642             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2168  0226 72115327      	bres	21287,#0
2169  022a 200e          	jra	L3211
2170  022c               L5111:
2171                     ; 649         if (NewState != DISABLE)
2173  022c 0d02          	tnz	(OFST+2,sp)
2174  022e 2706          	jreq	L5211
2175                     ; 651             TIM3->CCER1 |= TIM3_CCER1_CC2E;
2177  0230 72185327      	bset	21287,#4
2179  0234 2004          	jra	L3211
2180  0236               L5211:
2181                     ; 655             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2183  0236 72195327      	bres	21287,#4
2184  023a               L3211:
2185                     ; 659 }
2188  023a 85            	popw	x
2189  023b 81            	ret
2234                     ; 680 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2234                     ; 681 {
2235                     	switch	.text
2236  023c               _TIM3_SelectOCxM:
2238  023c 89            	pushw	x
2239       00000000      OFST:	set	0
2242                     ; 683     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2244                     ; 684     assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2246                     ; 686     if (TIM3_Channel == TIM3_CHANNEL_1)
2248  023d 9e            	ld	a,xh
2249  023e 4d            	tnz	a
2250  023f 2610          	jrne	L3511
2251                     ; 689         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2253  0241 72115327      	bres	21287,#0
2254                     ; 692         TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2256  0245 c65325        	ld	a,21285
2257  0248 a48f          	and	a,#143
2258  024a 1a02          	or	a,(OFST+2,sp)
2259  024c c75325        	ld	21285,a
2261  024f 200e          	jra	L5511
2262  0251               L3511:
2263                     ; 697         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2265  0251 72195327      	bres	21287,#4
2266                     ; 700         TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2268  0255 c65326        	ld	a,21286
2269  0258 a48f          	and	a,#143
2270  025a 1a02          	or	a,(OFST+2,sp)
2271  025c c75326        	ld	21286,a
2272  025f               L5511:
2273                     ; 702 }
2276  025f 85            	popw	x
2277  0260 81            	ret
2309                     ; 711 void TIM3_SetCounter(uint16_t Counter)
2309                     ; 712 {
2310                     	switch	.text
2311  0261               _TIM3_SetCounter:
2315                     ; 714     TIM3->CNTRH = (uint8_t)(Counter >> 8);
2317  0261 9e            	ld	a,xh
2318  0262 c75328        	ld	21288,a
2319                     ; 715     TIM3->CNTRL = (uint8_t)(Counter);
2321  0265 9f            	ld	a,xl
2322  0266 c75329        	ld	21289,a
2323                     ; 717 }
2326  0269 81            	ret
2358                     ; 726 void TIM3_SetAutoreload(uint16_t Autoreload)
2358                     ; 727 {
2359                     	switch	.text
2360  026a               _TIM3_SetAutoreload:
2364                     ; 729     TIM3->ARRH = (uint8_t)(Autoreload >> 8);
2366  026a 9e            	ld	a,xh
2367  026b c7532b        	ld	21291,a
2368                     ; 730     TIM3->ARRL = (uint8_t)(Autoreload);
2370  026e 9f            	ld	a,xl
2371  026f c7532c        	ld	21292,a
2372                     ; 731 }
2375  0272 81            	ret
2407                     ; 740 void TIM3_SetCompare1(uint16_t Compare1)
2407                     ; 741 {
2408                     	switch	.text
2409  0273               _TIM3_SetCompare1:
2413                     ; 743     TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
2415  0273 9e            	ld	a,xh
2416  0274 c7532d        	ld	21293,a
2417                     ; 744     TIM3->CCR1L = (uint8_t)(Compare1);
2419  0277 9f            	ld	a,xl
2420  0278 c7532e        	ld	21294,a
2421                     ; 745 }
2424  027b 81            	ret
2456                     ; 754 void TIM3_SetCompare2(uint16_t Compare2)
2456                     ; 755 {
2457                     	switch	.text
2458  027c               _TIM3_SetCompare2:
2462                     ; 757     TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
2464  027c 9e            	ld	a,xh
2465  027d c7532f        	ld	21295,a
2466                     ; 758     TIM3->CCR2L = (uint8_t)(Compare2);
2468  0280 9f            	ld	a,xl
2469  0281 c75330        	ld	21296,a
2470                     ; 759 }
2473  0284 81            	ret
2509                     ; 772 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2509                     ; 773 {
2510                     	switch	.text
2511  0285               _TIM3_SetIC1Prescaler:
2513  0285 88            	push	a
2514       00000000      OFST:	set	0
2517                     ; 775     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2519                     ; 778     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
2521  0286 c65325        	ld	a,21285
2522  0289 a4f3          	and	a,#243
2523  028b 1a01          	or	a,(OFST+1,sp)
2524  028d c75325        	ld	21285,a
2525                     ; 779 }
2528  0290 84            	pop	a
2529  0291 81            	ret
2565                     ; 791 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2565                     ; 792 {
2566                     	switch	.text
2567  0292               _TIM3_SetIC2Prescaler:
2569  0292 88            	push	a
2570       00000000      OFST:	set	0
2573                     ; 794     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2575                     ; 797     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
2577  0293 c65326        	ld	a,21286
2578  0296 a4f3          	and	a,#243
2579  0298 1a01          	or	a,(OFST+1,sp)
2580  029a c75326        	ld	21286,a
2581                     ; 798 }
2584  029d 84            	pop	a
2585  029e 81            	ret
2631                     ; 804 uint16_t TIM3_GetCapture1(void)
2631                     ; 805 {
2632                     	switch	.text
2633  029f               _TIM3_GetCapture1:
2635  029f 5204          	subw	sp,#4
2636       00000004      OFST:	set	4
2639                     ; 807     uint16_t tmpccr1 = 0;
2641                     ; 808     uint8_t tmpccr1l=0, tmpccr1h=0;
2645                     ; 810     tmpccr1h = TIM3->CCR1H;
2647  02a1 c6532d        	ld	a,21293
2648  02a4 6b02          	ld	(OFST-2,sp),a
2649                     ; 811     tmpccr1l = TIM3->CCR1L;
2651  02a6 c6532e        	ld	a,21294
2652  02a9 6b01          	ld	(OFST-3,sp),a
2653                     ; 813     tmpccr1 = (uint16_t)(tmpccr1l);
2655  02ab 7b01          	ld	a,(OFST-3,sp)
2656  02ad 5f            	clrw	x
2657  02ae 97            	ld	xl,a
2658  02af 1f03          	ldw	(OFST-1,sp),x
2659                     ; 814     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
2661  02b1 7b02          	ld	a,(OFST-2,sp)
2662  02b3 5f            	clrw	x
2663  02b4 97            	ld	xl,a
2664  02b5 4f            	clr	a
2665  02b6 02            	rlwa	x,a
2666  02b7 01            	rrwa	x,a
2667  02b8 1a04          	or	a,(OFST+0,sp)
2668  02ba 01            	rrwa	x,a
2669  02bb 1a03          	or	a,(OFST-1,sp)
2670  02bd 01            	rrwa	x,a
2671  02be 1f03          	ldw	(OFST-1,sp),x
2672                     ; 816     return (uint16_t)tmpccr1;
2674  02c0 1e03          	ldw	x,(OFST-1,sp)
2677  02c2 5b04          	addw	sp,#4
2678  02c4 81            	ret
2724                     ; 824 uint16_t TIM3_GetCapture2(void)
2724                     ; 825 {
2725                     	switch	.text
2726  02c5               _TIM3_GetCapture2:
2728  02c5 5204          	subw	sp,#4
2729       00000004      OFST:	set	4
2732                     ; 827     uint16_t tmpccr2 = 0;
2734                     ; 828     uint8_t tmpccr2l=0, tmpccr2h=0;
2738                     ; 830     tmpccr2h = TIM3->CCR2H;
2740  02c7 c6532f        	ld	a,21295
2741  02ca 6b02          	ld	(OFST-2,sp),a
2742                     ; 831     tmpccr2l = TIM3->CCR2L;
2744  02cc c65330        	ld	a,21296
2745  02cf 6b01          	ld	(OFST-3,sp),a
2746                     ; 833     tmpccr2 = (uint16_t)(tmpccr2l);
2748  02d1 7b01          	ld	a,(OFST-3,sp)
2749  02d3 5f            	clrw	x
2750  02d4 97            	ld	xl,a
2751  02d5 1f03          	ldw	(OFST-1,sp),x
2752                     ; 834     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
2754  02d7 7b02          	ld	a,(OFST-2,sp)
2755  02d9 5f            	clrw	x
2756  02da 97            	ld	xl,a
2757  02db 4f            	clr	a
2758  02dc 02            	rlwa	x,a
2759  02dd 01            	rrwa	x,a
2760  02de 1a04          	or	a,(OFST+0,sp)
2761  02e0 01            	rrwa	x,a
2762  02e1 1a03          	or	a,(OFST-1,sp)
2763  02e3 01            	rrwa	x,a
2764  02e4 1f03          	ldw	(OFST-1,sp),x
2765                     ; 836     return (uint16_t)tmpccr2;
2767  02e6 1e03          	ldw	x,(OFST-1,sp)
2770  02e8 5b04          	addw	sp,#4
2771  02ea 81            	ret
2803                     ; 844 uint16_t TIM3_GetCounter(void)
2803                     ; 845 {
2804                     	switch	.text
2805  02eb               _TIM3_GetCounter:
2807  02eb 89            	pushw	x
2808       00000002      OFST:	set	2
2811                     ; 846    uint16_t tmpcntr = 0;
2813                     ; 848    tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
2815  02ec c65328        	ld	a,21288
2816  02ef 5f            	clrw	x
2817  02f0 97            	ld	xl,a
2818  02f1 4f            	clr	a
2819  02f2 02            	rlwa	x,a
2820  02f3 1f01          	ldw	(OFST-1,sp),x
2821                     ; 850     return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
2823  02f5 c65329        	ld	a,21289
2824  02f8 5f            	clrw	x
2825  02f9 97            	ld	xl,a
2826  02fa 01            	rrwa	x,a
2827  02fb 1a02          	or	a,(OFST+0,sp)
2828  02fd 01            	rrwa	x,a
2829  02fe 1a01          	or	a,(OFST-1,sp)
2830  0300 01            	rrwa	x,a
2833  0301 5b02          	addw	sp,#2
2834  0303 81            	ret
2858                     ; 859 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2858                     ; 860 {
2859                     	switch	.text
2860  0304               _TIM3_GetPrescaler:
2864                     ; 862     return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2866  0304 c6532a        	ld	a,21290
2869  0307 81            	ret
2990                     ; 877 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
2990                     ; 878 {
2991                     	switch	.text
2992  0308               _TIM3_GetFlagStatus:
2994  0308 89            	pushw	x
2995  0309 89            	pushw	x
2996       00000002      OFST:	set	2
2999                     ; 879    FlagStatus bitstatus = RESET;
3001                     ; 880    uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3005                     ; 883     assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3007                     ; 885     tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3009  030a 9f            	ld	a,xl
3010  030b c45322        	and	a,21282
3011  030e 6b01          	ld	(OFST-1,sp),a
3012                     ; 886     tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3014  0310 7b03          	ld	a,(OFST+1,sp)
3015  0312 6b02          	ld	(OFST+0,sp),a
3016                     ; 888     if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3018  0314 c65323        	ld	a,21283
3019  0317 1402          	and	a,(OFST+0,sp)
3020  0319 1a01          	or	a,(OFST-1,sp)
3021  031b 2706          	jreq	L3341
3022                     ; 890         bitstatus = SET;
3024  031d a601          	ld	a,#1
3025  031f 6b02          	ld	(OFST+0,sp),a
3027  0321 2002          	jra	L5341
3028  0323               L3341:
3029                     ; 894         bitstatus = RESET;
3031  0323 0f02          	clr	(OFST+0,sp)
3032  0325               L5341:
3033                     ; 896     return (FlagStatus)bitstatus;
3035  0325 7b02          	ld	a,(OFST+0,sp)
3038  0327 5b04          	addw	sp,#4
3039  0329 81            	ret
3074                     ; 911 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3074                     ; 912 {
3075                     	switch	.text
3076  032a               _TIM3_ClearFlag:
3078  032a 89            	pushw	x
3079       00000000      OFST:	set	0
3082                     ; 914     assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3084                     ; 917     TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3086  032b 9f            	ld	a,xl
3087  032c 43            	cpl	a
3088  032d c75322        	ld	21282,a
3089                     ; 918     TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3091  0330 7b01          	ld	a,(OFST+1,sp)
3092  0332 43            	cpl	a
3093  0333 c75323        	ld	21283,a
3094                     ; 919 }
3097  0336 85            	popw	x
3098  0337 81            	ret
3158                     ; 932 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3158                     ; 933 {
3159                     	switch	.text
3160  0338               _TIM3_GetITStatus:
3162  0338 88            	push	a
3163  0339 89            	pushw	x
3164       00000002      OFST:	set	2
3167                     ; 934     ITStatus bitstatus = RESET;
3169                     ; 935     uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
3173                     ; 938     assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3175                     ; 940     TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
3177  033a c45322        	and	a,21282
3178  033d 6b01          	ld	(OFST-1,sp),a
3179                     ; 942     TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
3181  033f c65321        	ld	a,21281
3182  0342 1403          	and	a,(OFST+1,sp)
3183  0344 6b02          	ld	(OFST+0,sp),a
3184                     ; 944     if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
3186  0346 0d01          	tnz	(OFST-1,sp)
3187  0348 270a          	jreq	L3051
3189  034a 0d02          	tnz	(OFST+0,sp)
3190  034c 2706          	jreq	L3051
3191                     ; 946         bitstatus = SET;
3193  034e a601          	ld	a,#1
3194  0350 6b02          	ld	(OFST+0,sp),a
3196  0352 2002          	jra	L5051
3197  0354               L3051:
3198                     ; 950         bitstatus = RESET;
3200  0354 0f02          	clr	(OFST+0,sp)
3201  0356               L5051:
3202                     ; 952     return (ITStatus)(bitstatus);
3204  0356 7b02          	ld	a,(OFST+0,sp)
3207  0358 5b03          	addw	sp,#3
3208  035a 81            	ret
3244                     ; 965 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3244                     ; 966 {
3245                     	switch	.text
3246  035b               _TIM3_ClearITPendingBit:
3250                     ; 968     assert_param(IS_TIM3_IT_OK(TIM3_IT));
3252                     ; 971     TIM3->SR1 = (uint8_t)(~TIM3_IT);
3254  035b 43            	cpl	a
3255  035c c75322        	ld	21282,a
3256                     ; 972 }
3259  035f 81            	ret
3305                     ; 991 static void TI1_Config(uint8_t TIM3_ICPolarity,
3305                     ; 992                        uint8_t TIM3_ICSelection,
3305                     ; 993                        uint8_t TIM3_ICFilter)
3305                     ; 994 {
3306                     	switch	.text
3307  0360               L3_TI1_Config:
3309  0360 89            	pushw	x
3310  0361 88            	push	a
3311       00000001      OFST:	set	1
3314                     ; 996     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3316  0362 72115327      	bres	21287,#0
3317                     ; 999     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
3319  0366 7b06          	ld	a,(OFST+5,sp)
3320  0368 97            	ld	xl,a
3321  0369 a610          	ld	a,#16
3322  036b 42            	mul	x,a
3323  036c 9f            	ld	a,xl
3324  036d 1a03          	or	a,(OFST+2,sp)
3325  036f 6b01          	ld	(OFST+0,sp),a
3326  0371 c65325        	ld	a,21285
3327  0374 a40c          	and	a,#12
3328  0376 1a01          	or	a,(OFST+0,sp)
3329  0378 c75325        	ld	21285,a
3330                     ; 1002     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3332  037b 0d02          	tnz	(OFST+1,sp)
3333  037d 2706          	jreq	L5451
3334                     ; 1004         TIM3->CCER1 |= TIM3_CCER1_CC1P;
3336  037f 72125327      	bset	21287,#1
3338  0383 2004          	jra	L7451
3339  0385               L5451:
3340                     ; 1008         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
3342  0385 72135327      	bres	21287,#1
3343  0389               L7451:
3344                     ; 1011     TIM3->CCER1 |= TIM3_CCER1_CC1E;
3346  0389 72105327      	bset	21287,#0
3347                     ; 1012 }
3350  038d 5b03          	addw	sp,#3
3351  038f 81            	ret
3397                     ; 1031 static void TI2_Config(uint8_t TIM3_ICPolarity,
3397                     ; 1032                        uint8_t TIM3_ICSelection,
3397                     ; 1033                        uint8_t TIM3_ICFilter)
3397                     ; 1034 {
3398                     	switch	.text
3399  0390               L5_TI2_Config:
3401  0390 89            	pushw	x
3402  0391 88            	push	a
3403       00000001      OFST:	set	1
3406                     ; 1036     TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
3408  0392 72195327      	bres	21287,#4
3409                     ; 1039     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
3409                     ; 1040                   TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
3409                     ; 1041                   ((uint8_t)( TIM3_ICFilter << 4))));
3411  0396 7b06          	ld	a,(OFST+5,sp)
3412  0398 97            	ld	xl,a
3413  0399 a610          	ld	a,#16
3414  039b 42            	mul	x,a
3415  039c 9f            	ld	a,xl
3416  039d 1a03          	or	a,(OFST+2,sp)
3417  039f 6b01          	ld	(OFST+0,sp),a
3418  03a1 c65326        	ld	a,21286
3419  03a4 a40c          	and	a,#12
3420  03a6 1a01          	or	a,(OFST+0,sp)
3421  03a8 c75326        	ld	21286,a
3422                     ; 1044     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3424  03ab 0d02          	tnz	(OFST+1,sp)
3425  03ad 2706          	jreq	L1751
3426                     ; 1046         TIM3->CCER1 |= TIM3_CCER1_CC2P;
3428  03af 721a5327      	bset	21287,#5
3430  03b3 2004          	jra	L3751
3431  03b5               L1751:
3432                     ; 1050         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
3434  03b5 721b5327      	bres	21287,#5
3435  03b9               L3751:
3436                     ; 1054     TIM3->CCER1 |= TIM3_CCER1_CC2E;
3438  03b9 72185327      	bset	21287,#4
3439                     ; 1056 }
3442  03bd 5b03          	addw	sp,#3
3443  03bf 81            	ret
3456                     	xdef	_TIM3_ClearITPendingBit
3457                     	xdef	_TIM3_GetITStatus
3458                     	xdef	_TIM3_ClearFlag
3459                     	xdef	_TIM3_GetFlagStatus
3460                     	xdef	_TIM3_GetPrescaler
3461                     	xdef	_TIM3_GetCounter
3462                     	xdef	_TIM3_GetCapture2
3463                     	xdef	_TIM3_GetCapture1
3464                     	xdef	_TIM3_SetIC2Prescaler
3465                     	xdef	_TIM3_SetIC1Prescaler
3466                     	xdef	_TIM3_SetCompare2
3467                     	xdef	_TIM3_SetCompare1
3468                     	xdef	_TIM3_SetAutoreload
3469                     	xdef	_TIM3_SetCounter
3470                     	xdef	_TIM3_SelectOCxM
3471                     	xdef	_TIM3_CCxCmd
3472                     	xdef	_TIM3_OC2PolarityConfig
3473                     	xdef	_TIM3_OC1PolarityConfig
3474                     	xdef	_TIM3_GenerateEvent
3475                     	xdef	_TIM3_OC2PreloadConfig
3476                     	xdef	_TIM3_OC1PreloadConfig
3477                     	xdef	_TIM3_ARRPreloadConfig
3478                     	xdef	_TIM3_ForcedOC2Config
3479                     	xdef	_TIM3_ForcedOC1Config
3480                     	xdef	_TIM3_PrescalerConfig
3481                     	xdef	_TIM3_SelectOnePulseMode
3482                     	xdef	_TIM3_UpdateRequestConfig
3483                     	xdef	_TIM3_UpdateDisableConfig
3484                     	xdef	_TIM3_ITConfig
3485                     	xdef	_TIM3_Cmd
3486                     	xdef	_TIM3_PWMIConfig
3487                     	xdef	_TIM3_ICInit
3488                     	xdef	_TIM3_OC2Init
3489                     	xdef	_TIM3_OC1Init
3490                     	xdef	_TIM3_TimeBaseInit
3491                     	xdef	_TIM3_DeInit
3510                     	end
