start:
 ld r2
 jcn an r2_not_zero	; jump if r2 still more_than_zero
 jun finish			; jump finish if r2 already 0
r2_not_zero:
 ld r1	
 add r3
 xch r1
 jcn c0 r2_min_min ; jump if carry = 0
 ldm 0
 tcc
 add r0
 xch r0
r2_min_min:
 ld r2	
 dac	;dac will change the Carry, so we must clean it
 xch r2
 clc
 jun start
finish:
 ldm 0		;clear the ress
 xch r3	 	;clear the ress
 nop
 
;idea
;result=0
;while(x>0):
	;result = result + x
	;x = x - 1
	
;Sample Input
;0 0 4 5 0 0 0 0 0 0 0 0 0 0 0 0 >>> it mean 4 x 5, the result must be 20
;1 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 >>> r0 have 16 value. 1 (16) + 4 = 20

;backup_finish_method
;finish:
 ;ld r0
 ;jcn az swap
 ;ldm 0		;clear other
 ;xch r3	 	;clear other
 ;nop 
;swap:
 ;ld r1
 ;xch r0
 ;ldm 0
 ;xch r1
 ;jun finish