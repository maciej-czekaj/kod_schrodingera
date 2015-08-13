
kod:     file format elf64-x86-64


Disassembly of section .init:

0000000000400438 <_init>:
  400438:	48 83 ec 08          	sub    $0x8,%rsp
  40043c:	48 8b 05 b5 0b 20 00 	mov    0x200bb5(%rip),%rax        # 600ff8 <_DYNAMIC+0x1d0>
  400443:	48 85 c0             	test   %rax,%rax
  400446:	74 05                	je     40044d <_init+0x15>
  400448:	e8 43 00 00 00       	callq  400490 <__gmon_start__@plt>
  40044d:	48 83 c4 08          	add    $0x8,%rsp
  400451:	c3                   	retq   

Disassembly of section .plt:

0000000000400460 <puts@plt-0x10>:
  400460:	ff 35 a2 0b 20 00    	pushq  0x200ba2(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400466:	ff 25 a4 0b 20 00    	jmpq   *0x200ba4(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40046c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400470 <puts@plt>:
  400470:	ff 25 a2 0b 20 00    	jmpq   *0x200ba2(%rip)        # 601018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400476:	68 00 00 00 00       	pushq  $0x0
  40047b:	e9 e0 ff ff ff       	jmpq   400460 <_init+0x28>

0000000000400480 <__libc_start_main@plt>:
  400480:	ff 25 9a 0b 20 00    	jmpq   *0x200b9a(%rip)        # 601020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400486:	68 01 00 00 00       	pushq  $0x1
  40048b:	e9 d0 ff ff ff       	jmpq   400460 <_init+0x28>

0000000000400490 <__gmon_start__@plt>:
  400490:	ff 25 92 0b 20 00    	jmpq   *0x200b92(%rip)        # 601028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400496:	68 02 00 00 00       	pushq  $0x2
  40049b:	e9 c0 ff ff ff       	jmpq   400460 <_init+0x28>

00000000004004a0 <__printf_chk@plt>:
  4004a0:	ff 25 8a 0b 20 00    	jmpq   *0x200b8a(%rip)        # 601030 <_GLOBAL_OFFSET_TABLE_+0x30>
  4004a6:	68 03 00 00 00       	pushq  $0x3
  4004ab:	e9 b0 ff ff ff       	jmpq   400460 <_init+0x28>

Disassembly of section .text:

00000000004004b0 <main>:
  4004b0:	48 83 ec 08          	sub    $0x8,%rsp
  4004b4:	8b 15 92 0b 20 00    	mov    0x200b92(%rip),%edx        # 60104c <b>
  4004ba:	be aa 08 40 00       	mov    $0x4008aa,%esi
  4004bf:	bf 01 00 00 00       	mov    $0x1,%edi
  4004c4:	31 c0                	xor    %eax,%eax
  4004c6:	e8 d5 ff ff ff       	callq  4004a0 <__printf_chk@plt>
  4004cb:	31 c0                	xor    %eax,%eax
  4004cd:	48 83 c4 08          	add    $0x8,%rsp
  4004d1:	c3                   	retq   

00000000004004d2 <_start>:
  4004d2:	31 ed                	xor    %ebp,%ebp
  4004d4:	49 89 d1             	mov    %rdx,%r9
  4004d7:	5e                   	pop    %rsi
  4004d8:	48 89 e2             	mov    %rsp,%rdx
  4004db:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4004df:	50                   	push   %rax
  4004e0:	54                   	push   %rsp
  4004e1:	49 c7 c0 90 08 40 00 	mov    $0x400890,%r8
  4004e8:	48 c7 c1 20 08 40 00 	mov    $0x400820,%rcx
  4004ef:	48 c7 c7 b0 04 40 00 	mov    $0x4004b0,%rdi
  4004f6:	e8 85 ff ff ff       	callq  400480 <__libc_start_main@plt>
  4004fb:	f4                   	hlt    
  4004fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400500 <deregister_tm_clones>:
  400500:	b8 4f 10 60 00       	mov    $0x60104f,%eax
  400505:	55                   	push   %rbp
  400506:	48 2d 48 10 60 00    	sub    $0x601048,%rax
  40050c:	48 83 f8 0e          	cmp    $0xe,%rax
  400510:	48 89 e5             	mov    %rsp,%rbp
  400513:	77 02                	ja     400517 <deregister_tm_clones+0x17>
  400515:	5d                   	pop    %rbp
  400516:	c3                   	retq   
  400517:	b8 00 00 00 00       	mov    $0x0,%eax
  40051c:	48 85 c0             	test   %rax,%rax
  40051f:	74 f4                	je     400515 <deregister_tm_clones+0x15>
  400521:	5d                   	pop    %rbp
  400522:	bf 48 10 60 00       	mov    $0x601048,%edi
  400527:	ff e0                	jmpq   *%rax
  400529:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400530 <register_tm_clones>:
  400530:	b8 48 10 60 00       	mov    $0x601048,%eax
  400535:	55                   	push   %rbp
  400536:	48 2d 48 10 60 00    	sub    $0x601048,%rax
  40053c:	48 c1 f8 03          	sar    $0x3,%rax
  400540:	48 89 e5             	mov    %rsp,%rbp
  400543:	48 89 c2             	mov    %rax,%rdx
  400546:	48 c1 ea 3f          	shr    $0x3f,%rdx
  40054a:	48 01 d0             	add    %rdx,%rax
  40054d:	48 d1 f8             	sar    %rax
  400550:	75 02                	jne    400554 <register_tm_clones+0x24>
  400552:	5d                   	pop    %rbp
  400553:	c3                   	retq   
  400554:	ba 00 00 00 00       	mov    $0x0,%edx
  400559:	48 85 d2             	test   %rdx,%rdx
  40055c:	74 f4                	je     400552 <register_tm_clones+0x22>
  40055e:	5d                   	pop    %rbp
  40055f:	48 89 c6             	mov    %rax,%rsi
  400562:	bf 48 10 60 00       	mov    $0x601048,%edi
  400567:	ff e2                	jmpq   *%rdx
  400569:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400570 <__do_global_dtors_aux>:
  400570:	80 3d d1 0a 20 00 00 	cmpb   $0x0,0x200ad1(%rip)        # 601048 <__TMC_END__>
  400577:	75 11                	jne    40058a <__do_global_dtors_aux+0x1a>
  400579:	55                   	push   %rbp
  40057a:	48 89 e5             	mov    %rsp,%rbp
  40057d:	e8 7e ff ff ff       	callq  400500 <deregister_tm_clones>
  400582:	5d                   	pop    %rbp
  400583:	c6 05 be 0a 20 00 01 	movb   $0x1,0x200abe(%rip)        # 601048 <__TMC_END__>
  40058a:	f3 c3                	repz retq 
  40058c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400590 <frame_dummy>:
  400590:	48 83 3d 88 08 20 00 	cmpq   $0x0,0x200888(%rip)        # 600e20 <__JCR_END__>
  400597:	00 
  400598:	74 1e                	je     4005b8 <frame_dummy+0x28>
  40059a:	b8 00 00 00 00       	mov    $0x0,%eax
  40059f:	48 85 c0             	test   %rax,%rax
  4005a2:	74 14                	je     4005b8 <frame_dummy+0x28>
  4005a4:	55                   	push   %rbp
  4005a5:	bf 20 0e 60 00       	mov    $0x600e20,%edi
  4005aa:	48 89 e5             	mov    %rsp,%rbp
  4005ad:	ff d0                	callq  *%rax
  4005af:	5d                   	pop    %rbp
  4005b0:	e9 7b ff ff ff       	jmpq   400530 <register_tm_clones>
  4005b5:	0f 1f 00             	nopl   (%rax)
  4005b8:	e9 73 ff ff ff       	jmpq   400530 <register_tm_clones>
  4005bd:	0f 1f 00             	nopl   (%rax)

00000000004005c0 <code_1a>:
  4005c0:	48 83 ec 08          	sub    $0x8,%rsp
  4005c4:	be a4 08 40 00       	mov    $0x4008a4,%esi
  4005c9:	bf 01 00 00 00       	mov    $0x1,%edi
  4005ce:	31 c0                	xor    %eax,%eax
  4005d0:	e8 cb fe ff ff       	callq  4004a0 <__printf_chk@plt>
  4005d5:	bf 04 00 00 00       	mov    $0x4,%edi
  4005da:	e8 01 02 00 00       	callq  4007e0 <use>
  4005df:	bf 05 00 00 00       	mov    $0x5,%edi
  4005e4:	48 83 c4 08          	add    $0x8,%rsp
  4005e8:	e9 f3 01 00 00       	jmpq   4007e0 <use>
  4005ed:	0f 1f 00             	nopl   (%rax)

00000000004005f0 <code_1b>:
  4005f0:	48 83 ec 18          	sub    $0x18,%rsp
  4005f4:	be a4 08 40 00       	mov    $0x4008a4,%esi
  4005f9:	bf 01 00 00 00       	mov    $0x1,%edi
  4005fe:	31 c0                	xor    %eax,%eax
  400600:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%rsp)
  400607:	00 
  400608:	e8 93 fe ff ff       	callq  4004a0 <__printf_chk@plt>
  40060d:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
  400612:	c7 44 24 0c 04 00 00 	movl   $0x4,0xc(%rsp)
  400619:	00 
  40061a:	e8 d1 01 00 00       	callq  4007f0 <escape>
  40061f:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  400623:	8d 78 01             	lea    0x1(%rax),%edi
  400626:	e8 b5 01 00 00       	callq  4007e0 <use>
  40062b:	48 83 c4 18          	add    $0x18,%rsp
  40062f:	c3                   	retq   

0000000000400630 <code_1c>:
  400630:	48 83 ec 08          	sub    $0x8,%rsp
  400634:	be a4 08 40 00       	mov    $0x4008a4,%esi
  400639:	bf 01 00 00 00       	mov    $0x1,%edi
  40063e:	31 c0                	xor    %eax,%eax
  400640:	c7 05 06 0a 20 00 01 	movl   $0x1,0x200a06(%rip)        # 601050 <a>
  400647:	00 00 00 
  40064a:	c7 05 f8 09 20 00 03 	movl   $0x3,0x2009f8(%rip)        # 60104c <b>
  400651:	00 00 00 
  400654:	e8 47 fe ff ff       	callq  4004a0 <__printf_chk@plt>
  400659:	8b 05 ed 09 20 00    	mov    0x2009ed(%rip),%eax        # 60104c <b>
  40065f:	8d 78 01             	lea    0x1(%rax),%edi
  400662:	89 3d e8 09 20 00    	mov    %edi,0x2009e8(%rip)        # 601050 <a>
  400668:	e8 73 01 00 00       	callq  4007e0 <use>
  40066d:	8b 05 dd 09 20 00    	mov    0x2009dd(%rip),%eax        # 601050 <a>
  400673:	8d 78 01             	lea    0x1(%rax),%edi
  400676:	89 3d d0 09 20 00    	mov    %edi,0x2009d0(%rip)        # 60104c <b>
  40067c:	48 83 c4 08          	add    $0x8,%rsp
  400680:	e9 5b 01 00 00       	jmpq   4007e0 <use>
  400685:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
  40068c:	00 00 00 00 

0000000000400690 <code_1d>:
  400690:	53                   	push   %rbx
  400691:	c7 05 b1 09 20 00 03 	movl   $0x3,0x2009b1(%rip)        # 60104c <b>
  400698:	00 00 00 
  40069b:	8b 1d ab 09 20 00    	mov    0x2009ab(%rip),%ebx        # 60104c <b>
  4006a1:	8d 7b 01             	lea    0x1(%rbx),%edi
  4006a4:	e8 37 01 00 00       	callq  4007e0 <use>
  4006a9:	8d 7b 02             	lea    0x2(%rbx),%edi
  4006ac:	5b                   	pop    %rbx
  4006ad:	89 3d 99 09 20 00    	mov    %edi,0x200999(%rip)        # 60104c <b>
  4006b3:	e9 28 01 00 00       	jmpq   4007e0 <use>
  4006b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4006bf:	00 

00000000004006c0 <code_2a>:
  4006c0:	85 f6                	test   %esi,%esi
  4006c2:	89 f0                	mov    %esi,%eax
  4006c4:	7e 0a                	jle    4006d0 <code_2a+0x10>
  4006c6:	8d 14 36             	lea    (%rsi,%rsi,1),%edx
  4006c9:	85 ff                	test   %edi,%edi
  4006cb:	0f 45 c2             	cmovne %edx,%eax
  4006ce:	c3                   	retq   
  4006cf:	90                   	nop
  4006d0:	31 c0                	xor    %eax,%eax
  4006d2:	c3                   	retq   
  4006d3:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  4006da:	84 00 00 00 00 00 

00000000004006e0 <code_2c>:
  4006e0:	41 54                	push   %r12
  4006e2:	41 89 f4             	mov    %esi,%r12d
  4006e5:	55                   	push   %rbp
  4006e6:	53                   	push   %rbx
  4006e7:	31 db                	xor    %ebx,%ebx
  4006e9:	48 83 ec 10          	sub    $0x10,%rsp
  4006ed:	85 f6                	test   %esi,%esi
  4006ef:	89 7c 24 0c          	mov    %edi,0xc(%rsp)
  4006f3:	7e 2b                	jle    400720 <code_2c+0x40>
  4006f5:	31 ed                	xor    %ebp,%ebp
  4006f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4006fe:	00 00 
  400700:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
  400705:	e8 e6 00 00 00       	callq  4007f0 <escape>
  40070a:	8d 43 02             	lea    0x2(%rbx),%eax
  40070d:	83 c3 01             	add    $0x1,%ebx
  400710:	f6 44 24 0c 01       	testb  $0x1,0xc(%rsp)
  400715:	0f 44 d8             	cmove  %eax,%ebx
  400718:	83 c5 01             	add    $0x1,%ebp
  40071b:	44 39 e5             	cmp    %r12d,%ebp
  40071e:	75 e0                	jne    400700 <code_2c+0x20>
  400720:	48 83 c4 10          	add    $0x10,%rsp
  400724:	89 d8                	mov    %ebx,%eax
  400726:	5b                   	pop    %rbx
  400727:	5d                   	pop    %rbp
  400728:	41 5c                	pop    %r12
  40072a:	c3                   	retq   
  40072b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400730 <code_3a>:
  400730:	85 d2                	test   %edx,%edx
  400732:	7e 19                	jle    40074d <code_3a+0x1d>
  400734:	8d 42 ff             	lea    -0x1(%rdx),%eax
  400737:	48 8d 54 87 04       	lea    0x4(%rdi,%rax,4),%rdx
  40073c:	0f 1f 40 00          	nopl   0x0(%rax)
  400740:	8b 06                	mov    (%rsi),%eax
  400742:	01 07                	add    %eax,(%rdi)
  400744:	48 83 c7 04          	add    $0x4,%rdi
  400748:	48 39 d7             	cmp    %rdx,%rdi
  40074b:	75 f3                	jne    400740 <code_3a+0x10>
  40074d:	31 c0                	xor    %eax,%eax
  40074f:	c3                   	retq   

0000000000400750 <code_3b>:
  400750:	85 d2                	test   %edx,%edx
  400752:	8b 06                	mov    (%rsi),%eax
  400754:	7e 15                	jle    40076b <code_3b+0x1b>
  400756:	83 ea 01             	sub    $0x1,%edx
  400759:	48 8d 54 97 04       	lea    0x4(%rdi,%rdx,4),%rdx
  40075e:	66 90                	xchg   %ax,%ax
  400760:	01 07                	add    %eax,(%rdi)
  400762:	48 83 c7 04          	add    $0x4,%rdi
  400766:	48 39 d7             	cmp    %rdx,%rdi
  400769:	75 f5                	jne    400760 <code_3b+0x10>
  40076b:	31 c0                	xor    %eax,%eax
  40076d:	c3                   	retq   
  40076e:	66 90                	xchg   %ax,%ax

0000000000400770 <code_3c>:
  400770:	85 d2                	test   %edx,%edx
  400772:	7e 17                	jle    40078b <code_3c+0x1b>
  400774:	8d 42 ff             	lea    -0x1(%rdx),%eax
  400777:	8b 0e                	mov    (%rsi),%ecx
  400779:	48 8d 44 87 04       	lea    0x4(%rdi,%rax,4),%rax
  40077e:	66 90                	xchg   %ax,%ax
  400780:	01 0f                	add    %ecx,(%rdi)
  400782:	48 83 c7 04          	add    $0x4,%rdi
  400786:	48 39 c7             	cmp    %rax,%rdi
  400789:	75 f5                	jne    400780 <code_3c+0x10>
  40078b:	31 c0                	xor    %eax,%eax
  40078d:	c3                   	retq   
  40078e:	66 90                	xchg   %ax,%ax

0000000000400790 <code_3d>:
  400790:	41 54                	push   %r12
  400792:	41 89 d4             	mov    %edx,%r12d
  400795:	55                   	push   %rbp
  400796:	48 89 f5             	mov    %rsi,%rbp
  400799:	53                   	push   %rbx
  40079a:	48 89 fb             	mov    %rdi,%rbx
  40079d:	48 89 f7             	mov    %rsi,%rdi
  4007a0:	e8 4b 00 00 00       	callq  4007f0 <escape>
  4007a5:	45 85 e4             	test   %r12d,%r12d
  4007a8:	7e 21                	jle    4007cb <code_3d+0x3b>
  4007aa:	41 8d 44 24 ff       	lea    -0x1(%r12),%eax
  4007af:	4c 8d 64 83 04       	lea    0x4(%rbx,%rax,4),%r12
  4007b4:	0f 1f 40 00          	nopl   0x0(%rax)
  4007b8:	e8 53 00 00 00       	callq  400810 <side_effect>
  4007bd:	8b 45 00             	mov    0x0(%rbp),%eax
  4007c0:	01 03                	add    %eax,(%rbx)
  4007c2:	48 83 c3 04          	add    $0x4,%rbx
  4007c6:	4c 39 e3             	cmp    %r12,%rbx
  4007c9:	75 ed                	jne    4007b8 <code_3d+0x28>
  4007cb:	5b                   	pop    %rbx
  4007cc:	5d                   	pop    %rbp
  4007cd:	31 c0                	xor    %eax,%eax
  4007cf:	41 5c                	pop    %r12
  4007d1:	c3                   	retq   
  4007d2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4007d9:	00 00 00 
  4007dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004007e0 <use>:
  4007e0:	c3                   	retq   
  4007e1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  4007e8:	0f 1f 84 00 00 00 00 
  4007ef:	00 

00000000004007f0 <escape>:
  4007f0:	8b 17                	mov    (%rdi),%edx
  4007f2:	be b2 08 40 00       	mov    $0x4008b2,%esi
  4007f7:	bf 01 00 00 00       	mov    $0x1,%edi
  4007fc:	31 c0                	xor    %eax,%eax
  4007fe:	e9 9d fc ff ff       	jmpq   4004a0 <__printf_chk@plt>
  400803:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  40080a:	84 00 00 00 00 00 

0000000000400810 <side_effect>:
  400810:	bf a4 08 40 00       	mov    $0x4008a4,%edi
  400815:	e9 56 fc ff ff       	jmpq   400470 <puts@plt>
  40081a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400820 <__libc_csu_init>:
  400820:	41 57                	push   %r15
  400822:	41 89 ff             	mov    %edi,%r15d
  400825:	41 56                	push   %r14
  400827:	49 89 f6             	mov    %rsi,%r14
  40082a:	41 55                	push   %r13
  40082c:	49 89 d5             	mov    %rdx,%r13
  40082f:	41 54                	push   %r12
  400831:	4c 8d 25 d8 05 20 00 	lea    0x2005d8(%rip),%r12        # 600e10 <__frame_dummy_init_array_entry>
  400838:	55                   	push   %rbp
  400839:	48 8d 2d d8 05 20 00 	lea    0x2005d8(%rip),%rbp        # 600e18 <__init_array_end>
  400840:	53                   	push   %rbx
  400841:	4c 29 e5             	sub    %r12,%rbp
  400844:	31 db                	xor    %ebx,%ebx
  400846:	48 c1 fd 03          	sar    $0x3,%rbp
  40084a:	48 83 ec 08          	sub    $0x8,%rsp
  40084e:	e8 e5 fb ff ff       	callq  400438 <_init>
  400853:	48 85 ed             	test   %rbp,%rbp
  400856:	74 1e                	je     400876 <__libc_csu_init+0x56>
  400858:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40085f:	00 
  400860:	4c 89 ea             	mov    %r13,%rdx
  400863:	4c 89 f6             	mov    %r14,%rsi
  400866:	44 89 ff             	mov    %r15d,%edi
  400869:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40086d:	48 83 c3 01          	add    $0x1,%rbx
  400871:	48 39 eb             	cmp    %rbp,%rbx
  400874:	75 ea                	jne    400860 <__libc_csu_init+0x40>
  400876:	48 83 c4 08          	add    $0x8,%rsp
  40087a:	5b                   	pop    %rbx
  40087b:	5d                   	pop    %rbp
  40087c:	41 5c                	pop    %r12
  40087e:	41 5d                	pop    %r13
  400880:	41 5e                	pop    %r14
  400882:	41 5f                	pop    %r15
  400884:	c3                   	retq   
  400885:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
  40088c:	00 00 00 00 

0000000000400890 <__libc_csu_fini>:
  400890:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400894 <_fini>:
  400894:	48 83 ec 08          	sub    $0x8,%rsp
  400898:	48 83 c4 08          	add    $0x8,%rsp
  40089c:	c3                   	retq   
