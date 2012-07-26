   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 48 void ADC1_DeInit(void)
  43                     ; 49 {
  45                     	switch	.text
  46  0000               _ADC1_DeInit:
  50                     ; 50     ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  52  0000 725f5400      	clr	21504
  53                     ; 51     ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  55  0004 725f5401      	clr	21505
  56                     ; 52     ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  58  0008 725f5402      	clr	21506
  59                     ; 53     ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  61  000c 725f5403      	clr	21507
  62                     ; 54     ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  64  0010 725f5406      	clr	21510
  65                     ; 55     ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  67  0014 725f5407      	clr	21511
  68                     ; 56     ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  70  0018 35ff5408      	mov	21512,#255
  71                     ; 57     ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  73  001c 35035409      	mov	21513,#3
  74                     ; 58     ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  76  0020 725f540a      	clr	21514
  77                     ; 59     ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  79  0024 725f540b      	clr	21515
  80                     ; 60     ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  82  0028 725f540e      	clr	21518
  83                     ; 61     ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  85  002c 725f540f      	clr	21519
  86                     ; 62 }
  89  0030 81            	ret
 540                     ; 85 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 540                     ; 86 {
 541                     	switch	.text
 542  0031               _ADC1_Init:
 544  0031 89            	pushw	x
 545       00000000      OFST:	set	0
 548                     ; 89     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 550                     ; 90     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 552                     ; 91     assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 554                     ; 92     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 556                     ; 93     assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 558                     ; 94     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 560                     ; 95     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 562                     ; 96     assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 564                     ; 101     ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 566  0032 7b08          	ld	a,(OFST+8,sp)
 567  0034 88            	push	a
 568  0035 9f            	ld	a,xl
 569  0036 97            	ld	xl,a
 570  0037 7b02          	ld	a,(OFST+2,sp)
 571  0039 95            	ld	xh,a
 572  003a cd013d        	call	_ADC1_ConversionConfig
 574  003d 84            	pop	a
 575                     ; 103     ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 577  003e 7b05          	ld	a,(OFST+5,sp)
 578  0040 ad5a          	call	_ADC1_PrescalerConfig
 580                     ; 108     ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 582  0042 7b07          	ld	a,(OFST+7,sp)
 583  0044 97            	ld	xl,a
 584  0045 7b06          	ld	a,(OFST+6,sp)
 585  0047 95            	ld	xh,a
 586  0048 cd016b        	call	_ADC1_ExternalTriggerConfig
 588                     ; 113     ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 590  004b 7b0a          	ld	a,(OFST+10,sp)
 591  004d 97            	ld	xl,a
 592  004e 7b09          	ld	a,(OFST+9,sp)
 593  0050 95            	ld	xh,a
 594  0051 ad5c          	call	_ADC1_SchmittTriggerConfig
 596                     ; 116     ADC1->CR1 |= ADC1_CR1_ADON;
 598  0053 72105401      	bset	21505,#0
 599                     ; 118 }
 602  0057 85            	popw	x
 603  0058 81            	ret
 638                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 638                     ; 127 {
 639                     	switch	.text
 640  0059               _ADC1_Cmd:
 644                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 646                     ; 132     if (NewState != DISABLE)
 648  0059 4d            	tnz	a
 649  005a 2706          	jreq	L362
 650                     ; 134         ADC1->CR1 |= ADC1_CR1_ADON;
 652  005c 72105401      	bset	21505,#0
 654  0060 2004          	jra	L562
 655  0062               L362:
 656                     ; 138         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 658  0062 72115401      	bres	21505,#0
 659  0066               L562:
 660                     ; 141 }
 663  0066 81            	ret
 698                     ; 148 void ADC1_ScanModeCmd(FunctionalState NewState)
 698                     ; 149 {
 699                     	switch	.text
 700  0067               _ADC1_ScanModeCmd:
 704                     ; 152     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 706                     ; 154     if (NewState != DISABLE)
 708  0067 4d            	tnz	a
 709  0068 2706          	jreq	L503
 710                     ; 156         ADC1->CR2 |= ADC1_CR2_SCAN;
 712  006a 72125402      	bset	21506,#1
 714  006e 2004          	jra	L703
 715  0070               L503:
 716                     ; 160         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 718  0070 72135402      	bres	21506,#1
 719  0074               L703:
 720                     ; 163 }
 723  0074 81            	ret
 758                     ; 170 void ADC1_DataBufferCmd(FunctionalState NewState)
 758                     ; 171 {
 759                     	switch	.text
 760  0075               _ADC1_DataBufferCmd:
 764                     ; 174     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 766                     ; 176     if (NewState != DISABLE)
 768  0075 4d            	tnz	a
 769  0076 2706          	jreq	L723
 770                     ; 178         ADC1->CR3 |= ADC1_CR3_DBUF;
 772  0078 721e5403      	bset	21507,#7
 774  007c 2004          	jra	L133
 775  007e               L723:
 776                     ; 182         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 778  007e 721f5403      	bres	21507,#7
 779  0082               L133:
 780                     ; 185 }
 783  0082 81            	ret
 939                     ; 196 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 939                     ; 197 {
 940                     	switch	.text
 941  0083               _ADC1_ITConfig:
 943  0083 89            	pushw	x
 944       00000000      OFST:	set	0
 947                     ; 200     assert_param(IS_ADC1_IT_OK(ADC1_IT));
 949                     ; 201     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 951                     ; 203     if (NewState != DISABLE)
 953  0084 0d05          	tnz	(OFST+5,sp)
 954  0086 2709          	jreq	L714
 955                     ; 206         ADC1->CSR |= (uint8_t)ADC1_IT;
 957  0088 9f            	ld	a,xl
 958  0089 ca5400        	or	a,21504
 959  008c c75400        	ld	21504,a
 961  008f 2009          	jra	L124
 962  0091               L714:
 963                     ; 211         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 965  0091 7b02          	ld	a,(OFST+2,sp)
 966  0093 43            	cpl	a
 967  0094 c45400        	and	a,21504
 968  0097 c75400        	ld	21504,a
 969  009a               L124:
 970                     ; 214 }
 973  009a 85            	popw	x
 974  009b 81            	ret
