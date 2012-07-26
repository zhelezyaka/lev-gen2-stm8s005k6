   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 109                     ; 47 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 109                     ; 48 {
 111                     	switch	.text
 112  0000               _GPIO_DeInit:
 116                     ; 49     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 118  0000 7f            	clr	(x)
 119                     ; 50     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 121  0001 6f02          	clr	(2,x)
 122                     ; 51     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 124  0003 6f03          	clr	(3,x)
 125                     ; 52     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 127  0005 6f04          	clr	(4,x)
 128                     ; 53 }
 131  0007 81            	ret
 371                     ; 65 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 371                     ; 66 {
 372                     	switch	.text
 373  0008               _GPIO_Init:
 375  0008 89            	pushw	x
 376       00000000      OFST:	set	0
 379                     ; 71     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 381                     ; 72     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 383                     ; 75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 385  0009 7b05          	ld	a,(OFST+5,sp)
 386  000b 43            	cpl	a
 387  000c e404          	and	a,(4,x)
 388  000e e704          	ld	(4,x),a
 389                     ; 81     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 391  0010 7b06          	ld	a,(OFST+6,sp)
 392  0012 a580          	bcp	a,#128
 393  0014 271d          	jreq	L771
 394                     ; 83         if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 396  0016 7b06          	ld	a,(OFST+6,sp)
 397  0018 a510          	bcp	a,#16
 398  001a 2706          	jreq	L102
 399                     ; 85             GPIOx->ODR |= (uint8_t)GPIO_Pin;
 401  001c f6            	ld	a,(x)
 402  001d 1a05          	or	a,(OFST+5,sp)
 403  001f f7            	ld	(x),a
 405  0020 2007          	jra	L302
 406  0022               L102:
 407                     ; 89             GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 409  0022 1e01          	ldw	x,(OFST+1,sp)
 410  0024 7b05          	ld	a,(OFST+5,sp)
 411  0026 43            	cpl	a
 412  0027 f4            	and	a,(x)
 413  0028 f7            	ld	(x),a
 414  0029               L302:
 415                     ; 92         GPIOx->DDR |= (uint8_t)GPIO_Pin;
 417  0029 1e01          	ldw	x,(OFST+1,sp)
 418  002b e602          	ld	a,(2,x)
 419  002d 1a05          	or	a,(OFST+5,sp)
 420  002f e702          	ld	(2,x),a
 422  0031 2009          	jra	L502
 423  0033               L771:
 424                     ; 97         GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 426  0033 1e01          	ldw	x,(OFST+1,sp)
 427  0035 7b05          	ld	a,(OFST+5,sp)
 428  0037 43            	cpl	a
 429  0038 e402          	and	a,(2,x)
 430  003a e702          	ld	(2,x),a
 431  003c               L502:
 432                     ; 104     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 434  003c 7b06          	ld	a,(OFST+6,sp)
 435  003e a540          	bcp	a,#64
 436  0040 270a          	jreq	L702
 437                     ; 106         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 439  0042 1e01          	ldw	x,(OFST+1,sp)
 440  0044 e603          	ld	a,(3,x)
 441  0046 1a05          	or	a,(OFST+5,sp)
 442  0048 e703          	ld	(3,x),a
 444  004a 2009          	jra	L112
 445  004c               L702:
 446                     ; 110         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 448  004c 1e01          	ldw	x,(OFST+1,sp)
 449  004e 7b05          	ld	a,(OFST+5,sp)
 450  0050 43            	cpl	a
 451  0051 e403          	and	a,(3,x)
 452  0053 e703          	ld	(3,x),a
 453  0055               L112:
 454                     ; 117     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 456  0055 7b06          	ld	a,(OFST+6,sp)
 457  0057 a520          	bcp	a,#32
 458  0059 270a          	jreq	L312
 459                     ; 119         GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 461  005b 1e01          	ldw	x,(OFST+1,sp)
 462  005d e604          	ld	a,(4,x)
 463  005f 1a05          	or	a,(OFST+5,sp)
 464  0061 e704          	ld	(4,x),a
 466  0063 2009          	jra	L512
 467  0065               L312:
 468                     ; 123         GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 470  0065 1e01          	ldw	x,(OFST+1,sp)
 471  0067 7b05          	ld	a,(OFST+5,sp)
 472  0069 43            	cpl	a
 473  006a e404          	and	a,(4,x)
 474  006c e704          	ld	(4,x),a
 475  006e               L512:
 476                     ; 125 }
 479  006e 85            	popw	x
 480  006f 81            	ret
 524                     ; 135 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 524                     ; 136 {
 525                     	switch	.text
 526  0070               _GPIO_Write:
 528  0070 89            	pushw	x
 529       00000000      OFST:	set	0
 532                     ; 137     GPIOx->ODR = PortVal;
 534  0071 7b05          	ld	a,(OFST+5,sp)
 535  0073 1e01          	ldw	x,(OFST+1,sp)
 536  0075 f7            	ld	(x),a
 537                     ; 138 }
 540  0076 85            	popw	x
 541  0077 81            	ret
 588                     ; 148 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 588                     ; 149 {
 589                     	switch	.text
 590  0078               _GPIO_WriteHigh:
 592  0078 89            	pushw	x
 593       00000000      OFST:	set	0
 596                     ; 150     GPIOx->ODR |= (uint8_t)PortPins;
 598  0079 f6            	ld	a,(x)
 599  007a 1a05          	or	a,(OFST+5,sp)
 600  007c f7            	ld	(x),a
 601                     ; 151 }
 604  007d 85            	popw	x
 605  007e 81            	ret
 652                     ; 161 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 652                     ; 162 {
 653                     	switch	.text
 654  007f               _GPIO_WriteLow:
 656  007f 89            	pushw	x
 657       00000000      OFST:	set	0
 660                     ; 163     GPIOx->ODR &= (uint8_t)(~PortPins);
 662  0080 7b05          	ld	a,(OFST+5,sp)
 663  0082 43            	cpl	a
 664  0083 f4            	and	a,(x)
 665  0084 f7            	ld	(x),a
 666                     ; 164 }
 669  0085 85            	popw	x
 670  0086 81            	ret
 717                     ; 174 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 717                     ; 175 {
 718                     	switch	.text
 719  0087               _GPIO_WriteReverse:
 721  0087 89            	pushw	x
 722       00000000      OFST:	set	0
 725                     ; 176     GPIOx->ODR ^= (uint8_t)PortPins;
 727  0088 f6            	ld	a,(x)
 728  0089 1805          	xor	a,	(OFST+5,sp)
 729  008b f7            	ld	(x),a
 730                     ; 177 }
 733  008c 85            	popw	x
 734  008d 81            	ret
 772                     ; 185 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 772                     ; 186 {
 773                     	switch	.text
 774  008e               _GPIO_ReadOutputData:
 778                     ; 187     return ((uint8_t)GPIOx->ODR);
 780  008e f6            	ld	a,(x)
 783  008f 81            	ret
 820                     ; 196 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 820                     ; 197 {
 821                     	switch	.text
 822  0090               _GPIO_ReadInputData:
 826                     ; 198     return ((uint8_t)GPIOx->IDR);
 828  0090 e601          	ld	a,(1,x)
 831  0092 81            	ret
 899                     ; 207 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 899                     ; 208 {
 900                     	switch	.text
 901  0093               _GPIO_ReadInputPin:
 903  0093 89            	pushw	x
 904       00000000      OFST:	set	0
 907                     ; 209     return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 909  0094 e601          	ld	a,(1,x)
 910  0096 1405          	and	a,(OFST+5,sp)
 913  0098 85            	popw	x
 914  0099 81            	ret
 992                     ; 219 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 992                     ; 220 {
 993                     	switch	.text
 994  009a               _GPIO_ExternalPullUpConfig:
 996  009a 89            	pushw	x
 997       00000000      OFST:	set	0
1000                     ; 222     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1002                     ; 223     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1004                     ; 225     if (NewState != DISABLE) /* External Pull-Up Set*/
1006  009b 0d06          	tnz	(OFST+6,sp)
1007  009d 2708          	jreq	L174
1008                     ; 227         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1010  009f e603          	ld	a,(3,x)
1011  00a1 1a05          	or	a,(OFST+5,sp)
1012  00a3 e703          	ld	(3,x),a
1014  00a5 2009          	jra	L374
1015  00a7               L174:
1016                     ; 230         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1018  00a7 1e01          	ldw	x,(OFST+1,sp)
1019  00a9 7b05          	ld	a,(OFST+5,sp)
1020  00ab 43            	cpl	a
1021  00ac e403          	and	a,(3,x)
1022  00ae e703          	ld	(3,x),a
1023  00b0               L374:
1024                     ; 232 }
1027  00b0 85            	popw	x
1028  00b1 81            	ret
1041                     	xdef	_GPIO_ExternalPullUpConfig
1042                     	xdef	_GPIO_ReadInputPin
1043                     	xdef	_GPIO_ReadOutputData
1044                     	xdef	_GPIO_ReadInputData
1045                     	xdef	_GPIO_WriteReverse
1046                     	xdef	_GPIO_WriteLow
1047                     	xdef	_GPIO_WriteHigh
1048                     	xdef	_GPIO_Write
1049                     	xdef	_GPIO_Init
1050                     	xdef	_GPIO_DeInit
1069                     	end
