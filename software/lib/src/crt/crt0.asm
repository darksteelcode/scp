;	C Runtime 0 for SCP
;	For now, we just call the main function and halt afterwords
;	Edward Wawrzynek

	.module CRT0

	.text
	.align
_start:
	call.j.sp sp _main
	hlt.n.n

	.extern _main

	.module