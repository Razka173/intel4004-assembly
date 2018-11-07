; RAZKA AGNIATARA (1313617023)
; R0:R3 akan menjadi tempat hasil
; R4:R5 akan menjadi tempat suatu bilangan X
; R6:R7 akan menjadi tempat suatu bilangan Y
; Please delete JMS line if you want to run this code from online emulator version

hutang_si_x:
 ld r4
 xch r15
 jun start
 
start:
 ld r5
 jcn an cek_y_puluhan	;jika x masih ada nilainya, masuk ke step selanjutnya, yaitu cek Y
 jcn az x_zero		;jika x, kita cek x_puluhan, kalo masih ada, kita pinjam x_puluhan tersebut
 jun finish	

;buat refill x jika x sudah 0 dan x_puluhan masih ada nilai 
x_zero:	
 ld r4
 jcn az finish	;jump finish jika puluhan sudah tidak ada juga
 dac
 xch r4
 clb 		;clear both carry and accumulator
 ldm 15		;ini seharusnya x diisi dengan 16, tapi karna gabisa, berarti x hutang 1 loop
 xch r5
 clb
 jun cek_y_puluhan
 
cek_y_puluhan:
 ld r6
 jcn az eksekusi_satuan	;jump if accu zero
 jcn an eksekusi_puluhan  ;jump if accu exist
 
eksekusi_puluhan:
 clc
 ld r6
 add r2
 xch r2
 jcn c0 eksekusi_satuan
 ldm 0
 add r1
 xch r1
 jcn c0 eksekusi_satuan
 ldm 0
 add r0
 xch r0
 jun eksekusi_satuan

eksekusi_satuan:
 ld r3 
 add r7
 xch r3
 jcn c0 x_min_min	;jump if carry = 0
 ldm 0
eksekusi:
 add r2
 xch r2
 jcn c0 x_min_min
 ldm 0
 add r1
 xch r1
 jcn c0 x_min_min
 ldm 0
 add r0
 xch r0
 jun x_min_min
 
x_min_min:
 ld r5	
 dac ;dac will change the Carry, so we must clean it
 xch r5
 clc
 jun start
 
x_bayar_hutang:
 xch r5
 ldm 0
 xch r15
 jun start
 
finish:
 ld r15
 jcn an x_bayar_hutang
 ldm 0
 xch r6
 ldm 0
 xch r7
 jms $3ff	;thanks for my lecture that warning me about this instruction :)
 nop