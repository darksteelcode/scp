	call	main
	.db	#255
	.module	CC_DIV_SMALLC_GENERATED
ccudiv:
	mdsp	#-10
	pshb	
	xswp	
	bspa	#2
	swpb	
	popb	
	bspa	#2
	swpb	
	bspa	#8
	xswp	
	lbia	#0
	swqa	
	bspa	#6
	xswp	
	lbia	#0
	swqa	
	bspa	#4
	xswp	
	lbia	#15
	swqa	
ccudiv_2:
	bspa	#4
	lwpa	
	xswp	
	lbia	#1
	aadd	
	jpnz	ccudiv_4
	jmp 	ccudiv_5
ccudiv_3:
	bspa	#4
	psha	
	lwpa	
	deca	
	popb	
	swqa	
	jmp 	ccudiv_2
ccudiv_4:
	bspa	#6
	psha	
	bspa	#8
	lwpa	
	xswp	
	lbia	#1
	ashl	
	popb	
	swqa	
	bspa	#6
	psha	
	bspa	#8
	lwpa	
	psha	
	lwia	#4094
	popb	
	abnd	
	psha	
	bspa	#6
	lwpa	
	psha	
	lbia	#1
	xswp	
	bspa	#12
	lwpa	
	ashl	
	popb	
	abnd	
	xswp	
	bspa	#10
	lwpa	
	ashr	
	popb	
	aadd	
	popb	
	swqa	
	bspa	#6
	lwpa	
	xswp	
	bspa	#2
	lwpa	
	ault	
	alng	
	jpz 	ccudiv_6
	bspa	#6
	psha	
	bspa	#8
	lwpa	
	xswp	
	bspa	#4
	lwpa	
	asub	
	popb	
	swqa	
	bspa	#8
	psha	
	bspa	#10
	lwpa	
	psha	
	lbia	#1
	xswp	
	bspa	#10
	lwpa	
	ashl	
	popb	
	abor	
	popb	
	swqa	
ccudiv_6:
	jmp 	ccudiv_3
ccudiv_5:
	bspa	#6
	lwpa	
	xswp	
	bspa	#8
	lwpa	
ccudiv_1:
	mdsp	#10
	ret 	
ccdiv:
	mdsp	#-6
	pshb	
	xswp	
	bspa	#2
	swpb	
	popb	
	bspa	#2
	swpb	
	nop 	
	bspa	#5
	xswp	
	lbia	#0
	sbqa	
	bspa	#4
	xswp	
	lbia	#0
	sbqa	
	bspa	#2
	lwpa	
	psha	
	lwia	#32768
	popb	
	abnd	
	jpz 	ccdiv_2
	bspa	#2
	psha	
	bspa	#4
	lwpa	
	aneg	
	popb	
	swqa	
	bspa	#5
	psha	
	lbpa	
	xswp	
	lbia	#1
	abxr	
	popb	
	sbqa	
	bspa	#4
	xswp	
	lbia	#1
	sbqa	
ccdiv_2:
	bspa	#0
	lwpa	
	psha	
	lwia	#32768
	popb	
	abnd	
	jpz 	ccdiv_3
	bspa	#0
	psha	
	bspa	#2
	lwpa	
	aneg	
	popb	
	swqa	
	bspa	#5
	psha	
	lbpa	
	xswp	
	lbia	#1
	abxr	
	popb	
	sbqa	
ccdiv_3:
	bspa	#2
	lwpa	
	xswp	
	bspa	#0
	lwpa	
	call	ccudiv
	psha	
	bspa	#2
	swpb	
	popb	
	bspa	#2
	swpb	
	bspa	#5
	lbpa	
	jpz 	ccdiv_4
	bspa	#2
	psha	
	bspa	#4
	lwpa	
	aneg	
	popb	
	swqa	
ccdiv_4:
	bspa	#4
	lbpa	
	jpz 	ccdiv_5
	bspa	#0
	psha	
	bspa	#2
	lwpa	
	aneg	
	popb	
	swqa	
ccdiv_5:
	bspa	#0
	lwpa	
	xswp	
	bspa	#2
	lwpa	
ccdiv_1:
	mdsp	#6
	ret 	
	.module	CCCASE_SMALLC_GENERATED
cccase:
	mdsp	#-6
	xswp	
	bspa	#0
	swpb	
	bspa	#4
	xswp	
	bspa	#8
	lwpa	
	swqa	
$2:
	lbia	#1
	jpz 	$3
	bspa	#0
	lwpa	
	psha	
	bspa	#4
	psha	
	bspa	#8
	psha	
	lwpa	
	inca	
	inca	
	popb	
	swqa	
	deca	
	deca	
	lwpa	
	popb	
	swqa	
	popb	
	aequ	
	jpz 	$5
	bspa	#4
	lwpa	
	lwpa	
$5:
	aclv	
	jpz 	$4
	bspa	#4
	lwpa	
	lwpa	
	mdsp	#8
	jmpa	
$4:
	bspa	#4
	lwpa	
	lwpa	
	alng	
	jpz 	$6
	bspa	#2
	lwpa	
	mdsp	#8
	jmpa	
	bspa	#4
	psha	
	lwpa	
	inca	
	inca	
	popb	
	swqa	
$6:
	jmp 	$2
$3:
$1:
	mdsp	#8
	.module	CRUN_END
	.module	SMALLC_GENERATED
outp:
	bspa	#4
	lbpa	
	xswp	
	bspa	#2
	lwpa	
	outa	
$1:
	ret 	
inp:
	bspa	#2
	lbpa	
	xswp	
	ina 	
$2:
	ret 	
	.module	SMALLC_GENERATED
_malloc_new:
	mdsp	#-12
	bspa	#0
	lbib	#6
	aadd	
	xswp	
	lbia	#0
	sbqa	
	bspa	#0
	lbib	#4
	aadd	
	xswp	
	bspa	#18
	lwpa	
	swqa	
	bspa	#0
	lbib	#0
	aadd	
	xswp	
	bspa	#16
	lwpa	
	swqa	
	bspa	#0
	lbib	#2
	aadd	
	xswp	
	lbia	#0
	swqa	
	lwma	brk
	psha	
	bspa	#2
	psha	
	lbia	#12
	psha	
	lbib	#3
	call	memcpy
	mdsp	#6
	bspa	#14
	lwpa	
	jpz 	$2
	bspa	#14
	lwpa	
	lbib	#2
	aadd	
	psha	
	lwma	brk
	popb	
	swqa	
	jmp 	$3
$2:
	lwma	brk
	swma	_malloc_head
$3:
	lwma	brk
	swma	_malloc_tail
	lwma	brk
	psha	
	lbia	#12
	xswp	
	bspa	#20
	lwpa	
	aadd	
	popb	
	aadd	
	swma	brk
	lwma	brk
	xswp	
	bspa	#18
	lwpa	
	asub	
	jmp 	$1
$1:
	mdsp	#12
	ret 	
_malloc_combine:
	bspa	#2
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	jpz 	$5
	bspa	#2
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	lbib	#6
	aadd	
	lbpa	
	jpz 	$6
	bspa	#2
	lwpa	
	lbib	#4
	aadd	
	psha	
	lwpa	
	psha	
	bspa	#6
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	lbib	#4
	aadd	
	lwpa	
	xswp	
	lbia	#12
	aadd	
	popb	
	aadd	
	popb	
	swqa	
	bspa	#2
	lwpa	
	lbib	#2
	aadd	
	psha	
	bspa	#4
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	popb	
	swqa	
	bspa	#2
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	alng	
	jpz 	$7
	bspa	#2
	lwpa	
	swma	_malloc_tail
$7:
	bspa	#2
	lwpa	
	psha	
	lbib	#1
	call	_malloc_combine
	mdsp	#2
$6:
	jmp 	$8
$5:
	bspa	#2
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	jpz 	$9
	bspa	#2
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	lbib	#6
	aadd	
	lbpa	
	jpz 	$10
	bspa	#2
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	lbib	#4
	aadd	
	psha	
	lwpa	
	psha	
	bspa	#6
	lwpa	
	lbib	#4
	aadd	
	lwpa	
	xswp	
	lbia	#12
	aadd	
	popb	
	aadd	
	popb	
	swqa	
	bspa	#2
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	lbib	#2
	aadd	
	psha	
	bspa	#4
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	popb	
	swqa	
	bspa	#2
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	psha	
	lbib	#1
	call	_malloc_combine
	mdsp	#2
