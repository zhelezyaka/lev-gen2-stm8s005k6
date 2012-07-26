   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 52 void TIM1_DeInit(void)
  43                     ; 53 {
  45                     	switch	.text
  46  0000               _TIM1_DeInit:
  50                     ; 54     TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  52  0000 725f5250      	clr	21072
  53                     ; 55     TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  55  0004 725f5251      	clr	21073
  56                     ; 56     TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  58  0008 725f5252      	clr	21074
  59                     ; 57     TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  61  000c 725f5253      	clr	21075
  62                     ; 58     TIM1->IER  = TIM1_IER_RESET_VALUE;
  64  0010 725f5254      	clr	21076
  65                     ; 59     TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  67  0014 725f5256      	clr	21078
  68                     ; 61     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  70  0018 725f525c      	clr	21084
  71                     ; 62     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  73  001c 725f525d      	clr	21085
  74                     ; 64     TIM1->CCMR1 = 0x01;
  76  0020 35015258      	mov	21080,#1
  77                     ; 65     TIM1->CCMR2 = 0x01;
  79  0024 35015259      	mov	21081,#1
  80                     ; 66     TIM1->CCMR3 = 0x01;
  82  0028 3501525a      	mov	21082,#1
  83                     ; 67     TIM1->CCMR4 = 0x01;
  85  002c 3501525b      	mov	21083,#1
  86                     ; 69     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  88  0030 725f525c      	clr	21084
  89                     ; 70     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  91  0034 725f525d      	clr	21085
  92                     ; 71     TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  94  0038 725f5258      	clr	21080
  95                     ; 72     TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  97  003c 725f5259      	clr	21081
  98                     ; 73     TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 100  0040 725f525a      	clr	21082
 101                     ; 74     TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 103  0044 725f525b      	clr	21083
 104                     ; 75     TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 106  0048 725f525e      	clr	21086
 107                     ; 76     TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 109  004c 725f525f      	clr	21087
 110                     ; 77     TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 112  0050 725f5260      	clr	21088
 113                     ; 78     TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 115  0054 725f5261      	clr	21089
 116                     ; 79     TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 118  0058 35ff5262      	mov	21090,#255
 119                     ; 80     TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 121  005c 35ff5263      	mov	21091,#255
 122                     ; 81     TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 124  0060 725f5265      	clr	21093
 125                     ; 82     TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 127  0064 725f5266      	clr	21094
 128                     ; 83     TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 130  0068 725f5267      	clr	21095
 131                     ; 84     TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 133  006c 725f5268      	clr	21096
 134                     ; 85     TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 136  0070 725f5269      	clr	21097
 137                     ; 86     TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 139  0074 725f526a      	clr	21098
 140                     ; 87     TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 142  0078 725f526b      	clr	21099
 143                     ; 88     TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 145  007c 725f526c      	clr	21100
 146                     ; 89     TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 148  0080 725f526f      	clr	21103
 149                     ; 90     TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 151  0084 35015257      	mov	21079,#1
 152                     ; 91     TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 154  0088 725f526e      	clr	21102
 155                     ; 92     TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 157  008c 725f526d      	clr	21101
 158                     ; 93     TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 160  0090 725f5264      	clr	21092
 161                     ; 94     TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 163  0094 725f5255      	clr	21077
 164                     ; 95 }
 167  0098 81            	ret
 270                     ; 105 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 270                     ; 106                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 270                     ; 107                        uint16_t TIM1_Period,
 270                     ; 108                        uint8_t TIM1_RepetitionCounter)
 270                     ; 109 {
 271                     	switch	.text
 272  0099               _TIM1_TimeBaseInit:
 274  0099 89            	pushw	x
 275       00000000      OFST:	set	0
 278                     ; 112     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 280                     ; 115     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 282  009a 7b06          	ld	a,(OFST+6,sp)
 283  009c c75262        	ld	21090,a
 284                     ; 116     TIM1->ARRL = (uint8_t)(TIM1_Period);
 286  009f 7b07          	ld	a,(OFST+7,sp)
 287  00a1 c75263        	ld	21091,a
 288                     ; 119     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 290  00a4 9e            	ld	a,xh
 291  00a5 c75260        	ld	21088,a
 292                     ; 120     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 294  00a8 9f            	ld	a,xl
 295  00a9 c75261        	ld	21089,a
 296                     ; 123     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 296                     ; 124                            | (uint8_t)(TIM1_CounterMode));
 298  00ac c65250        	ld	a,21072
 299  00af a48f          	and	a,#143
 300  00b1 1a05          	or	a,(OFST+5,sp)
 301  00b3 c75250        	ld	21072,a
 302                     ; 127     TIM1->RCR = TIM1_RepetitionCounter;
 304  00b6 7b08          	ld	a,(OFST+8,sp)
 305  00b8 c75264        	ld	21092,a
 306                     ; 129 }
 309  00bb 85            	popw	x
 310  00bc 81            	ret
 593                     ; 150 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 593                     ; 151                   TIM1_OutputState_TypeDef TIM1_OutputState,
 593                     ; 152                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 593                     ; 153                   uint16_t TIM1_Pulse,
 593                     ; 154                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 593                     ; 155                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 593                     ; 156                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 593                     ; 157                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 593                     ; 158 {
 594                     	switch	.text
 595  00bd               _TIM1_OC1Init:
 597  00bd 89            	pushw	x
 598  00be 5203          	subw	sp,#3
 599       00000003      OFST:	set	3
 602                     ; 160     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 604                     ; 161     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 606                     ; 162     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 608                     ; 163     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 610                     ; 164     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 612                     ; 165     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 614                     ; 166     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 616                     ; 170     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 616                     ; 171                                | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 618  00c0 c6525c        	ld	a,21084
 619  00c3 a4f0          	and	a,#240
 620  00c5 c7525c        	ld	21084,a
 621                     ; 174   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 621                     ; 175                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 621                     ; 176                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 621                     ; 177                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 623  00c8 7b0c          	ld	a,(OFST+9,sp)
 624  00ca a408          	and	a,#8
 625  00cc 6b03          	ld	(OFST+0,sp),a
 626  00ce 7b0b          	ld	a,(OFST+8,sp)
 627  00d0 a402          	and	a,#2
 628  00d2 1a03          	or	a,(OFST+0,sp)
 629  00d4 6b02          	ld	(OFST-1,sp),a
 630  00d6 7b08          	ld	a,(OFST+5,sp)
 631  00d8 a404          	and	a,#4
 632  00da 6b01          	ld	(OFST-2,sp),a
 633  00dc 9f            	ld	a,xl
 634  00dd a401          	and	a,#1
 635  00df 1a01          	or	a,(OFST-2,sp)
 636  00e1 1a02          	or	a,(OFST-1,sp)
 637  00e3 ca525c        	or	a,21084
 638  00e6 c7525c        	ld	21084,a
 639                     ; 180     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 639                     ; 181                             (uint8_t)TIM1_OCMode);
 641  00e9 c65258        	ld	a,21080
 642  00ec a48f          	and	a,#143
 643  00ee 1a04          	or	a,(OFST+1,sp)
 644  00f0 c75258        	ld	21080,a
 645                     ; 184     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 647  00f3 c6526f        	ld	a,21103
 648  00f6 a4fc          	and	a,#252
 649  00f8 c7526f        	ld	21103,a
 650                     ; 186     TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 650                     ; 187                             (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 652  00fb 7b0e          	ld	a,(OFST+11,sp)
 653  00fd a402          	and	a,#2
 654  00ff 6b03          	ld	(OFST+0,sp),a
 655  0101 7b0d          	ld	a,(OFST+10,sp)
 656  0103 a401          	and	a,#1
 657  0105 1a03          	or	a,(OFST+0,sp)
 658  0107 ca526f        	or	a,21103
 659  010a c7526f        	ld	21103,a
 660                     ; 190     TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 662  010d 7b09          	ld	a,(OFST+6,sp)
 663  010f c75265        	ld	21093,a
 664                     ; 191     TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 666  0112 7b0a          	ld	a,(OFST+7,sp)
 667  0114 c75266        	ld	21094,a
 668                     ; 192 }
 671  0117 5b05          	addw	sp,#5
 672  0119 81            	ret
 774                     ; 213 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 774                     ; 214                   TIM1_OutputState_TypeDef TIM1_OutputState,
 774                     ; 215                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 774                     ; 216                   uint16_t TIM1_Pulse,
 774                     ; 217                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 774                     ; 218                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 774                     ; 219                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 774                     ; 220                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 774                     ; 221 {
 775                     	switch	.text
 776  011a               _TIM1_OC2Init:
 778  011a 89            	pushw	x
 779  011b 5203          	subw	sp,#3
 780       00000003      OFST:	set	3
 783                     ; 223     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 785                     ; 224     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 787                     ; 225     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 789                     ; 226     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 791                     ; 227     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 793                     ; 228     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 795                     ; 229     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 797                     ; 233     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 797                     ; 234                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 799  011d c6525c        	ld	a,21084
 800  0120 a40f          	and	a,#15
 801  0122 c7525c        	ld	21084,a
 802                     ; 238     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 802                     ; 239                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 802                     ; 240                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 802                     ; 241                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 804  0125 7b0c          	ld	a,(OFST+9,sp)
 805  0127 a480          	and	a,#128
 806  0129 6b03          	ld	(OFST+0,sp),a
 807  012b 7b0b          	ld	a,(OFST+8,sp)
 808  012d a420          	and	a,#32
 809  012f 1a03          	or	a,(OFST+0,sp)
 810  0131 6b02          	ld	(OFST-1,sp),a
 811  0133 7b08          	ld	a,(OFST+5,sp)
 812  0135 a440          	and	a,#64
 813  0137 6b01          	ld	(OFST-2,sp),a
 814  0139 9f            	ld	a,xl
 815  013a a410          	and	a,#16
 816  013c 1a01          	or	a,(OFST-2,sp)
 817  013e 1a02          	or	a,(OFST-1,sp)
 818  0140 ca525c        	or	a,21084
 819  0143 c7525c        	ld	21084,a
 820                     ; 244     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 820                     ; 245                              (uint8_t)TIM1_OCMode);
 822  0146 c65259        	ld	a,21081
 823  0149 a48f          	and	a,#143
 824  014b 1a04          	or	a,(OFST+1,sp)
 825  014d c75259        	ld	21081,a
 826                     ; 248     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 828  0150 c6526f        	ld	a,21103
 829  0153 a4f3          	and	a,#243
 830  0155 c7526f        	ld	21103,a
 831                     ; 250     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 831                     ; 251                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 833  0158 7b0e          	ld	a,(OFST+11,sp)
 834  015a a408          	and	a,#8
 835  015c 6b03          	ld	(OFST+0,sp),a
 836  015e 7b0d          	ld	a,(OFST+10,sp)
 837  0160 a404          	and	a,#4
 838  0162 1a03          	or	a,(OFST+0,sp)
 839  0164 ca526f        	or	a,21103
 840  0167 c7526f        	ld	21103,a
 841                     ; 254     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 843  016a 7b09          	ld	a,(OFST+6,sp)
 844  016c c75267        	ld	21095,a
 845                     ; 255     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 847  016f 7b0a          	ld	a,(OFST+7,sp)
 848  0171 c75268        	ld	21096,a
 849                     ; 257 }
 852  0174 5b05          	addw	sp,#5
 853  0176 81            	ret
 955                     ; 278 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 955                     ; 279                   TIM1_OutputState_TypeDef TIM1_OutputState,
 955                     ; 280                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 955                     ; 281                   uint16_t TIM1_Pulse,
 955                     ; 282                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 955                     ; 283                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 955                     ; 284                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 955                     ; 285                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 955                     ; 286 {
 956                     	switch	.text
 957  0177               _TIM1_OC3Init:
 959  0177 89            	pushw	x
 960  0178 5203          	subw	sp,#3
 961       00000003      OFST:	set	3
 964                     ; 288     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 966                     ; 289     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 968                     ; 290     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 970                     ; 291     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 972                     ; 292     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 974                     ; 293     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 976                     ; 294     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 978                     ; 298     TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 978                     ; 299                                 TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 980  017a c6525d        	ld	a,21085
 981  017d a4f0          	and	a,#240
 982  017f c7525d        	ld	21085,a
 983                     ; 302     TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
 983                     ; 303                              (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
 983                     ; 304                              (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
 983                     ; 305                              (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
 985  0182 7b0c          	ld	a,(OFST+9,sp)
 986  0184 a408          	and	a,#8
 987  0186 6b03          	ld	(OFST+0,sp),a
 988  0188 7b0b          	ld	a,(OFST+8,sp)
 989  018a a402          	and	a,#2
 990  018c 1a03          	or	a,(OFST+0,sp)
 991  018e 6b02          	ld	(OFST-1,sp),a
 992  0190 7b08          	ld	a,(OFST+5,sp)
 993  0192 a404          	and	a,#4
 994  0194 6b01          	ld	(OFST-2,sp),a
 995  0196 9f            	ld	a,xl
 996  0197 a401          	and	a,#1
 997  0199 1a01          	or	a,(OFST-2,sp)
 998  019b 1a02          	or	a,(OFST-1,sp)
 999  019d ca525d        	or	a,21085
1000  01a0 c7525d        	ld	21085,a
1001                     ; 308     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1001                     ; 309                              (uint8_t)TIM1_OCMode);
1003  01a3 c6525a        	ld	a,21082
1004  01a6 a48f          	and	a,#143
1005  01a8 1a04          	or	a,(OFST+1,sp)
1006  01aa c7525a        	ld	21082,a
1007                     ; 312     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1009  01ad c6526f        	ld	a,21103
1010  01b0 a4cf          	and	a,#207
1011  01b2 c7526f        	ld	21103,a
1012                     ; 314     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1012                     ; 315                             (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1014  01b5 7b0e          	ld	a,(OFST+11,sp)
1015  01b7 a420          	and	a,#32
1016  01b9 6b03          	ld	(OFST+0,sp),a
1017  01bb 7b0d          	ld	a,(OFST+10,sp)
1018  01bd a410          	and	a,#16
1019  01bf 1a03          	or	a,(OFST+0,sp)
1020  01c1 ca526f        	or	a,21103
1021  01c4 c7526f        	ld	21103,a
1022                     ; 318     TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1024  01c7 7b09          	ld	a,(OFST+6,sp)
1025  01c9 c75269        	ld	21097,a
1026                     ; 319     TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1028  01cc 7b0a          	ld	a,(OFST+7,sp)
1029  01ce c7526a        	ld	21098,a
1030                     ; 321 }
1033  01d1 5b05          	addw	sp,#5
1034  01d3 81            	ret
1106                     ; 336 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1106                     ; 337                   TIM1_OutputState_TypeDef TIM1_OutputState,
1106                     ; 338                   uint16_t TIM1_Pulse,
1106                     ; 339                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1106                     ; 340                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1106                     ; 341 {
1107                     	switch	.text
1108  01d4               _TIM1_OC4Init:
1110  01d4 89            	pushw	x
1111  01d5 88            	push	a
1112       00000001      OFST:	set	1
1115                     ; 343     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1117                     ; 344     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1119                     ; 345     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1121                     ; 346     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1123                     ; 349     TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1125  01d6 c6525d        	ld	a,21085
1126  01d9 a4cf          	and	a,#207
1127  01db c7525d        	ld	21085,a
1128                     ; 351     TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1128                     ; 352                              (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1130  01de 7b08          	ld	a,(OFST+7,sp)
1131  01e0 a420          	and	a,#32
1132  01e2 6b01          	ld	(OFST+0,sp),a
1133  01e4 9f            	ld	a,xl
1134  01e5 a410          	and	a,#16
1135  01e7 1a01          	or	a,(OFST+0,sp)
1136  01e9 ca525d        	or	a,21085
1137  01ec c7525d        	ld	21085,a
1138                     ; 355     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1138                     ; 356                             TIM1_OCMode);
1140  01ef c6525b        	ld	a,21083
1141  01f2 a48f          	and	a,#143
1142  01f4 1a02          	or	a,(OFST+1,sp)
1143  01f6 c7525b        	ld	21083,a
1144                     ; 359     if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1146  01f9 0d09          	tnz	(OFST+8,sp)
1147  01fb 270a          	jreq	L714
1148                     ; 361         TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1150  01fd c6526f        	ld	a,21103
1151  0200 aadf          	or	a,#223
1152  0202 c7526f        	ld	21103,a
1154  0205 2004          	jra	L124
1155  0207               L714:
1156                     ; 365         TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1158  0207 721d526f      	bres	21103,#6
1159  020b               L124:
1160                     ; 369     TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1162  020b 7b06          	ld	a,(OFST+5,sp)
1163  020d c7526b        	ld	21099,a
1164                     ; 370     TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1166  0210 7b07          	ld	a,(OFST+6,sp)
1167  0212 c7526c        	ld	21100,a
1168                     ; 372 }
1171  0215 5b03          	addw	sp,#3
1172  0217 81            	ret
1375                     ; 387 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1375                     ; 388                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1375                     ; 389                      uint8_t TIM1_DeadTime,
1375                     ; 390                      TIM1_BreakState_TypeDef TIM1_Break,
1375                     ; 391                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1375                     ; 392                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1375                     ; 393 {
1376                     	switch	.text
1377  0218               _TIM1_BDTRConfig:
1379  0218 89            	pushw	x
1380  0219 88            	push	a
1381       00000001      OFST:	set	1
1384                     ; 395     assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1386                     ; 396     assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1388                     ; 397     assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1390                     ; 398     assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1392                     ; 399     assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1394                     ; 401     TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1396  021a 7b06          	ld	a,(OFST+5,sp)
1397  021c c7526e        	ld	21102,a
1398                     ; 405     TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1398                     ; 406                             (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1398                     ; 407                             (uint8_t)TIM1_AutomaticOutput));
1400  021f 7b07          	ld	a,(OFST+6,sp)
1401  0221 1a08          	or	a,(OFST+7,sp)
1402  0223 1a09          	or	a,(OFST+8,sp)
1403  0225 6b01          	ld	(OFST+0,sp),a
1404  0227 9f            	ld	a,xl
1405  0228 1a02          	or	a,(OFST+1,sp)
1406  022a 1a01          	or	a,(OFST+0,sp)
1407  022c c7526d        	ld	21101,a
1408                     ; 409 }
1411  022f 5b03          	addw	sp,#3
1412  0231 81            	ret
1612                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1612                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1612                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1612                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1612                     ; 427                  uint8_t TIM1_ICFilter)
1612                     ; 428 {
1613                     	switch	.text
1614  0232               _TIM1_ICInit:
1616  0232 89            	pushw	x
1617       00000000      OFST:	set	0
1620                     ; 431     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1622                     ; 432     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1624                     ; 433     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1626                     ; 434     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1628                     ; 435     assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1630                     ; 437     if (TIM1_Channel == TIM1_CHANNEL_1)
1632  0233 9e            	ld	a,xh
1633  0234 4d            	tnz	a
1634  0235 2614          	jrne	L546
1635                     ; 440         TI1_Config((uint8_t)TIM1_ICPolarity,
1635                     ; 441                    (uint8_t)TIM1_ICSelection,
1635                     ; 442                    (uint8_t)TIM1_ICFilter);
1637  0237 7b07          	ld	a,(OFST+7,sp)
1638  0239 88            	push	a
1639  023a 7b06          	ld	a,(OFST+6,sp)
1640  023c 97            	ld	xl,a
1641  023d 7b03          	ld	a,(OFST+3,sp)
1642  023f 95            	ld	xh,a
1643  0240 cd080f        	call	L3_TI1_Config
1645  0243 84            	pop	a
1646                     ; 444         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1648  0244 7b06          	ld	a,(OFST+6,sp)
1649  0246 cd06b7        	call	_TIM1_SetIC1Prescaler
1652  0249 2046          	jra	L746
1653  024b               L546:
1654                     ; 446     else if (TIM1_Channel == TIM1_CHANNEL_2)
1656  024b 7b01          	ld	a,(OFST+1,sp)
1657  024d a101          	cp	a,#1
1658  024f 2614          	jrne	L156
1659                     ; 449         TI2_Config((uint8_t)TIM1_ICPolarity,
1659                     ; 450                    (uint8_t)TIM1_ICSelection,
1659                     ; 451                    (uint8_t)TIM1_ICFilter);
1661  0251 7b07          	ld	a,(OFST+7,sp)
1662  0253 88            	push	a
1663  0254 7b06          	ld	a,(OFST+6,sp)
1664  0256 97            	ld	xl,a
1665  0257 7b03          	ld	a,(OFST+3,sp)
1666  0259 95            	ld	xh,a
1667  025a cd083f        	call	L5_TI2_Config
1669  025d 84            	pop	a
1670                     ; 453         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1672  025e 7b06          	ld	a,(OFST+6,sp)
1673  0260 cd06c4        	call	_TIM1_SetIC2Prescaler
1676  0263 202c          	jra	L746
1677  0265               L156:
1678                     ; 455     else if (TIM1_Channel == TIM1_CHANNEL_3)
1680  0265 7b01          	ld	a,(OFST+1,sp)
1681  0267 a102          	cp	a,#2
1682  0269 2614          	jrne	L556
1683                     ; 458         TI3_Config((uint8_t)TIM1_ICPolarity,
1683                     ; 459                    (uint8_t)TIM1_ICSelection,
1683                     ; 460                    (uint8_t)TIM1_ICFilter);
1685  026b 7b07          	ld	a,(OFST+7,sp)
1686  026d 88            	push	a
1687  026e 7b06          	ld	a,(OFST+6,sp)
1688  0270 97            	ld	xl,a
1689  0271 7b03          	ld	a,(OFST+3,sp)
1690  0273 95            	ld	xh,a
1691  0274 cd086f        	call	L7_TI3_Config
1693  0277 84            	pop	a
1694                     ; 462         TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1696  0278 7b06          	ld	a,(OFST+6,sp)
1697  027a cd06d1        	call	_TIM1_SetIC3Prescaler
1700  027d 2012          	jra	L746
1701  027f               L556:
1702                     ; 467         TI4_Config((uint8_t)TIM1_ICPolarity,
1702                     ; 468                    (uint8_t)TIM1_ICSelection,
1702                     ; 469                    (uint8_t)TIM1_ICFilter);
1704  027f 7b07          	ld	a,(OFST+7,sp)
1705  0281 88            	push	a
1706  0282 7b06          	ld	a,(OFST+6,sp)
1707  0284 97            	ld	xl,a
1708  0285 7b03          	ld	a,(OFST+3,sp)
1709  0287 95            	ld	xh,a
1710  0288 cd089f        	call	L11_TI4_Config
1712  028b 84            	pop	a
1713                     ; 471         TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1715  028c 7b06          	ld	a,(OFST+6,sp)
1716  028e cd06de        	call	_TIM1_SetIC4Prescaler
1718  0291               L746:
1719                     ; 474 }
1722  0291 85            	popw	x
1723  0292 81            	ret
1813                     ; 490 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1813                     ; 491                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1813                     ; 492                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1813                     ; 493                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1813                     ; 494                      uint8_t TIM1_ICFilter)
1813                     ; 495 {
1814                     	switch	.text
1815  0293               _TIM1_PWMIConfig:
1817  0293 89            	pushw	x
1818  0294 89            	pushw	x
1819       00000002      OFST:	set	2
1822                     ; 496     uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1824                     ; 497     uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1826                     ; 500     assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1828                     ; 501     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1830                     ; 502     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1832                     ; 503     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1834                     ; 506     if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1836  0295 9f            	ld	a,xl
1837  0296 a101          	cp	a,#1
1838  0298 2706          	jreq	L127
1839                     ; 508         icpolarity = TIM1_ICPOLARITY_FALLING;
1841  029a a601          	ld	a,#1
1842  029c 6b01          	ld	(OFST-1,sp),a
1844  029e 2002          	jra	L327
1845  02a0               L127:
1846                     ; 512         icpolarity = TIM1_ICPOLARITY_RISING;
1848  02a0 0f01          	clr	(OFST-1,sp)
1849  02a2               L327:
1850                     ; 516     if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1852  02a2 7b07          	ld	a,(OFST+5,sp)
1853  02a4 a101          	cp	a,#1
1854  02a6 2606          	jrne	L527
1855                     ; 518         icselection = TIM1_ICSELECTION_INDIRECTTI;
1857  02a8 a602          	ld	a,#2
1858  02aa 6b02          	ld	(OFST+0,sp),a
1860  02ac 2004          	jra	L727
1861  02ae               L527:
1862                     ; 522         icselection = TIM1_ICSELECTION_DIRECTTI;
1864  02ae a601          	ld	a,#1
1865  02b0 6b02          	ld	(OFST+0,sp),a
1866  02b2               L727:
1867                     ; 525     if (TIM1_Channel == TIM1_CHANNEL_1)
1869  02b2 0d03          	tnz	(OFST+1,sp)
1870  02b4 2626          	jrne	L137
1871                     ; 528         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1871                     ; 529                    (uint8_t)TIM1_ICFilter);
1873  02b6 7b09          	ld	a,(OFST+7,sp)
1874  02b8 88            	push	a
1875  02b9 7b08          	ld	a,(OFST+6,sp)
1876  02bb 97            	ld	xl,a
1877  02bc 7b05          	ld	a,(OFST+3,sp)
1878  02be 95            	ld	xh,a
1879  02bf cd080f        	call	L3_TI1_Config
1881  02c2 84            	pop	a
1882                     ; 532         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1884  02c3 7b08          	ld	a,(OFST+6,sp)
1885  02c5 cd06b7        	call	_TIM1_SetIC1Prescaler
1887                     ; 535         TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1889  02c8 7b09          	ld	a,(OFST+7,sp)
1890  02ca 88            	push	a
1891  02cb 7b03          	ld	a,(OFST+1,sp)
1892  02cd 97            	ld	xl,a
1893  02ce 7b02          	ld	a,(OFST+0,sp)
1894  02d0 95            	ld	xh,a
1895  02d1 cd083f        	call	L5_TI2_Config
1897  02d4 84            	pop	a
1898                     ; 538         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1900  02d5 7b08          	ld	a,(OFST+6,sp)
1901  02d7 cd06c4        	call	_TIM1_SetIC2Prescaler
1904  02da 2024          	jra	L337
1905  02dc               L137:
1906                     ; 543         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1906                     ; 544                    (uint8_t)TIM1_ICFilter);
1908  02dc 7b09          	ld	a,(OFST+7,sp)
1909  02de 88            	push	a
1910  02df 7b08          	ld	a,(OFST+6,sp)
1911  02e1 97            	ld	xl,a
1912  02e2 7b05          	ld	a,(OFST+3,sp)
1913  02e4 95            	ld	xh,a
1914  02e5 cd083f        	call	L5_TI2_Config
1916  02e8 84            	pop	a
1917                     ; 547         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1919  02e9 7b08          	ld	a,(OFST+6,sp)
1920  02eb cd06c4        	call	_TIM1_SetIC2Prescaler
1922                     ; 550         TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1924  02ee 7b09          	ld	a,(OFST+7,sp)
1925  02f0 88            	push	a
1926  02f1 7b03          	ld	a,(OFST+1,sp)
1927  02f3 97            	ld	xl,a
1928  02f4 7b02          	ld	a,(OFST+0,sp)
1929  02f6 95            	ld	xh,a
1930  02f7 cd080f        	call	L3_TI1_Config
1932  02fa 84            	pop	a
1933                     ; 553         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1935  02fb 7b08          	ld	a,(OFST+6,sp)
1936  02fd cd06b7        	call	_TIM1_SetIC1Prescaler
1938  0300               L337:
1939                     ; 555 }
1942  0300 5b04          	addw	sp,#4
1943  0302 81            	ret
1998                     ; 563 void TIM1_Cmd(FunctionalState NewState)
1998                     ; 564 {
1999                     	switch	.text
2000  0303               _TIM1_Cmd:
2004                     ; 566     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2006                     ; 569     if (NewState != DISABLE)
2008  0303 4d            	tnz	a
2009  0304 2706          	jreq	L367
2010                     ; 571         TIM1->CR1 |= TIM1_CR1_CEN;
2012  0306 72105250      	bset	21072,#0
2014  030a 2004          	jra	L567
2015  030c               L367:
2016                     ; 575         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2018  030c 72115250      	bres	21072,#0
2019  0310               L567:
2020                     ; 577 }
2023  0310 81            	ret
2059                     ; 585 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2059                     ; 586 {
2060                     	switch	.text
2061  0311               _TIM1_CtrlPWMOutputs:
2065                     ; 588     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2067                     ; 592     if (NewState != DISABLE)
2069  0311 4d            	tnz	a
2070  0312 2706          	jreq	L5001
2071                     ; 594         TIM1->BKR |= TIM1_BKR_MOE;
2073  0314 721e526d      	bset	21101,#7
2075  0318 2004          	jra	L7001
2076  031a               L5001:
2077                     ; 598         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2079  031a 721f526d      	bres	21101,#7
2080  031e               L7001:
2081                     ; 600 }
2084  031e 81            	ret
2191                     ; 619 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2191                     ; 620 {
2192                     	switch	.text
2193  031f               _TIM1_ITConfig:
2195  031f 89            	pushw	x
2196       00000000      OFST:	set	0
2199                     ; 622     assert_param(IS_TIM1_IT_OK(TIM1_IT));
2201                     ; 623     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2203                     ; 625     if (NewState != DISABLE)
2205  0320 9f            	ld	a,xl
2206  0321 4d            	tnz	a
2207  0322 2709          	jreq	L7501
2208                     ; 628         TIM1->IER |= (uint8_t)TIM1_IT;
2210  0324 9e            	ld	a,xh
2211  0325 ca5254        	or	a,21076
2212  0328 c75254        	ld	21076,a
2214  032b 2009          	jra	L1601
2215  032d               L7501:
2216                     ; 633         TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2218  032d 7b01          	ld	a,(OFST+1,sp)
2219  032f 43            	cpl	a
2220  0330 c45254        	and	a,21076
2221  0333 c75254        	ld	21076,a
2222  0336               L1601:
2223                     ; 635 }
2226  0336 85            	popw	x
2227  0337 81            	ret
2251                     ; 642 void TIM1_InternalClockConfig(void)
2251                     ; 643 {
2252                     	switch	.text
2253  0338               _TIM1_InternalClockConfig:
2257                     ; 645     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2259  0338 c65252        	ld	a,21074
2260  033b a4f8          	and	a,#248
2261  033d c75252        	ld	21074,a
2262                     ; 646 }
2265  0340 81            	ret
2380                     ; 664 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2380                     ; 665                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2380                     ; 666                               uint8_t ExtTRGFilter)
2380                     ; 667 {
2381                     	switch	.text
2382  0341               _TIM1_ETRClockMode1Config:
2384  0341 89            	pushw	x
2385       00000000      OFST:	set	0
2388                     ; 669     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2390                     ; 670     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2392                     ; 673     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2394  0342 7b05          	ld	a,(OFST+5,sp)
2395  0344 88            	push	a
2396  0345 9f            	ld	a,xl
2397  0346 97            	ld	xl,a
2398  0347 7b02          	ld	a,(OFST+2,sp)
2399  0349 95            	ld	xh,a
2400  034a ad1f          	call	_TIM1_ETRConfig
2402  034c 84            	pop	a
2403                     ; 676     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2403                     ; 677                            | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2405  034d c65252        	ld	a,21074
2406  0350 a488          	and	a,#136
2407  0352 aa77          	or	a,#119
2408  0354 c75252        	ld	21074,a
2409                     ; 678 }
2412  0357 85            	popw	x
2413  0358 81            	ret
2469                     ; 696 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2469                     ; 697                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2469                     ; 698                               uint8_t ExtTRGFilter)
2469                     ; 699 {
2470                     	switch	.text
2471  0359               _TIM1_ETRClockMode2Config:
2473  0359 89            	pushw	x
2474       00000000      OFST:	set	0
2477                     ; 701     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2479                     ; 702     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2481                     ; 705     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2483  035a 7b05          	ld	a,(OFST+5,sp)
2484  035c 88            	push	a
2485  035d 9f            	ld	a,xl
2486  035e 97            	ld	xl,a
2487  035f 7b02          	ld	a,(OFST+2,sp)
2488  0361 95            	ld	xh,a
2489  0362 ad07          	call	_TIM1_ETRConfig
2491  0364 84            	pop	a
2492                     ; 708     TIM1->ETR |= TIM1_ETR_ECE;
2494  0365 721c5253      	bset	21075,#6
2495                     ; 709 }
2498  0369 85            	popw	x
2499  036a 81            	ret
2553                     ; 727 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2553                     ; 728                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2553                     ; 729                     uint8_t ExtTRGFilter)
2553                     ; 730 {
2554                     	switch	.text
2555  036b               _TIM1_ETRConfig:
2557  036b 89            	pushw	x
2558       00000000      OFST:	set	0
2561                     ; 732     assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2563                     ; 734     TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2563                     ; 735                       (uint8_t)ExtTRGFilter );
2565  036c 9f            	ld	a,xl
2566  036d 1a01          	or	a,(OFST+1,sp)
2567  036f 1a05          	or	a,(OFST+5,sp)
2568  0371 ca5253        	or	a,21075
2569  0374 c75253        	ld	21075,a
2570                     ; 736 }
2573  0377 85            	popw	x
2574  0378 81            	ret
2661                     ; 753 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2661                     ; 754                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2661                     ; 755                                  uint8_t ICFilter)
2661                     ; 756 {
2662                     	switch	.text
2663  0379               _TIM1_TIxExternalClockConfig:
2665  0379 89            	pushw	x
2666       00000000      OFST:	set	0
2669                     ; 758     assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2671                     ; 759     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2673                     ; 760     assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2675                     ; 763     if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2677  037a 9e            	ld	a,xh
2678  037b a160          	cp	a,#96
2679  037d 260f          	jrne	L1521
2680                     ; 765         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2682  037f 7b05          	ld	a,(OFST+5,sp)
2683  0381 88            	push	a
2684  0382 ae0001        	ldw	x,#1
2685  0385 7b03          	ld	a,(OFST+3,sp)
2686  0387 95            	ld	xh,a
2687  0388 cd083f        	call	L5_TI2_Config
2689  038b 84            	pop	a
2691  038c 200d          	jra	L3521
2692  038e               L1521:
2693                     ; 769         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2695  038e 7b05          	ld	a,(OFST+5,sp)
2696  0390 88            	push	a
2697  0391 ae0001        	ldw	x,#1
2698  0394 7b03          	ld	a,(OFST+3,sp)
2699  0396 95            	ld	xh,a
2700  0397 cd080f        	call	L3_TI1_Config
2702  039a 84            	pop	a
2703  039b               L3521:
2704                     ; 773     TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2706  039b 7b01          	ld	a,(OFST+1,sp)
2707  039d ad0a          	call	_TIM1_SelectInputTrigger
2709                     ; 776     TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2711  039f c65252        	ld	a,21074
2712  03a2 aa07          	or	a,#7
2713  03a4 c75252        	ld	21074,a
2714                     ; 777 }
2717  03a7 85            	popw	x
2718  03a8 81            	ret
2803                     ; 789 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2803                     ; 790 {
2804                     	switch	.text
2805  03a9               _TIM1_SelectInputTrigger:
2807  03a9 88            	push	a
2808       00000000      OFST:	set	0
2811                     ; 792     assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2813                     ; 795     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2815  03aa c65252        	ld	a,21074
2816  03ad a48f          	and	a,#143
2817  03af 1a01          	or	a,(OFST+1,sp)
2818  03b1 c75252        	ld	21074,a
2819                     ; 796 }
2822  03b4 84            	pop	a
2823  03b5 81            	ret
2859                     ; 806 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2859                     ; 807 {
2860                     	switch	.text
2861  03b6               _TIM1_UpdateDisableConfig:
2865                     ; 809     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2867                     ; 812     if (NewState != DISABLE)
2869  03b6 4d            	tnz	a
2870  03b7 2706          	jreq	L1331
2871                     ; 814         TIM1->CR1 |= TIM1_CR1_UDIS;
2873  03b9 72125250      	bset	21072,#1
2875  03bd 2004          	jra	L3331
2876  03bf               L1331:
2877                     ; 818         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2879  03bf 72135250      	bres	21072,#1
2880  03c3               L3331:
2881                     ; 820 }
2884  03c3 81            	ret
2942                     ; 830 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2942                     ; 831 {
2943                     	switch	.text
2944  03c4               _TIM1_UpdateRequestConfig:
2948                     ; 833     assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2950                     ; 836     if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2952  03c4 4d            	tnz	a
2953  03c5 2706          	jreq	L3631
2954                     ; 838         TIM1->CR1 |= TIM1_CR1_URS;
2956  03c7 72145250      	bset	21072,#2
2958  03cb 2004          	jra	L5631
2959  03cd               L3631:
2960                     ; 842         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2962  03cd 72155250      	bres	21072,#2
2963  03d1               L5631:
2964                     ; 844 }
2967  03d1 81            	ret
3003                     ; 853 void TIM1_SelectHallSensor(FunctionalState NewState)
3003                     ; 854 {
3004                     	switch	.text
3005  03d2               _TIM1_SelectHallSensor:
3009                     ; 856     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3011                     ; 859     if (NewState != DISABLE)
3013  03d2 4d            	tnz	a
3014  03d3 2706          	jreq	L5041
3015                     ; 861         TIM1->CR2 |= TIM1_CR2_TI1S;
3017  03d5 721e5251      	bset	21073,#7
3019  03d9 2004          	jra	L7041
3020  03db               L5041:
3021                     ; 865         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3023  03db 721f5251      	bres	21073,#7
3024  03df               L7041:
3025                     ; 867 }
3028  03df 81            	ret
3085                     ; 878 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3085                     ; 879 {
3086                     	switch	.text
3087  03e0               _TIM1_SelectOnePulseMode:
3091                     ; 881     assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3093                     ; 884     if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3095  03e0 4d            	tnz	a
3096  03e1 2706          	jreq	L7341
3097                     ; 886         TIM1->CR1 |= TIM1_CR1_OPM;
3099  03e3 72165250      	bset	21072,#3
3101  03e7 2004          	jra	L1441
3102  03e9               L7341:
3103                     ; 890         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3105  03e9 72175250      	bres	21072,#3
3106  03ed               L1441:
3107                     ; 893 }
3110  03ed 81            	ret
3208                     ; 909 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3208                     ; 910 {
3209                     	switch	.text
3210  03ee               _TIM1_SelectOutputTrigger:
3212  03ee 88            	push	a
3213       00000000      OFST:	set	0
3216                     ; 912     assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3218                     ; 915     TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3218                     ; 916                           (uint8_t) TIM1_TRGOSource);
3220  03ef c65251        	ld	a,21073
3221  03f2 a48f          	and	a,#143
3222  03f4 1a01          	or	a,(OFST+1,sp)
3223  03f6 c75251        	ld	21073,a
3224                     ; 917 }
3227  03f9 84            	pop	a
3228  03fa 81            	ret
3302                     ; 929 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3302                     ; 930 {
3303                     	switch	.text
3304  03fb               _TIM1_SelectSlaveMode:
3306  03fb 88            	push	a
3307       00000000      OFST:	set	0
3310                     ; 933     assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3312                     ; 936     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3312                     ; 937                            (uint8_t)TIM1_SlaveMode);
3314  03fc c65252        	ld	a,21074
3315  03ff a4f8          	and	a,#248
3316  0401 1a01          	or	a,(OFST+1,sp)
3317  0403 c75252        	ld	21074,a
3318                     ; 939 }
3321  0406 84            	pop	a
3322  0407 81            	ret
3358                     ; 947 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3358                     ; 948 {
3359                     	switch	.text
3360  0408               _TIM1_SelectMasterSlaveMode:
3364                     ; 950     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3366                     ; 953     if (NewState != DISABLE)
3368  0408 4d            	tnz	a
3369  0409 2706          	jreq	L3551
3370                     ; 955         TIM1->SMCR |= TIM1_SMCR_MSM;
3372  040b 721e5252      	bset	21074,#7
3374  040f 2004          	jra	L5551
3375  0411               L3551:
3376                     ; 959         TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3378  0411 721f5252      	bres	21074,#7
3379  0415               L5551:
3380                     ; 961 }
3383  0415 81            	ret
3469                     ; 983 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3469                     ; 984                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3469                     ; 985                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3469                     ; 986 {
3470                     	switch	.text
3471  0416               _TIM1_EncoderInterfaceConfig:
3473  0416 89            	pushw	x
3474       00000000      OFST:	set	0
3477                     ; 990     assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3479                     ; 991     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3481                     ; 992     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3483                     ; 995     if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3485  0417 9f            	ld	a,xl
3486  0418 4d            	tnz	a
3487  0419 2706          	jreq	L7161
3488                     ; 997         TIM1->CCER1 |= TIM1_CCER1_CC1P;
3490  041b 7212525c      	bset	21084,#1
3492  041f 2004          	jra	L1261
3493  0421               L7161:
3494                     ; 1001         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3496  0421 7213525c      	bres	21084,#1
3497  0425               L1261:
3498                     ; 1004     if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3500  0425 0d05          	tnz	(OFST+5,sp)
3501  0427 2706          	jreq	L3261
3502                     ; 1006         TIM1->CCER1 |= TIM1_CCER1_CC2P;
3504  0429 721a525c      	bset	21084,#5
3506  042d 2004          	jra	L5261
3507  042f               L3261:
3508                     ; 1010         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3510  042f 721b525c      	bres	21084,#5
3511  0433               L5261:
3512                     ; 1013     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3512                     ; 1014                            | (uint8_t) TIM1_EncoderMode);
3514  0433 c65252        	ld	a,21074
3515  0436 a4f0          	and	a,#240
3516  0438 1a01          	or	a,(OFST+1,sp)
3517  043a c75252        	ld	21074,a
3518                     ; 1017     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3518                     ; 1018                             | (uint8_t) CCMR_TIxDirect_Set);
3520  043d c65258        	ld	a,21080
3521  0440 a4fc          	and	a,#252
3522  0442 aa01          	or	a,#1
3523  0444 c75258        	ld	21080,a
3524                     ; 1019     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3524                     ; 1020                             | (uint8_t) CCMR_TIxDirect_Set);
3526  0447 c65259        	ld	a,21081
3527  044a a4fc          	and	a,#252
3528  044c aa01          	or	a,#1
3529  044e c75259        	ld	21081,a
3530                     ; 1022 }
3533  0451 85            	popw	x
3534  0452 81            	ret
3599                     ; 1035 void TIM1_PrescalerConfig(uint16_t Prescaler,
3599                     ; 1036                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3599                     ; 1037 {
3600                     	switch	.text
3601  0453               _TIM1_PrescalerConfig:
3603  0453 89            	pushw	x
3604       00000000      OFST:	set	0
3607                     ; 1039     assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3609                     ; 1042     TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3611  0454 9e            	ld	a,xh
3612  0455 c75260        	ld	21088,a
3613                     ; 1043     TIM1->PSCRL = (uint8_t)(Prescaler);
3615  0458 9f            	ld	a,xl
3616  0459 c75261        	ld	21089,a
3617                     ; 1046     TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3619  045c 7b05          	ld	a,(OFST+5,sp)
3620  045e c75257        	ld	21079,a
3621                     ; 1048 }
3624  0461 85            	popw	x
3625  0462 81            	ret
3661                     ; 1061 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3661                     ; 1062 {
3662                     	switch	.text
3663  0463               _TIM1_CounterModeConfig:
3665  0463 88            	push	a
3666       00000000      OFST:	set	0
3669                     ; 1064     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3671                     ; 1068     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3671                     ; 1069                           | (uint8_t)TIM1_CounterMode);
3673  0464 c65250        	ld	a,21072
3674  0467 a48f          	and	a,#143
3675  0469 1a01          	or	a,(OFST+1,sp)
3676  046b c75250        	ld	21072,a
3677                     ; 1070 }
3680  046e 84            	pop	a
3681  046f 81            	ret
3739                     ; 1081 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3739                     ; 1082 {
3740                     	switch	.text
3741  0470               _TIM1_ForcedOC1Config:
3743  0470 88            	push	a
3744       00000000      OFST:	set	0
3747                     ; 1084     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3749                     ; 1087     TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3749                     ; 1088                              (uint8_t)TIM1_ForcedAction);
3751  0471 c65258        	ld	a,21080
3752  0474 a48f          	and	a,#143
3753  0476 1a01          	or	a,(OFST+1,sp)
3754  0478 c75258        	ld	21080,a
3755                     ; 1089 }
3758  047b 84            	pop	a
3759  047c 81            	ret
3795                     ; 1100 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3795                     ; 1101 {
3796                     	switch	.text
3797  047d               _TIM1_ForcedOC2Config:
3799  047d 88            	push	a
3800       00000000      OFST:	set	0
3803                     ; 1103     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3805                     ; 1106     TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3805                     ; 1107                               | (uint8_t)TIM1_ForcedAction);
3807  047e c65259        	ld	a,21081
3808  0481 a48f          	and	a,#143
3809  0483 1a01          	or	a,(OFST+1,sp)
3810  0485 c75259        	ld	21081,a
3811                     ; 1108 }
3814  0488 84            	pop	a
3815  0489 81            	ret
3851                     ; 1120 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3851                     ; 1121 {
3852                     	switch	.text
3853  048a               _TIM1_ForcedOC3Config:
3855  048a 88            	push	a
3856       00000000      OFST:	set	0
3859                     ; 1123     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3861                     ; 1126     TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3861                     ; 1127                               | (uint8_t)TIM1_ForcedAction);
3863  048b c6525a        	ld	a,21082
3864  048e a48f          	and	a,#143
3865  0490 1a01          	or	a,(OFST+1,sp)
3866  0492 c7525a        	ld	21082,a
3867                     ; 1128 }
3870  0495 84            	pop	a
3871  0496 81            	ret
3907                     ; 1140 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3907                     ; 1141 {
3908                     	switch	.text
3909  0497               _TIM1_ForcedOC4Config:
3911  0497 88            	push	a
3912       00000000      OFST:	set	0
3915                     ; 1143     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3917                     ; 1146     TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3917                     ; 1147                               | (uint8_t)TIM1_ForcedAction);
3919  0498 c6525b        	ld	a,21083
3920  049b a48f          	and	a,#143
3921  049d 1a01          	or	a,(OFST+1,sp)
3922  049f c7525b        	ld	21083,a
3923                     ; 1148 }
3926  04a2 84            	pop	a
3927  04a3 81            	ret
3963                     ; 1157 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3963                     ; 1158 {
3964                     	switch	.text
3965  04a4               _TIM1_ARRPreloadConfig:
3969                     ; 1160     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3971                     ; 1163     if (NewState != DISABLE)
3973  04a4 4d            	tnz	a
3974  04a5 2706          	jreq	L3102
3975                     ; 1165         TIM1->CR1 |= TIM1_CR1_ARPE;
3977  04a7 721e5250      	bset	21072,#7
3979  04ab 2004          	jra	L5102
3980  04ad               L3102:
3981                     ; 1169         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
3983  04ad 721f5250      	bres	21072,#7
3984  04b1               L5102:
3985                     ; 1171 }
3988  04b1 81            	ret
4023                     ; 1180 void TIM1_SelectCOM(FunctionalState NewState)
4023                     ; 1181 {
4024                     	switch	.text
4025  04b2               _TIM1_SelectCOM:
4029                     ; 1183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4031                     ; 1186     if (NewState != DISABLE)
4033  04b2 4d            	tnz	a
4034  04b3 2706          	jreq	L5302
4035                     ; 1188         TIM1->CR2 |= TIM1_CR2_COMS;
4037  04b5 72145251      	bset	21073,#2
4039  04b9 2004          	jra	L7302
4040  04bb               L5302:
4041                     ; 1192         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4043  04bb 72155251      	bres	21073,#2
4044  04bf               L7302:
4045                     ; 1194 }
4048  04bf 81            	ret
4084                     ; 1202 void TIM1_CCPreloadControl(FunctionalState NewState)
4084                     ; 1203 {
4085                     	switch	.text
4086  04c0               _TIM1_CCPreloadControl:
4090                     ; 1205     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4092                     ; 1208     if (NewState != DISABLE)
4094  04c0 4d            	tnz	a
4095  04c1 2706          	jreq	L7502
4096                     ; 1210         TIM1->CR2 |= TIM1_CR2_CCPC;
4098  04c3 72105251      	bset	21073,#0
4100  04c7 2004          	jra	L1602
4101  04c9               L7502:
4102                     ; 1214         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4104  04c9 72115251      	bres	21073,#0
4105  04cd               L1602:
4106                     ; 1216 }
4109  04cd 81            	ret
4145                     ; 1225 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4145                     ; 1226 {
4146                     	switch	.text
4147  04ce               _TIM1_OC1PreloadConfig:
4151                     ; 1228     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4153                     ; 1231     if (NewState != DISABLE)
4155  04ce 4d            	tnz	a
4156  04cf 2706          	jreq	L1012
4157                     ; 1233         TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4159  04d1 72165258      	bset	21080,#3
4161  04d5 2004          	jra	L3012
4162  04d7               L1012:
4163                     ; 1237         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4165  04d7 72175258      	bres	21080,#3
4166  04db               L3012:
4167                     ; 1239 }
4170  04db 81            	ret
4206                     ; 1248 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4206                     ; 1249 {
4207                     	switch	.text
4208  04dc               _TIM1_OC2PreloadConfig:
4212                     ; 1251     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4214                     ; 1254     if (NewState != DISABLE)
4216  04dc 4d            	tnz	a
4217  04dd 2706          	jreq	L3212
4218                     ; 1256         TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4220  04df 72165259      	bset	21081,#3
4222  04e3 2004          	jra	L5212
4223  04e5               L3212:
4224                     ; 1260         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4226  04e5 72175259      	bres	21081,#3
4227  04e9               L5212:
4228                     ; 1262 }
4231  04e9 81            	ret
4267                     ; 1271 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4267                     ; 1272 {
4268                     	switch	.text
4269  04ea               _TIM1_OC3PreloadConfig:
4273                     ; 1274     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4275                     ; 1277     if (NewState != DISABLE)
4277  04ea 4d            	tnz	a
4278  04eb 2706          	jreq	L5412
4279                     ; 1279         TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4281  04ed 7216525a      	bset	21082,#3
4283  04f1 2004          	jra	L7412
4284  04f3               L5412:
4285                     ; 1283         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4287  04f3 7217525a      	bres	21082,#3
4288  04f7               L7412:
4289                     ; 1285 }
4292  04f7 81            	ret
4328                     ; 1295 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4328                     ; 1296 {
4329                     	switch	.text
4330  04f8               _TIM1_OC4PreloadConfig:
4334                     ; 1298     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4336                     ; 1301     if (NewState != DISABLE)
4338  04f8 4d            	tnz	a
4339  04f9 2706          	jreq	L7612
4340                     ; 1303         TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4342  04fb 7216525b      	bset	21083,#3
4344  04ff 2004          	jra	L1712
4345  0501               L7612:
4346                     ; 1307         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4348  0501 7217525b      	bres	21083,#3
4349  0505               L1712:
4350                     ; 1309 }
4353  0505 81            	ret
4388                     ; 1317 void TIM1_OC1FastConfig(FunctionalState NewState)
4388                     ; 1318 {
4389                     	switch	.text
4390  0506               _TIM1_OC1FastConfig:
4394                     ; 1320     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4396                     ; 1323     if (NewState != DISABLE)
4398  0506 4d            	tnz	a
4399  0507 2706          	jreq	L1122
4400                     ; 1325         TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4402  0509 72145258      	bset	21080,#2
4404  050d 2004          	jra	L3122
4405  050f               L1122:
4406                     ; 1329         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4408  050f 72155258      	bres	21080,#2
4409  0513               L3122:
4410                     ; 1331 }
4413  0513 81            	ret
4448                     ; 1341 void TIM1_OC2FastConfig(FunctionalState NewState)
4448                     ; 1342 {
4449                     	switch	.text
4450  0514               _TIM1_OC2FastConfig:
4454                     ; 1344     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4456                     ; 1347     if (NewState != DISABLE)
4458  0514 4d            	tnz	a
4459  0515 2706          	jreq	L3322
4460                     ; 1349         TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4462  0517 72145259      	bset	21081,#2
4464  051b 2004          	jra	L5322
4465  051d               L3322:
4466                     ; 1353         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4468  051d 72155259      	bres	21081,#2
4469  0521               L5322:
4470                     ; 1355 }
4473  0521 81            	ret
4508                     ; 1364 void TIM1_OC3FastConfig(FunctionalState NewState)
4508                     ; 1365 {
4509                     	switch	.text
4510  0522               _TIM1_OC3FastConfig:
4514                     ; 1367     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4516                     ; 1370     if (NewState != DISABLE)
4518  0522 4d            	tnz	a
4519  0523 2706          	jreq	L5522
4520                     ; 1372         TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4522  0525 7214525a      	bset	21082,#2
4524  0529 2004          	jra	L7522
4525  052b               L5522:
4526                     ; 1376         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4528  052b 7215525a      	bres	21082,#2
4529  052f               L7522:
4530                     ; 1378 }
4533  052f 81            	ret
4568                     ; 1387 void TIM1_OC4FastConfig(FunctionalState NewState)
4568                     ; 1388 {
4569                     	switch	.text
4570  0530               _TIM1_OC4FastConfig:
4574                     ; 1390     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4576                     ; 1393     if (NewState != DISABLE)
4578  0530 4d            	tnz	a
4579  0531 2706          	jreq	L7722
4580                     ; 1395         TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4582  0533 7214525b      	bset	21083,#2
4584  0537 2004          	jra	L1032
4585  0539               L7722:
4586                     ; 1399         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4588  0539 7215525b      	bres	21083,#2
4589  053d               L1032:
4590                     ; 1401 }
4593  053d 81            	ret
4698                     ; 1418 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4698                     ; 1419 {
4699                     	switch	.text
4700  053e               _TIM1_GenerateEvent:
4704                     ; 1421     assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4706                     ; 1424     TIM1->EGR = (uint8_t)TIM1_EventSource;
4708  053e c75257        	ld	21079,a
4709                     ; 1425 }
4712  0541 81            	ret
4748                     ; 1436 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4748                     ; 1437 {
4749                     	switch	.text
4750  0542               _TIM1_OC1PolarityConfig:
4754                     ; 1439     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4756                     ; 1442     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4758  0542 4d            	tnz	a
4759  0543 2706          	jreq	L3632
4760                     ; 1444         TIM1->CCER1 |= TIM1_CCER1_CC1P;
4762  0545 7212525c      	bset	21084,#1
4764  0549 2004          	jra	L5632
4765  054b               L3632:
4766                     ; 1448         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4768  054b 7213525c      	bres	21084,#1
4769  054f               L5632:
4770                     ; 1450 }
4773  054f 81            	ret
4809                     ; 1461 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4809                     ; 1462 {
4810                     	switch	.text
4811  0550               _TIM1_OC1NPolarityConfig:
4815                     ; 1464     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4817                     ; 1467     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4819  0550 4d            	tnz	a
4820  0551 2706          	jreq	L5042
4821                     ; 1469         TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4823  0553 7216525c      	bset	21084,#3
4825  0557 2004          	jra	L7042
4826  0559               L5042:
4827                     ; 1473         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4829  0559 7217525c      	bres	21084,#3
4830  055d               L7042:
4831                     ; 1475 }
4834  055d 81            	ret
4870                     ; 1486 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4870                     ; 1487 {
4871                     	switch	.text
4872  055e               _TIM1_OC2PolarityConfig:
4876                     ; 1489     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4878                     ; 1492     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4880  055e 4d            	tnz	a
4881  055f 2706          	jreq	L7242
4882                     ; 1494         TIM1->CCER1 |= TIM1_CCER1_CC2P;
4884  0561 721a525c      	bset	21084,#5
4886  0565 2004          	jra	L1342
4887  0567               L7242:
4888                     ; 1498         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4890  0567 721b525c      	bres	21084,#5
4891  056b               L1342:
4892                     ; 1500 }
4895  056b 81            	ret
4931                     ; 1510 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4931                     ; 1511 {
4932                     	switch	.text
4933  056c               _TIM1_OC2NPolarityConfig:
4937                     ; 1513     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4939                     ; 1516     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4941  056c 4d            	tnz	a
4942  056d 2706          	jreq	L1542
4943                     ; 1518         TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4945  056f 721e525c      	bset	21084,#7
4947  0573 2004          	jra	L3542
4948  0575               L1542:
4949                     ; 1522         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4951  0575 721f525c      	bres	21084,#7
4952  0579               L3542:
4953                     ; 1524 }
4956  0579 81            	ret
4992                     ; 1535 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4992                     ; 1536 {
4993                     	switch	.text
4994  057a               _TIM1_OC3PolarityConfig:
4998                     ; 1538     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5000                     ; 1541     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5002  057a 4d            	tnz	a
5003  057b 2706          	jreq	L3742
5004                     ; 1543         TIM1->CCER2 |= TIM1_CCER2_CC3P;
5006  057d 7212525d      	bset	21085,#1
5008  0581 2004          	jra	L5742
5009  0583               L3742:
5010                     ; 1547         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5012  0583 7213525d      	bres	21085,#1
5013  0587               L5742:
5014                     ; 1549 }
5017  0587 81            	ret
5053                     ; 1560 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5053                     ; 1561 {
5054                     	switch	.text
5055  0588               _TIM1_OC3NPolarityConfig:
5059                     ; 1563     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5061                     ; 1566     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5063  0588 4d            	tnz	a
5064  0589 2706          	jreq	L5152
5065                     ; 1568         TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5067  058b 7216525d      	bset	21085,#3
5069  058f 2004          	jra	L7152
5070  0591               L5152:
5071                     ; 1572         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5073  0591 7217525d      	bres	21085,#3
5074  0595               L7152:
5075                     ; 1574 }
5078  0595 81            	ret
5114                     ; 1584 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5114                     ; 1585 {
5115                     	switch	.text
5116  0596               _TIM1_OC4PolarityConfig:
5120                     ; 1587     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5122                     ; 1590     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5124  0596 4d            	tnz	a
5125  0597 2706          	jreq	L7352
5126                     ; 1592         TIM1->CCER2 |= TIM1_CCER2_CC4P;
5128  0599 721a525d      	bset	21085,#5
5130  059d 2004          	jra	L1452
5131  059f               L7352:
5132                     ; 1596         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5134  059f 721b525d      	bres	21085,#5
5135  05a3               L1452:
5136                     ; 1598 }
5139  05a3 81            	ret
5184                     ; 1613 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5184                     ; 1614 {
5185                     	switch	.text
5186  05a4               _TIM1_CCxCmd:
5188  05a4 89            	pushw	x
5189       00000000      OFST:	set	0
5192                     ; 1616     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5194                     ; 1617     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5196                     ; 1619     if (TIM1_Channel == TIM1_CHANNEL_1)
5198  05a5 9e            	ld	a,xh
5199  05a6 4d            	tnz	a
5200  05a7 2610          	jrne	L5652
5201                     ; 1622         if (NewState != DISABLE)
5203  05a9 9f            	ld	a,xl
5204  05aa 4d            	tnz	a
5205  05ab 2706          	jreq	L7652
5206                     ; 1624             TIM1->CCER1 |= TIM1_CCER1_CC1E;
5208  05ad 7210525c      	bset	21084,#0
5210  05b1 2040          	jra	L3752
5211  05b3               L7652:
5212                     ; 1628             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5214  05b3 7211525c      	bres	21084,#0
5215  05b7 203a          	jra	L3752
5216  05b9               L5652:
5217                     ; 1632     else if (TIM1_Channel == TIM1_CHANNEL_2)
5219  05b9 7b01          	ld	a,(OFST+1,sp)
5220  05bb a101          	cp	a,#1
5221  05bd 2610          	jrne	L5752
5222                     ; 1635         if (NewState != DISABLE)
5224  05bf 0d02          	tnz	(OFST+2,sp)
5225  05c1 2706          	jreq	L7752
5226                     ; 1637             TIM1->CCER1 |= TIM1_CCER1_CC2E;
5228  05c3 7218525c      	bset	21084,#4
5230  05c7 202a          	jra	L3752
5231  05c9               L7752:
5232                     ; 1641             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5234  05c9 7219525c      	bres	21084,#4
5235  05cd 2024          	jra	L3752
5236  05cf               L5752:
5237                     ; 1644     else if (TIM1_Channel == TIM1_CHANNEL_3)
5239  05cf 7b01          	ld	a,(OFST+1,sp)
5240  05d1 a102          	cp	a,#2
5241  05d3 2610          	jrne	L5062
5242                     ; 1647         if (NewState != DISABLE)
5244  05d5 0d02          	tnz	(OFST+2,sp)
5245  05d7 2706          	jreq	L7062
5246                     ; 1649             TIM1->CCER2 |= TIM1_CCER2_CC3E;
5248  05d9 7210525d      	bset	21085,#0
5250  05dd 2014          	jra	L3752
5251  05df               L7062:
5252                     ; 1653             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5254  05df 7211525d      	bres	21085,#0
5255  05e3 200e          	jra	L3752
5256  05e5               L5062:
5257                     ; 1659         if (NewState != DISABLE)
5259  05e5 0d02          	tnz	(OFST+2,sp)
5260  05e7 2706          	jreq	L5162
5261                     ; 1661             TIM1->CCER2 |= TIM1_CCER2_CC4E;
5263  05e9 7218525d      	bset	21085,#4
5265  05ed 2004          	jra	L3752
5266  05ef               L5162:
5267                     ; 1665             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5269  05ef 7219525d      	bres	21085,#4
5270  05f3               L3752:
5271                     ; 1668 }
5274  05f3 85            	popw	x
5275  05f4 81            	ret
5320                     ; 1681 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5320                     ; 1682 {
5321                     	switch	.text
5322  05f5               _TIM1_CCxNCmd:
5324  05f5 89            	pushw	x
5325       00000000      OFST:	set	0
5328                     ; 1684     assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5330                     ; 1685     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5332                     ; 1687     if (TIM1_Channel == TIM1_CHANNEL_1)
5334  05f6 9e            	ld	a,xh
5335  05f7 4d            	tnz	a
5336  05f8 2610          	jrne	L3462
5337                     ; 1690         if (NewState != DISABLE)
5339  05fa 9f            	ld	a,xl
5340  05fb 4d            	tnz	a
5341  05fc 2706          	jreq	L5462
5342                     ; 1692             TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5344  05fe 7214525c      	bset	21084,#2
5346  0602 202a          	jra	L1562
5347  0604               L5462:
5348                     ; 1696             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5350  0604 7215525c      	bres	21084,#2
5351  0608 2024          	jra	L1562
5352  060a               L3462:
5353                     ; 1699     else if (TIM1_Channel == TIM1_CHANNEL_2)
5355  060a 7b01          	ld	a,(OFST+1,sp)
5356  060c a101          	cp	a,#1
5357  060e 2610          	jrne	L3562
5358                     ; 1702         if (NewState != DISABLE)
5360  0610 0d02          	tnz	(OFST+2,sp)
5361  0612 2706          	jreq	L5562
5362                     ; 1704             TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5364  0614 721c525c      	bset	21084,#6
5366  0618 2014          	jra	L1562
5367  061a               L5562:
5368                     ; 1708             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5370  061a 721d525c      	bres	21084,#6
5371  061e 200e          	jra	L1562
5372  0620               L3562:
5373                     ; 1714         if (NewState != DISABLE)
5375  0620 0d02          	tnz	(OFST+2,sp)
5376  0622 2706          	jreq	L3662
5377                     ; 1716             TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5379  0624 7214525d      	bset	21085,#2
5381  0628 2004          	jra	L1562
5382  062a               L3662:
5383                     ; 1720             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5385  062a 7215525d      	bres	21085,#2
5386  062e               L1562:
5387                     ; 1723 }
5390  062e 85            	popw	x
5391  062f 81            	ret
5436                     ; 1747 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5436                     ; 1748 {
5437                     	switch	.text
5438  0630               _TIM1_SelectOCxM:
5440  0630 89            	pushw	x
5441       00000000      OFST:	set	0
5444                     ; 1750     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5446                     ; 1751     assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5448                     ; 1753     if (TIM1_Channel == TIM1_CHANNEL_1)
5450  0631 9e            	ld	a,xh
5451  0632 4d            	tnz	a
5452  0633 2610          	jrne	L1172
5453                     ; 1756         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5455  0635 7211525c      	bres	21084,#0
5456                     ; 1759         TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5456                     ; 1760                                 | (uint8_t)TIM1_OCMode);
5458  0639 c65258        	ld	a,21080
5459  063c a48f          	and	a,#143
5460  063e 1a02          	or	a,(OFST+2,sp)
5461  0640 c75258        	ld	21080,a
5463  0643 203a          	jra	L3172
5464  0645               L1172:
5465                     ; 1762     else if (TIM1_Channel == TIM1_CHANNEL_2)
5467  0645 7b01          	ld	a,(OFST+1,sp)
5468  0647 a101          	cp	a,#1
5469  0649 2610          	jrne	L5172
5470                     ; 1765         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5472  064b 7219525c      	bres	21084,#4
5473                     ; 1768         TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5473                     ; 1769                                 | (uint8_t)TIM1_OCMode);
5475  064f c65259        	ld	a,21081
5476  0652 a48f          	and	a,#143
5477  0654 1a02          	or	a,(OFST+2,sp)
5478  0656 c75259        	ld	21081,a
5480  0659 2024          	jra	L3172
5481  065b               L5172:
5482                     ; 1771     else if (TIM1_Channel == TIM1_CHANNEL_3)
5484  065b 7b01          	ld	a,(OFST+1,sp)
5485  065d a102          	cp	a,#2
5486  065f 2610          	jrne	L1272
5487                     ; 1774         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5489  0661 7211525d      	bres	21085,#0
5490                     ; 1777         TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5490                     ; 1778                                 | (uint8_t)TIM1_OCMode);
5492  0665 c6525a        	ld	a,21082
5493  0668 a48f          	and	a,#143
5494  066a 1a02          	or	a,(OFST+2,sp)
5495  066c c7525a        	ld	21082,a
5497  066f 200e          	jra	L3172
5498  0671               L1272:
5499                     ; 1783         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5501  0671 7219525d      	bres	21085,#4
5502                     ; 1786         TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5502                     ; 1787                                 | (uint8_t)TIM1_OCMode);
5504  0675 c6525b        	ld	a,21083
5505  0678 a48f          	and	a,#143
5506  067a 1a02          	or	a,(OFST+2,sp)
5507  067c c7525b        	ld	21083,a
5508  067f               L3172:
5509                     ; 1789 }
5512  067f 85            	popw	x
5513  0680 81            	ret
5545                     ; 1798 void TIM1_SetCounter(uint16_t Counter)
5545                     ; 1799 {
5546                     	switch	.text
5547  0681               _TIM1_SetCounter:
5551                     ; 1801     TIM1->CNTRH = (uint8_t)(Counter >> 8);
5553  0681 9e            	ld	a,xh
5554  0682 c7525e        	ld	21086,a
5555                     ; 1802     TIM1->CNTRL = (uint8_t)(Counter);
5557  0685 9f            	ld	a,xl
5558  0686 c7525f        	ld	21087,a
5559                     ; 1804 }
5562  0689 81            	ret
5594                     ; 1813 void TIM1_SetAutoreload(uint16_t Autoreload)
5594                     ; 1814 {
5595                     	switch	.text
5596  068a               _TIM1_SetAutoreload:
5600                     ; 1817     TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5602  068a 9e            	ld	a,xh
5603  068b c75262        	ld	21090,a
5604                     ; 1818     TIM1->ARRL = (uint8_t)(Autoreload);
5606  068e 9f            	ld	a,xl
5607  068f c75263        	ld	21091,a
5608                     ; 1820 }
5611  0692 81            	ret
5643                     ; 1829 void TIM1_SetCompare1(uint16_t Compare1)
5643                     ; 1830 {
5644                     	switch	.text
5645  0693               _TIM1_SetCompare1:
5649                     ; 1832     TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5651  0693 9e            	ld	a,xh
5652  0694 c75265        	ld	21093,a
5653                     ; 1833     TIM1->CCR1L = (uint8_t)(Compare1);
5655  0697 9f            	ld	a,xl
5656  0698 c75266        	ld	21094,a
5657                     ; 1835 }
5660  069b 81            	ret
5692                     ; 1844 void TIM1_SetCompare2(uint16_t Compare2)
5692                     ; 1845 {
5693                     	switch	.text
5694  069c               _TIM1_SetCompare2:
5698                     ; 1847     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5700  069c 9e            	ld	a,xh
5701  069d c75267        	ld	21095,a
5702                     ; 1848     TIM1->CCR2L = (uint8_t)(Compare2);
5704  06a0 9f            	ld	a,xl
5705  06a1 c75268        	ld	21096,a
5706                     ; 1850 }
5709  06a4 81            	ret
5741                     ; 1859 void TIM1_SetCompare3(uint16_t Compare3)
5741                     ; 1860 {
5742                     	switch	.text
5743  06a5               _TIM1_SetCompare3:
5747                     ; 1862     TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5749  06a5 9e            	ld	a,xh
5750  06a6 c75269        	ld	21097,a
5751                     ; 1863     TIM1->CCR3L = (uint8_t)(Compare3);
5753  06a9 9f            	ld	a,xl
5754  06aa c7526a        	ld	21098,a
5755                     ; 1865 }
5758  06ad 81            	ret
5790                     ; 1874 void TIM1_SetCompare4(uint16_t Compare4)
5790                     ; 1875 {
5791                     	switch	.text
5792  06ae               _TIM1_SetCompare4:
5796                     ; 1877     TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5798  06ae 9e            	ld	a,xh
5799  06af c7526b        	ld	21099,a
5800                     ; 1878     TIM1->CCR4L = (uint8_t)(Compare4);
5802  06b2 9f            	ld	a,xl
5803  06b3 c7526c        	ld	21100,a
5804                     ; 1879 }
5807  06b6 81            	ret
5843                     ; 1892 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5843                     ; 1893 {
5844                     	switch	.text
5845  06b7               _TIM1_SetIC1Prescaler:
5847  06b7 88            	push	a
5848       00000000      OFST:	set	0
5851                     ; 1895     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5853                     ; 1898     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5853                     ; 1899                             | (uint8_t)TIM1_IC1Prescaler);
5855  06b8 c65258        	ld	a,21080
5856  06bb a4f3          	and	a,#243
5857  06bd 1a01          	or	a,(OFST+1,sp)
5858  06bf c75258        	ld	21080,a
5859                     ; 1901 }
5862  06c2 84            	pop	a
5863  06c3 81            	ret
5899                     ; 1913 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5899                     ; 1914 {
5900                     	switch	.text
5901  06c4               _TIM1_SetIC2Prescaler:
5903  06c4 88            	push	a
5904       00000000      OFST:	set	0
5907                     ; 1917     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5909                     ; 1920     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5909                     ; 1921                             | (uint8_t)TIM1_IC2Prescaler);
5911  06c5 c65259        	ld	a,21081
5912  06c8 a4f3          	and	a,#243
5913  06ca 1a01          	or	a,(OFST+1,sp)
5914  06cc c75259        	ld	21081,a
5915                     ; 1922 }
5918  06cf 84            	pop	a
5919  06d0 81            	ret
5955                     ; 1935 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5955                     ; 1936 {
5956                     	switch	.text
5957  06d1               _TIM1_SetIC3Prescaler:
5959  06d1 88            	push	a
5960       00000000      OFST:	set	0
5963                     ; 1939     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
5965                     ; 1942     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
5965                     ; 1943                             (uint8_t)TIM1_IC3Prescaler);
5967  06d2 c6525a        	ld	a,21082
5968  06d5 a4f3          	and	a,#243
5969  06d7 1a01          	or	a,(OFST+1,sp)
5970  06d9 c7525a        	ld	21082,a
5971                     ; 1944 }
5974  06dc 84            	pop	a
5975  06dd 81            	ret
6011                     ; 1956 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6011                     ; 1957 {
6012                     	switch	.text
6013  06de               _TIM1_SetIC4Prescaler:
6015  06de 88            	push	a
6016       00000000      OFST:	set	0
6019                     ; 1960     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6021                     ; 1963     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6021                     ; 1964                             (uint8_t)TIM1_IC4Prescaler);
6023  06df c6525b        	ld	a,21083
6024  06e2 a4f3          	and	a,#243
6025  06e4 1a01          	or	a,(OFST+1,sp)
6026  06e6 c7525b        	ld	21083,a
6027                     ; 1965 }
6030  06e9 84            	pop	a
6031  06ea 81            	ret
6077                     ; 1972 uint16_t TIM1_GetCapture1(void)
6077                     ; 1973 {
6078                     	switch	.text
6079  06eb               _TIM1_GetCapture1:
6081  06eb 5204          	subw	sp,#4
6082       00000004      OFST:	set	4
6085                     ; 1976     uint16_t tmpccr1 = 0;
6087                     ; 1977     uint8_t tmpccr1l=0, tmpccr1h=0;
6091                     ; 1979     tmpccr1h = TIM1->CCR1H;
6093  06ed c65265        	ld	a,21093
6094  06f0 6b02          	ld	(OFST-2,sp),a
6095                     ; 1980     tmpccr1l = TIM1->CCR1L;
6097  06f2 c65266        	ld	a,21094
6098  06f5 6b01          	ld	(OFST-3,sp),a
6099                     ; 1982     tmpccr1 = (uint16_t)(tmpccr1l);
6101  06f7 7b01          	ld	a,(OFST-3,sp)
6102  06f9 5f            	clrw	x
6103  06fa 97            	ld	xl,a
6104  06fb 1f03          	ldw	(OFST-1,sp),x
6105                     ; 1983     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6107  06fd 7b02          	ld	a,(OFST-2,sp)
6108  06ff 5f            	clrw	x
6109  0700 97            	ld	xl,a
6110  0701 4f            	clr	a
6111  0702 02            	rlwa	x,a
6112  0703 01            	rrwa	x,a
6113  0704 1a04          	or	a,(OFST+0,sp)
6114  0706 01            	rrwa	x,a
6115  0707 1a03          	or	a,(OFST-1,sp)
6116  0709 01            	rrwa	x,a
6117  070a 1f03          	ldw	(OFST-1,sp),x
6118                     ; 1985     return (uint16_t)tmpccr1;
6120  070c 1e03          	ldw	x,(OFST-1,sp)
6123  070e 5b04          	addw	sp,#4
6124  0710 81            	ret
6170                     ; 1993 uint16_t TIM1_GetCapture2(void)
6170                     ; 1994 {
6171                     	switch	.text
6172  0711               _TIM1_GetCapture2:
6174  0711 5204          	subw	sp,#4
6175       00000004      OFST:	set	4
6178                     ; 1997     uint16_t tmpccr2 = 0;
6180                     ; 1998     uint8_t tmpccr2l=0, tmpccr2h=0;
6184                     ; 2000     tmpccr2h = TIM1->CCR2H;
6186  0713 c65267        	ld	a,21095
6187  0716 6b02          	ld	(OFST-2,sp),a
6188                     ; 2001     tmpccr2l = TIM1->CCR2L;
6190  0718 c65268        	ld	a,21096
6191  071b 6b01          	ld	(OFST-3,sp),a
6192                     ; 2003     tmpccr2 = (uint16_t)(tmpccr2l);
6194  071d 7b01          	ld	a,(OFST-3,sp)
6195  071f 5f            	clrw	x
6196  0720 97            	ld	xl,a
6197  0721 1f03          	ldw	(OFST-1,sp),x
6198                     ; 2004     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6200  0723 7b02          	ld	a,(OFST-2,sp)
6201  0725 5f            	clrw	x
6202  0726 97            	ld	xl,a
6203  0727 4f            	clr	a
6204  0728 02            	rlwa	x,a
6205  0729 01            	rrwa	x,a
6206  072a 1a04          	or	a,(OFST+0,sp)
6207  072c 01            	rrwa	x,a
6208  072d 1a03          	or	a,(OFST-1,sp)
6209  072f 01            	rrwa	x,a
6210  0730 1f03          	ldw	(OFST-1,sp),x
6211                     ; 2006     return (uint16_t)tmpccr2;
6213  0732 1e03          	ldw	x,(OFST-1,sp)
6216  0734 5b04          	addw	sp,#4
6217  0736 81            	ret
6263                     ; 2014 uint16_t TIM1_GetCapture3(void)
6263                     ; 2015 {
6264                     	switch	.text
6265  0737               _TIM1_GetCapture3:
6267  0737 5204          	subw	sp,#4
6268       00000004      OFST:	set	4
6271                     ; 2017     uint16_t tmpccr3 = 0;
6273                     ; 2018     uint8_t tmpccr3l=0, tmpccr3h=0;
6277                     ; 2020     tmpccr3h = TIM1->CCR3H;
6279  0739 c65269        	ld	a,21097
6280  073c 6b02          	ld	(OFST-2,sp),a
6281                     ; 2021     tmpccr3l = TIM1->CCR3L;
6283  073e c6526a        	ld	a,21098
6284  0741 6b01          	ld	(OFST-3,sp),a
6285                     ; 2023     tmpccr3 = (uint16_t)(tmpccr3l);
6287  0743 7b01          	ld	a,(OFST-3,sp)
6288  0745 5f            	clrw	x
6289  0746 97            	ld	xl,a
6290  0747 1f03          	ldw	(OFST-1,sp),x
6291                     ; 2024     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6293  0749 7b02          	ld	a,(OFST-2,sp)
6294  074b 5f            	clrw	x
6295  074c 97            	ld	xl,a
6296  074d 4f            	clr	a
6297  074e 02            	rlwa	x,a
6298  074f 01            	rrwa	x,a
6299  0750 1a04          	or	a,(OFST+0,sp)
6300  0752 01            	rrwa	x,a
6301  0753 1a03          	or	a,(OFST-1,sp)
6302  0755 01            	rrwa	x,a
6303  0756 1f03          	ldw	(OFST-1,sp),x
6304                     ; 2026     return (uint16_t)tmpccr3;
6306  0758 1e03          	ldw	x,(OFST-1,sp)
6309  075a 5b04          	addw	sp,#4
6310  075c 81            	ret
6356                     ; 2034 uint16_t TIM1_GetCapture4(void)
6356                     ; 2035 {
6357                     	switch	.text
6358  075d               _TIM1_GetCapture4:
6360  075d 5204          	subw	sp,#4
6361       00000004      OFST:	set	4
6364                     ; 2037     uint16_t tmpccr4 = 0;
6366                     ; 2038     uint8_t tmpccr4l=0, tmpccr4h=0;
6370                     ; 2040     tmpccr4h = TIM1->CCR4H;
6372  075f c6526b        	ld	a,21099
6373  0762 6b02          	ld	(OFST-2,sp),a
6374                     ; 2041     tmpccr4l = TIM1->CCR4L;
6376  0764 c6526c        	ld	a,21100
6377  0767 6b01          	ld	(OFST-3,sp),a
6378                     ; 2043     tmpccr4 = (uint16_t)(tmpccr4l);
6380  0769 7b01          	ld	a,(OFST-3,sp)
6381  076b 5f            	clrw	x
6382  076c 97            	ld	xl,a
6383  076d 1f03          	ldw	(OFST-1,sp),x
6384                     ; 2044     tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6386  076f 7b02          	ld	a,(OFST-2,sp)
6387  0771 5f            	clrw	x
6388  0772 97            	ld	xl,a
6389  0773 4f            	clr	a
6390  0774 02            	rlwa	x,a
6391  0775 01            	rrwa	x,a
6392  0776 1a04          	or	a,(OFST+0,sp)
6393  0778 01            	rrwa	x,a
6394  0779 1a03          	or	a,(OFST-1,sp)
6395  077b 01            	rrwa	x,a
6396  077c 1f03          	ldw	(OFST-1,sp),x
6397                     ; 2046     return (uint16_t)tmpccr4;
6399  077e 1e03          	ldw	x,(OFST-1,sp)
6402  0780 5b04          	addw	sp,#4
6403  0782 81            	ret
6435                     ; 2054 uint16_t TIM1_GetCounter(void)
6435                     ; 2055 {
6436                     	switch	.text
6437  0783               _TIM1_GetCounter:
6439  0783 89            	pushw	x
6440       00000002      OFST:	set	2
6443                     ; 2056   uint16_t tmpcntr = 0;
6445                     ; 2058   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6447  0784 c6525e        	ld	a,21086
6448  0787 5f            	clrw	x
6449  0788 97            	ld	xl,a
6450  0789 4f            	clr	a
6451  078a 02            	rlwa	x,a
6452  078b 1f01          	ldw	(OFST-1,sp),x
6453                     ; 2061     return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6455  078d c6525f        	ld	a,21087
6456  0790 5f            	clrw	x
6457  0791 97            	ld	xl,a
6458  0792 01            	rrwa	x,a
6459  0793 1a02          	or	a,(OFST+0,sp)
6460  0795 01            	rrwa	x,a
6461  0796 1a01          	or	a,(OFST-1,sp)
6462  0798 01            	rrwa	x,a
6465  0799 5b02          	addw	sp,#2
6466  079b 81            	ret
6498                     ; 2069 uint16_t TIM1_GetPrescaler(void)
6498                     ; 2070 {
6499                     	switch	.text
6500  079c               _TIM1_GetPrescaler:
6502  079c 89            	pushw	x
6503       00000002      OFST:	set	2
6506                     ; 2071    uint16_t temp = 0;
6508                     ; 2073    temp = ((uint16_t)TIM1->PSCRH << 8);
6510  079d c65260        	ld	a,21088
6511  07a0 5f            	clrw	x
6512  07a1 97            	ld	xl,a
6513  07a2 4f            	clr	a
6514  07a3 02            	rlwa	x,a
6515  07a4 1f01          	ldw	(OFST-1,sp),x
6516                     ; 2076     return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6518  07a6 c65261        	ld	a,21089
6519  07a9 5f            	clrw	x
6520  07aa 97            	ld	xl,a
6521  07ab 01            	rrwa	x,a
6522  07ac 1a02          	or	a,(OFST+0,sp)
6523  07ae 01            	rrwa	x,a
6524  07af 1a01          	or	a,(OFST-1,sp)
6525  07b1 01            	rrwa	x,a
6528  07b2 5b02          	addw	sp,#2
6529  07b4 81            	ret
6699                     ; 2097 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6699                     ; 2098 {
6700                     	switch	.text
6701  07b5               _TIM1_GetFlagStatus:
6703  07b5 89            	pushw	x
6704  07b6 89            	pushw	x
6705       00000002      OFST:	set	2
6708                     ; 2099     FlagStatus bitstatus = RESET;
6710                     ; 2100     uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6714                     ; 2103     assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6716                     ; 2105     tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6718  07b7 9f            	ld	a,xl
6719  07b8 c45255        	and	a,21077
6720  07bb 6b01          	ld	(OFST-1,sp),a
6721                     ; 2106     tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6723  07bd 7b03          	ld	a,(OFST+1,sp)
6724  07bf 6b02          	ld	(OFST+0,sp),a
6725                     ; 2108     if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6727  07c1 c65256        	ld	a,21078
6728  07c4 1402          	and	a,(OFST+0,sp)
6729  07c6 1a01          	or	a,(OFST-1,sp)
6730  07c8 2706          	jreq	L7433
6731                     ; 2110         bitstatus = SET;
6733  07ca a601          	ld	a,#1
6734  07cc 6b02          	ld	(OFST+0,sp),a
6736  07ce 2002          	jra	L1533
6737  07d0               L7433:
6738                     ; 2114         bitstatus = RESET;
6740  07d0 0f02          	clr	(OFST+0,sp)
6741  07d2               L1533:
6742                     ; 2116     return (FlagStatus)(bitstatus);
6744  07d2 7b02          	ld	a,(OFST+0,sp)
6747  07d4 5b04          	addw	sp,#4
6748  07d6 81            	ret
6783                     ; 2137 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6783                     ; 2138 {
6784                     	switch	.text
6785  07d7               _TIM1_ClearFlag:
6787  07d7 89            	pushw	x
6788       00000000      OFST:	set	0
6791                     ; 2140     assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6793                     ; 2143     TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6795  07d8 9f            	ld	a,xl
6796  07d9 43            	cpl	a
6797  07da c75255        	ld	21077,a
6798                     ; 2144     TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6798                     ; 2145                           (uint8_t)0x1E);
6800  07dd 7b01          	ld	a,(OFST+1,sp)
6801  07df 43            	cpl	a
6802  07e0 a41e          	and	a,#30
6803  07e2 c75256        	ld	21078,a
6804                     ; 2146 }
6807  07e5 85            	popw	x
6808  07e6 81            	ret
6868                     ; 2162 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6868                     ; 2163 {
6869                     	switch	.text
6870  07e7               _TIM1_GetITStatus:
6872  07e7 88            	push	a
6873  07e8 89            	pushw	x
6874       00000002      OFST:	set	2
6877                     ; 2164     ITStatus bitstatus = RESET;
6879                     ; 2165     uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6883                     ; 2168     assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6885                     ; 2170     TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6887  07e9 c45255        	and	a,21077
6888  07ec 6b01          	ld	(OFST-1,sp),a
6889                     ; 2172     TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6891  07ee c65254        	ld	a,21076
6892  07f1 1403          	and	a,(OFST+1,sp)
6893  07f3 6b02          	ld	(OFST+0,sp),a
6894                     ; 2174     if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6896  07f5 0d01          	tnz	(OFST-1,sp)
6897  07f7 270a          	jreq	L7143
6899  07f9 0d02          	tnz	(OFST+0,sp)
6900  07fb 2706          	jreq	L7143
6901                     ; 2176         bitstatus = SET;
6903  07fd a601          	ld	a,#1
6904  07ff 6b02          	ld	(OFST+0,sp),a
6906  0801 2002          	jra	L1243
6907  0803               L7143:
6908                     ; 2180         bitstatus = RESET;
6910  0803 0f02          	clr	(OFST+0,sp)
6911  0805               L1243:
6912                     ; 2182     return (ITStatus)(bitstatus);
6914  0805 7b02          	ld	a,(OFST+0,sp)
6917  0807 5b03          	addw	sp,#3
6918  0809 81            	ret
6954                     ; 2199 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6954                     ; 2200 {
6955                     	switch	.text
6956  080a               _TIM1_ClearITPendingBit:
6960                     ; 2202     assert_param(IS_TIM1_IT_OK(TIM1_IT));
6962                     ; 2205     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
6964  080a 43            	cpl	a
6965  080b c75255        	ld	21077,a
6966                     ; 2206 }
6969  080e 81            	ret
7015                     ; 2224 static void TI1_Config(uint8_t TIM1_ICPolarity,
7015                     ; 2225                        uint8_t TIM1_ICSelection,
7015                     ; 2226                        uint8_t TIM1_ICFilter)
7015                     ; 2227 {
7016                     	switch	.text
7017  080f               L3_TI1_Config:
7019  080f 89            	pushw	x
7020  0810 88            	push	a
7021       00000001      OFST:	set	1
7024                     ; 2230     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7026  0811 7211525c      	bres	21084,#0
7027                     ; 2233     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7027                     ; 2234                             (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7029  0815 7b06          	ld	a,(OFST+5,sp)
7030  0817 97            	ld	xl,a
7031  0818 a610          	ld	a,#16
7032  081a 42            	mul	x,a
7033  081b 9f            	ld	a,xl
7034  081c 1a03          	or	a,(OFST+2,sp)
7035  081e 6b01          	ld	(OFST+0,sp),a
7036  0820 c65258        	ld	a,21080
7037  0823 a40c          	and	a,#12
7038  0825 1a01          	or	a,(OFST+0,sp)
7039  0827 c75258        	ld	21080,a
7040                     ; 2237     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7042  082a 0d02          	tnz	(OFST+1,sp)
7043  082c 2706          	jreq	L1643
7044                     ; 2239         TIM1->CCER1 |= TIM1_CCER1_CC1P;
7046  082e 7212525c      	bset	21084,#1
7048  0832 2004          	jra	L3643
7049  0834               L1643:
7050                     ; 2243         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7052  0834 7213525c      	bres	21084,#1
7053  0838               L3643:
7054                     ; 2247     TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7056  0838 7210525c      	bset	21084,#0
7057                     ; 2248 }
7060  083c 5b03          	addw	sp,#3
7061  083e 81            	ret
7107                     ; 2266 static void TI2_Config(uint8_t TIM1_ICPolarity,
7107                     ; 2267                        uint8_t TIM1_ICSelection,
7107                     ; 2268                        uint8_t TIM1_ICFilter)
7107                     ; 2269 {
7108                     	switch	.text
7109  083f               L5_TI2_Config:
7111  083f 89            	pushw	x
7112  0840 88            	push	a
7113       00000001      OFST:	set	1
7116                     ; 2271     TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7118  0841 7219525c      	bres	21084,#4
7119                     ; 2274     TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7119                     ; 2275                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7121  0845 7b06          	ld	a,(OFST+5,sp)
7122  0847 97            	ld	xl,a
7123  0848 a610          	ld	a,#16
7124  084a 42            	mul	x,a
7125  084b 9f            	ld	a,xl
7126  084c 1a03          	or	a,(OFST+2,sp)
7127  084e 6b01          	ld	(OFST+0,sp),a
7128  0850 c65259        	ld	a,21081
7129  0853 a40c          	and	a,#12
7130  0855 1a01          	or	a,(OFST+0,sp)
7131  0857 c75259        	ld	21081,a
7132                     ; 2277     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7134  085a 0d02          	tnz	(OFST+1,sp)
7135  085c 2706          	jreq	L5053
7136                     ; 2279         TIM1->CCER1 |= TIM1_CCER1_CC2P;
7138  085e 721a525c      	bset	21084,#5
7140  0862 2004          	jra	L7053
7141  0864               L5053:
7142                     ; 2283         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7144  0864 721b525c      	bres	21084,#5
7145  0868               L7053:
7146                     ; 2286     TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7148  0868 7218525c      	bset	21084,#4
7149                     ; 2287 }
7152  086c 5b03          	addw	sp,#3
7153  086e 81            	ret
7199                     ; 2305 static void TI3_Config(uint8_t TIM1_ICPolarity,
7199                     ; 2306                        uint8_t TIM1_ICSelection,
7199                     ; 2307                        uint8_t TIM1_ICFilter)
7199                     ; 2308 {
7200                     	switch	.text
7201  086f               L7_TI3_Config:
7203  086f 89            	pushw	x
7204  0870 88            	push	a
7205       00000001      OFST:	set	1
7208                     ; 2310     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7210  0871 7211525d      	bres	21085,#0
7211                     ; 2313     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7211                     ; 2314                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7213  0875 7b06          	ld	a,(OFST+5,sp)
7214  0877 97            	ld	xl,a
7215  0878 a610          	ld	a,#16
7216  087a 42            	mul	x,a
7217  087b 9f            	ld	a,xl
7218  087c 1a03          	or	a,(OFST+2,sp)
7219  087e 6b01          	ld	(OFST+0,sp),a
7220  0880 c6525a        	ld	a,21082
7221  0883 a40c          	and	a,#12
7222  0885 1a01          	or	a,(OFST+0,sp)
7223  0887 c7525a        	ld	21082,a
7224                     ; 2317     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7226  088a 0d02          	tnz	(OFST+1,sp)
7227  088c 2706          	jreq	L1353
7228                     ; 2319         TIM1->CCER2 |= TIM1_CCER2_CC3P;
7230  088e 7212525d      	bset	21085,#1
7232  0892 2004          	jra	L3353
7233  0894               L1353:
7234                     ; 2323         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7236  0894 7213525d      	bres	21085,#1
7237  0898               L3353:
7238                     ; 2326     TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7240  0898 7210525d      	bset	21085,#0
7241                     ; 2327 }
7244  089c 5b03          	addw	sp,#3
7245  089e 81            	ret
7291                     ; 2346 static void TI4_Config(uint8_t TIM1_ICPolarity,
7291                     ; 2347                        uint8_t TIM1_ICSelection,
7291                     ; 2348                        uint8_t TIM1_ICFilter)
7291                     ; 2349 {
7292                     	switch	.text
7293  089f               L11_TI4_Config:
7295  089f 89            	pushw	x
7296  08a0 88            	push	a
7297       00000001      OFST:	set	1
7300                     ; 2352     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7302  08a1 7219525d      	bres	21085,#4
7303                     ; 2355     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7303                     ; 2356                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7305  08a5 7b06          	ld	a,(OFST+5,sp)
7306  08a7 97            	ld	xl,a
7307  08a8 a610          	ld	a,#16
7308  08aa 42            	mul	x,a
7309  08ab 9f            	ld	a,xl
7310  08ac 1a03          	or	a,(OFST+2,sp)
7311  08ae 6b01          	ld	(OFST+0,sp),a
7312  08b0 c6525b        	ld	a,21083
7313  08b3 a40c          	and	a,#12
7314  08b5 1a01          	or	a,(OFST+0,sp)
7315  08b7 c7525b        	ld	21083,a
7316                     ; 2359     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7318  08ba 0d02          	tnz	(OFST+1,sp)
7319  08bc 2706          	jreq	L5553
7320                     ; 2361         TIM1->CCER2 |= TIM1_CCER2_CC4P;
7322  08be 721a525d      	bset	21085,#5
7324  08c2 2004          	jra	L7553
7325  08c4               L5553:
7326                     ; 2365         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7328  08c4 721b525d      	bres	21085,#5
7329  08c8               L7553:
7330                     ; 2369     TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7332  08c8 7218525d      	bset	21085,#4
7333                     ; 2370 }
7336  08cc 5b03          	addw	sp,#3
7337  08ce 81            	ret
7350                     	xdef	_TIM1_ClearITPendingBit
7351                     	xdef	_TIM1_GetITStatus
7352                     	xdef	_TIM1_ClearFlag
7353                     	xdef	_TIM1_GetFlagStatus
7354                     	xdef	_TIM1_GetPrescaler
7355                     	xdef	_TIM1_GetCounter
7356                     	xdef	_TIM1_GetCapture4
7357                     	xdef	_TIM1_GetCapture3
7358                     	xdef	_TIM1_GetCapture2
7359                     	xdef	_TIM1_GetCapture1
7360                     	xdef	_TIM1_SetIC4Prescaler
7361                     	xdef	_TIM1_SetIC3Prescaler
7362                     	xdef	_TIM1_SetIC2Prescaler
7363                     	xdef	_TIM1_SetIC1Prescaler
7364                     	xdef	_TIM1_SetCompare4
7365                     	xdef	_TIM1_SetCompare3
7366                     	xdef	_TIM1_SetCompare2
7367                     	xdef	_TIM1_SetCompare1
7368                     	xdef	_TIM1_SetAutoreload
7369                     	xdef	_TIM1_SetCounter
7370                     	xdef	_TIM1_SelectOCxM
7371                     	xdef	_TIM1_CCxNCmd
7372                     	xdef	_TIM1_CCxCmd
7373                     	xdef	_TIM1_OC4PolarityConfig
7374                     	xdef	_TIM1_OC3NPolarityConfig
7375                     	xdef	_TIM1_OC3PolarityConfig
7376                     	xdef	_TIM1_OC2NPolarityConfig
7377                     	xdef	_TIM1_OC2PolarityConfig
7378                     	xdef	_TIM1_OC1NPolarityConfig
7379                     	xdef	_TIM1_OC1PolarityConfig
7380                     	xdef	_TIM1_GenerateEvent
7381                     	xdef	_TIM1_OC4FastConfig
7382                     	xdef	_TIM1_OC3FastConfig
7383                     	xdef	_TIM1_OC2FastConfig
7384                     	xdef	_TIM1_OC1FastConfig
7385                     	xdef	_TIM1_OC4PreloadConfig
7386                     	xdef	_TIM1_OC3PreloadConfig
7387                     	xdef	_TIM1_OC2PreloadConfig
7388                     	xdef	_TIM1_OC1PreloadConfig
7389                     	xdef	_TIM1_CCPreloadControl
7390                     	xdef	_TIM1_SelectCOM
7391                     	xdef	_TIM1_ARRPreloadConfig
7392                     	xdef	_TIM1_ForcedOC4Config
7393                     	xdef	_TIM1_ForcedOC3Config
7394                     	xdef	_TIM1_ForcedOC2Config
7395                     	xdef	_TIM1_ForcedOC1Config
7396                     	xdef	_TIM1_CounterModeConfig
7397                     	xdef	_TIM1_PrescalerConfig
7398                     	xdef	_TIM1_EncoderInterfaceConfig
7399                     	xdef	_TIM1_SelectMasterSlaveMode
7400                     	xdef	_TIM1_SelectSlaveMode
7401                     	xdef	_TIM1_SelectOutputTrigger
7402                     	xdef	_TIM1_SelectOnePulseMode
7403                     	xdef	_TIM1_SelectHallSensor
7404                     	xdef	_TIM1_UpdateRequestConfig
7405                     	xdef	_TIM1_UpdateDisableConfig
7406                     	xdef	_TIM1_SelectInputTrigger
7407                     	xdef	_TIM1_TIxExternalClockConfig
7408                     	xdef	_TIM1_ETRConfig
7409                     	xdef	_TIM1_ETRClockMode2Config
7410                     	xdef	_TIM1_ETRClockMode1Config
7411                     	xdef	_TIM1_InternalClockConfig
7412                     	xdef	_TIM1_ITConfig
7413                     	xdef	_TIM1_CtrlPWMOutputs
7414                     	xdef	_TIM1_Cmd
7415                     	xdef	_TIM1_PWMIConfig
7416                     	xdef	_TIM1_ICInit
7417                     	xdef	_TIM1_BDTRConfig
7418                     	xdef	_TIM1_OC4Init
7419                     	xdef	_TIM1_OC3Init
7420                     	xdef	_TIM1_OC2Init
7421                     	xdef	_TIM1_OC1Init
7422                     	xdef	_TIM1_TimeBaseInit
7423                     	xdef	_TIM1_DeInit
7442                     	end
