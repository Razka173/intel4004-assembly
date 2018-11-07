temp:
 ld r4
 xch r15
 jun start
 
start:
 ld r5
 jcn an r6_check	;jump if accu exist
 jcn az r5_zero		;jump if accu zero
 jun finish	
 
r5_zero:
 ld r4
 jcn az finish		;jump if accu zero
 dac
 xch r4
 clb ;clear both carry and accumulator
 ldm 15
 xch r5
 clb
 jun r6_check
 
r6_check:
 ld r6
 jcn az pass		;jump if accu zero
 xch r10
 jun start2
 
start2:
 ld r10
 jcn an loop2		;jump if accu exist
 jcn az pass		;jump if accu zero

loop2:
 clc
 ldm 1
 add r2
 xch r2
 jcn c0 r10_min_min
 clc
 ldm 1
 add r1
 xch r1
 jcn c0 r10_min_min
 clc
 ldm 1
 add r0
 xch r0
 jun r10_min_min 

r10_min_min:
 ld r10
 dac		;dac will change the Carry, so we must clean it
 xch r10
 clc
 jun start2

pass:
 ld r3 
 add r7
 xch r3
 jcn c0 r5_min_min	;jump if carry = 0
 clc
 ldm 1
 add r2
 xch r2
 jcn c0 r5_min_min
 clc
 ldm 1
 add r1
 xch r1
 jcn c0 r5_min_min
 clc
 ldm 1
 add r0
 xch r0
 jun r5_min_min
 
r5_min_min:
 ld r5	
 dac ;dac will change the Carry, so we must clean it
 xch r5
 clc
 jun start
 
sisaan:
 xch r5
 ldm 0
 xch r15
 jun start
 
finish:
 ld r15
 jcn an sisaan
 ldm 0
 xch r6
 ldm 0
 xch r7
 ;jms $3ff	;thanks for my lecture that warning me about this instruction :)
 nop