$10:
$9:
$8:
$4:
	ret 	
kmalloc:
	mdsp	#-20
	bspa	#18
	psha	
	lwma	_malloc_head
	popb	
	swqa	
$12:
	bspa	#18
	lwpa	
	jpz 	$13
	bspa	#18
	lwpa	
	lbib	#4
	aadd	
	lwpa	
	xswp	
	bspa	#24
	lwpa	
	ault	
	alng	
	jpz 	$15
	bspa	#18
	lwpa	
	lbib	#6
	aadd	
	lbpa	
$15:
	aclv	
	jpz 	$14
	bspa	#18
	lwpa	
	lbib	#6
	aadd	
	xswp	
	lbia	#0
	sbqa	
	bspa	#16
	xswp	
	bspa	#20
	lwpa	
	swqa	
	bspa	#14
	psha	
	bspa	#20
	lwpa	
	lbib	#4
	aadd	
	lwpa	
	xswp	
	bspa	#26
	lwpa	
	asub	
	popb	
	swqa	
	bspa	#14
	lwpa	
	xswp	
	lbia	#12
	aule	
	alng	
	jpz 	$16
	bspa	#18
	lwpa	
	lbib	#4
	aadd	
	xswp	
	bspa	#24
	lwpa	
	swqa	
	bspa	#2
	lbib	#4
	aadd	
	psha	
	bspa	#16
	lwpa	
	xswp	
	lbia	#12
	asub	
	popb	
	swqa	
	bspa	#2
	lbib	#6
	aadd	
	xswp	
	lbia	#1
	sbqa	
	bspa	#2
	lbib	#0
	aadd	
	xswp	
	bspa	#20
	lwpa	
	swqa	
	bspa	#2
	lbib	#2
	aadd	
	psha	
	bspa	#20
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	popb	
	swqa	
	bspa	#0
	psha	
	bspa	#18
	lwpa	
	xswp	
	lbia	#12
	aadd	
	xswp	
	bspa	#26
	lwpa	
	aadd	
	popb	
	swqa	
	bspa	#0
	lwpa	
	psha	
	bspa	#4
	psha	
	lbia	#12
	psha	
	lbib	#3
	call	memcpy
	mdsp	#6
	bspa	#18
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	jpz 	$17
	bspa	#18
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	lbib	#0
	aadd	
	xswp	
	bspa	#2
	lwpa	
	swqa	
	jmp 	$18
$17:
	bspa	#0
	lwpa	
	swma	_malloc_tail
$18:
	bspa	#18
	lwpa	
	lbib	#2
	aadd	
	xswp	
	bspa	#2
	lwpa	
	swqa	
$16:
	bspa	#16
	lwpa	
	xswp	
	lbia	#12
	aadd	
	jmp 	$11
$14:
	bspa	#18
	psha	
	bspa	#20
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	popb	
	swqa	
	jmp 	$12
$13:
	bspa	#22
	lwpa	
	psha	
	lwma	_malloc_tail
	psha	
	lbib	#2
	call	_malloc_new
	mdsp	#4
	jmp 	$11
$11:
	mdsp	#20
	ret 	
kcalloc:
	mdsp	#-6
	bspa	#4
	psha	
	bspa	#12
	lwpa	
	xswp	
	bspa	#12
	lwpa	
	amul	
	popb	
	swqa	
	bspa	#2
	psha	
	bspa	#6
	lwpa	
	psha	
	lbib	#1
	call	kmalloc
	mdsp	#2
	popb	
	swqa	
	bspa	#0
	xswp	
	bspa	#4
	lwpa	
	swqa	
$20:
	bspa	#4
	psha	
	lwpa	
	deca	
	popb	
	swqa	
	inca	
	jpz 	$21
	bspa	#0
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	xswp	
	lbia	#0
	sbqa	
	jmp 	$20
$21:
	bspa	#2
	lwpa	
	jmp 	$19
$19:
	mdsp	#6
	ret 	
kfree:
	mdsp	#-2
	bspa	#0
	psha	
	bspa	#6
	lwpa	
	xswp	
	lbia	#12
	asub	
	popb	
	swqa	
	bspa	#0
	lwpa	
	lbib	#6
	aadd	
	xswp	
	lbia	#1
	sbqa	
	bspa	#0
	lwpa	
	psha	
	lbib	#1
	call	_malloc_combine
	mdsp	#2
$22:
	mdsp	#2
	ret 	
krealloc:
	mdsp	#-4
	bspa	#2
	psha	
	bspa	#10
	lwpa	
	xswp	
	lbia	#12
	asub	
	popb	
	swqa	
	bspa	#0
	psha	
	bspa	#8
	lwpa	
	psha	
	lbib	#1
	call	kmalloc
	mdsp	#2
	popb	
	swqa	
	bspa	#0
	lwpa	
	psha	
	bspa	#10
	lwpa	
	psha	
	bspa	#6
	lwpa	
	lbib	#4
	aadd	
	lwpa	
	psha	
	lbib	#3
	call	memcpy
	mdsp	#6
	bspa	#8
	lwpa	
	psha	
	lbib	#1
	call	kfree
	mdsp	#2
	bspa	#0
	lwpa	
	jmp 	$23
$23:
	mdsp	#4
	ret 	
brk:
	.dw	#0
_malloc_head:
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.ds	#5
_malloc_tail:
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.ds	#5
	.module	SMALLC_GENERATED
memcmp:
$2:
	bspa	#2
	psha	
	lwpa	
	deca	
	popb	
	swqa	
	inca	
	jpz 	$3
	bspa	#6
	lwpa	
	lbpa	
	psha	
	bspa	#6
	lwpa	
	lbpa	
	popb	
	aneq	
	jpz 	$4
	bspa	#6
	lwpa	
	lbpa	
	psha	
	bspa	#6
	lwpa	
	lbpa	
	popb	
	asub	
	jmp 	$1
$4:
	bspa	#6
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	bspa	#4
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	jmp 	$2
$3:
	lbia	#0
	jmp 	$1
$1:
	ret 	
	.module	SMALLC_GENERATED
memcpy:
	mdsp	#-2
	bspa	#0
	xswp	
	bspa	#10
	lwpa	
	swqa	
$2:
	bspa	#4
	psha	
	lwpa	
	deca	
	popb	
	swqa	
	inca	
	jpz 	$3
	bspa	#0
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	psha	
	bspa	#8
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	lbpa	
	popb	
	sbqa	
	jmp 	$2
$3:
	bspa	#8
	lwpa	
	jmp 	$1
$1:
	mdsp	#2
	ret 	
	.module	SMALLC_GENERATED
_print:
$2:
	bspa	#2
	lwpa	
	lbpa	
	asex	
	jpz 	$3
	bspa	#2
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	lbpa	
	asex	
	psha	
	lbib	#1
	call	putchar
	mdsp	#2
	jmp 	$2
$3:
$1:
	ret 	
_print_at:
$5:
	bspa	#4
	lwpa	
	lbpa	
	asex	
	jpz 	$6
	lbia	#5
	psha	
	bspa	#4
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	psha	
	lbib	#2
	call	outp
	mdsp	#4
	lbia	#6
	psha	
	bspa	#6
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	lbpa	
	asex	
	psha	
	lbib	#2
	call	outp
	mdsp	#4
	jmp 	$5
$6:
$4:
	ret 	
printf:
	mdsp	#-9
	bspa	#0
	swpb	
	bspa	#0
	psha	
	bspa	#2
	lwpa	
	xswp	
	lbia	#2
	amul	
	popb	
	swqa	
	bspa	#2
	xswp	
	bspa	#0
	swqa	
	bspa	#4
	psha	
	bspa	#4
	lwpa	
	xswp	
	lbia	#9
	aadd	
	xswp	
	bspa	#4
	lwpa	
	aadd	
	lwpa	
	popb	
	swqa	
	bspa	#2
	psha	
	bspa	#4
	lwpa	
	xswp	
	lbia	#7
	aadd	
	xswp	
	bspa	#4
	lwpa	
	aadd	
	popb	
	swqa	
	bspa	#7
	xswp	
	lbia	#0
	swqa	
