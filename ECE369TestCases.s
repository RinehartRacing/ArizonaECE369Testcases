#ECE 369 Collaborative Testcases
#These are free to use, but please
#consider adding more testcases

######################################################################################################################################
.text				# Put program here 
.globl main			# globally define 'main'
addi $t0, $0, -3			#0 [addi] t0 = -3
nop
nop
nop
nop
add $t1, $t0, $t0			#4 [add] t1 = -6
nop
nop
nop
nop
addi $t2, $t0, -4			#8 t2 = -7
nop
nop
nop
nop
addiu $t2, $t2, 0xFFFF 			#12 [addiu] t2 = -8 (sign extend 0xFFFF -> 0xFFFF_FFFF = -1; invert bits and add 1)
nop
nop
nop
nop
addi $t3, $0, -1			#16 t3 = -1
nop
nop
nop
nop
addu $t2, $t2, $t3			#20 [addu] t2 = -9
nop
nop
nop
nop
sub $t2, $t2, $t1			#24 [sub] t2 = -3	
nop
nop
nop
nop
addi $t4, $0, 0x0FAD			#28 t4 = 0000_0FAD
nop
nop
nop
nop
mul $t2, $t4, $t4			#32 [mul] t2 = 00F5_BAE9
nop
nop
nop
nop
mult $t2, $t2				#36 [mult]  HI = 0000_EBDF LO = 4A71_6811
nop
nop
nop
nop
multu $t4, $t2				#40 [multu] HI = 0000_000F LO = 0C02_F675
nop
nop
nop
nop
madd $t4, $t2				#44 [madd]  HI = 0000_001E LO = 1805_ECEA
nop
nop
nop
nop
msub $t4, $t2				#48 [msub]  HI = 0000_000F LO = 0C02_F675
nop
nop
nop
nop

#Memory 0:{[][][][]} ; 4:{[][][][]} each [] is 8 bits/1 byte

sw $t4,	4($0)				#52 [sw] Memory[1] = 0000_0FAD #Memory 0:{[][][][]} ; 4:{[00][00][0F][AD]}
nop
nop
nop
nop
lw $t5, 4($0)				#56 [lw] t5 = 0000_0FAD
nop
nop
nop
nop
sb $t2, 4($0)				#60 [sb] Memory[1] = E900_0FAD (stores least significant byte of t2 -> E9) #Memory 0:{[][][][]} ; 4:{[E9][00][0F][AD]}
nop
nop
nop
nop
sh $t2, 6($0)				#64 [sh] Memory[1] = E900_BAE9 (stores least significant half of t2 -> BAE9)#Memory 0:{[][][][]} ; 4:{[E9][00][BA][E9]}
nop
nop
nop
nop
lh $t5, 6($s0)				#68 [lh] t5 = FFFF_BAE9 (sign extends BAE9 -> B = 1011 so the most significant bit is 1)
nop
nop
nop
nop
lb $t5, 5($s0)				#72 [lb] t5 = 0000_0000 (sign extends 00)
nop
nop
nop
nop

