;	C Runtime 0 for SCP
;	For now, we just call the main function and halt afterwords
;	Edward Wawrzynek

	.module CRT0

	.text
	.align
_START:
	.global _START
	call.j.sp sp __init_stdio
	call.j.sp sp _main
;	Call exit (load return value into ra)
	mov.r.r ra re
	call.j.sp sp _exit
	hlt.n.n
	.extern _main
	.extern _exit
	.extern __init_stdio

	.module