$8:
	bspa	#4
	lwpa	
	lwpa	
	xswp	
	lbia	#255
	abnd	
	jpz 	$9
	bspa	#6
	psha	
	bspa	#6
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	lwpa	
	popb	
	sbqa	
	bspa	#6
	lbpa	
	xswp	
	lbia	#37
	aequ	
	jpz 	$10
	bspa	#6
	psha	
	bspa	#6
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	lwpa	
	popb	
	sbqa	
	bspa	#6
	lbpa	
	xswp	
	lbia	#99
	aequ	
	jpz 	$11
	bspa	#2
	lwpa	
	xswp	
	bspa	#9
	lwpa	
	asub	
	lwpa	
	psha	
	lbib	#1
	call	putchar
	mdsp	#2
	jmp 	$12
$11:
	bspa	#6
	lbpa	
	xswp	
	lbia	#105
	aequ	
	jpnz	$14
	bspa	#6
	lbpa	
	xswp	
	lbia	#100
	aequ	
$14:
	aclv	
	jpz 	$13
	bspa	#2
	lwpa	
	xswp	
	bspa	#9
	lwpa	
	asub	
	lwpa	
	psha	
	lbia	#10
	psha	
	lbib	#2
	call	_sprintn
	mdsp	#4
	jmp 	$15
$13:
	bspa	#6
	lbpa	
	xswp	
	lbia	#117
	aequ	
	jpz 	$16
	bspa	#2
	lwpa	
	xswp	
	bspa	#9
	lwpa	
	asub	
	lwpa	
	psha	
	lbia	#10
	psha	
	lbib	#2
	call	_uprintn
	mdsp	#4
	jmp 	$17
$16:
	bspa	#6
	lbpa	
	xswp	
	lbia	#115
	aequ	
	jpz 	$18
	bspa	#2
	lwpa	
	xswp	
	bspa	#9
	lwpa	
	asub	
	lwpa	
	psha	
	lbib	#1
	call	_print
	mdsp	#2
	jmp 	$19
$18:
	bspa	#6
	lbpa	
	xswp	
	lbia	#120
	aequ	
	jpz 	$20
	bspa	#2
	lwpa	
	xswp	
	bspa	#9
	lwpa	
	asub	
	lwpa	
	psha	
	lbia	#16
	psha	
	lbib	#2
	call	_uprintn
	mdsp	#4
$20:
$19:
$17:
$15:
$12:
	bspa	#7
	psha	
	lwpa	
	xswp	
	lbia	#2
	aadd	
	popb	
	swqa	
	jmp 	$21
$10:
	bspa	#6
	lbpa	
	psha	
	lbib	#1
	call	putchar
	mdsp	#2
$21:
	jmp 	$8
$9:
$7:
	mdsp	#9
	ret 	
	.module	SMALLC_GENERATED
_sprintn:
	mdsp	#-4
	bspa	#8
	lwpa	
	xswp	
	lbia	#0
	aslt	
	jpz 	$2
	lbia	#45
	psha	
	lbib	#1
	call	putchar
	mdsp	#2
	bspa	#8
	psha	
	bspa	#10
	lwpa	
	aneg	
	popb	
	swqa	
$2:
	bspa	#2
	psha	
	bspa	#10
	lwpa	
	xswp	
	bspa	#10
	lwpa	
	call	ccdiv
	popb	
	swqa	
	xswp	
	lbia	#0
	aneq	
	jpz 	$3
	bspa	#2
	lwpa	
	psha	
	bspa	#8
	lwpa	
	psha	
	lbib	#2
	call	_sprintn
	mdsp	#4
$3:
	bspa	#0
	psha	
	lwia	$0+#0
	popb	
	swqa	
	bspa	#0
	lwpa	
	psha	
	bspa	#10
	lwpa	
	xswp	
	bspa	#10
	lwpa	
	call	ccdiv
	xswp	
	popb	
	aadd	
	lbpa	
	asex	
	psha	
	lbib	#1
	call	putchar
	mdsp	#2
$1:
	mdsp	#4
	ret 	
_uprintn:
	mdsp	#-4
	bspa	#2
	psha	
	bspa	#10
	lwpa	
	xswp	
	bspa	#10
	lwpa	
	call	ccudiv
	popb	
	swqa	
	xswp	
	lbia	#0
	aneq	
	jpz 	$5
	bspa	#2
	lwpa	
	psha	
	bspa	#8
	lwpa	
	psha	
	lbib	#2
	call	_uprintn
	mdsp	#4
$5:
	bspa	#0
	psha	
	lwia	$0+#17
	popb	
	swqa	
	bspa	#0
	lwpa	
	psha	
	bspa	#10
	lwpa	
	xswp	
	bspa	#10
	lwpa	
	call	ccudiv
	xswp	
	popb	
	aadd	
	lbpa	
	asex	
	psha	
	lbib	#1
	call	putchar
	mdsp	#2
$4:
	mdsp	#4
	ret 	
$0:	.db	#48,#49,#50,#51,#52,#53,#54,#55
	.db	#56,#57,#97,#98,#99,#100,#101,#102
	.db	#0,#48,#49,#50,#51,#52,#53,#54
	.db	#55,#56,#57,#97,#98,#99,#100,#101
	.db	#102,#0
	.module	SMALLC_GENERATED
_screenscroll:
	mdsp	#-4
	bspa	#2
	xswp	
	lbia	#0
	swqa	
$2:
	bspa	#2
	lwpa	
	psha	
	lwia	#1000
	popb	
	ault	
	jpnz	$4
	jmp 	$5
$3:
	bspa	#2
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	jmp 	$2
$4:
	lbia	#5
	psha	
	bspa	#4
	lwpa	
	xswp	
	lbia	#40
	aadd	
	psha	
	lbib	#2
	call	outp
	mdsp	#4
	bspa	#0
	psha	
	bspa	#4
	lwpa	
	psha	
	lwia	#960
	popb	
	ault	
	jpz 	$6
	lbia	#6
	psha	
	lbib	#1
	call	inp
	mdsp	#2
	jmp 	$7
$6:
	lbia	#0
$7:
	popb	
	swqa	
	lbia	#5
	psha	
	bspa	#4
	lwpa	
	psha	
	lbib	#2
	call	outp
	mdsp	#4
	lbia	#6
	psha	
	bspa	#2
	lwpa	
	psha	
	lbib	#2
	call	outp
	mdsp	#4
	jmp 	$3
$5:
	lwia	#960
	swma	_screenpos
$1:
	mdsp	#4
	ret 	
_screenclear:
	mdsp	#-2
	bspa	#0
	xswp	
	lbia	#0
	swqa	
$9:
	bspa	#0
	lwpa	
	psha	
	lwia	#1000
	popb	
	ault	
	jpnz	$11
	jmp 	$12
$10:
	bspa	#0
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	jmp 	$9
$11:
	lbia	#5
	psha	
	bspa	#2
	lwpa	
	psha	
	lbib	#2
	call	outp
	mdsp	#4
	lbia	#6
	psha	
	lbia	#0
	psha	
	lbib	#2
	call	outp
	mdsp	#4
	jmp 	$10
$12:
	lwia	#960
	swma	_screenpos
$8:
	mdsp	#2
	ret 	
putchar:
	lwma	_screenpos
	psha	
	lwia	#1000
	popb	
	ault	
	alng	
	jpz 	$14
	lbib	#0
	call	_screenscroll
$14:
	bspa	#2
	lbpa	
	xswp	
	lbia	#10
	aequ	
	jpz 	$15
	lbib	#0
	call	_screenscroll
	jmp 	$16
$15:
	bspa	#2
	lbpa	
	xswp	
	lbia	#9
	aequ	
	jpz 	$17
	lwma	_screenpos
	xswp	
	lbia	#8
	aadd	
	swma	_screenpos
	jmp 	$18
$17:
	bspa	#2
	lbpa	
	xswp	
	lbia	#8
	aequ	
	jpz 	$19
	lwma	_screenpos
	xswp	
	lbia	#1
	asub	
	swma	_screenpos
	lbia	#5
	psha	
	lwma	_screenpos
	psha	
	lbib	#2
	call	outp
	mdsp	#4
	lbia	#6
	psha	
	lbia	#0
	psha	
	lbib	#2
	call	outp
	mdsp	#4
	jmp 	$20
$19:
	lbia	#5
	psha	
	lwma	_screenpos
	inca	
	swma	_screenpos
	deca	
	psha	
	lbib	#2
	call	outp
	mdsp	#4
	lbia	#6
	psha	
	bspa	#4
	lbpa	
	psha	
	lbib	#2
	call	outp
	mdsp	#4
