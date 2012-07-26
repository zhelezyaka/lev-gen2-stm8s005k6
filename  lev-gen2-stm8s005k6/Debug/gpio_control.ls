   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 26 void gpio_init(void){
  46                     	switch	.text
  47  0000               _gpio_init:
  51                     ; 29 	GPIO_Init(UVP_PORT, UVP_PIN, GPIO_MODE_IN_FL_NO_IT);
  53  0000 4b00          	push	#0
  54  0002 4b01          	push	#1
  55  0004 ae500f        	ldw	x,#20495
  56  0007 cd0000        	call	_GPIO_Init
  58  000a 85            	popw	x
  59                     ; 30 	GPIO_Init(OVP_PORT, OVP_PIN, GPIO_MODE_IN_FL_NO_IT);
  61  000b 4b00          	push	#0
  62  000d 4b04          	push	#4
  63  000f ae500f        	ldw	x,#20495
  64  0012 cd0000        	call	_GPIO_Init
  66  0015 85            	popw	x
  67                     ; 32 	GPIO_Init(ADP_SOC_PORT, ADP_SOC_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  69  0016 4be0          	push	#224
  70  0018 4b20          	push	#32
  71  001a ae500a        	ldw	x,#20490
  72  001d cd0000        	call	_GPIO_Init
  74  0020 85            	popw	x
  75                     ; 34 	GPIO_Init(URAT_OUTPUT_CONTROL_PORT, URAT_OUTPUT_CONTROL_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  77  0021 4be0          	push	#224
  78  0023 4b80          	push	#128
  79  0025 ae500f        	ldw	x,#20495
  80  0028 cd0000        	call	_GPIO_Init
  82  002b 85            	popw	x
  83                     ; 36 }
  86  002c 81            	ret
 110                     ; 38 unsigned char getPIC_OVP_Status(){
 111                     	switch	.text
 112  002d               _getPIC_OVP_Status:
 116                     ; 39   return (GPIO_ReadInputPin(OVP_PORT, OVP_PIN)== 0)? false : true;
 118  002d 4b04          	push	#4
 119  002f ae500f        	ldw	x,#20495
 120  0032 cd0000        	call	_GPIO_ReadInputPin
 122  0035 5b01          	addw	sp,#1
 123  0037 4d            	tnz	a
 124  0038 2603          	jrne	L01
 125  003a 4f            	clr	a
 126  003b 2002          	jra	L21
 127  003d               L01:
 128  003d a601          	ld	a,#1
 129  003f               L21:
 132  003f 81            	ret
 156                     ; 41 unsigned char getPIC_UVP_Status(){
 157                     	switch	.text
 158  0040               _getPIC_UVP_Status:
 162                     ; 42   return (GPIO_ReadInputPin(UVP_PORT, UVP_PIN)== 0)? false : true;
 164  0040 4b01          	push	#1
 165  0042 ae500f        	ldw	x,#20495
 166  0045 cd0000        	call	_GPIO_ReadInputPin
 168  0048 5b01          	addw	sp,#1
 169  004a 4d            	tnz	a
 170  004b 2603          	jrne	L61
 171  004d 4f            	clr	a
 172  004e 2002          	jra	L02
 173  0050               L61:
 174  0050 a601          	ld	a,#1
 175  0052               L02:
 178  0052 81            	ret
 213                     ; 45 void setADP_SOC(unsigned char enable){
 214                     	switch	.text
 215  0053               _setADP_SOC:
 219                     ; 46   if(enable){
 221  0053 4d            	tnz	a
 222  0054 270f          	jreq	L55
 223                     ; 48     GPIO_WriteHigh(ADP_SOC_PORT, ADP_SOC_PIN);
 225  0056 4b20          	push	#32
 226  0058 ae500a        	ldw	x,#20490
 227  005b cd0000        	call	_GPIO_WriteHigh
 229  005e 84            	pop	a
 230                     ; 49     G_Activate_Action_Status |= (ADP_SOC_STATUS);
 232  005f 72140009      	bset	_G_Var_Array+9,#2
 234  0063 200d          	jra	L75
 235  0065               L55:
 236                     ; 52     GPIO_WriteLow(ADP_SOC_PORT, ADP_SOC_PIN);
 238  0065 4b20          	push	#32
 239  0067 ae500a        	ldw	x,#20490
 240  006a cd0000        	call	_GPIO_WriteLow
 242  006d 84            	pop	a
 243                     ; 53     G_Activate_Action_Status &= ~(ADP_SOC_STATUS);
 245  006e 72150009      	bres	_G_Var_Array+9,#2
 246  0072               L75:
 247                     ; 58 }
 250  0072 81            	ret
 286                     ; 59 void setURAT_OUTPUT_CONTROL_PIN(unsigned char enable){
 287                     	switch	.text
 288  0073               _setURAT_OUTPUT_CONTROL_PIN:
 292                     ; 60   if(enable){
 294  0073 4d            	tnz	a
 295  0074 270f          	jreq	L57
 296                     ; 62     GPIO_WriteHigh(URAT_OUTPUT_CONTROL_PORT, URAT_OUTPUT_CONTROL_PIN);
 298  0076 4b80          	push	#128
 299  0078 ae500f        	ldw	x,#20495
 300  007b cd0000        	call	_GPIO_WriteHigh
 302  007e 84            	pop	a
 303                     ; 63     G_Activate_Action_Status |= (URAT_SEND_OUT_PIN);
 305  007f 72160009      	bset	_G_Var_Array+9,#3
 307  0083 200d          	jra	L77
 308  0085               L57:
 309                     ; 66     GPIO_WriteLow(URAT_OUTPUT_CONTROL_PORT, URAT_OUTPUT_CONTROL_PIN);
 311  0085 4b80          	push	#128
 312  0087 ae500f        	ldw	x,#20495
 313  008a cd0000        	call	_GPIO_WriteLow
 315  008d 84            	pop	a
 316                     ; 67     G_Activate_Action_Status &= ~(URAT_SEND_OUT_PIN);
 318  008e 72170009      	bres	_G_Var_Array+9,#3
 319  0092               L77:
 320                     ; 72 }
 323  0092 81            	ret
 336                     	xdef	_setURAT_OUTPUT_CONTROL_PIN
 337                     	xdef	_setADP_SOC
 338                     	xdef	_gpio_init
 339                     	xdef	_getPIC_UVP_Status
 340                     	xdef	_getPIC_OVP_Status
 341                     	xref	_G_Var_Array
 342                     	xref	_GPIO_ReadInputPin
 343                     	xref	_GPIO_WriteLow
 344                     	xref	_GPIO_WriteHigh
 345                     	xref	_GPIO_Init
 364                     	end
