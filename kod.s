	.file	"kod.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Hello"
	.text
	.p2align 4,,15
	.globl	code_1a
	.type	code_1a, @function
code_1a:
.LFB39:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$.LC0, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	$4, %edi
	call	use
	movl	$5, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	use
	.cfi_endproc
.LFE39:
	.size	code_1a, .-code_1a
	.p2align 4,,15
	.globl	code_1b
	.type	code_1b, @function
code_1b:
.LFB40:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC0, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$1, (%rsp)
	call	__printf_chk
	movq	%rsp, %rdi
	movl	$4, (%rsp)
	call	escape
	movl	(%rsp), %eax
	leal	1(%rax), %edi
	call	use
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	code_1b, .-code_1b
	.p2align 4,,15
	.globl	code_1c
	.type	code_1c, @function
code_1c:
.LFB41:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$.LC0, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$1, a(%rip)
	movl	$3, b(%rip)
	call	__printf_chk
	movl	b(%rip), %eax
	leal	1(%rax), %edi
	movl	%edi, a(%rip)
	call	use
	movl	a(%rip), %eax
	leal	1(%rax), %edi
	movl	%edi, b(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	use
	.cfi_endproc
.LFE41:
	.size	code_1c, .-code_1c
	.p2align 4,,15
	.globl	code_1d
	.type	code_1d, @function
code_1d:
.LFB42:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$3, b(%rip)
	movl	b(%rip), %ebx
	leal	1(%rbx), %edi
	call	use
	leal	2(%rbx), %edi
	popq	%rbx
	.cfi_def_cfa_offset 8
	movl	%edi, b(%rip)
	jmp	use
	.cfi_endproc
.LFE42:
	.size	code_1d, .-code_1d
	.p2align 4,,15
	.globl	code_2a
	.type	code_2a, @function
code_2a:
.LFB43:
	.cfi_startproc
	testl	%esi, %esi
	movl	%esi, %eax
	jle	.L12
	leal	(%rsi,%rsi), %edx
	testl	%edi, %edi
	cmovne	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE43:
	.size	code_2a, .-code_2a
	.p2align 4,,15
	.globl	code_2c
	.type	code_2c, @function
code_2c:
.LFB44:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebx, %ebx
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	testl	%esi, %esi
	movl	%edi, 12(%rsp)
	jle	.L18
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L21:
	leaq	12(%rsp), %rdi
	call	escape
	leal	2(%rbx), %eax
	addl	$1, %ebx
	testb	$1, 12(%rsp)
	cmove	%eax, %ebx
	addl	$1, %ebp
	cmpl	%r12d, %ebp
	jne	.L21
.L18:
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE44:
	.size	code_2c, .-code_2c
	.p2align 4,,15
	.globl	code_3a
	.type	code_3a, @function
code_3a:
.LFB45:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L37
	movslq	%edx, %rax
	leaq	(%rdi,%rax,4), %rax
	cmpq	%rax, %rsi
	leaq	4(%rsi), %rax
	setnb	%cl
	cmpq	%rax, %rdi
	setnb	%al
	orb	%al, %cl
	je	.L26
	cmpl	$6, %edx
	jbe	.L26
	movl	%edx, %r9d
	movq	%rdi, %rax
	xorl	%ecx, %ecx
	shrl	$2, %r9d
	leal	0(,%r9,4), %r8d
.L32:
	movd	(%rsi), %xmm2
	addl	$1, %ecx
	addq	$16, %rax
	movdqu	-16(%rax), %xmm1
	pshufd	$0, %xmm2, %xmm0
	paddd	%xmm1, %xmm0
	movdqu	%xmm0, -16(%rax)
	cmpl	%r9d, %ecx
	jb	.L32
	cmpl	%r8d, %edx
	je	.L37
	movslq	%r8d, %rax
	movl	(%rsi), %ecx
	addl	%ecx, (%rdi,%rax,4)
	leal	1(%r8), %eax
	cmpl	%eax, %edx
	jle	.L37
	cltq
	addl	$2, %r8d
	movl	(%rsi), %ecx
	addl	%ecx, (%rdi,%rax,4)
	cmpl	%r8d, %edx
	jle	.L37
	movslq	%r8d, %r8
	movl	(%rsi), %eax
	addl	%eax, (%rdi,%r8,4)
.L37:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	leal	-1(%rdx), %eax
	leaq	4(%rdi,%rax,4), %rdx
	.p2align 4,,10
	.p2align 3
.L34:
	movl	(%rsi), %eax
	addl	%eax, (%rdi)
	addq	$4, %rdi
	cmpq	%rdx, %rdi
	jne	.L34
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE45:
	.size	code_3a, .-code_3a
	.p2align 4,,15
	.globl	code_3b
	.type	code_3b, @function
code_3b:
.LFB46:
	.cfi_startproc
	testl	%edx, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	(%rsi), %eax
	jle	.L62
	movq	%rdi, %rcx
	movl	%edx, %esi
	andl	$15, %ecx
	shrq	$2, %rcx
	negq	%rcx
	andl	$3, %ecx
	cmpl	%edx, %ecx
	cmova	%edx, %ecx
	cmpl	$4, %edx
	ja	.L67
.L45:
	addl	%eax, (%rdi)
	cmpl	$1, %esi
	movl	$1, %ecx
	jbe	.L47
	addl	%eax, 4(%rdi)
	cmpl	$2, %esi
	movb	$2, %cl
	jbe	.L47
	addl	%eax, 8(%rdi)
	cmpl	$3, %esi
	movb	$3, %cl
	jbe	.L47
	addl	%eax, 12(%rdi)
	movb	$4, %cl
.L47:
	cmpl	%esi, %edx
	je	.L62
.L46:
	movl	%edx, %ebx
	movl	%esi, %r8d
	subl	%esi, %ebx
	movl	%ebx, %r10d
	shrl	$2, %r10d
	leal	0(,%r10,4), %r11d
	testl	%r11d, %r11d
	je	.L49
	movl	%eax, -4(%rsp)
	leaq	(%rdi,%r8,4), %r9
	xorl	%esi, %esi
	movd	-4(%rsp), %xmm2
	xorl	%r8d, %r8d
	pshufd	$0, %xmm2, %xmm1
.L55:
	movdqa	(%r9,%rsi), %xmm0
	addl	$1, %r8d
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, (%r9,%rsi)
	addq	$16, %rsi
	cmpl	%r8d, %r10d
	ja	.L55
	addl	%r11d, %ecx
	cmpl	%r11d, %ebx
	je	.L62
.L49:
	movslq	%ecx, %rsi
	addl	%eax, (%rdi,%rsi,4)
	leal	1(%rcx), %esi
	cmpl	%esi, %edx
	jle	.L62
	movslq	%esi, %rsi
	addl	$2, %ecx
	addl	%eax, (%rdi,%rsi,4)
	cmpl	%ecx, %edx
	jle	.L62
	movslq	%ecx, %rcx
	addl	%eax, (%rdi,%rcx,4)
.L62:
	xorl	%eax, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L67:
	.cfi_restore_state
	testl	%ecx, %ecx
	jne	.L68
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	jmp	.L46
.L68:
	movl	%ecx, %esi
	.p2align 4,,3
	jmp	.L45
	.cfi_endproc
.LFE46:
	.size	code_3b, .-code_3b
	.p2align 4,,15
	.globl	code_3c
	.type	code_3c, @function
code_3c:
.LFB47:
	.cfi_startproc
	testl	%edx, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	jle	.L88
	movq	%rdi, %rcx
	movl	(%rsi), %eax
	movl	%edx, %esi
	andl	$15, %ecx
	shrq	$2, %rcx
	negq	%rcx
	andl	$3, %ecx
	cmpl	%edx, %ecx
	cmova	%edx, %ecx
	cmpl	$4, %edx
	ja	.L93
.L71:
	addl	%eax, (%rdi)
	cmpl	$1, %esi
	movl	$1, %ecx
	jbe	.L73
	addl	%eax, 4(%rdi)
	cmpl	$2, %esi
	movb	$2, %cl
	jbe	.L73
	addl	%eax, 8(%rdi)
	cmpl	$3, %esi
	movb	$3, %cl
	jbe	.L73
	addl	%eax, 12(%rdi)
	movb	$4, %cl
.L73:
	cmpl	%esi, %edx
	je	.L88
.L72:
	movl	%edx, %ebx
	movl	%esi, %r8d
	subl	%esi, %ebx
	movl	%ebx, %r10d
	shrl	$2, %r10d
	leal	0(,%r10,4), %r11d
	testl	%r11d, %r11d
	je	.L75
	movl	%eax, -4(%rsp)
	leaq	(%rdi,%r8,4), %r9
	xorl	%esi, %esi
	movd	-4(%rsp), %xmm2
	xorl	%r8d, %r8d
	pshufd	$0, %xmm2, %xmm1
.L81:
	movdqa	(%r9,%rsi), %xmm0
	addl	$1, %r8d
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, (%r9,%rsi)
	addq	$16, %rsi
	cmpl	%r8d, %r10d
	ja	.L81
	addl	%r11d, %ecx
	cmpl	%r11d, %ebx
	je	.L88
.L75:
	movslq	%ecx, %rsi
	addl	%eax, (%rdi,%rsi,4)
	leal	1(%rcx), %esi
	cmpl	%esi, %edx
	jle	.L88
	movslq	%esi, %rsi
	addl	$2, %ecx
	addl	%eax, (%rdi,%rsi,4)
	cmpl	%ecx, %edx
	jle	.L88
	movslq	%ecx, %rcx
	addl	%eax, (%rdi,%rcx,4)
.L88:
	xorl	%eax, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L93:
	.cfi_restore_state
	testl	%ecx, %ecx
	jne	.L94
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	jmp	.L72
.L94:
	movl	%ecx, %esi
	.p2align 4,,3
	jmp	.L71
	.cfi_endproc
.LFE47:
	.size	code_3c, .-code_3c
	.p2align 4,,15
	.globl	code_3d
	.type	code_3d, @function
code_3d:
.LFB48:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	call	escape
	testl	%r12d, %r12d
	jle	.L99
	leal	-1(%r12), %eax
	leaq	4(%rbx,%rax,4), %r12
	.p2align 4,,10
	.p2align 3
.L98:
	call	side_effect
	movl	0(%rbp), %eax
	addl	%eax, (%rbx)
	addq	$4, %rbx
	cmpq	%r12, %rbx
	jne	.L98
.L99:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE48:
	.size	code_3d, .-code_3d
	.section	.rodata.str1.1
.LC1:
	.string	"b = %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB49:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	b(%rip), %edx
	movl	$.LC1, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE49:
	.size	main, .-main
	.comm	b,4,4
	.comm	a,4,4
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
