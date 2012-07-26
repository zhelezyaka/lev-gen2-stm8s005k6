   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 43 void TIM4_DeInit(void)
  43                     ; 44 {
  45                     	switch	.text
  46  0000               _TIM4_DeInit:
  50                     ; 45     TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  52  0000 725f5340      	clr	21312
  53                     ; 46     TIM4->IER = TIM4_IER_RESET_VALUE;
  55  0004 725f5341      	clr	21313
  56                     ; 47     TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  58  0008 725f5344      	clr	21316
  59                     ; 48     TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  61  000c 725f5345      	clr	21317
  62                     ; 49     TIM4->ARR = TIM4_ARR_RESET_VALUE;
  64  0010 35ff5346      	mov	21318,#255
  65                     ; 50     TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  67  0014 725f5342      	clr	21314
  68                     ; 51 }
  71  0018 81            	ret
 175                     ; 59 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 175                     ; 60 {
 176                     	switch	.text
 177  0019               _TIM4_TimeBaseInit:
 181                     ; 62     assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 183                     ; 64     TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 185  0019 9e            	ld	a,xh
 186  001a c75345        	ld	21317,a
 187                     ; 66     TIM4->ARR = (uint8_t)(TIM4_Period);
 189  001d 9f            	ld	a,xl
 190  001e c75346        	ld	21318,a
 191                     ; 67 }
 194  0021 81            	ret
 249                     ; 77 void TIM4_Cmd(FunctionalState NewState)
 249                     ; 78 {
 250                     	switch	.text
 251  0022               _TIM4_Cmd:
 255                     ; 80     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 257                     ; 83     if (NewState != DISABLE)
 259  0022 4d            	tnz	a
 260  0023 2706          	jreq	L311
 261                     ; 85         TIM4->CR1 |= TIM4_CR1_CEN;
 263  0025 72105340      	bset	21312,#0
 265  0029 2004          	jra	L511
 266  002b               L311:
 267                     ; 89         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 269  002b 72115340      	bres	21312,#0
 270  002f               L511:
 271                     ; 91 }
 274  002f 81            	ret
 332                     ; 103 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 332                     ; 104 {
 333                     	switch	.text
 334  0030               _TIM4_ITConfig:
 336  0030 89            	pushw	x
 337       00000000      OFST:	set	0
 340                     ; 106     assert_param(IS_TIM4_IT_OK(TIM4_IT));
 342                     ; 107     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 344                     ; 109     if (NewState != DISABLE)
 346  0031 9f            	ld	a,xl
 347  0032 4d            	tnz	a
 348  0033 2709          	jreq	L741
 349                     ; 112         TIM4->IER |= (uint8_t)TIM4_IT;
 351  0035 9e            	ld	a,xh
 352  0036 ca5341        	or	a,21313
 353  0039 c75341        	ld	21313,a
 355  003c 2009          	jra	L151
 356  003e               L741:
 357                     ; 117         TIM4->IER &= (uint8_t)(~TIM4_IT);
 359  003e 7b01          	ld	a,(OFST+1,sp)
 360  0040 43            	cpl	a
 361  0041 c45341        	and	a,21313
 362  0044 c75341        	ld	21313,a
 363  0047               L151:
 364                     ; 119 }
 367  0047 85            	popw	x
 368  0048 81            	ret
 404                     ; 127 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 404                     ; 128 {
 405                     	switch	.text
 406  0049               _TIM4_UpdateDisableConfig:
 410                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 412                     ; 133     if (NewState != DISABLE)
 414  0049 4d            	tnz	a
 415  004a 2706          	jreq	L171
 416                     ; 135         TIM4->CR1 |= TIM4_CR1_UDIS;
 418  004c 72125340      	bset	21312,#1
 420  0050 2004          	jra	L371
 421  0052               L171:
 422                     ; 139         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 424  0052 72135340      	bres	21312,#1
 425  0056               L371:
 426                     ; 141 }
 429  0056 81            	ret
 487                     ; 151 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 487                     ; 152 {
 488                     	switch	.text
 489  0057               _TIM4_UpdateRequestConfig:
 493                     ; 154     assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 495                     ; 157     if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 497  0057 4d            	tnz	a
 498  0058 2706          	jreq	L322
 499                     ; 159         TIM4->CR1 |= TIM4_CR1_URS;
 501  005a 72145340      	bset	21312,#2
 503  005e 2004          	jra	L522
 504  0060               L322:
 505                     ; 163         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 507  0060 72155340      	bres	21312,#2
 508  0064               L522:
 509                     ; 165 }
 512  0064 81            	ret
 569                     ; 175 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 569                     ; 176 {
 570                     	switch	.text
 571  0065               _TIM4_SelectOnePulseMode:
 575                     ; 178     assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 577                     ; 181     if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 579  0065 4d            	tnz	a
 580  0066 2706          	jreq	L552
 581                     ; 183         TIM4->CR1 |= TIM4_CR1_OPM;
 583  0068 72165340      	bset	21312,#3
 585  006c 2004          	jra	L752
 586  006e               L552:
 587                     ; 187         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 589  006e 72175340      	bres	21312,#3
 590  0072               L752:
 591                     ; 190 }
 594  0072 81            	ret
 662                     ; 212 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 662                     ; 213 {
 663                     	switch	.text
 664  0073               _TIM4_PrescalerConfig:
 668                     ; 215     assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 670                     ; 216     assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 672                     ; 219     TIM4->PSCR = (uint8_t)Prescaler;
 674  0073 9e            	ld	a,xh
 675  0074 c75345        	ld	21317,a
 676                     ; 222     TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 678  0077 9f            	ld	a,xl
 679  0078 c75343        	ld	21315,a
 680                     ; 223 }
 683  007b 81            	ret
 719                     ; 231 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 719                     ; 232 {
 720                     	switch	.text
 721  007c               _TIM4_ARRPreloadConfig:
 725                     ; 234     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 727                     ; 237     if (NewState != DISABLE)
 729  007c 4d            	tnz	a
 730  007d 2706          	jreq	L133
 731                     ; 239         TIM4->CR1 |= TIM4_CR1_ARPE;
 733  007f 721e5340      	bset	21312,#7
 735  0083 2004          	jra	L333
 736  0085               L133:
 737                     ; 243         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 739  0085 721f5340      	bres	21312,#7
 740  0089               L333:
 741                     ; 245 }
 744  0089 81            	ret
 793                     ; 254 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 793                     ; 255 {
 794                     	switch	.text
 795  008a               _TIM4_GenerateEvent:
 799                     ; 257     assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 801                     ; 260     TIM4->EGR = (uint8_t)(TIM4_EventSource);
 803  008a c75343        	ld	21315,a
 804                     ; 261 }
 807  008d 81            	ret
 839                     ; 270 void TIM4_SetCounter(uint8_t Counter)
 839                     ; 271 {
 840                     	switch	.text
 841  008e               _TIM4_SetCounter:
 845                     ; 273     TIM4->CNTR = (uint8_t)(Counter);
 847  008e c75344        	ld	21316,a
 848                     ; 274 }
 851  0091 81            	ret
 883                     ; 283 void TIM4_SetAutoreload(uint8_t Autoreload)
 883                     ; 284 {
 884                     	switch	.text
 885  0092               _TIM4_SetAutoreload:
 889                     ; 286     TIM4->ARR = (uint8_t)(Autoreload);
 891  0092 c75346        	ld	21318,a
 892                     ; 287 }
 895  0095 81            	ret
 918                     ; 294 uint8_t TIM4_GetCounter(void)
 918                     ; 295 {
 919                     	switch	.text
 920  0096               _TIM4_GetCounter:
 924                     ; 297     return (uint8_t)(TIM4->CNTR);
 926  0096 c65344        	ld	a,21316
 929  0099 81            	ret
 953                     ; 305 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 953                     ; 306 {
 954                     	switch	.text
 955  009a               _TIM4_GetPrescaler:
 959                     ; 308     return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 961  009a c65345        	ld	a,21317
 964  009d 81            	ret
1043                     ; 318 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1043                     ; 319 {
1044                     	switch	.text
1045  009e               _TIM4_GetFlagStatus:
1047  009e 88            	push	a
1048       00000001      OFST:	set	1
1051                     ; 320     FlagStatus bitstatus = RESET;
1053                     ; 323     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1055                     ; 325   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1057  009f c45342        	and	a,21314
1058  00a2 2706          	jreq	L174
1059                     ; 327     bitstatus = SET;
1061  00a4 a601          	ld	a,#1
1062  00a6 6b01          	ld	(OFST+0,sp),a
1064  00a8 2002          	jra	L374
1065  00aa               L174:
1066                     ; 331     bitstatus = RESET;
1068  00aa 0f01          	clr	(OFST+0,sp)
1069  00ac               L374:
1070                     ; 333   return ((FlagStatus)bitstatus);
1072  00ac 7b01          	ld	a,(OFST+0,sp)
1075  00ae 5b01          	addw	sp,#1
1076  00b0 81            	ret
1111                     ; 343 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1111                     ; 344 {
1112                     	switch	.text
1113  00b1               _TIM4_ClearFlag:
1117                     ; 346     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1119                     ; 349     TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1121  00b1 43            	cpl	a
1122  00b2 c75342        	ld	21314,a
1123                     ; 351 }
1126  00b5 81            	ret
1186                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1186                     ; 361 {
1187                     	switch	.text
1188  00b6               _TIM4_GetITStatus:
1190  00b6 88            	push	a
1191  00b7 89            	pushw	x
1192       00000002      OFST:	set	2
1195                     ; 362     ITStatus bitstatus = RESET;
1197                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1201                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1203                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1205  00b8 c45342        	and	a,21314
1206  00bb 6b01          	ld	(OFST-1,sp),a
1207                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1209  00bd c65341        	ld	a,21313
1210  00c0 1403          	and	a,(OFST+1,sp)
1211  00c2 6b02          	ld	(OFST+0,sp),a
1212                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1214  00c4 0d01          	tnz	(OFST-1,sp)
1215  00c6 270a          	jreq	L145
1217  00c8 0d02          	tnz	(OFST+0,sp)
1218  00ca 2706          	jreq	L145
1219                     ; 375     bitstatus = (ITStatus)SET;
1221  00cc a601          	ld	a,#1
1222  00ce 6b02          	ld	(OFST+0,sp),a
1224  00d0 2002          	jra	L345
1225  00d2               L145:
1226                     ; 379     bitstatus = (ITStatus)RESET;
1228  00d2 0f02          	clr	(OFST+0,sp)
1229  00d4               L345:
1230                     ; 381   return ((ITStatus)bitstatus);
1232  00d4 7b02          	ld	a,(OFST+0,sp)
1235  00d6 5b03          	addw	sp,#3
1236  00d8 81            	ret
1272                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1272                     ; 392 {
1273                     	switch	.text
1274  00d9               _TIM4_ClearITPendingBit:
1278                     ; 394     assert_param(IS_TIM4_IT_OK(TIM4_IT));
1280                     ; 397     TIM4->SR1 = (uint8_t)(~TIM4_IT);
1282  00d9 43            	cpl	a
1283  00da c75342        	ld	21314,a
1284                     ; 398 }
1287  00dd 81            	ret
1300                     	xdef	_TIM4_ClearITPendingBit
1301                     	xdef	_TIM4_GetITStatus
1302                     	xdef	_TIM4_ClearFlag
1303                     	xdef	_TIM4_GetFlagStatus
1304                     	xdef	_TIM4_GetPrescaler
1305                     	xdef	_TIM4_GetCounter
1306                     	xdef	_TIM4_SetAutoreload
1307                     	xdef	_TIM4_SetCounter
1308                     	xdef	_TIM4_GenerateEvent
1309                     	xdef	_TIM4_ARRPreloadConfig
1310                     	xdef	_TIM4_PrescalerConfig
1311                     	xdef	_TIM4_SelectOnePulseMode
1312                     	xdef	_TIM4_UpdateRequestConfig
1313                     	xdef	_TIM4_UpdateDisableConfig
1314                     	xdef	_TIM4_ITConfig
1315                     	xdef	_TIM4_Cmd
1316                     	xdef	_TIM4_TimeBaseInit
1317                     	xdef	_TIM4_DeInit
1336                     	end
