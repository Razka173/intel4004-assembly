; 0 0 3 4 0 0 0 0 0 0 0 0 0 0 0 0 (input)
; 4 0 3 4 0 0 0 0 0 0 0 0 0 0 0 0 (output)
;transfer value x and y to the safe place
ld r2
xch r4
ld r3
xch r5

proses_x:
 ld r4
 dac
 jcn az y_won	;jump if x already zero, and y won
 xch r4
proses_y:
 ld r5
 dac
 jcn az x_won	 ;jump if y already zero, and x won
 xch r5
 jun proses_x

x_won:
 ld r2
 xch r0
 jun finish
y_won:
 ld r3
 xch r0
 jun finish
finish:
 ldm 0
 xch r4
 ldm 0
 xch r5
 nop