1010                     ; 222 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1010                     ; 223 {
1011                     	switch	.text
1012  009c               _ADC1_PrescalerConfig:
1014  009c 88            	push	a
1015       00000000      OFST:	set	0
1018                     ; 226     assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1020                     ; 229     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1022  009d c65401        	ld	a,21505
1023  00a0 a48f          	and	a,#143
1024  00a2 c75401        	ld	21505,a
1025                     ; 231     ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1027  00a5 c65401        	ld	a,21505
1028  00a8 1a01          	or	a,(OFST+1,sp)
1029  00aa c75401        	ld	21505,a
1030                     ; 233 }
1033  00ad 84            	pop	a
1034  00ae 81            	ret
1081                     ; 244 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1081                     ; 245 {
1082                     	switch	.text
1083  00af               _ADC1_SchmittTriggerConfig:
1085  00af 89            	pushw	x
1086       00000000      OFST:	set	0
1089                     ; 248     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1091                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1093                     ; 251     if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1095  00b0 9e            	ld	a,xh
1096  00b1 a1ff          	cp	a,#255
1097  00b3 2620          	jrne	L364
1098                     ; 253         if (NewState != DISABLE)
1100  00b5 9f            	ld	a,xl
1101  00b6 4d            	tnz	a
1102  00b7 270a          	jreq	L564
1103                     ; 255             ADC1->TDRL &= (uint8_t)0x0;
1105  00b9 725f5407      	clr	21511
1106                     ; 256             ADC1->TDRH &= (uint8_t)0x0;
1108  00bd 725f5406      	clr	21510
1110  00c1 2078          	jra	L174
1111  00c3               L564:
1112                     ; 260             ADC1->TDRL |= (uint8_t)0xFF;
1114  00c3 c65407        	ld	a,21511
1115  00c6 aaff          	or	a,#255
1116  00c8 c75407        	ld	21511,a
1117                     ; 261             ADC1->TDRH |= (uint8_t)0xFF;
1119  00cb c65406        	ld	a,21510
1120  00ce aaff          	or	a,#255
1121  00d0 c75406        	ld	21510,a
1122  00d3 2066          	jra	L174
1123  00d5               L364:
1124                     ; 264     else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1126  00d5 7b01          	ld	a,(OFST+1,sp)
1127  00d7 a108          	cp	a,#8
1128  00d9 242f          	jruge	L374
1129                     ; 266         if (NewState != DISABLE)
1131  00db 0d02          	tnz	(OFST+2,sp)
1132  00dd 2716          	jreq	L574
1133                     ; 268             ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1135  00df 7b01          	ld	a,(OFST+1,sp)
1136  00e1 5f            	clrw	x
1137  00e2 97            	ld	xl,a
1138  00e3 a601          	ld	a,#1
1139  00e5 5d            	tnzw	x
1140  00e6 2704          	jreq	L42
1141  00e8               L62:
1142  00e8 48            	sll	a
1143  00e9 5a            	decw	x
1144  00ea 26fc          	jrne	L62
1145  00ec               L42:
1146  00ec 43            	cpl	a
1147  00ed c45407        	and	a,21511
1148  00f0 c75407        	ld	21511,a
1150  00f3 2046          	jra	L174
1151  00f5               L574:
1152                     ; 272             ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1154  00f5 7b01          	ld	a,(OFST+1,sp)
1155  00f7 5f            	clrw	x
1156  00f8 97            	ld	xl,a
1157  00f9 a601          	ld	a,#1
1158  00fb 5d            	tnzw	x
1159  00fc 2704          	jreq	L03
1160  00fe               L23:
1161  00fe 48            	sll	a
1162  00ff 5a            	decw	x
1163  0100 26fc          	jrne	L23
1164  0102               L03:
1165  0102 ca5407        	or	a,21511
1166  0105 c75407        	ld	21511,a
1167  0108 2031          	jra	L174
1168  010a               L374:
1169                     ; 277         if (NewState != DISABLE)
1171  010a 0d02          	tnz	(OFST+2,sp)
1172  010c 2718          	jreq	L305
1173                     ; 279             ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1175  010e 7b01          	ld	a,(OFST+1,sp)
1176  0110 a008          	sub	a,#8
1177  0112 5f            	clrw	x
1178  0113 97            	ld	xl,a
1179  0114 a601          	ld	a,#1
1180  0116 5d            	tnzw	x
1181  0117 2704          	jreq	L43
1182  0119               L63:
1183  0119 48            	sll	a
1184  011a 5a            	decw	x
1185  011b 26fc          	jrne	L63
1186  011d               L43:
1187  011d 43            	cpl	a
1188  011e c45406        	and	a,21510
1189  0121 c75406        	ld	21510,a
1191  0124 2015          	jra	L174
1192  0126               L305:
1193                     ; 283             ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1195  0126 7b01          	ld	a,(OFST+1,sp)
1196  0128 a008          	sub	a,#8
1197  012a 5f            	clrw	x
1198  012b 97            	ld	xl,a
1199  012c a601          	ld	a,#1
1200  012e 5d            	tnzw	x
1201  012f 2704          	jreq	L04
1202  0131               L24:
1203  0131 48            	sll	a
1204  0132 5a            	decw	x
1205  0133 26fc          	jrne	L24
1206  0135               L04:
1207  0135 ca5406        	or	a,21510
1208  0138 c75406        	ld	21510,a
1209  013b               L174:
1210                     ; 287 }
1213  013b 85            	popw	x
1214  013c 81            	ret
1271                     ; 300 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1271                     ; 301 {
1272                     	switch	.text
1273  013d               _ADC1_ConversionConfig:
1275  013d 89            	pushw	x
1276       00000000      OFST:	set	0
1279                     ; 304     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1281                     ; 305     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1283                     ; 306     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1285                     ; 309     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1287  013e 72175402      	bres	21506,#3
1288                     ; 311     ADC1->CR2 |= (uint8_t)(ADC1_Align);
1290  0142 c65402        	ld	a,21506
1291  0145 1a05          	or	a,(OFST+5,sp)
1292  0147 c75402        	ld	21506,a
1293                     ; 313     if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1295  014a 9e            	ld	a,xh
1296  014b a101          	cp	a,#1
1297  014d 2606          	jrne	L535
1298                     ; 316         ADC1->CR1 |= ADC1_CR1_CONT;
1300  014f 72125401      	bset	21505,#1
1302  0153 2004          	jra	L735
1303  0155               L535:
1304                     ; 321         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1306  0155 72135401      	bres	21505,#1
1307  0159               L735:
1308                     ; 325     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1310  0159 c65400        	ld	a,21504
1311  015c a4f0          	and	a,#240
1312  015e c75400        	ld	21504,a
1313                     ; 327     ADC1->CSR |= (uint8_t)(ADC1_Channel);
1315  0161 c65400        	ld	a,21504
1316  0164 1a02          	or	a,(OFST+2,sp)
1317  0166 c75400        	ld	21504,a
1318                     ; 329 }
1321  0169 85            	popw	x
1322  016a 81            	ret
1368                     ; 342 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1368                     ; 343 {
1369                     	switch	.text
1370  016b               _ADC1_ExternalTriggerConfig:
1372  016b 89            	pushw	x
1373       00000000      OFST:	set	0
1376                     ; 346     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1378                     ; 347     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1380                     ; 350     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1382  016c c65402        	ld	a,21506
1383  016f a4cf          	and	a,#207
1384  0171 c75402        	ld	21506,a
1385                     ; 352     if (NewState != DISABLE)
1387  0174 9f            	ld	a,xl
1388  0175 4d            	tnz	a
1389  0176 2706          	jreq	L365
1390                     ; 355         ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1392  0178 721c5402      	bset	21506,#6
1394  017c 2004          	jra	L565
1395  017e               L365:
1396                     ; 360         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1398  017e 721d5402      	bres	21506,#6
1399  0182               L565:
1400                     ; 364     ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1402  0182 c65402        	ld	a,21506
1403  0185 1a01          	or	a,(OFST+1,sp)
1404  0187 c75402        	ld	21506,a
1405                     ; 366 }
1408  018a 85            	popw	x
1409  018b 81            	ret
1433                     ; 378 void ADC1_StartConversion(void)
1433                     ; 379 {
1434                     	switch	.text
1435  018c               _ADC1_StartConversion:
1439                     ; 380     ADC1->CR1 |= ADC1_CR1_ADON;
1441  018c 72105401      	bset	21505,#0
1442                     ; 381 }
1445  0190 81            	ret
1485                     ; 390 uint16_t ADC1_GetConversionValue(void)
1485                     ; 391 {
1486                     	switch	.text
1487  0191               _ADC1_GetConversionValue:
1489  0191 5205          	subw	sp,#5
1490       00000005      OFST:	set	5
1493                     ; 393     uint16_t temph = 0;
1495                     ; 394     uint8_t templ = 0;
1497                     ; 396     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1499  0193 c65402        	ld	a,21506
1500  0196 a508          	bcp	a,#8
1501  0198 2715          	jreq	L516
1502                     ; 399         templ = ADC1->DRL;
1504  019a c65405        	ld	a,21509
1505  019d 6b03          	ld	(OFST-2,sp),a
1506                     ; 401         temph = ADC1->DRH;
1508  019f c65404        	ld	a,21508
1509  01a2 5f            	clrw	x
1510  01a3 97            	ld	xl,a
1511  01a4 1f04          	ldw	(OFST-1,sp),x
1512                     ; 403         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1514  01a6 1e04          	ldw	x,(OFST-1,sp)
1515  01a8 7b03          	ld	a,(OFST-2,sp)
1516  01aa 02            	rlwa	x,a
1517  01ab 1f04          	ldw	(OFST-1,sp),x
1519  01ad 2021          	jra	L716
1520  01af               L516:
1521                     ; 408         temph = ADC1->DRH;
1523  01af c65404        	ld	a,21508
1524  01b2 5f            	clrw	x
1525  01b3 97            	ld	xl,a
1526  01b4 1f04          	ldw	(OFST-1,sp),x
1527                     ; 410         templ = ADC1->DRL;
1529  01b6 c65405        	ld	a,21509
1530  01b9 6b03          	ld	(OFST-2,sp),a
1531                     ; 412         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1533  01bb 1e04          	ldw	x,(OFST-1,sp)
1534  01bd 4f            	clr	a
1535  01be 02            	rlwa	x,a
1536  01bf 1f01          	ldw	(OFST-4,sp),x
1537  01c1 7b03          	ld	a,(OFST-2,sp)
1538  01c3 97            	ld	xl,a
1539  01c4 a640          	ld	a,#64
1540  01c6 42            	mul	x,a
1541  01c7 01            	rrwa	x,a
1542  01c8 1a02          	or	a,(OFST-3,sp)
1543  01ca 01            	rrwa	x,a
1544  01cb 1a01          	or	a,(OFST-4,sp)
1545  01cd 01            	rrwa	x,a
1546  01ce 1f04          	ldw	(OFST-1,sp),x
1547  01d0               L716:
1548                     ; 415     return ((uint16_t)temph);
1550  01d0 1e04          	ldw	x,(OFST-1,sp)
1553  01d2 5b05          	addw	sp,#5
1554  01d4 81            	ret
1600                     ; 427 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1600                     ; 428 {
1601                     	switch	.text
1602  01d5               _ADC1_AWDChannelConfig:
1604  01d5 89            	pushw	x
1605       00000000      OFST:	set	0
1608                     ; 430     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1610                     ; 431     assert_param(IS_ADC1_CHANNEL_OK(Channel));
1612                     ; 433     if (Channel < (uint8_t)8)
1614  01d6 9e            	ld	a,xh
1615  01d7 a108          	cp	a,#8
1616  01d9 242e          	jruge	L346
1617                     ; 435         if (NewState != DISABLE)
1619  01db 9f            	ld	a,xl
1620  01dc 4d            	tnz	a
1621  01dd 2714          	jreq	L546
1622                     ; 437             ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1624  01df 9e            	ld	a,xh
1625  01e0 5f            	clrw	x
1626  01e1 97            	ld	xl,a
1627  01e2 a601          	ld	a,#1
1628  01e4 5d            	tnzw	x
1629  01e5 2704          	jreq	L65
1630  01e7               L06:
1631  01e7 48            	sll	a
1632  01e8 5a            	decw	x
1633  01e9 26fc          	jrne	L06
1634  01eb               L65:
1635  01eb ca540f        	or	a,21519
1636  01ee c7540f        	ld	21519,a
1638  01f1 2047          	jra	L156
1639  01f3               L546:
1640                     ; 441             ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1642  01f3 7b01          	ld	a,(OFST+1,sp)
1643  01f5 5f            	clrw	x
1644  01f6 97            	ld	xl,a
1645  01f7 a601          	ld	a,#1
1646  01f9 5d            	tnzw	x
1647  01fa 2704          	jreq	L26
1648  01fc               L46:
1649  01fc 48            	sll	a
1650  01fd 5a            	decw	x
1651  01fe 26fc          	jrne	L46
1652  0200               L26:
1653  0200 43            	cpl	a
1654  0201 c4540f        	and	a,21519
1655  0204 c7540f        	ld	21519,a
1656  0207 2031          	jra	L156
1657  0209               L346:
1658                     ; 446         if (NewState != DISABLE)
1660  0209 0d02          	tnz	(OFST+2,sp)
1661  020b 2717          	jreq	L356
1662                     ; 448             ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1664  020d 7b01          	ld	a,(OFST+1,sp)
1665  020f a008          	sub	a,#8
1666  0211 5f            	clrw	x
1667  0212 97            	ld	xl,a
1668  0213 a601          	ld	a,#1
1669  0215 5d            	tnzw	x
1670  0216 2704          	jreq	L66
1671  0218               L07:
1672  0218 48            	sll	a
1673  0219 5a            	decw	x
1674  021a 26fc          	jrne	L07
1675  021c               L66:
1676  021c ca540e        	or	a,21518
1677  021f c7540e        	ld	21518,a
1679  0222 2016          	jra	L156
1680  0224               L356:
1681                     ; 452             ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1683  0224 7b01          	ld	a,(OFST+1,sp)
1684  0226 a008          	sub	a,#8
1685  0228 5f            	clrw	x
1686  0229 97            	ld	xl,a
1687  022a a601          	ld	a,#1
1688  022c 5d            	tnzw	x
1689  022d 2704          	jreq	L27
1690  022f               L47:
1691  022f 48            	sll	a
1692  0230 5a            	decw	x
1693  0231 26fc          	jrne	L47
1694  0233               L27:
1695  0233 43            	cpl	a
1696  0234 c4540e        	and	a,21518
1697  0237 c7540e        	ld	21518,a
1698  023a               L156:
1699                     ; 455 }
1702  023a 85            	popw	x
1703  023b 81            	ret
1736                     ; 463 void ADC1_SetHighThreshold(uint16_t Threshold)
1736                     ; 464 {
1737                     	switch	.text
1738  023c               _ADC1_SetHighThreshold:
1740  023c 89            	pushw	x
1741       00000000      OFST:	set	0
1744                     ; 465     ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1746  023d 54            	srlw	x
1747  023e 54            	srlw	x
1748  023f 9f            	ld	a,xl
1749  0240 c75408        	ld	21512,a
1750                     ; 466     ADC1->HTRL = (uint8_t)Threshold;
1752  0243 7b02          	ld	a,(OFST+2,sp)
1753  0245 c75409        	ld	21513,a
1754                     ; 467 }
1757  0248 85            	popw	x
1758  0249 81            	ret
1791                     ; 475 void ADC1_SetLowThreshold(uint16_t Threshold)
1791                     ; 476 {
1792                     	switch	.text
1793  024a               _ADC1_SetLowThreshold:
1797                     ; 477     ADC1->LTRL = (uint8_t)Threshold;
1799  024a 9f            	ld	a,xl
1800  024b c7540b        	ld	21515,a
1801                     ; 478     ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1803  024e 54            	srlw	x
1804  024f 54            	srlw	x
1805  0250 9f            	ld	a,xl
1806  0251 c7540a        	ld	21514,a
1807                     ; 479 }
1810  0254 81            	ret
1857                     ; 488 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1857                     ; 489 {
1858                     	switch	.text
1859  0255               _ADC1_GetBufferValue:
1861  0255 88            	push	a
1862  0256 5205          	subw	sp,#5
1863       00000005      OFST:	set	5
1866                     ; 491     uint16_t temph = 0;
1868                     ; 492     uint8_t templ = 0;
1870                     ; 495     assert_param(IS_ADC1_BUFFER_OK(Buffer));
1872                     ; 497     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1874  0258 c65402        	ld	a,21506
1875  025b a508          	bcp	a,#8
1876  025d 271f          	jreq	L727
1877                     ; 500         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1879  025f 7b06          	ld	a,(OFST+1,sp)
1880  0261 48            	sll	a
1881  0262 5f            	clrw	x
1882  0263 97            	ld	xl,a
1883  0264 d653e1        	ld	a,(21473,x)
1884  0267 6b03          	ld	(OFST-2,sp),a
1885                     ; 502         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1887  0269 7b06          	ld	a,(OFST+1,sp)
1888  026b 48            	sll	a
1889  026c 5f            	clrw	x
1890  026d 97            	ld	xl,a
1891  026e d653e0        	ld	a,(21472,x)
1892  0271 5f            	clrw	x
1893  0272 97            	ld	xl,a
1894  0273 1f04          	ldw	(OFST-1,sp),x
1895                     ; 504         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1897  0275 1e04          	ldw	x,(OFST-1,sp)
1898  0277 7b03          	ld	a,(OFST-2,sp)
1899  0279 02            	rlwa	x,a
1900  027a 1f04          	ldw	(OFST-1,sp),x
1902  027c 202b          	jra	L137
1903  027e               L727:
1904                     ; 509         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1906  027e 7b06          	ld	a,(OFST+1,sp)
1907  0280 48            	sll	a
1908  0281 5f            	clrw	x
1909  0282 97            	ld	xl,a
1910  0283 d653e0        	ld	a,(21472,x)
1911  0286 5f            	clrw	x
1912  0287 97            	ld	xl,a
1913  0288 1f04          	ldw	(OFST-1,sp),x
1914                     ; 511         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1916  028a 7b06          	ld	a,(OFST+1,sp)
1917  028c 48            	sll	a
1918  028d 5f            	clrw	x
1919  028e 97            	ld	xl,a
1920  028f d653e1        	ld	a,(21473,x)
1921  0292 6b03          	ld	(OFST-2,sp),a
1922                     ; 513         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1924  0294 1e04          	ldw	x,(OFST-1,sp)
1925  0296 4f            	clr	a
1926  0297 02            	rlwa	x,a
1927  0298 1f01          	ldw	(OFST-4,sp),x
1928  029a 7b03          	ld	a,(OFST-2,sp)
1929  029c 97            	ld	xl,a
1930  029d a640          	ld	a,#64
1931  029f 42            	mul	x,a
1932  02a0 01            	rrwa	x,a
1933  02a1 1a02          	or	a,(OFST-3,sp)
1934  02a3 01            	rrwa	x,a
1935  02a4 1a01          	or	a,(OFST-4,sp)
1936  02a6 01            	rrwa	x,a
1937  02a7 1f04          	ldw	(OFST-1,sp),x
1938  02a9               L137:
1939                     ; 516     return ((uint16_t)temph);
1941  02a9 1e04          	ldw	x,(OFST-1,sp)
1944  02ab 5b06          	addw	sp,#6
1945  02ad 81            	ret
2009                     ; 526 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2009                     ; 527 {
2010                     	switch	.text
2011  02ae               _ADC1_GetAWDChannelStatus:
2013  02ae 88            	push	a
2014  02af 88            	push	a
2015       00000001      OFST:	set	1
2018                     ; 528     uint8_t status = 0;
2020                     ; 531     assert_param(IS_ADC1_CHANNEL_OK(Channel));
2022                     ; 533     if (Channel < (uint8_t)8)
2024  02b0 a108          	cp	a,#8
2025  02b2 2412          	jruge	L367
2026                     ; 535         status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2028  02b4 5f            	clrw	x
2029  02b5 97            	ld	xl,a
2030  02b6 a601          	ld	a,#1
2031  02b8 5d            	tnzw	x
2032  02b9 2704          	jreq	L601
2033  02bb               L011:
2034  02bb 48            	sll	a
2035  02bc 5a            	decw	x
2036  02bd 26fc          	jrne	L011
2037  02bf               L601:
2038  02bf c4540d        	and	a,21517
2039  02c2 6b01          	ld	(OFST+0,sp),a
2041  02c4 2014          	jra	L567
2042  02c6               L367:
2043                     ; 539         status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2045  02c6 7b02          	ld	a,(OFST+1,sp)
2046  02c8 a008          	sub	a,#8
2047  02ca 5f            	clrw	x
2048  02cb 97            	ld	xl,a
2049  02cc a601          	ld	a,#1
2050  02ce 5d            	tnzw	x
2051  02cf 2704          	jreq	L211
2052  02d1               L411:
2053  02d1 48            	sll	a
2054  02d2 5a            	decw	x
2055  02d3 26fc          	jrne	L411
2056  02d5               L211:
2057  02d5 c4540c        	and	a,21516
2058  02d8 6b01          	ld	(OFST+0,sp),a
2059  02da               L567:
2060                     ; 542     return ((FlagStatus)status);
2062  02da 7b01          	ld	a,(OFST+0,sp)
2065  02dc 85            	popw	x
2066  02dd 81            	ret
2220                     ; 551 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2220                     ; 552 {
2221                     	switch	.text
2222  02de               _ADC1_GetFlagStatus:
2224  02de 88            	push	a
2225  02df 88            	push	a
2226       00000001      OFST:	set	1
2229                     ; 553     uint8_t flagstatus = 0;
2231                     ; 554     uint8_t temp = 0;
2233                     ; 557     assert_param(IS_ADC1_FLAG_OK(Flag));
2235                     ; 559     if ((Flag & 0x0F) == 0x01)
2237  02e0 a40f          	and	a,#15
2238  02e2 a101          	cp	a,#1
2239  02e4 2609          	jrne	L1501
2240                     ; 562         flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2242  02e6 c65403        	ld	a,21507
2243  02e9 a440          	and	a,#64
2244  02eb 6b01          	ld	(OFST+0,sp),a
2246  02ed 2045          	jra	L3501
2247  02ef               L1501:
2248                     ; 564     else if ((Flag & 0xF0) == 0x10)
2250  02ef 7b02          	ld	a,(OFST+1,sp)
2251  02f1 a4f0          	and	a,#240
2252  02f3 a110          	cp	a,#16
2253  02f5 2636          	jrne	L5501
2254                     ; 567         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2256  02f7 7b02          	ld	a,(OFST+1,sp)
2257  02f9 a40f          	and	a,#15
2258  02fb 6b01          	ld	(OFST+0,sp),a
2259                     ; 568         if (temp < 8)
2261  02fd 7b01          	ld	a,(OFST+0,sp)
2262  02ff a108          	cp	a,#8
2263  0301 2414          	jruge	L7501
2264                     ; 570             flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2266  0303 7b01          	ld	a,(OFST+0,sp)
2267  0305 5f            	clrw	x
2268  0306 97            	ld	xl,a
2269  0307 a601          	ld	a,#1
2270  0309 5d            	tnzw	x
2271  030a 2704          	jreq	L021
2272  030c               L221:
2273  030c 48            	sll	a
2274  030d 5a            	decw	x
2275  030e 26fc          	jrne	L221
2276  0310               L021:
2277  0310 c4540d        	and	a,21517
2278  0313 6b01          	ld	(OFST+0,sp),a
2280  0315 201d          	jra	L3501
2281  0317               L7501:
2282                     ; 574             flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2284  0317 7b01          	ld	a,(OFST+0,sp)
2285  0319 a008          	sub	a,#8
2286  031b 5f            	clrw	x
2287  031c 97            	ld	xl,a
2288  031d a601          	ld	a,#1
2289  031f 5d            	tnzw	x
2290  0320 2704          	jreq	L421
2291  0322               L621:
2292  0322 48            	sll	a
2293  0323 5a            	decw	x
2294  0324 26fc          	jrne	L621
2295  0326               L421:
2296  0326 c4540c        	and	a,21516
2297  0329 6b01          	ld	(OFST+0,sp),a
2298  032b 2007          	jra	L3501
2299  032d               L5501:
2300                     ; 579         flagstatus = (uint8_t)(ADC1->CSR & Flag);
2302  032d c65400        	ld	a,21504
2303  0330 1402          	and	a,(OFST+1,sp)
2304  0332 6b01          	ld	(OFST+0,sp),a
2305  0334               L3501:
2306                     ; 581     return ((FlagStatus)flagstatus);
2308  0334 7b01          	ld	a,(OFST+0,sp)
2311  0336 85            	popw	x
2312  0337 81            	ret
2354                     ; 591 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2354                     ; 592 {
2355                     	switch	.text
2356  0338               _ADC1_ClearFlag:
2358  0338 88            	push	a
2359  0339 88            	push	a
2360       00000001      OFST:	set	1
2363                     ; 593     uint8_t temp = 0;
2365                     ; 596     assert_param(IS_ADC1_FLAG_OK(Flag));
2367                     ; 598     if ((Flag & 0x0F) == 0x01)
2369  033a a40f          	and	a,#15
2370  033c a101          	cp	a,#1
2371  033e 2606          	jrne	L5011
2372                     ; 601         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2374  0340 721d5403      	bres	21507,#6
2376  0344 204b          	jra	L7011
2377  0346               L5011:
2378                     ; 603     else if ((Flag & 0xF0) == 0x10)
2380  0346 7b02          	ld	a,(OFST+1,sp)
2381  0348 a4f0          	and	a,#240
2382  034a a110          	cp	a,#16
2383  034c 263a          	jrne	L1111
2384                     ; 606         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2386  034e 7b02          	ld	a,(OFST+1,sp)
2387  0350 a40f          	and	a,#15
2388  0352 6b01          	ld	(OFST+0,sp),a
2389                     ; 607         if (temp < 8)
2391  0354 7b01          	ld	a,(OFST+0,sp)
2392  0356 a108          	cp	a,#8
2393  0358 2416          	jruge	L3111
2394                     ; 609             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2396  035a 7b01          	ld	a,(OFST+0,sp)
2397  035c 5f            	clrw	x
2398  035d 97            	ld	xl,a
2399  035e a601          	ld	a,#1
2400  0360 5d            	tnzw	x
2401  0361 2704          	jreq	L231
2402  0363               L431:
2403  0363 48            	sll	a
2404  0364 5a            	decw	x
2405  0365 26fc          	jrne	L431
2406  0367               L231:
2407  0367 43            	cpl	a
2408  0368 c4540d        	and	a,21517
2409  036b c7540d        	ld	21517,a
2411  036e 2021          	jra	L7011
2412  0370               L3111:
2413                     ; 613             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2415  0370 7b01          	ld	a,(OFST+0,sp)
2416  0372 a008          	sub	a,#8
2417  0374 5f            	clrw	x
2418  0375 97            	ld	xl,a
2419  0376 a601          	ld	a,#1
2420  0378 5d            	tnzw	x
2421  0379 2704          	jreq	L631
2422  037b               L041:
2423  037b 48            	sll	a
2424  037c 5a            	decw	x
2425  037d 26fc          	jrne	L041
2426  037f               L631:
2427  037f 43            	cpl	a
2428  0380 c4540c        	and	a,21516
2429  0383 c7540c        	ld	21516,a
2430  0386 2009          	jra	L7011
2431  0388               L1111:
2432                     ; 618         ADC1->CSR &= (uint8_t) (~Flag);
2434  0388 7b02          	ld	a,(OFST+1,sp)
2435  038a 43            	cpl	a
2436  038b c45400        	and	a,21504
2437  038e c75400        	ld	21504,a
2438  0391               L7011:
2439                     ; 620 }
2442  0391 85            	popw	x
2443  0392 81            	ret
2496                     ; 640 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2496                     ; 641 {
2497                     	switch	.text
2498  0393               _ADC1_GetITStatus:
2500  0393 89            	pushw	x
2501  0394 88            	push	a
2502       00000001      OFST:	set	1
2505                     ; 642     ITStatus itstatus = RESET;
2507                     ; 643     uint8_t temp = 0;
2509                     ; 646     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2511                     ; 648     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2513  0395 01            	rrwa	x,a
2514  0396 a4f0          	and	a,#240
2515  0398 5f            	clrw	x
2516  0399 02            	rlwa	x,a
2517  039a a30010        	cpw	x,#16
2518  039d 2636          	jrne	L5411
2519                     ; 651         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2521  039f 7b03          	ld	a,(OFST+2,sp)
2522  03a1 a40f          	and	a,#15
2523  03a3 6b01          	ld	(OFST+0,sp),a
2524                     ; 652         if (temp < 8)
2526  03a5 7b01          	ld	a,(OFST+0,sp)
2527  03a7 a108          	cp	a,#8
2528  03a9 2414          	jruge	L7411
2529                     ; 654             itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2531  03ab 7b01          	ld	a,(OFST+0,sp)
2532  03ad 5f            	clrw	x
2533  03ae 97            	ld	xl,a
2534  03af a601          	ld	a,#1
2535  03b1 5d            	tnzw	x
2536  03b2 2704          	jreq	L441
2537  03b4               L641:
2538  03b4 48            	sll	a
2539  03b5 5a            	decw	x
2540  03b6 26fc          	jrne	L641
2541  03b8               L441:
2542  03b8 c4540d        	and	a,21517
2543  03bb 6b01          	ld	(OFST+0,sp),a
2545  03bd 201d          	jra	L3511
2546  03bf               L7411:
2547                     ; 658             itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2549  03bf 7b01          	ld	a,(OFST+0,sp)
2550  03c1 a008          	sub	a,#8
2551  03c3 5f            	clrw	x
2552  03c4 97            	ld	xl,a
2553  03c5 a601          	ld	a,#1
2554  03c7 5d            	tnzw	x
2555  03c8 2704          	jreq	L051
2556  03ca               L251:
2557  03ca 48            	sll	a
2558  03cb 5a            	decw	x
2559  03cc 26fc          	jrne	L251
2560  03ce               L051:
2561  03ce c4540c        	and	a,21516
2562  03d1 6b01          	ld	(OFST+0,sp),a
2563  03d3 2007          	jra	L3511
2564  03d5               L5411:
2565                     ; 663         itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2567  03d5 c65400        	ld	a,21504
2568  03d8 1403          	and	a,(OFST+2,sp)
2569  03da 6b01          	ld	(OFST+0,sp),a
2570  03dc               L3511:
2571                     ; 665     return ((ITStatus)itstatus);
2573  03dc 7b01          	ld	a,(OFST+0,sp)
2576  03de 5b03          	addw	sp,#3
2577  03e0 81            	ret
2620                     ; 687 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2620                     ; 688 {
2621                     	switch	.text
2622  03e1               _ADC1_ClearITPendingBit:
2624  03e1 89            	pushw	x
2625  03e2 88            	push	a
2626       00000001      OFST:	set	1
2629                     ; 689     uint8_t temp = 0;
2631                     ; 692     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2633                     ; 694     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2635  03e3 01            	rrwa	x,a
2636  03e4 a4f0          	and	a,#240
2637  03e6 5f            	clrw	x
2638  03e7 02            	rlwa	x,a
2639  03e8 a30010        	cpw	x,#16
2640  03eb 263a          	jrne	L5711
2641                     ; 697         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2643  03ed 7b03          	ld	a,(OFST+2,sp)
2644  03ef a40f          	and	a,#15
2645  03f1 6b01          	ld	(OFST+0,sp),a
2646                     ; 698         if (temp < 8)
2648  03f3 7b01          	ld	a,(OFST+0,sp)
2649  03f5 a108          	cp	a,#8
2650  03f7 2416          	jruge	L7711
2651                     ; 700             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2653  03f9 7b01          	ld	a,(OFST+0,sp)
2654  03fb 5f            	clrw	x
2655  03fc 97            	ld	xl,a
2656  03fd a601          	ld	a,#1
2657  03ff 5d            	tnzw	x
2658  0400 2704          	jreq	L651
2659  0402               L061:
2660  0402 48            	sll	a
2661  0403 5a            	decw	x
2662  0404 26fc          	jrne	L061
2663  0406               L651:
2664  0406 43            	cpl	a
2665  0407 c4540d        	and	a,21517
2666  040a c7540d        	ld	21517,a
2668  040d 2021          	jra	L3021
2669  040f               L7711:
2670                     ; 704             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2672  040f 7b01          	ld	a,(OFST+0,sp)
2673  0411 a008          	sub	a,#8
2674  0413 5f            	clrw	x
2675  0414 97            	ld	xl,a
2676  0415 a601          	ld	a,#1
2677  0417 5d            	tnzw	x
2678  0418 2704          	jreq	L261
2679  041a               L461:
2680  041a 48            	sll	a
2681  041b 5a            	decw	x
2682  041c 26fc          	jrne	L461
2683  041e               L261:
2684  041e 43            	cpl	a
2685  041f c4540c        	and	a,21516
2686  0422 c7540c        	ld	21516,a
2687  0425 2009          	jra	L3021
2688  0427               L5711:
2689                     ; 709         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2691  0427 7b03          	ld	a,(OFST+2,sp)
2692  0429 43            	cpl	a
2693  042a c45400        	and	a,21504
2694  042d c75400        	ld	21504,a
2695  0430               L3021:
2696                     ; 711 }
2699  0430 5b03          	addw	sp,#3
2700  0432 81            	ret
2713                     	xdef	_ADC1_ClearITPendingBit
2714                     	xdef	_ADC1_GetITStatus
2715                     	xdef	_ADC1_ClearFlag
2716                     	xdef	_ADC1_GetFlagStatus
2717                     	xdef	_ADC1_GetAWDChannelStatus
2718                     	xdef	_ADC1_GetBufferValue
2719                     	xdef	_ADC1_SetLowThreshold
2720                     	xdef	_ADC1_SetHighThreshold
2721                     	xdef	_ADC1_GetConversionValue
2722                     	xdef	_ADC1_StartConversion
2723                     	xdef	_ADC1_AWDChannelConfig
2724                     	xdef	_ADC1_ExternalTriggerConfig
2725                     	xdef	_ADC1_ConversionConfig
2726                     	xdef	_ADC1_SchmittTriggerConfig
2727                     	xdef	_ADC1_PrescalerConfig
2728                     	xdef	_ADC1_ITConfig
2729                     	xdef	_ADC1_DataBufferCmd
2730                     	xdef	_ADC1_ScanModeCmd
2731                     	xdef	_ADC1_Cmd
2732                     	xdef	_ADC1_Init
2733                     	xdef	_ADC1_DeInit
2752                     	end
