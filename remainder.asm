check_1:
 stc
 ld r2
 sub r4
 jcn c0 simple_case
 jcn an check_2

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
 jun next_check
 
next_check:
 ld r2
 jcn an check_check
 ld r3
 jcn az no_sisa
 jun check_check

check_check:
 stc
 ld r2
 sub r4
 jcn c0 simple_case
 jcn c1 check_check_2
 
check_check_2:
 stc
 ld r3
 sub r5
 jcn c0 check_check_again
 jcn c1 proses

check_check_again:
 stc
 ld r2
 sub r4
 jcn an proses
 jcn az simple_case
 
isi_hasil:
 ld r3
 xch r1
 ld r3
 jcn az finish
 ld r2
 xch r0
 jun finish

no_sisa:
 ldm 0
 xch r0
 ldm 0
 xch r1
 jun finish
 
finish:
 ;ldm 0
 ;xch r2		;bersihkan output
 ;ldm 0
 ;xch r3		;bersihkan output
 ;ldm 0
 ;xch r4		;bersihkan output
 ;ldm 0
 ;xch r5		;bersihkan output
 nop