$20:
$18:
$16:
$13:
	ret 	
_screenpos:
	.dw	#960
	.module	SMALLC_GENERATED
disk_init:
	lbia	#13
	psha	
	lbia	#1
	psha	
	lbib	#2
	call	outp
	mdsp	#4
$2:
	lbia	#13
	psha	
	lbib	#1
	call	inp
	mdsp	#2
	jpz 	$3
	jmp 	$2
$3:
	lbia	#14
	psha	
	lbib	#1
	call	inp
	mdsp	#2
	jmp 	$1
$1:
	ret 	
disk_read:
$5:
	lbia	#13
	psha	
	lbib	#1
	call	inp
	mdsp	#2
	jpz 	$6
	jmp 	$5
$6:
	lbia	#14
	psha	
	bspa	#6
	lwpa	
	psha	
	lbib	#2
	call	outp
	mdsp	#4
	lbia	#16
	psha	
	lbia	#1
	psha	
	lbib	#2
	call	outp
	mdsp	#4
	lbia	#16
	psha	
	lbia	#0
	psha	
	lbib	#2
	call	outp
	mdsp	#4
$7:
	lbia	#13
	psha	
	lbib	#1
	call	inp
	mdsp	#2
	jpz 	$8
	jmp 	$7
$8:
$9:
	bspa	#2
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	psha	
	lbia	#15
	psha	
	lbib	#1
	call	inp
	mdsp	#2
	popb	
	sbqa	
	lbia	#15
	psha	
	lbia	#0
	psha	
	lbib	#2
	call	outp
	mdsp	#4
$10:
	lbia	#16
	psha	
	lbib	#1
	call	inp
	mdsp	#2
	jpnz	$9
$11:
$4:
	ret 	
disk_write:
$13:
	lbia	#13
	psha	
	lbib	#1
	call	inp
	mdsp	#2
	jpz 	$14
	jmp 	$13
$14:
	lbia	#14
	psha	
	bspa	#6
	lwpa	
	psha	
	lbib	#2
	call	outp
	mdsp	#4
$15:
	lbia	#17
	psha	
	bspa	#4
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	lbpa	
	psha	
	lbib	#2
	call	outp
	mdsp	#4
$16:
	lbia	#18
	psha	
	lbib	#1
	call	inp
	mdsp	#2
	jpnz	$15
$17:
	lbia	#18
	psha	
	lbia	#1
	psha	
	lbib	#2
	call	outp
	mdsp	#4
	lbia	#18
	psha	
	lbia	#0
	psha	
	lbib	#2
	call	outp
	mdsp	#4
$12:
	ret 	
	.module	SMALLC_GENERATED
buffer_alloc:
	mdsp	#-2
	bspa	#0
	xswp	
	lbia	#0
	swqa	
$2:
	bspa	#0
	lwpa	
	xswp	
	lbia	#32
	ault	
	jpnz	$4
	jmp 	$5
$3:
	bspa	#0
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	jmp 	$2
$4:
	lwia	buffer_table
	psha	
	bspa	#2
	lwpa	
	lbib	#5
	amul	
	popb	
	aadd	
	lbib	#4
	aadd	
	lbpa	
	alng	
	jpz 	$6
	lwia	buffer_table
	psha	
	bspa	#2
	lwpa	
	lbib	#5
	amul	
	popb	
	aadd	
	lbib	#0
	aadd	
	psha	
	lwia	#512
	psha	
	lbib	#1
	call	kmalloc
	mdsp	#2
	popb	
	swqa	
	lwia	buffer_table
	psha	
	bspa	#2
	lwpa	
	lbib	#5
	amul	
	popb	
	aadd	
	lbib	#4
	aadd	
	psha	
	lbpa	
	inca	
	popb	
	sbqa	
	lwia	buffer_table
	psha	
	bspa	#2
	lwpa	
	lbib	#5
	amul	
	popb	
	aadd	
	lbib	#2
	aadd	
	xswp	
	bspa	#6
	lwpa	
	swqa	
	bspa	#4
	lwpa	
	psha	
	lwia	buffer_table
	psha	
	bspa	#4
	lwpa	
	lbib	#5
	amul	
	popb	
	aadd	
	lbib	#0
	aadd	
	lwpa	
	psha	
	lbib	#2
	call	disk_read
	mdsp	#4
	lwia	buffer_table
	psha	
	bspa	#2
	lwpa	
	lbib	#5
	amul	
	popb	
	aadd	
	jmp 	$1
$6:
	jmp 	$3
$5:
	lbia	#1
	psha	
	lbib	#1
	call	panic
	mdsp	#2
$1:
	mdsp	#2
	ret 	
buffer_get:
	mdsp	#-2
	bspa	#0
	xswp	
	lbia	#0
	swqa	
$8:
	bspa	#0
	lwpa	
	xswp	
	lbia	#32
	ault	
	jpnz	$10
	jmp 	$11
$9:
	bspa	#0
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	jmp 	$8
$10:
	lwia	buffer_table
	psha	
	bspa	#2
	lwpa	
	lbib	#5
	amul	
	popb	
	aadd	
	lbib	#2
	aadd	
	lwpa	
	xswp	
	bspa	#6
	lwpa	
	aequ	
	jpz 	$12
	lwia	buffer_table
	psha	
	bspa	#2
	lwpa	
	lbib	#5
	amul	
	popb	
	aadd	
	lbib	#4
	aadd	
	psha	
	lbpa	
	inca	
	popb	
	sbqa	
	lwia	buffer_table
	psha	
	bspa	#2
	lwpa	
	lbib	#5
	amul	
	popb	
	aadd	
	jmp 	$7
$12:
	jmp 	$9
$11:
	bspa	#4
	lwpa	
	psha	
	lbib	#1
	call	buffer_alloc
	mdsp	#2
	jmp 	$7
$7:
	mdsp	#2
	ret 	
buffer_put:
	bspa	#2
	lwpa	
	lbib	#4
	aadd	
	psha	
	lbpa	
	deca	
	popb	
	sbqa	
	bspa	#2
	lwpa	
	lbib	#4
	aadd	
	lbpa	
	alng	
	jpz 	$14
	bspa	#2
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	psha	
	bspa	#4
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	psha	
	lbib	#2
	call	disk_write
	mdsp	#4
	bspa	#2
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	psha	
	lbib	#1
	call	kfree
	mdsp	#2
$14:
$13:
	ret 	
buffer_flush_all:
	mdsp	#-2
	bspa	#0
	xswp	
	lbia	#0
	swqa	
$16:
	bspa	#0
	lwpa	
	xswp	
	lbia	#32
	ault	
	jpnz	$18
	jmp 	$19
$17:
	bspa	#0
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	jmp 	$16
$18:
	lwia	buffer_table
	psha	
	bspa	#2
	lwpa	
	lbib	#5
	amul	
	popb	
	aadd	
	lbib	#2
	aadd	
	lwpa	
	psha	
	lwia	buffer_table
	psha	
	bspa	#4
	lwpa	
	lbib	#5
	amul	
	popb	
	aadd	
	lbib	#0
	aadd	
	lwpa	
	psha	
	lbib	#2
	call	disk_write
	mdsp	#4
	jmp 	$17
$19:
$15:
	mdsp	#2
	ret 	
buffer_table:
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.module	SMALLC_GENERATED
balloc_alloc:
	mdsp	#-4
	lwia	superblk
	lbib	#2
	aadd	
	lwpa	
	xswp	
	lbia	#8
	ashr	
	psha	
	lwia	balloc_buffer
	psha	
	lbib	#2
	call	disk_read
	mdsp	#4
	bspa	#2
	psha	
	lwia	superblk
	lbib	#2
	aadd	
	lwpa	
	popb	
	swqa	
$2:
	bspa	#2
	lwpa	
	psha	
	lwia	#65535
	popb	
	ault	
	jpnz	$4
	jmp 	$5
$3:
	bspa	#2
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	jmp 	$2
$4:
	bspa	#2
	lwpa	
	xswp	
	lbia	#255
	abnd	
	alng	
	jpz 	$6
	bspa	#2
	lwpa	
	xswp	
	lbia	#8
	ashr	
	psha	
	lwia	balloc_buffer
	psha	
	lbib	#2
	call	disk_read
	mdsp	#4
