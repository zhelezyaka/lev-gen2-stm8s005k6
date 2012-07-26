   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 46 void TIM2_DeInit(void)
  43                     ; 47 {
  45                     	switch	.text
  46  0000               _TIM2_DeInit:
  50                     ; 49     TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  52  0000 725f5300      	clr	21248
  53                     ; 50     TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  55  0004 725f5301      	clr	21249
  56                     ; 51     TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  58  0008 725f5303      	clr	21251
  59                     ; 54     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  61  000c 725f5308      	clr	21256
  62                     ; 55     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  64  0010 725f5309      	clr	21257
  65                     ; 59     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  67  0014 725f5308      	clr	21256
  68                     ; 60     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  70  0018 725f5309      	clr	21257
  71                     ; 61     TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  73  001c 725f5305      	clr	21253
  74                     ; 62     TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  76  0020 725f5306      	clr	21254
  77                     ; 63     TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  79  0024 725f5307      	clr	21255
  80                     ; 64     TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  82  0028 725f530a      	clr	21258
  83                     ; 65     TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  85  002c 725f530b      	clr	21259
  86                     ; 66     TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  88  0030 725f530c      	clr	21260
  89                     ; 67     TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  91  0034 35ff530d      	mov	21261,#255
  92                     ; 68     TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  94  0038 35ff530e      	mov	21262,#255
  95                     ; 69     TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  97  003c 725f530f      	clr	21263
  98                     ; 70     TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 100  0040 725f5310      	clr	21264
 101                     ; 71     TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 103  0044 725f5311      	clr	21265
 104                     ; 72     TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 106  0048 725f5312      	clr	21266
 107                     ; 73     TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 109  004c 725f5313      	clr	21267
 110                     ; 74     TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 112  0050 725f5314      	clr	21268
 113                     ; 75     TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 115  0054 725f5302      	clr	21250
 116                     ; 76 }
 119  0058 81            	ret
 285                     ; 85 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 285                     ; 86                         uint16_t TIM2_Period)
 285                     ; 87 {
 286                     	switch	.text
 287  0059               _TIM2_TimeBaseInit:
 289  0059 88            	push	a
 290       00000000      OFST:	set	0
 293                     ; 89     TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 295  005a c7530c        	ld	21260,a
 296                     ; 91     TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 298  005d 7b04          	ld	a,(OFST+4,sp)
 299  005f c7530d        	ld	21261,a
 300                     ; 92     TIM2->ARRL = (uint8_t)(TIM2_Period);
 302  0062 7b05          	ld	a,(OFST+5,sp)
 303  0064 c7530e        	ld	21262,a
 304                     ; 93 }
 307  0067 84            	pop	a
 308  0068 81            	ret
 463                     ; 104 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 463                     ; 105                   TIM2_OutputState_TypeDef TIM2_OutputState,
 463                     ; 106                   uint16_t TIM2_Pulse,
 463                     ; 107                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 463                     ; 108 {
 464                     	switch	.text
 465  0069               _TIM2_OC1Init:
 467  0069 89            	pushw	x
 468  006a 88            	push	a
 469       00000001      OFST:	set	1
 472                     ; 110     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 474                     ; 111     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 476                     ; 112     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 478                     ; 115     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 480  006b c65308        	ld	a,21256
 481  006e a4fc          	and	a,#252
 482  0070 c75308        	ld	21256,a
 483                     ; 117     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 483                     ; 118                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 485  0073 7b08          	ld	a,(OFST+7,sp)
 486  0075 a402          	and	a,#2
 487  0077 6b01          	ld	(OFST+0,sp),a
 488  0079 9f            	ld	a,xl
 489  007a a401          	and	a,#1
 490  007c 1a01          	or	a,(OFST+0,sp)
 491  007e ca5308        	or	a,21256
 492  0081 c75308        	ld	21256,a
 493                     ; 121     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 493                     ; 122                             (uint8_t)TIM2_OCMode);
 495  0084 c65305        	ld	a,21253
 496  0087 a48f          	and	a,#143
 497  0089 1a02          	or	a,(OFST+1,sp)
 498  008b c75305        	ld	21253,a
 499                     ; 125     TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 501  008e 7b06          	ld	a,(OFST+5,sp)
 502  0090 c7530f        	ld	21263,a
 503                     ; 126     TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 505  0093 7b07          	ld	a,(OFST+6,sp)
 506  0095 c75310        	ld	21264,a
 507                     ; 127 }
 510  0098 5b03          	addw	sp,#3
 511  009a 81            	ret
 573                     ; 138 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 573                     ; 139                   TIM2_OutputState_TypeDef TIM2_OutputState,
 573                     ; 140                   uint16_t TIM2_Pulse,
 573                     ; 141                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 573                     ; 142 {
 574                     	switch	.text
 575  009b               _TIM2_OC2Init:
 577  009b 89            	pushw	x
 578  009c 88            	push	a
 579       00000001      OFST:	set	1
 582                     ; 144     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 584                     ; 145     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 586                     ; 146     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 588                     ; 150     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 590  009d c65308        	ld	a,21256
 591  00a0 a4cf          	and	a,#207
 592  00a2 c75308        	ld	21256,a
 593                     ; 152     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 593                     ; 153                         (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 595  00a5 7b08          	ld	a,(OFST+7,sp)
 596  00a7 a420          	and	a,#32
 597  00a9 6b01          	ld	(OFST+0,sp),a
 598  00ab 9f            	ld	a,xl
 599  00ac a410          	and	a,#16
 600  00ae 1a01          	or	a,(OFST+0,sp)
 601  00b0 ca5308        	or	a,21256
 602  00b3 c75308        	ld	21256,a
 603                     ; 157     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 603                     ; 158                             (uint8_t)TIM2_OCMode);
 605  00b6 c65306        	ld	a,21254
 606  00b9 a48f          	and	a,#143
 607  00bb 1a02          	or	a,(OFST+1,sp)
 608  00bd c75306        	ld	21254,a
 609                     ; 162     TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 611  00c0 7b06          	ld	a,(OFST+5,sp)
 612  00c2 c75311        	ld	21265,a
 613                     ; 163     TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 615  00c5 7b07          	ld	a,(OFST+6,sp)
 616  00c7 c75312        	ld	21266,a
 617                     ; 164 }
 620  00ca 5b03          	addw	sp,#3
 621  00cc 81            	ret
 683                     ; 175 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 683                     ; 176                   TIM2_OutputState_TypeDef TIM2_OutputState,
 683                     ; 177                   uint16_t TIM2_Pulse,
 683                     ; 178                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 683                     ; 179 {
 684                     	switch	.text
 685  00cd               _TIM2_OC3Init:
 687  00cd 89            	pushw	x
 688  00ce 88            	push	a
 689       00000001      OFST:	set	1
 692                     ; 181     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 694                     ; 182     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 696                     ; 183     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 698                     ; 185     TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 700  00cf c65309        	ld	a,21257
 701  00d2 a4fc          	and	a,#252
 702  00d4 c75309        	ld	21257,a
 703                     ; 187     TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 703                     ; 188                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 705  00d7 7b08          	ld	a,(OFST+7,sp)
 706  00d9 a402          	and	a,#2
 707  00db 6b01          	ld	(OFST+0,sp),a
 708  00dd 9f            	ld	a,xl
 709  00de a401          	and	a,#1
 710  00e0 1a01          	or	a,(OFST+0,sp)
 711  00e2 ca5309        	or	a,21257
 712  00e5 c75309        	ld	21257,a
 713                     ; 191     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 713                     ; 192                             (uint8_t)TIM2_OCMode);
 715  00e8 c65307        	ld	a,21255
 716  00eb a48f          	and	a,#143
 717  00ed 1a02          	or	a,(OFST+1,sp)
 718  00ef c75307        	ld	21255,a
 719                     ; 195     TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 721  00f2 7b06          	ld	a,(OFST+5,sp)
 722  00f4 c75313        	ld	21267,a
 723                     ; 196     TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 725  00f7 7b07          	ld	a,(OFST+6,sp)
 726  00f9 c75314        	ld	21268,a
 727                     ; 198 }
 730  00fc 5b03          	addw	sp,#3
 731  00fe 81            	ret
 922                     ; 210 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 922                     ; 211                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 922                     ; 212                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 922                     ; 213                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 922                     ; 214                  uint8_t TIM2_ICFilter)
 922                     ; 215 {
 923                     	switch	.text
 924  00ff               _TIM2_ICInit:
 926  00ff 89            	pushw	x
 927       00000000      OFST:	set	0
 930                     ; 217     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 932                     ; 218     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 934                     ; 219     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 936                     ; 220     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 938                     ; 221     assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 940                     ; 223     if (TIM2_Channel == TIM2_CHANNEL_1)
 942  0100 9e            	ld	a,xh
 943  0101 4d            	tnz	a
 944  0102 2614          	jrne	L763
 945                     ; 226         TI1_Config((uint8_t)TIM2_ICPolarity,
 945                     ; 227                    (uint8_t)TIM2_ICSelection,
 945                     ; 228                    (uint8_t)TIM2_ICFilter);
 947  0104 7b07          	ld	a,(OFST+7,sp)
 948  0106 88            	push	a
 949  0107 7b06          	ld	a,(OFST+6,sp)
 950  0109 97            	ld	xl,a
 951  010a 7b03          	ld	a,(OFST+3,sp)
 952  010c 95            	ld	xh,a
 953  010d cd044a        	call	L3_TI1_Config
 955  0110 84            	pop	a
 956                     ; 231         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 958  0111 7b06          	ld	a,(OFST+6,sp)
 959  0113 cd0340        	call	_TIM2_SetIC1Prescaler
 962  0116 202c          	jra	L173
 963  0118               L763:
 964                     ; 233     else if (TIM2_Channel == TIM2_CHANNEL_2)
 966  0118 7b01          	ld	a,(OFST+1,sp)
 967  011a a101          	cp	a,#1
 968  011c 2614          	jrne	L373
 969                     ; 236         TI2_Config((uint8_t)TIM2_ICPolarity,
 969                     ; 237                    (uint8_t)TIM2_ICSelection,
 969                     ; 238                    (uint8_t)TIM2_ICFilter);
 971  011e 7b07          	ld	a,(OFST+7,sp)
 972  0120 88            	push	a
 973  0121 7b06          	ld	a,(OFST+6,sp)
 974  0123 97            	ld	xl,a
 975  0124 7b03          	ld	a,(OFST+3,sp)
 976  0126 95            	ld	xh,a
 977  0127 cd047a        	call	L5_TI2_Config
 979  012a 84            	pop	a
 980                     ; 241         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 982  012b 7b06          	ld	a,(OFST+6,sp)
 983  012d cd034d        	call	_TIM2_SetIC2Prescaler
 986  0130 2012          	jra	L173
 987  0132               L373:
 988                     ; 246         TI3_Config((uint8_t)TIM2_ICPolarity,
 988                     ; 247                    (uint8_t)TIM2_ICSelection,
 988                     ; 248                    (uint8_t)TIM2_ICFilter);
 990  0132 7b07          	ld	a,(OFST+7,sp)
 991  0134 88            	push	a
 992  0135 7b06          	ld	a,(OFST+6,sp)
 993  0137 97            	ld	xl,a
 994  0138 7b03          	ld	a,(OFST+3,sp)
 995  013a 95            	ld	xh,a
 996  013b cd04aa        	call	L7_TI3_Config
 998  013e 84            	pop	a
 999                     ; 251         TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1001  013f 7b06          	ld	a,(OFST+6,sp)
1002  0141 cd035a        	call	_TIM2_SetIC3Prescaler
1004  0144               L173:
1005                     ; 253 }
1008  0144 85            	popw	x
1009  0145 81            	ret
1099                     ; 265 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1099                     ; 266                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1099                     ; 267                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1099                     ; 268                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1099                     ; 269                      uint8_t TIM2_ICFilter)
1099                     ; 270 {
1100                     	switch	.text
1101  0146               _TIM2_PWMIConfig:
1103  0146 89            	pushw	x
1104  0147 89            	pushw	x
1105       00000002      OFST:	set	2
1108                     ; 271     uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1110                     ; 272     uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1112                     ; 275     assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1114                     ; 276     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1116                     ; 277     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1118                     ; 278     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1120                     ; 281     if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1122  0148 9f            	ld	a,xl
1123  0149 a144          	cp	a,#68
1124  014b 2706          	jreq	L734
1125                     ; 283         icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1127  014d a644          	ld	a,#68
1128  014f 6b01          	ld	(OFST-1,sp),a
1130  0151 2002          	jra	L144
1131  0153               L734:
1132                     ; 287         icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1134  0153 0f01          	clr	(OFST-1,sp)
1135  0155               L144:
1136                     ; 291     if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1138  0155 7b07          	ld	a,(OFST+5,sp)
1139  0157 a101          	cp	a,#1
1140  0159 2606          	jrne	L344
1141                     ; 293         icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1143  015b a602          	ld	a,#2
1144  015d 6b02          	ld	(OFST+0,sp),a
1146  015f 2004          	jra	L544
1147  0161               L344:
1148                     ; 297         icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1150  0161 a601          	ld	a,#1
1151  0163 6b02          	ld	(OFST+0,sp),a
1152  0165               L544:
1153                     ; 300     if (TIM2_Channel == TIM2_CHANNEL_1)
1155  0165 0d03          	tnz	(OFST+1,sp)
1156  0167 2626          	jrne	L744
1157                     ; 303         TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1157                     ; 304                    (uint8_t)TIM2_ICFilter);
1159  0169 7b09          	ld	a,(OFST+7,sp)
1160  016b 88            	push	a
1161  016c 7b08          	ld	a,(OFST+6,sp)
1162  016e 97            	ld	xl,a
1163  016f 7b05          	ld	a,(OFST+3,sp)
1164  0171 95            	ld	xh,a
1165  0172 cd044a        	call	L3_TI1_Config
1167  0175 84            	pop	a
1168                     ; 307         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1170  0176 7b08          	ld	a,(OFST+6,sp)
1171  0178 cd0340        	call	_TIM2_SetIC1Prescaler
1173                     ; 310         TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1175  017b 7b09          	ld	a,(OFST+7,sp)
1176  017d 88            	push	a
1177  017e 7b03          	ld	a,(OFST+1,sp)
1178  0180 97            	ld	xl,a
1179  0181 7b02          	ld	a,(OFST+0,sp)
1180  0183 95            	ld	xh,a
1181  0184 cd047a        	call	L5_TI2_Config
1183  0187 84            	pop	a
1184                     ; 313         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1186  0188 7b08          	ld	a,(OFST+6,sp)
1187  018a cd034d        	call	_TIM2_SetIC2Prescaler
1190  018d 2024          	jra	L154
1191  018f               L744:
1192                     ; 318         TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1192                     ; 319                    (uint8_t)TIM2_ICFilter);
1194  018f 7b09          	ld	a,(OFST+7,sp)
1195  0191 88            	push	a
1196  0192 7b08          	ld	a,(OFST+6,sp)
1197  0194 97            	ld	xl,a
1198  0195 7b05          	ld	a,(OFST+3,sp)
1199  0197 95            	ld	xh,a
1200  0198 cd047a        	call	L5_TI2_Config
1202  019b 84            	pop	a
1203                     ; 322         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1205  019c 7b08          	ld	a,(OFST+6,sp)
1206  019e cd034d        	call	_TIM2_SetIC2Prescaler
1208                     ; 325         TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1210  01a1 7b09          	ld	a,(OFST+7,sp)
1211  01a3 88            	push	a
1212  01a4 7b03          	ld	a,(OFST+1,sp)
1213  01a6 97            	ld	xl,a
1214  01a7 7b02          	ld	a,(OFST+0,sp)
1215  01a9 95            	ld	xh,a
1216  01aa cd044a        	call	L3_TI1_Config
1218  01ad 84            	pop	a
1219                     ; 328         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1221  01ae 7b08          	ld	a,(OFST+6,sp)
1222  01b0 cd0340        	call	_TIM2_SetIC1Prescaler
1224  01b3               L154:
1225                     ; 330 }
1228  01b3 5b04          	addw	sp,#4
1229  01b5 81            	ret
1284                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1284                     ; 340 {
1285                     	switch	.text
1286  01b6               _TIM2_Cmd:
1290                     ; 342     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1292                     ; 345     if (NewState != DISABLE)
1294  01b6 4d            	tnz	a
1295  01b7 2706          	jreq	L105
1296                     ; 347         TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1298  01b9 72105300      	bset	21248,#0
1300  01bd 2004          	jra	L305
1301  01bf               L105:
1302                     ; 351         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1304  01bf 72115300      	bres	21248,#0
1305  01c3               L305:
1306                     ; 353 }
1309  01c3 81            	ret
1388                     ; 369 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1388                     ; 370 {
1389                     	switch	.text
1390  01c4               _TIM2_ITConfig:
1392  01c4 89            	pushw	x
1393       00000000      OFST:	set	0
1396                     ; 372     assert_param(IS_TIM2_IT_OK(TIM2_IT));
1398                     ; 373     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1400                     ; 375     if (NewState != DISABLE)
1402  01c5 9f            	ld	a,xl
1403  01c6 4d            	tnz	a
1404  01c7 2709          	jreq	L345
1405                     ; 378         TIM2->IER |= (uint8_t)TIM2_IT;
1407  01c9 9e            	ld	a,xh
1408  01ca ca5301        	or	a,21249
1409  01cd c75301        	ld	21249,a
1411  01d0 2009          	jra	L545
1412  01d2               L345:
1413                     ; 383         TIM2->IER &= (uint8_t)(~TIM2_IT);
1415  01d2 7b01          	ld	a,(OFST+1,sp)
1416  01d4 43            	cpl	a
1417  01d5 c45301        	and	a,21249
1418  01d8 c75301        	ld	21249,a
1419  01db               L545:
1420                     ; 385 }
1423  01db 85            	popw	x
1424  01dc 81            	ret
1460                     ; 394 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1460                     ; 395 {
1461                     	switch	.text
1462  01dd               _TIM2_UpdateDisableConfig:
1466                     ; 397     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1468                     ; 400     if (NewState != DISABLE)
1470  01dd 4d            	tnz	a
1471  01de 2706          	jreq	L565
1472                     ; 402         TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1474  01e0 72125300      	bset	21248,#1
1476  01e4 2004          	jra	L765
1477  01e6               L565:
1478                     ; 406         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1480  01e6 72135300      	bres	21248,#1
1481  01ea               L765:
1482                     ; 408 }
1485  01ea 81            	ret
1543                     ; 418 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1543                     ; 419 {
1544                     	switch	.text
1545  01eb               _TIM2_UpdateRequestConfig:
1549                     ; 421     assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1551                     ; 424     if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1553  01eb 4d            	tnz	a
1554  01ec 2706          	jreq	L716
1555                     ; 426         TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1557  01ee 72145300      	bset	21248,#2
1559  01f2 2004          	jra	L126
1560  01f4               L716:
1561                     ; 430         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1563  01f4 72155300      	bres	21248,#2
1564  01f8               L126:
1565                     ; 432 }
1568  01f8 81            	ret
1625                     ; 443 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1625                     ; 444 {
1626                     	switch	.text
1627  01f9               _TIM2_SelectOnePulseMode:
1631                     ; 446     assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1633                     ; 449     if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1635  01f9 4d            	tnz	a
1636  01fa 2706          	jreq	L156
1637                     ; 451         TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1639  01fc 72165300      	bset	21248,#3
1641  0200 2004          	jra	L356
1642  0202               L156:
1643                     ; 455         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1645  0202 72175300      	bres	21248,#3
1646  0206               L356:
1647                     ; 458 }
1650  0206 81            	ret
1718                     ; 489 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1718                     ; 490                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1718                     ; 491 {
1719                     	switch	.text
1720  0207               _TIM2_PrescalerConfig:
1724                     ; 493     assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1726                     ; 494     assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1728                     ; 497     TIM2->PSCR = (uint8_t)Prescaler;
1730  0207 9e            	ld	a,xh
1731  0208 c7530c        	ld	21260,a
1732                     ; 500     TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1734  020b 9f            	ld	a,xl
1735  020c c75304        	ld	21252,a
1736                     ; 501 }
1739  020f 81            	ret
1797                     ; 512 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1797                     ; 513 {
1798                     	switch	.text
1799  0210               _TIM2_ForcedOC1Config:
1801  0210 88            	push	a
1802       00000000      OFST:	set	0
1805                     ; 515     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1807                     ; 518     TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1807                     ; 519                               | (uint8_t)TIM2_ForcedAction);
1809  0211 c65305        	ld	a,21253
1810  0214 a48f          	and	a,#143
1811  0216 1a01          	or	a,(OFST+1,sp)
1812  0218 c75305        	ld	21253,a
1813                     ; 520 }
1816  021b 84            	pop	a
1817  021c 81            	ret
1853                     ; 531 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1853                     ; 532 {
1854                     	switch	.text
1855  021d               _TIM2_ForcedOC2Config:
1857  021d 88            	push	a
1858       00000000      OFST:	set	0
1861                     ; 534     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1863                     ; 537     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1863                     ; 538                             | (uint8_t)TIM2_ForcedAction);
1865  021e c65306        	ld	a,21254
1866  0221 a48f          	and	a,#143
1867  0223 1a01          	or	a,(OFST+1,sp)
1868  0225 c75306        	ld	21254,a
1869                     ; 539 }
1872  0228 84            	pop	a
1873  0229 81            	ret
1909                     ; 550 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1909                     ; 551 {
1910                     	switch	.text
1911  022a               _TIM2_ForcedOC3Config:
1913  022a 88            	push	a
1914       00000000      OFST:	set	0
1917                     ; 553     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1919                     ; 556     TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1919                     ; 557                               | (uint8_t)TIM2_ForcedAction);
1921  022b c65307        	ld	a,21255
1922  022e a48f          	and	a,#143
1923  0230 1a01          	or	a,(OFST+1,sp)
1924  0232 c75307        	ld	21255,a
1925                     ; 558 }
1928  0235 84            	pop	a
1929  0236 81            	ret
1965                     ; 567 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1965                     ; 568 {
1966                     	switch	.text
1967  0237               _TIM2_ARRPreloadConfig:
1971                     ; 570     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1973                     ; 573     if (NewState != DISABLE)
1975  0237 4d            	tnz	a
1976  0238 2706          	jreq	L7001
1977                     ; 575         TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
1979  023a 721e5300      	bset	21248,#7
1981  023e 2004          	jra	L1101
1982  0240               L7001:
1983                     ; 579         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
1985  0240 721f5300      	bres	21248,#7
1986  0244               L1101:
1987                     ; 581 }
1990  0244 81            	ret
2026                     ; 590 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2026                     ; 591 {
2027                     	switch	.text
2028  0245               _TIM2_OC1PreloadConfig:
2032                     ; 593     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2034                     ; 596     if (NewState != DISABLE)
2036  0245 4d            	tnz	a
2037  0246 2706          	jreq	L1301
2038                     ; 598         TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2040  0248 72165305      	bset	21253,#3
2042  024c 2004          	jra	L3301
2043  024e               L1301:
2044                     ; 602         TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2046  024e 72175305      	bres	21253,#3
2047  0252               L3301:
2048                     ; 604 }
2051  0252 81            	ret
2087                     ; 613 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2087                     ; 614 {
2088                     	switch	.text
2089  0253               _TIM2_OC2PreloadConfig:
2093                     ; 616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2095                     ; 619     if (NewState != DISABLE)
2097  0253 4d            	tnz	a
2098  0254 2706          	jreq	L3501
2099                     ; 621         TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2101  0256 72165306      	bset	21254,#3
2103  025a 2004          	jra	L5501
2104  025c               L3501:
2105                     ; 625         TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2107  025c 72175306      	bres	21254,#3
2108  0260               L5501:
2109                     ; 627 }
2112  0260 81            	ret
2148                     ; 636 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2148                     ; 637 {
2149                     	switch	.text
2150  0261               _TIM2_OC3PreloadConfig:
2154                     ; 639     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2156                     ; 642     if (NewState != DISABLE)
2158  0261 4d            	tnz	a
2159  0262 2706          	jreq	L5701
2160                     ; 644         TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2162  0264 72165307      	bset	21255,#3
2164  0268 2004          	jra	L7701
2165  026a               L5701:
2166                     ; 648         TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2168  026a 72175307      	bres	21255,#3
2169  026e               L7701:
2170                     ; 650 }
2173  026e 81            	ret
2246                     ; 663 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2246                     ; 664 {
2247                     	switch	.text
2248  026f               _TIM2_GenerateEvent:
2252                     ; 666     assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2254                     ; 669     TIM2->EGR = (uint8_t)TIM2_EventSource;
2256  026f c75304        	ld	21252,a
2257                     ; 670 }
2260  0272 81            	ret
2296                     ; 681 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2296                     ; 682 {
2297                     	switch	.text
2298  0273               _TIM2_OC1PolarityConfig:
2302                     ; 684     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2304                     ; 687     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2306  0273 4d            	tnz	a
2307  0274 2706          	jreq	L1511
2308                     ; 689         TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2310  0276 72125308      	bset	21256,#1
2312  027a 2004          	jra	L3511
2313  027c               L1511:
2314                     ; 693         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2316  027c 72135308      	bres	21256,#1
2317  0280               L3511:
2318                     ; 695 }
2321  0280 81            	ret
2357                     ; 706 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2357                     ; 707 {
2358                     	switch	.text
2359  0281               _TIM2_OC2PolarityConfig:
2363                     ; 709     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2365                     ; 712     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2367  0281 4d            	tnz	a
2368  0282 2706          	jreq	L3711
2369                     ; 714         TIM2->CCER1 |= TIM2_CCER1_CC2P;
2371  0284 721a5308      	bset	21256,#5
2373  0288 2004          	jra	L5711
2374  028a               L3711:
2375                     ; 718         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2377  028a 721b5308      	bres	21256,#5
2378  028e               L5711:
2379                     ; 720 }
2382  028e 81            	ret
2418                     ; 731 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2418                     ; 732 {
2419                     	switch	.text
2420  028f               _TIM2_OC3PolarityConfig:
2424                     ; 734     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2426                     ; 737     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2428  028f 4d            	tnz	a
2429  0290 2706          	jreq	L5121
2430                     ; 739         TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2432  0292 72125309      	bset	21257,#1
2434  0296 2004          	jra	L7121
2435  0298               L5121:
2436                     ; 743         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2438  0298 72135309      	bres	21257,#1
2439  029c               L7121:
2440                     ; 745 }
2443  029c 81            	ret
2488                     ; 759 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2488                     ; 760 {
2489                     	switch	.text
2490  029d               _TIM2_CCxCmd:
2492  029d 89            	pushw	x
2493       00000000      OFST:	set	0
2496                     ; 762     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2498                     ; 763     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2500                     ; 765     if (TIM2_Channel == TIM2_CHANNEL_1)
2502  029e 9e            	ld	a,xh
2503  029f 4d            	tnz	a
2504  02a0 2610          	jrne	L3421
2505                     ; 768         if (NewState != DISABLE)
2507  02a2 9f            	ld	a,xl
2508  02a3 4d            	tnz	a
2509  02a4 2706          	jreq	L5421
2510                     ; 770             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2512  02a6 72105308      	bset	21256,#0
2514  02aa 202a          	jra	L1521
2515  02ac               L5421:
2516                     ; 774             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2518  02ac 72115308      	bres	21256,#0
2519  02b0 2024          	jra	L1521
2520  02b2               L3421:
2521                     ; 778     else if (TIM2_Channel == TIM2_CHANNEL_2)
2523  02b2 7b01          	ld	a,(OFST+1,sp)
2524  02b4 a101          	cp	a,#1
2525  02b6 2610          	jrne	L3521
2526                     ; 781         if (NewState != DISABLE)
2528  02b8 0d02          	tnz	(OFST+2,sp)
2529  02ba 2706          	jreq	L5521
2530                     ; 783             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2532  02bc 72185308      	bset	21256,#4
2534  02c0 2014          	jra	L1521
2535  02c2               L5521:
2536                     ; 787             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2538  02c2 72195308      	bres	21256,#4
2539  02c6 200e          	jra	L1521
2540  02c8               L3521:
2541                     ; 793         if (NewState != DISABLE)
2543  02c8 0d02          	tnz	(OFST+2,sp)
2544  02ca 2706          	jreq	L3621
2545                     ; 795             TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2547  02cc 72105309      	bset	21257,#0
2549  02d0 2004          	jra	L1521
2550  02d2               L3621:
2551                     ; 799             TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2553  02d2 72115309      	bres	21257,#0
2554  02d6               L1521:
2555                     ; 802 }
2558  02d6 85            	popw	x
2559  02d7 81            	ret
2604                     ; 824 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2604                     ; 825 {
2605                     	switch	.text
2606  02d8               _TIM2_SelectOCxM:
2608  02d8 89            	pushw	x
2609       00000000      OFST:	set	0
2612                     ; 827     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2614                     ; 828     assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2616                     ; 830     if (TIM2_Channel == TIM2_CHANNEL_1)
2618  02d9 9e            	ld	a,xh
2619  02da 4d            	tnz	a
2620  02db 2610          	jrne	L1131
2621                     ; 833         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2623  02dd 72115308      	bres	21256,#0
2624                     ; 836         TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2624                     ; 837                                | (uint8_t)TIM2_OCMode);
2626  02e1 c65305        	ld	a,21253
2627  02e4 a48f          	and	a,#143
2628  02e6 1a02          	or	a,(OFST+2,sp)
2629  02e8 c75305        	ld	21253,a
2631  02eb 2024          	jra	L3131
2632  02ed               L1131:
2633                     ; 839     else if (TIM2_Channel == TIM2_CHANNEL_2)
2635  02ed 7b01          	ld	a,(OFST+1,sp)
2636  02ef a101          	cp	a,#1
2637  02f1 2610          	jrne	L5131
2638                     ; 842         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2640  02f3 72195308      	bres	21256,#4
2641                     ; 845         TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2641                     ; 846                                 | (uint8_t)TIM2_OCMode);
2643  02f7 c65306        	ld	a,21254
2644  02fa a48f          	and	a,#143
2645  02fc 1a02          	or	a,(OFST+2,sp)
2646  02fe c75306        	ld	21254,a
2648  0301 200e          	jra	L3131
2649  0303               L5131:
2650                     ; 851         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2652  0303 72115309      	bres	21257,#0
2653                     ; 854         TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2653                     ; 855                                 | (uint8_t)TIM2_OCMode);
2655  0307 c65307        	ld	a,21255
2656  030a a48f          	and	a,#143
2657  030c 1a02          	or	a,(OFST+2,sp)
2658  030e c75307        	ld	21255,a
2659  0311               L3131:
2660                     ; 857 }
2663  0311 85            	popw	x
2664  0312 81            	ret
2696                     ; 866 void TIM2_SetCounter(uint16_t Counter)
2696                     ; 867 {
2697                     	switch	.text
2698  0313               _TIM2_SetCounter:
2702                     ; 869     TIM2->CNTRH = (uint8_t)(Counter >> 8);
2704  0313 9e            	ld	a,xh
2705  0314 c7530a        	ld	21258,a
2706                     ; 870     TIM2->CNTRL = (uint8_t)(Counter);
2708  0317 9f            	ld	a,xl
2709  0318 c7530b        	ld	21259,a
2710                     ; 872 }
2713  031b 81            	ret
2745                     ; 881 void TIM2_SetAutoreload(uint16_t Autoreload)
2745                     ; 882 {
2746                     	switch	.text
2747  031c               _TIM2_SetAutoreload:
2751                     ; 885     TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2753  031c 9e            	ld	a,xh
2754  031d c7530d        	ld	21261,a
2755                     ; 886     TIM2->ARRL = (uint8_t)(Autoreload);
2757  0320 9f            	ld	a,xl
2758  0321 c7530e        	ld	21262,a
2759                     ; 888 }
2762  0324 81            	ret
2794                     ; 897 void TIM2_SetCompare1(uint16_t Compare1)
2794                     ; 898 {
2795                     	switch	.text
2796  0325               _TIM2_SetCompare1:
2800                     ; 900     TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2802  0325 9e            	ld	a,xh
2803  0326 c7530f        	ld	21263,a
2804                     ; 901     TIM2->CCR1L = (uint8_t)(Compare1);
2806  0329 9f            	ld	a,xl
2807  032a c75310        	ld	21264,a
2808                     ; 903 }
2811  032d 81            	ret
2843                     ; 912 void TIM2_SetCompare2(uint16_t Compare2)
2843                     ; 913 {
2844                     	switch	.text
2845  032e               _TIM2_SetCompare2:
2849                     ; 915     TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2851  032e 9e            	ld	a,xh
2852  032f c75311        	ld	21265,a
2853                     ; 916     TIM2->CCR2L = (uint8_t)(Compare2);
2855  0332 9f            	ld	a,xl
2856  0333 c75312        	ld	21266,a
2857                     ; 918 }
2860  0336 81            	ret
2892                     ; 927 void TIM2_SetCompare3(uint16_t Compare3)
2892                     ; 928 {
2893                     	switch	.text
2894  0337               _TIM2_SetCompare3:
2898                     ; 930     TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2900  0337 9e            	ld	a,xh
2901  0338 c75313        	ld	21267,a
2902                     ; 931     TIM2->CCR3L = (uint8_t)(Compare3);
2904  033b 9f            	ld	a,xl
2905  033c c75314        	ld	21268,a
2906                     ; 933 }
2909  033f 81            	ret
2945                     ; 946 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2945                     ; 947 {
2946                     	switch	.text
2947  0340               _TIM2_SetIC1Prescaler:
2949  0340 88            	push	a
2950       00000000      OFST:	set	0
2953                     ; 949     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2955                     ; 952     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2955                     ; 953                             | (uint8_t)TIM2_IC1Prescaler);
2957  0341 c65305        	ld	a,21253
2958  0344 a4f3          	and	a,#243
2959  0346 1a01          	or	a,(OFST+1,sp)
2960  0348 c75305        	ld	21253,a
2961                     ; 954 }
2964  034b 84            	pop	a
2965  034c 81            	ret
3001                     ; 966 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3001                     ; 967 {
3002                     	switch	.text
3003  034d               _TIM2_SetIC2Prescaler:
3005  034d 88            	push	a
3006       00000000      OFST:	set	0
3009                     ; 969     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3011                     ; 972     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3011                     ; 973                             | (uint8_t)TIM2_IC2Prescaler);
3013  034e c65306        	ld	a,21254
3014  0351 a4f3          	and	a,#243
3015  0353 1a01          	or	a,(OFST+1,sp)
3016  0355 c75306        	ld	21254,a
3017                     ; 974 }
3020  0358 84            	pop	a
3021  0359 81            	ret
3057                     ; 986 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3057                     ; 987 {
3058                     	switch	.text
3059  035a               _TIM2_SetIC3Prescaler:
3061  035a 88            	push	a
3062       00000000      OFST:	set	0
3065                     ; 990     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3067                     ; 992     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3067                     ; 993                             | (uint8_t)TIM2_IC3Prescaler);
3069  035b c65307        	ld	a,21255
3070  035e a4f3          	and	a,#243
3071  0360 1a01          	or	a,(OFST+1,sp)
3072  0362 c75307        	ld	21255,a
3073                     ; 994 }
3076  0365 84            	pop	a
3077  0366 81            	ret
3123                     ; 1001 uint16_t TIM2_GetCapture1(void)
3123                     ; 1002 {
3124                     	switch	.text
3125  0367               _TIM2_GetCapture1:
3127  0367 5204          	subw	sp,#4
3128       00000004      OFST:	set	4
3131                     ; 1004     uint16_t tmpccr1 = 0;
3133                     ; 1005     uint8_t tmpccr1l=0, tmpccr1h=0;
3137                     ; 1007     tmpccr1h = TIM2->CCR1H;
3139  0369 c6530f        	ld	a,21263
3140  036c 6b02          	ld	(OFST-2,sp),a
3141                     ; 1008     tmpccr1l = TIM2->CCR1L;
3143  036e c65310        	ld	a,21264
3144  0371 6b01          	ld	(OFST-3,sp),a
3145                     ; 1010     tmpccr1 = (uint16_t)(tmpccr1l);
3147  0373 7b01          	ld	a,(OFST-3,sp)
3148  0375 5f            	clrw	x
3149  0376 97            	ld	xl,a
3150  0377 1f03          	ldw	(OFST-1,sp),x
3151                     ; 1011     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3153  0379 7b02          	ld	a,(OFST-2,sp)
3154  037b 5f            	clrw	x
3155  037c 97            	ld	xl,a
3156  037d 4f            	clr	a
3157  037e 02            	rlwa	x,a
3158  037f 01            	rrwa	x,a
3159  0380 1a04          	or	a,(OFST+0,sp)
3160  0382 01            	rrwa	x,a
3161  0383 1a03          	or	a,(OFST-1,sp)
3162  0385 01            	rrwa	x,a
3163  0386 1f03          	ldw	(OFST-1,sp),x
3164                     ; 1013     return (uint16_t)tmpccr1;
3166  0388 1e03          	ldw	x,(OFST-1,sp)
3169  038a 5b04          	addw	sp,#4
3170  038c 81            	ret
3216                     ; 1021 uint16_t TIM2_GetCapture2(void)
3216                     ; 1022 {
3217                     	switch	.text
3218  038d               _TIM2_GetCapture2:
3220  038d 5204          	subw	sp,#4
3221       00000004      OFST:	set	4
3224                     ; 1024     uint16_t tmpccr2 = 0;
3226                     ; 1025     uint8_t tmpccr2l=0, tmpccr2h=0;
3230                     ; 1027     tmpccr2h = TIM2->CCR2H;
3232  038f c65311        	ld	a,21265
3233  0392 6b02          	ld	(OFST-2,sp),a
3234                     ; 1028     tmpccr2l = TIM2->CCR2L;
3236  0394 c65312        	ld	a,21266
3237  0397 6b01          	ld	(OFST-3,sp),a
3238                     ; 1030     tmpccr2 = (uint16_t)(tmpccr2l);
3240  0399 7b01          	ld	a,(OFST-3,sp)
3241  039b 5f            	clrw	x
3242  039c 97            	ld	xl,a
3243  039d 1f03          	ldw	(OFST-1,sp),x
3244                     ; 1031     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3246  039f 7b02          	ld	a,(OFST-2,sp)
3247  03a1 5f            	clrw	x
3248  03a2 97            	ld	xl,a
3249  03a3 4f            	clr	a
3250  03a4 02            	rlwa	x,a
3251  03a5 01            	rrwa	x,a
3252  03a6 1a04          	or	a,(OFST+0,sp)
3253  03a8 01            	rrwa	x,a
3254  03a9 1a03          	or	a,(OFST-1,sp)
3255  03ab 01            	rrwa	x,a
3256  03ac 1f03          	ldw	(OFST-1,sp),x
3257                     ; 1033     return (uint16_t)tmpccr2;
3259  03ae 1e03          	ldw	x,(OFST-1,sp)
3262  03b0 5b04          	addw	sp,#4
3263  03b2 81            	ret
3309                     ; 1041 uint16_t TIM2_GetCapture3(void)
3309                     ; 1042 {
3310                     	switch	.text
3311  03b3               _TIM2_GetCapture3:
3313  03b3 5204          	subw	sp,#4
3314       00000004      OFST:	set	4
3317                     ; 1044     uint16_t tmpccr3 = 0;
3319                     ; 1045     uint8_t tmpccr3l=0, tmpccr3h=0;
3323                     ; 1047     tmpccr3h = TIM2->CCR3H;
3325  03b5 c65313        	ld	a,21267
3326  03b8 6b02          	ld	(OFST-2,sp),a
3327                     ; 1048     tmpccr3l = TIM2->CCR3L;
3329  03ba c65314        	ld	a,21268
3330  03bd 6b01          	ld	(OFST-3,sp),a
3331                     ; 1050     tmpccr3 = (uint16_t)(tmpccr3l);
3333  03bf 7b01          	ld	a,(OFST-3,sp)
3334  03c1 5f            	clrw	x
3335  03c2 97            	ld	xl,a
3336  03c3 1f03          	ldw	(OFST-1,sp),x
3337                     ; 1051     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3339  03c5 7b02          	ld	a,(OFST-2,sp)
3340  03c7 5f            	clrw	x
3341  03c8 97            	ld	xl,a
3342  03c9 4f            	clr	a
3343  03ca 02            	rlwa	x,a
3344  03cb 01            	rrwa	x,a
3345  03cc 1a04          	or	a,(OFST+0,sp)
3346  03ce 01            	rrwa	x,a
3347  03cf 1a03          	or	a,(OFST-1,sp)
3348  03d1 01            	rrwa	x,a
3349  03d2 1f03          	ldw	(OFST-1,sp),x
3350                     ; 1053     return (uint16_t)tmpccr3;
3352  03d4 1e03          	ldw	x,(OFST-1,sp)
3355  03d6 5b04          	addw	sp,#4
3356  03d8 81            	ret
3388                     ; 1061 uint16_t TIM2_GetCounter(void)
3388                     ; 1062 {
3389                     	switch	.text
3390  03d9               _TIM2_GetCounter:
3392  03d9 89            	pushw	x
3393       00000002      OFST:	set	2
3396                     ; 1063      uint16_t tmpcntr = 0;
3398                     ; 1065     tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3400  03da c6530a        	ld	a,21258
3401  03dd 5f            	clrw	x
3402  03de 97            	ld	xl,a
3403  03df 4f            	clr	a
3404  03e0 02            	rlwa	x,a
3405  03e1 1f01          	ldw	(OFST-1,sp),x
3406                     ; 1067     return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3408  03e3 c6530b        	ld	a,21259
3409  03e6 5f            	clrw	x
3410  03e7 97            	ld	xl,a
3411  03e8 01            	rrwa	x,a
3412  03e9 1a02          	or	a,(OFST+0,sp)
3413  03eb 01            	rrwa	x,a
3414  03ec 1a01          	or	a,(OFST-1,sp)
3415  03ee 01            	rrwa	x,a
3418  03ef 5b02          	addw	sp,#2
3419  03f1 81            	ret
3443                     ; 1076 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3443                     ; 1077 {
3444                     	switch	.text
3445  03f2               _TIM2_GetPrescaler:
3449                     ; 1079     return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3451  03f2 c6530c        	ld	a,21260
3454  03f5 81            	ret
3589                     ; 1096 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3589                     ; 1097 {
3590                     	switch	.text
3591  03f6               _TIM2_GetFlagStatus:
3593  03f6 89            	pushw	x
3594  03f7 89            	pushw	x
3595       00000002      OFST:	set	2
3598                     ; 1098     FlagStatus bitstatus = RESET;
3600                     ; 1099     uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3604                     ; 1102     assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3606                     ; 1104     tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3608  03f8 9f            	ld	a,xl
3609  03f9 c45302        	and	a,21250
3610  03fc 6b01          	ld	(OFST-1,sp),a
3611                     ; 1105     tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3613  03fe 7b03          	ld	a,(OFST+1,sp)
3614  0400 6b02          	ld	(OFST+0,sp),a
3615                     ; 1107     if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3617  0402 c65303        	ld	a,21251
3618  0405 1402          	and	a,(OFST+0,sp)
3619  0407 1a01          	or	a,(OFST-1,sp)
3620  0409 2706          	jreq	L3561
3621                     ; 1109         bitstatus = SET;
3623  040b a601          	ld	a,#1
3624  040d 6b02          	ld	(OFST+0,sp),a
3626  040f 2002          	jra	L5561
3627  0411               L3561:
3628                     ; 1113         bitstatus = RESET;
3630  0411 0f02          	clr	(OFST+0,sp)
3631  0413               L5561:
3632                     ; 1115     return (FlagStatus)bitstatus;
3634  0413 7b02          	ld	a,(OFST+0,sp)
3637  0415 5b04          	addw	sp,#4
3638  0417 81            	ret
3673                     ; 1132 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3673                     ; 1133 {
3674                     	switch	.text
3675  0418               _TIM2_ClearFlag:
3679                     ; 1135     assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3681                     ; 1138     TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3683  0418 9f            	ld	a,xl
3684  0419 43            	cpl	a
3685  041a c75302        	ld	21250,a
3686                     ; 1139     TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3688  041d 35ff5303      	mov	21251,#255
3689                     ; 1140 }
3692  0421 81            	ret
3752                     ; 1154 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3752                     ; 1155 {
3753                     	switch	.text
3754  0422               _TIM2_GetITStatus:
3756  0422 88            	push	a
3757  0423 89            	pushw	x
3758       00000002      OFST:	set	2
3761                     ; 1156     ITStatus bitstatus = RESET;
3763                     ; 1157     uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3767                     ; 1160     assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3769                     ; 1162     TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3771  0424 c45302        	and	a,21250
3772  0427 6b01          	ld	(OFST-1,sp),a
3773                     ; 1164     TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3775  0429 c65301        	ld	a,21249
3776  042c 1403          	and	a,(OFST+1,sp)
3777  042e 6b02          	ld	(OFST+0,sp),a
3778                     ; 1166     if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3780  0430 0d01          	tnz	(OFST-1,sp)
3781  0432 270a          	jreq	L3271
3783  0434 0d02          	tnz	(OFST+0,sp)
3784  0436 2706          	jreq	L3271
3785                     ; 1168         bitstatus = SET;
3787  0438 a601          	ld	a,#1
3788  043a 6b02          	ld	(OFST+0,sp),a
3790  043c 2002          	jra	L5271
3791  043e               L3271:
3792                     ; 1172         bitstatus = RESET;
3794  043e 0f02          	clr	(OFST+0,sp)
3795  0440               L5271:
3796                     ; 1174     return (ITStatus)(bitstatus);
3798  0440 7b02          	ld	a,(OFST+0,sp)
3801  0442 5b03          	addw	sp,#3
3802  0444 81            	ret
3838                     ; 1188 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3838                     ; 1189 {
3839                     	switch	.text
3840  0445               _TIM2_ClearITPendingBit:
3844                     ; 1191     assert_param(IS_TIM2_IT_OK(TIM2_IT));
3846                     ; 1194     TIM2->SR1 = (uint8_t)(~TIM2_IT);
3848  0445 43            	cpl	a
3849  0446 c75302        	ld	21250,a
3850                     ; 1195 }
3853  0449 81            	ret
3899                     ; 1214 static void TI1_Config(uint8_t TIM2_ICPolarity,
3899                     ; 1215                        uint8_t TIM2_ICSelection,
3899                     ; 1216                        uint8_t TIM2_ICFilter)
3899                     ; 1217 {
3900                     	switch	.text
3901  044a               L3_TI1_Config:
3903  044a 89            	pushw	x
3904  044b 88            	push	a
3905       00000001      OFST:	set	1
3908                     ; 1219     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3910  044c 72115308      	bres	21256,#0
3911                     ; 1222     TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3911                     ; 1223                              | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3913  0450 7b06          	ld	a,(OFST+5,sp)
3914  0452 97            	ld	xl,a
3915  0453 a610          	ld	a,#16
3916  0455 42            	mul	x,a
3917  0456 9f            	ld	a,xl
3918  0457 1a03          	or	a,(OFST+2,sp)
3919  0459 6b01          	ld	(OFST+0,sp),a
3920  045b c65305        	ld	a,21253
3921  045e a40c          	and	a,#12
3922  0460 1a01          	or	a,(OFST+0,sp)
3923  0462 c75305        	ld	21253,a
3924                     ; 1226     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3926  0465 0d02          	tnz	(OFST+1,sp)
3927  0467 2706          	jreq	L5671
3928                     ; 1228         TIM2->CCER1 |= TIM2_CCER1_CC1P;
3930  0469 72125308      	bset	21256,#1
3932  046d 2004          	jra	L7671
3933  046f               L5671:
3934                     ; 1232         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3936  046f 72135308      	bres	21256,#1
3937  0473               L7671:
3938                     ; 1235     TIM2->CCER1 |= TIM2_CCER1_CC1E;
3940  0473 72105308      	bset	21256,#0
3941                     ; 1236 }
3944  0477 5b03          	addw	sp,#3
3945  0479 81            	ret
3991                     ; 1255 static void TI2_Config(uint8_t TIM2_ICPolarity,
3991                     ; 1256                        uint8_t TIM2_ICSelection,
3991                     ; 1257                        uint8_t TIM2_ICFilter)
3991                     ; 1258 {
3992                     	switch	.text
3993  047a               L5_TI2_Config:
3995  047a 89            	pushw	x
3996  047b 88            	push	a
3997       00000001      OFST:	set	1
4000                     ; 1260     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4002  047c 72195308      	bres	21256,#4
4003                     ; 1263     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4003                     ; 1264                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4005  0480 7b06          	ld	a,(OFST+5,sp)
4006  0482 97            	ld	xl,a
4007  0483 a610          	ld	a,#16
4008  0485 42            	mul	x,a
4009  0486 9f            	ld	a,xl
4010  0487 1a03          	or	a,(OFST+2,sp)
4011  0489 6b01          	ld	(OFST+0,sp),a
4012  048b c65306        	ld	a,21254
4013  048e a40c          	and	a,#12
4014  0490 1a01          	or	a,(OFST+0,sp)
4015  0492 c75306        	ld	21254,a
4016                     ; 1268     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4018  0495 0d02          	tnz	(OFST+1,sp)
4019  0497 2706          	jreq	L1102
4020                     ; 1270         TIM2->CCER1 |= TIM2_CCER1_CC2P;
4022  0499 721a5308      	bset	21256,#5
4024  049d 2004          	jra	L3102
4025  049f               L1102:
4026                     ; 1274         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4028  049f 721b5308      	bres	21256,#5
4029  04a3               L3102:
4030                     ; 1278     TIM2->CCER1 |= TIM2_CCER1_CC2E;
4032  04a3 72185308      	bset	21256,#4
4033                     ; 1280 }
4036  04a7 5b03          	addw	sp,#3
4037  04a9 81            	ret
4083                     ; 1296 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4083                     ; 1297                        uint8_t TIM2_ICFilter)
4083                     ; 1298 {
4084                     	switch	.text
4085  04aa               L7_TI3_Config:
4087  04aa 89            	pushw	x
4088  04ab 88            	push	a
4089       00000001      OFST:	set	1
4092                     ; 1300     TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4094  04ac 72115309      	bres	21257,#0
4095                     ; 1303     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4095                     ; 1304                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4097  04b0 7b06          	ld	a,(OFST+5,sp)
4098  04b2 97            	ld	xl,a
4099  04b3 a610          	ld	a,#16
4100  04b5 42            	mul	x,a
4101  04b6 9f            	ld	a,xl
4102  04b7 1a03          	or	a,(OFST+2,sp)
4103  04b9 6b01          	ld	(OFST+0,sp),a
4104  04bb c65307        	ld	a,21255
4105  04be a40c          	and	a,#12
4106  04c0 1a01          	or	a,(OFST+0,sp)
4107  04c2 c75307        	ld	21255,a
4108                     ; 1308     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4110  04c5 0d02          	tnz	(OFST+1,sp)
4111  04c7 2706          	jreq	L5302
4112                     ; 1310         TIM2->CCER2 |= TIM2_CCER2_CC3P;
4114  04c9 72125309      	bset	21257,#1
4116  04cd 2004          	jra	L7302
4117  04cf               L5302:
4118                     ; 1314         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4120  04cf 72135309      	bres	21257,#1
4121  04d3               L7302:
4122                     ; 1317     TIM2->CCER2 |= TIM2_CCER2_CC3E;
4124  04d3 72105309      	bset	21257,#0
4125                     ; 1318 }
4128  04d7 5b03          	addw	sp,#3
4129  04d9 81            	ret
4142                     	xdef	_TIM2_ClearITPendingBit
4143                     	xdef	_TIM2_GetITStatus
4144                     	xdef	_TIM2_ClearFlag
4145                     	xdef	_TIM2_GetFlagStatus
4146                     	xdef	_TIM2_GetPrescaler
4147                     	xdef	_TIM2_GetCounter
4148                     	xdef	_TIM2_GetCapture3
4149                     	xdef	_TIM2_GetCapture2
4150                     	xdef	_TIM2_GetCapture1
4151                     	xdef	_TIM2_SetIC3Prescaler
4152                     	xdef	_TIM2_SetIC2Prescaler
4153                     	xdef	_TIM2_SetIC1Prescaler
4154                     	xdef	_TIM2_SetCompare3
4155                     	xdef	_TIM2_SetCompare2
4156                     	xdef	_TIM2_SetCompare1
4157                     	xdef	_TIM2_SetAutoreload
4158                     	xdef	_TIM2_SetCounter
4159                     	xdef	_TIM2_SelectOCxM
4160                     	xdef	_TIM2_CCxCmd
4161                     	xdef	_TIM2_OC3PolarityConfig
4162                     	xdef	_TIM2_OC2PolarityConfig
4163                     	xdef	_TIM2_OC1PolarityConfig
4164                     	xdef	_TIM2_GenerateEvent
4165                     	xdef	_TIM2_OC3PreloadConfig
4166                     	xdef	_TIM2_OC2PreloadConfig
4167                     	xdef	_TIM2_OC1PreloadConfig
4168                     	xdef	_TIM2_ARRPreloadConfig
4169                     	xdef	_TIM2_ForcedOC3Config
4170                     	xdef	_TIM2_ForcedOC2Config
4171                     	xdef	_TIM2_ForcedOC1Config
4172                     	xdef	_TIM2_PrescalerConfig
4173                     	xdef	_TIM2_SelectOnePulseMode
4174                     	xdef	_TIM2_UpdateRequestConfig
4175                     	xdef	_TIM2_UpdateDisableConfig
4176                     	xdef	_TIM2_ITConfig
4177                     	xdef	_TIM2_Cmd
4178                     	xdef	_TIM2_PWMIConfig
4179                     	xdef	_TIM2_ICInit
4180                     	xdef	_TIM2_OC3Init
4181                     	xdef	_TIM2_OC2Init
4182                     	xdef	_TIM2_OC1Init
4183                     	xdef	_TIM2_TimeBaseInit
4184                     	xdef	_TIM2_DeInit
4203                     	end
