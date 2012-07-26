   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  45                     ; 10 void mosfetControl_init(void)
  45                     ; 11 {
  47                     	switch	.text
  48  0000               _mosfetControl_init:
  52                     ; 13 	GPIO_Init(C_MOS_PORT, C_MOS_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  54  0000 4be0          	push	#224
  55  0002 4b40          	push	#64
  56  0004 ae500a        	ldw	x,#20490
  57  0007 cd0000        	call	_GPIO_Init
  59  000a 85            	popw	x
  60                     ; 14 	GPIO_Init(D_MOS_PORT, D_MOS_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  62  000b 4be0          	push	#224
  63  000d 4b80          	push	#128
  64  000f ae500a        	ldw	x,#20490
  65  0012 cd0000        	call	_GPIO_Init
  67  0015 85            	popw	x
  68                     ; 17 	G_Activate_Action_Status &= ~(CHG_MOSFET_STATUS);
  70  0016 72110009      	bres	_G_Var_Array+9,#0
  71                     ; 18 	G_Activate_Action_Status &= ~(DSG_MOSFET_STATUS);
  73  001a 72130009      	bres	_G_Var_Array+9,#1
  74                     ; 21 }
  77  001e 81            	ret
 112                     ; 23 void setMosCHG(unsigned char enable){
 113                     	switch	.text
 114  001f               _setMosCHG:
 118                     ; 24   if(enable){
 120  001f 4d            	tnz	a
 121  0020 270f          	jreq	L53
 122                     ; 26     GPIO_WriteHigh(C_MOS_PORT, C_MOS_PIN);
 124  0022 4b40          	push	#64
 125  0024 ae500a        	ldw	x,#20490
 126  0027 cd0000        	call	_GPIO_WriteHigh
 128  002a 84            	pop	a
 129                     ; 27     G_Activate_Action_Status |= (CHG_MOSFET_STATUS);
 131  002b 72100009      	bset	_G_Var_Array+9,#0
 133  002f 200d          	jra	L73
 134  0031               L53:
 135                     ; 30     GPIO_WriteLow(C_MOS_PORT, C_MOS_PIN);
 137  0031 4b40          	push	#64
 138  0033 ae500a        	ldw	x,#20490
 139  0036 cd0000        	call	_GPIO_WriteLow
 141  0039 84            	pop	a
 142                     ; 31     G_Activate_Action_Status &= ~(CHG_MOSFET_STATUS);
 144  003a 72110009      	bres	_G_Var_Array+9,#0
 145  003e               L73:
 146                     ; 38 }
 149  003e 81            	ret
 184                     ; 40 void setMosDSG(unsigned char enable){
 185                     	switch	.text
 186  003f               _setMosDSG:
 190                     ; 41   if(enable){
 192  003f 4d            	tnz	a
 193  0040 270f          	jreq	L55
 194                     ; 43     GPIO_WriteHigh(D_MOS_PORT, D_MOS_PIN);
 196  0042 4b80          	push	#128
 197  0044 ae500a        	ldw	x,#20490
 198  0047 cd0000        	call	_GPIO_WriteHigh
 200  004a 84            	pop	a
 201                     ; 44     G_Activate_Action_Status |= (DSG_MOSFET_STATUS);
 203  004b 72120009      	bset	_G_Var_Array+9,#1
 205  004f 200d          	jra	L75
 206  0051               L55:
 207                     ; 47     GPIO_WriteLow(D_MOS_PORT, D_MOS_PIN);
 209  0051 4b80          	push	#128
 210  0053 ae500a        	ldw	x,#20490
 211  0056 cd0000        	call	_GPIO_WriteLow
 213  0059 84            	pop	a
 214                     ; 48     G_Activate_Action_Status &= ~(DSG_MOSFET_STATUS);
 216  005a 72130009      	bres	_G_Var_Array+9,#1
 217  005e               L75:
 218                     ; 56 }
 221  005e 81            	ret
 234                     	xdef	_setMosDSG
 235                     	xdef	_setMosCHG
 236                     	xdef	_mosfetControl_init
 237                     	xref	_G_Var_Array
 238                     	xref	_GPIO_WriteLow
 239                     	xref	_GPIO_WriteHigh
 240                     	xref	_GPIO_Init
 259                     	end