$6:
	bspa	#0
	psha	
	lwia	balloc_buffer
	psha	
	bspa	#6
	lwpa	
	xswp	
	lbia	#255
	abnd	
	lbib	#2
	amul	
	popb	
	aadd	
	lwpa	
	popb	
	swqa	
	bspa	#0
	lwpa	
	xswp	
	lbia	#0
	aequ	
	jpz 	$7
	bspa	#2
	lwpa	
	jmp 	$1
$7:
	jmp 	$3
$5:
	lbia	#2
	psha	
	lbib	#1
	call	panic
	mdsp	#2
$1:
	mdsp	#4
	ret 	
balloc_put:
	mdsp	#-6
	bspa	#0
	psha	
	bspa	#10
	psha	
	lwpa	
	inca	
	inca	
	popb	
	swqa	
	deca	
	deca	
	lwpa	
	popb	
	swqa	
$9:
	bspa	#8
	lwpa	
	lwpa	
	jpz 	$10
	bspa	#4
	psha	
	bspa	#2
	lwpa	
	xswp	
	lbia	#8
	ashr	
	popb	
	swqa	
	bspa	#2
	psha	
	bspa	#2
	lwpa	
	xswp	
	lbia	#255
	abnd	
	popb	
	swqa	
	bspa	#4
	lwpa	
	psha	
	lwia	balloc_buffer
	psha	
	lbib	#2
	call	disk_read
	mdsp	#4
	lwia	balloc_buffer
	psha	
	bspa	#4
	lwpa	
	lbib	#2
	amul	
	popb	
	aadd	
	lwpa	
	psha	
	bspa	#10
	lwpa	
	lwpa	
	popb	
	aneq	
	jpz 	$11
	lwia	balloc_buffer
	psha	
	bspa	#4
	lwpa	
	lbib	#2
	amul	
	popb	
	aadd	
	psha	
	bspa	#10
	lwpa	
	lwpa	
	popb	
	swqa	
	bspa	#4
	lwpa	
	psha	
	lwia	balloc_buffer
	psha	
	lbib	#2
	call	disk_write
	mdsp	#4
$11:
	bspa	#0
	psha	
	bspa	#10
	psha	
	lwpa	
	inca	
	inca	
	popb	
	swqa	
	deca	
	deca	
	lwpa	
	popb	
	swqa	
	jmp 	$9
$10:
	bspa	#4
	psha	
	bspa	#2
	lwpa	
	xswp	
	lbia	#8
	ashr	
	popb	
	swqa	
	bspa	#2
	psha	
	bspa	#2
	lwpa	
	xswp	
	lbia	#255
	abnd	
	popb	
	swqa	
	bspa	#4
	lwpa	
	psha	
	lwia	balloc_buffer
	psha	
	lbib	#2
	call	disk_read
	mdsp	#4
	lwia	balloc_buffer
	psha	
	bspa	#4
	lwpa	
	lbib	#2
	amul	
	popb	
	aadd	
	lwpa	
	xswp	
	lbia	#1
	aneq	
	jpz 	$12
	lwia	balloc_buffer
	psha	
	bspa	#4
	lwpa	
	lbib	#2
	amul	
	popb	
	aadd	
	xswp	
	lbia	#1
	swqa	
	bspa	#4
	lwpa	
	psha	
	lwia	balloc_buffer
	psha	
	lbib	#2
	call	disk_write
	mdsp	#4
$12:
$8:
	mdsp	#6
	ret 	
balloc_get:
	mdsp	#-4
	bspa	#2
	xswp	
	lbia	#1
	swqa	
	lwia	balloc_get_buf
	xswp	
	bspa	#10
	lwpa	
	swqa	
$14:
	lbia	#1
	jpz 	$15
	bspa	#8
	lwpa	
	xswp	
	lbia	#8
	ashr	
	psha	
	lwia	balloc_buffer
	psha	
	lbib	#2
	call	disk_read
	mdsp	#4
	bspa	#8
	psha	
	lwia	balloc_buffer
	psha	
	bspa	#12
	lwpa	
	xswp	
	lbia	#255
	abnd	
	lbib	#2
	amul	
	popb	
	aadd	
	lwpa	
	popb	
	swqa	
	bspa	#8
	lwpa	
	alng	
	jpnz	$17
	bspa	#8
	lwpa	
	psha	
	lwia	#65535
	popb	
	aequ	
$17:
	aclv	
	jpz 	$16
	lbia	#0
	jmp 	$13
$16:
	bspa	#8
	lwpa	
	xswp	
	lbia	#1
	aequ	
	jpz 	$18
	bspa	#2
	lwpa	
	xswp	
	lbia	#129
	ault	
	alng	
	jpz 	$19
	lbia	#4
	psha	
	lbib	#1
	call	panic
	mdsp	#2
$19:
	bspa	#6
	lwpa	
	xswp	
	bspa	#4
	lwpa	
	sbqa	
	lwia	balloc_get_buf
	psha	
	bspa	#4
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	lbib	#2
	amul	
	popb	
	aadd	
	xswp	
	lbia	#0
	swqa	
	bspa	#0
	psha	
	bspa	#4
	lwpa	
	xswp	
	lbia	#1
	ashl	
	psha	
	lbib	#1
	call	kmalloc
	mdsp	#2
	popb	
	swqa	
	bspa	#0
	lwpa	
	psha	
	lwia	balloc_get_buf
	psha	
	bspa	#6
	lwpa	
	xswp	
	lbia	#1
	ashl	
	psha	
	lbib	#3
	call	memcpy
	mdsp	#6
	bspa	#0
	lwpa	
	jmp 	$13
$18:
	lwia	balloc_get_buf
	psha	
	bspa	#4
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	lbib	#2
	amul	
	popb	
	aadd	
	xswp	
	bspa	#10
	lwpa	
	swqa	
	jmp 	$14
$15:
$13:
	mdsp	#4
	ret 	
balloc_free:
	mdsp	#-2
$21:
	bspa	#4
	lwpa	
	xswp	
	lbia	#8
	ashr	
	psha	
	lwia	balloc_buffer
	psha	
	lbib	#2
	call	disk_read
	mdsp	#4
	bspa	#0
	psha	
	lwia	balloc_buffer
	psha	
	bspa	#8
	lwpa	
	xswp	
	lbia	#255
	abnd	
	lbib	#2
	amul	
	popb	
	aadd	
	lwpa	
	popb	
	swqa	
	lwia	balloc_buffer
	psha	
	bspa	#6
	lwpa	
	xswp	
	lbia	#255
	abnd	
	lbib	#2
	amul	
	popb	
	aadd	
	xswp	
	lbia	#0
	swqa	
	bspa	#4
	lwpa	
	xswp	
	lbia	#8
	ashr	
	psha	
	lwia	balloc_buffer
	psha	
	lbib	#2
	call	disk_write
	mdsp	#4
	bspa	#4
	xswp	
	bspa	#2
	lwpa	
	swqa	
$22:
	bspa	#4
	lwpa	
	jpz 	$24
	bspa	#4
	lwpa	
	xswp	
	lbia	#1
	aneq	
$24:
	aclv	
	jpz 	$25
	bspa	#4
	lwpa	
	psha	
	lwia	#65535
	popb	
	aneq	
$25:
	aclv	
	jpnz	$21
$23:
$20:
	mdsp	#2
	ret 	
balloc_buffer:
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0
balloc_get_buf:
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.dw	#0,#0,#0,#0,#0,#0,#0,#0,#0
	.module	SMALLC_GENERATED
superblock_read:
	lwia	#383
	psha	
	lwia	fs_global_buf
	psha	
	lbib	#2
	call	disk_read
	mdsp	#4
	lwia	superblk
	psha	
	lwia	fs_global_buf
	psha	
	lbia	#13
	psha	
	lbib	#3
	call	memcpy
	mdsp	#6
$1:
	ret 	
superblk:
	.dw	#0
	.dw	#0
	.ds	#9
	.module	SMALLC_GENERATED
inode_alloc:
	mdsp	#-2
	bspa	#0
	xswp	
	lbia	#0
	swqa	
$2:
	bspa	#0
	lwpa	
	xswp	
	lbia	#24
	ault	
	jpnz	$4
	jmp 	$5