lui $t5, 0xABCD				#76 [lui] t5 = ABCD_0000
nop
nop
nop
nop
lui $t0, 0xAAAA			#80 t0 = AAAA_0000
nop
nop
nop
nop
addi $t0, $t0, 0xAAAA		   	#84 			t0 = AAAA_AAAA = 1010_1010_1010_1010_1010_1010_1010_1010
nop
nop
nop
nop
lui $t1, 0x9999			#88 			t1 = 9999_0000
nop
nop
nop
nop
addi $t1, $t1, 0x9999			#92 			t1 = 9999_9999 = 1001_1001_1001_1001_1001_1001_1001_1001
nop
nop
nop
nop
and $t2, $t0, $t1			#96 [and]		t2 = 8888_8888 = 1000_1000_1000_1000_1000_1000_1000_1000
nop
nop
nop
nop
andi $t2, $t0, 0x7777			#100 [andi]		t2 = 0000_2222 = 0000_0010_0010_0010_0010_0010_0010_0010 (7777 = 0000_0000_0000_0000_0111_0111_0111_0111) ZERO-EXTEND
nop
nop
nop
nop
or $t2, $t0, $t1			#104 [or]		t2 = BBBB_BBBB = 1011_1011_1011_1011_1011_1011_1011_1011
nop
nop
nop
nop
nor $t2, $t0, $t1			#108 [nor]		t2 = 4444_4444 = 0100_0100_0100_0100_0100_0100_0100_0100
nop
nop
nop
nop
xor $t2, $t0, $t1			#112 [xor]		t2 = 1111_1111 = 0001_0001_0001_0001_0001_0001_0001_0001
nop
nop
nop
nop
ori $t2, $t0, 0x7777			#116 [ori]		t2 = AAAA_FFFF = 1010_1010_1010_1010_1111_1111_1111_1111
nop
nop
nop
nop
xori $t2, $t0, 0x7777			#120 [xori]		t2 = AAAA_DDDD = 1010_1010_1010_1010_1101_1101_1101_1101 
nop
nop
nop
nop
seh $t2, $t2				#124 [seh]		t2 = FFFF_DDDD = 1111_1111_1111_1111_1101_1101_1101_1101 SIGN-EXTEND HALFWORD
nop
nop
nop
nop
sll $t2, $t2, 2				#128 [sll]		t2 = FFFF_7774 = 1111_1111_1111_1111_0111_0111_0111_0100 
nop
nop
nop
nop
srl $t2, $t2, 4				#132 [srl] 		t2 = 0FFF_F777 = 0000_1111_1111_1111_1111_0111_0111_0111
nop
nop
nop
nop
addi $t2, $t2, -16			#136			t2 = 0FFF_F767 = 0000_1111_1111_1111_1111_0111_0110_0111
nop
nop
nop
nop
sllv $t2, $t2, $t2			#140 [sllv] 		t2 = FFFD_D380 = 1111_1111_1111_1011_1011_0011_1000_0000 (00111 = 7 bits)
nop
nop
nop
nop
addi $t1, $t1, -16			#144			t1 = 9999_9989 = 1001_1001_1001_1001_1001_1001_1000_1001
nop
nop
nop
nop
srlv $t2, $t2, $t1			#148 [srlv]		t2 = 007F_FDD9 = 0000_0000_0111_1111_1111_1101_1101_1001 (01001 = 9 bits)
nop
nop
nop
nop
slt $t3, $t1, $t2			#152 [slt] t3 = 1	t1 < t2 = TRUE	SIGNED (need to test that it sets to 0 as well)
nop
nop
nop
nop
slti $t3, $t1, 0xFFFF			#156 [slti] t3 = 0	t1 < FFFF_FFFF = TRUE SIGNED SIGN-EXTEND (need to test that it sets to 1 as well)
nop
nop
nop
nop
movn $t3, $t1, $t2			#160 [movn] 		t3 = 9999_9989 (need to test that it doesn't move as well)
nop
nop
nop
nop
movn $t3, $t2, $0			#164 [movz] 		t3 = 007F_FDD9 (need to test that it doesn't move as well)
nop
nop
nop
nop
rotrv $t3, $t3, $t2			#168 [rotrv] 		t3 = 03FF_EEC8 = 0000_0011_1111_1111_1110_1110_1100_1000 (11101 = 29 bits)
nop
nop
nop
nop
rotr $t3, $t3, 3			#172 [rotr] 		t3 = 007F_FDD9 = 0000_0000_0111_1111_1111_1101_1101_1001
nop
nop
nop
nop
sra $t3, $t1, 4				#176 [sra] 		t3 = F999_9998 = 1111_1001_1001_1001_1001_1001_1001_1000
nop
nop
nop
nop
srav $t3, $t1, $t1			#180 [srav]		t3 = FFCC_CCCC = 1111_1111_1100_1100_1100_1100_1100_1100 (01001 = 9 bits)
nop
nop
nop
nop
seb $t3, $t1				#184 [seb] 		t3 = FFFF_FF89 = 1111_1111_1111_1111_1111_1111_1000_1001
nop
nop
nop
nop
sltiu $t3, $t1, 0xFFFF			#188 [sltiu] t3 = 1	t1 < FFFF_FFFF = TRUE UNSIGNED (need to test that it sets to 0 as well)
nop
nop
nop
nop
sltu $t3, $t1, $t2			#192 [sltu] t3 = 0 	t1 < t2 = FALSE UNSIGNED (need to test that it sets to 1 as well)
nop
nop
nop
nop
mfhi $t3				#196 t3 = 0000_000F 
nop
nop
nop
nop
mflo $t4				#200 t3 = 0C02_F675
nop
nop
nop
nop
mthi $t4				#204 HI = 0C02_F675
nop
nop
nop
nop	
mtlo $t3				#208 LO = 0000_000F
nop
nop
nop
nop

