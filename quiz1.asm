;QUIZ 1
;Data r2:r3
;decrement r2:r3 until 0
;for each decremeent, do an increment on r0:r1
;r0:r1 must store same value with original r2:r3
;
;0 0 2 2 >> example input
;2 2 0 0 >> example output

start:
 ld r3
 jcn an proses
 jcn az cek_r2
 
cek_r2:
 ld r2
 jcn an proses2
 jcn az finish

proses:
 ld r3
 dac
 xch r3
 clc
 ld r1
 iac
 xch r1
 clc
 jun proses2
 
proses2:
 ld r2
 dac
 xch r2
 clc
 ld r0
 iac
 xch r0
 clc
 jun start

finish:
 jms $3ff
 nop 