$3:
	bspa	#0
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	jmp 	$2
$4:
	lwia	inode_table
	psha	
	bspa	#2
	lwpa	
	lbib	#14
	amul	
	popb	
	aadd	
	lbib	#10
	aadd	
	lbpa	
	xswp	
	lbia	#0
	aequ	
	jpz 	$6
	lwia	inode_table
	psha	
	bspa	#2
	lwpa	
	lbib	#14
	amul	
	popb	
	aadd	
	jmp 	$1
$6:
	jmp 	$3
$5:
	lbia	#3
	psha	
	lbib	#1
	call	panic
	mdsp	#2
$1:
	mdsp	#2
	ret 	
inode_load:
	mdsp	#-4
	bspa	#6
	lwpa	
	psha	
	lwia	superblk
	lbib	#0
	aadd	
	lwpa	
	popb	
	ault	
	alng	
	jpz 	$8
	lbia	#5
	psha	
	lbib	#1
	call	panic
	mdsp	#2
$8:
	bspa	#2
	psha	
	lwia	#384
	psha	
	bspa	#10
	lwpa	
	xswp	
	lbia	#6
	ashr	
	popb	
	aadd	
	popb	
	swqa	
	bspa	#0
	psha	
	bspa	#8
	lwpa	
	xswp	
	lbia	#63
	abnd	
	xswp	
	lbia	#8
	amul	
	popb	
	swqa	
	bspa	#2
	lwpa	
	psha	
	lwia	fs_global_buf
	psha	
	lbib	#2
	call	disk_read
	mdsp	#4
	bspa	#8
	lwpa	
	psha	
	lwia	fs_global_buf
	xswp	
	bspa	#4
	lwpa	
	aadd	
	psha	
	lbia	#8
	psha	
	lbib	#3
	call	memcpy
	mdsp	#6
$7:
	mdsp	#4
	ret 	
inode_write:
	mdsp	#-4
	bspa	#6
	lwpa	
	psha	
	lwia	superblk
	lbib	#0
	aadd	
	lwpa	
	popb	
	ault	
	alng	
	jpz 	$10
	lbia	#5
	psha	
	lbib	#1
	call	panic
	mdsp	#2
$10:
	bspa	#2
	psha	
	lwia	#384
	psha	
	bspa	#10
	lwpa	
	xswp	
	lbia	#6
	ashr	
	popb	
	aadd	
	popb	
	swqa	
	bspa	#0
	psha	
	bspa	#8
	lwpa	
	xswp	
	lbia	#63
	abnd	
	xswp	
	lbia	#8
	amul	
	popb	
	swqa	
	bspa	#2
	lwpa	
	psha	
	lwia	fs_global_buf
	psha	
	lbib	#2
	call	disk_read
	mdsp	#4
	lwia	fs_global_buf
	xswp	
	bspa	#2
	lwpa	
	aadd	
	psha	
	bspa	#10
	lwpa	
	psha	
	lbia	#8
	psha	
	lbib	#3
	call	memcpy
	mdsp	#6
	bspa	#2
	lwpa	
	psha	
	lwia	fs_global_buf
	psha	
	lbib	#2
	call	disk_write
	mdsp	#4
$9:
	mdsp	#4
	ret 	
inode_get:
	mdsp	#-4
	bspa	#2
	xswp	
	lbia	#0
	swqa	
$12:
	bspa	#2
	lwpa	
	xswp	
	lbia	#24
	ault	
	jpnz	$14
	jmp 	$15
$13:
	bspa	#2
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	jmp 	$12
$14:
	lwia	inode_table
	psha	
	bspa	#4
	lwpa	
	lbib	#14
	amul	
	popb	
	aadd	
	lbib	#8
	aadd	
	lwpa	
	xswp	
	bspa	#8
	lwpa	
	aequ	
	jpz 	$17
	lwia	inode_table
	psha	
	bspa	#4
	lwpa	
	lbib	#14
	amul	
	popb	
	aadd	
	lbib	#10
	aadd	
	lbpa	
$17:
	aclv	
	jpz 	$16
	lwia	inode_table
	psha	
	bspa	#4
	lwpa	
	lbib	#14
	amul	
	popb	
	aadd	
	lbib	#10
	aadd	
	psha	
	lbpa	
	inca	
	popb	
	sbqa	
	lwia	inode_table
	psha	
	bspa	#4
	lwpa	
	lbib	#14
	amul	
	popb	
	aadd	
	jmp 	$11
$16:
	jmp 	$13
$15:
	bspa	#0
	psha	
	lbib	#0
	call	inode_alloc
	popb	
	swqa	
	bspa	#0
	lwpa	
	psha	
	bspa	#8
	lwpa	
	psha	
	lbib	#2
	call	inode_load
	mdsp	#4
	bspa	#0
	lwpa	
	lbib	#7
	aadd	
	lbpa	
	alng	
	jpz 	$18
	lbia	#7
	psha	
	lbib	#1
	call	panic
	mdsp	#2
$18:
	bspa	#0
	lwpa	
	lbib	#10
	aadd	
	xswp	
	lbia	#1
	sbqa	
	bspa	#0
	lwpa	
	lbib	#8
	aadd	
	xswp	
	bspa	#8
	lwpa	
	swqa	
	bspa	#0
	lwpa	
	lbib	#11
	aadd	
	psha	
	bspa	#2
	lwpa	
	lbib	#5
	aadd	
	lwpa	
	psha	
	bspa	#4
	lwpa	
	lbib	#13
	aadd	
	psha	
	lbib	#2
	call	balloc_get
	mdsp	#4
	popb	
	swqa	
	bspa	#0
	lwpa	
	lbib	#11
	aadd	
	lwpa	
	xswp	
	lbia	#0
	aequ	
	jpz 	$19
	lbia	#6
	psha	
	lbib	#1
	call	panic
	mdsp	#2
$19:
	bspa	#0
	lwpa	
	jmp 	$11
$11:
	mdsp	#4
	ret 	
inode_put:
	bspa	#2
	lwpa	
	lbib	#10
	aadd	
	psha	
	lbpa	
	deca	
	popb	
	sbqa	
	bspa	#2
	lwpa	
	lbib	#10
	aadd	
	lbpa	
	alng	
	jpz 	$21
	bspa	#2
	lwpa	
	lbib	#11
	aadd	
	lwpa	
	psha	
	lbib	#1
	call	kfree
	mdsp	#2
	bspa	#2
	lwpa	
	psha	
	bspa	#4
	lwpa	
	lbib	#8
	aadd	
	lwpa	
	psha	
	lbib	#2
	call	inode_write
	mdsp	#4
$21:
$20:
	ret 	
inode_put_all:
	mdsp	#-2
	bspa	#0
	xswp	
	lbia	#0
	swqa	
$23:
	bspa	#0
	lwpa	
	xswp	
	lbia	#24
	ault	
	jpnz	$25
	jmp 	$26
$24:
	bspa	#0
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	jmp 	$23
$25:
	lwia	inode_table
	psha	
	bspa	#2
	lwpa	
	lbib	#14
	amul	
	popb	
	aadd	
	psha	
	lbib	#1
	call	inode_put
	mdsp	#2
	jmp 	$24
$26:
$22:
	mdsp	#2
	ret 	
inode_add_blk:
	mdsp	#-4
	bspa	#2
	xswp	
	lbia	#0
	swqa	
	bspa	#0
	psha	
	bspa	#8
	lwpa	
	lbib	#11
	aadd	
	lwpa	
	popb	
	swqa	
$28:
	bspa	#2
	psha	
	lwpa	
	inca	
	popb	
	swqa	
$29:
	bspa	#0
	psha	
	lwpa	
	inca	
	inca	
	popb	
	swqa	
	deca	
	deca	
	lwpa	
	jpnz	$28
$30:
	bspa	#6
	lwpa	
	lbib	#11
	aadd	
	psha	
	bspa	#8
	lwpa	
	lbib	#11
	aadd	
	lwpa	
	psha	
	bspa	#6
	lwpa	
	xswp	
	lbia	#1
	aadd	
	xswp	
	lbia	#1
	ashl	
	psha	
	lbib	#2
	call	krealloc
	mdsp	#4
	popb	
	swqa	
	bspa	#6
	lwpa	
	lbib	#11
	aadd	
	lwpa	
	psha	
	bspa	#4
	lwpa	
	xswp	
	lbia	#1
	asub	
	lbib	#2
	amul	
	popb	
	aadd	
	psha	
	lbib	#0
	call	balloc_alloc
	popb	
	swqa	
	bspa	#6
	lwpa	
	lbib	#11
	aadd	
	lwpa	
	psha	
	bspa	#4
	lwpa	
	lbib	#2
	amul	
	popb	
	aadd	
	xswp	
	lbia	#0
	swqa	
	bspa	#6
	lwpa	
	lbib	#13
	aadd	
	psha	
	lbpa	
	inca	
	popb	
	sbqa	
	bspa	#6
	lwpa	
	lbib	#11
	aadd	
	lwpa	
	psha	
	lbib	#1
	call	balloc_put
	mdsp	#2