addi $t3, $0, 4			 	#212 t3 = 4
nop
nop
nop
nop
bgezt3:
addi $t3, $t3, -1			#216 t3 = 3
nop
nop
nop
nop
bgez $t3, bgezt3: 			#220 (go back to 216 if t3 >= 0)
					#t3 = -1
nop
nop
nop
nop
addi $t4, $0, 0				#224 t4 = 0
nop
nop
nop
nop
beqt3:
addi $t3, $t3, 1			#228 t3 = 0
nop
nop
nop
nop
beq $t3, $t4, beqt3			#232 (go back to 228 if t3 = t4)
					#t3 = 1
nop
nop
nop
nop
addi $t4, $0, -1			#236 t4 = -1
nop
nop
nop
nop
bnet4:
addi $t4, $t4, 1			#240 t4 = 0
nop
nop
nop
nop
bne $t3, $t4, bnet4			#244 (go back to 240 if t3 != t4)
					#t4 = 1
nop
nop
nop
nop
addi $t4, $t4, 1			#248 t4 = 2
nop
nop
nop
nop
bgtzt4:
addi $t4, $t4, -1			#252 t4 = 1
nop
nop
nop
nop
bgtz $t4, bgtzt4			#256 (go back to 252 if t4 > 0)
					#t4 = 0
nop
nop
nop
nop
addi $t4, $0, -1			#260 t4 = -1
nop
nop
nop
nop
blezt4:
addi $t4, $t4, 1			#264 t4 = 0
nop
nop
nop
nop
blez $t4, blezt4			#268 (go back to 264 if t4 <= 0)
					#t4 = 1
nop
nop
nop
nop
addi $t4, $0, -2			#272 t4 = -2
nop
nop
nop
nop
addi $t4, $t4, 1			#276 t4 = -1
nop
nop
nop
nop
bltz $t4, -2				#280 (go back to 276 if t4 < 0)
					#t4 = 0
nop
nop
nop
nop
j addit4				#284 (jump to 292)
nop
nop
nop
nop
addi $t4, $t4, 1			#288 (SKIPPED)
nop
nop
nop
nop
addit4:
addi $t4, $t4, 1			#292 t4 = 1 (NOT 2)
nop
nop
nop
nop
addi $t4, $0, 385			#296 t4 = 308 (385 when nops are accounted for)
nop
nop
nop
nop
jr $t4					#300 (jump to 308) THIS IS ACTUALLY INSTRUCTION 385 WHEN ALL NOPs ARE ADDED
nop
nop
nop
nop
addi $t4, $t4, 1			#304 (SKIPPED)
nop
nop
nop
nop
addi $t4, $t4, 1			#308 t4 = 309 (NOT 310) FOR NOPs, t4 = 386 (NOT 387)
nop
nop
nop
nop
addi $t5, $0, 4				#308 t5 = 4
nop
nop
nop
nop
bne $t5, $0, jalra			#312 (go to 328 if t5 != 0)
nop
nop
nop
nop
addi $t5, $t5, -4			#316 (SKIPPED)
nop
nop
nop
nop
addit5:
addi $t5, $t5, -4			#320 t5 = 0 (NOT -4)
nop
nop
nop
nop
jr $ra					#324 (go back to ra = 332)
nop
nop
nop
nop
jalra:
jal addit5				#328 (go to 320) ra = 332
nop
nop
nop
nop
addi $t4, $t4, 1			#332 t4 = 310 For NOPs, t4 = 387
nop
nop
nop
nop
.end