; RAZKA AGNIATARA (1313617023)
; R0:R1 akan menjadi tempat hasil
; R2:R3 akan menjadi tempat suatu bilangan X
; R4:R5 akan menjadi tempat suatu bilangan Y
; Please delete JMS line if you want to run this code from online emulator version

check_1:
 stc
 ld r2
 sub r4
 jcn c0 simple_case
 jcn c1 check_2

simple_case:
 ld r2
 xch r0
 ld r3
 xch r1
 jun finish

check_2:
 stc
 ld r3
 sub r5
 jcn c0 check_again
 jcn c1 proses

check_again:
 stc
 ld r2
 sub r4
 jcn an proses
 jcn az simple_case

proses:
 stc
 ld r2
 sub r4
 xch r2
 stc
 ld r3
 sub r5
 xch r3
 jcn c0 r2_min_min
 jun next_check

r2_min_min:
 ld r2
 dac
 xch r2
 clc
 
next_check:
 ld r2
 jcn an check_1
 ld r3
 jcn az finish
 jun check_1

no_sisa:
 ldm 0
 xch r0
 ldm 0
 xch r1
 jun finish
 
finish:
 ldm 0
 xch r2		;bersihkan output
 ldm 0
 xch r3		;bersihkan output
 ldm 0
 xch r4		;bersihkan output
 ldm 0
 xch r5		;bersihkan output
 jms $3ff	;thanks for my lecture that warning me about this instruction :)
 nop