$27:
	mdsp	#4
	ret 	
inode_truncate:
	mdsp	#-6
	bspa	#8
	lwpa	
	lbib	#3
	aadd	
	xswp	
	lbia	#0
	swqa	
	bspa	#8
	lwpa	
	lbib	#5
	aadd	
	lwpa	
	psha	
	lbib	#1
	call	balloc_free
	mdsp	#2
	bspa	#8
	lwpa	
	lbib	#5
	aadd	
	psha	
	lbib	#0
	call	balloc_alloc
	popb	
	swqa	
	bspa	#2
	xswp	
	lbia	#0
	aadd	
	psha	
	bspa	#10
	lwpa	
	lbib	#5
	aadd	
	lwpa	
	popb	
	swqa	
	bspa	#2
	xswp	
	lbia	#2
	aadd	
	xswp	
	lbia	#0
	swqa	
	bspa	#2
	psha	
	lbib	#1
	call	balloc_put
	mdsp	#2
	bspa	#8
	lwpa	
	lbib	#11
	aadd	
	lwpa	
	psha	
	lbib	#1
	call	kfree
	mdsp	#2
	bspa	#8
	lwpa	
	lbib	#11
	aadd	
	psha	
	bspa	#10
	lwpa	
	lbib	#5
	aadd	
	lwpa	
	psha	
	bspa	#12
	lwpa	
	lbib	#13
	aadd	
	psha	
	lbib	#2
	call	balloc_get
	mdsp	#4
	popb	
	swqa	
$31:
	mdsp	#6
	ret 	
inode_new:
	mdsp	#-20
	bspa	#18
	xswp	
	lbia	#0
	swqa	
$33:
	bspa	#18
	lwpa	
	psha	
	lwia	superblk
	lbib	#0
	aadd	
	lwpa	
	popb	
	ault	
	jpnz	$35
	jmp 	$36
$34:
	bspa	#18
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	jmp 	$33
$35:
	bspa	#4
	psha	
	bspa	#20
	lwpa	
	psha	
	lbib	#2
	call	inode_load
	mdsp	#4
	bspa	#4
	lbib	#7
	aadd	
	lbpa	
	alng	
	jpz 	$37
	bspa	#4
	lbib	#7
	aadd	
	xswp	
	lbia	#1
	sbqa	
	bspa	#4
	lbib	#0
	aadd	
	xswp	
	lbia	#0
	sbqa	
	bspa	#4
	lbib	#3
	aadd	
	xswp	
	lbia	#0
	swqa	
	bspa	#4
	lbib	#2
	aadd	
	xswp	
	bspa	#26
	lwpa	
	sbqa	
	bspa	#4
	lbib	#1
	aadd	
	psha	
	bspa	#24
	lbpa	
	popb	
	sbqa	
	bspa	#4
	lbib	#5
	aadd	
	psha	
	lbib	#0
	call	balloc_alloc
	popb	
	swqa	
	bspa	#0
	xswp	
	lbia	#0
	aadd	
	psha	
	bspa	#6
	lbib	#5
	aadd	
	lwpa	
	popb	
	swqa	
	bspa	#0
	xswp	
	lbia	#2
	aadd	
	xswp	
	lbia	#0
	swqa	
	bspa	#0
	psha	
	lbib	#1
	call	balloc_put
	mdsp	#2
	bspa	#4
	psha	
	bspa	#20
	lwpa	
	psha	
	lbib	#2
	call	inode_write
	mdsp	#4
	bspa	#18
	lwpa	
	jmp 	$32
$37:
	jmp 	$34
$36:
	lbia	#8
	psha	
	lbib	#1
	call	panic
	mdsp	#2
$32:
	mdsp	#20
	ret 	
inode_delete:
	mdsp	#-14
	bspa	#0
	psha	
	bspa	#18
	lwpa	
	psha	
	lbib	#2
	call	inode_load
	mdsp	#4
	bspa	#0
	lbib	#0
	aadd	
	xswp	
	lbia	#0
	sbqa	
	bspa	#0
	lbib	#3
	aadd	
	xswp	
	lbia	#0
	swqa	
	bspa	#0
	lbib	#7
	aadd	
	xswp	
	lbia	#0
	sbqa	
	bspa	#0
	lbib	#5
	aadd	
	lwpa	
	psha	
	lbib	#1
	call	balloc_free
	mdsp	#2
	bspa	#0
	psha	
	bspa	#18
	lwpa	
	psha	
	lbib	#2
	call	inode_write
	mdsp	#4
$38:
	mdsp	#14
	ret 	
inode_table:
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.db	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.dw	#0
	.db	#0
	.module	SMALLC_GENERATED
file_alloc:
	mdsp	#-2
	bspa	#0
	xswp	
	lbia	#0
	swqa	
$2:
	bspa	#0
	lwpa	
	xswp	
	lbia	#32
	ault	
	jpnz	$4
	jmp 	$5
$3:
	bspa	#0
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	jmp 	$2
$4:
	lwia	file_table
	psha	
	bspa	#2
	lwpa	
	lbib	#8
	amul	
	popb	
	aadd	
	lbib	#0
	aadd	
	lwpa	
	alng	
	jpz 	$6
	lwia	file_table
	psha	
	bspa	#2
	lwpa	
	lbib	#8
	amul	
	popb	
	aadd	
	jmp 	$1
$6:
	jmp 	$3
$5:
	lbia	#9
	psha	
	lbib	#1
	call	panic
	mdsp	#2
$1:
	mdsp	#2
	ret 	
file_get:
	mdsp	#-2
	bspa	#0
	psha	
	lbib	#0
	call	file_alloc
	popb	
	swqa	
	bspa	#0
	lwpa	
	lbib	#7
	aadd	
	xswp	
	lbia	#1
	sbqa	
	bspa	#0
	lwpa	
	lbib	#6
	aadd	
	psha	
	bspa	#6
	lbpa	
	popb	
	sbqa	
	bspa	#0
	lwpa	
	lbib	#4
	aadd	
	xswp	
	lbia	#0
	swqa	
	bspa	#0
	lwpa	
	lbib	#0
	aadd	
	psha	
	bspa	#8
	lwpa	
	psha	
	lbib	#1
	call	inode_get
	mdsp	#2
	popb	
	swqa	
	bspa	#4
	lbpa	
	xswp	
	lbia	#4
	abnd	
	jpz 	$8
	bspa	#0
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	psha	
	lbib	#1
	call	inode_truncate
	mdsp	#2
$8:
	bspa	#4
	lbpa	
	xswp	
	lbia	#8
	abnd	
	jpz 	$9
	bspa	#0
	lwpa	
	lbib	#4
	aadd	
	psha	
	bspa	#2
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	lbib	#3
	aadd	
	lwpa	
	popb	
	swqa	
$9:
	bspa	#0
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	lbib	#11
	aadd	
	lwpa	
	lwpa	
	alng	
	jpz 	$10
	bspa	#0
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	psha	
	lbib	#1
	call	inode_add_blk
	mdsp	#2
$10:
	bspa	#0
	lwpa	
	lbib	#2
	aadd	
	psha	
	bspa	#2
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	lbib	#11
	aadd	
	lwpa	
	lwpa	
	psha	
	lbib	#1
	call	buffer_get
	mdsp	#2
	popb	
	swqa	
	bspa	#0
	lwpa	
	jmp 	$7
$7:
	mdsp	#2
	ret 	
file_put:
	bspa	#2
	lwpa	
	lbib	#7
	aadd	
	psha	
	lbpa	
	deca	
	popb	
	sbqa	
	bspa	#2
	lwpa	
	lbib	#7
	aadd	
	lbpa	
	alng	
	jpz 	$12
	bspa	#2
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	psha	
	lbib	#1
	call	inode_put
	mdsp	#2
	bspa	#2
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	psha	
	lbib	#1
	call	buffer_put
	mdsp	#2
