;QUIZ 2
;Data are stored at r3:r4 and r5:r6
;Result is stored at r1:r2
;carry is stored at r0
; - Carry is 0 if r3:r4 < r5:r6
; - Otherwise 1
;subtract r3:r4 to r5:r6
;
; 0 0 0 2 2 1 1 >> Example input
; 1 1 1 0 0 0 0 >> Example output

start:
 check_1:
 stc
 ld r3
 sub r5
 jcn c0 pengurang_lebih_besar
 jcn c1 check_2

check_2:
 stc
 ld r4
 sub r6
 jcn c0 check_3
 jcn c1 proses

check_3:
 stc
 ld r3
 sub r5
 jcn an proses
 jcn az pengurang_lebih_besar

pengurang_lebih_besar:
 stc
 ld r3
 sub r5
 xch r3
 stc
 ld r4
 sub r6
 xch r4
 jcn c0 r2_min
 jun isi_hasil_min

r2_min:
 ld r3
 dac
 xch r3
 clc
 
isi_hasil_min: 
 ld r3
 xch r1
 ld r4
 xch r2
 jun finish
 
proses:
 stc
 ld r3
 sub r5
 xch r3
 stc
 ld r4
 sub r6
 xch r4
 jcn c0 r2_min_min
 jun isi_hasil

r2_min_min:
 ld r3
 dac
 xch r3
 clc

isi_hasil:
 ld r3
 xch r1
 ld r4
 xch r2
 ldm 1
 xch r0
 
finish:
 ldm 0
 xch r3
 ldm 0
 xch r4
 ldm 0
 xch r5
 ldm 0
 xch r6
 jms $3ff
 nop