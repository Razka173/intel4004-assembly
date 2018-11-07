;QUIZ 3
;Data r1 dan r2
;result r0
;do boolean and to r1, r2
;
; 0 1 1 >> example input
; 1 1 1 >> example output

start:
 ld r1
 jcn an cek_r2
 jcn az finish
 
cek_r2:
 ld r2
 jcn an isi
 jcn az finish
 
isi:
 ldm 1
 xch r0
 jun finish
 
finish:
 jms $3ff
 nop