$12:
$11:
	ret 	
file_put_all:
	mdsp	#-2
	bspa	#0
	xswp	
	lbia	#0
	swqa	
$14:
	bspa	#0
	lwpa	
	xswp	
	lbia	#32
	ault	
	jpnz	$16
	jmp 	$17
$15:
	bspa	#0
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	jmp 	$14
$16:
	lwia	file_table
	psha	
	bspa	#2
	lwpa	
	lbib	#8
	amul	
	popb	
	aadd	
	psha	
	lbib	#1
	call	file_put
	mdsp	#2
	jmp 	$15
$17:
$13:
	mdsp	#2
	ret 	
file_set_buf:
	mdsp	#-2
	bspa	#0
	psha	
	bspa	#6
	lwpa	
	lbib	#4
	aadd	
	lwpa	
	xswp	
	lbia	#9
	ashr	
	popb	
	swqa	
$19:
	bspa	#0
	lwpa	
	psha	
	bspa	#6
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	lbib	#13
	aadd	
	lbpa	
	popb	
	ault	
	alng	
	jpz 	$20
	bspa	#4
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	psha	
	lbib	#1
	call	inode_add_blk
	mdsp	#2
	jmp 	$19
$20:
	bspa	#0
	psha	
	bspa	#6
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	lbib	#11
	aadd	
	lwpa	
	psha	
	bspa	#4
	lwpa	
	lbib	#2
	amul	
	popb	
	aadd	
	lwpa	
	popb	
	swqa	
	bspa	#4
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	xswp	
	bspa	#2
	lwpa	
	aneq	
	jpz 	$21
	bspa	#4
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	psha	
	lbib	#1
	call	buffer_put
	mdsp	#2
	bspa	#4
	lwpa	
	lbib	#2
	aadd	
	psha	
	bspa	#2
	lwpa	
	psha	
	lbib	#1
	call	buffer_get
	mdsp	#2
	popb	
	swqa	
$21:
$18:
	mdsp	#2
	ret 	
file_write:
	mdsp	#-2
	bspa	#0
	xswp	
	bspa	#6
	lwpa	
	swqa	
	bspa	#8
	lwpa	
	lbib	#6
	aadd	
	lbpa	
	xswp	
	lbia	#2
	abnd	
	alng	
	jpz 	$23
	lbia	#0
	jmp 	$22
$23:
	bspa	#8
	lwpa	
	psha	
	lbib	#1
	call	file_set_buf
	mdsp	#2
$24:
	bspa	#4
	psha	
	lwpa	
	deca	
	popb	
	swqa	
	inca	
	jpz 	$25
	bspa	#8
	lwpa	
	lbib	#4
	aadd	
	lwpa	
	psha	
	lwia	#511
	popb	
	abnd	
	alng	
	jpz 	$26
	bspa	#8
	lwpa	
	psha	
	lbib	#1
	call	file_set_buf
	mdsp	#2
$26:
	bspa	#8
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	psha	
	bspa	#10
	lwpa	
	lbib	#4
	aadd	
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	psha	
	lwia	#511
	popb	
	abnd	
	popb	
	aadd	
	psha	
	bspa	#8
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	lbpa	
	popb	
	sbqa	
	bspa	#8
	lwpa	
	lbib	#4
	aadd	
	lwpa	
	psha	
	bspa	#10
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	lbib	#3
	aadd	
	lwpa	
	popb	
	aule	
	alng	
	jpz 	$27
	bspa	#8
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	lbib	#3
	aadd	
	psha	
	bspa	#10
	lwpa	
	lbib	#4
	aadd	
	lwpa	
	popb	
	swqa	
$27:
	jmp 	$24
$25:
	bspa	#0
	lwpa	
	jmp 	$22
$22:
	mdsp	#2
	ret 	
file_read:
	mdsp	#-2
	bspa	#0
	xswp	
	bspa	#6
	lwpa	
	swqa	
	bspa	#8
	lwpa	
	lbib	#6
	aadd	
	lbpa	
	xswp	
	lbia	#1
	abnd	
	alng	
	jpz 	$29
	lbia	#0
	jmp 	$28
$29:
	bspa	#8
	lwpa	
	psha	
	lbib	#1
	call	file_set_buf
	mdsp	#2
$30:
	bspa	#4
	psha	
	lwpa	
	deca	
	popb	
	swqa	
	inca	
	jpz 	$31
	bspa	#8
	lwpa	
	lbib	#4
	aadd	
	lwpa	
	psha	
	bspa	#10
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	lbib	#3
	aadd	
	lwpa	
	popb	
	ault	
	alng	
	jpz 	$32
	bspa	#0
	lwpa	
	psha	
	bspa	#6
	lwpa	
	xswp	
	lbia	#1
	aadd	
	popb	
	asub	
	jmp 	$28
$32:
	bspa	#8
	lwpa	
	lbib	#4
	aadd	
	lwpa	
	psha	
	lwia	#511
	popb	
	abnd	
	alng	
	jpz 	$33
	bspa	#8
	lwpa	
	psha	
	lbib	#1
	call	file_set_buf
	mdsp	#2
$33:
	bspa	#6
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	psha	
	bspa	#10
	lwpa	
	lbib	#2
	aadd	
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	psha	
	bspa	#12
	lwpa	
	lbib	#4
	aadd	
	psha	
	lwpa	
	inca	
	popb	
	swqa	
	deca	
	psha	
	lwia	#511
	popb	
	abnd	
	popb	
	aadd	
	lbpa	
	popb	
	sbqa	
	jmp 	$30
$31:
	bspa	#0
	lwpa	
	jmp 	$28
$28:
	mdsp	#2
	ret 	
file_seek:
	lwia	$35
	psha	
	bspa	#4
	lbpa	
	jmp 	cccase
$37:
	bspa	#6
	lwpa	
	lbib	#4
	aadd	
	psha	
	lwpa	
	xswp	
	bspa	#8
	lwpa	
	aadd	
	popb	
	swqa	
	jmp 	$36
$38:
	bspa	#6
	lwpa	
	lbib	#4
	aadd	
	psha	
	bspa	#8
	lwpa	
	lbib	#0
	aadd	
	lwpa	
	lbib	#3
	aadd	
	lwpa	
	xswp	
	bspa	#8
	lwpa	
	aadd	
	popb	
	swqa	
	jmp 	$36
$39:
$40:
	bspa	#6
	lwpa	
	lbib	#4
	aadd	
	xswp	
	bspa	#6
	lwpa	
	swqa	
	jmp 	$36
	jmp 	$36
$35:
	.dw	#2,$37,#3,$38,#1,$39
	.dw	$40,#0
$36:
	bspa	#6
	lwpa	
	lbib	#4
	aadd	
	lwpa	
	jmp 	$34
$34:
	ret 	
file_tell:
	bspa	#2
	lwpa	
	lbib	#4
	aadd	
	lwpa	
	jmp 	$41
$41:
	ret 	
file_table:
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.dw	#0
	.dw	#0
	.dw	#0
	.db	#0
	.db	#0
	.module	SMALLC_GENERATED
fs_init:
	lbib	#0
	call	superblock_read
$1:
	ret 	
fs_close:
	lbib	#0
	call	file_put_all
	lbib	#0
	call	inode_put_all
	lbib	#0
	call	buffer_flush_all
$2:
	ret 	
fs_global_buf:
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
	.db	#0,#0
	.module	SMALLC_GENERATED
panic:
	lwia	$0+#0
	psha	
	bspa	#4
	lbpa	
	psha	
	lbib	#2
	call	printf
	mdsp	#4
$2:
	lbia	#1
	jpz 	$3
	jmp 	$2
$3:
$1:
	ret 	
$0:	.db	#10,#10,#10,#84,#104,#101,#32,#75
	.db	#101,#114,#110,#101,#108,#32,#69,#120
	.db	#112,#101,#114,#105,#101,#110,#99,#101
	.db	#100,#32,#65,#110,#32,#69,#114,#114
	.db	#111,#114,#10,#69,#114,#114,#111,#114
	.db	#32,#67,#111,#100,#101,#58,#32,#37
	.db	#117,#10,#83,#116,#111,#112,#112,#105
	.db	#110,#103,#10,#0
	.module	SMALLC_GENERATED
main:
$1:
	ret 	
_MEM_END:
;	optimizer end
