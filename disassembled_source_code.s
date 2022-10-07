	.file	"factorial_byte_overflow.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"answer (max available value, which factorial avoids byte overflow) = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$2, -20(%rbp)
	movq	$1, -16(%rbp)
	movl	-20(%rbp), %eax
	cltq
	movq	-16(%rbp), %rdx
	imulq	%rdx, %rax
	movq	%rax, -8(%rbp)
	jmp	.L2
.L3:
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	addl	$1, -20(%rbp)
	movl	-20(%rbp), %eax
	cltq
	movq	-16(%rbp), %rdx
	imulq	%rdx, %rax
	movq	%rax, -8(%rbp)
.L2:
	movq	-8(%rbp), %rax
	movl	$0, %edx
	divq	-16(%rbp)
	movq	%rax, %rdx
	movl	-20(%rbp), %eax
	cltq
	cmpq	%rax, %rdx
	je	.L3
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
