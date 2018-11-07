start:
 ld r2
 jcn an min_min	; jump if r2 still more_than_zero
 jcn az finish	; jump finish if r2 already 0

min_min:
 dac
 xch r2
 clc
 jun eksekusi

eksekusi:
 ld r1	
 add r3
 xch r1
 jcn c0 start ; jump if carry = 0
 clc
 ldm 1
 add r0
 xch r0
 jun start

finish:
 ldm 0		;clear the ress
 xch r3	 	;clear the ress
 nop