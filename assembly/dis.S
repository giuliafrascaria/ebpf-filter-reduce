
iov_iter.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <iov_iter_init>:
       0:	55                   	push   %rbp
       1:	f7 c6 fe ff ff ff    	test   $0xfffffffe,%esi
       7:	48 89 e5             	mov    %rsp,%rbp
       a:	75 3c                	jne    48 <iov_iter_init+0x48>
       c:	83 e6 01             	and    $0x1,%esi
       f:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
      16:	00 00 
      18:	48 83 b8 50 13 00 00 	cmpq   $0xffffffffffffffff,0x1350(%rax)
      1f:	ff 
      20:	74 1b                	je     3d <iov_iter_init+0x3d>
      22:	83 ce 04             	or     $0x4,%esi
      25:	48 89 57 18          	mov    %rdx,0x18(%rdi)
      29:	89 37                	mov    %esi,(%rdi)
      2b:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
      2f:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
      36:	00 
      37:	4c 89 47 10          	mov    %r8,0x10(%rdi)
      3b:	5d                   	pop    %rbp
      3c:	c3                   	retq   
      3d:	83 ce 08             	or     $0x8,%esi
      40:	48 89 57 18          	mov    %rdx,0x18(%rdi)
      44:	89 37                	mov    %esi,(%rdi)
      46:	eb e3                	jmp    2b <iov_iter_init+0x2b>
      48:	0f 0b                	ud2    
      4a:	eb c0                	jmp    c <iov_iter_init+0xc>
      4c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000050 <iov_iter_kvec>:
      50:	55                   	push   %rbp
      51:	f7 c6 fe ff ff ff    	test   $0xfffffffe,%esi
      57:	48 89 e5             	mov    %rsp,%rbp
      5a:	75 1e                	jne    7a <iov_iter_kvec+0x2a>
      5c:	83 e6 01             	and    $0x1,%esi
      5f:	48 89 57 18          	mov    %rdx,0x18(%rdi)
      63:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
      67:	83 ce 08             	or     $0x8,%esi
      6a:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
      71:	00 
      72:	4c 89 47 10          	mov    %r8,0x10(%rdi)
      76:	89 37                	mov    %esi,(%rdi)
      78:	5d                   	pop    %rbp
      79:	c3                   	retq   
      7a:	0f 0b                	ud2    
      7c:	eb de                	jmp    5c <iov_iter_kvec+0xc>
      7e:	66 90                	xchg   %ax,%ax

0000000000000080 <iov_iter_bvec>:
      80:	55                   	push   %rbp
      81:	f7 c6 fe ff ff ff    	test   $0xfffffffe,%esi
      87:	48 89 e5             	mov    %rsp,%rbp
      8a:	75 1e                	jne    aa <iov_iter_bvec+0x2a>
      8c:	83 e6 01             	and    $0x1,%esi
      8f:	48 89 57 18          	mov    %rdx,0x18(%rdi)
      93:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
      97:	83 ce 10             	or     $0x10,%esi
      9a:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
      a1:	00 
      a2:	4c 89 47 10          	mov    %r8,0x10(%rdi)
      a6:	89 37                	mov    %esi,(%rdi)
      a8:	5d                   	pop    %rbp
      a9:	c3                   	retq   
      aa:	0f 0b                	ud2    
      ac:	eb de                	jmp    8c <iov_iter_bvec+0xc>
      ae:	66 90                	xchg   %ax,%ax

00000000000000b0 <sanity>:
      b0:	55                   	push   %rbp
      b1:	48 89 e5             	mov    %rsp,%rbp
      b4:	41 55                	push   %r13
      b6:	41 54                	push   %r12
      b8:	53                   	push   %rbx
      b9:	48 8b 57 08          	mov    0x8(%rdi),%rdx
      bd:	48 8b 5f 18          	mov    0x18(%rdi),%rbx
      c1:	8b 77 20             	mov    0x20(%rdi),%esi
      c4:	48 85 d2             	test   %rdx,%rdx
      c7:	44 8b 63 50          	mov    0x50(%rbx),%r12d
      cb:	44 8b 6b 54          	mov    0x54(%rbx),%r13d
      cf:	74 3a                	je     10b <sanity+0x5b>
      d1:	45 39 ec             	cmp    %r13d,%r12d
      d4:	74 3a                	je     110 <sanity+0x60>
      d6:	41 8d 4c 24 ff       	lea    -0x1(%r12),%ecx
      db:	39 f1                	cmp    %esi,%ecx
      dd:	75 31                	jne    110 <sanity+0x60>
      df:	8b 43 5c             	mov    0x5c(%rbx),%eax
      e2:	83 e8 01             	sub    $0x1,%eax
      e5:	21 c8                	and    %ecx,%eax
      e7:	48 8b 8b 90 00 00 00 	mov    0x90(%rbx),%rcx
      ee:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
      f2:	8b 44 f9 08          	mov    0x8(%rcx,%rdi,8),%eax
      f6:	03 44 f9 0c          	add    0xc(%rcx,%rdi,8),%eax
      fa:	48 39 c2             	cmp    %rax,%rdx
      fd:	75 11                	jne    110 <sanity+0x60>
      ff:	5b                   	pop    %rbx
     100:	b8 01 00 00 00       	mov    $0x1,%eax
     105:	41 5c                	pop    %r12
     107:	41 5d                	pop    %r13
     109:	5d                   	pop    %rbp
     10a:	c3                   	retq   
     10b:	41 39 f4             	cmp    %esi,%r12d
     10e:	74 ef                	je     ff <sanity+0x4f>
     110:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
     117:	e8 00 00 00 00       	callq  11c <sanity+0x6c>
     11c:	8b 4b 5c             	mov    0x5c(%rbx),%ecx
     11f:	44 89 ea             	mov    %r13d,%edx
     122:	44 89 e6             	mov    %r12d,%esi
     125:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
     12c:	e8 00 00 00 00       	callq  131 <sanity+0x81>
     131:	8b 43 5c             	mov    0x5c(%rbx),%eax
     134:	85 c0                	test   %eax,%eax
     136:	75 0b                	jne    143 <sanity+0x93>
     138:	0f 0b                	ud2    
     13a:	31 c0                	xor    %eax,%eax
     13c:	5b                   	pop    %rbx
     13d:	41 5c                	pop    %r12
     13f:	41 5d                	pop    %r13
     141:	5d                   	pop    %rbp
     142:	c3                   	retq   
     143:	45 31 ed             	xor    %r13d,%r13d
     146:	49 c7 c4 00 00 00 00 	mov    $0x0,%r12
     14d:	44 89 e8             	mov    %r13d,%eax
     150:	4c 89 e7             	mov    %r12,%rdi
     153:	41 83 c5 01          	add    $0x1,%r13d
     157:	48 6b c0 28          	imul   $0x28,%rax,%rax
     15b:	48 03 83 90 00 00 00 	add    0x90(%rbx),%rax
     162:	8b 48 08             	mov    0x8(%rax),%ecx
     165:	48 8b 70 10          	mov    0x10(%rax),%rsi
     169:	44 8b 40 0c          	mov    0xc(%rax),%r8d
     16d:	48 8b 10             	mov    (%rax),%rdx
     170:	e8 00 00 00 00       	callq  175 <sanity+0xc5>
     175:	44 39 6b 5c          	cmp    %r13d,0x5c(%rbx)
     179:	76 bd                	jbe    138 <sanity+0x88>
     17b:	eb d0                	jmp    14d <sanity+0x9d>
     17d:	0f 1f 00             	nopl   (%rax)

0000000000000180 <copy_page_to_iter_pipe>:
     180:	55                   	push   %rbp
     181:	48 89 e5             	mov    %rsp,%rbp
     184:	41 57                	push   %r15
     186:	41 56                	push   %r14
     188:	41 55                	push   %r13
     18a:	41 54                	push   %r12
     18c:	53                   	push   %rbx
     18d:	48 83 ec 18          	sub    $0x18,%rsp
     191:	4c 8b 61 18          	mov    0x18(%rcx),%r12
     195:	48 39 51 10          	cmp    %rdx,0x10(%rcx)
     199:	48 0f 46 51 10       	cmovbe 0x10(%rcx),%rdx
     19e:	44 8b 79 20          	mov    0x20(%rcx),%r15d
     1a2:	41 8b 44 24 54       	mov    0x54(%r12),%eax
     1a7:	45 8b 6c 24 5c       	mov    0x5c(%r12),%r13d
     1ac:	48 85 d2             	test   %rdx,%rdx
     1af:	89 45 d4             	mov    %eax,-0x2c(%rbp)
     1b2:	0f 84 ab 00 00 00    	je     263 <copy_page_to_iter_pipe+0xe3>
     1b8:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
     1bc:	48 89 cf             	mov    %rcx,%rdi
     1bf:	49 89 d6             	mov    %rdx,%r14
     1c2:	48 89 cb             	mov    %rcx,%rbx
     1c5:	48 89 75 c8          	mov    %rsi,-0x38(%rbp)
     1c9:	e8 e2 fe ff ff       	callq  b0 <sanity>
     1ce:	84 c0                	test   %al,%al
     1d0:	0f 84 8d 00 00 00    	je     263 <copy_page_to_iter_pipe+0xe3>
     1d6:	41 83 ed 01          	sub    $0x1,%r13d
     1da:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
     1de:	49 8b b4 24 90 00 00 	mov    0x90(%r12),%rsi
     1e5:	00 
     1e6:	44 89 e8             	mov    %r13d,%eax
     1e9:	44 21 f8             	and    %r15d,%eax
     1ec:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
     1f0:	48 85 c9             	test   %rcx,%rcx
     1f3:	48 8d 04 c6          	lea    (%rsi,%rax,8),%rax
     1f7:	74 16                	je     20f <copy_page_to_iter_pipe+0x8f>
     1f9:	48 3b 4d c8          	cmp    -0x38(%rbp),%rcx
     1fd:	74 79                	je     278 <copy_page_to_iter_pipe+0xf8>
     1ff:	41 83 c7 01          	add    $0x1,%r15d
     203:	45 21 fd             	and    %r15d,%r13d
     206:	4b 8d 44 ad 00       	lea    0x0(%r13,%r13,4),%rax
     20b:	48 8d 04 c6          	lea    (%rsi,%rax,8),%rax
     20f:	44 89 f9             	mov    %r15d,%ecx
     212:	2b 4d d4             	sub    -0x2c(%rbp),%ecx
     215:	41 39 4c 24 58       	cmp    %ecx,0x58(%r12)
     21a:	76 47                	jbe    263 <copy_page_to_iter_pipe+0xe3>
     21c:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
     220:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
     227:	00 
     228:	48 8b 77 08          	mov    0x8(%rdi),%rsi
     22c:	48 8d 4e ff          	lea    -0x1(%rsi),%rcx
     230:	83 e6 01             	and    $0x1,%esi
     233:	48 0f 44 cf          	cmove  %rdi,%rcx
     237:	f0 ff 41 34          	lock incl 0x34(%rcx)
     23b:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
     23f:	48 89 38             	mov    %rdi,(%rax)
     242:	44 89 70 0c          	mov    %r14d,0xc(%rax)
     246:	89 70 08             	mov    %esi,0x8(%rax)
     249:	41 8d 47 01          	lea    0x1(%r15),%eax
     24d:	4c 01 f6             	add    %r14,%rsi
     250:	41 89 44 24 50       	mov    %eax,0x50(%r12)
     255:	48 89 73 08          	mov    %rsi,0x8(%rbx)
     259:	44 89 7b 20          	mov    %r15d,0x20(%rbx)
     25d:	4c 29 73 10          	sub    %r14,0x10(%rbx)
     261:	eb 03                	jmp    266 <copy_page_to_iter_pipe+0xe6>
     263:	45 31 f6             	xor    %r14d,%r14d
     266:	48 83 c4 18          	add    $0x18,%rsp
     26a:	4c 89 f0             	mov    %r14,%rax
     26d:	5b                   	pop    %rbx
     26e:	41 5c                	pop    %r12
     270:	41 5d                	pop    %r13
     272:	41 5e                	pop    %r14
     274:	41 5f                	pop    %r15
     276:	5d                   	pop    %rbp
     277:	c3                   	retq   
     278:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
     27c:	48 39 38             	cmp    %rdi,(%rax)
     27f:	0f 85 7a ff ff ff    	jne    1ff <copy_page_to_iter_pipe+0x7f>
     285:	44 01 70 0c          	add    %r14d,0xc(%rax)
     289:	4c 01 73 08          	add    %r14,0x8(%rbx)
     28d:	eb ce                	jmp    25d <copy_page_to_iter_pipe+0xdd>
     28f:	90                   	nop

0000000000000290 <push_pipe>:
     290:	55                   	push   %rbp
     291:	48 89 e5             	mov    %rsp,%rbp
     294:	41 57                	push   %r15
     296:	41 56                	push   %r14
     298:	41 55                	push   %r13
     29a:	41 54                	push   %r12
     29c:	53                   	push   %rbx
     29d:	48 83 ec 10          	sub    $0x10,%rsp
     2a1:	48 8b 5f 18          	mov    0x18(%rdi),%rbx
     2a5:	48 39 77 10          	cmp    %rsi,0x10(%rdi)
     2a9:	48 0f 46 77 10       	cmovbe 0x10(%rdi),%rsi
     2ae:	8b 43 54             	mov    0x54(%rbx),%eax
     2b1:	48 85 f6             	test   %rsi,%rsi
     2b4:	48 89 75 c8          	mov    %rsi,-0x38(%rbp)
     2b8:	89 45 d4             	mov    %eax,-0x2c(%rbp)
     2bb:	8b 43 5c             	mov    0x5c(%rbx),%eax
     2be:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
     2c2:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
     2c6:	0f 84 92 00 00 00    	je     35e <push_pipe+0xce>
     2cc:	48 8b 47 08          	mov    0x8(%rdi),%rax
     2d0:	49 89 f5             	mov    %rsi,%r13
     2d3:	44 8b 7f 20          	mov    0x20(%rdi),%r15d
     2d7:	48 85 c0             	test   %rax,%rax
     2da:	0f 85 91 00 00 00    	jne    371 <push_pipe+0xe1>
     2e0:	44 89 3a             	mov    %r15d,(%rdx)
     2e3:	48 c7 01 00 00 00 00 	movq   $0x0,(%rcx)
     2ea:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14
     2f1:	eb 5c                	jmp    34f <push_pipe+0xbf>
     2f3:	8b 45 d0             	mov    -0x30(%rbp),%eax
     2f6:	31 f6                	xor    %esi,%esi
     2f8:	bf c0 0c 10 00       	mov    $0x100cc0,%edi
     2fd:	44 21 f8             	and    %r15d,%eax
     300:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
     304:	48 8b 83 90 00 00 00 	mov    0x90(%rbx),%rax
     30b:	4c 8d 24 d0          	lea    (%rax,%rdx,8),%r12
     30f:	e8 00 00 00 00       	callq  314 <push_pipe+0x84>
     314:	48 85 c0             	test   %rax,%rax
     317:	74 41                	je     35a <push_pipe+0xca>
     319:	49 81 fd 00 10 00 00 	cmp    $0x1000,%r13
     320:	49 89 04 24          	mov    %rax,(%r12)
     324:	b8 00 10 00 00       	mov    $0x1000,%eax
     329:	49 0f 4e c5          	cmovle %r13,%rax
     32d:	41 83 c7 01          	add    $0x1,%r15d
     331:	4d 89 74 24 10       	mov    %r14,0x10(%r12)
     336:	41 89 44 24 0c       	mov    %eax,0xc(%r12)
     33b:	89 c0                	mov    %eax,%eax
     33d:	41 c7 44 24 08 00 00 	movl   $0x0,0x8(%r12)
     344:	00 00 
     346:	49 29 c5             	sub    %rax,%r13
     349:	44 89 7b 50          	mov    %r15d,0x50(%rbx)
     34d:	74 0f                	je     35e <push_pipe+0xce>
     34f:	44 89 f8             	mov    %r15d,%eax
     352:	2b 45 d4             	sub    -0x2c(%rbp),%eax
     355:	39 43 58             	cmp    %eax,0x58(%rbx)
     358:	77 99                	ja     2f3 <push_pipe+0x63>
     35a:	4c 29 6d c8          	sub    %r13,-0x38(%rbp)
     35e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     362:	48 83 c4 10          	add    $0x10,%rsp
     366:	5b                   	pop    %rbx
     367:	41 5c                	pop    %r12
     369:	41 5d                	pop    %r13
     36b:	41 5e                	pop    %r14
     36d:	41 5f                	pop    %r15
     36f:	5d                   	pop    %rbp
     370:	c3                   	retq   
     371:	44 89 c6             	mov    %r8d,%esi
     374:	48 8b bb 90 00 00 00 	mov    0x90(%rbx),%rdi
     37b:	44 21 fe             	and    %r15d,%esi
     37e:	48 8d 34 b6          	lea    (%rsi,%rsi,4),%rsi
     382:	48 c1 e6 03          	shl    $0x3,%rsi
     386:	48 81 7c 37 10 00 00 	cmpq   $0x0,0x10(%rdi,%rsi,1)
     38d:	00 00 
     38f:	75 08                	jne    399 <push_pipe+0x109>
     391:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
     397:	75 13                	jne    3ac <push_pipe+0x11c>
     399:	41 83 c7 01          	add    $0x1,%r15d
     39d:	44 89 3a             	mov    %r15d,(%rdx)
     3a0:	48 c7 01 00 00 00 00 	movq   $0x0,(%rcx)
     3a7:	e9 3e ff ff ff       	jmpq   2ea <push_pipe+0x5a>
     3ac:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
     3b0:	44 89 3a             	mov    %r15d,(%rdx)
     3b3:	48 89 01             	mov    %rax,(%rcx)
     3b6:	4c 8d ac 38 00 f0 ff 	lea    -0x1000(%rax,%rdi,1),%r13
     3bd:	ff 
     3be:	4d 85 ed             	test   %r13,%r13
     3c1:	7e 18                	jle    3db <push_pipe+0x14b>
     3c3:	48 8b 83 90 00 00 00 	mov    0x90(%rbx),%rax
     3ca:	41 83 c7 01          	add    $0x1,%r15d
     3ce:	c7 44 30 0c 00 10 00 	movl   $0x1000,0xc(%rax,%rsi,1)
     3d5:	00 
     3d6:	e9 0f ff ff ff       	jmpq   2ea <push_pipe+0x5a>
     3db:	48 03 b3 90 00 00 00 	add    0x90(%rbx),%rsi
     3e2:	8b 45 c8             	mov    -0x38(%rbp),%eax
     3e5:	01 46 0c             	add    %eax,0xc(%rsi)
     3e8:	e9 71 ff ff ff       	jmpq   35e <push_pipe+0xce>
     3ed:	0f 1f 00             	nopl   (%rax)

00000000000003f0 <memcpy_from_page>:
     3f0:	55                   	push   %rbp
     3f1:	48 89 f8             	mov    %rdi,%rax
     3f4:	48 89 e5             	mov    %rsp,%rbp
     3f7:	65 48 8b 3c 25 00 00 	mov    %gs:0x0,%rdi
     3fe:	00 00 
     400:	83 87 80 12 00 00 01 	addl   $0x1,0x1280(%rdi)
     407:	48 2b 35 00 00 00 00 	sub    0x0(%rip),%rsi        # 40e <memcpy_from_page+0x1e>
     40e:	48 c1 fe 06          	sar    $0x6,%rsi
     412:	48 c1 e6 0c          	shl    $0xc,%rsi
     416:	48 03 35 00 00 00 00 	add    0x0(%rip),%rsi        # 41d <memcpy_from_page+0x2d>
     41d:	48 01 d6             	add    %rdx,%rsi
     420:	83 f9 08             	cmp    $0x8,%ecx
     423:	73 21                	jae    446 <memcpy_from_page+0x56>
     425:	f6 c1 04             	test   $0x4,%cl
     428:	75 56                	jne    480 <memcpy_from_page+0x90>
     42a:	85 c9                	test   %ecx,%ecx
     42c:	74 40                	je     46e <memcpy_from_page+0x7e>
     42e:	0f b6 16             	movzbl (%rsi),%edx
     431:	f6 c1 02             	test   $0x2,%cl
     434:	88 10                	mov    %dl,(%rax)
     436:	74 36                	je     46e <memcpy_from_page+0x7e>
     438:	89 c9                	mov    %ecx,%ecx
     43a:	0f b7 54 0e fe       	movzwl -0x2(%rsi,%rcx,1),%edx
     43f:	66 89 54 08 fe       	mov    %dx,-0x2(%rax,%rcx,1)
     444:	eb 28                	jmp    46e <memcpy_from_page+0x7e>
     446:	48 8b 16             	mov    (%rsi),%rdx
     449:	48 89 10             	mov    %rdx,(%rax)
     44c:	89 ca                	mov    %ecx,%edx
     44e:	48 8b 7c 16 f8       	mov    -0x8(%rsi,%rdx,1),%rdi
     453:	48 89 7c 10 f8       	mov    %rdi,-0x8(%rax,%rdx,1)
     458:	48 8d 78 08          	lea    0x8(%rax),%rdi
     45c:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
     460:	48 29 f8             	sub    %rdi,%rax
     463:	01 c1                	add    %eax,%ecx
     465:	48 29 c6             	sub    %rax,%rsi
     468:	c1 e9 03             	shr    $0x3,%ecx
     46b:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
     46e:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
     475:	00 00 
     477:	83 a8 80 12 00 00 01 	subl   $0x1,0x1280(%rax)
     47e:	5d                   	pop    %rbp
     47f:	c3                   	retq   
     480:	8b 16                	mov    (%rsi),%edx
     482:	89 c9                	mov    %ecx,%ecx
     484:	89 10                	mov    %edx,(%rax)
     486:	8b 54 0e fc          	mov    -0x4(%rsi,%rcx,1),%edx
     48a:	89 54 08 fc          	mov    %edx,-0x4(%rax,%rcx,1)
     48e:	eb de                	jmp    46e <memcpy_from_page+0x7e>

0000000000000490 <memcpy_to_page>:
     490:	55                   	push   %rbp
     491:	48 89 d0             	mov    %rdx,%rax
     494:	48 89 ca             	mov    %rcx,%rdx
     497:	48 89 e5             	mov    %rsp,%rbp
     49a:	53                   	push   %rbx
     49b:	65 48 8b 1c 25 00 00 	mov    %gs:0x0,%rbx
     4a2:	00 00 
     4a4:	83 83 80 12 00 00 01 	addl   $0x1,0x1280(%rbx)
     4ab:	48 2b 3d 00 00 00 00 	sub    0x0(%rip),%rdi        # 4b2 <memcpy_to_page+0x22>
     4b2:	48 c1 ff 06          	sar    $0x6,%rdi
     4b6:	48 c1 e7 0c          	shl    $0xc,%rdi
     4ba:	48 03 3d 00 00 00 00 	add    0x0(%rip),%rdi        # 4c1 <memcpy_to_page+0x31>
     4c1:	48 01 f7             	add    %rsi,%rdi
     4c4:	48 89 c6             	mov    %rax,%rsi
     4c7:	e8 00 00 00 00       	callq  4cc <memcpy_to_page+0x3c>
     4cc:	83 ab 80 12 00 00 01 	subl   $0x1,0x1280(%rbx)
     4d3:	5b                   	pop    %rbx
     4d4:	5d                   	pop    %rbp
     4d5:	c3                   	retq   
     4d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     4dd:	00 00 00 

00000000000004e0 <copy_pipe_to_iter>:
     4e0:	55                   	push   %rbp
     4e1:	48 89 e5             	mov    %rsp,%rbp
     4e4:	41 57                	push   %r15
     4e6:	41 56                	push   %r14
     4e8:	41 55                	push   %r13
     4ea:	41 54                	push   %r12
     4ec:	49 89 f6             	mov    %rsi,%r14
     4ef:	53                   	push   %rbx
     4f0:	48 89 fb             	mov    %rdi,%rbx
     4f3:	48 89 d7             	mov    %rdx,%rdi
     4f6:	49 89 d7             	mov    %rdx,%r15
     4f9:	48 83 ec 28          	sub    $0x28,%rsp
     4fd:	4c 8b 62 18          	mov    0x18(%rdx),%r12
     501:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     508:	00 00 
     50a:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     50e:	31 c0                	xor    %eax,%eax
     510:	45 8b 6c 24 5c       	mov    0x5c(%r12),%r13d
     515:	e8 96 fb ff ff       	callq  b0 <sanity>
     51a:	84 c0                	test   %al,%al
     51c:	75 2e                	jne    54c <copy_pipe_to_iter+0x6c>
     51e:	48 c7 45 b0 00 00 00 	movq   $0x0,-0x50(%rbp)
     525:	00 
     526:	48 8b 5d d0          	mov    -0x30(%rbp),%rbx
     52a:	65 48 33 1c 25 28 00 	xor    %gs:0x28,%rbx
     531:	00 00 
     533:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     537:	0f 85 aa 00 00 00    	jne    5e7 <copy_pipe_to_iter+0x107>
     53d:	48 83 c4 28          	add    $0x28,%rsp
     541:	5b                   	pop    %rbx
     542:	41 5c                	pop    %r12
     544:	41 5d                	pop    %r13
     546:	41 5e                	pop    %r14
     548:	41 5f                	pop    %r15
     54a:	5d                   	pop    %rbp
     54b:	c3                   	retq   
     54c:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
     550:	48 8d 55 c4          	lea    -0x3c(%rbp),%rdx
     554:	4c 89 ff             	mov    %r15,%rdi
     557:	4c 89 f6             	mov    %r14,%rsi
     55a:	e8 31 fd ff ff       	callq  290 <push_pipe>
     55f:	48 85 c0             	test   %rax,%rax
     562:	48 89 c7             	mov    %rax,%rdi
     565:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     569:	74 b3                	je     51e <copy_pipe_to_iter+0x3e>
     56b:	41 8d 45 ff          	lea    -0x1(%r13),%eax
     56f:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
     573:	49 89 fd             	mov    %rdi,%r13
     576:	89 45 bc             	mov    %eax,-0x44(%rbp)
     579:	8b 45 c4             	mov    -0x3c(%rbp),%eax
     57c:	41 b8 00 10 00 00    	mov    $0x1000,%r8d
     582:	49 8b 94 24 90 00 00 	mov    0x90(%r12),%rdx
     589:	00 
     58a:	49 29 f0             	sub    %rsi,%r8
     58d:	4d 39 e8             	cmp    %r13,%r8
     590:	4d 89 c6             	mov    %r8,%r14
     593:	4d 0f 47 f5          	cmova  %r13,%r14
     597:	23 45 bc             	and    -0x44(%rbp),%eax
     59a:	4c 89 f1             	mov    %r14,%rcx
     59d:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
     5a1:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
     5a5:	48 89 da             	mov    %rbx,%rdx
     5a8:	4c 01 f3             	add    %r14,%rbx
     5ab:	48 8b 38             	mov    (%rax),%rdi
     5ae:	e8 dd fe ff ff       	callq  490 <memcpy_to_page>
     5b3:	8b 45 c4             	mov    -0x3c(%rbp),%eax
     5b6:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
     5ba:	31 f6                	xor    %esi,%esi
     5bc:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
     5c3:	00 
     5c4:	4c 01 f2             	add    %r14,%rdx
     5c7:	41 89 47 20          	mov    %eax,0x20(%r15)
     5cb:	83 c0 01             	add    $0x1,%eax
     5ce:	4d 29 f5             	sub    %r14,%r13
     5d1:	49 89 57 08          	mov    %rdx,0x8(%r15)
     5d5:	89 45 c4             	mov    %eax,-0x3c(%rbp)
     5d8:	75 a2                	jne    57c <copy_pipe_to_iter+0x9c>
     5da:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     5de:	49 29 47 10          	sub    %rax,0x10(%r15)
     5e2:	e9 3f ff ff ff       	jmpq   526 <copy_pipe_to_iter+0x46>
     5e7:	e8 00 00 00 00       	callq  5ec <copy_pipe_to_iter+0x10c>
     5ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000005f0 <memcpy_mcsafe_to_page>:
     5f0:	55                   	push   %rbp
     5f1:	49 89 d0             	mov    %rdx,%r8
     5f4:	48 89 ca             	mov    %rcx,%rdx
     5f7:	48 89 e5             	mov    %rsp,%rbp
     5fa:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
     601:	00 00 
     603:	83 80 80 12 00 00 01 	addl   $0x1,0x1280(%rax)
     60a:	48 2b 3d 00 00 00 00 	sub    0x0(%rip),%rdi        # 611 <memcpy_mcsafe_to_page+0x21>
     611:	48 c1 ff 06          	sar    $0x6,%rdi
     615:	48 c1 e7 0c          	shl    $0xc,%rdi
     619:	48 03 3d 00 00 00 00 	add    0x0(%rip),%rdi        # 620 <memcpy_mcsafe_to_page+0x30>
     620:	48 01 f7             	add    %rsi,%rdi
     623:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
     628:	4c 89 c6             	mov    %r8,%rsi
     62b:	e8 00 00 00 00       	callq  630 <memcpy_mcsafe_to_page+0x40>
     630:	31 c0                	xor    %eax,%eax
     632:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
     639:	00 00 
     63b:	83 aa 80 12 00 00 01 	subl   $0x1,0x1280(%rdx)
     642:	5d                   	pop    %rbp
     643:	c3                   	retq   
     644:	4c 89 c6             	mov    %r8,%rsi
     647:	e8 00 00 00 00       	callq  64c <memcpy_mcsafe_to_page+0x5c>
     64c:	eb e4                	jmp    632 <memcpy_mcsafe_to_page+0x42>
     64e:	66 90                	xchg   %ax,%ax

0000000000000650 <memzero_page>:
     650:	55                   	push   %rbp
     651:	48 89 e5             	mov    %rsp,%rbp
     654:	53                   	push   %rbx
     655:	65 48 8b 1c 25 00 00 	mov    %gs:0x0,%rbx
     65c:	00 00 
     65e:	83 83 80 12 00 00 01 	addl   $0x1,0x1280(%rbx)
     665:	48 2b 3d 00 00 00 00 	sub    0x0(%rip),%rdi        # 66c <memzero_page+0x1c>
     66c:	48 c1 ff 06          	sar    $0x6,%rdi
     670:	48 c1 e7 0c          	shl    $0xc,%rdi
     674:	48 03 3d 00 00 00 00 	add    0x0(%rip),%rdi        # 67b <memzero_page+0x2b>
     67b:	48 01 f7             	add    %rsi,%rdi
     67e:	31 f6                	xor    %esi,%esi
     680:	e8 00 00 00 00       	callq  685 <memzero_page+0x35>
     685:	83 ab 80 12 00 00 01 	subl   $0x1,0x1280(%rbx)
     68c:	5b                   	pop    %rbx
     68d:	5d                   	pop    %rbp
     68e:	c3                   	retq   
     68f:	90                   	nop

0000000000000690 <dup_iter>:
     690:	55                   	push   %rbp
     691:	48 89 e5             	mov    %rsp,%rbp
     694:	53                   	push   %rbx
     695:	48 8b 0e             	mov    (%rsi),%rcx
     698:	48 89 fb             	mov    %rdi,%rbx
     69b:	48 89 0f             	mov    %rcx,(%rdi)
     69e:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
     6a2:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
     6a6:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
     6aa:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
     6ae:	48 8b 7e 18          	mov    0x18(%rsi),%rdi
     6b2:	8b 0b                	mov    (%rbx),%ecx
     6b4:	48 89 7b 18          	mov    %rdi,0x18(%rbx)
     6b8:	48 8b 76 20          	mov    0x20(%rsi),%rsi
     6bc:	83 e1 fe             	and    $0xfffffffe,%ecx
     6bf:	83 f9 20             	cmp    $0x20,%ecx
     6c2:	48 89 73 20          	mov    %rsi,0x20(%rbx)
     6c6:	74 15                	je     6dd <dup_iter+0x4d>
     6c8:	83 f9 40             	cmp    $0x40,%ecx
     6cb:	74 17                	je     6e4 <dup_iter+0x54>
     6cd:	48 c1 e6 04          	shl    $0x4,%rsi
     6d1:	e8 00 00 00 00       	callq  6d6 <dup_iter+0x46>
     6d6:	48 89 43 18          	mov    %rax,0x18(%rbx)
     6da:	5b                   	pop    %rbx
     6db:	5d                   	pop    %rbp
     6dc:	c3                   	retq   
     6dd:	0f 0b                	ud2    
     6df:	31 c0                	xor    %eax,%eax
     6e1:	5b                   	pop    %rbx
     6e2:	5d                   	pop    %rbp
     6e3:	c3                   	retq   
     6e4:	31 c0                	xor    %eax,%eax
     6e6:	eb f2                	jmp    6da <dup_iter+0x4a>
     6e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     6ef:	00 

00000000000006f0 <import_iovec>:
     6f0:	55                   	push   %rbp
     6f1:	89 c9                	mov    %ecx,%ecx
     6f3:	48 89 e5             	mov    %rsp,%rbp
     6f6:	41 56                	push   %r14
     6f8:	41 55                	push   %r13
     6fa:	41 54                	push   %r12
     6fc:	53                   	push   %rbx
     6fd:	4d 89 c6             	mov    %r8,%r14
     700:	4d 89 cd             	mov    %r9,%r13
     703:	41 89 d4             	mov    %edx,%r12d
     706:	4c 8d 4d d0          	lea    -0x30(%rbp),%r9
     70a:	48 83 ec 18          	sub    $0x18,%rsp
     70e:	4d 8b 00             	mov    (%r8),%r8
     711:	4c 89 e2             	mov    %r12,%rdx
     714:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     71b:	00 00 
     71d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     721:	31 c0                	xor    %eax,%eax
     723:	89 fb                	mov    %edi,%ebx
     725:	e8 00 00 00 00       	callq  72a <import_iovec+0x3a>
     72a:	48 85 c0             	test   %rax,%rax
     72d:	78 79                	js     7a8 <import_iovec+0xb8>
     72f:	f7 c3 fe ff ff ff    	test   $0xfffffffe,%ebx
     735:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
     739:	0f 85 88 00 00 00    	jne    7c7 <import_iovec+0xd7>
     73f:	83 e3 01             	and    $0x1,%ebx
     742:	65 48 8b 0c 25 00 00 	mov    %gs:0x0,%rcx
     749:	00 00 
     74b:	48 83 b9 50 13 00 00 	cmpq   $0xffffffffffffffff,0x1350(%rcx)
     752:	ff 
     753:	74 46                	je     79b <import_iovec+0xab>
     755:	83 cb 04             	or     $0x4,%ebx
     758:	49 89 55 18          	mov    %rdx,0x18(%r13)
     75c:	41 89 5d 00          	mov    %ebx,0x0(%r13)
     760:	4d 89 65 20          	mov    %r12,0x20(%r13)
     764:	49 c7 45 08 00 00 00 	movq   $0x0,0x8(%r13)
     76b:	00 
     76c:	b9 00 00 00 00       	mov    $0x0,%ecx
     771:	49 89 45 10          	mov    %rax,0x10(%r13)
     775:	49 3b 16             	cmp    (%r14),%rdx
     778:	48 0f 44 d1          	cmove  %rcx,%rdx
     77c:	49 89 16             	mov    %rdx,(%r14)
     77f:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
     783:	65 48 33 3c 25 28 00 	xor    %gs:0x28,%rdi
     78a:	00 00 
     78c:	75 40                	jne    7ce <import_iovec+0xde>
     78e:	48 83 c4 18          	add    $0x18,%rsp
     792:	5b                   	pop    %rbx
     793:	41 5c                	pop    %r12
     795:	41 5d                	pop    %r13
     797:	41 5e                	pop    %r14
     799:	5d                   	pop    %rbp
     79a:	c3                   	retq   
     79b:	83 cb 08             	or     $0x8,%ebx
     79e:	49 89 55 18          	mov    %rdx,0x18(%r13)
     7a2:	41 89 5d 00          	mov    %ebx,0x0(%r13)
     7a6:	eb b8                	jmp    760 <import_iovec+0x70>
     7a8:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
     7ac:	49 39 3e             	cmp    %rdi,(%r14)
     7af:	74 0d                	je     7be <import_iovec+0xce>
     7b1:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
     7b5:	e8 00 00 00 00       	callq  7ba <import_iovec+0xca>
     7ba:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     7be:	49 c7 06 00 00 00 00 	movq   $0x0,(%r14)
     7c5:	eb b8                	jmp    77f <import_iovec+0x8f>
     7c7:	0f 0b                	ud2    
     7c9:	e9 71 ff ff ff       	jmpq   73f <import_iovec+0x4f>
     7ce:	e8 00 00 00 00       	callq  7d3 <import_iovec+0xe3>
     7d3:	0f 1f 00             	nopl   (%rax)
     7d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     7dd:	00 00 00 

00000000000007e0 <compat_import_iovec>:
     7e0:	55                   	push   %rbp
     7e1:	89 c9                	mov    %ecx,%ecx
     7e3:	48 89 e5             	mov    %rsp,%rbp
     7e6:	41 56                	push   %r14
     7e8:	41 55                	push   %r13
     7ea:	41 54                	push   %r12
     7ec:	53                   	push   %rbx
     7ed:	4d 89 c6             	mov    %r8,%r14
     7f0:	4d 89 cd             	mov    %r9,%r13
     7f3:	41 89 d4             	mov    %edx,%r12d
     7f6:	4c 8d 4d d0          	lea    -0x30(%rbp),%r9
     7fa:	48 83 ec 18          	sub    $0x18,%rsp
     7fe:	4d 8b 00             	mov    (%r8),%r8
     801:	4c 89 e2             	mov    %r12,%rdx
     804:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     80b:	00 00 
     80d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     811:	31 c0                	xor    %eax,%eax
     813:	89 fb                	mov    %edi,%ebx
     815:	e8 00 00 00 00       	callq  81a <compat_import_iovec+0x3a>
     81a:	48 85 c0             	test   %rax,%rax
     81d:	78 79                	js     898 <compat_import_iovec+0xb8>
     81f:	f7 c3 fe ff ff ff    	test   $0xfffffffe,%ebx
     825:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
     829:	0f 85 88 00 00 00    	jne    8b7 <compat_import_iovec+0xd7>
     82f:	83 e3 01             	and    $0x1,%ebx
     832:	65 48 8b 0c 25 00 00 	mov    %gs:0x0,%rcx
     839:	00 00 
     83b:	48 83 b9 50 13 00 00 	cmpq   $0xffffffffffffffff,0x1350(%rcx)
     842:	ff 
     843:	74 46                	je     88b <compat_import_iovec+0xab>
     845:	83 cb 04             	or     $0x4,%ebx
     848:	49 89 55 18          	mov    %rdx,0x18(%r13)
     84c:	41 89 5d 00          	mov    %ebx,0x0(%r13)
     850:	4d 89 65 20          	mov    %r12,0x20(%r13)
     854:	49 c7 45 08 00 00 00 	movq   $0x0,0x8(%r13)
     85b:	00 
     85c:	b9 00 00 00 00       	mov    $0x0,%ecx
     861:	49 89 45 10          	mov    %rax,0x10(%r13)
     865:	49 3b 16             	cmp    (%r14),%rdx
     868:	48 0f 44 d1          	cmove  %rcx,%rdx
     86c:	49 89 16             	mov    %rdx,(%r14)
     86f:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
     873:	65 48 33 3c 25 28 00 	xor    %gs:0x28,%rdi
     87a:	00 00 
     87c:	75 40                	jne    8be <compat_import_iovec+0xde>
     87e:	48 83 c4 18          	add    $0x18,%rsp
     882:	5b                   	pop    %rbx
     883:	41 5c                	pop    %r12
     885:	41 5d                	pop    %r13
     887:	41 5e                	pop    %r14
     889:	5d                   	pop    %rbp
     88a:	c3                   	retq   
     88b:	83 cb 08             	or     $0x8,%ebx
     88e:	49 89 55 18          	mov    %rdx,0x18(%r13)
     892:	41 89 5d 00          	mov    %ebx,0x0(%r13)
     896:	eb b8                	jmp    850 <compat_import_iovec+0x70>
     898:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
     89c:	49 39 3e             	cmp    %rdi,(%r14)
     89f:	74 0d                	je     8ae <compat_import_iovec+0xce>
     8a1:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
     8a5:	e8 00 00 00 00       	callq  8aa <compat_import_iovec+0xca>
     8aa:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     8ae:	49 c7 06 00 00 00 00 	movq   $0x0,(%r14)
     8b5:	eb b8                	jmp    86f <compat_import_iovec+0x8f>
     8b7:	0f 0b                	ud2    
     8b9:	e9 71 ff ff ff       	jmpq   82f <compat_import_iovec+0x4f>
     8be:	e8 00 00 00 00       	callq  8c3 <compat_import_iovec+0xe3>
     8c3:	0f 1f 00             	nopl   (%rax)
     8c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     8cd:	00 00 00 

00000000000008d0 <iov_iter_single_seg_count>:
     8d0:	8b 17                	mov    (%rdi),%edx
     8d2:	55                   	push   %rbp
     8d3:	48 8b 47 10          	mov    0x10(%rdi),%rax
     8d7:	48 89 e5             	mov    %rsp,%rbp
     8da:	83 e2 fe             	and    $0xfffffffe,%edx
     8dd:	83 fa 20             	cmp    $0x20,%edx
     8e0:	74 27                	je     909 <iov_iter_single_seg_count+0x39>
     8e2:	48 83 7f 20 01       	cmpq   $0x1,0x20(%rdi)
     8e7:	74 20                	je     909 <iov_iter_single_seg_count+0x39>
     8e9:	83 fa 40             	cmp    $0x40,%edx
     8ec:	74 1b                	je     909 <iov_iter_single_seg_count+0x39>
     8ee:	83 fa 10             	cmp    $0x10,%edx
     8f1:	48 8b 77 18          	mov    0x18(%rdi),%rsi
     8f5:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
     8f9:	74 10                	je     90b <iov_iter_single_seg_count+0x3b>
     8fb:	48 8b 56 08          	mov    0x8(%rsi),%rdx
     8ff:	48 29 ca             	sub    %rcx,%rdx
     902:	48 39 d0             	cmp    %rdx,%rax
     905:	48 0f 47 c2          	cmova  %rdx,%rax
     909:	5d                   	pop    %rbp
     90a:	c3                   	retq   
     90b:	8b 56 08             	mov    0x8(%rsi),%edx
     90e:	5d                   	pop    %rbp
     90f:	48 29 ca             	sub    %rcx,%rdx
     912:	48 39 d0             	cmp    %rdx,%rax
     915:	48 0f 47 c2          	cmova  %rdx,%rax
     919:	c3                   	retq   
     91a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000920 <copyout_mcsafe>:
     920:	55                   	push   %rbp
     921:	48 89 d0             	mov    %rdx,%rax
     924:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
     92b:	00 00 
     92d:	48 8b 8a 50 13 00 00 	mov    0x1350(%rdx),%rcx
     934:	48 89 fa             	mov    %rdi,%rdx
     937:	48 89 e5             	mov    %rsp,%rbp
     93a:	48 01 c2             	add    %rax,%rdx
     93d:	72 12                	jb     951 <copyout_mcsafe+0x31>
     93f:	48 39 d1             	cmp    %rdx,%rcx
     942:	72 0d                	jb     951 <copyout_mcsafe+0x31>
     944:	90                   	nop
     945:	90                   	nop
     946:	90                   	nop
     947:	89 c2                	mov    %eax,%edx
     949:	e8 00 00 00 00       	callq  94e <copyout_mcsafe+0x2e>
     94e:	90                   	nop
     94f:	90                   	nop
     950:	90                   	nop
     951:	5d                   	pop    %rbp
     952:	c3                   	retq   
     953:	0f 1f 00             	nopl   (%rax)
     956:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     95d:	00 00 00 

0000000000000960 <iov_iter_pipe>:
     960:	55                   	push   %rbp
     961:	85 f6                	test   %esi,%esi
     963:	48 89 e5             	mov    %rsp,%rbp
     966:	75 2c                	jne    994 <iov_iter_pipe+0x34>
     968:	8b 42 50             	mov    0x50(%rdx),%eax
     96b:	2b 42 54             	sub    0x54(%rdx),%eax
     96e:	39 42 5c             	cmp    %eax,0x5c(%rdx)
     971:	76 23                	jbe    996 <iov_iter_pipe+0x36>
     973:	c7 07 20 00 00 00    	movl   $0x20,(%rdi)
     979:	48 89 57 18          	mov    %rdx,0x18(%rdi)
     97d:	8b 42 50             	mov    0x50(%rdx),%eax
     980:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
     987:	00 
     988:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
     98c:	5d                   	pop    %rbp
     98d:	89 47 20             	mov    %eax,0x20(%rdi)
     990:	89 47 24             	mov    %eax,0x24(%rdi)
     993:	c3                   	retq   
     994:	0f 0b                	ud2    
     996:	0f 0b                	ud2    
     998:	eb d9                	jmp    973 <iov_iter_pipe+0x13>
     99a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000009a0 <iov_iter_discard>:
     9a0:	85 f6                	test   %esi,%esi
     9a2:	75 13                	jne    9b7 <iov_iter_discard+0x17>
     9a4:	c7 07 40 00 00 00    	movl   $0x40,(%rdi)
     9aa:	48 89 57 10          	mov    %rdx,0x10(%rdi)
     9ae:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
     9b5:	00 
     9b6:	c3                   	retq   
     9b7:	55                   	push   %rbp
     9b8:	48 89 e5             	mov    %rsp,%rbp
     9bb:	0f 0b                	ud2    
     9bd:	0f 1f 00             	nopl   (%rax)

00000000000009c0 <import_single_range>:
     9c0:	48 81 fa 00 f0 ff 7f 	cmp    $0x7ffff000,%rdx
     9c7:	b8 00 f0 ff 7f       	mov    $0x7ffff000,%eax
     9cc:	55                   	push   %rbp
     9cd:	48 0f 47 d0          	cmova  %rax,%rdx
     9d1:	49 89 f1             	mov    %rsi,%r9
     9d4:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
     9db:	00 00 
     9dd:	49 01 d1             	add    %rdx,%r9
     9e0:	4c 8b 90 50 13 00 00 	mov    0x1350(%rax),%r10
     9e7:	48 89 e5             	mov    %rsp,%rbp
     9ea:	b8 f2 ff ff ff       	mov    $0xfffffff2,%eax
     9ef:	72 4a                	jb     a3b <import_single_range+0x7b>
     9f1:	4d 39 ca             	cmp    %r9,%r10
     9f4:	72 45                	jb     a3b <import_single_range+0x7b>
     9f6:	f7 c7 fe ff ff ff    	test   $0xfffffffe,%edi
     9fc:	48 89 31             	mov    %rsi,(%rcx)
     9ff:	48 89 51 08          	mov    %rdx,0x8(%rcx)
     a03:	75 44                	jne    a49 <import_single_range+0x89>
     a05:	83 e7 01             	and    $0x1,%edi
     a08:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
     a0f:	00 00 
     a11:	48 83 b8 50 13 00 00 	cmpq   $0xffffffffffffffff,0x1350(%rax)
     a18:	ff 
     a19:	74 22                	je     a3d <import_single_range+0x7d>
     a1b:	83 cf 04             	or     $0x4,%edi
     a1e:	49 89 48 18          	mov    %rcx,0x18(%r8)
     a22:	41 89 38             	mov    %edi,(%r8)
     a25:	49 c7 40 20 01 00 00 	movq   $0x1,0x20(%r8)
     a2c:	00 
     a2d:	49 c7 40 08 00 00 00 	movq   $0x0,0x8(%r8)
     a34:	00 
     a35:	31 c0                	xor    %eax,%eax
     a37:	49 89 50 10          	mov    %rdx,0x10(%r8)
     a3b:	5d                   	pop    %rbp
     a3c:	c3                   	retq   
     a3d:	83 cf 08             	or     $0x8,%edi
     a40:	49 89 48 18          	mov    %rcx,0x18(%r8)
     a44:	41 89 38             	mov    %edi,(%r8)
     a47:	eb dc                	jmp    a25 <import_single_range+0x65>
     a49:	0f 0b                	ud2    
     a4b:	eb b8                	jmp    a05 <import_single_range+0x45>
     a4d:	0f 1f 00             	nopl   (%rax)

0000000000000a50 <copyout>:
     a50:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
     a57:	00 00 
     a59:	55                   	push   %rbp
     a5a:	48 8b 88 50 13 00 00 	mov    0x1350(%rax),%rcx
     a61:	48 89 f8             	mov    %rdi,%rax
     a64:	48 01 d0             	add    %rdx,%rax
     a67:	48 89 e5             	mov    %rsp,%rbp
     a6a:	72 0c                	jb     a78 <copyout+0x28>
     a6c:	48 39 c1             	cmp    %rax,%rcx
     a6f:	72 07                	jb     a78 <copyout+0x28>
     a71:	e8 00 00 00 00       	callq  a76 <copyout+0x26>
     a76:	89 c2                	mov    %eax,%edx
     a78:	89 d0                	mov    %edx,%eax
     a7a:	5d                   	pop    %rbp
     a7b:	c3                   	retq   
     a7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000a80 <copy_page_to_iter_iovec>:
     a80:	55                   	push   %rbp
     a81:	48 89 e5             	mov    %rsp,%rbp
     a84:	41 57                	push   %r15
     a86:	41 56                	push   %r14
     a88:	41 55                	push   %r13
     a8a:	41 54                	push   %r12
     a8c:	53                   	push   %rbx
     a8d:	48 83 ec 18          	sub    $0x18,%rsp
     a91:	48 39 51 10          	cmp    %rdx,0x10(%rcx)
     a95:	48 0f 46 51 10       	cmovbe 0x10(%rcx),%rdx
     a9a:	48 85 d2             	test   %rdx,%rdx
     a9d:	49 89 d4             	mov    %rdx,%r12
     aa0:	0f 84 ac 00 00 00    	je     b52 <copy_page_to_iter_iovec+0xd2>
     aa6:	4c 8b 79 18          	mov    0x18(%rcx),%r15
     aaa:	48 89 cb             	mov    %rcx,%rbx
     aad:	48 8b 49 08          	mov    0x8(%rcx),%rcx
     ab1:	49 89 fd             	mov    %rdi,%r13
     ab4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
     ab8:	4d 8b 77 08          	mov    0x8(%r15),%r14
     abc:	49 8b 3f             	mov    (%r15),%rdi
     abf:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
     ac3:	49 29 ce             	sub    %rcx,%r14
     ac6:	48 01 cf             	add    %rcx,%rdi
     ac9:	49 39 d6             	cmp    %rdx,%r14
     acc:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
     ad0:	4c 0f 47 f2          	cmova  %rdx,%r14
     ad4:	e8 00 00 00 00       	callq  ad9 <copy_page_to_iter_iovec+0x59>
     ad9:	4c 2b 2d 00 00 00 00 	sub    0x0(%rip),%r13        # ae0 <copy_page_to_iter_iovec+0x60>
     ae0:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
     ae4:	4c 89 f2             	mov    %r14,%rdx
     ae7:	49 c1 fd 06          	sar    $0x6,%r13
     aeb:	49 c1 e5 0c          	shl    $0xc,%r13
     aef:	4c 03 2d 00 00 00 00 	add    0x0(%rip),%r13        # af6 <copy_page_to_iter_iovec+0x76>
     af6:	4c 03 6d d0          	add    -0x30(%rbp),%r13
     afa:	4c 89 ee             	mov    %r13,%rsi
     afd:	e8 4e ff ff ff       	callq  a50 <copyout>
     b02:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
     b06:	48 98                	cltq   
     b08:	4d 89 e1             	mov    %r12,%r9
     b0b:	49 29 c6             	sub    %rax,%r14
     b0e:	4d 29 f1             	sub    %r14,%r9
     b11:	4c 01 f1             	add    %r14,%rcx
     b14:	48 85 c0             	test   %rax,%rax
     b17:	75 05                	jne    b1e <copy_page_to_iter_iovec+0x9e>
     b19:	4d 85 c9             	test   %r9,%r9
     b1c:	75 46                	jne    b64 <copy_page_to_iter_iovec+0xe4>
     b1e:	49 39 4f 08          	cmp    %rcx,0x8(%r15)
     b22:	75 06                	jne    b2a <copy_page_to_iter_iovec+0xaa>
     b24:	49 83 c7 10          	add    $0x10,%r15
     b28:	31 c9                	xor    %ecx,%ecx
     b2a:	48 8b 43 10          	mov    0x10(%rbx),%rax
     b2e:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
     b32:	4c 01 c8             	add    %r9,%rax
     b35:	4c 29 e0             	sub    %r12,%rax
     b38:	4d 29 cc             	sub    %r9,%r12
     b3b:	48 89 43 10          	mov    %rax,0x10(%rbx)
     b3f:	4c 89 f8             	mov    %r15,%rax
     b42:	48 2b 43 18          	sub    0x18(%rbx),%rax
     b46:	4c 89 7b 18          	mov    %r15,0x18(%rbx)
     b4a:	48 c1 f8 04          	sar    $0x4,%rax
     b4e:	48 29 43 20          	sub    %rax,0x20(%rbx)
     b52:	48 83 c4 18          	add    $0x18,%rsp
     b56:	4c 89 e0             	mov    %r12,%rax
     b59:	5b                   	pop    %rbx
     b5a:	41 5c                	pop    %r12
     b5c:	41 5d                	pop    %r13
     b5e:	41 5e                	pop    %r14
     b60:	41 5f                	pop    %r15
     b62:	5d                   	pop    %rbp
     b63:	c3                   	retq   
     b64:	4d 01 ee             	add    %r13,%r14
     b67:	49 83 c7 10          	add    $0x10,%r15
     b6b:	4d 89 cd             	mov    %r9,%r13
     b6e:	49 8b 3f             	mov    (%r15),%rdi
     b71:	4d 39 4f 08          	cmp    %r9,0x8(%r15)
     b75:	4c 89 f6             	mov    %r14,%rsi
     b78:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
     b7c:	4d 0f 46 6f 08       	cmovbe 0x8(%r15),%r13
     b81:	4c 89 ea             	mov    %r13,%rdx
     b84:	e8 c7 fe ff ff       	callq  a50 <copyout>
     b89:	4c 8b 4d d0          	mov    -0x30(%rbp),%r9
     b8d:	48 98                	cltq   
     b8f:	4c 89 e9             	mov    %r13,%rcx
     b92:	48 29 c1             	sub    %rax,%rcx
     b95:	49 01 ce             	add    %rcx,%r14
     b98:	49 29 c9             	sub    %rcx,%r9
     b9b:	48 85 c0             	test   %rax,%rax
     b9e:	0f 85 7a ff ff ff    	jne    b1e <copy_page_to_iter_iovec+0x9e>
     ba4:	4d 85 c9             	test   %r9,%r9
     ba7:	0f 84 71 ff ff ff    	je     b1e <copy_page_to_iter_iovec+0x9e>
     bad:	eb b8                	jmp    b67 <copy_page_to_iter_iovec+0xe7>
     baf:	90                   	nop

0000000000000bb0 <copyin>:
     bb0:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
     bb7:	00 00 
     bb9:	55                   	push   %rbp
     bba:	48 8b 88 50 13 00 00 	mov    0x1350(%rax),%rcx
     bc1:	48 89 f0             	mov    %rsi,%rax
     bc4:	48 01 d0             	add    %rdx,%rax
     bc7:	48 89 e5             	mov    %rsp,%rbp
     bca:	72 0c                	jb     bd8 <copyin+0x28>
     bcc:	48 39 c1             	cmp    %rax,%rcx
     bcf:	72 07                	jb     bd8 <copyin+0x28>
     bd1:	e8 00 00 00 00       	callq  bd6 <copyin+0x26>
     bd6:	89 c2                	mov    %eax,%edx
     bd8:	89 d0                	mov    %edx,%eax
     bda:	5d                   	pop    %rbp
     bdb:	c3                   	retq   
     bdc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000be0 <iov_iter_fault_in_readable>:
     be0:	f6 07 18             	testb  $0x18,(%rdi)
     be3:	0f 85 82 00 00 00    	jne    c6b <iov_iter_fault_in_readable+0x8b>
     be9:	55                   	push   %rbp
     bea:	48 89 e5             	mov    %rsp,%rbp
     bed:	48 83 ec 08          	sub    $0x8,%rsp
     bf1:	4c 8b 57 18          	mov    0x18(%rdi),%r10
     bf5:	48 8b 57 08          	mov    0x8(%rdi),%rdx
     bf9:	49 8b 4a 08          	mov    0x8(%r10),%rcx
     bfd:	48 29 d1             	sub    %rdx,%rcx
     c00:	48 39 f1             	cmp    %rsi,%rcx
     c03:	48 0f 47 ce          	cmova  %rsi,%rcx
     c07:	48 85 c9             	test   %rcx,%rcx
     c0a:	74 56                	je     c62 <iov_iter_fault_in_readable+0x82>
     c0c:	49 03 12             	add    (%r10),%rdx
     c0f:	48 63 c1             	movslq %ecx,%rax
     c12:	85 c9                	test   %ecx,%ecx
     c14:	4c 8d 44 02 ff       	lea    -0x1(%rdx,%rax,1),%r8
     c19:	74 44                	je     c5f <iov_iter_fault_in_readable+0x7f>
     c1b:	45 31 c9             	xor    %r9d,%r9d
     c1e:	4c 39 c2             	cmp    %r8,%rdx
     c21:	76 0e                	jbe    c31 <iov_iter_fault_in_readable+0x51>
     c23:	eb 23                	jmp    c48 <iov_iter_fault_in_readable+0x68>
     c25:	48 81 c2 00 10 00 00 	add    $0x1000,%rdx
     c2c:	49 39 d0             	cmp    %rdx,%r8
     c2f:	72 1e                	jb     c4f <iov_iter_fault_in_readable+0x6f>
     c31:	90                   	nop
     c32:	90                   	nop
     c33:	90                   	nop
     c34:	90                   	nop
     c35:	90                   	nop
     c36:	90                   	nop
     c37:	44 89 c8             	mov    %r9d,%eax
     c3a:	40 8a 3a             	mov    (%rdx),%dil
     c3d:	90                   	nop
     c3e:	90                   	nop
     c3f:	90                   	nop
     c40:	85 c0                	test   %eax,%eax
     c42:	40 88 7d fe          	mov    %dil,-0x2(%rbp)
     c46:	74 dd                	je     c25 <iov_iter_fault_in_readable+0x45>
     c48:	b8 f2 ff ff ff       	mov    $0xfffffff2,%eax
     c4d:	c9                   	leaveq 
     c4e:	c3                   	retq   
     c4f:	4c 31 c2             	xor    %r8,%rdx
     c52:	48 f7 c2 00 f0 ff ff 	test   $0xfffffffffffff000,%rdx
     c59:	74 13                	je     c6e <iov_iter_fault_in_readable+0x8e>
     c5b:	0f b6 45 fe          	movzbl -0x2(%rbp),%eax
     c5f:	48 29 ce             	sub    %rcx,%rsi
     c62:	48 85 f6             	test   %rsi,%rsi
     c65:	75 1c                	jne    c83 <iov_iter_fault_in_readable+0xa3>
     c67:	31 c0                	xor    %eax,%eax
     c69:	c9                   	leaveq 
     c6a:	c3                   	retq   
     c6b:	31 c0                	xor    %eax,%eax
     c6d:	c3                   	retq   
     c6e:	90                   	nop
     c6f:	90                   	nop
     c70:	90                   	nop
     c71:	90                   	nop
     c72:	90                   	nop
     c73:	90                   	nop
     c74:	41 8a 10             	mov    (%r8),%dl
     c77:	90                   	nop
     c78:	90                   	nop
     c79:	90                   	nop
     c7a:	85 c0                	test   %eax,%eax
     c7c:	88 55 fe             	mov    %dl,-0x2(%rbp)
     c7f:	74 de                	je     c5f <iov_iter_fault_in_readable+0x7f>
     c81:	eb ca                	jmp    c4d <iov_iter_fault_in_readable+0x6d>
     c83:	45 31 c9             	xor    %r9d,%r9d
     c86:	49 83 c2 10          	add    $0x10,%r10
     c8a:	49 89 f0             	mov    %rsi,%r8
     c8d:	49 39 72 08          	cmp    %rsi,0x8(%r10)
     c91:	4d 0f 46 42 08       	cmovbe 0x8(%r10),%r8
     c96:	4d 85 c0             	test   %r8,%r8
     c99:	74 eb                	je     c86 <iov_iter_fault_in_readable+0xa6>
     c9b:	49 8b 12             	mov    (%r10),%rdx
     c9e:	49 63 c0             	movslq %r8d,%rax
     ca1:	45 85 c0             	test   %r8d,%r8d
     ca4:	48 8d 7c 02 ff       	lea    -0x1(%rdx,%rax,1),%rdi
     ca9:	74 3d                	je     ce8 <iov_iter_fault_in_readable+0x108>
     cab:	48 39 fa             	cmp    %rdi,%rdx
     cae:	76 0e                	jbe    cbe <iov_iter_fault_in_readable+0xde>
     cb0:	eb 96                	jmp    c48 <iov_iter_fault_in_readable+0x68>
     cb2:	48 81 c2 00 10 00 00 	add    $0x1000,%rdx
     cb9:	48 39 d7             	cmp    %rdx,%rdi
     cbc:	72 1a                	jb     cd8 <iov_iter_fault_in_readable+0xf8>
     cbe:	90                   	nop
     cbf:	90                   	nop
     cc0:	90                   	nop
     cc1:	90                   	nop
     cc2:	90                   	nop
     cc3:	90                   	nop
     cc4:	44 89 c8             	mov    %r9d,%eax
     cc7:	8a 0a                	mov    (%rdx),%cl
     cc9:	90                   	nop
     cca:	90                   	nop
     ccb:	90                   	nop
     ccc:	85 c0                	test   %eax,%eax
     cce:	88 4d ff             	mov    %cl,-0x1(%rbp)
     cd1:	74 df                	je     cb2 <iov_iter_fault_in_readable+0xd2>
     cd3:	e9 70 ff ff ff       	jmpq   c48 <iov_iter_fault_in_readable+0x68>
     cd8:	48 31 fa             	xor    %rdi,%rdx
     cdb:	48 f7 c2 00 f0 ff ff 	test   $0xfffffffffffff000,%rdx
     ce2:	74 10                	je     cf4 <iov_iter_fault_in_readable+0x114>
     ce4:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
     ce8:	4c 29 c6             	sub    %r8,%rsi
     ceb:	75 99                	jne    c86 <iov_iter_fault_in_readable+0xa6>
     ced:	31 c0                	xor    %eax,%eax
     cef:	e9 75 ff ff ff       	jmpq   c69 <iov_iter_fault_in_readable+0x89>
     cf4:	90                   	nop
     cf5:	90                   	nop
     cf6:	90                   	nop
     cf7:	90                   	nop
     cf8:	90                   	nop
     cf9:	90                   	nop
     cfa:	8a 17                	mov    (%rdi),%dl
     cfc:	90                   	nop
     cfd:	90                   	nop
     cfe:	90                   	nop
     cff:	85 c0                	test   %eax,%eax
     d01:	88 55 ff             	mov    %dl,-0x1(%rbp)
     d04:	74 e2                	je     ce8 <iov_iter_fault_in_readable+0x108>
     d06:	e9 42 ff ff ff       	jmpq   c4d <iov_iter_fault_in_readable+0x6d>
     d0b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000d10 <iov_iter_revert>:
     d10:	48 85 f6             	test   %rsi,%rsi
     d13:	0f 84 91 00 00 00    	je     daa <iov_iter_revert+0x9a>
     d19:	55                   	push   %rbp
     d1a:	48 81 fe 00 f0 ff 7f 	cmp    $0x7ffff000,%rsi
     d21:	48 89 e5             	mov    %rsp,%rbp
     d24:	41 56                	push   %r14
     d26:	41 55                	push   %r13
     d28:	41 54                	push   %r12
     d2a:	53                   	push   %rbx
     d2b:	0f 87 a5 00 00 00    	ja     dd6 <iov_iter_revert+0xc6>
     d31:	8b 0f                	mov    (%rdi),%ecx
     d33:	48 01 77 10          	add    %rsi,0x10(%rdi)
     d37:	83 e1 fe             	and    $0xfffffffe,%ecx
     d3a:	83 f9 20             	cmp    $0x20,%ecx
     d3d:	0f 84 a7 00 00 00    	je     dea <iov_iter_revert+0xda>
     d43:	83 f9 40             	cmp    $0x40,%ecx
     d46:	74 59                	je     da1 <iov_iter_revert+0x91>
     d48:	48 8b 47 08          	mov    0x8(%rdi),%rax
     d4c:	48 39 c6             	cmp    %rax,%rsi
     d4f:	0f 86 85 00 00 00    	jbe    dda <iov_iter_revert+0xca>
     d55:	48 29 c6             	sub    %rax,%rsi
     d58:	4c 8b 47 18          	mov    0x18(%rdi),%r8
     d5c:	48 8b 47 20          	mov    0x20(%rdi),%rax
     d60:	83 f9 10             	cmp    $0x10,%ecx
     d63:	49 8d 50 f0          	lea    -0x10(%r8),%rdx
     d67:	4c 8d 48 01          	lea    0x1(%rax),%r9
     d6b:	74 3f                	je     dac <iov_iter_revert+0x9c>
     d6d:	49 8b 48 f8          	mov    -0x8(%r8),%rcx
     d71:	48 83 c0 02          	add    $0x2,%rax
     d75:	4c 89 4f 20          	mov    %r9,0x20(%rdi)
     d79:	48 39 ce             	cmp    %rcx,%rsi
     d7c:	76 18                	jbe    d96 <iov_iter_revert+0x86>
     d7e:	48 83 ea 10          	sub    $0x10,%rdx
     d82:	48 29 ce             	sub    %rcx,%rsi
     d85:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
     d89:	48 89 47 20          	mov    %rax,0x20(%rdi)
     d8d:	48 83 c0 01          	add    $0x1,%rax
     d91:	48 39 f1             	cmp    %rsi,%rcx
     d94:	72 e8                	jb     d7e <iov_iter_revert+0x6e>
     d96:	48 29 f1             	sub    %rsi,%rcx
     d99:	48 89 57 18          	mov    %rdx,0x18(%rdi)
     d9d:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
     da1:	5b                   	pop    %rbx
     da2:	41 5c                	pop    %r12
     da4:	41 5d                	pop    %r13
     da6:	41 5e                	pop    %r14
     da8:	5d                   	pop    %rbp
     da9:	c3                   	retq   
     daa:	f3 c3                	repz retq 
     dac:	41 8b 48 f8          	mov    -0x8(%r8),%ecx
     db0:	48 83 c0 02          	add    $0x2,%rax
     db4:	4c 89 4f 20          	mov    %r9,0x20(%rdi)
     db8:	48 39 f1             	cmp    %rsi,%rcx
     dbb:	73 d9                	jae    d96 <iov_iter_revert+0x86>
     dbd:	48 83 ea 10          	sub    $0x10,%rdx
     dc1:	48 29 ce             	sub    %rcx,%rsi
     dc4:	8b 4a 08             	mov    0x8(%rdx),%ecx
     dc7:	48 89 47 20          	mov    %rax,0x20(%rdi)
     dcb:	48 83 c0 01          	add    $0x1,%rax
     dcf:	48 39 f1             	cmp    %rsi,%rcx
     dd2:	72 e9                	jb     dbd <iov_iter_revert+0xad>
     dd4:	eb c0                	jmp    d96 <iov_iter_revert+0x86>
     dd6:	0f 0b                	ud2    
     dd8:	eb c7                	jmp    da1 <iov_iter_revert+0x91>
     dda:	48 29 f0             	sub    %rsi,%rax
     ddd:	48 89 47 08          	mov    %rax,0x8(%rdi)
     de1:	5b                   	pop    %rbx
     de2:	41 5c                	pop    %r12
     de4:	41 5d                	pop    %r13
     de6:	41 5e                	pop    %r14
     de8:	5d                   	pop    %rbp
     de9:	c3                   	retq   
     dea:	4c 8b 67 18          	mov    0x18(%rdi),%r12
     dee:	8b 5f 20             	mov    0x20(%rdi),%ebx
     df1:	48 8b 57 08          	mov    0x8(%rdi),%rdx
     df5:	41 8b 44 24 5c       	mov    0x5c(%r12),%eax
     dfa:	4d 8b 84 24 90 00 00 	mov    0x90(%r12),%r8
     e01:	00 
     e02:	49 89 d1             	mov    %rdx,%r9
     e05:	8d 48 ff             	lea    -0x1(%rax),%ecx
     e08:	89 c8                	mov    %ecx,%eax
     e0a:	21 d8                	and    %ebx,%eax
     e0c:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
     e10:	41 8b 44 c0 08       	mov    0x8(%r8,%rax,8),%eax
     e15:	49 29 c1             	sub    %rax,%r9
     e18:	4c 39 ce             	cmp    %r9,%rsi
     e1b:	4c 89 c8             	mov    %r9,%rax
     e1e:	72 38                	jb     e58 <iov_iter_revert+0x148>
     e20:	48 29 c6             	sub    %rax,%rsi
     e23:	75 09                	jne    e2e <iov_iter_revert+0x11e>
     e25:	39 5f 24             	cmp    %ebx,0x24(%rdi)
     e28:	0f 84 b6 00 00 00    	je     ee4 <iov_iter_revert+0x1d4>
     e2e:	83 eb 01             	sub    $0x1,%ebx
     e31:	89 c8                	mov    %ecx,%eax
     e33:	21 d8                	and    %ebx,%eax
     e35:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
     e39:	49 8d 14 c0          	lea    (%r8,%rax,8),%rdx
     e3d:	8b 42 08             	mov    0x8(%rdx),%eax
     e40:	41 89 c2             	mov    %eax,%r10d
     e43:	44 03 52 0c          	add    0xc(%rdx),%r10d
     e47:	4d 89 d3             	mov    %r10,%r11
     e4a:	4c 89 d2             	mov    %r10,%rdx
     e4d:	49 29 c3             	sub    %rax,%r11
     e50:	49 39 f3             	cmp    %rsi,%r11
     e53:	4c 89 d8             	mov    %r11,%rax
     e56:	76 c8                	jbe    e20 <iov_iter_revert+0x110>
     e58:	48 29 f2             	sub    %rsi,%rdx
     e5b:	89 5f 20             	mov    %ebx,0x20(%rdi)
     e5e:	48 89 57 08          	mov    %rdx,0x8(%rdi)
     e62:	45 8b 74 24 50       	mov    0x50(%r12),%r14d
     e67:	45 39 74 24 54       	cmp    %r14d,0x54(%r12)
     e6c:	0f 84 2f ff ff ff    	je     da1 <iov_iter_revert+0x91>
     e72:	41 8b 44 24 5c       	mov    0x5c(%r12),%eax
     e77:	48 85 d2             	test   %rdx,%rdx
     e7a:	44 8d 68 ff          	lea    -0x1(%rax),%r13d
     e7e:	74 1e                	je     e9e <iov_iter_revert+0x18e>
     e80:	89 d8                	mov    %ebx,%eax
     e82:	83 c3 01             	add    $0x1,%ebx
     e85:	44 21 e8             	and    %r13d,%eax
     e88:	48 8d 0c 80          	lea    (%rax,%rax,4),%rcx
     e8c:	49 8b 84 24 90 00 00 	mov    0x90(%r12),%rax
     e93:	00 
     e94:	48 8d 04 c8          	lea    (%rax,%rcx,8),%rax
     e98:	2b 50 08             	sub    0x8(%rax),%edx
     e9b:	89 50 0c             	mov    %edx,0xc(%rax)
     e9e:	44 39 f3             	cmp    %r14d,%ebx
     ea1:	74 37                	je     eda <iov_iter_revert+0x1ca>
     ea3:	41 83 ee 01          	sub    $0x1,%r14d
     ea7:	4c 89 e7             	mov    %r12,%rdi
     eaa:	44 89 f0             	mov    %r14d,%eax
     ead:	44 21 e8             	and    %r13d,%eax
     eb0:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
     eb4:	49 8b 84 24 90 00 00 	mov    0x90(%r12),%rax
     ebb:	00 
     ebc:	48 8d 34 d0          	lea    (%rax,%rdx,8),%rsi
     ec0:	48 8b 46 10          	mov    0x10(%rsi),%rax
     ec4:	48 c7 46 10 00 00 00 	movq   $0x0,0x10(%rsi)
     ecb:	00 
     ecc:	48 8b 40 08          	mov    0x8(%rax),%rax
     ed0:	e8 00 00 00 00       	callq  ed5 <iov_iter_revert+0x1c5>
     ed5:	41 39 de             	cmp    %ebx,%r14d
     ed8:	75 c9                	jne    ea3 <iov_iter_revert+0x193>
     eda:	41 89 5c 24 50       	mov    %ebx,0x50(%r12)
     edf:	e9 bd fe ff ff       	jmpq   da1 <iov_iter_revert+0x91>
     ee4:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
     eeb:	00 
     eec:	89 5f 20             	mov    %ebx,0x20(%rdi)
     eef:	45 8b 74 24 50       	mov    0x50(%r12),%r14d
     ef4:	45 39 74 24 54       	cmp    %r14d,0x54(%r12)
     ef9:	0f 84 a2 fe ff ff    	je     da1 <iov_iter_revert+0x91>
     eff:	41 8b 44 24 5c       	mov    0x5c(%r12),%eax
     f04:	44 8d 68 ff          	lea    -0x1(%rax),%r13d
     f08:	eb 94                	jmp    e9e <iov_iter_revert+0x18e>
     f0a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000f10 <iov_iter_get_pages>:
     f10:	55                   	push   %rbp
     f11:	48 89 e5             	mov    %rsp,%rbp
     f14:	41 57                	push   %r15
     f16:	41 56                	push   %r14
     f18:	41 55                	push   %r13
     f1a:	41 54                	push   %r12
     f1c:	49 89 f5             	mov    %rsi,%r13
     f1f:	53                   	push   %rbx
     f20:	48 89 d3             	mov    %rdx,%rbx
     f23:	49 89 fc             	mov    %rdi,%r12
     f26:	4d 89 c6             	mov    %r8,%r14
     f29:	48 83 ec 18          	sub    $0x18,%rsp
     f2d:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     f34:	00 00 
     f36:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     f3a:	31 c0                	xor    %eax,%eax
     f3c:	48 39 57 10          	cmp    %rdx,0x10(%rdi)
     f40:	8b 17                	mov    (%rdi),%edx
     f42:	48 0f 46 5f 10       	cmovbe 0x10(%rdi),%rbx
     f47:	89 d0                	mov    %edx,%eax
     f49:	83 e0 fe             	and    $0xfffffffe,%eax
     f4c:	83 f8 20             	cmp    $0x20,%eax
     f4f:	0f 84 19 01 00 00    	je     106e <iov_iter_get_pages+0x15e>
     f55:	83 f8 40             	cmp    $0x40,%eax
     f58:	0f 84 03 01 00 00    	je     1061 <iov_iter_get_pages+0x151>
     f5e:	48 85 db             	test   %rbx,%rbx
     f61:	0f 84 03 01 00 00    	je     106a <iov_iter_get_pages+0x15a>
     f67:	f6 c2 10             	test   $0x10,%dl
     f6a:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
     f6e:	0f 85 06 02 00 00    	jne    117a <iov_iter_get_pages+0x26a>
     f74:	f6 c2 08             	test   $0x8,%dl
     f77:	0f 85 c8 00 00 00    	jne    1045 <iov_iter_get_pages+0x135>
     f7d:	83 e2 40             	and    $0x40,%edx
     f80:	0f 85 e4 00 00 00    	jne    106a <iov_iter_get_pages+0x15a>
     f86:	49 8b 54 24 18       	mov    0x18(%r12),%rdx
     f8b:	89 c9                	mov    %ecx,%ecx
     f8d:	48 8b 42 08          	mov    0x8(%rdx),%rax
     f91:	48 29 f8             	sub    %rdi,%rax
     f94:	48 39 d8             	cmp    %rbx,%rax
     f97:	48 0f 47 c3          	cmova  %rbx,%rax
     f9b:	48 c1 e1 0c          	shl    $0xc,%rcx
     f9f:	48 85 c0             	test   %rax,%rax
     fa2:	0f 84 80 00 00 00    	je     1028 <iov_iter_get_pages+0x118>
     fa8:	48 03 3a             	add    (%rdx),%rdi
     fab:	48 89 fb             	mov    %rdi,%rbx
     fae:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
     fb4:	48 01 d8             	add    %rbx,%rax
     fb7:	49 89 1e             	mov    %rbx,(%r14)
     fba:	41 8b 14 24          	mov    (%r12),%edx
     fbe:	48 39 c8             	cmp    %rcx,%rax
     fc1:	48 0f 46 c8          	cmovbe %rax,%rcx
     fc5:	48 81 e7 00 f0 ff ff 	and    $0xfffffffffffff000,%rdi
     fcc:	4c 8d b9 ff 0f 00 00 	lea    0xfff(%rcx),%r15
     fd3:	f7 d2                	not    %edx
     fd5:	48 89 cb             	mov    %rcx,%rbx
     fd8:	83 e2 01             	and    $0x1,%edx
     fdb:	4c 89 e9             	mov    %r13,%rcx
     fde:	49 c1 ef 0c          	shr    $0xc,%r15
     fe2:	44 89 fe             	mov    %r15d,%esi
     fe5:	e8 00 00 00 00       	callq  fea <iov_iter_get_pages+0xda>
     fea:	85 c0                	test   %eax,%eax
     fec:	0f 88 1a 02 00 00    	js     120c <iov_iter_get_pages+0x2fc>
     ff2:	48 63 d0             	movslq %eax,%rdx
     ff5:	48 c1 e2 0c          	shl    $0xc,%rdx
     ff9:	44 39 f8             	cmp    %r15d,%eax
     ffc:	48 0f 45 da          	cmovne %rdx,%rbx
    1000:	48 89 d8             	mov    %rbx,%rax
    1003:	49 2b 06             	sub    (%r14),%rax
    1006:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    100a:	65 48 33 34 25 28 00 	xor    %gs:0x28,%rsi
    1011:	00 00 
    1013:	0f 85 60 02 00 00    	jne    1279 <iov_iter_get_pages+0x369>
    1019:	48 83 c4 18          	add    $0x18,%rsp
    101d:	5b                   	pop    %rbx
    101e:	41 5c                	pop    %r12
    1020:	41 5d                	pop    %r13
    1022:	41 5e                	pop    %r14
    1024:	41 5f                	pop    %r15
    1026:	5d                   	pop    %rbp
    1027:	c3                   	retq   
    1028:	48 83 c2 10          	add    $0x10,%rdx
    102c:	48 89 d8             	mov    %rbx,%rax
    102f:	48 39 5a 08          	cmp    %rbx,0x8(%rdx)
    1033:	48 0f 46 42 08       	cmovbe 0x8(%rdx),%rax
    1038:	48 85 c0             	test   %rax,%rax
    103b:	74 eb                	je     1028 <iov_iter_get_pages+0x118>
    103d:	48 8b 3a             	mov    (%rdx),%rdi
    1040:	e9 66 ff ff ff       	jmpq   fab <iov_iter_get_pages+0x9b>
    1045:	49 8b 54 24 18       	mov    0x18(%r12),%rdx
    104a:	48 8b 42 08          	mov    0x8(%rdx),%rax
    104e:	48 29 f8             	sub    %rdi,%rax
    1051:	48 39 d8             	cmp    %rbx,%rax
    1054:	48 0f 47 c3          	cmova  %rbx,%rax
    1058:	48 85 c0             	test   %rax,%rax
    105b:	0f 84 90 01 00 00    	je     11f1 <iov_iter_get_pages+0x2e1>
    1061:	48 c7 c0 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rax
    1068:	eb 9c                	jmp    1006 <iov_iter_get_pages+0xf6>
    106a:	31 c0                	xor    %eax,%eax
    106c:	eb 98                	jmp    1006 <iov_iter_get_pages+0xf6>
    106e:	31 c0                	xor    %eax,%eax
    1070:	48 85 db             	test   %rbx,%rbx
    1073:	74 91                	je     1006 <iov_iter_get_pages+0xf6>
    1075:	89 4d c4             	mov    %ecx,-0x3c(%rbp)
    1078:	e8 33 f0 ff ff       	callq  b0 <sanity>
    107d:	84 c0                	test   %al,%al
    107f:	8b 4d c4             	mov    -0x3c(%rbp),%ecx
    1082:	74 dd                	je     1061 <iov_iter_get_pages+0x151>
    1084:	49 8b 54 24 08       	mov    0x8(%r12),%rdx
    1089:	41 8b 7c 24 20       	mov    0x20(%r12),%edi
    108e:	48 85 d2             	test   %rdx,%rdx
    1091:	74 34                	je     10c7 <iov_iter_get_pages+0x1b7>
    1093:	49 8b 74 24 18       	mov    0x18(%r12),%rsi
    1098:	8b 46 5c             	mov    0x5c(%rsi),%eax
    109b:	4c 8b 86 90 00 00 00 	mov    0x90(%rsi),%r8
    10a2:	83 e8 01             	sub    $0x1,%eax
    10a5:	21 f8                	and    %edi,%eax
    10a7:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    10ab:	49 8d 04 c0          	lea    (%r8,%rax,8),%rax
    10af:	48 81 78 10 00 00 00 	cmpq   $0x0,0x10(%rax)
    10b6:	00 
    10b7:	75 09                	jne    10c2 <iov_iter_get_pages+0x1b2>
    10b9:	48 81 fa 00 10 00 00 	cmp    $0x1000,%rdx
    10c0:	75 05                	jne    10c7 <iov_iter_get_pages+0x1b7>
    10c2:	83 c7 01             	add    $0x1,%edi
    10c5:	31 d2                	xor    %edx,%edx
    10c7:	49 89 16             	mov    %rdx,(%r14)
    10ca:	4d 8b 7c 24 18       	mov    0x18(%r12),%r15
    10cf:	89 f8                	mov    %edi,%eax
    10d1:	41 8b 77 58          	mov    0x58(%r15),%esi
    10d5:	41 2b 47 54          	sub    0x54(%r15),%eax
    10d9:	45 8b 47 5c          	mov    0x5c(%r15),%r8d
    10dd:	39 c6                	cmp    %eax,%esi
    10df:	0f 87 2e 01 00 00    	ja     1213 <iov_iter_get_pages+0x303>
    10e5:	31 f6                	xor    %esi,%esi
    10e7:	48 29 d6             	sub    %rdx,%rsi
    10ea:	41 83 e8 01          	sub    $0x1,%r8d
    10ee:	48 8d 55 cc          	lea    -0x34(%rbp),%rdx
    10f2:	48 39 de             	cmp    %rbx,%rsi
    10f5:	89 7d cc             	mov    %edi,-0x34(%rbp)
    10f8:	4c 89 f1             	mov    %r14,%rcx
    10fb:	48 0f 47 f3          	cmova  %rbx,%rsi
    10ff:	4c 89 e7             	mov    %r12,%rdi
    1102:	44 89 45 c4          	mov    %r8d,-0x3c(%rbp)
    1106:	e8 85 f1 ff ff       	callq  290 <push_pipe>
    110b:	48 85 c0             	test   %rax,%rax
    110e:	0f 84 4d ff ff ff    	je     1061 <iov_iter_get_pages+0x151>
    1114:	49 8b 0e             	mov    (%r14),%rcx
    1117:	48 01 c1             	add    %rax,%rcx
    111a:	48 85 c9             	test   %rcx,%rcx
    111d:	0f 8e e3 fe ff ff    	jle    1006 <iov_iter_get_pages+0xf6>
    1123:	48 83 e9 01          	sub    $0x1,%rcx
    1127:	8b 55 cc             	mov    -0x34(%rbp),%edx
    112a:	44 8b 45 c4          	mov    -0x3c(%rbp),%r8d
    112e:	48 c1 e9 0c          	shr    $0xc,%rcx
    1132:	49 8d 7c cd 08       	lea    0x8(%r13,%rcx,8),%rdi
    1137:	49 8b 8f 90 00 00 00 	mov    0x90(%r15),%rcx
    113e:	44 21 c2             	and    %r8d,%edx
    1141:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
    1145:	48 8d 14 d1          	lea    (%rcx,%rdx,8),%rdx
    1149:	48 8b 12             	mov    (%rdx),%rdx
    114c:	49 89 55 00          	mov    %rdx,0x0(%r13)
    1150:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
    1154:	48 8d 71 ff          	lea    -0x1(%rcx),%rsi
    1158:	83 e1 01             	and    $0x1,%ecx
    115b:	48 0f 45 d6          	cmovne %rsi,%rdx
    115f:	f0 ff 42 34          	lock incl 0x34(%rdx)
    1163:	8b 75 cc             	mov    -0x34(%rbp),%esi
    1166:	49 83 c5 08          	add    $0x8,%r13
    116a:	4c 39 ef             	cmp    %r13,%rdi
    116d:	8d 56 01             	lea    0x1(%rsi),%edx
    1170:	89 55 cc             	mov    %edx,-0x34(%rbp)
    1173:	75 c2                	jne    1137 <iov_iter_get_pages+0x227>
    1175:	e9 8c fe ff ff       	jmpq   1006 <iov_iter_get_pages+0xf6>
    117a:	85 db                	test   %ebx,%ebx
    117c:	41 89 d8             	mov    %ebx,%r8d
    117f:	0f 84 e5 fe ff ff    	je     106a <iov_iter_get_pages+0x15a>
    1185:	49 8b 74 24 18       	mov    0x18(%r12),%rsi
    118a:	45 31 c9             	xor    %r9d,%r9d
    118d:	41 bb 00 10 00 00    	mov    $0x1000,%r11d
    1193:	8b 56 0c             	mov    0xc(%rsi),%edx
    1196:	48 8b 0e             	mov    (%rsi),%rcx
    1199:	44 8b 66 08          	mov    0x8(%rsi),%r12d
    119d:	01 fa                	add    %edi,%edx
    119f:	44 89 e0             	mov    %r12d,%eax
    11a2:	41 89 d2             	mov    %edx,%r10d
    11a5:	44 89 db             	mov    %r11d,%ebx
    11a8:	29 f8                	sub    %edi,%eax
    11aa:	41 81 e2 ff 0f 00 00 	and    $0xfff,%r10d
    11b1:	44 39 c0             	cmp    %r8d,%eax
    11b4:	49 0f 47 c0          	cmova  %r8,%rax
    11b8:	44 29 d3             	sub    %r10d,%ebx
    11bb:	39 d8                	cmp    %ebx,%eax
    11bd:	48 0f 47 c3          	cmova  %rbx,%rax
    11c1:	85 c0                	test   %eax,%eax
    11c3:	74 6c                	je     1231 <iov_iter_get_pages+0x321>
    11c5:	c1 ea 0c             	shr    $0xc,%edx
    11c8:	44 89 d6             	mov    %r10d,%esi
    11cb:	48 c1 e2 06          	shl    $0x6,%rdx
    11cf:	49 89 36             	mov    %rsi,(%r14)
    11d2:	48 01 ca             	add    %rcx,%rdx
    11d5:	49 89 55 00          	mov    %rdx,0x0(%r13)
    11d9:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
    11dd:	48 8d 71 ff          	lea    -0x1(%rcx),%rsi
    11e1:	83 e1 01             	and    $0x1,%ecx
    11e4:	48 0f 45 d6          	cmovne %rsi,%rdx
    11e8:	f0 ff 42 34          	lock incl 0x34(%rdx)
    11ec:	e9 15 fe ff ff       	jmpq   1006 <iov_iter_get_pages+0xf6>
    11f1:	48 83 c2 10          	add    $0x10,%rdx
    11f5:	48 89 d8             	mov    %rbx,%rax
    11f8:	48 39 5a 08          	cmp    %rbx,0x8(%rdx)
    11fc:	48 0f 46 42 08       	cmovbe 0x8(%rdx),%rax
    1201:	48 85 c0             	test   %rax,%rax
    1204:	0f 85 57 fe ff ff    	jne    1061 <iov_iter_get_pages+0x151>
    120a:	eb e5                	jmp    11f1 <iov_iter_get_pages+0x2e1>
    120c:	48 98                	cltq   
    120e:	e9 f3 fd ff ff       	jmpq   1006 <iov_iter_get_pages+0xf6>
    1213:	45 89 c3             	mov    %r8d,%r11d
    1216:	41 29 c3             	sub    %eax,%r11d
    1219:	39 f1                	cmp    %esi,%ecx
    121b:	44 89 d8             	mov    %r11d,%eax
    121e:	48 0f 46 f1          	cmovbe %rcx,%rsi
    1222:	39 f0                	cmp    %esi,%eax
    1224:	48 0f 46 f0          	cmovbe %rax,%rsi
    1228:	48 c1 e6 0c          	shl    $0xc,%rsi
    122c:	e9 b6 fe ff ff       	jmpq   10e7 <iov_iter_get_pages+0x1d7>
    1231:	85 ff                	test   %edi,%edi
    1233:	0f 84 66 ff ff ff    	je     119f <iov_iter_get_pages+0x28f>
    1239:	44 39 e7             	cmp    %r12d,%edi
    123c:	73 0a                	jae    1248 <iov_iter_get_pages+0x338>
    123e:	e9 5c ff ff ff       	jmpq   119f <iov_iter_get_pages+0x28f>
    1243:	44 39 e7             	cmp    %r12d,%edi
    1246:	72 24                	jb     126c <iov_iter_get_pages+0x35c>
    1248:	41 8d 41 01          	lea    0x1(%r9),%eax
    124c:	44 29 e7             	sub    %r12d,%edi
    124f:	49 89 c1             	mov    %rax,%r9
    1252:	48 c1 e0 04          	shl    $0x4,%rax
    1256:	48 01 f0             	add    %rsi,%rax
    1259:	85 ff                	test   %edi,%edi
    125b:	44 8b 60 08          	mov    0x8(%rax),%r12d
    125f:	75 e2                	jne    1243 <iov_iter_get_pages+0x333>
    1261:	48 8b 08             	mov    (%rax),%rcx
    1264:	8b 50 0c             	mov    0xc(%rax),%edx
    1267:	e9 33 ff ff ff       	jmpq   119f <iov_iter_get_pages+0x28f>
    126c:	8b 50 0c             	mov    0xc(%rax),%edx
    126f:	48 8b 08             	mov    (%rax),%rcx
    1272:	01 fa                	add    %edi,%edx
    1274:	e9 26 ff ff ff       	jmpq   119f <iov_iter_get_pages+0x28f>
    1279:	e8 00 00 00 00       	callq  127e <iov_iter_get_pages+0x36e>
    127e:	66 90                	xchg   %ax,%ax

0000000000001280 <iov_iter_alignment>:
    1280:	55                   	push   %rbp
    1281:	48 89 e5             	mov    %rsp,%rbp
    1284:	41 54                	push   %r12
    1286:	53                   	push   %rbx
    1287:	48 83 ec 08          	sub    $0x8,%rsp
    128b:	8b 07                	mov    (%rdi),%eax
    128d:	48 8b 77 10          	mov    0x10(%rdi),%rsi
    1291:	89 c2                	mov    %eax,%edx
    1293:	83 e2 fe             	and    $0xfffffffe,%edx
    1296:	83 fa 20             	cmp    $0x20,%edx
    1299:	74 7a                	je     1315 <iov_iter_alignment+0x95>
    129b:	48 85 f6             	test   %rsi,%rsi
    129e:	74 6a                	je     130a <iov_iter_alignment+0x8a>
    12a0:	a8 10                	test   $0x10,%al
    12a2:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    12a6:	0f 85 a7 00 00 00    	jne    1353 <iov_iter_alignment+0xd3>
    12ac:	a8 08                	test   $0x8,%al
    12ae:	0f 85 1d 01 00 00    	jne    13d1 <iov_iter_alignment+0x151>
    12b4:	a8 40                	test   $0x40,%al
    12b6:	75 52                	jne    130a <iov_iter_alignment+0x8a>
    12b8:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
    12bc:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
    12c0:	48 29 d1             	sub    %rdx,%rcx
    12c3:	48 39 f1             	cmp    %rsi,%rcx
    12c6:	48 0f 47 ce          	cmova  %rsi,%rcx
    12ca:	48 85 c9             	test   %rcx,%rcx
    12cd:	74 17                	je     12e6 <iov_iter_alignment+0x66>
    12cf:	48 8b 07             	mov    (%rdi),%rax
    12d2:	48 01 d0             	add    %rdx,%rax
    12d5:	48 09 c8             	or     %rcx,%rax
    12d8:	48 29 ce             	sub    %rcx,%rsi
    12db:	75 0b                	jne    12e8 <iov_iter_alignment+0x68>
    12dd:	48 83 c4 08          	add    $0x8,%rsp
    12e1:	5b                   	pop    %rbx
    12e2:	41 5c                	pop    %r12
    12e4:	5d                   	pop    %rbp
    12e5:	c3                   	retq   
    12e6:	31 c0                	xor    %eax,%eax
    12e8:	48 83 c7 10          	add    $0x10,%rdi
    12ec:	48 89 f1             	mov    %rsi,%rcx
    12ef:	48 39 77 08          	cmp    %rsi,0x8(%rdi)
    12f3:	48 0f 46 4f 08       	cmovbe 0x8(%rdi),%rcx
    12f8:	48 85 c9             	test   %rcx,%rcx
    12fb:	74 eb                	je     12e8 <iov_iter_alignment+0x68>
    12fd:	48 0b 07             	or     (%rdi),%rax
    1300:	48 09 c8             	or     %rcx,%rax
    1303:	48 29 ce             	sub    %rcx,%rsi
    1306:	74 d5                	je     12dd <iov_iter_alignment+0x5d>
    1308:	eb de                	jmp    12e8 <iov_iter_alignment+0x68>
    130a:	48 83 c4 08          	add    $0x8,%rsp
    130e:	31 c0                	xor    %eax,%eax
    1310:	5b                   	pop    %rbx
    1311:	41 5c                	pop    %r12
    1313:	5d                   	pop    %rbp
    1314:	c3                   	retq   
    1315:	31 c0                	xor    %eax,%eax
    1317:	48 85 f6             	test   %rsi,%rsi
    131a:	74 c1                	je     12dd <iov_iter_alignment+0x5d>
    131c:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
    1320:	48 89 f0             	mov    %rsi,%rax
    1323:	48 85 c9             	test   %rcx,%rcx
    1326:	74 b5                	je     12dd <iov_iter_alignment+0x5d>
    1328:	48 8b 77 18          	mov    0x18(%rdi),%rsi
    132c:	8b 5e 5c             	mov    0x5c(%rsi),%ebx
    132f:	8d 53 ff             	lea    -0x1(%rbx),%edx
    1332:	23 57 20             	and    0x20(%rdi),%edx
    1335:	48 8b be 90 00 00 00 	mov    0x90(%rsi),%rdi
    133c:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
    1340:	48 8d 14 d7          	lea    (%rdi,%rdx,8),%rdx
    1344:	48 81 7a 10 00 00 00 	cmpq   $0x0,0x10(%rdx)
    134b:	00 
    134c:	75 8f                	jne    12dd <iov_iter_alignment+0x5d>
    134e:	48 09 c8             	or     %rcx,%rax
    1351:	eb 8a                	jmp    12dd <iov_iter_alignment+0x5d>
    1353:	41 89 f0             	mov    %esi,%r8d
    1356:	31 c0                	xor    %eax,%eax
    1358:	31 f6                	xor    %esi,%esi
    135a:	41 bb 00 10 00 00    	mov    $0x1000,%r11d
    1360:	45 85 c0             	test   %r8d,%r8d
    1363:	0f 84 74 ff ff ff    	je     12dd <iov_iter_alignment+0x5d>
    1369:	4c 8b 57 18          	mov    0x18(%rdi),%r10
    136d:	41 89 f1             	mov    %esi,%r9d
    1370:	45 89 dc             	mov    %r11d,%r12d
    1373:	49 c1 e1 04          	shl    $0x4,%r9
    1377:	4d 01 d1             	add    %r10,%r9
    137a:	41 8b 49 08          	mov    0x8(%r9),%ecx
    137e:	41 8b 59 0c          	mov    0xc(%r9),%ebx
    1382:	41 89 c9             	mov    %ecx,%r9d
    1385:	01 d3                	add    %edx,%ebx
    1387:	41 29 d1             	sub    %edx,%r9d
    138a:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
    1390:	45 39 c1             	cmp    %r8d,%r9d
    1393:	45 0f 47 c8          	cmova  %r8d,%r9d
    1397:	41 29 dc             	sub    %ebx,%r12d
    139a:	45 39 e1             	cmp    %r12d,%r9d
    139d:	45 0f 47 cc          	cmova  %r12d,%r9d
    13a1:	45 85 c9             	test   %r9d,%r9d
    13a4:	74 0b                	je     13b1 <iov_iter_alignment+0x131>
    13a6:	44 09 cb             	or     %r9d,%ebx
    13a9:	48 09 d8             	or     %rbx,%rax
    13ac:	45 39 c8             	cmp    %r9d,%r8d
    13af:	72 6f                	jb     1420 <iov_iter_alignment+0x1a0>
    13b1:	45 29 c8             	sub    %r9d,%r8d
    13b4:	44 01 ca             	add    %r9d,%edx
    13b7:	74 a7                	je     1360 <iov_iter_alignment+0xe0>
    13b9:	39 d1                	cmp    %edx,%ecx
    13bb:	77 a3                	ja     1360 <iov_iter_alignment+0xe0>
    13bd:	83 c6 01             	add    $0x1,%esi
    13c0:	29 ca                	sub    %ecx,%edx
    13c2:	74 9c                	je     1360 <iov_iter_alignment+0xe0>
    13c4:	89 f1                	mov    %esi,%ecx
    13c6:	48 c1 e1 04          	shl    $0x4,%rcx
    13ca:	41 8b 4c 0a 08       	mov    0x8(%r10,%rcx,1),%ecx
    13cf:	eb e8                	jmp    13b9 <iov_iter_alignment+0x139>
    13d1:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
    13d5:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
    13d9:	48 29 d1             	sub    %rdx,%rcx
    13dc:	48 39 f1             	cmp    %rsi,%rcx
    13df:	48 0f 47 ce          	cmova  %rsi,%rcx
    13e3:	48 85 c9             	test   %rcx,%rcx
    13e6:	74 67                	je     144f <iov_iter_alignment+0x1cf>
    13e8:	48 8b 07             	mov    (%rdi),%rax
    13eb:	48 01 d0             	add    %rdx,%rax
    13ee:	48 09 c8             	or     %rcx,%rax
    13f1:	48 29 ce             	sub    %rcx,%rsi
    13f4:	0f 84 e3 fe ff ff    	je     12dd <iov_iter_alignment+0x5d>
    13fa:	48 83 c7 10          	add    $0x10,%rdi
    13fe:	48 89 f1             	mov    %rsi,%rcx
    1401:	48 39 77 08          	cmp    %rsi,0x8(%rdi)
    1405:	48 0f 46 4f 08       	cmovbe 0x8(%rdi),%rcx
    140a:	48 85 c9             	test   %rcx,%rcx
    140d:	74 eb                	je     13fa <iov_iter_alignment+0x17a>
    140f:	48 0b 07             	or     (%rdi),%rax
    1412:	48 09 c8             	or     %rcx,%rax
    1415:	48 29 ce             	sub    %rcx,%rsi
    1418:	0f 84 bf fe ff ff    	je     12dd <iov_iter_alignment+0x5d>
    141e:	eb da                	jmp    13fa <iov_iter_alignment+0x17a>
    1420:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1427 <iov_iter_alignment+0x1a7>
    1427:	0f 85 b0 fe ff ff    	jne    12dd <iov_iter_alignment+0x5d>
    142d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    1434:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1438:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 143f <iov_iter_alignment+0x1bf>
    143f:	e8 00 00 00 00       	callq  1444 <iov_iter_alignment+0x1c4>
    1444:	0f 0b                	ud2    
    1446:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    144a:	e9 8e fe ff ff       	jmpq   12dd <iov_iter_alignment+0x5d>
    144f:	31 c0                	xor    %eax,%eax
    1451:	eb a7                	jmp    13fa <iov_iter_alignment+0x17a>
    1453:	0f 1f 00             	nopl   (%rax)
    1456:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    145d:	00 00 00 

0000000000001460 <iov_iter_gap_alignment>:
    1460:	55                   	push   %rbp
    1461:	48 89 e5             	mov    %rsp,%rbp
    1464:	41 55                	push   %r13
    1466:	41 54                	push   %r12
    1468:	53                   	push   %rbx
    1469:	48 83 ec 08          	sub    $0x8,%rsp
    146d:	8b 0f                	mov    (%rdi),%ecx
    146f:	89 c8                	mov    %ecx,%eax
    1471:	83 e0 fe             	and    $0xfffffffe,%eax
    1474:	83 e8 20             	sub    $0x20,%eax
    1477:	83 e0 de             	and    $0xffffffde,%eax
    147a:	0f 84 9c 00 00 00    	je     151c <iov_iter_gap_alignment+0xbc>
    1480:	4c 8b 47 10          	mov    0x10(%rdi),%r8
    1484:	4d 85 c0             	test   %r8,%r8
    1487:	0f 84 a1 00 00 00    	je     152e <iov_iter_gap_alignment+0xce>
    148d:	f6 c1 10             	test   $0x10,%cl
    1490:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    1494:	0f 85 a1 00 00 00    	jne    153b <iov_iter_gap_alignment+0xdb>
    149a:	f6 c1 08             	test   $0x8,%cl
    149d:	0f 85 2b 01 00 00    	jne    15ce <iov_iter_gap_alignment+0x16e>
    14a3:	83 e1 40             	and    $0x40,%ecx
    14a6:	0f 85 82 00 00 00    	jne    152e <iov_iter_gap_alignment+0xce>
    14ac:	48 8b 4f 18          	mov    0x18(%rdi),%rcx
    14b0:	48 8b 41 08          	mov    0x8(%rcx),%rax
    14b4:	48 29 d0             	sub    %rdx,%rax
    14b7:	49 39 c0             	cmp    %rax,%r8
    14ba:	48 89 c2             	mov    %rax,%rdx
    14bd:	49 0f 46 d0          	cmovbe %r8,%rdx
    14c1:	48 85 d2             	test   %rdx,%rdx
    14c4:	74 1c                	je     14e2 <iov_iter_gap_alignment+0x82>
    14c6:	49 39 c0             	cmp    %rax,%r8
    14c9:	b8 00 00 00 00       	mov    $0x0,%eax
    14ce:	49 0f 47 c0          	cmova  %r8,%rax
    14d2:	49 29 d0             	sub    %rdx,%r8
    14d5:	75 0d                	jne    14e4 <iov_iter_gap_alignment+0x84>
    14d7:	48 83 c4 08          	add    $0x8,%rsp
    14db:	5b                   	pop    %rbx
    14dc:	41 5c                	pop    %r12
    14de:	41 5d                	pop    %r13
    14e0:	5d                   	pop    %rbp
    14e1:	c3                   	retq   
    14e2:	31 c0                	xor    %eax,%eax
    14e4:	48 83 c1 10          	add    $0x10,%rcx
    14e8:	48 8b 51 08          	mov    0x8(%rcx),%rdx
    14ec:	49 39 d0             	cmp    %rdx,%r8
    14ef:	48 89 d6             	mov    %rdx,%rsi
    14f2:	49 0f 46 f0          	cmovbe %r8,%rsi
    14f6:	48 85 f6             	test   %rsi,%rsi
    14f9:	74 e9                	je     14e4 <iov_iter_gap_alignment+0x84>
    14fb:	48 8b 39             	mov    (%rcx),%rdi
    14fe:	48 09 c7             	or     %rax,%rdi
    1501:	48 85 c0             	test   %rax,%rax
    1504:	48 0f 45 c7          	cmovne %rdi,%rax
    1508:	48 89 c7             	mov    %rax,%rdi
    150b:	4c 09 c7             	or     %r8,%rdi
    150e:	49 39 d0             	cmp    %rdx,%r8
    1511:	48 0f 47 c7          	cmova  %rdi,%rax
    1515:	49 29 f0             	sub    %rsi,%r8
    1518:	74 bd                	je     14d7 <iov_iter_gap_alignment+0x77>
    151a:	eb c8                	jmp    14e4 <iov_iter_gap_alignment+0x84>
    151c:	0f 0b                	ud2    
    151e:	48 83 c4 08          	add    $0x8,%rsp
    1522:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1527:	5b                   	pop    %rbx
    1528:	41 5c                	pop    %r12
    152a:	41 5d                	pop    %r13
    152c:	5d                   	pop    %rbp
    152d:	c3                   	retq   
    152e:	48 83 c4 08          	add    $0x8,%rsp
    1532:	31 c0                	xor    %eax,%eax
    1534:	5b                   	pop    %rbx
    1535:	41 5c                	pop    %r12
    1537:	41 5d                	pop    %r13
    1539:	5d                   	pop    %rbp
    153a:	c3                   	retq   
    153b:	44 89 c3             	mov    %r8d,%ebx
    153e:	31 f6                	xor    %esi,%esi
    1540:	31 c0                	xor    %eax,%eax
    1542:	41 bc 00 10 00 00    	mov    $0x1000,%r12d
    1548:	85 db                	test   %ebx,%ebx
    154a:	74 8b                	je     14d7 <iov_iter_gap_alignment+0x77>
    154c:	4c 8b 5f 18          	mov    0x18(%rdi),%r11
    1550:	41 89 f1             	mov    %esi,%r9d
    1553:	45 89 e5             	mov    %r12d,%r13d
    1556:	49 c1 e1 04          	shl    $0x4,%r9
    155a:	4d 01 d9             	add    %r11,%r9
    155d:	41 8b 49 08          	mov    0x8(%r9),%ecx
    1561:	45 8b 51 0c          	mov    0xc(%r9),%r10d
    1565:	41 89 c9             	mov    %ecx,%r9d
    1568:	41 01 d2             	add    %edx,%r10d
    156b:	41 29 d1             	sub    %edx,%r9d
    156e:	41 81 e2 ff 0f 00 00 	and    $0xfff,%r10d
    1575:	41 39 d9             	cmp    %ebx,%r9d
    1578:	44 0f 47 cb          	cmova  %ebx,%r9d
    157c:	45 29 d5             	sub    %r10d,%r13d
    157f:	45 39 e9             	cmp    %r13d,%r9d
    1582:	45 0f 47 cd          	cmova  %r13d,%r9d
    1586:	45 85 c9             	test   %r9d,%r9d
    1589:	74 23                	je     15ae <iov_iter_gap_alignment+0x14e>
    158b:	49 09 c2             	or     %rax,%r10
    158e:	48 85 c0             	test   %rax,%rax
    1591:	49 0f 45 c2          	cmovne %r10,%rax
    1595:	45 89 ca             	mov    %r9d,%r10d
    1598:	49 89 c5             	mov    %rax,%r13
    159b:	4d 09 c5             	or     %r8,%r13
    159e:	4d 39 c2             	cmp    %r8,%r10
    15a1:	49 0f 45 c5          	cmovne %r13,%rax
    15a5:	44 39 cb             	cmp    %r9d,%ebx
    15a8:	0f 82 8f 00 00 00    	jb     163d <iov_iter_gap_alignment+0x1dd>
    15ae:	44 29 cb             	sub    %r9d,%ebx
    15b1:	44 01 ca             	add    %r9d,%edx
    15b4:	74 92                	je     1548 <iov_iter_gap_alignment+0xe8>
    15b6:	39 d1                	cmp    %edx,%ecx
    15b8:	77 8e                	ja     1548 <iov_iter_gap_alignment+0xe8>
    15ba:	83 c6 01             	add    $0x1,%esi
    15bd:	29 ca                	sub    %ecx,%edx
    15bf:	74 87                	je     1548 <iov_iter_gap_alignment+0xe8>
    15c1:	89 f1                	mov    %esi,%ecx
    15c3:	48 c1 e1 04          	shl    $0x4,%rcx
    15c7:	41 8b 4c 0b 08       	mov    0x8(%r11,%rcx,1),%ecx
    15cc:	eb e8                	jmp    15b6 <iov_iter_gap_alignment+0x156>
    15ce:	48 8b 4f 18          	mov    0x18(%rdi),%rcx
    15d2:	48 8b 41 08          	mov    0x8(%rcx),%rax
    15d6:	48 29 d0             	sub    %rdx,%rax
    15d9:	49 39 c0             	cmp    %rax,%r8
    15dc:	48 89 c2             	mov    %rax,%rdx
    15df:	49 0f 46 d0          	cmovbe %r8,%rdx
    15e3:	48 85 d2             	test   %rdx,%rdx
    15e6:	0f 84 80 00 00 00    	je     166c <iov_iter_gap_alignment+0x20c>
    15ec:	49 39 c0             	cmp    %rax,%r8
    15ef:	b8 00 00 00 00       	mov    $0x0,%eax
    15f4:	49 0f 47 c0          	cmova  %r8,%rax
    15f8:	49 29 d0             	sub    %rdx,%r8
    15fb:	0f 84 d6 fe ff ff    	je     14d7 <iov_iter_gap_alignment+0x77>
    1601:	48 83 c1 10          	add    $0x10,%rcx
    1605:	48 8b 71 08          	mov    0x8(%rcx),%rsi
    1609:	49 39 f0             	cmp    %rsi,%r8
    160c:	48 89 f2             	mov    %rsi,%rdx
    160f:	49 0f 46 d0          	cmovbe %r8,%rdx
    1613:	48 85 d2             	test   %rdx,%rdx
    1616:	74 e9                	je     1601 <iov_iter_gap_alignment+0x1a1>
    1618:	48 8b 39             	mov    (%rcx),%rdi
    161b:	48 09 c7             	or     %rax,%rdi
    161e:	48 85 c0             	test   %rax,%rax
    1621:	48 0f 45 c7          	cmovne %rdi,%rax
    1625:	48 89 c7             	mov    %rax,%rdi
    1628:	4c 09 c7             	or     %r8,%rdi
    162b:	49 39 f0             	cmp    %rsi,%r8
    162e:	48 0f 47 c7          	cmova  %rdi,%rax
    1632:	49 29 d0             	sub    %rdx,%r8
    1635:	0f 84 9c fe ff ff    	je     14d7 <iov_iter_gap_alignment+0x77>
    163b:	eb c4                	jmp    1601 <iov_iter_gap_alignment+0x1a1>
    163d:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1644 <iov_iter_gap_alignment+0x1e4>
    1644:	0f 85 8d fe ff ff    	jne    14d7 <iov_iter_gap_alignment+0x77>
    164a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    1651:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1655:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 165c <iov_iter_gap_alignment+0x1fc>
    165c:	e8 00 00 00 00       	callq  1661 <iov_iter_gap_alignment+0x201>
    1661:	0f 0b                	ud2    
    1663:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1667:	e9 6b fe ff ff       	jmpq   14d7 <iov_iter_gap_alignment+0x77>
    166c:	31 c0                	xor    %eax,%eax
    166e:	eb 91                	jmp    1601 <iov_iter_gap_alignment+0x1a1>

0000000000001670 <iov_iter_for_each_range>:
    1670:	55                   	push   %rbp
    1671:	48 89 e5             	mov    %rsp,%rbp
    1674:	41 57                	push   %r15
    1676:	41 56                	push   %r14
    1678:	41 55                	push   %r13
    167a:	41 54                	push   %r12
    167c:	53                   	push   %rbx
    167d:	48 83 ec 48          	sub    $0x48,%rsp
    1681:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    1688:	00 00 
    168a:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    168e:	31 c0                	xor    %eax,%eax
    1690:	48 85 f6             	test   %rsi,%rsi
    1693:	74 4d                	je     16e2 <iov_iter_for_each_range+0x72>
    1695:	49 89 f7             	mov    %rsi,%r15
    1698:	8b 37                	mov    (%rdi),%esi
    169a:	45 31 e4             	xor    %r12d,%r12d
    169d:	49 89 fd             	mov    %rdi,%r13
    16a0:	48 8b 5f 08          	mov    0x8(%rdi),%rbx
    16a4:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    16a9:	40 f6 c6 10          	test   $0x10,%sil
    16ad:	0f 85 0a 01 00 00    	jne    17bd <iov_iter_for_each_range+0x14d>
    16b3:	40 f6 c6 08          	test   $0x8,%sil
    16b7:	0f 85 72 01 00 00    	jne    182f <iov_iter_for_each_range+0x1bf>
    16bd:	83 e6 40             	and    $0x40,%esi
    16c0:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    16c5:	75 1b                	jne    16e2 <iov_iter_for_each_range+0x72>
    16c7:	48 8b 4f 18          	mov    0x18(%rdi),%rcx
    16cb:	48 8b 51 08          	mov    0x8(%rcx),%rdx
    16cf:	48 29 da             	sub    %rbx,%rdx
    16d2:	4c 39 fa             	cmp    %r15,%rdx
    16d5:	49 0f 47 d7          	cmova  %r15,%rdx
    16d9:	48 85 d2             	test   %rdx,%rdx
    16dc:	0f 84 2e 01 00 00    	je     1810 <iov_iter_for_each_range+0x1a0>
    16e2:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    16e6:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
    16ed:	00 00 
    16ef:	0f 85 df 01 00 00    	jne    18d4 <iov_iter_for_each_range+0x264>
    16f5:	48 83 c4 48          	add    $0x48,%rsp
    16f9:	5b                   	pop    %rbx
    16fa:	41 5c                	pop    %r12
    16fc:	41 5d                	pop    %r13
    16fe:	41 5e                	pop    %r14
    1700:	41 5f                	pop    %r15
    1702:	5d                   	pop    %rbp
    1703:	c3                   	retq   
    1704:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)
    1708:	4c 89 4d a0          	mov    %r9,-0x60(%rbp)
    170c:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    1710:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
    1714:	44 89 55 b0          	mov    %r10d,-0x50(%rbp)
    1718:	89 7d b8             	mov    %edi,-0x48(%rbp)
    171b:	4d 8b 36             	mov    (%r14),%r14
    171e:	e8 00 00 00 00       	callq  1723 <iov_iter_for_each_range+0xb3>
    1723:	8b 7d b8             	mov    -0x48(%rbp),%edi
    1726:	44 8b 55 b0          	mov    -0x50(%rbp),%r10d
    172a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
    172e:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
    1732:	c1 ef 0c             	shr    $0xc,%edi
    1735:	89 f8                	mov    %edi,%eax
    1737:	48 89 ce             	mov    %rcx,%rsi
    173a:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    173e:	48 c1 e0 06          	shl    $0x6,%rax
    1742:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    1746:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
    174a:	4c 01 f0             	add    %r14,%rax
    174d:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 1754 <iov_iter_for_each_range+0xe4>
    1754:	48 c1 f8 06          	sar    $0x6,%rax
    1758:	48 c1 e0 0c          	shl    $0xc,%rax
    175c:	48 03 05 00 00 00 00 	add    0x0(%rip),%rax        # 1763 <iov_iter_for_each_range+0xf3>
    1763:	49 01 c2             	add    %rax,%r10
    1766:	8b 45 ac             	mov    -0x54(%rbp),%eax
    1769:	4c 89 55 c0          	mov    %r10,-0x40(%rbp)
    176d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    1771:	e8 00 00 00 00       	callq  1776 <iov_iter_for_each_range+0x106>
    1776:	44 8b 45 ac          	mov    -0x54(%rbp),%r8d
    177a:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
    177e:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1782:	4c 8b 4d a0          	mov    -0x60(%rbp),%r9
    1786:	45 39 f8             	cmp    %r15d,%r8d
    1789:	0f 87 12 01 00 00    	ja     18a1 <iov_iter_for_each_range+0x231>
    178f:	49 8b 75 18          	mov    0x18(%r13),%rsi
    1793:	45 29 c7             	sub    %r8d,%r15d
    1796:	44 01 c3             	add    %r8d,%ebx
    1799:	74 22                	je     17bd <iov_iter_for_each_range+0x14d>
    179b:	42 8b 7c 0e 08       	mov    0x8(%rsi,%r9,1),%edi
    17a0:	39 fb                	cmp    %edi,%ebx
    17a2:	73 11                	jae    17b5 <iov_iter_for_each_range+0x145>
    17a4:	eb 17                	jmp    17bd <iov_iter_for_each_range+0x14d>
    17a6:	44 89 e7             	mov    %r12d,%edi
    17a9:	48 c1 e7 04          	shl    $0x4,%rdi
    17ad:	8b 7c 3e 08          	mov    0x8(%rsi,%rdi,1),%edi
    17b1:	39 df                	cmp    %ebx,%edi
    17b3:	77 08                	ja     17bd <iov_iter_for_each_range+0x14d>
    17b5:	41 83 c4 01          	add    $0x1,%r12d
    17b9:	29 fb                	sub    %edi,%ebx
    17bb:	75 e9                	jne    17a6 <iov_iter_for_each_range+0x136>
    17bd:	45 85 ff             	test   %r15d,%r15d
    17c0:	0f 84 1c ff ff ff    	je     16e2 <iov_iter_for_each_range+0x72>
    17c6:	49 8b 75 18          	mov    0x18(%r13),%rsi
    17ca:	45 89 e1             	mov    %r12d,%r9d
    17cd:	49 c1 e1 04          	shl    $0x4,%r9
    17d1:	4e 8d 34 0e          	lea    (%rsi,%r9,1),%r14
    17d5:	41 8b 7e 0c          	mov    0xc(%r14),%edi
    17d9:	45 8b 46 08          	mov    0x8(%r14),%r8d
    17dd:	01 df                	add    %ebx,%edi
    17df:	41 29 d8             	sub    %ebx,%r8d
    17e2:	41 89 fa             	mov    %edi,%r10d
    17e5:	45 89 c3             	mov    %r8d,%r11d
    17e8:	41 81 e2 ff 0f 00 00 	and    $0xfff,%r10d
    17ef:	45 39 f8             	cmp    %r15d,%r8d
    17f2:	41 b8 00 10 00 00    	mov    $0x1000,%r8d
    17f8:	45 0f 47 df          	cmova  %r15d,%r11d
    17fc:	45 29 d0             	sub    %r10d,%r8d
    17ff:	45 39 c3             	cmp    %r8d,%r11d
    1802:	45 0f 46 c3          	cmovbe %r11d,%r8d
    1806:	45 85 c0             	test   %r8d,%r8d
    1809:	74 88                	je     1793 <iov_iter_for_each_range+0x123>
    180b:	e9 f4 fe ff ff       	jmpq   1704 <iov_iter_for_each_range+0x94>
    1810:	48 83 c1 10          	add    $0x10,%rcx
    1814:	4c 89 f8             	mov    %r15,%rax
    1817:	4c 39 79 08          	cmp    %r15,0x8(%rcx)
    181b:	48 0f 46 41 08       	cmovbe 0x8(%rcx),%rax
    1820:	48 85 c0             	test   %rax,%rax
    1823:	74 eb                	je     1810 <iov_iter_for_each_range+0x1a0>
    1825:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    182a:	e9 b3 fe ff ff       	jmpq   16e2 <iov_iter_for_each_range+0x72>
    182f:	4c 8b 6f 18          	mov    0x18(%rdi),%r13
    1833:	4d 8b 65 08          	mov    0x8(%r13),%r12
    1837:	49 29 dc             	sub    %rbx,%r12
    183a:	4d 39 fc             	cmp    %r15,%r12
    183d:	4d 0f 47 e7          	cmova  %r15,%r12
    1841:	4d 85 e4             	test   %r12,%r12
    1844:	0f 84 84 00 00 00    	je     18ce <iov_iter_for_each_range+0x25e>
    184a:	49 03 5d 00          	add    0x0(%r13),%rbx
    184e:	4c 89 65 c8          	mov    %r12,-0x38(%rbp)
    1852:	48 89 5d c0          	mov    %rbx,-0x40(%rbp)
    1856:	48 8d 5d c0          	lea    -0x40(%rbp),%rbx
    185a:	48 89 ce             	mov    %rcx,%rsi
    185d:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    1861:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    1865:	48 89 df             	mov    %rbx,%rdi
    1868:	e8 00 00 00 00       	callq  186d <iov_iter_for_each_range+0x1fd>
    186d:	4d 29 e7             	sub    %r12,%r15
    1870:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
    1874:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1878:	0f 84 64 fe ff ff    	je     16e2 <iov_iter_for_each_range+0x72>
    187e:	49 83 c5 10          	add    $0x10,%r13
    1882:	4d 89 fc             	mov    %r15,%r12
    1885:	4d 39 7d 08          	cmp    %r15,0x8(%r13)
    1889:	4d 0f 46 65 08       	cmovbe 0x8(%r13),%r12
    188e:	4d 85 e4             	test   %r12,%r12
    1891:	74 eb                	je     187e <iov_iter_for_each_range+0x20e>
    1893:	49 8b 45 00          	mov    0x0(%r13),%rax
    1897:	4c 89 65 c8          	mov    %r12,-0x38(%rbp)
    189b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    189f:	eb b9                	jmp    185a <iov_iter_for_each_range+0x1ea>
    18a1:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 18a8 <iov_iter_for_each_range+0x238>
    18a8:	0f 85 34 fe ff ff    	jne    16e2 <iov_iter_for_each_range+0x72>
    18ae:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    18b5:	89 45 b8             	mov    %eax,-0x48(%rbp)
    18b8:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 18bf <iov_iter_for_each_range+0x24f>
    18bf:	e8 00 00 00 00       	callq  18c4 <iov_iter_for_each_range+0x254>
    18c4:	0f 0b                	ud2    
    18c6:	8b 45 b8             	mov    -0x48(%rbp),%eax
    18c9:	e9 14 fe ff ff       	jmpq   16e2 <iov_iter_for_each_range+0x72>
    18ce:	48 8d 5d c0          	lea    -0x40(%rbp),%rbx
    18d2:	eb aa                	jmp    187e <iov_iter_for_each_range+0x20e>
    18d4:	e8 00 00 00 00       	callq  18d9 <iov_iter_for_each_range+0x269>
    18d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000018e0 <iov_iter_npages>:
    18e0:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
    18e4:	48 85 c9             	test   %rcx,%rcx
    18e7:	0f 84 c6 00 00 00    	je     19b3 <iov_iter_npages+0xd3>
    18ed:	8b 07                	mov    (%rdi),%eax
    18ef:	89 c2                	mov    %eax,%edx
    18f1:	83 e2 fe             	and    $0xfffffffe,%edx
    18f4:	83 fa 40             	cmp    $0x40,%edx
    18f7:	0f 84 b6 00 00 00    	je     19b3 <iov_iter_npages+0xd3>
    18fd:	55                   	push   %rbp
    18fe:	48 89 e5             	mov    %rsp,%rbp
    1901:	41 54                	push   %r12
    1903:	53                   	push   %rbx
    1904:	48 89 fb             	mov    %rdi,%rbx
    1907:	48 83 ec 08          	sub    $0x8,%rsp
    190b:	83 fa 20             	cmp    $0x20,%edx
    190e:	0f 84 a2 00 00 00    	je     19b6 <iov_iter_npages+0xd6>
    1914:	a8 10                	test   $0x10,%al
    1916:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    191a:	0f 85 0e 01 00 00    	jne    1a2e <iov_iter_npages+0x14e>
    1920:	a8 08                	test   $0x8,%al
    1922:	0f 85 94 01 00 00    	jne    1abc <iov_iter_npages+0x1dc>
    1928:	a8 40                	test   $0x40,%al
    192a:	75 3f                	jne    196b <iov_iter_npages+0x8b>
    192c:	4c 8b 47 18          	mov    0x18(%rdi),%r8
    1930:	49 8b 78 08          	mov    0x8(%r8),%rdi
    1934:	48 29 d7             	sub    %rdx,%rdi
    1937:	48 39 cf             	cmp    %rcx,%rdi
    193a:	48 0f 47 f9          	cmova  %rcx,%rdi
    193e:	48 85 ff             	test   %rdi,%rdi
    1941:	0f 84 f6 01 00 00    	je     1b3d <iov_iter_npages+0x25d>
    1947:	49 03 10             	add    (%r8),%rdx
    194a:	48 8d 84 17 ff 0f 00 	lea    0xfff(%rdi,%rdx,1),%rax
    1951:	00 
    1952:	48 c1 ea 0c          	shr    $0xc,%rdx
    1956:	48 c1 e8 0c          	shr    $0xc,%rax
    195a:	29 d0                	sub    %edx,%eax
    195c:	39 f0                	cmp    %esi,%eax
    195e:	7c 16                	jl     1976 <iov_iter_npages+0x96>
    1960:	48 83 c4 08          	add    $0x8,%rsp
    1964:	89 f0                	mov    %esi,%eax
    1966:	5b                   	pop    %rbx
    1967:	41 5c                	pop    %r12
    1969:	5d                   	pop    %rbp
    196a:	c3                   	retq   
    196b:	31 c0                	xor    %eax,%eax
    196d:	48 83 c4 08          	add    $0x8,%rsp
    1971:	5b                   	pop    %rbx
    1972:	41 5c                	pop    %r12
    1974:	5d                   	pop    %rbp
    1975:	c3                   	retq   
    1976:	48 29 f9             	sub    %rdi,%rcx
    1979:	74 f2                	je     196d <iov_iter_npages+0x8d>
    197b:	49 83 c0 10          	add    $0x10,%r8
    197f:	48 89 ca             	mov    %rcx,%rdx
    1982:	49 39 48 08          	cmp    %rcx,0x8(%r8)
    1986:	49 0f 46 50 08       	cmovbe 0x8(%r8),%rdx
    198b:	48 85 d2             	test   %rdx,%rdx
    198e:	74 eb                	je     197b <iov_iter_npages+0x9b>
    1990:	49 8b 38             	mov    (%r8),%rdi
    1993:	4c 8d 8c 3a ff 0f 00 	lea    0xfff(%rdx,%rdi,1),%r9
    199a:	00 
    199b:	48 c1 ef 0c          	shr    $0xc,%rdi
    199f:	29 f8                	sub    %edi,%eax
    19a1:	49 c1 e9 0c          	shr    $0xc,%r9
    19a5:	44 01 c8             	add    %r9d,%eax
    19a8:	39 c6                	cmp    %eax,%esi
    19aa:	7e b4                	jle    1960 <iov_iter_npages+0x80>
    19ac:	48 29 d1             	sub    %rdx,%rcx
    19af:	74 bc                	je     196d <iov_iter_npages+0x8d>
    19b1:	eb c8                	jmp    197b <iov_iter_npages+0x9b>
    19b3:	31 c0                	xor    %eax,%eax
    19b5:	c3                   	retq   
    19b6:	89 75 ec             	mov    %esi,-0x14(%rbp)
    19b9:	4c 8b 67 18          	mov    0x18(%rdi),%r12
    19bd:	e8 ee e6 ff ff       	callq  b0 <sanity>
    19c2:	84 c0                	test   %al,%al
    19c4:	74 a5                	je     196b <iov_iter_npages+0x8b>
    19c6:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
    19ca:	8b 43 20             	mov    0x20(%rbx),%eax
    19cd:	8b 75 ec             	mov    -0x14(%rbp),%esi
    19d0:	48 85 c9             	test   %rcx,%rcx
    19d3:	74 31                	je     1a06 <iov_iter_npages+0x126>
    19d5:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
    19d9:	8b 5f 5c             	mov    0x5c(%rdi),%ebx
    19dc:	4c 8b 87 90 00 00 00 	mov    0x90(%rdi),%r8
    19e3:	8d 53 ff             	lea    -0x1(%rbx),%edx
    19e6:	21 c2                	and    %eax,%edx
    19e8:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
    19ec:	49 8d 14 d0          	lea    (%r8,%rdx,8),%rdx
    19f0:	48 81 7a 10 00 00 00 	cmpq   $0x0,0x10(%rdx)
    19f7:	00 
    19f8:	75 09                	jne    1a03 <iov_iter_npages+0x123>
    19fa:	48 81 f9 00 10 00 00 	cmp    $0x1000,%rcx
    1a01:	75 03                	jne    1a06 <iov_iter_npages+0x126>
    1a03:	83 c0 01             	add    $0x1,%eax
    1a06:	41 2b 44 24 54       	sub    0x54(%r12),%eax
    1a0b:	41 8b 4c 24 58       	mov    0x58(%r12),%ecx
    1a10:	89 c2                	mov    %eax,%edx
    1a12:	31 c0                	xor    %eax,%eax
    1a14:	39 d1                	cmp    %edx,%ecx
    1a16:	76 0c                	jbe    1a24 <iov_iter_npages+0x144>
    1a18:	41 8b 44 24 5c       	mov    0x5c(%r12),%eax
    1a1d:	29 d0                	sub    %edx,%eax
    1a1f:	39 c8                	cmp    %ecx,%eax
    1a21:	0f 47 c1             	cmova  %ecx,%eax
    1a24:	39 c6                	cmp    %eax,%esi
    1a26:	0f 4e c6             	cmovle %esi,%eax
    1a29:	e9 3f ff ff ff       	jmpq   196d <iov_iter_npages+0x8d>
    1a2e:	41 89 c9             	mov    %ecx,%r9d
    1a31:	45 31 c0             	xor    %r8d,%r8d
    1a34:	31 c0                	xor    %eax,%eax
    1a36:	41 bb 00 10 00 00    	mov    $0x1000,%r11d
    1a3c:	45 85 c9             	test   %r9d,%r9d
    1a3f:	0f 84 28 ff ff ff    	je     196d <iov_iter_npages+0x8d>
    1a45:	4c 8b 53 18          	mov    0x18(%rbx),%r10
    1a49:	44 89 c7             	mov    %r8d,%edi
    1a4c:	48 c1 e7 04          	shl    $0x4,%rdi
    1a50:	4c 01 d7             	add    %r10,%rdi
    1a53:	44 8b 67 0c          	mov    0xc(%rdi),%r12d
    1a57:	8b 4f 08             	mov    0x8(%rdi),%ecx
    1a5a:	41 01 d4             	add    %edx,%r12d
    1a5d:	44 89 e7             	mov    %r12d,%edi
    1a60:	45 89 dc             	mov    %r11d,%r12d
    1a63:	81 e7 ff 0f 00 00    	and    $0xfff,%edi
    1a69:	41 29 fc             	sub    %edi,%r12d
    1a6c:	44 89 e7             	mov    %r12d,%edi
    1a6f:	41 89 cc             	mov    %ecx,%r12d
    1a72:	41 29 d4             	sub    %edx,%r12d
    1a75:	45 39 cc             	cmp    %r9d,%r12d
    1a78:	45 0f 47 e1          	cmova  %r9d,%r12d
    1a7c:	44 39 e7             	cmp    %r12d,%edi
    1a7f:	41 0f 47 fc          	cmova  %r12d,%edi
    1a83:	85 ff                	test   %edi,%edi
    1a85:	74 14                	je     1a9b <iov_iter_npages+0x1bb>
    1a87:	83 c0 01             	add    $0x1,%eax
    1a8a:	39 c6                	cmp    %eax,%esi
    1a8c:	0f 8e ce fe ff ff    	jle    1960 <iov_iter_npages+0x80>
    1a92:	41 39 f9             	cmp    %edi,%r9d
    1a95:	0f 82 a9 00 00 00    	jb     1b44 <iov_iter_npages+0x264>
    1a9b:	41 29 f9             	sub    %edi,%r9d
    1a9e:	01 fa                	add    %edi,%edx
    1aa0:	74 9a                	je     1a3c <iov_iter_npages+0x15c>
    1aa2:	39 d1                	cmp    %edx,%ecx
    1aa4:	77 96                	ja     1a3c <iov_iter_npages+0x15c>
    1aa6:	41 83 c0 01          	add    $0x1,%r8d
    1aaa:	29 ca                	sub    %ecx,%edx
    1aac:	74 8e                	je     1a3c <iov_iter_npages+0x15c>
    1aae:	44 89 c1             	mov    %r8d,%ecx
    1ab1:	48 c1 e1 04          	shl    $0x4,%rcx
    1ab5:	41 8b 4c 0a 08       	mov    0x8(%r10,%rcx,1),%ecx
    1aba:	eb e6                	jmp    1aa2 <iov_iter_npages+0x1c2>
    1abc:	4c 8b 47 18          	mov    0x18(%rdi),%r8
    1ac0:	49 8b 78 08          	mov    0x8(%r8),%rdi
    1ac4:	48 29 d7             	sub    %rdx,%rdi
    1ac7:	48 39 cf             	cmp    %rcx,%rdi
    1aca:	48 0f 47 f9          	cmova  %rcx,%rdi
    1ace:	48 85 ff             	test   %rdi,%rdi
    1ad1:	0f 84 9a 00 00 00    	je     1b71 <iov_iter_npages+0x291>
    1ad7:	49 03 10             	add    (%r8),%rdx
    1ada:	48 8d 84 17 ff 0f 00 	lea    0xfff(%rdi,%rdx,1),%rax
    1ae1:	00 
    1ae2:	48 c1 ea 0c          	shr    $0xc,%rdx
    1ae6:	48 c1 e8 0c          	shr    $0xc,%rax
    1aea:	29 d0                	sub    %edx,%eax
    1aec:	39 c6                	cmp    %eax,%esi
    1aee:	0f 8e 6c fe ff ff    	jle    1960 <iov_iter_npages+0x80>
    1af4:	48 29 f9             	sub    %rdi,%rcx
    1af7:	0f 84 70 fe ff ff    	je     196d <iov_iter_npages+0x8d>
    1afd:	49 83 c0 10          	add    $0x10,%r8
    1b01:	48 89 ca             	mov    %rcx,%rdx
    1b04:	49 39 48 08          	cmp    %rcx,0x8(%r8)
    1b08:	49 0f 46 50 08       	cmovbe 0x8(%r8),%rdx
    1b0d:	48 85 d2             	test   %rdx,%rdx
    1b10:	74 eb                	je     1afd <iov_iter_npages+0x21d>
    1b12:	49 8b 38             	mov    (%r8),%rdi
    1b15:	4c 8d 8c 3a ff 0f 00 	lea    0xfff(%rdx,%rdi,1),%r9
    1b1c:	00 
    1b1d:	48 c1 ef 0c          	shr    $0xc,%rdi
    1b21:	29 f8                	sub    %edi,%eax
    1b23:	49 c1 e9 0c          	shr    $0xc,%r9
    1b27:	44 01 c8             	add    %r9d,%eax
    1b2a:	39 c6                	cmp    %eax,%esi
    1b2c:	0f 8e 2e fe ff ff    	jle    1960 <iov_iter_npages+0x80>
    1b32:	48 29 d1             	sub    %rdx,%rcx
    1b35:	0f 84 32 fe ff ff    	je     196d <iov_iter_npages+0x8d>
    1b3b:	eb c0                	jmp    1afd <iov_iter_npages+0x21d>
    1b3d:	31 c0                	xor    %eax,%eax
    1b3f:	e9 37 fe ff ff       	jmpq   197b <iov_iter_npages+0x9b>
    1b44:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1b4b <iov_iter_npages+0x26b>
    1b4b:	0f 85 1c fe ff ff    	jne    196d <iov_iter_npages+0x8d>
    1b51:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    1b58:	89 45 ec             	mov    %eax,-0x14(%rbp)
    1b5b:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 1b62 <iov_iter_npages+0x282>
    1b62:	e8 00 00 00 00       	callq  1b67 <iov_iter_npages+0x287>
    1b67:	0f 0b                	ud2    
    1b69:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1b6c:	e9 fc fd ff ff       	jmpq   196d <iov_iter_npages+0x8d>
    1b71:	31 c0                	xor    %eax,%eax
    1b73:	eb 88                	jmp    1afd <iov_iter_npages+0x21d>
    1b75:	90                   	nop
    1b76:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1b7d:	00 00 00 

0000000000001b80 <iov_iter_copy_from_user_atomic>:
    1b80:	55                   	push   %rbp
    1b81:	48 89 e5             	mov    %rsp,%rbp
    1b84:	41 57                	push   %r15
    1b86:	41 56                	push   %r14
    1b88:	41 55                	push   %r13
    1b8a:	41 54                	push   %r12
    1b8c:	49 89 f4             	mov    %rsi,%r12
    1b8f:	53                   	push   %rbx
    1b90:	48 89 cb             	mov    %rcx,%rbx
    1b93:	48 83 ec 08          	sub    $0x8,%rsp
    1b97:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    1b9e:	00 00 
    1ba0:	83 80 80 12 00 00 01 	addl   $0x1,0x1280(%rax)
    1ba7:	48 89 d1             	mov    %rdx,%rcx
    1baa:	48 89 f8             	mov    %rdi,%rax
    1bad:	48 01 d9             	add    %rbx,%rcx
    1bb0:	48 89 ce             	mov    %rcx,%rsi
    1bb3:	0f 82 e4 00 00 00    	jb     1c9d <iov_iter_copy_from_user_atomic+0x11d>
    1bb9:	48 81 f9 00 10 00 00 	cmp    $0x1000,%rcx
    1bc0:	0f 87 d7 00 00 00    	ja     1c9d <iov_iter_copy_from_user_atomic+0x11d>
    1bc6:	41 8b 34 24          	mov    (%r12),%esi
    1bca:	89 f1                	mov    %esi,%ecx
    1bcc:	83 e1 fe             	and    $0xfffffffe,%ecx
    1bcf:	83 e9 20             	sub    $0x20,%ecx
    1bd2:	83 e1 de             	and    $0xffffffde,%ecx
    1bd5:	0f 84 19 02 00 00    	je     1df4 <iov_iter_copy_from_user_atomic+0x274>
    1bdb:	48 85 db             	test   %rbx,%rbx
    1bde:	0f 84 33 02 00 00    	je     1e17 <iov_iter_copy_from_user_atomic+0x297>
    1be4:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 1beb <iov_iter_copy_from_user_atomic+0x6b>
    1beb:	45 31 d2             	xor    %r10d,%r10d
    1bee:	4d 8b 44 24 08       	mov    0x8(%r12),%r8
    1bf3:	41 89 dd             	mov    %ebx,%r13d
    1bf6:	41 be 00 10 00 00    	mov    $0x1000,%r14d
    1bfc:	49 89 c1             	mov    %rax,%r9
    1bff:	49 c1 f9 06          	sar    $0x6,%r9
    1c03:	49 c1 e1 0c          	shl    $0xc,%r9
    1c07:	4c 03 0d 00 00 00 00 	add    0x0(%rip),%r9        # 1c0e <iov_iter_copy_from_user_atomic+0x8e>
    1c0e:	49 01 d1             	add    %rdx,%r9
    1c11:	40 f6 c6 10          	test   $0x10,%sil
    1c15:	0f 85 2e 01 00 00    	jne    1d49 <iov_iter_copy_from_user_atomic+0x1c9>
    1c1b:	40 f6 c6 08          	test   $0x8,%sil
    1c1f:	0f 85 70 01 00 00    	jne    1d95 <iov_iter_copy_from_user_atomic+0x215>
    1c25:	83 e6 40             	and    $0x40,%esi
    1c28:	0f 85 a4 01 00 00    	jne    1dd2 <iov_iter_copy_from_user_atomic+0x252>
    1c2e:	4d 8b 74 24 18       	mov    0x18(%r12),%r14
    1c33:	4d 8b 6e 08          	mov    0x8(%r14),%r13
    1c37:	4d 29 c5             	sub    %r8,%r13
    1c3a:	49 39 dd             	cmp    %rbx,%r13
    1c3d:	4c 0f 47 eb          	cmova  %rbx,%r13
    1c41:	4d 85 ed             	test   %r13,%r13
    1c44:	0f 84 1a 02 00 00    	je     1e64 <iov_iter_copy_from_user_atomic+0x2e4>
    1c4a:	49 8b 36             	mov    (%r14),%rsi
    1c4d:	4c 89 ea             	mov    %r13,%rdx
    1c50:	4c 89 cf             	mov    %r9,%rdi
    1c53:	4f 8d 24 29          	lea    (%r9,%r13,1),%r12
    1c57:	49 89 df             	mov    %rbx,%r15
    1c5a:	4c 01 c6             	add    %r8,%rsi
    1c5d:	e8 4e ef ff ff       	callq  bb0 <copyin>
    1c62:	48 98                	cltq   
    1c64:	49 29 c5             	sub    %rax,%r13
    1c67:	4d 29 ef             	sub    %r13,%r15
    1c6a:	48 85 c0             	test   %rax,%rax
    1c6d:	75 09                	jne    1c78 <iov_iter_copy_from_user_atomic+0xf8>
    1c6f:	4d 85 ff             	test   %r15,%r15
    1c72:	0f 85 a6 01 00 00    	jne    1e1e <iov_iter_copy_from_user_atomic+0x29e>
    1c78:	48 89 d8             	mov    %rbx,%rax
    1c7b:	4c 29 f8             	sub    %r15,%rax
    1c7e:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    1c85:	00 00 
    1c87:	83 aa 80 12 00 00 01 	subl   $0x1,0x1280(%rdx)
    1c8e:	48 83 c4 08          	add    $0x8,%rsp
    1c92:	5b                   	pop    %rbx
    1c93:	41 5c                	pop    %r12
    1c95:	41 5d                	pop    %r13
    1c97:	41 5e                	pop    %r14
    1c99:	41 5f                	pop    %r15
    1c9b:	5d                   	pop    %rbp
    1c9c:	c3                   	retq   
    1c9d:	4c 8b 47 08          	mov    0x8(%rdi),%r8
    1ca1:	41 f6 c0 01          	test   $0x1,%r8b
    1ca5:	0f 85 2f 01 00 00    	jne    1dda <iov_iter_copy_from_user_atomic+0x25a>
    1cab:	48 39 de             	cmp    %rbx,%rsi
    1cae:	72 21                	jb     1cd1 <iov_iter_copy_from_user_atomic+0x151>
    1cb0:	48 8b 0f             	mov    (%rdi),%rcx
    1cb3:	41 b8 00 10 00 00    	mov    $0x1000,%r8d
    1cb9:	f7 c1 00 00 01 00    	test   $0x10000,%ecx
    1cbf:	74 07                	je     1cc8 <iov_iter_copy_from_user_atomic+0x148>
    1cc1:	0f b6 4f 51          	movzbl 0x51(%rdi),%ecx
    1cc5:	49 d3 e0             	shl    %cl,%r8
    1cc8:	4c 39 c6             	cmp    %r8,%rsi
    1ccb:	0f 86 f5 fe ff ff    	jbe    1bc6 <iov_iter_copy_from_user_atomic+0x46>
    1cd1:	0f 0b                	ud2    
    1cd3:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    1cda:	00 00 
    1cdc:	83 a8 80 12 00 00 01 	subl   $0x1,0x1280(%rax)
    1ce3:	48 83 c4 08          	add    $0x8,%rsp
    1ce7:	31 c0                	xor    %eax,%eax
    1ce9:	5b                   	pop    %rbx
    1cea:	41 5c                	pop    %r12
    1cec:	41 5d                	pop    %r13
    1cee:	41 5e                	pop    %r14
    1cf0:	41 5f                	pop    %r15
    1cf2:	5d                   	pop    %rbp
    1cf3:	c3                   	retq   
    1cf4:	c1 ee 0c             	shr    $0xc,%esi
    1cf7:	44 89 d9             	mov    %r11d,%ecx
    1cfa:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1cfe:	48 c1 e6 06          	shl    $0x6,%rsi
    1d02:	48 03 37             	add    (%rdi),%rsi
    1d05:	4c 89 cf             	mov    %r9,%rdi
    1d08:	4d 8d 3c 09          	lea    (%r9,%rcx,1),%r15
    1d0c:	e8 df e6 ff ff       	callq  3f0 <memcpy_from_page>
    1d11:	45 39 eb             	cmp    %r13d,%r11d
    1d14:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1d18:	0f 87 53 01 00 00    	ja     1e71 <iov_iter_copy_from_user_atomic+0x2f1>
    1d1e:	49 8b 4c 24 18       	mov    0x18(%r12),%rcx
    1d23:	4d 89 f9             	mov    %r15,%r9
    1d26:	45 29 dd             	sub    %r11d,%r13d
    1d29:	45 01 d8             	add    %r11d,%r8d
    1d2c:	75 12                	jne    1d40 <iov_iter_copy_from_user_atomic+0x1c0>
    1d2e:	eb 19                	jmp    1d49 <iov_iter_copy_from_user_atomic+0x1c9>
    1d30:	41 83 c2 01          	add    $0x1,%r10d
    1d34:	41 29 c0             	sub    %eax,%r8d
    1d37:	74 10                	je     1d49 <iov_iter_copy_from_user_atomic+0x1c9>
    1d39:	44 89 d0             	mov    %r10d,%eax
    1d3c:	48 c1 e0 04          	shl    $0x4,%rax
    1d40:	8b 44 01 08          	mov    0x8(%rcx,%rax,1),%eax
    1d44:	44 39 c0             	cmp    %r8d,%eax
    1d47:	76 e7                	jbe    1d30 <iov_iter_copy_from_user_atomic+0x1b0>
    1d49:	45 85 ed             	test   %r13d,%r13d
    1d4c:	0f 84 80 00 00 00    	je     1dd2 <iov_iter_copy_from_user_atomic+0x252>
    1d52:	49 8b 4c 24 18       	mov    0x18(%r12),%rcx
    1d57:	44 89 d0             	mov    %r10d,%eax
    1d5a:	45 89 f7             	mov    %r14d,%r15d
    1d5d:	48 c1 e0 04          	shl    $0x4,%rax
    1d61:	48 8d 3c 01          	lea    (%rcx,%rax,1),%rdi
    1d65:	8b 77 0c             	mov    0xc(%rdi),%esi
    1d68:	44 8b 5f 08          	mov    0x8(%rdi),%r11d
    1d6c:	44 01 c6             	add    %r8d,%esi
    1d6f:	45 29 c3             	sub    %r8d,%r11d
    1d72:	89 f2                	mov    %esi,%edx
    1d74:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1d7a:	45 39 eb             	cmp    %r13d,%r11d
    1d7d:	45 0f 47 dd          	cmova  %r13d,%r11d
    1d81:	41 29 d7             	sub    %edx,%r15d
    1d84:	45 39 fb             	cmp    %r15d,%r11d
    1d87:	45 0f 47 df          	cmova  %r15d,%r11d
    1d8b:	45 85 db             	test   %r11d,%r11d
    1d8e:	74 96                	je     1d26 <iov_iter_copy_from_user_atomic+0x1a6>
    1d90:	e9 5f ff ff ff       	jmpq   1cf4 <iov_iter_copy_from_user_atomic+0x174>
    1d95:	4d 8b 6c 24 18       	mov    0x18(%r12),%r13
    1d9a:	4d 8b 65 08          	mov    0x8(%r13),%r12
    1d9e:	4d 29 c4             	sub    %r8,%r12
    1da1:	49 39 dc             	cmp    %rbx,%r12
    1da4:	4c 0f 47 e3          	cmova  %rbx,%r12
    1da8:	4d 85 e4             	test   %r12,%r12
    1dab:	0f 84 e7 00 00 00    	je     1e98 <iov_iter_copy_from_user_atomic+0x318>
    1db1:	49 8b 75 00          	mov    0x0(%r13),%rsi
    1db5:	4c 89 cf             	mov    %r9,%rdi
    1db8:	4c 89 e2             	mov    %r12,%rdx
    1dbb:	49 89 de             	mov    %rbx,%r14
    1dbe:	4c 01 c6             	add    %r8,%rsi
    1dc1:	e8 00 00 00 00       	callq  1dc6 <iov_iter_copy_from_user_atomic+0x246>
    1dc6:	4d 29 e6             	sub    %r12,%r14
    1dc9:	49 89 c1             	mov    %rax,%r9
    1dcc:	0f 85 04 01 00 00    	jne    1ed6 <iov_iter_copy_from_user_atomic+0x356>
    1dd2:	48 89 d8             	mov    %rbx,%rax
    1dd5:	e9 a4 fe ff ff       	jmpq   1c7e <iov_iter_copy_from_user_atomic+0xfe>
    1dda:	49 8d 78 ff          	lea    -0x1(%r8),%rdi
    1dde:	48 89 c6             	mov    %rax,%rsi
    1de1:	48 29 fe             	sub    %rdi,%rsi
    1de4:	48 c1 fe 06          	sar    $0x6,%rsi
    1de8:	48 c1 e6 0c          	shl    $0xc,%rsi
    1dec:	48 01 ce             	add    %rcx,%rsi
    1def:	e9 b7 fe ff ff       	jmpq   1cab <iov_iter_copy_from_user_atomic+0x12b>
    1df4:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    1dfb:	00 00 
    1dfd:	83 a8 80 12 00 00 01 	subl   $0x1,0x1280(%rax)
    1e04:	0f 0b                	ud2    
    1e06:	48 83 c4 08          	add    $0x8,%rsp
    1e0a:	31 c0                	xor    %eax,%eax
    1e0c:	5b                   	pop    %rbx
    1e0d:	41 5c                	pop    %r12
    1e0f:	41 5d                	pop    %r13
    1e11:	41 5e                	pop    %r14
    1e13:	41 5f                	pop    %r15
    1e15:	5d                   	pop    %rbp
    1e16:	c3                   	retq   
    1e17:	31 c0                	xor    %eax,%eax
    1e19:	e9 60 fe ff ff       	jmpq   1c7e <iov_iter_copy_from_user_atomic+0xfe>
    1e1e:	49 83 c6 10          	add    $0x10,%r14
    1e22:	4c 89 f9             	mov    %r15,%rcx
    1e25:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    1e29:	49 0f 46 4e 08       	cmovbe 0x8(%r14),%rcx
    1e2e:	48 85 c9             	test   %rcx,%rcx
    1e31:	74 2a                	je     1e5d <iov_iter_copy_from_user_atomic+0x2dd>
    1e33:	49 8b 36             	mov    (%r14),%rsi
    1e36:	48 89 ca             	mov    %rcx,%rdx
    1e39:	4c 89 e7             	mov    %r12,%rdi
    1e3c:	4d 8d 2c 0c          	lea    (%r12,%rcx,1),%r13
    1e40:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    1e44:	e8 67 ed ff ff       	callq  bb0 <copyin>
    1e49:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    1e4d:	48 98                	cltq   
    1e4f:	4d 89 ec             	mov    %r13,%r12
    1e52:	48 29 c1             	sub    %rax,%rcx
    1e55:	49 29 cf             	sub    %rcx,%r15
    1e58:	e9 0d fe ff ff       	jmpq   1c6a <iov_iter_copy_from_user_atomic+0xea>
    1e5d:	31 c0                	xor    %eax,%eax
    1e5f:	e9 06 fe ff ff       	jmpq   1c6a <iov_iter_copy_from_user_atomic+0xea>
    1e64:	4d 89 cc             	mov    %r9,%r12
    1e67:	49 89 df             	mov    %rbx,%r15
    1e6a:	31 c0                	xor    %eax,%eax
    1e6c:	e9 f9 fd ff ff       	jmpq   1c6a <iov_iter_copy_from_user_atomic+0xea>
    1e71:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1e78 <iov_iter_copy_from_user_atomic+0x2f8>
    1e78:	0f 85 54 ff ff ff    	jne    1dd2 <iov_iter_copy_from_user_atomic+0x252>
    1e7e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    1e85:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 1e8c <iov_iter_copy_from_user_atomic+0x30c>
    1e8c:	e8 00 00 00 00       	callq  1e91 <iov_iter_copy_from_user_atomic+0x311>
    1e91:	0f 0b                	ud2    
    1e93:	e9 3a ff ff ff       	jmpq   1dd2 <iov_iter_copy_from_user_atomic+0x252>
    1e98:	49 89 de             	mov    %rbx,%r14
    1e9b:	49 83 c5 10          	add    $0x10,%r13
    1e9f:	4d 89 f7             	mov    %r14,%r15
    1ea2:	4d 39 75 08          	cmp    %r14,0x8(%r13)
    1ea6:	4d 0f 46 7d 08       	cmovbe 0x8(%r13),%r15
    1eab:	4d 85 ff             	test   %r15,%r15
    1eae:	74 21                	je     1ed1 <iov_iter_copy_from_user_atomic+0x351>
    1eb0:	49 8b 75 00          	mov    0x0(%r13),%rsi
    1eb4:	4c 89 fa             	mov    %r15,%rdx
    1eb7:	4c 89 cf             	mov    %r9,%rdi
    1eba:	4f 8d 24 39          	lea    (%r9,%r15,1),%r12
    1ebe:	e8 00 00 00 00       	callq  1ec3 <iov_iter_copy_from_user_atomic+0x343>
    1ec3:	4d 29 fe             	sub    %r15,%r14
    1ec6:	0f 84 06 ff ff ff    	je     1dd2 <iov_iter_copy_from_user_atomic+0x252>
    1ecc:	4d 89 e1             	mov    %r12,%r9
    1ecf:	eb ca                	jmp    1e9b <iov_iter_copy_from_user_atomic+0x31b>
    1ed1:	4d 89 cc             	mov    %r9,%r12
    1ed4:	eb f6                	jmp    1ecc <iov_iter_copy_from_user_atomic+0x34c>
    1ed6:	4d 01 e1             	add    %r12,%r9
    1ed9:	eb c0                	jmp    1e9b <iov_iter_copy_from_user_atomic+0x31b>
    1edb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001ee0 <iov_iter_advance>:
    1ee0:	55                   	push   %rbp
    1ee1:	48 89 e5             	mov    %rsp,%rbp
    1ee4:	41 57                	push   %r15
    1ee6:	41 56                	push   %r14
    1ee8:	41 55                	push   %r13
    1eea:	41 54                	push   %r12
    1eec:	49 89 fc             	mov    %rdi,%r12
    1eef:	53                   	push   %rbx
    1ef0:	48 83 ec 08          	sub    $0x8,%rsp
    1ef4:	8b 07                	mov    (%rdi),%eax
    1ef6:	4c 8b 47 10          	mov    0x10(%rdi),%r8
    1efa:	89 c2                	mov    %eax,%edx
    1efc:	83 e2 fe             	and    $0xfffffffe,%edx
    1eff:	83 fa 20             	cmp    $0x20,%edx
    1f02:	0f 84 a6 00 00 00    	je     1fae <iov_iter_advance+0xce>
    1f08:	83 fa 40             	cmp    $0x40,%edx
    1f0b:	0f 84 9a 01 00 00    	je     20ab <iov_iter_advance+0x1cb>
    1f11:	4d 85 c0             	test   %r8,%r8
    1f14:	0f 84 85 00 00 00    	je     1f9f <iov_iter_advance+0xbf>
    1f1a:	4c 39 c6             	cmp    %r8,%rsi
    1f1d:	48 8b 5f 08          	mov    0x8(%rdi),%rbx
    1f21:	49 0f 47 f0          	cmova  %r8,%rsi
    1f25:	a8 10                	test   $0x10,%al
    1f27:	0f 85 ac 01 00 00    	jne    20d9 <iov_iter_advance+0x1f9>
    1f2d:	a8 08                	test   $0x8,%al
    1f2f:	0f 85 4e 02 00 00    	jne    2183 <iov_iter_advance+0x2a3>
    1f35:	a8 40                	test   $0x40,%al
    1f37:	0f 85 b6 02 00 00    	jne    21f3 <iov_iter_advance+0x313>
    1f3d:	48 8b 4f 18          	mov    0x18(%rdi),%rcx
    1f41:	48 8b 79 08          	mov    0x8(%rcx),%rdi
    1f45:	48 89 f8             	mov    %rdi,%rax
    1f48:	48 29 d8             	sub    %rbx,%rax
    1f4b:	48 39 f0             	cmp    %rsi,%rax
    1f4e:	48 0f 47 c6          	cmova  %rsi,%rax
    1f52:	48 85 c0             	test   %rax,%rax
    1f55:	0f 84 a0 02 00 00    	je     21fb <iov_iter_advance+0x31b>
    1f5b:	48 89 f2             	mov    %rsi,%rdx
    1f5e:	48 01 c3             	add    %rax,%rbx
    1f61:	48 29 c2             	sub    %rax,%rdx
    1f64:	48 89 d0             	mov    %rdx,%rax
    1f67:	48 85 c0             	test   %rax,%rax
    1f6a:	48 89 ca             	mov    %rcx,%rdx
    1f6d:	0f 85 44 01 00 00    	jne    20b7 <iov_iter_advance+0x1d7>
    1f73:	48 39 fb             	cmp    %rdi,%rbx
    1f76:	75 06                	jne    1f7e <iov_iter_advance+0x9e>
    1f78:	48 83 c2 10          	add    $0x10,%rdx
    1f7c:	31 db                	xor    %ebx,%ebx
    1f7e:	48 89 d0             	mov    %rdx,%rax
    1f81:	49 89 54 24 18       	mov    %rdx,0x18(%r12)
    1f86:	48 29 c8             	sub    %rcx,%rax
    1f89:	48 c1 f8 04          	sar    $0x4,%rax
    1f8d:	49 29 44 24 20       	sub    %rax,0x20(%r12)
    1f92:	49 29 f0             	sub    %rsi,%r8
    1f95:	49 89 5c 24 08       	mov    %rbx,0x8(%r12)
    1f9a:	4d 89 44 24 10       	mov    %r8,0x10(%r12)
    1f9f:	48 83 c4 08          	add    $0x8,%rsp
    1fa3:	5b                   	pop    %rbx
    1fa4:	41 5c                	pop    %r12
    1fa6:	41 5d                	pop    %r13
    1fa8:	41 5e                	pop    %r14
    1faa:	41 5f                	pop    %r15
    1fac:	5d                   	pop    %rbp
    1fad:	c3                   	retq   
    1fae:	4c 39 c6             	cmp    %r8,%rsi
    1fb1:	4c 8b 7f 18          	mov    0x18(%rdi),%r15
    1fb5:	49 0f 47 f0          	cmova  %r8,%rsi
    1fb9:	48 85 f6             	test   %rsi,%rsi
    1fbc:	74 62                	je     2020 <iov_iter_advance+0x140>
    1fbe:	41 8b 47 5c          	mov    0x5c(%r15),%eax
    1fc2:	8b 57 20             	mov    0x20(%rdi),%edx
    1fc5:	4c 8b 5f 08          	mov    0x8(%rdi),%r11
    1fc9:	4d 8b 97 90 00 00 00 	mov    0x90(%r15),%r10
    1fd0:	44 8d 48 ff          	lea    -0x1(%rax),%r9d
    1fd4:	44 89 c9             	mov    %r9d,%ecx
    1fd7:	21 d1                	and    %edx,%ecx
    1fd9:	4d 85 db             	test   %r11,%r11
    1fdc:	48 8d 04 89          	lea    (%rcx,%rcx,4),%rax
    1fe0:	49 8d 3c c2          	lea    (%r10,%rax,8),%rdi
    1fe4:	48 89 f0             	mov    %rsi,%rax
    1fe7:	74 1f                	je     2008 <iov_iter_advance+0x128>
    1fe9:	8b 4f 08             	mov    0x8(%rdi),%ecx
    1fec:	49 8d 04 33          	lea    (%r11,%rsi,1),%rax
    1ff0:	48 29 c8             	sub    %rcx,%rax
    1ff3:	eb 13                	jmp    2008 <iov_iter_advance+0x128>
    1ff5:	48 29 c8             	sub    %rcx,%rax
    1ff8:	83 c2 01             	add    $0x1,%edx
    1ffb:	44 89 c9             	mov    %r9d,%ecx
    1ffe:	21 d1                	and    %edx,%ecx
    2000:	48 8d 0c 89          	lea    (%rcx,%rcx,4),%rcx
    2004:	49 8d 3c ca          	lea    (%r10,%rcx,8),%rdi
    2008:	8b 4f 0c             	mov    0xc(%rdi),%ecx
    200b:	48 39 c1             	cmp    %rax,%rcx
    200e:	72 e5                	jb     1ff5 <iov_iter_advance+0x115>
    2010:	41 89 54 24 20       	mov    %edx,0x20(%r12)
    2015:	8b 57 08             	mov    0x8(%rdi),%edx
    2018:	48 01 d0             	add    %rdx,%rax
    201b:	49 89 44 24 08       	mov    %rax,0x8(%r12)
    2020:	49 29 f0             	sub    %rsi,%r8
    2023:	4d 89 44 24 10       	mov    %r8,0x10(%r12)
    2028:	41 8b 5f 50          	mov    0x50(%r15),%ebx
    202c:	41 39 5f 54          	cmp    %ebx,0x54(%r15)
    2030:	0f 84 69 ff ff ff    	je     1f9f <iov_iter_advance+0xbf>
    2036:	41 8b 47 5c          	mov    0x5c(%r15),%eax
    203a:	45 8b 6c 24 20       	mov    0x20(%r12),%r13d
    203f:	44 8d 70 ff          	lea    -0x1(%rax),%r14d
    2043:	49 8b 44 24 08       	mov    0x8(%r12),%rax
    2048:	48 85 c0             	test   %rax,%rax
    204b:	74 50                	je     209d <iov_iter_advance+0x1bd>
    204d:	44 89 f2             	mov    %r14d,%edx
    2050:	44 21 ea             	and    %r13d,%edx
    2053:	41 83 c5 01          	add    $0x1,%r13d
    2057:	48 8d 0c 92          	lea    (%rdx,%rdx,4),%rcx
    205b:	49 8b 97 90 00 00 00 	mov    0x90(%r15),%rdx
    2062:	48 8d 14 ca          	lea    (%rdx,%rcx,8),%rdx
    2066:	2b 42 08             	sub    0x8(%rdx),%eax
    2069:	89 42 0c             	mov    %eax,0xc(%rdx)
    206c:	eb 2f                	jmp    209d <iov_iter_advance+0x1bd>
    206e:	83 eb 01             	sub    $0x1,%ebx
    2071:	44 89 f0             	mov    %r14d,%eax
    2074:	4c 89 ff             	mov    %r15,%rdi
    2077:	21 d8                	and    %ebx,%eax
    2079:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
    207d:	49 8b 87 90 00 00 00 	mov    0x90(%r15),%rax
    2084:	48 8d 34 d0          	lea    (%rax,%rdx,8),%rsi
    2088:	48 8b 46 10          	mov    0x10(%rsi),%rax
    208c:	48 c7 46 10 00 00 00 	movq   $0x0,0x10(%rsi)
    2093:	00 
    2094:	48 8b 40 08          	mov    0x8(%rax),%rax
    2098:	e8 00 00 00 00       	callq  209d <iov_iter_advance+0x1bd>
    209d:	44 39 eb             	cmp    %r13d,%ebx
    20a0:	75 cc                	jne    206e <iov_iter_advance+0x18e>
    20a2:	45 89 6f 50          	mov    %r13d,0x50(%r15)
    20a6:	e9 f4 fe ff ff       	jmpq   1f9f <iov_iter_advance+0xbf>
    20ab:	49 29 f0             	sub    %rsi,%r8
    20ae:	4c 89 47 10          	mov    %r8,0x10(%rdi)
    20b2:	e9 e8 fe ff ff       	jmpq   1f9f <iov_iter_advance+0xbf>
    20b7:	48 83 c2 10          	add    $0x10,%rdx
    20bb:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
    20bf:	48 39 f8             	cmp    %rdi,%rax
    20c2:	48 89 fb             	mov    %rdi,%rbx
    20c5:	48 0f 46 d8          	cmovbe %rax,%rbx
    20c9:	48 85 db             	test   %rbx,%rbx
    20cc:	74 e9                	je     20b7 <iov_iter_advance+0x1d7>
    20ce:	48 29 d8             	sub    %rbx,%rax
    20d1:	0f 84 9c fe ff ff    	je     1f73 <iov_iter_advance+0x93>
    20d7:	eb de                	jmp    20b7 <iov_iter_advance+0x1d7>
    20d9:	4c 8b 6f 18          	mov    0x18(%rdi),%r13
    20dd:	41 89 f1             	mov    %esi,%r9d
    20e0:	31 c9                	xor    %ecx,%ecx
    20e2:	31 ff                	xor    %edi,%edi
    20e4:	41 ba 00 10 00 00    	mov    $0x1000,%r10d
    20ea:	49 89 fe             	mov    %rdi,%r14
    20ed:	49 c1 e6 04          	shl    $0x4,%r14
    20f1:	45 85 c9             	test   %r9d,%r9d
    20f4:	4b 8d 54 35 00       	lea    0x0(%r13,%r14,1),%rdx
    20f9:	74 70                	je     216b <iov_iter_advance+0x28b>
    20fb:	44 8b 7a 0c          	mov    0xc(%rdx),%r15d
    20ff:	8b 42 08             	mov    0x8(%rdx),%eax
    2102:	45 89 d3             	mov    %r10d,%r11d
    2105:	41 01 df             	add    %ebx,%r15d
    2108:	44 89 fa             	mov    %r15d,%edx
    210b:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    2111:	41 29 d3             	sub    %edx,%r11d
    2114:	44 89 da             	mov    %r11d,%edx
    2117:	41 89 c3             	mov    %eax,%r11d
    211a:	41 29 db             	sub    %ebx,%r11d
    211d:	45 39 cb             	cmp    %r9d,%r11d
    2120:	45 0f 47 d9          	cmova  %r9d,%r11d
    2124:	44 39 da             	cmp    %r11d,%edx
    2127:	41 0f 47 d3          	cmova  %r11d,%edx
    212b:	41 39 d1             	cmp    %edx,%r9d
    212e:	72 28                	jb     2158 <iov_iter_advance+0x278>
    2130:	41 29 d1             	sub    %edx,%r9d
    2133:	01 d3                	add    %edx,%ebx
    2135:	74 b3                	je     20ea <iov_iter_advance+0x20a>
    2137:	39 d8                	cmp    %ebx,%eax
    2139:	77 af                	ja     20ea <iov_iter_advance+0x20a>
    213b:	8d 79 01             	lea    0x1(%rcx),%edi
    213e:	48 89 fa             	mov    %rdi,%rdx
    2141:	48 89 f9             	mov    %rdi,%rcx
    2144:	48 c1 e2 04          	shl    $0x4,%rdx
    2148:	4c 01 ea             	add    %r13,%rdx
    214b:	29 c3                	sub    %eax,%ebx
    214d:	74 9b                	je     20ea <iov_iter_advance+0x20a>
    214f:	8b 42 08             	mov    0x8(%rdx),%eax
    2152:	39 d8                	cmp    %ebx,%eax
    2154:	76 e5                	jbe    213b <iov_iter_advance+0x25b>
    2156:	eb 92                	jmp    20ea <iov_iter_advance+0x20a>
    2158:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 215f <iov_iter_advance+0x27f>
    215f:	4c 89 ea             	mov    %r13,%rdx
    2162:	0f 84 a0 00 00 00    	je     2208 <iov_iter_advance+0x328>
    2168:	4c 01 f2             	add    %r14,%rdx
    216b:	49 89 54 24 18       	mov    %rdx,0x18(%r12)
    2170:	4c 29 ea             	sub    %r13,%rdx
    2173:	89 db                	mov    %ebx,%ebx
    2175:	48 c1 fa 04          	sar    $0x4,%rdx
    2179:	49 29 54 24 20       	sub    %rdx,0x20(%r12)
    217e:	e9 0f fe ff ff       	jmpq   1f92 <iov_iter_advance+0xb2>
    2183:	48 8b 57 18          	mov    0x18(%rdi),%rdx
    2187:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
    218b:	48 89 f8             	mov    %rdi,%rax
    218e:	48 29 d8             	sub    %rbx,%rax
    2191:	48 39 f0             	cmp    %rsi,%rax
    2194:	48 0f 47 c6          	cmova  %rsi,%rax
    2198:	48 85 c0             	test   %rax,%rax
    219b:	74 66                	je     2203 <iov_iter_advance+0x323>
    219d:	48 89 f1             	mov    %rsi,%rcx
    21a0:	48 01 c3             	add    %rax,%rbx
    21a3:	48 29 c1             	sub    %rax,%rcx
    21a6:	48 89 c8             	mov    %rcx,%rax
    21a9:	48 85 c0             	test   %rax,%rax
    21ac:	48 89 d1             	mov    %rdx,%rcx
    21af:	75 24                	jne    21d5 <iov_iter_advance+0x2f5>
    21b1:	48 39 fb             	cmp    %rdi,%rbx
    21b4:	75 06                	jne    21bc <iov_iter_advance+0x2dc>
    21b6:	48 83 c1 10          	add    $0x10,%rcx
    21ba:	31 db                	xor    %ebx,%ebx
    21bc:	48 89 c8             	mov    %rcx,%rax
    21bf:	49 89 4c 24 18       	mov    %rcx,0x18(%r12)
    21c4:	48 29 d0             	sub    %rdx,%rax
    21c7:	48 c1 f8 04          	sar    $0x4,%rax
    21cb:	49 29 44 24 20       	sub    %rax,0x20(%r12)
    21d0:	e9 bd fd ff ff       	jmpq   1f92 <iov_iter_advance+0xb2>
    21d5:	48 83 c1 10          	add    $0x10,%rcx
    21d9:	48 8b 79 08          	mov    0x8(%rcx),%rdi
    21dd:	48 39 f8             	cmp    %rdi,%rax
    21e0:	48 89 fb             	mov    %rdi,%rbx
    21e3:	48 0f 46 d8          	cmovbe %rax,%rbx
    21e7:	48 85 db             	test   %rbx,%rbx
    21ea:	74 e9                	je     21d5 <iov_iter_advance+0x2f5>
    21ec:	48 29 d8             	sub    %rbx,%rax
    21ef:	74 c0                	je     21b1 <iov_iter_advance+0x2d1>
    21f1:	eb e2                	jmp    21d5 <iov_iter_advance+0x2f5>
    21f3:	48 01 f3             	add    %rsi,%rbx
    21f6:	e9 97 fd ff ff       	jmpq   1f92 <iov_iter_advance+0xb2>
    21fb:	48 89 f0             	mov    %rsi,%rax
    21fe:	e9 64 fd ff ff       	jmpq   1f67 <iov_iter_advance+0x87>
    2203:	48 89 f0             	mov    %rsi,%rax
    2206:	eb a1                	jmp    21a9 <iov_iter_advance+0x2c9>
    2208:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    220f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    2213:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 221a <iov_iter_advance+0x33a>
    221a:	e8 00 00 00 00       	callq  221f <iov_iter_advance+0x33f>
    221f:	0f 0b                	ud2    
    2221:	49 8b 54 24 18       	mov    0x18(%r12),%rdx
    2226:	4d 8b 44 24 10       	mov    0x10(%r12),%r8
    222b:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    222f:	e9 34 ff ff ff       	jmpq   2168 <iov_iter_advance+0x288>
    2234:	66 90                	xchg   %ax,%ax
    2236:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    223d:	00 00 00 

0000000000002240 <_copy_from_iter_full>:
    2240:	55                   	push   %rbp
    2241:	48 89 e5             	mov    %rsp,%rbp
    2244:	41 57                	push   %r15
    2246:	41 56                	push   %r14
    2248:	41 55                	push   %r13
    224a:	41 54                	push   %r12
    224c:	53                   	push   %rbx
    224d:	48 89 d3             	mov    %rdx,%rbx
    2250:	48 83 ec 10          	sub    $0x10,%rsp
    2254:	8b 02                	mov    (%rdx),%eax
    2256:	89 c2                	mov    %eax,%edx
    2258:	83 e2 fe             	and    $0xfffffffe,%edx
    225b:	83 fa 20             	cmp    $0x20,%edx
    225e:	0f 84 ae 01 00 00    	je     2412 <_copy_from_iter_full+0x1d2>
    2264:	48 39 73 10          	cmp    %rsi,0x10(%rbx)
    2268:	49 89 f4             	mov    %rsi,%r12
    226b:	0f 82 46 01 00 00    	jb     23b7 <_copy_from_iter_full+0x177>
    2271:	48 85 f6             	test   %rsi,%rsi
    2274:	74 64                	je     22da <_copy_from_iter_full+0x9a>
    2276:	45 31 c9             	xor    %r9d,%r9d
    2279:	a8 10                	test   $0x10,%al
    227b:	49 89 fd             	mov    %rdi,%r13
    227e:	4c 8b 43 08          	mov    0x8(%rbx),%r8
    2282:	41 89 f3             	mov    %esi,%r11d
    2285:	41 be 00 10 00 00    	mov    $0x1000,%r14d
    228b:	0f 85 92 00 00 00    	jne    2323 <_copy_from_iter_full+0xe3>
    2291:	a8 08                	test   $0x8,%al
    2293:	0f 85 8c 01 00 00    	jne    2425 <_copy_from_iter_full+0x1e5>
    2299:	a8 40                	test   $0x40,%al
    229b:	75 3d                	jne    22da <_copy_from_iter_full+0x9a>
    229d:	4c 8b 7b 18          	mov    0x18(%rbx),%r15
    22a1:	4d 8b 77 08          	mov    0x8(%r15),%r14
    22a5:	4d 29 c6             	sub    %r8,%r14
    22a8:	49 39 f6             	cmp    %rsi,%r14
    22ab:	4c 0f 47 f6          	cmova  %rsi,%r14
    22af:	4d 85 f6             	test   %r14,%r14
    22b2:	0f 84 10 01 00 00    	je     23c8 <_copy_from_iter_full+0x188>
    22b8:	49 8b 37             	mov    (%r15),%rsi
    22bb:	4c 89 f2             	mov    %r14,%rdx
    22be:	4c 01 c6             	add    %r8,%rsi
    22c1:	e8 ea e8 ff ff       	callq  bb0 <copyin>
    22c6:	85 c0                	test   %eax,%eax
    22c8:	0f 85 e9 00 00 00    	jne    23b7 <_copy_from_iter_full+0x177>
    22ce:	4c 89 e1             	mov    %r12,%rcx
    22d1:	4c 29 f1             	sub    %r14,%rcx
    22d4:	0f 85 cd 01 00 00    	jne    24a7 <_copy_from_iter_full+0x267>
    22da:	4c 89 e6             	mov    %r12,%rsi
    22dd:	48 89 df             	mov    %rbx,%rdi
    22e0:	e8 00 00 00 00       	callq  22e5 <_copy_from_iter_full+0xa5>
    22e5:	48 83 c4 10          	add    $0x10,%rsp
    22e9:	b8 01 00 00 00       	mov    $0x1,%eax
    22ee:	5b                   	pop    %rbx
    22ef:	41 5c                	pop    %r12
    22f1:	41 5d                	pop    %r13
    22f3:	41 5e                	pop    %r14
    22f5:	41 5f                	pop    %r15
    22f7:	5d                   	pop    %rbp
    22f8:	c3                   	retq   
    22f9:	48 8b 4b 18          	mov    0x18(%rbx),%rcx
    22fd:	4d 89 fd             	mov    %r15,%r13
    2300:	45 29 d3             	sub    %r10d,%r11d
    2303:	45 01 d0             	add    %r10d,%r8d
    2306:	75 12                	jne    231a <_copy_from_iter_full+0xda>
    2308:	eb 19                	jmp    2323 <_copy_from_iter_full+0xe3>
    230a:	41 83 c1 01          	add    $0x1,%r9d
    230e:	41 29 c0             	sub    %eax,%r8d
    2311:	74 10                	je     2323 <_copy_from_iter_full+0xe3>
    2313:	44 89 c8             	mov    %r9d,%eax
    2316:	48 c1 e0 04          	shl    $0x4,%rax
    231a:	8b 44 01 08          	mov    0x8(%rcx,%rax,1),%eax
    231e:	44 39 c0             	cmp    %r8d,%eax
    2321:	76 e7                	jbe    230a <_copy_from_iter_full+0xca>
    2323:	45 85 db             	test   %r11d,%r11d
    2326:	74 b2                	je     22da <_copy_from_iter_full+0x9a>
    2328:	48 8b 4b 18          	mov    0x18(%rbx),%rcx
    232c:	44 89 c8             	mov    %r9d,%eax
    232f:	45 89 f7             	mov    %r14d,%r15d
    2332:	48 c1 e0 04          	shl    $0x4,%rax
    2336:	48 8d 3c 01          	lea    (%rcx,%rax,1),%rdi
    233a:	8b 77 0c             	mov    0xc(%rdi),%esi
    233d:	44 8b 57 08          	mov    0x8(%rdi),%r10d
    2341:	44 01 c6             	add    %r8d,%esi
    2344:	45 29 c2             	sub    %r8d,%r10d
    2347:	89 f2                	mov    %esi,%edx
    2349:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    234f:	45 39 da             	cmp    %r11d,%r10d
    2352:	45 0f 47 d3          	cmova  %r11d,%r10d
    2356:	41 29 d7             	sub    %edx,%r15d
    2359:	45 39 fa             	cmp    %r15d,%r10d
    235c:	45 0f 47 d7          	cmova  %r15d,%r10d
    2360:	45 85 d2             	test   %r10d,%r10d
    2363:	74 9b                	je     2300 <_copy_from_iter_full+0xc0>
    2365:	c1 ee 0c             	shr    $0xc,%esi
    2368:	44 89 d1             	mov    %r10d,%ecx
    236b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    236f:	48 c1 e6 06          	shl    $0x6,%rsi
    2373:	48 03 37             	add    (%rdi),%rsi
    2376:	4c 89 ef             	mov    %r13,%rdi
    2379:	4d 8d 7c 0d 00       	lea    0x0(%r13,%rcx,1),%r15
    237e:	e8 6d e0 ff ff       	callq  3f0 <memcpy_from_page>
    2383:	45 39 d3             	cmp    %r10d,%r11d
    2386:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    238a:	0f 83 69 ff ff ff    	jae    22f9 <_copy_from_iter_full+0xb9>
    2390:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 2397 <_copy_from_iter_full+0x157>
    2397:	0f 85 3d ff ff ff    	jne    22da <_copy_from_iter_full+0x9a>
    239d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    23a4:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 23ab <_copy_from_iter_full+0x16b>
    23ab:	e8 00 00 00 00       	callq  23b0 <_copy_from_iter_full+0x170>
    23b0:	0f 0b                	ud2    
    23b2:	e9 23 ff ff ff       	jmpq   22da <_copy_from_iter_full+0x9a>
    23b7:	48 83 c4 10          	add    $0x10,%rsp
    23bb:	31 c0                	xor    %eax,%eax
    23bd:	5b                   	pop    %rbx
    23be:	41 5c                	pop    %r12
    23c0:	41 5d                	pop    %r13
    23c2:	41 5e                	pop    %r14
    23c4:	41 5f                	pop    %r15
    23c6:	5d                   	pop    %rbp
    23c7:	c3                   	retq   
    23c8:	48 89 f1             	mov    %rsi,%rcx
    23cb:	49 83 c7 10          	add    $0x10,%r15
    23cf:	49 89 ce             	mov    %rcx,%r14
    23d2:	49 39 4f 08          	cmp    %rcx,0x8(%r15)
    23d6:	4d 0f 46 77 08       	cmovbe 0x8(%r15),%r14
    23db:	4d 85 f6             	test   %r14,%r14
    23de:	74 eb                	je     23cb <_copy_from_iter_full+0x18b>
    23e0:	49 8b 37             	mov    (%r15),%rsi
    23e3:	4b 8d 44 35 00       	lea    0x0(%r13,%r14,1),%rax
    23e8:	4c 89 f2             	mov    %r14,%rdx
    23eb:	4c 89 ef             	mov    %r13,%rdi
    23ee:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    23f2:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    23f6:	e8 b5 e7 ff ff       	callq  bb0 <copyin>
    23fb:	85 c0                	test   %eax,%eax
    23fd:	75 b8                	jne    23b7 <_copy_from_iter_full+0x177>
    23ff:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    2403:	4c 29 f1             	sub    %r14,%rcx
    2406:	0f 84 ce fe ff ff    	je     22da <_copy_from_iter_full+0x9a>
    240c:	4c 8b 6d c8          	mov    -0x38(%rbp),%r13
    2410:	eb b9                	jmp    23cb <_copy_from_iter_full+0x18b>
    2412:	0f 0b                	ud2    
    2414:	48 83 c4 10          	add    $0x10,%rsp
    2418:	31 c0                	xor    %eax,%eax
    241a:	5b                   	pop    %rbx
    241b:	41 5c                	pop    %r12
    241d:	41 5d                	pop    %r13
    241f:	41 5e                	pop    %r14
    2421:	41 5f                	pop    %r15
    2423:	5d                   	pop    %rbp
    2424:	c3                   	retq   
    2425:	4c 8b 7b 18          	mov    0x18(%rbx),%r15
    2429:	4d 8b 77 08          	mov    0x8(%r15),%r14
    242d:	4d 29 c6             	sub    %r8,%r14
    2430:	49 39 f6             	cmp    %rsi,%r14
    2433:	4c 0f 47 f6          	cmova  %rsi,%r14
    2437:	4d 85 f6             	test   %r14,%r14
    243a:	74 1f                	je     245b <_copy_from_iter_full+0x21b>
    243c:	49 8b 37             	mov    (%r15),%rsi
    243f:	4c 89 f2             	mov    %r14,%rdx
    2442:	4c 01 c6             	add    %r8,%rsi
    2445:	e8 00 00 00 00       	callq  244a <_copy_from_iter_full+0x20a>
    244a:	4c 89 e1             	mov    %r12,%rcx
    244d:	4c 29 f1             	sub    %r14,%rcx
    2450:	0f 84 84 fe ff ff    	je     22da <_copy_from_iter_full+0x9a>
    2456:	4d 01 f5             	add    %r14,%r13
    2459:	eb 03                	jmp    245e <_copy_from_iter_full+0x21e>
    245b:	48 89 f1             	mov    %rsi,%rcx
    245e:	49 83 c7 10          	add    $0x10,%r15
    2462:	49 89 ce             	mov    %rcx,%r14
    2465:	49 39 4f 08          	cmp    %rcx,0x8(%r15)
    2469:	4d 0f 46 77 08       	cmovbe 0x8(%r15),%r14
    246e:	4d 85 f6             	test   %r14,%r14
    2471:	74 2e                	je     24a1 <_copy_from_iter_full+0x261>
    2473:	49 8b 37             	mov    (%r15),%rsi
    2476:	4b 8d 44 35 00       	lea    0x0(%r13,%r14,1),%rax
    247b:	4c 89 f2             	mov    %r14,%rdx
    247e:	4c 89 ef             	mov    %r13,%rdi
    2481:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    2485:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2489:	e8 00 00 00 00       	callq  248e <_copy_from_iter_full+0x24e>
    248e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    2492:	4c 29 f1             	sub    %r14,%rcx
    2495:	0f 84 3f fe ff ff    	je     22da <_copy_from_iter_full+0x9a>
    249b:	4c 8b 6d d0          	mov    -0x30(%rbp),%r13
    249f:	eb bd                	jmp    245e <_copy_from_iter_full+0x21e>
    24a1:	4c 89 6d d0          	mov    %r13,-0x30(%rbp)
    24a5:	eb f4                	jmp    249b <_copy_from_iter_full+0x25b>
    24a7:	4d 01 f5             	add    %r14,%r13
    24aa:	e9 1c ff ff ff       	jmpq   23cb <_copy_from_iter_full+0x18b>
    24af:	90                   	nop

00000000000024b0 <_copy_from_iter_full_nocache>:
    24b0:	55                   	push   %rbp
    24b1:	48 89 e5             	mov    %rsp,%rbp
    24b4:	41 57                	push   %r15
    24b6:	41 56                	push   %r14
    24b8:	41 55                	push   %r13
    24ba:	41 54                	push   %r12
    24bc:	53                   	push   %rbx
    24bd:	48 89 d3             	mov    %rdx,%rbx
    24c0:	48 83 ec 10          	sub    $0x10,%rsp
    24c4:	8b 02                	mov    (%rdx),%eax
    24c6:	89 c2                	mov    %eax,%edx
    24c8:	83 e2 fe             	and    $0xfffffffe,%edx
    24cb:	83 fa 20             	cmp    $0x20,%edx
    24ce:	0f 84 b2 01 00 00    	je     2686 <_copy_from_iter_full_nocache+0x1d6>
    24d4:	48 39 73 10          	cmp    %rsi,0x10(%rbx)
    24d8:	49 89 f4             	mov    %rsi,%r12
    24db:	0f 82 48 01 00 00    	jb     2629 <_copy_from_iter_full_nocache+0x179>
    24e1:	48 85 f6             	test   %rsi,%rsi
    24e4:	74 66                	je     254c <_copy_from_iter_full_nocache+0x9c>
    24e6:	45 31 c9             	xor    %r9d,%r9d
    24e9:	a8 10                	test   $0x10,%al
    24eb:	49 89 fd             	mov    %rdi,%r13
    24ee:	4c 8b 43 08          	mov    0x8(%rbx),%r8
    24f2:	41 89 f3             	mov    %esi,%r11d
    24f5:	41 be 00 10 00 00    	mov    $0x1000,%r14d
    24fb:	0f 85 94 00 00 00    	jne    2595 <_copy_from_iter_full_nocache+0xe5>
    2501:	a8 08                	test   $0x8,%al
    2503:	0f 85 90 01 00 00    	jne    2699 <_copy_from_iter_full_nocache+0x1e9>
    2509:	a8 40                	test   $0x40,%al
    250b:	75 3f                	jne    254c <_copy_from_iter_full_nocache+0x9c>
    250d:	4c 8b 7b 18          	mov    0x18(%rbx),%r15
    2511:	4d 8b 77 08          	mov    0x8(%r15),%r14
    2515:	4d 29 c6             	sub    %r8,%r14
    2518:	49 39 f6             	cmp    %rsi,%r14
    251b:	4c 0f 47 f6          	cmova  %rsi,%r14
    251f:	4d 85 f6             	test   %r14,%r14
    2522:	0f 84 12 01 00 00    	je     263a <_copy_from_iter_full_nocache+0x18a>
    2528:	49 8b 37             	mov    (%r15),%rsi
    252b:	31 c9                	xor    %ecx,%ecx
    252d:	44 89 f2             	mov    %r14d,%edx
    2530:	4c 01 c6             	add    %r8,%rsi
    2533:	e8 00 00 00 00       	callq  2538 <_copy_from_iter_full_nocache+0x88>
    2538:	85 c0                	test   %eax,%eax
    253a:	0f 85 e9 00 00 00    	jne    2629 <_copy_from_iter_full_nocache+0x179>
    2540:	4d 89 e0             	mov    %r12,%r8
    2543:	4d 29 f0             	sub    %r14,%r8
    2546:	0f 85 cf 01 00 00    	jne    271b <_copy_from_iter_full_nocache+0x26b>
    254c:	4c 89 e6             	mov    %r12,%rsi
    254f:	48 89 df             	mov    %rbx,%rdi
    2552:	e8 00 00 00 00       	callq  2557 <_copy_from_iter_full_nocache+0xa7>
    2557:	48 83 c4 10          	add    $0x10,%rsp
    255b:	b8 01 00 00 00       	mov    $0x1,%eax
    2560:	5b                   	pop    %rbx
    2561:	41 5c                	pop    %r12
    2563:	41 5d                	pop    %r13
    2565:	41 5e                	pop    %r14
    2567:	41 5f                	pop    %r15
    2569:	5d                   	pop    %rbp
    256a:	c3                   	retq   
    256b:	48 8b 4b 18          	mov    0x18(%rbx),%rcx
    256f:	4d 89 fd             	mov    %r15,%r13
    2572:	45 29 d3             	sub    %r10d,%r11d
    2575:	45 01 d0             	add    %r10d,%r8d
    2578:	75 12                	jne    258c <_copy_from_iter_full_nocache+0xdc>
    257a:	eb 19                	jmp    2595 <_copy_from_iter_full_nocache+0xe5>
    257c:	41 83 c1 01          	add    $0x1,%r9d
    2580:	41 29 c0             	sub    %eax,%r8d
    2583:	74 10                	je     2595 <_copy_from_iter_full_nocache+0xe5>
    2585:	44 89 c8             	mov    %r9d,%eax
    2588:	48 c1 e0 04          	shl    $0x4,%rax
    258c:	8b 44 01 08          	mov    0x8(%rcx,%rax,1),%eax
    2590:	44 39 c0             	cmp    %r8d,%eax
    2593:	76 e7                	jbe    257c <_copy_from_iter_full_nocache+0xcc>
    2595:	45 85 db             	test   %r11d,%r11d
    2598:	74 b2                	je     254c <_copy_from_iter_full_nocache+0x9c>
    259a:	48 8b 4b 18          	mov    0x18(%rbx),%rcx
    259e:	44 89 c8             	mov    %r9d,%eax
    25a1:	45 89 f7             	mov    %r14d,%r15d
    25a4:	48 c1 e0 04          	shl    $0x4,%rax
    25a8:	48 8d 3c 01          	lea    (%rcx,%rax,1),%rdi
    25ac:	8b 77 0c             	mov    0xc(%rdi),%esi
    25af:	44 8b 57 08          	mov    0x8(%rdi),%r10d
    25b3:	44 01 c6             	add    %r8d,%esi
    25b6:	45 29 c2             	sub    %r8d,%r10d
    25b9:	89 f2                	mov    %esi,%edx
    25bb:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    25c1:	45 39 da             	cmp    %r11d,%r10d
    25c4:	45 0f 47 d3          	cmova  %r11d,%r10d
    25c8:	41 29 d7             	sub    %edx,%r15d
    25cb:	45 39 fa             	cmp    %r15d,%r10d
    25ce:	45 0f 47 d7          	cmova  %r15d,%r10d
    25d2:	45 85 d2             	test   %r10d,%r10d
    25d5:	74 9b                	je     2572 <_copy_from_iter_full_nocache+0xc2>
    25d7:	c1 ee 0c             	shr    $0xc,%esi
    25da:	44 89 d1             	mov    %r10d,%ecx
    25dd:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    25e1:	48 c1 e6 06          	shl    $0x6,%rsi
    25e5:	48 03 37             	add    (%rdi),%rsi
    25e8:	4c 89 ef             	mov    %r13,%rdi
    25eb:	4d 8d 7c 0d 00       	lea    0x0(%r13,%rcx,1),%r15
    25f0:	e8 fb dd ff ff       	callq  3f0 <memcpy_from_page>
    25f5:	45 39 d3             	cmp    %r10d,%r11d
    25f8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    25fc:	0f 83 69 ff ff ff    	jae    256b <_copy_from_iter_full_nocache+0xbb>
    2602:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 2609 <_copy_from_iter_full_nocache+0x159>
    2609:	0f 85 3d ff ff ff    	jne    254c <_copy_from_iter_full_nocache+0x9c>
    260f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    2616:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 261d <_copy_from_iter_full_nocache+0x16d>
    261d:	e8 00 00 00 00       	callq  2622 <_copy_from_iter_full_nocache+0x172>
    2622:	0f 0b                	ud2    
    2624:	e9 23 ff ff ff       	jmpq   254c <_copy_from_iter_full_nocache+0x9c>
    2629:	48 83 c4 10          	add    $0x10,%rsp
    262d:	31 c0                	xor    %eax,%eax
    262f:	5b                   	pop    %rbx
    2630:	41 5c                	pop    %r12
    2632:	41 5d                	pop    %r13
    2634:	41 5e                	pop    %r14
    2636:	41 5f                	pop    %r15
    2638:	5d                   	pop    %rbp
    2639:	c3                   	retq   
    263a:	49 89 f0             	mov    %rsi,%r8
    263d:	49 83 c7 10          	add    $0x10,%r15
    2641:	4d 89 c6             	mov    %r8,%r14
    2644:	4d 39 47 08          	cmp    %r8,0x8(%r15)
    2648:	4d 0f 46 77 08       	cmovbe 0x8(%r15),%r14
    264d:	4d 85 f6             	test   %r14,%r14
    2650:	74 eb                	je     263d <_copy_from_iter_full_nocache+0x18d>
    2652:	49 8b 37             	mov    (%r15),%rsi
    2655:	4b 8d 44 35 00       	lea    0x0(%r13,%r14,1),%rax
    265a:	31 c9                	xor    %ecx,%ecx
    265c:	44 89 f2             	mov    %r14d,%edx
    265f:	4c 89 ef             	mov    %r13,%rdi
    2662:	4c 89 45 d0          	mov    %r8,-0x30(%rbp)
    2666:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    266a:	e8 00 00 00 00       	callq  266f <_copy_from_iter_full_nocache+0x1bf>
    266f:	85 c0                	test   %eax,%eax
    2671:	75 b6                	jne    2629 <_copy_from_iter_full_nocache+0x179>
    2673:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
    2677:	4d 29 f0             	sub    %r14,%r8
    267a:	0f 84 cc fe ff ff    	je     254c <_copy_from_iter_full_nocache+0x9c>
    2680:	4c 8b 6d c8          	mov    -0x38(%rbp),%r13
    2684:	eb b7                	jmp    263d <_copy_from_iter_full_nocache+0x18d>
    2686:	0f 0b                	ud2    
    2688:	48 83 c4 10          	add    $0x10,%rsp
    268c:	31 c0                	xor    %eax,%eax
    268e:	5b                   	pop    %rbx
    268f:	41 5c                	pop    %r12
    2691:	41 5d                	pop    %r13
    2693:	41 5e                	pop    %r14
    2695:	41 5f                	pop    %r15
    2697:	5d                   	pop    %rbp
    2698:	c3                   	retq   
    2699:	4c 8b 7b 18          	mov    0x18(%rbx),%r15
    269d:	4d 8b 77 08          	mov    0x8(%r15),%r14
    26a1:	4d 29 c6             	sub    %r8,%r14
    26a4:	49 39 f6             	cmp    %rsi,%r14
    26a7:	4c 0f 47 f6          	cmova  %rsi,%r14
    26ab:	4d 85 f6             	test   %r14,%r14
    26ae:	74 1f                	je     26cf <_copy_from_iter_full_nocache+0x21f>
    26b0:	49 8b 37             	mov    (%r15),%rsi
    26b3:	4c 89 f2             	mov    %r14,%rdx
    26b6:	4c 01 c6             	add    %r8,%rsi
    26b9:	e8 00 00 00 00       	callq  26be <_copy_from_iter_full_nocache+0x20e>
    26be:	4c 89 e1             	mov    %r12,%rcx
    26c1:	4c 29 f1             	sub    %r14,%rcx
    26c4:	0f 84 82 fe ff ff    	je     254c <_copy_from_iter_full_nocache+0x9c>
    26ca:	4d 01 f5             	add    %r14,%r13
    26cd:	eb 03                	jmp    26d2 <_copy_from_iter_full_nocache+0x222>
    26cf:	48 89 f1             	mov    %rsi,%rcx
    26d2:	49 83 c7 10          	add    $0x10,%r15
    26d6:	49 89 ce             	mov    %rcx,%r14
    26d9:	49 39 4f 08          	cmp    %rcx,0x8(%r15)
    26dd:	4d 0f 46 77 08       	cmovbe 0x8(%r15),%r14
    26e2:	4d 85 f6             	test   %r14,%r14
    26e5:	74 2e                	je     2715 <_copy_from_iter_full_nocache+0x265>
    26e7:	49 8b 37             	mov    (%r15),%rsi
    26ea:	4b 8d 44 35 00       	lea    0x0(%r13,%r14,1),%rax
    26ef:	4c 89 f2             	mov    %r14,%rdx
    26f2:	4c 89 ef             	mov    %r13,%rdi
    26f5:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    26f9:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    26fd:	e8 00 00 00 00       	callq  2702 <_copy_from_iter_full_nocache+0x252>
    2702:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    2706:	4c 29 f1             	sub    %r14,%rcx
    2709:	0f 84 3d fe ff ff    	je     254c <_copy_from_iter_full_nocache+0x9c>
    270f:	4c 8b 6d d0          	mov    -0x30(%rbp),%r13
    2713:	eb bd                	jmp    26d2 <_copy_from_iter_full_nocache+0x222>
    2715:	4c 89 6d d0          	mov    %r13,-0x30(%rbp)
    2719:	eb f4                	jmp    270f <_copy_from_iter_full_nocache+0x25f>
    271b:	4d 01 f5             	add    %r14,%r13
    271e:	e9 1a ff ff ff       	jmpq   263d <_copy_from_iter_full_nocache+0x18d>
    2723:	0f 1f 00             	nopl   (%rax)
    2726:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    272d:	00 00 00 

0000000000002730 <csum_and_copy_from_iter_full>:
    2730:	55                   	push   %rbp
    2731:	49 89 d3             	mov    %rdx,%r11
    2734:	48 89 e5             	mov    %rsp,%rbp
    2737:	41 57                	push   %r15
    2739:	41 56                	push   %r14
    273b:	41 55                	push   %r13
    273d:	41 54                	push   %r12
    273f:	53                   	push   %rbx
    2740:	48 83 ec 50          	sub    $0x50,%rsp
    2744:	8b 11                	mov    (%rcx),%edx
    2746:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    274d:	00 00 
    274f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2753:	31 c0                	xor    %eax,%eax
    2755:	89 d0                	mov    %edx,%eax
    2757:	83 e0 fe             	and    $0xfffffffe,%eax
    275a:	83 e8 20             	sub    $0x20,%eax
    275d:	83 e0 de             	and    $0xffffffde,%eax
    2760:	0f 84 eb 00 00 00    	je     2851 <csum_and_copy_from_iter_full+0x121>
    2766:	48 39 71 10          	cmp    %rsi,0x10(%rcx)
    276a:	49 89 f1             	mov    %rsi,%r9
    276d:	49 89 ce             	mov    %rcx,%r14
    2770:	0f 82 d7 00 00 00    	jb     284d <csum_and_copy_from_iter_full+0x11d>
    2776:	41 8b 03             	mov    (%r11),%eax
    2779:	48 85 f6             	test   %rsi,%rsi
    277c:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    277f:	0f 84 90 00 00 00    	je     2815 <csum_and_copy_from_iter_full+0xe5>
    2785:	f6 c2 10             	test   $0x10,%dl
    2788:	49 89 fa             	mov    %rdi,%r10
    278b:	48 8b 59 08          	mov    0x8(%rcx),%rbx
    278f:	0f 85 c2 00 00 00    	jne    2857 <csum_and_copy_from_iter_full+0x127>
    2795:	f6 c2 08             	test   $0x8,%dl
    2798:	0f 85 fe 01 00 00    	jne    299c <csum_and_copy_from_iter_full+0x26c>
    279e:	83 e2 40             	and    $0x40,%edx
    27a1:	75 72                	jne    2815 <csum_and_copy_from_iter_full+0xe5>
    27a3:	4c 8b 79 18          	mov    0x18(%rcx),%r15
    27a7:	4d 8b 67 08          	mov    0x8(%r15),%r12
    27ab:	49 29 dc             	sub    %rbx,%r12
    27ae:	49 39 f4             	cmp    %rsi,%r12
    27b1:	4c 0f 47 e6          	cmova  %rsi,%r12
    27b5:	4d 85 e4             	test   %r12,%r12
    27b8:	0f 84 51 02 00 00    	je     2a0f <csum_and_copy_from_iter_full+0x2df>
    27be:	49 8b 3f             	mov    (%r15),%rdi
    27c1:	4c 8d 6d cc          	lea    -0x34(%rbp),%r13
    27c5:	31 c9                	xor    %ecx,%ecx
    27c7:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
    27cb:	44 89 e2             	mov    %r12d,%edx
    27ce:	4c 89 d6             	mov    %r10,%rsi
    27d1:	4d 89 e8             	mov    %r13,%r8
    27d4:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    27d8:	4c 89 55 b8          	mov    %r10,-0x48(%rbp)
    27dc:	48 01 df             	add    %rbx,%rdi
    27df:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    27e6:	e8 00 00 00 00       	callq  27eb <csum_and_copy_from_iter_full+0xbb>
    27eb:	8b 4d cc             	mov    -0x34(%rbp),%ecx
    27ee:	4c 8b 55 b8          	mov    -0x48(%rbp),%r10
    27f2:	4c 8b 4d b0          	mov    -0x50(%rbp),%r9
    27f6:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    27fa:	85 c9                	test   %ecx,%ecx
    27fc:	75 4f                	jne    284d <csum_and_copy_from_iter_full+0x11d>
    27fe:	4c 89 cb             	mov    %r9,%rbx
    2801:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    2804:	01 c2                	add    %eax,%edx
    2806:	83 d2 00             	adc    $0x0,%edx
    2809:	4c 29 e3             	sub    %r12,%rbx
    280c:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    280f:	0f 85 4e 03 00 00    	jne    2b63 <csum_and_copy_from_iter_full+0x433>
    2815:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    2818:	4c 89 ce             	mov    %r9,%rsi
    281b:	4c 89 f7             	mov    %r14,%rdi
    281e:	41 89 03             	mov    %eax,(%r11)
    2821:	e8 00 00 00 00       	callq  2826 <csum_and_copy_from_iter_full+0xf6>
    2826:	b8 01 00 00 00       	mov    $0x1,%eax
    282b:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    282f:	65 48 33 34 25 28 00 	xor    %gs:0x28,%rsi
    2836:	00 00 
    2838:	0f 85 20 03 00 00    	jne    2b5e <csum_and_copy_from_iter_full+0x42e>
    283e:	48 83 c4 50          	add    $0x50,%rsp
    2842:	5b                   	pop    %rbx
    2843:	41 5c                	pop    %r12
    2845:	41 5d                	pop    %r13
    2847:	41 5e                	pop    %r14
    2849:	41 5f                	pop    %r15
    284b:	5d                   	pop    %rbp
    284c:	c3                   	retq   
    284d:	31 c0                	xor    %eax,%eax
    284f:	eb da                	jmp    282b <csum_and_copy_from_iter_full+0xfb>
    2851:	0f 0b                	ud2    
    2853:	31 c0                	xor    %eax,%eax
    2855:	eb d4                	jmp    282b <csum_and_copy_from_iter_full+0xfb>
    2857:	41 89 f7             	mov    %esi,%r15d
    285a:	45 31 ed             	xor    %r13d,%r13d
    285d:	48 c7 45 b8 00 00 00 	movq   $0x0,-0x48(%rbp)
    2864:	00 
    2865:	48 89 fe             	mov    %rdi,%rsi
    2868:	4c 89 4d 88          	mov    %r9,-0x78(%rbp)
    286c:	49 89 ca             	mov    %rcx,%r10
    286f:	45 85 ff             	test   %r15d,%r15d
    2872:	0f 84 66 02 00 00    	je     2ade <csum_and_copy_from_iter_full+0x3ae>
    2878:	49 8b 42 18          	mov    0x18(%r10),%rax
    287c:	45 89 ee             	mov    %r13d,%r14d
    287f:	41 b8 00 10 00 00    	mov    $0x1000,%r8d
    2885:	49 c1 e6 04          	shl    $0x4,%r14
    2889:	4a 8d 3c 30          	lea    (%rax,%r14,1),%rdi
    288d:	8b 57 0c             	mov    0xc(%rdi),%edx
    2890:	44 8b 67 08          	mov    0x8(%rdi),%r12d
    2894:	01 da                	add    %ebx,%edx
    2896:	41 29 dc             	sub    %ebx,%r12d
    2899:	89 d1                	mov    %edx,%ecx
    289b:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
    28a1:	45 39 fc             	cmp    %r15d,%r12d
    28a4:	45 0f 47 e7          	cmova  %r15d,%r12d
    28a8:	41 29 c8             	sub    %ecx,%r8d
    28ab:	45 39 c4             	cmp    %r8d,%r12d
    28ae:	45 0f 47 e0          	cmova  %r8d,%r12d
    28b2:	45 85 e4             	test   %r12d,%r12d
    28b5:	0f 84 a8 00 00 00    	je     2963 <csum_and_copy_from_iter_full+0x233>
    28bb:	4c 89 55 98          	mov    %r10,-0x68(%rbp)
    28bf:	4c 89 5d a0          	mov    %r11,-0x60(%rbp)
    28c3:	48 8b 07             	mov    (%rdi),%rax
    28c6:	65 4c 8b 04 25 00 00 	mov    %gs:0x0,%r8
    28cd:	00 00 
    28cf:	41 83 80 80 12 00 00 	addl   $0x1,0x1280(%r8)
    28d6:	01 
    28d7:	4c 89 45 a8          	mov    %r8,-0x58(%rbp)
    28db:	45 89 e1             	mov    %r12d,%r9d
    28de:	c1 ea 0c             	shr    $0xc,%edx
    28e1:	4a 8d 3c 0e          	lea    (%rsi,%r9,1),%rdi
    28e5:	4c 89 4d b0          	mov    %r9,-0x50(%rbp)
    28e9:	48 89 7d 90          	mov    %rdi,-0x70(%rbp)
    28ed:	89 d7                	mov    %edx,%edi
    28ef:	44 89 e2             	mov    %r12d,%edx
    28f2:	48 c1 e7 06          	shl    $0x6,%rdi
    28f6:	48 01 c7             	add    %rax,%rdi
    28f9:	48 2b 3d 00 00 00 00 	sub    0x0(%rip),%rdi        # 2900 <csum_and_copy_from_iter_full+0x1d0>
    2900:	48 c1 ff 06          	sar    $0x6,%rdi
    2904:	48 c1 e7 0c          	shl    $0xc,%rdi
    2908:	48 03 3d 00 00 00 00 	add    0x0(%rip),%rdi        # 290f <csum_and_copy_from_iter_full+0x1df>
    290f:	48 01 cf             	add    %rcx,%rdi
    2912:	31 c9                	xor    %ecx,%ecx
    2914:	e8 00 00 00 00       	callq  2919 <csum_and_copy_from_iter_full+0x1e9>
    2919:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    291d:	89 c2                	mov    %eax,%edx
    291f:	c1 ca 08             	ror    $0x8,%edx
    2922:	f6 c1 01             	test   $0x1,%cl
    2925:	0f 45 c2             	cmovne %edx,%eax
    2928:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    292b:	01 c2                	add    %eax,%edx
    292d:	83 d2 00             	adc    $0x0,%edx
    2930:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    2933:	4c 8b 45 a8          	mov    -0x58(%rbp),%r8
    2937:	41 83 a8 80 12 00 00 	subl   $0x1,0x1280(%r8)
    293e:	01 
    293f:	4c 8b 4d b0          	mov    -0x50(%rbp),%r9
    2943:	4c 8b 5d a0          	mov    -0x60(%rbp),%r11
    2947:	4c 8b 55 98          	mov    -0x68(%rbp),%r10
    294b:	4c 01 c9             	add    %r9,%rcx
    294e:	45 39 fc             	cmp    %r15d,%r12d
    2951:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
    2955:	0f 87 45 01 00 00    	ja     2aa0 <csum_and_copy_from_iter_full+0x370>
    295b:	49 8b 42 18          	mov    0x18(%r10),%rax
    295f:	48 8b 75 90          	mov    -0x70(%rbp),%rsi
    2963:	45 29 e7             	sub    %r12d,%r15d
    2966:	44 01 e3             	add    %r12d,%ebx
    2969:	0f 84 00 ff ff ff    	je     286f <csum_and_copy_from_iter_full+0x13f>
    296f:	42 8b 54 30 08       	mov    0x8(%rax,%r14,1),%edx
    2974:	39 da                	cmp    %ebx,%edx
    2976:	0f 87 f3 fe ff ff    	ja     286f <csum_and_copy_from_iter_full+0x13f>
    297c:	41 83 c5 01          	add    $0x1,%r13d
    2980:	29 d3                	sub    %edx,%ebx
    2982:	0f 84 e7 fe ff ff    	je     286f <csum_and_copy_from_iter_full+0x13f>
    2988:	44 89 ea             	mov    %r13d,%edx
    298b:	48 c1 e2 04          	shl    $0x4,%rdx
    298f:	8b 54 10 08          	mov    0x8(%rax,%rdx,1),%edx
    2993:	39 da                	cmp    %ebx,%edx
    2995:	76 e5                	jbe    297c <csum_and_copy_from_iter_full+0x24c>
    2997:	e9 d3 fe ff ff       	jmpq   286f <csum_and_copy_from_iter_full+0x13f>
    299c:	4c 8b 69 18          	mov    0x18(%rcx),%r13
    29a0:	4d 8b 65 08          	mov    0x8(%r13),%r12
    29a4:	49 29 dc             	sub    %rbx,%r12
    29a7:	49 39 f4             	cmp    %rsi,%r12
    29aa:	4c 0f 47 e6          	cmova  %rsi,%r12
    29ae:	4d 85 e4             	test   %r12,%r12
    29b1:	0f 84 33 01 00 00    	je     2aea <csum_and_copy_from_iter_full+0x3ba>
    29b7:	49 8b 7d 00          	mov    0x0(%r13),%rdi
    29bb:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
    29bf:	31 c9                	xor    %ecx,%ecx
    29c1:	44 89 e2             	mov    %r12d,%edx
    29c4:	4c 89 d6             	mov    %r10,%rsi
    29c7:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    29cb:	4c 89 55 b8          	mov    %r10,-0x48(%rbp)
    29cf:	48 01 df             	add    %rbx,%rdi
    29d2:	e8 00 00 00 00       	callq  29d7 <csum_and_copy_from_iter_full+0x2a7>
    29d7:	4c 8b 4d b0          	mov    -0x50(%rbp),%r9
    29db:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    29de:	01 c2                	add    %eax,%edx
    29e0:	83 d2 00             	adc    $0x0,%edx
    29e3:	4c 8b 55 b8          	mov    -0x48(%rbp),%r10
    29e7:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    29ea:	4c 89 cb             	mov    %r9,%rbx
    29ed:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    29f1:	4c 29 e3             	sub    %r12,%rbx
    29f4:	0f 84 1b fe ff ff    	je     2815 <csum_and_copy_from_iter_full+0xe5>
    29fa:	4d 01 e2             	add    %r12,%r10
    29fd:	4c 89 75 b8          	mov    %r14,-0x48(%rbp)
    2a01:	4d 89 e6             	mov    %r12,%r14
    2a04:	4c 89 d6             	mov    %r10,%rsi
    2a07:	4d 89 cc             	mov    %r9,%r12
    2a0a:	e9 eb 00 00 00       	jmpq   2afa <csum_and_copy_from_iter_full+0x3ca>
    2a0f:	4c 8d 6d cc          	lea    -0x34(%rbp),%r13
    2a13:	48 89 f3             	mov    %rsi,%rbx
    2a16:	4c 89 75 b8          	mov    %r14,-0x48(%rbp)
    2a1a:	4c 89 d6             	mov    %r10,%rsi
    2a1d:	4d 89 ee             	mov    %r13,%r14
    2a20:	4d 89 e5             	mov    %r12,%r13
    2a23:	49 89 dc             	mov    %rbx,%r12
    2a26:	49 83 c7 10          	add    $0x10,%r15
    2a2a:	4c 89 e3             	mov    %r12,%rbx
    2a2d:	4d 39 67 08          	cmp    %r12,0x8(%r15)
    2a31:	49 0f 46 5f 08       	cmovbe 0x8(%r15),%rbx
    2a36:	48 85 db             	test   %rbx,%rbx
    2a39:	74 eb                	je     2a26 <csum_and_copy_from_iter_full+0x2f6>
    2a3b:	49 8b 3f             	mov    (%r15),%rdi
    2a3e:	48 8d 04 1e          	lea    (%rsi,%rbx,1),%rax
    2a42:	31 c9                	xor    %ecx,%ecx
    2a44:	89 da                	mov    %ebx,%edx
    2a46:	4d 89 f0             	mov    %r14,%r8
    2a49:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    2a4d:	4c 89 4d b0          	mov    %r9,-0x50(%rbp)
    2a51:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    2a58:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    2a5c:	e8 00 00 00 00       	callq  2a61 <csum_and_copy_from_iter_full+0x331>
    2a61:	8b 55 cc             	mov    -0x34(%rbp),%edx
    2a64:	4c 8b 4d b0          	mov    -0x50(%rbp),%r9
    2a68:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    2a6c:	85 d2                	test   %edx,%edx
    2a6e:	0f 85 d9 fd ff ff    	jne    284d <csum_and_copy_from_iter_full+0x11d>
    2a74:	89 c2                	mov    %eax,%edx
    2a76:	c1 ca 08             	ror    $0x8,%edx
    2a79:	41 f6 c5 01          	test   $0x1,%r13b
    2a7d:	0f 45 c2             	cmovne %edx,%eax
    2a80:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    2a83:	49 01 dd             	add    %rbx,%r13
    2a86:	01 c2                	add    %eax,%edx
    2a88:	83 d2 00             	adc    $0x0,%edx
    2a8b:	49 29 dc             	sub    %rbx,%r12
    2a8e:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    2a91:	0f 85 d4 00 00 00    	jne    2b6b <csum_and_copy_from_iter_full+0x43b>
    2a97:	4c 8b 75 b8          	mov    -0x48(%rbp),%r14
    2a9b:	e9 75 fd ff ff       	jmpq   2815 <csum_and_copy_from_iter_full+0xe5>
    2aa0:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 2aa7 <csum_and_copy_from_iter_full+0x377>
    2aa7:	4c 8b 4d 88          	mov    -0x78(%rbp),%r9
    2aab:	4d 89 d6             	mov    %r10,%r14
    2aae:	0f 85 61 fd ff ff    	jne    2815 <csum_and_copy_from_iter_full+0xe5>
    2ab4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    2abb:	4c 89 5d b0          	mov    %r11,-0x50(%rbp)
    2abf:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
    2ac3:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 2aca <csum_and_copy_from_iter_full+0x39a>
    2aca:	e8 00 00 00 00       	callq  2acf <csum_and_copy_from_iter_full+0x39f>
    2acf:	0f 0b                	ud2    
    2ad1:	4c 8b 4d b8          	mov    -0x48(%rbp),%r9
    2ad5:	4c 8b 5d b0          	mov    -0x50(%rbp),%r11
    2ad9:	e9 37 fd ff ff       	jmpq   2815 <csum_and_copy_from_iter_full+0xe5>
    2ade:	4c 8b 4d 88          	mov    -0x78(%rbp),%r9
    2ae2:	4d 89 d6             	mov    %r10,%r14
    2ae5:	e9 2b fd ff ff       	jmpq   2815 <csum_and_copy_from_iter_full+0xe5>
    2aea:	48 89 f3             	mov    %rsi,%rbx
    2aed:	4d 89 e6             	mov    %r12,%r14
    2af0:	48 89 fe             	mov    %rdi,%rsi
    2af3:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
    2af7:	4d 89 cc             	mov    %r9,%r12
    2afa:	49 83 c5 10          	add    $0x10,%r13
    2afe:	49 89 df             	mov    %rbx,%r15
    2b01:	49 39 5d 08          	cmp    %rbx,0x8(%r13)
    2b05:	4d 0f 46 7d 08       	cmovbe 0x8(%r13),%r15
    2b0a:	4d 85 ff             	test   %r15,%r15
    2b0d:	74 45                	je     2b54 <csum_and_copy_from_iter_full+0x424>
    2b0f:	49 8b 7d 00          	mov    0x0(%r13),%rdi
    2b13:	4a 8d 04 3e          	lea    (%rsi,%r15,1),%rax
    2b17:	31 c9                	xor    %ecx,%ecx
    2b19:	44 89 fa             	mov    %r15d,%edx
    2b1c:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    2b20:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    2b24:	e8 00 00 00 00       	callq  2b29 <csum_and_copy_from_iter_full+0x3f9>
    2b29:	89 c2                	mov    %eax,%edx
    2b2b:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    2b2f:	c1 ca 08             	ror    $0x8,%edx
    2b32:	41 f6 c6 01          	test   $0x1,%r14b
    2b36:	0f 45 c2             	cmovne %edx,%eax
    2b39:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    2b3c:	4d 01 fe             	add    %r15,%r14
    2b3f:	01 c2                	add    %eax,%edx
    2b41:	83 d2 00             	adc    $0x0,%edx
    2b44:	4c 29 fb             	sub    %r15,%rbx
    2b47:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    2b4a:	75 0c                	jne    2b58 <csum_and_copy_from_iter_full+0x428>
    2b4c:	4d 89 e1             	mov    %r12,%r9
    2b4f:	e9 43 ff ff ff       	jmpq   2a97 <csum_and_copy_from_iter_full+0x367>
    2b54:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
    2b58:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    2b5c:	eb 9c                	jmp    2afa <csum_and_copy_from_iter_full+0x3ca>
    2b5e:	e8 00 00 00 00       	callq  2b63 <csum_and_copy_from_iter_full+0x433>
    2b63:	4d 01 e2             	add    %r12,%r10
    2b66:	e9 ab fe ff ff       	jmpq   2a16 <csum_and_copy_from_iter_full+0x2e6>
    2b6b:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
    2b6f:	e9 b2 fe ff ff       	jmpq   2a26 <csum_and_copy_from_iter_full+0x2f6>
    2b74:	66 90                	xchg   %ax,%ax
    2b76:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2b7d:	00 00 00 

0000000000002b80 <_copy_to_iter_mcsafe>:
    2b80:	55                   	push   %rbp
    2b81:	49 89 f8             	mov    %rdi,%r8
    2b84:	48 89 e5             	mov    %rsp,%rbp
    2b87:	41 57                	push   %r15
    2b89:	41 56                	push   %r14
    2b8b:	41 55                	push   %r13
    2b8d:	41 54                	push   %r12
    2b8f:	49 89 d5             	mov    %rdx,%r13
    2b92:	53                   	push   %rbx
    2b93:	48 83 ec 48          	sub    $0x48,%rsp
    2b97:	8b 12                	mov    (%rdx),%edx
    2b99:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    2ba0:	00 00 
    2ba2:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2ba6:	31 c0                	xor    %eax,%eax
    2ba8:	89 d0                	mov    %edx,%eax
    2baa:	83 e0 fe             	and    $0xfffffffe,%eax
    2bad:	83 f8 20             	cmp    $0x20,%eax
    2bb0:	0f 84 4c 01 00 00    	je     2d02 <_copy_to_iter_mcsafe+0x182>
    2bb6:	49 8b 45 10          	mov    0x10(%r13),%rax
    2bba:	48 39 f0             	cmp    %rsi,%rax
    2bbd:	48 0f 46 f0          	cmovbe %rax,%rsi
    2bc1:	48 85 c0             	test   %rax,%rax
    2bc4:	49 89 f4             	mov    %rsi,%r12
    2bc7:	0f 84 a5 00 00 00    	je     2c72 <_copy_to_iter_mcsafe+0xf2>
    2bcd:	f6 c2 10             	test   $0x10,%dl
    2bd0:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    2bd4:	49 8b 5d 08          	mov    0x8(%r13),%rbx
    2bd8:	0f 85 9c 01 00 00    	jne    2d7a <_copy_to_iter_mcsafe+0x1fa>
    2bde:	f6 c2 08             	test   $0x8,%dl
    2be1:	0f 85 b0 00 00 00    	jne    2c97 <_copy_to_iter_mcsafe+0x117>
    2be7:	83 e2 40             	and    $0x40,%edx
    2bea:	0f 85 6a 02 00 00    	jne    2e5a <_copy_to_iter_mcsafe+0x2da>
    2bf0:	4d 8b 75 18          	mov    0x18(%r13),%r14
    2bf4:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    2bf8:	49 29 df             	sub    %rbx,%r15
    2bfb:	49 39 f7             	cmp    %rsi,%r15
    2bfe:	4c 0f 47 fe          	cmova  %rsi,%r15
    2c02:	4d 85 ff             	test   %r15,%r15
    2c05:	0f 84 47 03 00 00    	je     2f52 <_copy_to_iter_mcsafe+0x3d2>
    2c0b:	4a 8d 04 3f          	lea    (%rdi,%r15,1),%rax
    2c0f:	49 8b 3e             	mov    (%r14),%rdi
    2c12:	4c 89 fa             	mov    %r15,%rdx
    2c15:	4c 89 c6             	mov    %r8,%rsi
    2c18:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    2c1c:	48 01 df             	add    %rbx,%rdi
    2c1f:	e8 fc dc ff ff       	callq  920 <copyout_mcsafe>
    2c24:	48 98                	cltq   
    2c26:	4c 89 e1             	mov    %r12,%rcx
    2c29:	49 29 c7             	sub    %rax,%r15
    2c2c:	4c 29 f9             	sub    %r15,%rcx
    2c2f:	4c 01 fb             	add    %r15,%rbx
    2c32:	49 89 cf             	mov    %rcx,%r15
    2c35:	48 85 c0             	test   %rax,%rax
    2c38:	75 09                	jne    2c43 <_copy_to_iter_mcsafe+0xc3>
    2c3a:	4d 85 ff             	test   %r15,%r15
    2c3d:	0f 85 ef 00 00 00    	jne    2d32 <_copy_to_iter_mcsafe+0x1b2>
    2c43:	4d 29 fc             	sub    %r15,%r12
    2c46:	49 39 5e 08          	cmp    %rbx,0x8(%r14)
    2c4a:	0f 84 a7 00 00 00    	je     2cf7 <_copy_to_iter_mcsafe+0x177>
    2c50:	4c 89 f0             	mov    %r14,%rax
    2c53:	49 2b 45 18          	sub    0x18(%r13),%rax
    2c57:	4d 89 75 18          	mov    %r14,0x18(%r13)
    2c5b:	48 c1 f8 04          	sar    $0x4,%rax
    2c5f:	49 29 45 20          	sub    %rax,0x20(%r13)
    2c63:	49 8b 45 10          	mov    0x10(%r13),%rax
    2c67:	4c 29 e0             	sub    %r12,%rax
    2c6a:	49 89 5d 08          	mov    %rbx,0x8(%r13)
    2c6e:	49 89 45 10          	mov    %rax,0x10(%r13)
    2c72:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    2c76:	65 48 33 3c 25 28 00 	xor    %gs:0x28,%rdi
    2c7d:	00 00 
    2c7f:	4c 89 e0             	mov    %r12,%rax
    2c82:	0f 85 c0 03 00 00    	jne    3048 <_copy_to_iter_mcsafe+0x4c8>
    2c88:	48 83 c4 48          	add    $0x48,%rsp
    2c8c:	5b                   	pop    %rbx
    2c8d:	41 5c                	pop    %r12
    2c8f:	41 5d                	pop    %r13
    2c91:	41 5e                	pop    %r14
    2c93:	41 5f                	pop    %r15
    2c95:	5d                   	pop    %rbp
    2c96:	c3                   	retq   
    2c97:	4d 8b 75 18          	mov    0x18(%r13),%r14
    2c9b:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    2c9f:	49 29 df             	sub    %rbx,%r15
    2ca2:	49 39 f7             	cmp    %rsi,%r15
    2ca5:	4c 0f 47 fe          	cmova  %rsi,%r15
    2ca9:	4d 85 ff             	test   %r15,%r15
    2cac:	0f 84 ec 02 00 00    	je     2f9e <_copy_to_iter_mcsafe+0x41e>
    2cb2:	49 8b 3e             	mov    (%r14),%rdi
    2cb5:	4b 8d 04 38          	lea    (%r8,%r15,1),%rax
    2cb9:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    2cbd:	48 01 df             	add    %rbx,%rdi
    2cc0:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    2cc5:	4c 89 fa             	mov    %r15,%rdx
    2cc8:	4c 89 c6             	mov    %r8,%rsi
    2ccb:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
    2ccf:	e8 00 00 00 00       	callq  2cd4 <_copy_to_iter_mcsafe+0x154>
    2cd4:	4c 89 e0             	mov    %r12,%rax
    2cd7:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
    2cdb:	4c 01 fb             	add    %r15,%rbx
    2cde:	4c 29 f8             	sub    %r15,%rax
    2ce1:	49 89 c7             	mov    %rax,%r15
    2ce4:	4d 85 ff             	test   %r15,%r15
    2ce7:	0f 85 bd 02 00 00    	jne    2faa <_copy_to_iter_mcsafe+0x42a>
    2ced:	49 3b 5e 08          	cmp    0x8(%r14),%rbx
    2cf1:	0f 85 59 ff ff ff    	jne    2c50 <_copy_to_iter_mcsafe+0xd0>
    2cf7:	49 83 c6 10          	add    $0x10,%r14
    2cfb:	31 db                	xor    %ebx,%ebx
    2cfd:	e9 4e ff ff ff       	jmpq   2c50 <_copy_to_iter_mcsafe+0xd0>
    2d02:	49 8b 5d 18          	mov    0x18(%r13),%rbx
    2d06:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    2d0a:	4c 89 ef             	mov    %r13,%rdi
    2d0d:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
    2d11:	44 8b 73 5c          	mov    0x5c(%rbx),%r14d
    2d15:	e8 96 d3 ff ff       	callq  b0 <sanity>
    2d1a:	84 c0                	test   %al,%al
    2d1c:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
    2d20:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    2d24:	0f 85 70 01 00 00    	jne    2e9a <_copy_to_iter_mcsafe+0x31a>
    2d2a:	45 31 e4             	xor    %r12d,%r12d
    2d2d:	e9 40 ff ff ff       	jmpq   2c72 <_copy_to_iter_mcsafe+0xf2>
    2d32:	49 83 c6 10          	add    $0x10,%r14
    2d36:	4c 89 f9             	mov    %r15,%rcx
    2d39:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    2d3d:	49 0f 46 4e 08       	cmovbe 0x8(%r14),%rcx
    2d42:	48 85 c9             	test   %rcx,%rcx
    2d45:	0f 84 b4 02 00 00    	je     2fff <_copy_to_iter_mcsafe+0x47f>
    2d4b:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
    2d4f:	49 8b 3e             	mov    (%r14),%rdi
    2d52:	48 89 ca             	mov    %rcx,%rdx
    2d55:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    2d59:	48 8d 04 0e          	lea    (%rsi,%rcx,1),%rax
    2d5d:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    2d61:	e8 ba db ff ff       	callq  920 <copyout_mcsafe>
    2d66:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    2d6a:	48 98                	cltq   
    2d6c:	48 29 c1             	sub    %rax,%rcx
    2d6f:	48 89 cb             	mov    %rcx,%rbx
    2d72:	49 29 cf             	sub    %rcx,%r15
    2d75:	e9 bb fe ff ff       	jmpq   2c35 <_copy_to_iter_mcsafe+0xb5>
    2d7a:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    2d7e:	45 31 ff             	xor    %r15d,%r15d
    2d81:	45 31 c9             	xor    %r9d,%r9d
    2d84:	4d 89 eb             	mov    %r13,%r11
    2d87:	49 89 f2             	mov    %rsi,%r10
    2d8a:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    2d8e:	4d 89 cd             	mov    %r9,%r13
    2d91:	49 c1 e5 04          	shl    $0x4,%r13
    2d95:	45 85 e4             	test   %r12d,%r12d
    2d98:	4a 8d 3c 29          	lea    (%rcx,%r13,1),%rdi
    2d9c:	0f 84 f1 01 00 00    	je     2f93 <_copy_to_iter_mcsafe+0x413>
    2da2:	8b 47 0c             	mov    0xc(%rdi),%eax
    2da5:	44 8b 77 08          	mov    0x8(%rdi),%r14d
    2da9:	ba 00 10 00 00       	mov    $0x1000,%edx
    2dae:	01 d8                	add    %ebx,%eax
    2db0:	41 29 de             	sub    %ebx,%r14d
    2db3:	89 c6                	mov    %eax,%esi
    2db5:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
    2dbb:	45 39 e6             	cmp    %r12d,%r14d
    2dbe:	45 0f 47 f4          	cmova  %r12d,%r14d
    2dc2:	29 f2                	sub    %esi,%edx
    2dc4:	41 39 d6             	cmp    %edx,%r14d
    2dc7:	44 0f 47 f2          	cmova  %edx,%r14d
    2dcb:	45 85 f6             	test   %r14d,%r14d
    2dce:	74 4e                	je     2e1e <_copy_to_iter_mcsafe+0x29e>
    2dd0:	c1 e8 0c             	shr    $0xc,%eax
    2dd3:	44 89 f1             	mov    %r14d,%ecx
    2dd6:	4c 89 4d a0          	mov    %r9,-0x60(%rbp)
    2dda:	48 c1 e0 06          	shl    $0x6,%rax
    2dde:	48 03 07             	add    (%rdi),%rax
    2de1:	49 8d 14 08          	lea    (%r8,%rcx,1),%rdx
    2de5:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    2de9:	4c 89 55 b0          	mov    %r10,-0x50(%rbp)
    2ded:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
    2df1:	4c 89 c2             	mov    %r8,%rdx
    2df4:	48 89 c7             	mov    %rax,%rdi
    2df7:	e8 f4 d7 ff ff       	callq  5f0 <memcpy_mcsafe_to_page>
    2dfc:	48 85 c0             	test   %rax,%rax
    2dff:	4c 8b 55 b0          	mov    -0x50(%rbp),%r10
    2e03:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    2e07:	4c 8b 4d a0          	mov    -0x60(%rbp),%r9
    2e0b:	0f 85 72 01 00 00    	jne    2f83 <_copy_to_iter_mcsafe+0x403>
    2e11:	45 39 f4             	cmp    %r14d,%r12d
    2e14:	49 8b 4b 18          	mov    0x18(%r11),%rcx
    2e18:	72 48                	jb     2e62 <_copy_to_iter_mcsafe+0x2e2>
    2e1a:	4c 8b 45 98          	mov    -0x68(%rbp),%r8
    2e1e:	45 29 f4             	sub    %r14d,%r12d
    2e21:	44 01 f3             	add    %r14d,%ebx
    2e24:	0f 84 64 ff ff ff    	je     2d8e <_copy_to_iter_mcsafe+0x20e>
    2e2a:	42 8b 44 29 08       	mov    0x8(%rcx,%r13,1),%eax
    2e2f:	39 d8                	cmp    %ebx,%eax
    2e31:	0f 87 57 ff ff ff    	ja     2d8e <_copy_to_iter_mcsafe+0x20e>
    2e37:	45 8d 4f 01          	lea    0x1(%r15),%r9d
    2e3b:	4c 89 ca             	mov    %r9,%rdx
    2e3e:	4d 89 cf             	mov    %r9,%r15
    2e41:	48 c1 e2 04          	shl    $0x4,%rdx
    2e45:	29 c3                	sub    %eax,%ebx
    2e47:	0f 84 41 ff ff ff    	je     2d8e <_copy_to_iter_mcsafe+0x20e>
    2e4d:	8b 44 11 08          	mov    0x8(%rcx,%rdx,1),%eax
    2e51:	39 d8                	cmp    %ebx,%eax
    2e53:	76 e2                	jbe    2e37 <_copy_to_iter_mcsafe+0x2b7>
    2e55:	e9 34 ff ff ff       	jmpq   2d8e <_copy_to_iter_mcsafe+0x20e>
    2e5a:	48 01 f3             	add    %rsi,%rbx
    2e5d:	e9 05 fe ff ff       	jmpq   2c67 <_copy_to_iter_mcsafe+0xe7>
    2e62:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 2e69 <_copy_to_iter_mcsafe+0x2e9>
    2e69:	4c 89 d8             	mov    %r11,%rax
    2e6c:	4d 89 d4             	mov    %r10,%r12
    2e6f:	4d 89 eb             	mov    %r13,%r11
    2e72:	49 89 c5             	mov    %rax,%r13
    2e75:	0f 84 8b 01 00 00    	je     3006 <_copy_to_iter_mcsafe+0x486>
    2e7b:	4a 8d 3c 19          	lea    (%rcx,%r11,1),%rdi
    2e7f:	49 89 7d 18          	mov    %rdi,0x18(%r13)
    2e83:	48 2b 7d 90          	sub    -0x70(%rbp),%rdi
    2e87:	89 db                	mov    %ebx,%ebx
    2e89:	49 8b 45 10          	mov    0x10(%r13),%rax
    2e8d:	48 c1 ff 04          	sar    $0x4,%rdi
    2e91:	49 29 7d 20          	sub    %rdi,0x20(%r13)
    2e95:	e9 cd fd ff ff       	jmpq   2c67 <_copy_to_iter_mcsafe+0xe7>
    2e9a:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
    2e9e:	48 8d 55 c4          	lea    -0x3c(%rbp),%rdx
    2ea2:	4c 89 ef             	mov    %r13,%rdi
    2ea5:	4c 89 45 a8          	mov    %r8,-0x58(%rbp)
    2ea9:	e8 e2 d3 ff ff       	callq  290 <push_pipe>
    2eae:	48 85 c0             	test   %rax,%rax
    2eb1:	49 89 c7             	mov    %rax,%r15
    2eb4:	0f 84 70 fe ff ff    	je     2d2a <_copy_to_iter_mcsafe+0x1aa>
    2eba:	4c 8b 45 a8          	mov    -0x58(%rbp),%r8
    2ebe:	41 8d 46 ff          	lea    -0x1(%r14),%eax
    2ec2:	48 89 5d b0          	mov    %rbx,-0x50(%rbp)
    2ec6:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
    2eca:	4c 89 eb             	mov    %r13,%rbx
    2ecd:	45 31 e4             	xor    %r12d,%r12d
    2ed0:	89 45 b8             	mov    %eax,-0x48(%rbp)
    2ed3:	4d 89 fd             	mov    %r15,%r13
    2ed6:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    2ed9:	4d 89 c6             	mov    %r8,%r14
    2edc:	eb 18                	jmp    2ef6 <_copy_to_iter_mcsafe+0x376>
    2ede:	8d 42 01             	lea    0x1(%rdx),%eax
    2ee1:	4d 01 fe             	add    %r15,%r14
    2ee4:	31 f6                	xor    %esi,%esi
    2ee6:	4d 29 fd             	sub    %r15,%r13
    2ee9:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
    2ef0:	00 
    2ef1:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    2ef4:	74 53                	je     2f49 <_copy_to_iter_mcsafe+0x3c9>
    2ef6:	41 bf 00 10 00 00    	mov    $0x1000,%r15d
    2efc:	48 8b 7d b0          	mov    -0x50(%rbp),%rdi
    2f00:	4c 89 f2             	mov    %r14,%rdx
    2f03:	49 29 f7             	sub    %rsi,%r15
    2f06:	4d 39 ef             	cmp    %r13,%r15
    2f09:	4d 0f 47 fd          	cmova  %r13,%r15
    2f0d:	23 45 b8             	and    -0x48(%rbp),%eax
    2f10:	4c 89 f9             	mov    %r15,%rcx
    2f13:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    2f17:	48 c1 e0 03          	shl    $0x3,%rax
    2f1b:	48 03 87 90 00 00 00 	add    0x90(%rdi),%rax
    2f22:	48 8b 38             	mov    (%rax),%rdi
    2f25:	e8 c6 d6 ff ff       	callq  5f0 <memcpy_mcsafe_to_page>
    2f2a:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
    2f2e:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    2f31:	4c 89 f9             	mov    %r15,%rcx
    2f34:	48 29 c1             	sub    %rax,%rcx
    2f37:	49 01 cc             	add    %rcx,%r12
    2f3a:	48 01 ce             	add    %rcx,%rsi
    2f3d:	48 85 c0             	test   %rax,%rax
    2f40:	89 53 20             	mov    %edx,0x20(%rbx)
    2f43:	48 89 73 08          	mov    %rsi,0x8(%rbx)
    2f47:	74 95                	je     2ede <_copy_to_iter_mcsafe+0x35e>
    2f49:	4c 29 63 10          	sub    %r12,0x10(%rbx)
    2f4d:	e9 20 fd ff ff       	jmpq   2c72 <_copy_to_iter_mcsafe+0xf2>
    2f52:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    2f56:	49 89 f7             	mov    %rsi,%r15
    2f59:	31 c0                	xor    %eax,%eax
    2f5b:	e9 d5 fc ff ff       	jmpq   2c35 <_copy_to_iter_mcsafe+0xb5>
    2f60:	4c 89 fa             	mov    %r15,%rdx
    2f63:	4c 89 c6             	mov    %r8,%rsi
    2f66:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
    2f6a:	e8 00 00 00 00       	callq  2f6f <_copy_to_iter_mcsafe+0x3ef>
    2f6f:	48 85 c0             	test   %rax,%rax
    2f72:	0f 84 5c fd ff ff    	je     2cd4 <_copy_to_iter_mcsafe+0x154>
    2f78:	49 29 c7             	sub    %rax,%r15
    2f7b:	4d 89 fc             	mov    %r15,%r12
    2f7e:	e9 ef fc ff ff       	jmpq   2c72 <_copy_to_iter_mcsafe+0xf2>
    2f83:	4c 8b 65 98          	mov    -0x68(%rbp),%r12
    2f87:	4c 2b 65 b8          	sub    -0x48(%rbp),%r12
    2f8b:	49 29 c4             	sub    %rax,%r12
    2f8e:	e9 df fc ff ff       	jmpq   2c72 <_copy_to_iter_mcsafe+0xf2>
    2f93:	4d 89 d4             	mov    %r10,%r12
    2f96:	4d 89 dd             	mov    %r11,%r13
    2f99:	e9 e1 fe ff ff       	jmpq   2e7f <_copy_to_iter_mcsafe+0x2ff>
    2f9e:	48 89 7d b0          	mov    %rdi,-0x50(%rbp)
    2fa2:	49 89 f7             	mov    %rsi,%r15
    2fa5:	e9 3a fd ff ff       	jmpq   2ce4 <_copy_to_iter_mcsafe+0x164>
    2faa:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    2fae:	4c 89 65 b0          	mov    %r12,-0x50(%rbp)
    2fb2:	4d 89 f4             	mov    %r14,%r12
    2fb5:	4d 89 ee             	mov    %r13,%r14
    2fb8:	4d 89 c5             	mov    %r8,%r13
    2fbb:	49 83 c4 10          	add    $0x10,%r12
    2fbf:	4c 89 fb             	mov    %r15,%rbx
    2fc2:	4d 39 7c 24 08       	cmp    %r15,0x8(%r12)
    2fc7:	49 0f 46 5c 24 08    	cmovbe 0x8(%r12),%rbx
    2fcd:	48 85 db             	test   %rbx,%rbx
    2fd0:	74 e9                	je     2fbb <_copy_to_iter_mcsafe+0x43b>
    2fd2:	48 8d 04 1e          	lea    (%rsi,%rbx,1),%rax
    2fd6:	49 8b 3c 24          	mov    (%r12),%rdi
    2fda:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    2fde:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    2fe3:	48 89 da             	mov    %rbx,%rdx
    2fe6:	e8 00 00 00 00       	callq  2feb <_copy_to_iter_mcsafe+0x46b>
    2feb:	49 29 df             	sub    %rbx,%r15
    2fee:	75 5d                	jne    304d <_copy_to_iter_mcsafe+0x4cd>
    2ff0:	4d 89 f5             	mov    %r14,%r13
    2ff3:	4d 89 e6             	mov    %r12,%r14
    2ff6:	4c 8b 65 b0          	mov    -0x50(%rbp),%r12
    2ffa:	e9 ee fc ff ff       	jmpq   2ced <_copy_to_iter_mcsafe+0x16d>
    2fff:	31 c0                	xor    %eax,%eax
    3001:	e9 2f fc ff ff       	jmpq   2c35 <_copy_to_iter_mcsafe+0xb5>
    3006:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    300d:	4c 89 5d b8          	mov    %r11,-0x48(%rbp)
    3011:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 3018 <_copy_to_iter_mcsafe+0x498>
    3018:	e8 00 00 00 00       	callq  301d <_copy_to_iter_mcsafe+0x49d>
    301d:	0f 0b                	ud2    
    301f:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    3023:	4c 8b 5d b8          	mov    -0x48(%rbp),%r11
    3027:	e9 4f fe ff ff       	jmpq   2e7b <_copy_to_iter_mcsafe+0x2fb>
    302c:	48 89 da             	mov    %rbx,%rdx
    302f:	e8 00 00 00 00       	callq  3034 <_copy_to_iter_mcsafe+0x4b4>
    3034:	48 85 c0             	test   %rax,%rax
    3037:	74 b2                	je     2feb <_copy_to_iter_mcsafe+0x46b>
    3039:	4c 8b 65 b8          	mov    -0x48(%rbp),%r12
    303d:	4d 29 ec             	sub    %r13,%r12
    3040:	49 29 c4             	sub    %rax,%r12
    3043:	e9 2a fc ff ff       	jmpq   2c72 <_copy_to_iter_mcsafe+0xf2>
    3048:	e8 00 00 00 00       	callq  304d <_copy_to_iter_mcsafe+0x4cd>
    304d:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
    3051:	e9 65 ff ff ff       	jmpq   2fbb <_copy_to_iter_mcsafe+0x43b>
    3056:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    305d:	00 00 00 

0000000000003060 <iov_iter_zero>:
    3060:	55                   	push   %rbp
    3061:	48 89 e5             	mov    %rsp,%rbp
    3064:	41 57                	push   %r15
    3066:	41 56                	push   %r14
    3068:	41 55                	push   %r13
    306a:	41 54                	push   %r12
    306c:	49 89 fd             	mov    %rdi,%r13
    306f:	53                   	push   %rbx
    3070:	49 89 f4             	mov    %rsi,%r12
    3073:	48 83 ec 38          	sub    $0x38,%rsp
    3077:	8b 16                	mov    (%rsi),%edx
    3079:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    3080:	00 00 
    3082:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3086:	31 c0                	xor    %eax,%eax
    3088:	89 d0                	mov    %edx,%eax
    308a:	83 e0 fe             	and    $0xfffffffe,%eax
    308d:	83 f8 20             	cmp    $0x20,%eax
    3090:	0f 84 28 01 00 00    	je     31be <iov_iter_zero+0x15e>
    3096:	48 8b 46 10          	mov    0x10(%rsi),%rax
    309a:	48 39 f8             	cmp    %rdi,%rax
    309d:	4c 0f 46 e8          	cmovbe %rax,%r13
    30a1:	48 85 c0             	test   %rax,%rax
    30a4:	0f 84 9a 00 00 00    	je     3144 <iov_iter_zero+0xe4>
    30aa:	f6 c2 10             	test   $0x10,%dl
    30ad:	48 8b 5e 08          	mov    0x8(%rsi),%rbx
    30b1:	0f 85 61 01 00 00    	jne    3218 <iov_iter_zero+0x1b8>
    30b7:	f6 c2 08             	test   $0x8,%dl
    30ba:	0f 85 a9 00 00 00    	jne    3169 <iov_iter_zero+0x109>
    30c0:	83 e2 40             	and    $0x40,%edx
    30c3:	0f 85 64 02 00 00    	jne    332d <iov_iter_zero+0x2cd>
    30c9:	4c 8b 7e 18          	mov    0x18(%rsi),%r15
    30cd:	4d 8b 77 08          	mov    0x8(%r15),%r14
    30d1:	49 29 de             	sub    %rbx,%r14
    30d4:	4d 39 ee             	cmp    %r13,%r14
    30d7:	4d 0f 47 f5          	cmova  %r13,%r14
    30db:	4d 85 f6             	test   %r14,%r14
    30de:	0f 84 ed 02 00 00    	je     33d1 <iov_iter_zero+0x371>
    30e4:	49 8b 3f             	mov    (%r15),%rdi
    30e7:	4c 89 f6             	mov    %r14,%rsi
    30ea:	48 01 df             	add    %rbx,%rdi
    30ed:	e8 00 00 00 00       	callq  30f2 <iov_iter_zero+0x92>
    30f2:	4c 89 ee             	mov    %r13,%rsi
    30f5:	49 29 c6             	sub    %rax,%r14
    30f8:	4c 29 f6             	sub    %r14,%rsi
    30fb:	4c 01 f3             	add    %r14,%rbx
    30fe:	49 89 f6             	mov    %rsi,%r14
    3101:	48 85 c0             	test   %rax,%rax
    3104:	75 09                	jne    310f <iov_iter_zero+0xaf>
    3106:	4d 85 f6             	test   %r14,%r14
    3109:	0f 85 cf 00 00 00    	jne    31de <iov_iter_zero+0x17e>
    310f:	4d 29 f5             	sub    %r14,%r13
    3112:	49 39 5f 08          	cmp    %rbx,0x8(%r15)
    3116:	0f 84 97 00 00 00    	je     31b3 <iov_iter_zero+0x153>
    311c:	4c 89 f8             	mov    %r15,%rax
    311f:	49 2b 44 24 18       	sub    0x18(%r12),%rax
    3124:	4d 89 7c 24 18       	mov    %r15,0x18(%r12)
    3129:	48 c1 f8 04          	sar    $0x4,%rax
    312d:	49 29 44 24 20       	sub    %rax,0x20(%r12)
    3132:	49 8b 44 24 10       	mov    0x10(%r12),%rax
    3137:	4c 29 e8             	sub    %r13,%rax
    313a:	49 89 5c 24 08       	mov    %rbx,0x8(%r12)
    313f:	49 89 44 24 10       	mov    %rax,0x10(%r12)
    3144:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    3148:	65 48 33 34 25 28 00 	xor    %gs:0x28,%rsi
    314f:	00 00 
    3151:	4c 89 e8             	mov    %r13,%rax
    3154:	0f 85 af 02 00 00    	jne    3409 <iov_iter_zero+0x3a9>
    315a:	48 83 c4 38          	add    $0x38,%rsp
    315e:	5b                   	pop    %rbx
    315f:	41 5c                	pop    %r12
    3161:	41 5d                	pop    %r13
    3163:	41 5e                	pop    %r14
    3165:	41 5f                	pop    %r15
    3167:	5d                   	pop    %rbp
    3168:	c3                   	retq   
    3169:	4c 8b 7e 18          	mov    0x18(%rsi),%r15
    316d:	4d 8b 77 08          	mov    0x8(%r15),%r14
    3171:	49 29 de             	sub    %rbx,%r14
    3174:	4d 39 ee             	cmp    %r13,%r14
    3177:	4d 0f 47 f5          	cmova  %r13,%r14
    317b:	4d 85 f6             	test   %r14,%r14
    317e:	0f 84 57 02 00 00    	je     33db <iov_iter_zero+0x37b>
    3184:	49 8b 3f             	mov    (%r15),%rdi
    3187:	4c 89 f2             	mov    %r14,%rdx
    318a:	31 f6                	xor    %esi,%esi
    318c:	48 01 df             	add    %rbx,%rdi
    318f:	4c 01 f3             	add    %r14,%rbx
    3192:	e8 00 00 00 00       	callq  3197 <iov_iter_zero+0x137>
    3197:	4c 89 e8             	mov    %r13,%rax
    319a:	4c 29 f0             	sub    %r14,%rax
    319d:	49 89 c6             	mov    %rax,%r14
    31a0:	4d 85 f6             	test   %r14,%r14
    31a3:	0f 85 57 01 00 00    	jne    3300 <iov_iter_zero+0x2a0>
    31a9:	49 3b 5f 08          	cmp    0x8(%r15),%rbx
    31ad:	0f 85 69 ff ff ff    	jne    311c <iov_iter_zero+0xbc>
    31b3:	49 83 c7 10          	add    $0x10,%r15
    31b7:	31 db                	xor    %ebx,%ebx
    31b9:	e9 5e ff ff ff       	jmpq   311c <iov_iter_zero+0xbc>
    31be:	48 8b 5e 18          	mov    0x18(%rsi),%rbx
    31c2:	48 89 f7             	mov    %rsi,%rdi
    31c5:	44 8b 73 5c          	mov    0x5c(%rbx),%r14d
    31c9:	e8 e2 ce ff ff       	callq  b0 <sanity>
    31ce:	84 c0                	test   %al,%al
    31d0:	0f 85 5f 01 00 00    	jne    3335 <iov_iter_zero+0x2d5>
    31d6:	45 31 ed             	xor    %r13d,%r13d
    31d9:	e9 66 ff ff ff       	jmpq   3144 <iov_iter_zero+0xe4>
    31de:	49 83 c7 10          	add    $0x10,%r15
    31e2:	4c 89 f2             	mov    %r14,%rdx
    31e5:	4d 39 77 08          	cmp    %r14,0x8(%r15)
    31e9:	49 0f 46 57 08       	cmovbe 0x8(%r15),%rdx
    31ee:	48 85 d2             	test   %rdx,%rdx
    31f1:	0f 84 ec 01 00 00    	je     33e3 <iov_iter_zero+0x383>
    31f7:	49 8b 3f             	mov    (%r15),%rdi
    31fa:	48 89 d6             	mov    %rdx,%rsi
    31fd:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    3201:	e8 00 00 00 00       	callq  3206 <iov_iter_zero+0x1a6>
    3206:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
    320a:	48 29 c2             	sub    %rax,%rdx
    320d:	48 89 d3             	mov    %rdx,%rbx
    3210:	49 29 d6             	sub    %rdx,%r14
    3213:	e9 e9 fe ff ff       	jmpq   3101 <iov_iter_zero+0xa1>
    3218:	48 8b 56 18          	mov    0x18(%rsi),%rdx
    321c:	31 c9                	xor    %ecx,%ecx
    321e:	45 89 e9             	mov    %r13d,%r9d
    3221:	45 31 c0             	xor    %r8d,%r8d
    3224:	41 89 ce             	mov    %ecx,%r14d
    3227:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
    322b:	4c 89 c1             	mov    %r8,%rcx
    322e:	48 c1 e1 04          	shl    $0x4,%rcx
    3232:	45 85 c9             	test   %r9d,%r9d
    3235:	4c 8d 1c 0a          	lea    (%rdx,%rcx,1),%r11
    3239:	0f 84 a3 00 00 00    	je     32e2 <iov_iter_zero+0x282>
    323f:	41 8b 7b 0c          	mov    0xc(%r11),%edi
    3243:	41 8b 43 08          	mov    0x8(%r11),%eax
    3247:	41 bf 00 10 00 00    	mov    $0x1000,%r15d
    324d:	01 df                	add    %ebx,%edi
    324f:	29 d8                	sub    %ebx,%eax
    3251:	89 fe                	mov    %edi,%esi
    3253:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
    3259:	44 39 c8             	cmp    %r9d,%eax
    325c:	41 0f 47 c1          	cmova  %r9d,%eax
    3260:	41 29 f7             	sub    %esi,%r15d
    3263:	44 39 f8             	cmp    %r15d,%eax
    3266:	44 0f 46 f8          	cmovbe %eax,%r15d
    326a:	45 85 ff             	test   %r15d,%r15d
    326d:	74 34                	je     32a3 <iov_iter_zero+0x243>
    326f:	c1 ef 0c             	shr    $0xc,%edi
    3272:	44 89 fa             	mov    %r15d,%edx
    3275:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
    3279:	48 c1 e7 06          	shl    $0x6,%rdi
    327d:	49 03 3b             	add    (%r11),%rdi
    3280:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
    3284:	44 89 4d b8          	mov    %r9d,-0x48(%rbp)
    3288:	e8 c3 d3 ff ff       	callq  650 <memzero_page>
    328d:	44 8b 4d b8          	mov    -0x48(%rbp),%r9d
    3291:	49 8b 54 24 18       	mov    0x18(%r12),%rdx
    3296:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
    329a:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    329e:	45 39 f9             	cmp    %r15d,%r9d
    32a1:	72 2b                	jb     32ce <iov_iter_zero+0x26e>
    32a3:	45 29 f9             	sub    %r15d,%r9d
    32a6:	44 01 fb             	add    %r15d,%ebx
    32a9:	74 80                	je     322b <iov_iter_zero+0x1cb>
    32ab:	8b 44 0a 08          	mov    0x8(%rdx,%rcx,1),%eax
    32af:	39 d8                	cmp    %ebx,%eax
    32b1:	0f 87 74 ff ff ff    	ja     322b <iov_iter_zero+0x1cb>
    32b7:	45 8d 46 01          	lea    0x1(%r14),%r8d
    32bb:	4c 89 c1             	mov    %r8,%rcx
    32be:	4d 89 c6             	mov    %r8,%r14
    32c1:	48 c1 e1 04          	shl    $0x4,%rcx
    32c5:	29 c3                	sub    %eax,%ebx
    32c7:	75 e2                	jne    32ab <iov_iter_zero+0x24b>
    32c9:	e9 5d ff ff ff       	jmpq   322b <iov_iter_zero+0x1cb>
    32ce:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 32d5 <iov_iter_zero+0x275>
    32d5:	49 89 cf             	mov    %rcx,%r15
    32d8:	0f 84 0c 01 00 00    	je     33ea <iov_iter_zero+0x38a>
    32de:	4e 8d 1c 3a          	lea    (%rdx,%r15,1),%r11
    32e2:	4d 89 5c 24 18       	mov    %r11,0x18(%r12)
    32e7:	4c 2b 5d a0          	sub    -0x60(%rbp),%r11
    32eb:	89 db                	mov    %ebx,%ebx
    32ed:	49 8b 44 24 10       	mov    0x10(%r12),%rax
    32f2:	49 c1 fb 04          	sar    $0x4,%r11
    32f6:	4d 29 5c 24 20       	sub    %r11,0x20(%r12)
    32fb:	e9 37 fe ff ff       	jmpq   3137 <iov_iter_zero+0xd7>
    3300:	49 83 c7 10          	add    $0x10,%r15
    3304:	4c 89 f3             	mov    %r14,%rbx
    3307:	4d 39 77 08          	cmp    %r14,0x8(%r15)
    330b:	49 0f 46 5f 08       	cmovbe 0x8(%r15),%rbx
    3310:	48 85 db             	test   %rbx,%rbx
    3313:	74 eb                	je     3300 <iov_iter_zero+0x2a0>
    3315:	49 8b 3f             	mov    (%r15),%rdi
    3318:	31 f6                	xor    %esi,%esi
    331a:	48 89 da             	mov    %rbx,%rdx
    331d:	e8 00 00 00 00       	callq  3322 <iov_iter_zero+0x2c2>
    3322:	49 29 de             	sub    %rbx,%r14
    3325:	0f 84 7e fe ff ff    	je     31a9 <iov_iter_zero+0x149>
    332b:	eb d3                	jmp    3300 <iov_iter_zero+0x2a0>
    332d:	4c 01 eb             	add    %r13,%rbx
    3330:	e9 02 fe ff ff       	jmpq   3137 <iov_iter_zero+0xd7>
    3335:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
    3339:	48 8d 55 c4          	lea    -0x3c(%rbp),%rdx
    333d:	4c 89 ee             	mov    %r13,%rsi
    3340:	4c 89 e7             	mov    %r12,%rdi
    3343:	e8 48 cf ff ff       	callq  290 <push_pipe>
    3348:	48 85 c0             	test   %rax,%rax
    334b:	49 89 c5             	mov    %rax,%r13
    334e:	0f 84 82 fe ff ff    	je     31d6 <iov_iter_zero+0x176>
    3354:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
    3358:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    335b:	45 8d 7e ff          	lea    -0x1(%r14),%r15d
    335f:	4d 89 ee             	mov    %r13,%r14
    3362:	4c 89 6d b8          	mov    %r13,-0x48(%rbp)
    3366:	4d 89 e5             	mov    %r12,%r13
    3369:	4d 89 f4             	mov    %r14,%r12
    336c:	41 be 00 10 00 00    	mov    $0x1000,%r14d
    3372:	48 8b 93 90 00 00 00 	mov    0x90(%rbx),%rdx
    3379:	49 29 f6             	sub    %rsi,%r14
    337c:	4d 39 e6             	cmp    %r12,%r14
    337f:	4d 0f 47 f4          	cmova  %r12,%r14
    3383:	44 21 f8             	and    %r15d,%eax
    3386:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    338a:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
    338e:	4c 89 f2             	mov    %r14,%rdx
    3391:	48 8b 38             	mov    (%rax),%rdi
    3394:	e8 b7 d2 ff ff       	callq  650 <memzero_page>
    3399:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    339c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    33a0:	31 f6                	xor    %esi,%esi
    33a2:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
    33a9:	00 
    33aa:	4c 01 f2             	add    %r14,%rdx
    33ad:	41 89 45 20          	mov    %eax,0x20(%r13)
    33b1:	83 c0 01             	add    $0x1,%eax
    33b4:	4d 29 f4             	sub    %r14,%r12
    33b7:	49 89 55 08          	mov    %rdx,0x8(%r13)
    33bb:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    33be:	75 ac                	jne    336c <iov_iter_zero+0x30c>
    33c0:	4d 89 ec             	mov    %r13,%r12
    33c3:	4c 8b 6d b8          	mov    -0x48(%rbp),%r13
    33c7:	4d 29 6c 24 10       	sub    %r13,0x10(%r12)
    33cc:	e9 73 fd ff ff       	jmpq   3144 <iov_iter_zero+0xe4>
    33d1:	4d 89 ee             	mov    %r13,%r14
    33d4:	31 c0                	xor    %eax,%eax
    33d6:	e9 26 fd ff ff       	jmpq   3101 <iov_iter_zero+0xa1>
    33db:	4d 89 ee             	mov    %r13,%r14
    33de:	e9 bd fd ff ff       	jmpq   31a0 <iov_iter_zero+0x140>
    33e3:	31 c0                	xor    %eax,%eax
    33e5:	e9 17 fd ff ff       	jmpq   3101 <iov_iter_zero+0xa1>
    33ea:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    33f1:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 33f8 <iov_iter_zero+0x398>
    33f8:	e8 00 00 00 00       	callq  33fd <iov_iter_zero+0x39d>
    33fd:	0f 0b                	ud2    
    33ff:	49 8b 54 24 18       	mov    0x18(%r12),%rdx
    3404:	e9 d5 fe ff ff       	jmpq   32de <iov_iter_zero+0x27e>
    3409:	e8 00 00 00 00       	callq  340e <iov_iter_zero+0x3ae>
    340e:	66 90                	xchg   %ax,%ax

0000000000003410 <_copy_to_iter>:
    3410:	55                   	push   %rbp
    3411:	48 89 e5             	mov    %rsp,%rbp
    3414:	41 57                	push   %r15
    3416:	41 56                	push   %r14
    3418:	41 55                	push   %r13
    341a:	41 54                	push   %r12
    341c:	49 89 d5             	mov    %rdx,%r13
    341f:	53                   	push   %rbx
    3420:	48 83 ec 28          	sub    $0x28,%rsp
    3424:	8b 12                	mov    (%rdx),%edx
    3426:	89 d0                	mov    %edx,%eax
    3428:	83 e0 fe             	and    $0xfffffffe,%eax
    342b:	83 f8 20             	cmp    $0x20,%eax
    342e:	0f 84 cb 00 00 00    	je     34ff <_copy_to_iter+0xef>
    3434:	49 8b 45 10          	mov    0x10(%r13),%rax
    3438:	48 39 f0             	cmp    %rsi,%rax
    343b:	48 0f 46 f0          	cmovbe %rax,%rsi
    343f:	48 85 c0             	test   %rax,%rax
    3442:	49 89 f4             	mov    %rsi,%r12
    3445:	0f 84 a2 00 00 00    	je     34ed <_copy_to_iter+0xdd>
    344b:	f6 c2 10             	test   $0x10,%dl
    344e:	49 8b 5d 08          	mov    0x8(%r13),%rbx
    3452:	0f 85 fc 00 00 00    	jne    3554 <_copy_to_iter+0x144>
    3458:	f6 c2 08             	test   $0x8,%dl
    345b:	0f 85 d8 01 00 00    	jne    3639 <_copy_to_iter+0x229>
    3461:	83 e2 40             	and    $0x40,%edx
    3464:	0f 85 43 02 00 00    	jne    36ad <_copy_to_iter+0x29d>
    346a:	4d 8b 7d 18          	mov    0x18(%r13),%r15
    346e:	4d 8b 77 08          	mov    0x8(%r15),%r14
    3472:	49 29 de             	sub    %rbx,%r14
    3475:	49 39 f6             	cmp    %rsi,%r14
    3478:	4c 0f 47 f6          	cmova  %rsi,%r14
    347c:	4d 85 f6             	test   %r14,%r14
    347f:	0f 84 30 02 00 00    	je     36b5 <_copy_to_iter+0x2a5>
    3485:	4a 8d 04 37          	lea    (%rdi,%r14,1),%rax
    3489:	4c 89 f2             	mov    %r14,%rdx
    348c:	48 89 fe             	mov    %rdi,%rsi
    348f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3493:	49 8b 07             	mov    (%r15),%rax
    3496:	48 01 d8             	add    %rbx,%rax
    3499:	48 89 c7             	mov    %rax,%rdi
    349c:	e8 af d5 ff ff       	callq  a50 <copyout>
    34a1:	48 98                	cltq   
    34a3:	4c 89 e1             	mov    %r12,%rcx
    34a6:	49 29 c6             	sub    %rax,%r14
    34a9:	4c 29 f1             	sub    %r14,%rcx
    34ac:	4c 01 f3             	add    %r14,%rbx
    34af:	49 89 ce             	mov    %rcx,%r14
    34b2:	48 85 c0             	test   %rax,%rax
    34b5:	75 05                	jne    34bc <_copy_to_iter+0xac>
    34b7:	4d 85 f6             	test   %r14,%r14
    34ba:	75 50                	jne    350c <_copy_to_iter+0xfc>
    34bc:	4d 29 f4             	sub    %r14,%r12
    34bf:	49 39 5f 08          	cmp    %rbx,0x8(%r15)
    34c3:	75 06                	jne    34cb <_copy_to_iter+0xbb>
    34c5:	49 83 c7 10          	add    $0x10,%r15
    34c9:	31 db                	xor    %ebx,%ebx
    34cb:	4c 89 f8             	mov    %r15,%rax
    34ce:	49 2b 45 18          	sub    0x18(%r13),%rax
    34d2:	4d 89 7d 18          	mov    %r15,0x18(%r13)
    34d6:	48 c1 f8 04          	sar    $0x4,%rax
    34da:	49 29 45 20          	sub    %rax,0x20(%r13)
    34de:	49 8b 45 10          	mov    0x10(%r13),%rax
    34e2:	4c 29 e0             	sub    %r12,%rax
    34e5:	49 89 5d 08          	mov    %rbx,0x8(%r13)
    34e9:	49 89 45 10          	mov    %rax,0x10(%r13)
    34ed:	48 83 c4 28          	add    $0x28,%rsp
    34f1:	4c 89 e0             	mov    %r12,%rax
    34f4:	5b                   	pop    %rbx
    34f5:	41 5c                	pop    %r12
    34f7:	41 5d                	pop    %r13
    34f9:	41 5e                	pop    %r14
    34fb:	41 5f                	pop    %r15
    34fd:	5d                   	pop    %rbp
    34fe:	c3                   	retq   
    34ff:	4c 89 ea             	mov    %r13,%rdx
    3502:	e8 d9 cf ff ff       	callq  4e0 <copy_pipe_to_iter>
    3507:	49 89 c4             	mov    %rax,%r12
    350a:	eb e1                	jmp    34ed <_copy_to_iter+0xdd>
    350c:	49 83 c7 10          	add    $0x10,%r15
    3510:	4c 89 f1             	mov    %r14,%rcx
    3513:	4d 39 77 08          	cmp    %r14,0x8(%r15)
    3517:	49 0f 46 4f 08       	cmovbe 0x8(%r15),%rcx
    351c:	48 85 c9             	test   %rcx,%rcx
    351f:	0f 84 32 02 00 00    	je     3757 <_copy_to_iter+0x347>
    3525:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    3529:	49 8b 3f             	mov    (%r15),%rdi
    352c:	48 89 ca             	mov    %rcx,%rdx
    352f:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    3533:	48 8d 04 0e          	lea    (%rsi,%rcx,1),%rax
    3537:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    353b:	e8 10 d5 ff ff       	callq  a50 <copyout>
    3540:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    3544:	48 98                	cltq   
    3546:	48 29 c1             	sub    %rax,%rcx
    3549:	48 89 cb             	mov    %rcx,%rbx
    354c:	49 29 ce             	sub    %rcx,%r14
    354f:	e9 5e ff ff ff       	jmpq   34b2 <_copy_to_iter+0xa2>
    3554:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    3558:	31 c0                	xor    %eax,%eax
    355a:	41 89 f1             	mov    %esi,%r9d
    355d:	45 31 c0             	xor    %r8d,%r8d
    3560:	41 89 c6             	mov    %eax,%r14d
    3563:	49 89 f3             	mov    %rsi,%r11
    3566:	4d 89 ea             	mov    %r13,%r10
    3569:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    356d:	4d 89 c5             	mov    %r8,%r13
    3570:	49 c1 e5 04          	shl    $0x4,%r13
    3574:	45 85 c9             	test   %r9d,%r9d
    3577:	4a 8d 14 29          	lea    (%rcx,%r13,1),%rdx
    357b:	0f 84 7a 01 00 00    	je     36fb <_copy_to_iter+0x2eb>
    3581:	8b 42 0c             	mov    0xc(%rdx),%eax
    3584:	44 8b 7a 08          	mov    0x8(%rdx),%r15d
    3588:	41 bc 00 10 00 00    	mov    $0x1000,%r12d
    358e:	01 d8                	add    %ebx,%eax
    3590:	41 29 df             	sub    %ebx,%r15d
    3593:	89 c6                	mov    %eax,%esi
    3595:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
    359b:	45 39 cf             	cmp    %r9d,%r15d
    359e:	45 0f 47 f9          	cmova  %r9d,%r15d
    35a2:	41 29 f4             	sub    %esi,%r12d
    35a5:	45 39 e7             	cmp    %r12d,%r15d
    35a8:	45 0f 47 fc          	cmova  %r12d,%r15d
    35ac:	45 85 ff             	test   %r15d,%r15d
    35af:	74 4c                	je     35fd <_copy_to_iter+0x1ed>
    35b1:	c1 e8 0c             	shr    $0xc,%eax
    35b4:	44 89 f9             	mov    %r15d,%ecx
    35b7:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
    35bb:	48 c1 e0 06          	shl    $0x6,%rax
    35bf:	48 03 02             	add    (%rdx),%rax
    35c2:	4c 8d 24 0f          	lea    (%rdi,%rcx,1),%r12
    35c6:	48 89 fa             	mov    %rdi,%rdx
    35c9:	4c 89 55 c0          	mov    %r10,-0x40(%rbp)
    35cd:	4c 89 5d c8          	mov    %r11,-0x38(%rbp)
    35d1:	44 89 4d d0          	mov    %r9d,-0x30(%rbp)
    35d5:	48 89 c7             	mov    %rax,%rdi
    35d8:	e8 b3 ce ff ff       	callq  490 <memcpy_to_page>
    35dd:	44 8b 4d d0          	mov    -0x30(%rbp),%r9d
    35e1:	4c 8b 55 c0          	mov    -0x40(%rbp),%r10
    35e5:	4c 8b 5d c8          	mov    -0x38(%rbp),%r11
    35e9:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
    35ed:	45 39 f9             	cmp    %r15d,%r9d
    35f0:	49 8b 4a 18          	mov    0x18(%r10),%rcx
    35f4:	0f 82 c9 00 00 00    	jb     36c3 <_copy_to_iter+0x2b3>
    35fa:	4c 89 e7             	mov    %r12,%rdi
    35fd:	45 29 f9             	sub    %r15d,%r9d
    3600:	44 01 fb             	add    %r15d,%ebx
    3603:	0f 84 64 ff ff ff    	je     356d <_copy_to_iter+0x15d>
    3609:	42 8b 44 29 08       	mov    0x8(%rcx,%r13,1),%eax
    360e:	39 c3                	cmp    %eax,%ebx
    3610:	0f 82 57 ff ff ff    	jb     356d <_copy_to_iter+0x15d>
    3616:	45 8d 46 01          	lea    0x1(%r14),%r8d
    361a:	4c 89 c2             	mov    %r8,%rdx
    361d:	4d 89 c6             	mov    %r8,%r14
    3620:	48 c1 e2 04          	shl    $0x4,%rdx
    3624:	29 c3                	sub    %eax,%ebx
    3626:	0f 84 41 ff ff ff    	je     356d <_copy_to_iter+0x15d>
    362c:	8b 44 11 08          	mov    0x8(%rcx,%rdx,1),%eax
    3630:	39 d8                	cmp    %ebx,%eax
    3632:	76 e2                	jbe    3616 <_copy_to_iter+0x206>
    3634:	e9 34 ff ff ff       	jmpq   356d <_copy_to_iter+0x15d>
    3639:	4d 8b 75 18          	mov    0x18(%r13),%r14
    363d:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    3641:	49 29 df             	sub    %rbx,%r15
    3644:	49 39 f7             	cmp    %rsi,%r15
    3647:	4c 0f 47 fe          	cmova  %rsi,%r15
    364b:	4d 85 ff             	test   %r15,%r15
    364e:	0f 84 af 00 00 00    	je     3703 <_copy_to_iter+0x2f3>
    3654:	4a 8d 04 3f          	lea    (%rdi,%r15,1),%rax
    3658:	4c 89 fa             	mov    %r15,%rdx
    365b:	48 89 fe             	mov    %rdi,%rsi
    365e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3662:	49 8b 06             	mov    (%r14),%rax
    3665:	48 01 d8             	add    %rbx,%rax
    3668:	4c 01 fb             	add    %r15,%rbx
    366b:	48 89 c7             	mov    %rax,%rdi
    366e:	e8 00 00 00 00       	callq  3673 <_copy_to_iter+0x263>
    3673:	4c 89 e0             	mov    %r12,%rax
    3676:	4c 29 f8             	sub    %r15,%rax
    3679:	49 89 c7             	mov    %rax,%r15
    367c:	4d 85 ff             	test   %r15,%r15
    367f:	0f 85 8a 00 00 00    	jne    370f <_copy_to_iter+0x2ff>
    3685:	49 3b 5e 08          	cmp    0x8(%r14),%rbx
    3689:	75 06                	jne    3691 <_copy_to_iter+0x281>
    368b:	49 83 c6 10          	add    $0x10,%r14
    368f:	31 db                	xor    %ebx,%ebx
    3691:	4c 89 f0             	mov    %r14,%rax
    3694:	49 2b 45 18          	sub    0x18(%r13),%rax
    3698:	4d 89 75 18          	mov    %r14,0x18(%r13)
    369c:	48 c1 f8 04          	sar    $0x4,%rax
    36a0:	49 29 45 20          	sub    %rax,0x20(%r13)
    36a4:	49 8b 45 10          	mov    0x10(%r13),%rax
    36a8:	e9 35 fe ff ff       	jmpq   34e2 <_copy_to_iter+0xd2>
    36ad:	48 01 f3             	add    %rsi,%rbx
    36b0:	e9 2d fe ff ff       	jmpq   34e2 <_copy_to_iter+0xd2>
    36b5:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    36b9:	49 89 f6             	mov    %rsi,%r14
    36bc:	31 c0                	xor    %eax,%eax
    36be:	e9 ef fd ff ff       	jmpq   34b2 <_copy_to_iter+0xa2>
    36c3:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 36ca <_copy_to_iter+0x2ba>
    36ca:	4c 89 d0             	mov    %r10,%rax
    36cd:	4d 89 dc             	mov    %r11,%r12
    36d0:	4d 89 ea             	mov    %r13,%r10
    36d3:	49 89 c5             	mov    %rax,%r13
    36d6:	0f 84 82 00 00 00    	je     375e <_copy_to_iter+0x34e>
    36dc:	4a 8d 14 11          	lea    (%rcx,%r10,1),%rdx
    36e0:	49 89 55 18          	mov    %rdx,0x18(%r13)
    36e4:	48 2b 55 b0          	sub    -0x50(%rbp),%rdx
    36e8:	89 db                	mov    %ebx,%ebx
    36ea:	49 8b 45 10          	mov    0x10(%r13),%rax
    36ee:	48 c1 fa 04          	sar    $0x4,%rdx
    36f2:	49 29 55 20          	sub    %rdx,0x20(%r13)
    36f6:	e9 e7 fd ff ff       	jmpq   34e2 <_copy_to_iter+0xd2>
    36fb:	4d 89 dc             	mov    %r11,%r12
    36fe:	4d 89 d5             	mov    %r10,%r13
    3701:	eb dd                	jmp    36e0 <_copy_to_iter+0x2d0>
    3703:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    3707:	49 89 f7             	mov    %rsi,%r15
    370a:	e9 6d ff ff ff       	jmpq   367c <_copy_to_iter+0x26c>
    370f:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    3713:	4c 89 e8             	mov    %r13,%rax
    3716:	4d 89 e5             	mov    %r12,%r13
    3719:	49 89 c4             	mov    %rax,%r12
    371c:	49 83 c6 10          	add    $0x10,%r14
    3720:	4c 89 fb             	mov    %r15,%rbx
    3723:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    3727:	49 0f 46 5e 08       	cmovbe 0x8(%r14),%rbx
    372c:	48 85 db             	test   %rbx,%rbx
    372f:	74 eb                	je     371c <_copy_to_iter+0x30c>
    3731:	49 8b 3e             	mov    (%r14),%rdi
    3734:	48 8d 04 1e          	lea    (%rsi,%rbx,1),%rax
    3738:	48 89 da             	mov    %rbx,%rdx
    373b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    373f:	e8 00 00 00 00       	callq  3744 <_copy_to_iter+0x334>
    3744:	49 29 df             	sub    %rbx,%r15
    3747:	75 3b                	jne    3784 <_copy_to_iter+0x374>
    3749:	4c 89 e0             	mov    %r12,%rax
    374c:	4d 89 ec             	mov    %r13,%r12
    374f:	49 89 c5             	mov    %rax,%r13
    3752:	e9 2e ff ff ff       	jmpq   3685 <_copy_to_iter+0x275>
    3757:	31 c0                	xor    %eax,%eax
    3759:	e9 54 fd ff ff       	jmpq   34b2 <_copy_to_iter+0xa2>
    375e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    3765:	4c 89 55 d0          	mov    %r10,-0x30(%rbp)
    3769:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 3770 <_copy_to_iter+0x360>
    3770:	e8 00 00 00 00       	callq  3775 <_copy_to_iter+0x365>
    3775:	0f 0b                	ud2    
    3777:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    377b:	4c 8b 55 d0          	mov    -0x30(%rbp),%r10
    377f:	e9 58 ff ff ff       	jmpq   36dc <_copy_to_iter+0x2cc>
    3784:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    3788:	eb 92                	jmp    371c <_copy_to_iter+0x30c>
    378a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000003790 <copy_page_to_iter>:
    3790:	55                   	push   %rbp
    3791:	48 89 f0             	mov    %rsi,%rax
    3794:	48 01 d0             	add    %rdx,%rax
    3797:	48 89 e5             	mov    %rsp,%rbp
    379a:	49 89 c0             	mov    %rax,%r8
    379d:	41 55                	push   %r13
    379f:	49 89 cd             	mov    %rcx,%r13
    37a2:	41 54                	push   %r12
    37a4:	53                   	push   %rbx
    37a5:	72 37                	jb     37de <copy_page_to_iter+0x4e>
    37a7:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
    37ad:	77 2f                	ja     37de <copy_page_to_iter+0x4e>
    37af:	41 8b 45 00          	mov    0x0(%r13),%eax
    37b3:	49 89 d4             	mov    %rdx,%r12
    37b6:	a8 18                	test   $0x18,%al
    37b8:	75 62                	jne    381c <copy_page_to_iter+0x8c>
    37ba:	83 e0 fe             	and    $0xfffffffe,%eax
    37bd:	83 f8 40             	cmp    $0x40,%eax
    37c0:	0f 84 da 00 00 00    	je     38a0 <copy_page_to_iter+0x110>
    37c6:	83 f8 20             	cmp    $0x20,%eax
    37c9:	4c 89 e9             	mov    %r13,%rcx
    37cc:	0f 84 dc 00 00 00    	je     38ae <copy_page_to_iter+0x11e>
    37d2:	e8 a9 d2 ff ff       	callq  a80 <copy_page_to_iter_iovec>
    37d7:	5b                   	pop    %rbx
    37d8:	41 5c                	pop    %r12
    37da:	41 5d                	pop    %r13
    37dc:	5d                   	pop    %rbp
    37dd:	c3                   	retq   
    37de:	4c 8b 4f 08          	mov    0x8(%rdi),%r9
    37e2:	48 89 f9             	mov    %rdi,%rcx
    37e5:	41 f6 c1 01          	test   $0x1,%r9b
    37e9:	0f 85 97 00 00 00    	jne    3886 <copy_page_to_iter+0xf6>
    37ef:	4c 39 c2             	cmp    %r8,%rdx
    37f2:	77 1d                	ja     3811 <copy_page_to_iter+0x81>
    37f4:	4c 8b 09             	mov    (%rcx),%r9
    37f7:	b8 00 10 00 00       	mov    $0x1000,%eax
    37fc:	41 f7 c1 00 00 01 00 	test   $0x10000,%r9d
    3803:	74 07                	je     380c <copy_page_to_iter+0x7c>
    3805:	0f b6 49 51          	movzbl 0x51(%rcx),%ecx
    3809:	48 d3 e0             	shl    %cl,%rax
    380c:	4c 39 c0             	cmp    %r8,%rax
    380f:	73 9e                	jae    37af <copy_page_to_iter+0x1f>
    3811:	0f 0b                	ud2    
    3813:	31 c0                	xor    %eax,%eax
    3815:	5b                   	pop    %rbx
    3816:	41 5c                	pop    %r12
    3818:	41 5d                	pop    %r13
    381a:	5d                   	pop    %rbp
    381b:	c3                   	retq   
    381c:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    3823:	00 00 
    3825:	83 80 80 12 00 00 01 	addl   $0x1,0x1280(%rax)
    382c:	48 2b 3d 00 00 00 00 	sub    0x0(%rip),%rdi        # 3833 <copy_page_to_iter+0xa3>
    3833:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 383a <copy_page_to_iter+0xaa>
    383a:	48 c1 ff 06          	sar    $0x6,%rdi
    383e:	48 c1 e7 0c          	shl    $0xc,%rdi
    3842:	48 01 fb             	add    %rdi,%rbx
    3845:	48 01 f3             	add    %rsi,%rbx
    3848:	48 81 fa ff ff ff 7f 	cmp    $0x7fffffff,%rdx
    384f:	77 57                	ja     38a8 <copy_page_to_iter+0x118>
    3851:	ba 01 00 00 00       	mov    $0x1,%edx
    3856:	4c 89 e6             	mov    %r12,%rsi
    3859:	48 89 df             	mov    %rbx,%rdi
    385c:	e8 00 00 00 00       	callq  3861 <copy_page_to_iter+0xd1>
    3861:	4c 89 ea             	mov    %r13,%rdx
    3864:	4c 89 e6             	mov    %r12,%rsi
    3867:	48 89 df             	mov    %rbx,%rdi
    386a:	e8 00 00 00 00       	callq  386f <copy_page_to_iter+0xdf>
    386f:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    3876:	00 00 
    3878:	83 aa 80 12 00 00 01 	subl   $0x1,0x1280(%rdx)
    387f:	5b                   	pop    %rbx
    3880:	41 5c                	pop    %r12
    3882:	41 5d                	pop    %r13
    3884:	5d                   	pop    %rbp
    3885:	c3                   	retq   
    3886:	49 8d 49 ff          	lea    -0x1(%r9),%rcx
    388a:	49 89 f8             	mov    %rdi,%r8
    388d:	49 29 c8             	sub    %rcx,%r8
    3890:	49 c1 f8 06          	sar    $0x6,%r8
    3894:	49 c1 e0 0c          	shl    $0xc,%r8
    3898:	49 01 c0             	add    %rax,%r8
    389b:	e9 4f ff ff ff       	jmpq   37ef <copy_page_to_iter+0x5f>
    38a0:	48 89 d0             	mov    %rdx,%rax
    38a3:	e9 2f ff ff ff       	jmpq   37d7 <copy_page_to_iter+0x47>
    38a8:	0f 0b                	ud2    
    38aa:	31 c0                	xor    %eax,%eax
    38ac:	eb c1                	jmp    386f <copy_page_to_iter+0xdf>
    38ae:	e8 cd c8 ff ff       	callq  180 <copy_page_to_iter_pipe>
    38b3:	e9 1f ff ff ff       	jmpq   37d7 <copy_page_to_iter+0x47>
    38b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    38bf:	00 

00000000000038c0 <hash_and_copy_to_iter>:
    38c0:	55                   	push   %rbp
    38c1:	48 89 e5             	mov    %rsp,%rbp
    38c4:	41 57                	push   %r15
    38c6:	41 56                	push   %r14
    38c8:	41 55                	push   %r13
    38ca:	41 54                	push   %r12
    38cc:	49 89 fc             	mov    %rdi,%r12
    38cf:	53                   	push   %rbx
    38d0:	48 89 d3             	mov    %rdx,%rbx
    38d3:	48 83 ec 28          	sub    $0x28,%rsp
    38d7:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    38de:	00 00 
    38e0:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    38e4:	31 c0                	xor    %eax,%eax
    38e6:	48 81 fe ff ff ff 7f 	cmp    $0x7fffffff,%rsi
    38ed:	77 77                	ja     3966 <hash_and_copy_to_iter+0xa6>
    38ef:	49 89 ce             	mov    %rcx,%r14
    38f2:	49 89 f5             	mov    %rsi,%r13
    38f5:	ba 01 00 00 00       	mov    $0x1,%edx
    38fa:	e8 00 00 00 00       	callq  38ff <hash_and_copy_to_iter+0x3f>
    38ff:	4c 89 f2             	mov    %r14,%rdx
    3902:	4c 89 ee             	mov    %r13,%rsi
    3905:	4c 89 e7             	mov    %r12,%rdi
    3908:	e8 00 00 00 00       	callq  390d <hash_and_copy_to_iter+0x4d>
    390d:	49 89 c7             	mov    %rax,%r15
    3910:	41 89 c6             	mov    %eax,%r14d
    3913:	4c 8d 6d b0          	lea    -0x50(%rbp),%r13
    3917:	44 89 f2             	mov    %r14d,%edx
    391a:	4c 89 e6             	mov    %r12,%rsi
    391d:	4c 89 ef             	mov    %r13,%rdi
    3920:	e8 00 00 00 00       	callq  3925 <hash_and_copy_to_iter+0x65>
    3925:	48 8b 43 20          	mov    0x20(%rbx),%rax
    3929:	4c 89 6b 38          	mov    %r13,0x38(%rbx)
    392d:	48 89 df             	mov    %rbx,%rdi
    3930:	44 89 73 30          	mov    %r14d,0x30(%rbx)
    3934:	48 c7 43 40 00 00 00 	movq   $0x0,0x40(%rbx)
    393b:	00 
    393c:	48 8b 40 c0          	mov    -0x40(%rax),%rax
    3940:	e8 00 00 00 00       	callq  3945 <hash_and_copy_to_iter+0x85>
    3945:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    3949:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
    3950:	00 00 
    3952:	4c 89 f8             	mov    %r15,%rax
    3955:	75 19                	jne    3970 <hash_and_copy_to_iter+0xb0>
    3957:	48 83 c4 28          	add    $0x28,%rsp
    395b:	5b                   	pop    %rbx
    395c:	41 5c                	pop    %r12
    395e:	41 5d                	pop    %r13
    3960:	41 5e                	pop    %r14
    3962:	41 5f                	pop    %r15
    3964:	5d                   	pop    %rbp
    3965:	c3                   	retq   
    3966:	0f 0b                	ud2    
    3968:	45 31 f6             	xor    %r14d,%r14d
    396b:	45 31 ff             	xor    %r15d,%r15d
    396e:	eb a3                	jmp    3913 <hash_and_copy_to_iter+0x53>
    3970:	e8 00 00 00 00       	callq  3975 <hash_and_copy_to_iter+0xb5>
    3975:	90                   	nop
    3976:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    397d:	00 00 00 

0000000000003980 <copy_to_iter_bpf>:
    3980:	55                   	push   %rbp
    3981:	48 81 fe ff ff ff 7f 	cmp    $0x7fffffff,%rsi
    3988:	48 89 e5             	mov    %rsp,%rbp
    398b:	41 55                	push   %r13
    398d:	41 54                	push   %r12
    398f:	53                   	push   %rbx
    3990:	77 28                	ja     39ba <copy_to_iter_bpf+0x3a>
    3992:	49 89 d5             	mov    %rdx,%r13
    3995:	48 89 f3             	mov    %rsi,%rbx
    3998:	49 89 fc             	mov    %rdi,%r12
    399b:	ba 01 00 00 00       	mov    $0x1,%edx
    39a0:	e8 00 00 00 00       	callq  39a5 <copy_to_iter_bpf+0x25>
    39a5:	4c 89 ea             	mov    %r13,%rdx
    39a8:	48 89 de             	mov    %rbx,%rsi
    39ab:	4c 89 e7             	mov    %r12,%rdi
    39ae:	e8 00 00 00 00       	callq  39b3 <copy_to_iter_bpf+0x33>
    39b3:	5b                   	pop    %rbx
    39b4:	41 5c                	pop    %r12
    39b6:	41 5d                	pop    %r13
    39b8:	5d                   	pop    %rbp
    39b9:	c3                   	retq   
    39ba:	0f 0b                	ud2    
    39bc:	31 c0                	xor    %eax,%eax
    39be:	eb f3                	jmp    39b3 <copy_to_iter_bpf+0x33>

00000000000039c0 <copy_page_to_iter_bpf>:
    39c0:	55                   	push   %rbp
    39c1:	48 89 f0             	mov    %rsi,%rax
    39c4:	49 89 c9             	mov    %rcx,%r9
    39c7:	48 01 d0             	add    %rdx,%rax
    39ca:	48 89 e5             	mov    %rsp,%rbp
    39cd:	49 89 c0             	mov    %rax,%r8
    39d0:	53                   	push   %rbx
    39d1:	72 32                	jb     3a05 <copy_page_to_iter_bpf+0x45>
    39d3:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
    39d9:	77 2a                	ja     3a05 <copy_page_to_iter_bpf+0x45>
    39db:	48 89 d0             	mov    %rdx,%rax
    39de:	41 8b 11             	mov    (%r9),%edx
    39e1:	f6 c2 18             	test   $0x18,%dl
    39e4:	75 55                	jne    3a3b <copy_page_to_iter_bpf+0x7b>
    39e6:	83 e2 fe             	and    $0xfffffffe,%edx
    39e9:	83 fa 40             	cmp    $0x40,%edx
    39ec:	74 14                	je     3a02 <copy_page_to_iter_bpf+0x42>
    39ee:	83 fa 20             	cmp    $0x20,%edx
    39f1:	4c 89 c9             	mov    %r9,%rcx
    39f4:	48 89 c2             	mov    %rax,%rdx
    39f7:	0f 84 93 00 00 00    	je     3a90 <copy_page_to_iter_bpf+0xd0>
    39fd:	e8 7e d0 ff ff       	callq  a80 <copy_page_to_iter_iovec>
    3a02:	5b                   	pop    %rbx
    3a03:	5d                   	pop    %rbp
    3a04:	c3                   	retq   
    3a05:	4c 8b 57 08          	mov    0x8(%rdi),%r10
    3a09:	48 89 f9             	mov    %rdi,%rcx
    3a0c:	41 f6 c2 01          	test   $0x1,%r10b
    3a10:	75 67                	jne    3a79 <copy_page_to_iter_bpf+0xb9>
    3a12:	4c 39 c2             	cmp    %r8,%rdx
    3a15:	77 1d                	ja     3a34 <copy_page_to_iter_bpf+0x74>
    3a17:	4c 8b 11             	mov    (%rcx),%r10
    3a1a:	b8 00 10 00 00       	mov    $0x1000,%eax
    3a1f:	41 f7 c2 00 00 01 00 	test   $0x10000,%r10d
    3a26:	74 07                	je     3a2f <copy_page_to_iter_bpf+0x6f>
    3a28:	0f b6 49 51          	movzbl 0x51(%rcx),%ecx
    3a2c:	48 d3 e0             	shl    %cl,%rax
    3a2f:	49 39 c0             	cmp    %rax,%r8
    3a32:	76 a7                	jbe    39db <copy_page_to_iter_bpf+0x1b>
    3a34:	0f 0b                	ud2    
    3a36:	31 c0                	xor    %eax,%eax
    3a38:	5b                   	pop    %rbx
    3a39:	5d                   	pop    %rbp
    3a3a:	c3                   	retq   
    3a3b:	65 48 8b 1c 25 00 00 	mov    %gs:0x0,%rbx
    3a42:	00 00 
    3a44:	83 83 80 12 00 00 01 	addl   $0x1,0x1280(%rbx)
    3a4b:	48 2b 3d 00 00 00 00 	sub    0x0(%rip),%rdi        # 3a52 <copy_page_to_iter_bpf+0x92>
    3a52:	4c 89 ca             	mov    %r9,%rdx
    3a55:	48 c1 ff 06          	sar    $0x6,%rdi
    3a59:	48 c1 e7 0c          	shl    $0xc,%rdi
    3a5d:	48 03 3d 00 00 00 00 	add    0x0(%rip),%rdi        # 3a64 <copy_page_to_iter_bpf+0xa4>
    3a64:	48 01 f7             	add    %rsi,%rdi
    3a67:	48 89 c6             	mov    %rax,%rsi
    3a6a:	e8 11 ff ff ff       	callq  3980 <copy_to_iter_bpf>
    3a6f:	83 ab 80 12 00 00 01 	subl   $0x1,0x1280(%rbx)
    3a76:	5b                   	pop    %rbx
    3a77:	5d                   	pop    %rbp
    3a78:	c3                   	retq   
    3a79:	49 8d 4a ff          	lea    -0x1(%r10),%rcx
    3a7d:	49 89 f8             	mov    %rdi,%r8
    3a80:	49 29 c8             	sub    %rcx,%r8
    3a83:	49 c1 f8 06          	sar    $0x6,%r8
    3a87:	49 c1 e0 0c          	shl    $0xc,%r8
    3a8b:	49 01 c0             	add    %rax,%r8
    3a8e:	eb 82                	jmp    3a12 <copy_page_to_iter_bpf+0x52>
    3a90:	e8 eb c6 ff ff       	callq  180 <copy_page_to_iter_pipe>
    3a95:	e9 68 ff ff ff       	jmpq   3a02 <copy_page_to_iter_bpf+0x42>
    3a9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000003aa0 <_copy_to_iter_bpf>:
    3aa0:	55                   	push   %rbp
    3aa1:	48 89 e5             	mov    %rsp,%rbp
    3aa4:	e8 00 00 00 00       	callq  3aa9 <_copy_to_iter_bpf+0x9>
    3aa9:	5d                   	pop    %rbp
    3aaa:	c3                   	retq   
    3aab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003ab0 <_copy_from_iter>:
    3ab0:	55                   	push   %rbp
    3ab1:	48 89 e5             	mov    %rsp,%rbp
    3ab4:	41 57                	push   %r15
    3ab6:	41 56                	push   %r14
    3ab8:	41 55                	push   %r13
    3aba:	41 54                	push   %r12
    3abc:	49 89 d5             	mov    %rdx,%r13
    3abf:	53                   	push   %rbx
    3ac0:	48 83 ec 10          	sub    $0x10,%rsp
    3ac4:	8b 12                	mov    (%rdx),%edx
    3ac6:	89 d0                	mov    %edx,%eax
    3ac8:	83 e0 fe             	and    $0xfffffffe,%eax
    3acb:	83 f8 20             	cmp    $0x20,%eax
    3ace:	0f 84 c5 00 00 00    	je     3b99 <_copy_from_iter+0xe9>
    3ad4:	49 8b 45 10          	mov    0x10(%r13),%rax
    3ad8:	48 39 f0             	cmp    %rsi,%rax
    3adb:	48 0f 46 f0          	cmovbe %rax,%rsi
    3adf:	48 85 c0             	test   %rax,%rax
    3ae2:	49 89 f4             	mov    %rsi,%r12
    3ae5:	0f 84 9c 00 00 00    	je     3b87 <_copy_from_iter+0xd7>
    3aeb:	f6 c2 10             	test   $0x10,%dl
    3aee:	49 8b 5d 08          	mov    0x8(%r13),%rbx
    3af2:	0f 85 f0 00 00 00    	jne    3be8 <_copy_from_iter+0x138>
    3af8:	f6 c2 08             	test   $0x8,%dl
    3afb:	0f 85 c1 01 00 00    	jne    3cc2 <_copy_from_iter+0x212>
    3b01:	83 e2 40             	and    $0x40,%edx
    3b04:	0f 85 22 02 00 00    	jne    3d2c <_copy_from_iter+0x27c>
    3b0a:	4d 8b 7d 18          	mov    0x18(%r13),%r15
    3b0e:	4d 8b 77 08          	mov    0x8(%r15),%r14
    3b12:	49 29 de             	sub    %rbx,%r14
    3b15:	49 39 f6             	cmp    %rsi,%r14
    3b18:	4c 0f 47 f6          	cmova  %rsi,%r14
    3b1c:	4d 85 f6             	test   %r14,%r14
    3b1f:	0f 84 0f 02 00 00    	je     3d34 <_copy_from_iter+0x284>
    3b25:	49 8b 37             	mov    (%r15),%rsi
    3b28:	4a 8d 04 37          	lea    (%rdi,%r14,1),%rax
    3b2c:	4c 89 f2             	mov    %r14,%rdx
    3b2f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3b33:	48 01 de             	add    %rbx,%rsi
    3b36:	e8 75 d0 ff ff       	callq  bb0 <copyin>
    3b3b:	48 98                	cltq   
    3b3d:	4c 89 e1             	mov    %r12,%rcx
    3b40:	49 29 c6             	sub    %rax,%r14
    3b43:	4c 29 f1             	sub    %r14,%rcx
    3b46:	4c 01 f3             	add    %r14,%rbx
    3b49:	49 89 ce             	mov    %rcx,%r14
    3b4c:	48 85 c0             	test   %rax,%rax
    3b4f:	75 05                	jne    3b56 <_copy_from_iter+0xa6>
    3b51:	4d 85 f6             	test   %r14,%r14
    3b54:	75 4a                	jne    3ba0 <_copy_from_iter+0xf0>
    3b56:	4d 29 f4             	sub    %r14,%r12
    3b59:	49 39 5f 08          	cmp    %rbx,0x8(%r15)
    3b5d:	75 06                	jne    3b65 <_copy_from_iter+0xb5>
    3b5f:	49 83 c7 10          	add    $0x10,%r15
    3b63:	31 db                	xor    %ebx,%ebx
    3b65:	4c 89 f8             	mov    %r15,%rax
    3b68:	49 2b 45 18          	sub    0x18(%r13),%rax
    3b6c:	4d 89 7d 18          	mov    %r15,0x18(%r13)
    3b70:	48 c1 f8 04          	sar    $0x4,%rax
    3b74:	49 29 45 20          	sub    %rax,0x20(%r13)
    3b78:	49 8b 45 10          	mov    0x10(%r13),%rax
    3b7c:	4c 29 e0             	sub    %r12,%rax
    3b7f:	49 89 5d 08          	mov    %rbx,0x8(%r13)
    3b83:	49 89 45 10          	mov    %rax,0x10(%r13)
    3b87:	48 83 c4 10          	add    $0x10,%rsp
    3b8b:	4c 89 e0             	mov    %r12,%rax
    3b8e:	5b                   	pop    %rbx
    3b8f:	41 5c                	pop    %r12
    3b91:	41 5d                	pop    %r13
    3b93:	41 5e                	pop    %r14
    3b95:	41 5f                	pop    %r15
    3b97:	5d                   	pop    %rbp
    3b98:	c3                   	retq   
    3b99:	0f 0b                	ud2    
    3b9b:	45 31 e4             	xor    %r12d,%r12d
    3b9e:	eb e7                	jmp    3b87 <_copy_from_iter+0xd7>
    3ba0:	49 83 c7 10          	add    $0x10,%r15
    3ba4:	4c 89 f1             	mov    %r14,%rcx
    3ba7:	4d 39 77 08          	cmp    %r14,0x8(%r15)
    3bab:	49 0f 46 4f 08       	cmovbe 0x8(%r15),%rcx
    3bb0:	48 85 c9             	test   %rcx,%rcx
    3bb3:	0f 84 dd 01 00 00    	je     3d96 <_copy_from_iter+0x2e6>
    3bb9:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    3bbd:	49 8b 37             	mov    (%r15),%rsi
    3bc0:	48 89 ca             	mov    %rcx,%rdx
    3bc3:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    3bc7:	48 8d 04 0f          	lea    (%rdi,%rcx,1),%rax
    3bcb:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3bcf:	e8 dc cf ff ff       	callq  bb0 <copyin>
    3bd4:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    3bd8:	48 98                	cltq   
    3bda:	48 29 c1             	sub    %rax,%rcx
    3bdd:	48 89 cb             	mov    %rcx,%rbx
    3be0:	49 29 ce             	sub    %rcx,%r14
    3be3:	e9 64 ff ff ff       	jmpq   3b4c <_copy_from_iter+0x9c>
    3be8:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    3bec:	41 89 f3             	mov    %esi,%r11d
    3bef:	45 31 c9             	xor    %r9d,%r9d
    3bf2:	45 31 d2             	xor    %r10d,%r10d
    3bf5:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    3bf9:	4d 89 d7             	mov    %r10,%r15
    3bfc:	49 c1 e7 04          	shl    $0x4,%r15
    3c00:	45 85 db             	test   %r11d,%r11d
    3c03:	4a 8d 34 39          	lea    (%rcx,%r15,1),%rsi
    3c07:	0f 84 9a 00 00 00    	je     3ca7 <_copy_from_iter+0x1f7>
    3c0d:	8b 46 0c             	mov    0xc(%rsi),%eax
    3c10:	44 8b 46 08          	mov    0x8(%rsi),%r8d
    3c14:	41 be 00 10 00 00    	mov    $0x1000,%r14d
    3c1a:	01 d8                	add    %ebx,%eax
    3c1c:	41 29 d8             	sub    %ebx,%r8d
    3c1f:	89 c2                	mov    %eax,%edx
    3c21:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    3c27:	45 39 d8             	cmp    %r11d,%r8d
    3c2a:	45 0f 47 c3          	cmova  %r11d,%r8d
    3c2e:	41 29 d6             	sub    %edx,%r14d
    3c31:	45 39 f0             	cmp    %r14d,%r8d
    3c34:	45 0f 47 c6          	cmova  %r14d,%r8d
    3c38:	45 85 c0             	test   %r8d,%r8d
    3c3b:	74 25                	je     3c62 <_copy_from_iter+0x1b2>
    3c3d:	c1 e8 0c             	shr    $0xc,%eax
    3c40:	44 89 c1             	mov    %r8d,%ecx
    3c43:	48 c1 e0 06          	shl    $0x6,%rax
    3c47:	48 03 06             	add    (%rsi),%rax
    3c4a:	4c 8d 34 0f          	lea    (%rdi,%rcx,1),%r14
    3c4e:	48 89 c6             	mov    %rax,%rsi
    3c51:	e8 9a c7 ff ff       	callq  3f0 <memcpy_from_page>
    3c56:	45 39 c3             	cmp    %r8d,%r11d
    3c59:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    3c5d:	72 37                	jb     3c96 <_copy_from_iter+0x1e6>
    3c5f:	4c 89 f7             	mov    %r14,%rdi
    3c62:	45 29 c3             	sub    %r8d,%r11d
    3c65:	44 01 c3             	add    %r8d,%ebx
    3c68:	74 8f                	je     3bf9 <_copy_from_iter+0x149>
    3c6a:	42 8b 44 39 08       	mov    0x8(%rcx,%r15,1),%eax
    3c6f:	39 c3                	cmp    %eax,%ebx
    3c71:	72 86                	jb     3bf9 <_copy_from_iter+0x149>
    3c73:	45 8d 51 01          	lea    0x1(%r9),%r10d
    3c77:	4c 89 d2             	mov    %r10,%rdx
    3c7a:	4d 89 d1             	mov    %r10,%r9
    3c7d:	48 c1 e2 04          	shl    $0x4,%rdx
    3c81:	29 c3                	sub    %eax,%ebx
    3c83:	0f 84 70 ff ff ff    	je     3bf9 <_copy_from_iter+0x149>
    3c89:	8b 44 11 08          	mov    0x8(%rcx,%rdx,1),%eax
    3c8d:	39 d8                	cmp    %ebx,%eax
    3c8f:	76 e2                	jbe    3c73 <_copy_from_iter+0x1c3>
    3c91:	e9 63 ff ff ff       	jmpq   3bf9 <_copy_from_iter+0x149>
    3c96:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 3c9d <_copy_from_iter+0x1ed>
    3c9d:	0f 84 fa 00 00 00    	je     3d9d <_copy_from_iter+0x2ed>
    3ca3:	4a 8d 34 39          	lea    (%rcx,%r15,1),%rsi
    3ca7:	49 89 75 18          	mov    %rsi,0x18(%r13)
    3cab:	48 2b 75 d0          	sub    -0x30(%rbp),%rsi
    3caf:	89 db                	mov    %ebx,%ebx
    3cb1:	49 8b 45 10          	mov    0x10(%r13),%rax
    3cb5:	48 c1 fe 04          	sar    $0x4,%rsi
    3cb9:	49 29 75 20          	sub    %rsi,0x20(%r13)
    3cbd:	e9 ba fe ff ff       	jmpq   3b7c <_copy_from_iter+0xcc>
    3cc2:	4d 8b 75 18          	mov    0x18(%r13),%r14
    3cc6:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    3cca:	49 29 df             	sub    %rbx,%r15
    3ccd:	49 39 f7             	cmp    %rsi,%r15
    3cd0:	4c 0f 47 fe          	cmova  %rsi,%r15
    3cd4:	4d 85 ff             	test   %r15,%r15
    3cd7:	0f 84 ad 00 00 00    	je     3d8a <_copy_from_iter+0x2da>
    3cdd:	49 8b 36             	mov    (%r14),%rsi
    3ce0:	4a 8d 04 3f          	lea    (%rdi,%r15,1),%rax
    3ce4:	4c 89 fa             	mov    %r15,%rdx
    3ce7:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3ceb:	48 01 de             	add    %rbx,%rsi
    3cee:	4c 01 fb             	add    %r15,%rbx
    3cf1:	e8 00 00 00 00       	callq  3cf6 <_copy_from_iter+0x246>
    3cf6:	4c 89 e0             	mov    %r12,%rax
    3cf9:	4c 29 f8             	sub    %r15,%rax
    3cfc:	49 89 c7             	mov    %rax,%r15
    3cff:	4d 85 ff             	test   %r15,%r15
    3d02:	75 3e                	jne    3d42 <_copy_from_iter+0x292>
    3d04:	49 3b 5e 08          	cmp    0x8(%r14),%rbx
    3d08:	75 06                	jne    3d10 <_copy_from_iter+0x260>
    3d0a:	49 83 c6 10          	add    $0x10,%r14
    3d0e:	31 db                	xor    %ebx,%ebx
    3d10:	4c 89 f0             	mov    %r14,%rax
    3d13:	49 2b 45 18          	sub    0x18(%r13),%rax
    3d17:	4d 89 75 18          	mov    %r14,0x18(%r13)
    3d1b:	48 c1 f8 04          	sar    $0x4,%rax
    3d1f:	49 29 45 20          	sub    %rax,0x20(%r13)
    3d23:	49 8b 45 10          	mov    0x10(%r13),%rax
    3d27:	e9 50 fe ff ff       	jmpq   3b7c <_copy_from_iter+0xcc>
    3d2c:	48 01 f3             	add    %rsi,%rbx
    3d2f:	e9 48 fe ff ff       	jmpq   3b7c <_copy_from_iter+0xcc>
    3d34:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    3d38:	49 89 f6             	mov    %rsi,%r14
    3d3b:	31 c0                	xor    %eax,%eax
    3d3d:	e9 0a fe ff ff       	jmpq   3b4c <_copy_from_iter+0x9c>
    3d42:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    3d46:	4c 89 e8             	mov    %r13,%rax
    3d49:	4d 89 e5             	mov    %r12,%r13
    3d4c:	49 89 c4             	mov    %rax,%r12
    3d4f:	49 83 c6 10          	add    $0x10,%r14
    3d53:	4c 89 fb             	mov    %r15,%rbx
    3d56:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    3d5a:	49 0f 46 5e 08       	cmovbe 0x8(%r14),%rbx
    3d5f:	48 85 db             	test   %rbx,%rbx
    3d62:	74 eb                	je     3d4f <_copy_from_iter+0x29f>
    3d64:	49 8b 36             	mov    (%r14),%rsi
    3d67:	48 8d 04 1f          	lea    (%rdi,%rbx,1),%rax
    3d6b:	48 89 da             	mov    %rbx,%rdx
    3d6e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3d72:	e8 00 00 00 00       	callq  3d77 <_copy_from_iter+0x2c7>
    3d77:	49 29 df             	sub    %rbx,%r15
    3d7a:	75 3f                	jne    3dbb <_copy_from_iter+0x30b>
    3d7c:	4c 89 e0             	mov    %r12,%rax
    3d7f:	4d 89 ec             	mov    %r13,%r12
    3d82:	49 89 c5             	mov    %rax,%r13
    3d85:	e9 7a ff ff ff       	jmpq   3d04 <_copy_from_iter+0x254>
    3d8a:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    3d8e:	49 89 f7             	mov    %rsi,%r15
    3d91:	e9 69 ff ff ff       	jmpq   3cff <_copy_from_iter+0x24f>
    3d96:	31 c0                	xor    %eax,%eax
    3d98:	e9 af fd ff ff       	jmpq   3b4c <_copy_from_iter+0x9c>
    3d9d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    3da4:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 3dab <_copy_from_iter+0x2fb>
    3dab:	e8 00 00 00 00       	callq  3db0 <_copy_from_iter+0x300>
    3db0:	0f 0b                	ud2    
    3db2:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    3db6:	e9 e8 fe ff ff       	jmpq   3ca3 <_copy_from_iter+0x1f3>
    3dbb:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    3dbf:	eb 8e                	jmp    3d4f <_copy_from_iter+0x29f>
    3dc1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    3dc6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3dcd:	00 00 00 

0000000000003dd0 <copy_page_from_iter>:
    3dd0:	55                   	push   %rbp
    3dd1:	48 89 f0             	mov    %rsi,%rax
    3dd4:	48 89 e5             	mov    %rsp,%rbp
    3dd7:	41 57                	push   %r15
    3dd9:	41 56                	push   %r14
    3ddb:	41 55                	push   %r13
    3ddd:	41 54                	push   %r12
    3ddf:	49 89 cf             	mov    %rcx,%r15
    3de2:	53                   	push   %rbx
    3de3:	48 83 ec 18          	sub    $0x18,%rsp
    3de7:	48 01 d0             	add    %rdx,%rax
    3dea:	49 89 c0             	mov    %rax,%r8
    3ded:	0f 82 f1 00 00 00    	jb     3ee4 <copy_page_from_iter+0x114>
    3df3:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
    3df9:	0f 87 e5 00 00 00    	ja     3ee4 <copy_page_from_iter+0x114>
    3dff:	41 8b 0f             	mov    (%r15),%ecx
    3e02:	89 c8                	mov    %ecx,%eax
    3e04:	83 e0 fe             	and    $0xfffffffe,%eax
    3e07:	83 e8 20             	sub    $0x20,%eax
    3e0a:	83 e0 de             	and    $0xffffffde,%eax
    3e0d:	0f 84 76 01 00 00    	je     3f89 <copy_page_from_iter+0x1b9>
    3e13:	83 e1 18             	and    $0x18,%ecx
    3e16:	48 89 d3             	mov    %rdx,%rbx
    3e19:	49 89 fc             	mov    %rdi,%r12
    3e1c:	0f 85 fb 00 00 00    	jne    3f1d <copy_page_from_iter+0x14d>
    3e22:	49 39 57 10          	cmp    %rdx,0x10(%r15)
    3e26:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    3e2a:	49 0f 46 5f 10       	cmovbe 0x10(%r15),%rbx
    3e2f:	48 85 db             	test   %rbx,%rbx
    3e32:	0f 84 25 01 00 00    	je     3f5d <copy_page_from_iter+0x18d>
    3e38:	4d 8b 47 18          	mov    0x18(%r15),%r8
    3e3c:	4d 8b 77 08          	mov    0x8(%r15),%r14
    3e40:	4d 8b 68 08          	mov    0x8(%r8),%r13
    3e44:	49 8b 00             	mov    (%r8),%rax
    3e47:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
    3e4b:	4d 29 f5             	sub    %r14,%r13
    3e4e:	4c 01 f0             	add    %r14,%rax
    3e51:	49 39 dd             	cmp    %rbx,%r13
    3e54:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    3e58:	4c 0f 47 eb          	cmova  %rbx,%r13
    3e5c:	e8 00 00 00 00       	callq  3e61 <copy_page_from_iter+0x91>
    3e61:	4c 2b 25 00 00 00 00 	sub    0x0(%rip),%r12        # 3e68 <copy_page_from_iter+0x98>
    3e68:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    3e6c:	4c 89 ea             	mov    %r13,%rdx
    3e6f:	49 c1 fc 06          	sar    $0x6,%r12
    3e73:	49 c1 e4 0c          	shl    $0xc,%r12
    3e77:	4c 03 25 00 00 00 00 	add    0x0(%rip),%r12        # 3e7e <copy_page_from_iter+0xae>
    3e7e:	49 01 f4             	add    %rsi,%r12
    3e81:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
    3e85:	4c 89 e7             	mov    %r12,%rdi
    3e88:	e8 23 cd ff ff       	callq  bb0 <copyin>
    3e8d:	48 98                	cltq   
    3e8f:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
    3e93:	49 29 c5             	sub    %rax,%r13
    3e96:	4b 8d 0c 2e          	lea    (%r14,%r13,1),%rcx
    3e9a:	49 89 de             	mov    %rbx,%r14
    3e9d:	4d 29 ee             	sub    %r13,%r14
    3ea0:	48 85 c0             	test   %rax,%rax
    3ea3:	75 09                	jne    3eae <copy_page_from_iter+0xde>
    3ea5:	4d 85 f6             	test   %r14,%r14
    3ea8:	0f 85 e1 00 00 00    	jne    3f8f <copy_page_from_iter+0x1bf>
    3eae:	49 3b 48 08          	cmp    0x8(%r8),%rcx
    3eb2:	75 06                	jne    3eba <copy_page_from_iter+0xea>
    3eb4:	49 83 c0 10          	add    $0x10,%r8
    3eb8:	31 c9                	xor    %ecx,%ecx
    3eba:	49 8b 47 10          	mov    0x10(%r15),%rax
    3ebe:	49 89 4f 08          	mov    %rcx,0x8(%r15)
    3ec2:	4c 01 f0             	add    %r14,%rax
    3ec5:	48 29 d8             	sub    %rbx,%rax
    3ec8:	4c 29 f3             	sub    %r14,%rbx
    3ecb:	49 89 47 10          	mov    %rax,0x10(%r15)
    3ecf:	4c 89 c0             	mov    %r8,%rax
    3ed2:	49 2b 47 18          	sub    0x18(%r15),%rax
    3ed6:	4d 89 47 18          	mov    %r8,0x18(%r15)
    3eda:	48 c1 f8 04          	sar    $0x4,%rax
    3ede:	49 29 47 20          	sub    %rax,0x20(%r15)
    3ee2:	eb 79                	jmp    3f5d <copy_page_from_iter+0x18d>
    3ee4:	4c 8b 4f 08          	mov    0x8(%rdi),%r9
    3ee8:	48 89 f9             	mov    %rdi,%rcx
    3eeb:	41 f6 c1 01          	test   $0x1,%r9b
    3eef:	75 7e                	jne    3f6f <copy_page_from_iter+0x19f>
    3ef1:	4c 39 c2             	cmp    %r8,%rdx
    3ef4:	77 21                	ja     3f17 <copy_page_from_iter+0x147>
    3ef6:	4c 8b 09             	mov    (%rcx),%r9
    3ef9:	b8 00 10 00 00       	mov    $0x1000,%eax
    3efe:	41 f7 c1 00 00 01 00 	test   $0x10000,%r9d
    3f05:	74 07                	je     3f0e <copy_page_from_iter+0x13e>
    3f07:	0f b6 49 51          	movzbl 0x51(%rcx),%ecx
    3f0b:	48 d3 e0             	shl    %cl,%rax
    3f0e:	49 39 c0             	cmp    %rax,%r8
    3f11:	0f 86 e8 fe ff ff    	jbe    3dff <copy_page_from_iter+0x2f>
    3f17:	0f 0b                	ud2    
    3f19:	31 db                	xor    %ebx,%ebx
    3f1b:	eb 40                	jmp    3f5d <copy_page_from_iter+0x18d>
    3f1d:	65 4c 8b 2c 25 00 00 	mov    %gs:0x0,%r13
    3f24:	00 00 
    3f26:	41 83 85 80 12 00 00 	addl   $0x1,0x1280(%r13)
    3f2d:	01 
    3f2e:	48 2b 3d 00 00 00 00 	sub    0x0(%rip),%rdi        # 3f35 <copy_page_from_iter+0x165>
    3f35:	4c 89 fa             	mov    %r15,%rdx
    3f38:	48 c1 ff 06          	sar    $0x6,%rdi
    3f3c:	48 c1 e7 0c          	shl    $0xc,%rdi
    3f40:	48 03 3d 00 00 00 00 	add    0x0(%rip),%rdi        # 3f47 <copy_page_from_iter+0x177>
    3f47:	48 01 f7             	add    %rsi,%rdi
    3f4a:	48 89 de             	mov    %rbx,%rsi
    3f4d:	e8 00 00 00 00       	callq  3f52 <copy_page_from_iter+0x182>
    3f52:	48 89 c3             	mov    %rax,%rbx
    3f55:	41 83 ad 80 12 00 00 	subl   $0x1,0x1280(%r13)
    3f5c:	01 
    3f5d:	48 83 c4 18          	add    $0x18,%rsp
    3f61:	48 89 d8             	mov    %rbx,%rax
    3f64:	5b                   	pop    %rbx
    3f65:	41 5c                	pop    %r12
    3f67:	41 5d                	pop    %r13
    3f69:	41 5e                	pop    %r14
    3f6b:	41 5f                	pop    %r15
    3f6d:	5d                   	pop    %rbp
    3f6e:	c3                   	retq   
    3f6f:	49 8d 49 ff          	lea    -0x1(%r9),%rcx
    3f73:	49 89 f8             	mov    %rdi,%r8
    3f76:	49 29 c8             	sub    %rcx,%r8
    3f79:	49 c1 f8 06          	sar    $0x6,%r8
    3f7d:	49 c1 e0 0c          	shl    $0xc,%r8
    3f81:	49 01 c0             	add    %rax,%r8
    3f84:	e9 68 ff ff ff       	jmpq   3ef1 <copy_page_from_iter+0x121>
    3f89:	0f 0b                	ud2    
    3f8b:	31 db                	xor    %ebx,%ebx
    3f8d:	eb ce                	jmp    3f5d <copy_page_from_iter+0x18d>
    3f8f:	4d 01 ec             	add    %r13,%r12
    3f92:	49 83 c0 10          	add    $0x10,%r8
    3f96:	4d 89 f5             	mov    %r14,%r13
    3f99:	49 8b 30             	mov    (%r8),%rsi
    3f9c:	4d 39 70 08          	cmp    %r14,0x8(%r8)
    3fa0:	4c 89 e7             	mov    %r12,%rdi
    3fa3:	4c 89 45 d0          	mov    %r8,-0x30(%rbp)
    3fa7:	4d 0f 46 68 08       	cmovbe 0x8(%r8),%r13
    3fac:	4c 89 ea             	mov    %r13,%rdx
    3faf:	e8 fc cb ff ff       	callq  bb0 <copyin>
    3fb4:	4c 89 e9             	mov    %r13,%rcx
    3fb7:	48 98                	cltq   
    3fb9:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
    3fbd:	48 29 c1             	sub    %rax,%rcx
    3fc0:	49 01 cc             	add    %rcx,%r12
    3fc3:	49 29 ce             	sub    %rcx,%r14
    3fc6:	48 85 c0             	test   %rax,%rax
    3fc9:	0f 85 df fe ff ff    	jne    3eae <copy_page_from_iter+0xde>
    3fcf:	4d 85 f6             	test   %r14,%r14
    3fd2:	0f 84 d6 fe ff ff    	je     3eae <copy_page_from_iter+0xde>
    3fd8:	eb b8                	jmp    3f92 <copy_page_from_iter+0x1c2>
    3fda:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000003fe0 <_copy_from_iter_nocache>:
    3fe0:	55                   	push   %rbp
    3fe1:	48 89 e5             	mov    %rsp,%rbp
    3fe4:	41 57                	push   %r15
    3fe6:	41 56                	push   %r14
    3fe8:	41 55                	push   %r13
    3fea:	41 54                	push   %r12
    3fec:	49 89 d5             	mov    %rdx,%r13
    3fef:	53                   	push   %rbx
    3ff0:	48 83 ec 10          	sub    $0x10,%rsp
    3ff4:	8b 12                	mov    (%rdx),%edx
    3ff6:	89 d0                	mov    %edx,%eax
    3ff8:	83 e0 fe             	and    $0xfffffffe,%eax
    3ffb:	83 f8 20             	cmp    $0x20,%eax
    3ffe:	0f 84 20 01 00 00    	je     4124 <_copy_from_iter_nocache+0x144>
    4004:	49 8b 45 10          	mov    0x10(%r13),%rax
    4008:	48 39 f0             	cmp    %rsi,%rax
    400b:	48 0f 46 f0          	cmovbe %rax,%rsi
    400f:	48 85 c0             	test   %rax,%rax
    4012:	49 89 f4             	mov    %rsi,%r12
    4015:	0f 84 a0 00 00 00    	je     40bb <_copy_from_iter_nocache+0xdb>
    401b:	f6 c2 10             	test   $0x10,%dl
    401e:	49 8b 5d 08          	mov    0x8(%r13),%rbx
    4022:	0f 85 4d 01 00 00    	jne    4175 <_copy_from_iter_nocache+0x195>
    4028:	f6 c2 08             	test   $0x8,%dl
    402b:	0f 85 9c 00 00 00    	jne    40cd <_copy_from_iter_nocache+0xed>
    4031:	83 e2 40             	and    $0x40,%edx
    4034:	0f 85 15 02 00 00    	jne    424f <_copy_from_iter_nocache+0x26f>
    403a:	4d 8b 75 18          	mov    0x18(%r13),%r14
    403e:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    4042:	49 29 df             	sub    %rbx,%r15
    4045:	49 39 f7             	cmp    %rsi,%r15
    4048:	4c 0f 47 fe          	cmova  %rsi,%r15
    404c:	4d 85 ff             	test   %r15,%r15
    404f:	0f 84 02 02 00 00    	je     4257 <_copy_from_iter_nocache+0x277>
    4055:	49 8b 36             	mov    (%r14),%rsi
    4058:	4a 8d 04 3f          	lea    (%rdi,%r15,1),%rax
    405c:	31 c9                	xor    %ecx,%ecx
    405e:	44 89 fa             	mov    %r15d,%edx
    4061:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    4065:	48 01 de             	add    %rbx,%rsi
    4068:	e8 00 00 00 00       	callq  406d <_copy_from_iter_nocache+0x8d>
    406d:	48 98                	cltq   
    406f:	4c 89 e1             	mov    %r12,%rcx
    4072:	49 29 c7             	sub    %rax,%r15
    4075:	4c 29 f9             	sub    %r15,%rcx
    4078:	4c 01 fb             	add    %r15,%rbx
    407b:	49 89 cf             	mov    %rcx,%r15
    407e:	48 85 c0             	test   %rax,%rax
    4081:	75 09                	jne    408c <_copy_from_iter_nocache+0xac>
    4083:	4d 85 ff             	test   %r15,%r15
    4086:	0f 85 9f 00 00 00    	jne    412b <_copy_from_iter_nocache+0x14b>
    408c:	4d 29 fc             	sub    %r15,%r12
    408f:	49 39 5e 08          	cmp    %rbx,0x8(%r14)
    4093:	0f 84 80 00 00 00    	je     4119 <_copy_from_iter_nocache+0x139>
    4099:	4c 89 f0             	mov    %r14,%rax
    409c:	49 2b 45 18          	sub    0x18(%r13),%rax
    40a0:	4d 89 75 18          	mov    %r14,0x18(%r13)
    40a4:	48 c1 f8 04          	sar    $0x4,%rax
    40a8:	49 29 45 20          	sub    %rax,0x20(%r13)
    40ac:	49 8b 45 10          	mov    0x10(%r13),%rax
    40b0:	4c 29 e0             	sub    %r12,%rax
    40b3:	49 89 5d 08          	mov    %rbx,0x8(%r13)
    40b7:	49 89 45 10          	mov    %rax,0x10(%r13)
    40bb:	48 83 c4 10          	add    $0x10,%rsp
    40bf:	4c 89 e0             	mov    %r12,%rax
    40c2:	5b                   	pop    %rbx
    40c3:	41 5c                	pop    %r12
    40c5:	41 5d                	pop    %r13
    40c7:	41 5e                	pop    %r14
    40c9:	41 5f                	pop    %r15
    40cb:	5d                   	pop    %rbp
    40cc:	c3                   	retq   
    40cd:	4d 8b 75 18          	mov    0x18(%r13),%r14
    40d1:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    40d5:	49 29 df             	sub    %rbx,%r15
    40d8:	49 39 f7             	cmp    %rsi,%r15
    40db:	4c 0f 47 fe          	cmova  %rsi,%r15
    40df:	4d 85 ff             	test   %r15,%r15
    40e2:	0f 84 c5 01 00 00    	je     42ad <_copy_from_iter_nocache+0x2cd>
    40e8:	49 8b 36             	mov    (%r14),%rsi
    40eb:	4a 8d 04 3f          	lea    (%rdi,%r15,1),%rax
    40ef:	4c 89 fa             	mov    %r15,%rdx
    40f2:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    40f6:	48 01 de             	add    %rbx,%rsi
    40f9:	4c 01 fb             	add    %r15,%rbx
    40fc:	e8 00 00 00 00       	callq  4101 <_copy_from_iter_nocache+0x121>
    4101:	4c 89 e0             	mov    %r12,%rax
    4104:	4c 29 f8             	sub    %r15,%rax
    4107:	49 89 c7             	mov    %rax,%r15
    410a:	4d 85 ff             	test   %r15,%r15
    410d:	0f 85 52 01 00 00    	jne    4265 <_copy_from_iter_nocache+0x285>
    4113:	49 3b 5e 08          	cmp    0x8(%r14),%rbx
    4117:	75 80                	jne    4099 <_copy_from_iter_nocache+0xb9>
    4119:	49 83 c6 10          	add    $0x10,%r14
    411d:	31 db                	xor    %ebx,%ebx
    411f:	e9 75 ff ff ff       	jmpq   4099 <_copy_from_iter_nocache+0xb9>
    4124:	0f 0b                	ud2    
    4126:	45 31 e4             	xor    %r12d,%r12d
    4129:	eb 90                	jmp    40bb <_copy_from_iter_nocache+0xdb>
    412b:	49 83 c6 10          	add    $0x10,%r14
    412f:	4d 89 f8             	mov    %r15,%r8
    4132:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    4136:	4d 0f 46 46 08       	cmovbe 0x8(%r14),%r8
    413b:	4d 85 c0             	test   %r8,%r8
    413e:	0f 84 75 01 00 00    	je     42b9 <_copy_from_iter_nocache+0x2d9>
    4144:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    4148:	49 8b 36             	mov    (%r14),%rsi
    414b:	44 89 c2             	mov    %r8d,%edx
    414e:	31 c9                	xor    %ecx,%ecx
    4150:	4c 89 45 c8          	mov    %r8,-0x38(%rbp)
    4154:	4a 8d 04 07          	lea    (%rdi,%r8,1),%rax
    4158:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    415c:	e8 00 00 00 00       	callq  4161 <_copy_from_iter_nocache+0x181>
    4161:	4c 8b 45 c8          	mov    -0x38(%rbp),%r8
    4165:	48 98                	cltq   
    4167:	4c 89 c3             	mov    %r8,%rbx
    416a:	48 29 c3             	sub    %rax,%rbx
    416d:	49 29 df             	sub    %rbx,%r15
    4170:	e9 09 ff ff ff       	jmpq   407e <_copy_from_iter_nocache+0x9e>
    4175:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    4179:	41 89 f3             	mov    %esi,%r11d
    417c:	45 31 c9             	xor    %r9d,%r9d
    417f:	45 31 d2             	xor    %r10d,%r10d
    4182:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    4186:	4d 89 d7             	mov    %r10,%r15
    4189:	49 c1 e7 04          	shl    $0x4,%r15
    418d:	45 85 db             	test   %r11d,%r11d
    4190:	4a 8d 34 39          	lea    (%rcx,%r15,1),%rsi
    4194:	0f 84 9a 00 00 00    	je     4234 <_copy_from_iter_nocache+0x254>
    419a:	8b 46 0c             	mov    0xc(%rsi),%eax
    419d:	44 8b 46 08          	mov    0x8(%rsi),%r8d
    41a1:	41 be 00 10 00 00    	mov    $0x1000,%r14d
    41a7:	01 d8                	add    %ebx,%eax
    41a9:	41 29 d8             	sub    %ebx,%r8d
    41ac:	89 c2                	mov    %eax,%edx
    41ae:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    41b4:	45 39 d8             	cmp    %r11d,%r8d
    41b7:	45 0f 47 c3          	cmova  %r11d,%r8d
    41bb:	41 29 d6             	sub    %edx,%r14d
    41be:	45 39 f0             	cmp    %r14d,%r8d
    41c1:	45 0f 47 c6          	cmova  %r14d,%r8d
    41c5:	45 85 c0             	test   %r8d,%r8d
    41c8:	74 25                	je     41ef <_copy_from_iter_nocache+0x20f>
    41ca:	c1 e8 0c             	shr    $0xc,%eax
    41cd:	44 89 c1             	mov    %r8d,%ecx
    41d0:	48 c1 e0 06          	shl    $0x6,%rax
    41d4:	48 03 06             	add    (%rsi),%rax
    41d7:	4c 8d 34 0f          	lea    (%rdi,%rcx,1),%r14
    41db:	48 89 c6             	mov    %rax,%rsi
    41de:	e8 0d c2 ff ff       	callq  3f0 <memcpy_from_page>
    41e3:	45 39 c3             	cmp    %r8d,%r11d
    41e6:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    41ea:	72 37                	jb     4223 <_copy_from_iter_nocache+0x243>
    41ec:	4c 89 f7             	mov    %r14,%rdi
    41ef:	45 29 c3             	sub    %r8d,%r11d
    41f2:	44 01 c3             	add    %r8d,%ebx
    41f5:	74 8f                	je     4186 <_copy_from_iter_nocache+0x1a6>
    41f7:	42 8b 44 39 08       	mov    0x8(%rcx,%r15,1),%eax
    41fc:	39 c3                	cmp    %eax,%ebx
    41fe:	72 86                	jb     4186 <_copy_from_iter_nocache+0x1a6>
    4200:	45 8d 51 01          	lea    0x1(%r9),%r10d
    4204:	4c 89 d2             	mov    %r10,%rdx
    4207:	4d 89 d1             	mov    %r10,%r9
    420a:	48 c1 e2 04          	shl    $0x4,%rdx
    420e:	29 c3                	sub    %eax,%ebx
    4210:	0f 84 70 ff ff ff    	je     4186 <_copy_from_iter_nocache+0x1a6>
    4216:	8b 44 11 08          	mov    0x8(%rcx,%rdx,1),%eax
    421a:	39 d8                	cmp    %ebx,%eax
    421c:	76 e2                	jbe    4200 <_copy_from_iter_nocache+0x220>
    421e:	e9 63 ff ff ff       	jmpq   4186 <_copy_from_iter_nocache+0x1a6>
    4223:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 422a <_copy_from_iter_nocache+0x24a>
    422a:	0f 84 90 00 00 00    	je     42c0 <_copy_from_iter_nocache+0x2e0>
    4230:	4a 8d 34 39          	lea    (%rcx,%r15,1),%rsi
    4234:	49 89 75 18          	mov    %rsi,0x18(%r13)
    4238:	48 2b 75 d0          	sub    -0x30(%rbp),%rsi
    423c:	89 db                	mov    %ebx,%ebx
    423e:	49 8b 45 10          	mov    0x10(%r13),%rax
    4242:	48 c1 fe 04          	sar    $0x4,%rsi
    4246:	49 29 75 20          	sub    %rsi,0x20(%r13)
    424a:	e9 61 fe ff ff       	jmpq   40b0 <_copy_from_iter_nocache+0xd0>
    424f:	48 01 f3             	add    %rsi,%rbx
    4252:	e9 59 fe ff ff       	jmpq   40b0 <_copy_from_iter_nocache+0xd0>
    4257:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    425b:	49 89 f7             	mov    %rsi,%r15
    425e:	31 c0                	xor    %eax,%eax
    4260:	e9 19 fe ff ff       	jmpq   407e <_copy_from_iter_nocache+0x9e>
    4265:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    4269:	4c 89 e8             	mov    %r13,%rax
    426c:	4d 89 e5             	mov    %r12,%r13
    426f:	49 89 c4             	mov    %rax,%r12
    4272:	49 83 c6 10          	add    $0x10,%r14
    4276:	4c 89 fb             	mov    %r15,%rbx
    4279:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    427d:	49 0f 46 5e 08       	cmovbe 0x8(%r14),%rbx
    4282:	48 85 db             	test   %rbx,%rbx
    4285:	74 eb                	je     4272 <_copy_from_iter_nocache+0x292>
    4287:	49 8b 36             	mov    (%r14),%rsi
    428a:	48 8d 04 1f          	lea    (%rdi,%rbx,1),%rax
    428e:	48 89 da             	mov    %rbx,%rdx
    4291:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    4295:	e8 00 00 00 00       	callq  429a <_copy_from_iter_nocache+0x2ba>
    429a:	49 29 df             	sub    %rbx,%r15
    429d:	75 3f                	jne    42de <_copy_from_iter_nocache+0x2fe>
    429f:	4c 89 e0             	mov    %r12,%rax
    42a2:	4d 89 ec             	mov    %r13,%r12
    42a5:	49 89 c5             	mov    %rax,%r13
    42a8:	e9 66 fe ff ff       	jmpq   4113 <_copy_from_iter_nocache+0x133>
    42ad:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    42b1:	49 89 f7             	mov    %rsi,%r15
    42b4:	e9 51 fe ff ff       	jmpq   410a <_copy_from_iter_nocache+0x12a>
    42b9:	31 c0                	xor    %eax,%eax
    42bb:	e9 be fd ff ff       	jmpq   407e <_copy_from_iter_nocache+0x9e>
    42c0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    42c7:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 42ce <_copy_from_iter_nocache+0x2ee>
    42ce:	e8 00 00 00 00       	callq  42d3 <_copy_from_iter_nocache+0x2f3>
    42d3:	0f 0b                	ud2    
    42d5:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    42d9:	e9 52 ff ff ff       	jmpq   4230 <_copy_from_iter_nocache+0x250>
    42de:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    42e2:	eb 8e                	jmp    4272 <_copy_from_iter_nocache+0x292>
    42e4:	66 90                	xchg   %ax,%ax
    42e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    42ed:	00 00 00 

00000000000042f0 <_copy_from_iter_flushcache>:
    42f0:	55                   	push   %rbp
    42f1:	48 89 e5             	mov    %rsp,%rbp
    42f4:	41 57                	push   %r15
    42f6:	41 56                	push   %r14
    42f8:	41 55                	push   %r13
    42fa:	41 54                	push   %r12
    42fc:	49 89 d5             	mov    %rdx,%r13
    42ff:	53                   	push   %rbx
    4300:	48 83 ec 28          	sub    $0x28,%rsp
    4304:	8b 12                	mov    (%rdx),%edx
    4306:	89 d0                	mov    %edx,%eax
    4308:	83 e0 fe             	and    $0xfffffffe,%eax
    430b:	83 f8 20             	cmp    $0x20,%eax
    430e:	0f 84 c5 00 00 00    	je     43d9 <_copy_from_iter_flushcache+0xe9>
    4314:	49 8b 45 10          	mov    0x10(%r13),%rax
    4318:	48 39 f0             	cmp    %rsi,%rax
    431b:	48 0f 46 f0          	cmovbe %rax,%rsi
    431f:	48 85 c0             	test   %rax,%rax
    4322:	49 89 f4             	mov    %rsi,%r12
    4325:	0f 84 9c 00 00 00    	je     43c7 <_copy_from_iter_flushcache+0xd7>
    432b:	f6 c2 10             	test   $0x10,%dl
    432e:	49 8b 5d 08          	mov    0x8(%r13),%rbx
    4332:	0f 85 ef 00 00 00    	jne    4427 <_copy_from_iter_flushcache+0x137>
    4338:	f6 c2 08             	test   $0x8,%dl
    433b:	0f 85 c8 01 00 00    	jne    4509 <_copy_from_iter_flushcache+0x219>
    4341:	83 e2 40             	and    $0x40,%edx
    4344:	0f 85 2d 02 00 00    	jne    4577 <_copy_from_iter_flushcache+0x287>
    434a:	4d 8b 7d 18          	mov    0x18(%r13),%r15
    434e:	4d 8b 77 08          	mov    0x8(%r15),%r14
    4352:	49 29 de             	sub    %rbx,%r14
    4355:	49 39 f6             	cmp    %rsi,%r14
    4358:	4c 0f 47 f6          	cmova  %rsi,%r14
    435c:	4d 85 f6             	test   %r14,%r14
    435f:	0f 84 1a 02 00 00    	je     457f <_copy_from_iter_flushcache+0x28f>
    4365:	49 8b 37             	mov    (%r15),%rsi
    4368:	4a 8d 04 37          	lea    (%rdi,%r14,1),%rax
    436c:	44 89 f2             	mov    %r14d,%edx
    436f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    4373:	48 01 de             	add    %rbx,%rsi
    4376:	e8 00 00 00 00       	callq  437b <_copy_from_iter_flushcache+0x8b>
    437b:	48 98                	cltq   
    437d:	4c 89 e1             	mov    %r12,%rcx
    4380:	49 29 c6             	sub    %rax,%r14
    4383:	4c 29 f1             	sub    %r14,%rcx
    4386:	4c 01 f3             	add    %r14,%rbx
    4389:	49 89 ce             	mov    %rcx,%r14
    438c:	48 85 c0             	test   %rax,%rax
    438f:	75 05                	jne    4396 <_copy_from_iter_flushcache+0xa6>
    4391:	4d 85 f6             	test   %r14,%r14
    4394:	75 4a                	jne    43e0 <_copy_from_iter_flushcache+0xf0>
    4396:	4d 29 f4             	sub    %r14,%r12
    4399:	49 39 5f 08          	cmp    %rbx,0x8(%r15)
    439d:	75 06                	jne    43a5 <_copy_from_iter_flushcache+0xb5>
    439f:	49 83 c7 10          	add    $0x10,%r15
    43a3:	31 db                	xor    %ebx,%ebx
    43a5:	4c 89 f8             	mov    %r15,%rax
    43a8:	49 2b 45 18          	sub    0x18(%r13),%rax
    43ac:	4d 89 7d 18          	mov    %r15,0x18(%r13)
    43b0:	48 c1 f8 04          	sar    $0x4,%rax
    43b4:	49 29 45 20          	sub    %rax,0x20(%r13)
    43b8:	49 8b 45 10          	mov    0x10(%r13),%rax
    43bc:	4c 29 e0             	sub    %r12,%rax
    43bf:	49 89 5d 08          	mov    %rbx,0x8(%r13)
    43c3:	49 89 45 10          	mov    %rax,0x10(%r13)
    43c7:	48 83 c4 28          	add    $0x28,%rsp
    43cb:	4c 89 e0             	mov    %r12,%rax
    43ce:	5b                   	pop    %rbx
    43cf:	41 5c                	pop    %r12
    43d1:	41 5d                	pop    %r13
    43d3:	41 5e                	pop    %r14
    43d5:	41 5f                	pop    %r15
    43d7:	5d                   	pop    %rbp
    43d8:	c3                   	retq   
    43d9:	0f 0b                	ud2    
    43db:	45 31 e4             	xor    %r12d,%r12d
    43de:	eb e7                	jmp    43c7 <_copy_from_iter_flushcache+0xd7>
    43e0:	49 83 c7 10          	add    $0x10,%r15
    43e4:	4c 89 f1             	mov    %r14,%rcx
    43e7:	4d 39 77 08          	cmp    %r14,0x8(%r15)
    43eb:	49 0f 46 4f 08       	cmovbe 0x8(%r15),%rcx
    43f0:	48 85 c9             	test   %rcx,%rcx
    43f3:	0f 84 2b 02 00 00    	je     4624 <_copy_from_iter_flushcache+0x334>
    43f9:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    43fd:	49 8b 37             	mov    (%r15),%rsi
    4400:	89 ca                	mov    %ecx,%edx
    4402:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    4406:	48 8d 04 0f          	lea    (%rdi,%rcx,1),%rax
    440a:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    440e:	e8 00 00 00 00       	callq  4413 <_copy_from_iter_flushcache+0x123>
    4413:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    4417:	48 98                	cltq   
    4419:	48 29 c1             	sub    %rax,%rcx
    441c:	48 89 cb             	mov    %rcx,%rbx
    441f:	49 29 ce             	sub    %rcx,%r14
    4422:	e9 65 ff ff ff       	jmpq   438c <_copy_from_iter_flushcache+0x9c>
    4427:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    442b:	31 c0                	xor    %eax,%eax
    442d:	41 89 f1             	mov    %esi,%r9d
    4430:	45 31 c0             	xor    %r8d,%r8d
    4433:	41 89 c6             	mov    %eax,%r14d
    4436:	49 89 f3             	mov    %rsi,%r11
    4439:	4d 89 ea             	mov    %r13,%r10
    443c:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    4440:	4d 89 c5             	mov    %r8,%r13
    4443:	49 c1 e5 04          	shl    $0x4,%r13
    4447:	45 85 c9             	test   %r9d,%r9d
    444a:	4a 8d 34 29          	lea    (%rcx,%r13,1),%rsi
    444e:	0f 84 71 01 00 00    	je     45c5 <_copy_from_iter_flushcache+0x2d5>
    4454:	8b 46 0c             	mov    0xc(%rsi),%eax
    4457:	44 8b 7e 08          	mov    0x8(%rsi),%r15d
    445b:	41 bc 00 10 00 00    	mov    $0x1000,%r12d
    4461:	01 d8                	add    %ebx,%eax
    4463:	41 29 df             	sub    %ebx,%r15d
    4466:	89 c2                	mov    %eax,%edx
    4468:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    446e:	45 39 cf             	cmp    %r9d,%r15d
    4471:	45 0f 47 f9          	cmova  %r9d,%r15d
    4475:	41 29 d4             	sub    %edx,%r12d
    4478:	45 39 e7             	cmp    %r12d,%r15d
    447b:	45 0f 47 fc          	cmova  %r12d,%r15d
    447f:	45 85 ff             	test   %r15d,%r15d
    4482:	74 49                	je     44cd <_copy_from_iter_flushcache+0x1dd>
    4484:	c1 e8 0c             	shr    $0xc,%eax
    4487:	44 89 f9             	mov    %r15d,%ecx
    448a:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
    448e:	48 c1 e0 06          	shl    $0x6,%rax
    4492:	48 03 06             	add    (%rsi),%rax
    4495:	4c 89 55 c0          	mov    %r10,-0x40(%rbp)
    4499:	4c 89 5d c8          	mov    %r11,-0x38(%rbp)
    449d:	44 89 4d d0          	mov    %r9d,-0x30(%rbp)
    44a1:	4c 8d 24 0f          	lea    (%rdi,%rcx,1),%r12
    44a5:	48 89 c6             	mov    %rax,%rsi
    44a8:	e8 00 00 00 00       	callq  44ad <_copy_from_iter_flushcache+0x1bd>
    44ad:	44 8b 4d d0          	mov    -0x30(%rbp),%r9d
    44b1:	4c 8b 55 c0          	mov    -0x40(%rbp),%r10
    44b5:	4c 8b 5d c8          	mov    -0x38(%rbp),%r11
    44b9:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
    44bd:	45 39 f9             	cmp    %r15d,%r9d
    44c0:	49 8b 4a 18          	mov    0x18(%r10),%rcx
    44c4:	0f 82 c3 00 00 00    	jb     458d <_copy_from_iter_flushcache+0x29d>
    44ca:	4c 89 e7             	mov    %r12,%rdi
    44cd:	45 29 f9             	sub    %r15d,%r9d
    44d0:	44 01 fb             	add    %r15d,%ebx
    44d3:	0f 84 67 ff ff ff    	je     4440 <_copy_from_iter_flushcache+0x150>
    44d9:	42 8b 44 29 08       	mov    0x8(%rcx,%r13,1),%eax
    44de:	39 c3                	cmp    %eax,%ebx
    44e0:	0f 82 5a ff ff ff    	jb     4440 <_copy_from_iter_flushcache+0x150>
    44e6:	45 8d 46 01          	lea    0x1(%r14),%r8d
    44ea:	4c 89 c2             	mov    %r8,%rdx
    44ed:	4d 89 c6             	mov    %r8,%r14
    44f0:	48 c1 e2 04          	shl    $0x4,%rdx
    44f4:	29 c3                	sub    %eax,%ebx
    44f6:	0f 84 44 ff ff ff    	je     4440 <_copy_from_iter_flushcache+0x150>
    44fc:	8b 44 11 08          	mov    0x8(%rcx,%rdx,1),%eax
    4500:	39 d8                	cmp    %ebx,%eax
    4502:	76 e2                	jbe    44e6 <_copy_from_iter_flushcache+0x1f6>
    4504:	e9 37 ff ff ff       	jmpq   4440 <_copy_from_iter_flushcache+0x150>
    4509:	4d 8b 75 18          	mov    0x18(%r13),%r14
    450d:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    4511:	49 29 df             	sub    %rbx,%r15
    4514:	49 39 f7             	cmp    %rsi,%r15
    4517:	4c 0f 47 fe          	cmova  %rsi,%r15
    451b:	4d 85 ff             	test   %r15,%r15
    451e:	0f 84 ac 00 00 00    	je     45d0 <_copy_from_iter_flushcache+0x2e0>
    4524:	49 8b 36             	mov    (%r14),%rsi
    4527:	4a 8d 04 3f          	lea    (%rdi,%r15,1),%rax
    452b:	4c 89 fa             	mov    %r15,%rdx
    452e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    4532:	48 01 de             	add    %rbx,%rsi
    4535:	4c 01 fb             	add    %r15,%rbx
    4538:	e8 00 00 00 00       	callq  453d <_copy_from_iter_flushcache+0x24d>
    453d:	4c 89 e0             	mov    %r12,%rax
    4540:	4c 29 f8             	sub    %r15,%rax
    4543:	49 89 c7             	mov    %rax,%r15
    4546:	4d 85 ff             	test   %r15,%r15
    4549:	0f 85 8d 00 00 00    	jne    45dc <_copy_from_iter_flushcache+0x2ec>
    454f:	49 39 5e 08          	cmp    %rbx,0x8(%r14)
    4553:	75 06                	jne    455b <_copy_from_iter_flushcache+0x26b>
    4555:	49 83 c6 10          	add    $0x10,%r14
    4559:	31 db                	xor    %ebx,%ebx
    455b:	4c 89 f2             	mov    %r14,%rdx
    455e:	49 2b 55 18          	sub    0x18(%r13),%rdx
    4562:	49 8b 45 10          	mov    0x10(%r13),%rax
    4566:	4d 89 75 18          	mov    %r14,0x18(%r13)
    456a:	48 c1 fa 04          	sar    $0x4,%rdx
    456e:	49 29 55 20          	sub    %rdx,0x20(%r13)
    4572:	e9 45 fe ff ff       	jmpq   43bc <_copy_from_iter_flushcache+0xcc>
    4577:	48 01 f3             	add    %rsi,%rbx
    457a:	e9 3d fe ff ff       	jmpq   43bc <_copy_from_iter_flushcache+0xcc>
    457f:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    4583:	49 89 f6             	mov    %rsi,%r14
    4586:	31 c0                	xor    %eax,%eax
    4588:	e9 ff fd ff ff       	jmpq   438c <_copy_from_iter_flushcache+0x9c>
    458d:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 4594 <_copy_from_iter_flushcache+0x2a4>
    4594:	4c 89 d0             	mov    %r10,%rax
    4597:	4d 89 dc             	mov    %r11,%r12
    459a:	4d 89 ea             	mov    %r13,%r10
    459d:	49 89 c5             	mov    %rax,%r13
    45a0:	0f 84 85 00 00 00    	je     462b <_copy_from_iter_flushcache+0x33b>
    45a6:	4e 8d 1c 11          	lea    (%rcx,%r10,1),%r11
    45aa:	4d 89 5d 18          	mov    %r11,0x18(%r13)
    45ae:	4c 2b 5d b0          	sub    -0x50(%rbp),%r11
    45b2:	89 db                	mov    %ebx,%ebx
    45b4:	49 8b 45 10          	mov    0x10(%r13),%rax
    45b8:	49 c1 fb 04          	sar    $0x4,%r11
    45bc:	4d 29 5d 20          	sub    %r11,0x20(%r13)
    45c0:	e9 f7 fd ff ff       	jmpq   43bc <_copy_from_iter_flushcache+0xcc>
    45c5:	4d 89 dc             	mov    %r11,%r12
    45c8:	4d 89 d5             	mov    %r10,%r13
    45cb:	49 89 f3             	mov    %rsi,%r11
    45ce:	eb da                	jmp    45aa <_copy_from_iter_flushcache+0x2ba>
    45d0:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    45d4:	49 89 f7             	mov    %rsi,%r15
    45d7:	e9 6a ff ff ff       	jmpq   4546 <_copy_from_iter_flushcache+0x256>
    45dc:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    45e0:	4c 89 e8             	mov    %r13,%rax
    45e3:	4d 89 e5             	mov    %r12,%r13
    45e6:	49 89 c4             	mov    %rax,%r12
    45e9:	49 83 c6 10          	add    $0x10,%r14
    45ed:	4c 89 fb             	mov    %r15,%rbx
    45f0:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    45f4:	49 0f 46 5e 08       	cmovbe 0x8(%r14),%rbx
    45f9:	48 85 db             	test   %rbx,%rbx
    45fc:	74 eb                	je     45e9 <_copy_from_iter_flushcache+0x2f9>
    45fe:	49 8b 36             	mov    (%r14),%rsi
    4601:	48 8d 04 1f          	lea    (%rdi,%rbx,1),%rax
    4605:	48 89 da             	mov    %rbx,%rdx
    4608:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    460c:	e8 00 00 00 00       	callq  4611 <_copy_from_iter_flushcache+0x321>
    4611:	49 29 df             	sub    %rbx,%r15
    4614:	75 3b                	jne    4651 <_copy_from_iter_flushcache+0x361>
    4616:	4c 89 e0             	mov    %r12,%rax
    4619:	4d 89 ec             	mov    %r13,%r12
    461c:	49 89 c5             	mov    %rax,%r13
    461f:	e9 2b ff ff ff       	jmpq   454f <_copy_from_iter_flushcache+0x25f>
    4624:	31 c0                	xor    %eax,%eax
    4626:	e9 61 fd ff ff       	jmpq   438c <_copy_from_iter_flushcache+0x9c>
    462b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    4632:	4c 89 55 d0          	mov    %r10,-0x30(%rbp)
    4636:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 463d <_copy_from_iter_flushcache+0x34d>
    463d:	e8 00 00 00 00       	callq  4642 <_copy_from_iter_flushcache+0x352>
    4642:	0f 0b                	ud2    
    4644:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    4648:	4c 8b 55 d0          	mov    -0x30(%rbp),%r10
    464c:	e9 55 ff ff ff       	jmpq   45a6 <_copy_from_iter_flushcache+0x2b6>
    4651:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    4655:	eb 92                	jmp    45e9 <_copy_from_iter_flushcache+0x2f9>
    4657:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    465e:	00 00 

0000000000004660 <csum_and_copy_from_iter>:
    4660:	55                   	push   %rbp
    4661:	49 89 d2             	mov    %rdx,%r10
    4664:	48 89 e5             	mov    %rsp,%rbp
    4667:	41 57                	push   %r15
    4669:	41 56                	push   %r14
    466b:	41 55                	push   %r13
    466d:	41 54                	push   %r12
    466f:	53                   	push   %rbx
    4670:	48 83 ec 60          	sub    $0x60,%rsp
    4674:	8b 11                	mov    (%rcx),%edx
    4676:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    467d:	00 00 
    467f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    4683:	31 c0                	xor    %eax,%eax
    4685:	89 d0                	mov    %edx,%eax
    4687:	83 e0 fe             	and    $0xfffffffe,%eax
    468a:	83 e8 20             	sub    $0x20,%eax
    468d:	83 e0 de             	and    $0xffffffde,%eax
    4690:	0f 84 27 01 00 00    	je     47bd <csum_and_copy_from_iter+0x15d>
    4696:	41 8b 02             	mov    (%r10),%eax
    4699:	49 89 cc             	mov    %rcx,%r12
    469c:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    469f:	48 8b 41 10          	mov    0x10(%rcx),%rax
    46a3:	48 39 f0             	cmp    %rsi,%rax
    46a6:	48 0f 46 f0          	cmovbe %rax,%rsi
    46aa:	48 85 c0             	test   %rax,%rax
    46ad:	49 89 f6             	mov    %rsi,%r14
    46b0:	0f 84 bd 00 00 00    	je     4773 <csum_and_copy_from_iter+0x113>
    46b6:	f6 c2 10             	test   $0x10,%dl
    46b9:	48 8b 59 08          	mov    0x8(%rcx),%rbx
    46bd:	0f 85 01 01 00 00    	jne    47c4 <csum_and_copy_from_iter+0x164>
    46c3:	f6 c2 08             	test   $0x8,%dl
    46c6:	0f 85 7d 02 00 00    	jne    4949 <csum_and_copy_from_iter+0x2e9>
    46cc:	83 e2 40             	and    $0x40,%edx
    46cf:	0f 85 46 03 00 00    	jne    4a1b <csum_and_copy_from_iter+0x3bb>
    46d5:	4c 8b 79 18          	mov    0x18(%rcx),%r15
    46d9:	4d 8b 6f 08          	mov    0x8(%r15),%r13
    46dd:	49 29 dd             	sub    %rbx,%r13
    46e0:	49 39 f5             	cmp    %rsi,%r13
    46e3:	4c 0f 47 ee          	cmova  %rsi,%r13
    46e7:	4d 85 ed             	test   %r13,%r13
    46ea:	0f 84 c1 03 00 00    	je     4ab1 <csum_and_copy_from_iter+0x451>
    46f0:	49 8b 07             	mov    (%r15),%rax
    46f3:	4a 8d 0c 2f          	lea    (%rdi,%r13,1),%rcx
    46f7:	4c 8d 45 cc          	lea    -0x34(%rbp),%r8
    46fb:	48 89 fe             	mov    %rdi,%rsi
    46fe:	44 89 ea             	mov    %r13d,%edx
    4701:	4c 89 55 b8          	mov    %r10,-0x48(%rbp)
    4705:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    4709:	31 c9                	xor    %ecx,%ecx
    470b:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    4712:	48 01 d8             	add    %rbx,%rax
    4715:	48 89 c7             	mov    %rax,%rdi
    4718:	e8 00 00 00 00       	callq  471d <csum_and_copy_from_iter+0xbd>
    471d:	8b 4d cc             	mov    -0x34(%rbp),%ecx
    4720:	4c 8b 55 b8          	mov    -0x48(%rbp),%r10
    4724:	85 c9                	test   %ecx,%ecx
    4726:	74 76                	je     479e <csum_and_copy_from_iter+0x13e>
    4728:	4d 89 f1             	mov    %r14,%r9
    472b:	45 31 db             	xor    %r11d,%r11d
    472e:	4d 85 ed             	test   %r13,%r13
    4731:	75 09                	jne    473c <csum_and_copy_from_iter+0xdc>
    4733:	4d 85 c9             	test   %r9,%r9
    4736:	0f 85 e7 02 00 00    	jne    4a23 <csum_and_copy_from_iter+0x3c3>
    473c:	4d 29 ce             	sub    %r9,%r14
    473f:	49 39 5f 08          	cmp    %rbx,0x8(%r15)
    4743:	75 06                	jne    474b <csum_and_copy_from_iter+0xeb>
    4745:	49 83 c7 10          	add    $0x10,%r15
    4749:	31 db                	xor    %ebx,%ebx
    474b:	4c 89 f8             	mov    %r15,%rax
    474e:	49 2b 44 24 18       	sub    0x18(%r12),%rax
    4753:	4d 89 7c 24 18       	mov    %r15,0x18(%r12)
    4758:	48 c1 f8 04          	sar    $0x4,%rax
    475c:	49 29 44 24 20       	sub    %rax,0x20(%r12)
    4761:	49 8b 44 24 10       	mov    0x10(%r12),%rax
    4766:	4c 29 f0             	sub    %r14,%rax
    4769:	49 89 5c 24 08       	mov    %rbx,0x8(%r12)
    476e:	49 89 44 24 10       	mov    %rax,0x10(%r12)
    4773:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    4776:	41 89 02             	mov    %eax,(%r10)
    4779:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    477d:	65 48 33 3c 25 28 00 	xor    %gs:0x28,%rdi
    4784:	00 00 
    4786:	4c 89 f0             	mov    %r14,%rax
    4789:	0f 85 6f 03 00 00    	jne    4afe <csum_and_copy_from_iter+0x49e>
    478f:	48 83 c4 60          	add    $0x60,%rsp
    4793:	5b                   	pop    %rbx
    4794:	41 5c                	pop    %r12
    4796:	41 5d                	pop    %r13
    4798:	41 5e                	pop    %r14
    479a:	41 5f                	pop    %r15
    479c:	5d                   	pop    %rbp
    479d:	c3                   	retq   
    479e:	4d 89 f1             	mov    %r14,%r9
    47a1:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    47a4:	4c 01 eb             	add    %r13,%rbx
    47a7:	01 c2                	add    %eax,%edx
    47a9:	83 d2 00             	adc    $0x0,%edx
    47ac:	4d 29 e9             	sub    %r13,%r9
    47af:	4d 89 eb             	mov    %r13,%r11
    47b2:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    47b5:	45 31 ed             	xor    %r13d,%r13d
    47b8:	e9 71 ff ff ff       	jmpq   472e <csum_and_copy_from_iter+0xce>
    47bd:	0f 0b                	ud2    
    47bf:	45 31 f6             	xor    %r14d,%r14d
    47c2:	eb b5                	jmp    4779 <csum_and_copy_from_iter+0x119>
    47c4:	48 8b 71 18          	mov    0x18(%rcx),%rsi
    47c8:	45 31 db             	xor    %r11d,%r11d
    47cb:	45 89 f0             	mov    %r14d,%r8d
    47ce:	4c 89 75 80          	mov    %r14,-0x80(%rbp)
    47d2:	45 31 ff             	xor    %r15d,%r15d
    47d5:	4d 89 de             	mov    %r11,%r14
    47d8:	48 c7 45 b8 00 00 00 	movq   $0x0,-0x48(%rbp)
    47df:	00 
    47e0:	48 89 f8             	mov    %rdi,%rax
    47e3:	4c 89 95 78 ff ff ff 	mov    %r10,-0x88(%rbp)
    47ea:	48 89 75 88          	mov    %rsi,-0x78(%rbp)
    47ee:	49 89 cb             	mov    %rcx,%r11
    47f1:	4d 89 f4             	mov    %r14,%r12
    47f4:	49 c1 e4 04          	shl    $0x4,%r12
    47f8:	45 85 c0             	test   %r8d,%r8d
    47fb:	4e 8d 0c 26          	lea    (%rsi,%r12,1),%r9
    47ff:	0f 84 1b 01 00 00    	je     4920 <csum_and_copy_from_iter+0x2c0>
    4805:	41 8b 51 0c          	mov    0xc(%r9),%edx
    4809:	45 8b 69 08          	mov    0x8(%r9),%r13d
    480d:	bf 00 10 00 00       	mov    $0x1000,%edi
    4812:	01 da                	add    %ebx,%edx
    4814:	41 29 dd             	sub    %ebx,%r13d
    4817:	89 d1                	mov    %edx,%ecx
    4819:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
    481f:	45 39 c5             	cmp    %r8d,%r13d
    4822:	45 0f 47 e8          	cmova  %r8d,%r13d
    4826:	29 cf                	sub    %ecx,%edi
    4828:	41 39 fd             	cmp    %edi,%r13d
    482b:	44 0f 47 ef          	cmova  %edi,%r13d
    482f:	45 85 ed             	test   %r13d,%r13d
    4832:	0f 84 ac 00 00 00    	je     48e4 <csum_and_copy_from_iter+0x284>
    4838:	4c 89 5d 90          	mov    %r11,-0x70(%rbp)
    483c:	44 89 45 98          	mov    %r8d,-0x68(%rbp)
    4840:	49 8b 31             	mov    (%r9),%rsi
    4843:	65 4c 8b 0c 25 00 00 	mov    %gs:0x0,%r9
    484a:	00 00 
    484c:	41 83 81 80 12 00 00 	addl   $0x1,0x1280(%r9)
    4853:	01 
    4854:	4c 89 4d a0          	mov    %r9,-0x60(%rbp)
    4858:	45 89 ea             	mov    %r13d,%r10d
    485b:	c1 ea 0c             	shr    $0xc,%edx
    485e:	4a 8d 3c 10          	lea    (%rax,%r10,1),%rdi
    4862:	4c 89 55 a8          	mov    %r10,-0x58(%rbp)
    4866:	48 89 7d b0          	mov    %rdi,-0x50(%rbp)
    486a:	89 d7                	mov    %edx,%edi
    486c:	44 89 ea             	mov    %r13d,%edx
    486f:	48 c1 e7 06          	shl    $0x6,%rdi
    4873:	48 01 f7             	add    %rsi,%rdi
    4876:	48 2b 3d 00 00 00 00 	sub    0x0(%rip),%rdi        # 487d <csum_and_copy_from_iter+0x21d>
    487d:	48 89 c6             	mov    %rax,%rsi
    4880:	48 c1 ff 06          	sar    $0x6,%rdi
    4884:	48 c1 e7 0c          	shl    $0xc,%rdi
    4888:	48 03 3d 00 00 00 00 	add    0x0(%rip),%rdi        # 488f <csum_and_copy_from_iter+0x22f>
    488f:	48 01 cf             	add    %rcx,%rdi
    4892:	31 c9                	xor    %ecx,%ecx
    4894:	e8 00 00 00 00       	callq  4899 <csum_and_copy_from_iter+0x239>
    4899:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
    489d:	89 c2                	mov    %eax,%edx
    489f:	c1 ca 08             	ror    $0x8,%edx
    48a2:	40 f6 c7 01          	test   $0x1,%dil
    48a6:	0f 45 c2             	cmovne %edx,%eax
    48a9:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    48ac:	01 c2                	add    %eax,%edx
    48ae:	83 d2 00             	adc    $0x0,%edx
    48b1:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    48b4:	4c 8b 4d a0          	mov    -0x60(%rbp),%r9
    48b8:	41 83 a9 80 12 00 00 	subl   $0x1,0x1280(%r9)
    48bf:	01 
    48c0:	4c 8b 55 a8          	mov    -0x58(%rbp),%r10
    48c4:	44 8b 45 98          	mov    -0x68(%rbp),%r8d
    48c8:	4c 8b 5d 90          	mov    -0x70(%rbp),%r11
    48cc:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    48d0:	4c 01 d7             	add    %r10,%rdi
    48d3:	45 39 e8             	cmp    %r13d,%r8d
    48d6:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    48da:	49 8b 73 18          	mov    0x18(%r11),%rsi
    48de:	0f 82 d6 01 00 00    	jb     4aba <csum_and_copy_from_iter+0x45a>
    48e4:	45 29 e8             	sub    %r13d,%r8d
    48e7:	44 01 eb             	add    %r13d,%ebx
    48ea:	0f 84 01 ff ff ff    	je     47f1 <csum_and_copy_from_iter+0x191>
    48f0:	42 8b 54 26 08       	mov    0x8(%rsi,%r12,1),%edx
    48f5:	39 da                	cmp    %ebx,%edx
    48f7:	0f 87 f4 fe ff ff    	ja     47f1 <csum_and_copy_from_iter+0x191>
    48fd:	45 8d 77 01          	lea    0x1(%r15),%r14d
    4901:	4c 89 f1             	mov    %r14,%rcx
    4904:	4d 89 f7             	mov    %r14,%r15
    4907:	48 c1 e1 04          	shl    $0x4,%rcx
    490b:	29 d3                	sub    %edx,%ebx
    490d:	0f 84 de fe ff ff    	je     47f1 <csum_and_copy_from_iter+0x191>
    4913:	8b 54 0e 08          	mov    0x8(%rsi,%rcx,1),%edx
    4917:	39 da                	cmp    %ebx,%edx
    4919:	76 e2                	jbe    48fd <csum_and_copy_from_iter+0x29d>
    491b:	e9 d1 fe ff ff       	jmpq   47f1 <csum_and_copy_from_iter+0x191>
    4920:	4d 89 4b 18          	mov    %r9,0x18(%r11)
    4924:	4c 2b 4d 88          	sub    -0x78(%rbp),%r9
    4928:	4d 89 dc             	mov    %r11,%r12
    492b:	4c 8b 75 80          	mov    -0x80(%rbp),%r14
    492f:	4c 8b 95 78 ff ff ff 	mov    -0x88(%rbp),%r10
    4936:	89 db                	mov    %ebx,%ebx
    4938:	49 8b 43 10          	mov    0x10(%r11),%rax
    493c:	49 c1 f9 04          	sar    $0x4,%r9
    4940:	4d 29 4b 20          	sub    %r9,0x20(%r11)
    4944:	e9 1d fe ff ff       	jmpq   4766 <csum_and_copy_from_iter+0x106>
    4949:	4c 8b 79 18          	mov    0x18(%rcx),%r15
    494d:	49 8b 47 08          	mov    0x8(%r15),%rax
    4951:	48 29 d8             	sub    %rbx,%rax
    4954:	48 39 f0             	cmp    %rsi,%rax
    4957:	48 0f 47 c6          	cmova  %rsi,%rax
    495b:	48 85 c0             	test   %rax,%rax
    495e:	49 89 c5             	mov    %rax,%r13
    4961:	0f 84 68 01 00 00    	je     4acf <csum_and_copy_from_iter+0x46f>
    4967:	48 8d 04 07          	lea    (%rdi,%rax,1),%rax
    496b:	44 89 ea             	mov    %r13d,%edx
    496e:	48 89 fe             	mov    %rdi,%rsi
    4971:	31 c9                	xor    %ecx,%ecx
    4973:	4c 89 55 b8          	mov    %r10,-0x48(%rbp)
    4977:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    497b:	49 8b 07             	mov    (%r15),%rax
    497e:	48 01 d8             	add    %rbx,%rax
    4981:	4c 01 eb             	add    %r13,%rbx
    4984:	48 89 c7             	mov    %rax,%rdi
    4987:	e8 00 00 00 00       	callq  498c <csum_and_copy_from_iter+0x32c>
    498c:	4c 8b 55 b8          	mov    -0x48(%rbp),%r10
    4990:	4d 89 f0             	mov    %r14,%r8
    4993:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    4996:	4d 29 e8             	sub    %r13,%r8
    4999:	01 c2                	add    %eax,%edx
    499b:	83 d2 00             	adc    $0x0,%edx
    499e:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    49a1:	4d 85 c0             	test   %r8,%r8
    49a4:	0f 84 95 fd ff ff    	je     473f <csum_and_copy_from_iter+0xdf>
    49aa:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    49ae:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
    49b2:	4d 89 f4             	mov    %r14,%r12
    49b5:	4d 89 ee             	mov    %r13,%r14
    49b8:	4d 89 c5             	mov    %r8,%r13
    49bb:	49 83 c7 10          	add    $0x10,%r15
    49bf:	4c 89 eb             	mov    %r13,%rbx
    49c2:	4d 39 6f 08          	cmp    %r13,0x8(%r15)
    49c6:	49 0f 46 5f 08       	cmovbe 0x8(%r15),%rbx
    49cb:	48 85 db             	test   %rbx,%rbx
    49ce:	74 eb                	je     49bb <csum_and_copy_from_iter+0x35b>
    49d0:	49 8b 3f             	mov    (%r15),%rdi
    49d3:	48 8d 04 1e          	lea    (%rsi,%rbx,1),%rax
    49d7:	31 c9                	xor    %ecx,%ecx
    49d9:	89 da                	mov    %ebx,%edx
    49db:	4c 89 55 b0          	mov    %r10,-0x50(%rbp)
    49df:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    49e3:	e8 00 00 00 00       	callq  49e8 <csum_and_copy_from_iter+0x388>
    49e8:	89 c2                	mov    %eax,%edx
    49ea:	4c 8b 55 b0          	mov    -0x50(%rbp),%r10
    49ee:	c1 ca 08             	ror    $0x8,%edx
    49f1:	41 f6 c6 01          	test   $0x1,%r14b
    49f5:	0f 45 c2             	cmovne %edx,%eax
    49f8:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    49fb:	49 01 de             	add    %rbx,%r14
    49fe:	01 c2                	add    %eax,%edx
    4a00:	83 d2 00             	adc    $0x0,%edx
    4a03:	49 29 dd             	sub    %rbx,%r13
    4a06:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    4a09:	0f 85 f4 00 00 00    	jne    4b03 <csum_and_copy_from_iter+0x4a3>
    4a0f:	4d 89 e6             	mov    %r12,%r14
    4a12:	4c 8b 65 b8          	mov    -0x48(%rbp),%r12
    4a16:	e9 24 fd ff ff       	jmpq   473f <csum_and_copy_from_iter+0xdf>
    4a1b:	48 01 f3             	add    %rsi,%rbx
    4a1e:	e9 43 fd ff ff       	jmpq   4766 <csum_and_copy_from_iter+0x106>
    4a23:	49 83 c7 10          	add    $0x10,%r15
    4a27:	4d 89 cd             	mov    %r9,%r13
    4a2a:	4d 39 4f 08          	cmp    %r9,0x8(%r15)
    4a2e:	4d 0f 46 6f 08       	cmovbe 0x8(%r15),%r13
    4a33:	4d 85 ed             	test   %r13,%r13
    4a36:	0f 84 f2 fc ff ff    	je     472e <csum_and_copy_from_iter+0xce>
    4a3c:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    4a40:	49 8b 3f             	mov    (%r15),%rdi
    4a43:	4c 8d 45 cc          	lea    -0x34(%rbp),%r8
    4a47:	31 c9                	xor    %ecx,%ecx
    4a49:	44 89 ea             	mov    %r13d,%edx
    4a4c:	4c 89 55 98          	mov    %r10,-0x68(%rbp)
    4a50:	4c 89 5d a0          	mov    %r11,-0x60(%rbp)
    4a54:	4c 89 4d a8          	mov    %r9,-0x58(%rbp)
    4a58:	31 db                	xor    %ebx,%ebx
    4a5a:	4a 8d 04 2e          	lea    (%rsi,%r13,1),%rax
    4a5e:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    4a65:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    4a69:	e8 00 00 00 00       	callq  4a6e <csum_and_copy_from_iter+0x40e>
    4a6e:	8b 55 cc             	mov    -0x34(%rbp),%edx
    4a71:	4c 8b 4d a8          	mov    -0x58(%rbp),%r9
    4a75:	4c 8b 5d a0          	mov    -0x60(%rbp),%r11
    4a79:	4c 8b 55 98          	mov    -0x68(%rbp),%r10
    4a7d:	85 d2                	test   %edx,%edx
    4a7f:	75 23                	jne    4aa4 <csum_and_copy_from_iter+0x444>
    4a81:	89 c2                	mov    %eax,%edx
    4a83:	4c 89 eb             	mov    %r13,%rbx
    4a86:	c1 ca 08             	ror    $0x8,%edx
    4a89:	41 f6 c3 01          	test   $0x1,%r11b
    4a8d:	0f 45 c2             	cmovne %edx,%eax
    4a90:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    4a93:	4d 01 eb             	add    %r13,%r11
    4a96:	01 c2                	add    %eax,%edx
    4a98:	83 d2 00             	adc    $0x0,%edx
    4a9b:	4d 29 e9             	sub    %r13,%r9
    4a9e:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    4aa1:	45 31 ed             	xor    %r13d,%r13d
    4aa4:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    4aa8:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    4aac:	e9 7d fc ff ff       	jmpq   472e <csum_and_copy_from_iter+0xce>
    4ab1:	48 89 7d b0          	mov    %rdi,-0x50(%rbp)
    4ab5:	e9 6e fc ff ff       	jmpq   4728 <csum_and_copy_from_iter+0xc8>
    4aba:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 4ac1 <csum_and_copy_from_iter+0x461>
    4ac1:	74 18                	je     4adb <csum_and_copy_from_iter+0x47b>
    4ac3:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    4ac7:	45 31 c0             	xor    %r8d,%r8d
    4aca:	e9 22 fd ff ff       	jmpq   47f1 <csum_and_copy_from_iter+0x191>
    4acf:	48 89 7d b0          	mov    %rdi,-0x50(%rbp)
    4ad3:	49 89 f0             	mov    %rsi,%r8
    4ad6:	e9 c6 fe ff ff       	jmpq   49a1 <csum_and_copy_from_iter+0x341>
    4adb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    4ae2:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    4ae6:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 4aed <csum_and_copy_from_iter+0x48d>
    4aed:	e8 00 00 00 00       	callq  4af2 <csum_and_copy_from_iter+0x492>
    4af2:	0f 0b                	ud2    
    4af4:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    4af8:	49 8b 73 18          	mov    0x18(%r11),%rsi
    4afc:	eb c5                	jmp    4ac3 <csum_and_copy_from_iter+0x463>
    4afe:	e8 00 00 00 00       	callq  4b03 <csum_and_copy_from_iter+0x4a3>
    4b03:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
    4b07:	e9 af fe ff ff       	jmpq   49bb <csum_and_copy_from_iter+0x35b>
    4b0c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000004b10 <csum_and_copy_to_iter>:
    4b10:	55                   	push   %rbp
    4b11:	49 89 fb             	mov    %rdi,%r11
    4b14:	48 89 d7             	mov    %rdx,%rdi
    4b17:	48 89 e5             	mov    %rsp,%rbp
    4b1a:	41 57                	push   %r15
    4b1c:	41 56                	push   %r14
    4b1e:	41 55                	push   %r13
    4b20:	41 54                	push   %r12
    4b22:	49 89 cc             	mov    %rcx,%r12
    4b25:	53                   	push   %rbx
    4b26:	48 83 ec 68          	sub    $0x68,%rsp
    4b2a:	48 89 55 b0          	mov    %rdx,-0x50(%rbp)
    4b2e:	8b 11                	mov    (%rcx),%edx
    4b30:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    4b37:	00 00 
    4b39:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    4b3d:	31 c0                	xor    %eax,%eax
    4b3f:	8b 0f                	mov    (%rdi),%ecx
    4b41:	89 d0                	mov    %edx,%eax
    4b43:	83 e0 fe             	and    $0xfffffffe,%eax
    4b46:	83 f8 20             	cmp    $0x20,%eax
    4b49:	89 4d b8             	mov    %ecx,-0x48(%rbp)
    4b4c:	0f 84 22 01 00 00    	je     4c74 <csum_and_copy_to_iter+0x164>
    4b52:	83 f8 40             	cmp    $0x40,%eax
    4b55:	0f 84 4b 01 00 00    	je     4ca6 <csum_and_copy_to_iter+0x196>
    4b5b:	49 8b 44 24 10       	mov    0x10(%r12),%rax
    4b60:	48 39 f0             	cmp    %rsi,%rax
    4b63:	48 0f 46 f0          	cmovbe %rax,%rsi
    4b67:	48 85 c0             	test   %rax,%rax
    4b6a:	49 89 f7             	mov    %rsi,%r15
    4b6d:	0f 84 b4 00 00 00    	je     4c27 <csum_and_copy_to_iter+0x117>
    4b73:	f6 c2 10             	test   $0x10,%dl
    4b76:	49 8b 5c 24 08       	mov    0x8(%r12),%rbx
    4b7b:	0f 85 29 01 00 00    	jne    4caa <csum_and_copy_to_iter+0x19a>
    4b81:	f6 c2 08             	test   $0x8,%dl
    4b84:	0f 85 bd 03 00 00    	jne    4f47 <csum_and_copy_to_iter+0x437>
    4b8a:	83 e2 40             	and    $0x40,%edx
    4b8d:	0f 85 35 04 00 00    	jne    4fc8 <csum_and_copy_to_iter+0x4b8>
    4b93:	4d 8b 74 24 18       	mov    0x18(%r12),%r14
    4b98:	4d 8b 6e 08          	mov    0x8(%r14),%r13
    4b9c:	49 29 dd             	sub    %rbx,%r13
    4b9f:	49 39 f5             	cmp    %rsi,%r13
    4ba2:	4c 0f 47 ee          	cmova  %rsi,%r13
    4ba6:	4d 85 ed             	test   %r13,%r13
    4ba9:	0f 84 a3 04 00 00    	je     5052 <csum_and_copy_to_iter+0x542>
    4baf:	49 8b 36             	mov    (%r14),%rsi
    4bb2:	4b 8d 04 2b          	lea    (%r11,%r13,1),%rax
    4bb6:	4c 8d 45 c8          	lea    -0x38(%rbp),%r8
    4bba:	31 c9                	xor    %ecx,%ecx
    4bbc:	44 89 ea             	mov    %r13d,%edx
    4bbf:	4c 89 df             	mov    %r11,%rdi
    4bc2:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%rbp)
    4bc9:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    4bcd:	48 01 de             	add    %rbx,%rsi
    4bd0:	e8 00 00 00 00       	callq  4bd5 <csum_and_copy_to_iter+0xc5>
    4bd5:	8b 4d c8             	mov    -0x38(%rbp),%ecx
    4bd8:	85 c9                	test   %ecx,%ecx
    4bda:	74 79                	je     4c55 <csum_and_copy_to_iter+0x145>
    4bdc:	4d 89 fa             	mov    %r15,%r10
    4bdf:	45 31 db             	xor    %r11d,%r11d
    4be2:	4d 85 ed             	test   %r13,%r13
    4be5:	75 09                	jne    4bf0 <csum_and_copy_to_iter+0xe0>
    4be7:	4d 85 d2             	test   %r10,%r10
    4bea:	0f 85 e0 03 00 00    	jne    4fd0 <csum_and_copy_to_iter+0x4c0>
    4bf0:	4d 29 d7             	sub    %r10,%r15
    4bf3:	49 39 5e 08          	cmp    %rbx,0x8(%r14)
    4bf7:	75 06                	jne    4bff <csum_and_copy_to_iter+0xef>
    4bf9:	49 83 c6 10          	add    $0x10,%r14
    4bfd:	31 db                	xor    %ebx,%ebx
    4bff:	4c 89 f0             	mov    %r14,%rax
    4c02:	49 2b 44 24 18       	sub    0x18(%r12),%rax
    4c07:	4d 89 74 24 18       	mov    %r14,0x18(%r12)
    4c0c:	48 c1 f8 04          	sar    $0x4,%rax
    4c10:	49 29 44 24 20       	sub    %rax,0x20(%r12)
    4c15:	49 8b 44 24 10       	mov    0x10(%r12),%rax
    4c1a:	4c 29 f8             	sub    %r15,%rax
    4c1d:	49 89 5c 24 08       	mov    %rbx,0x8(%r12)
    4c22:	49 89 44 24 10       	mov    %rax,0x10(%r12)
    4c27:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    4c2b:	8b 4d b8             	mov    -0x48(%rbp),%ecx
    4c2e:	89 08                	mov    %ecx,(%rax)
    4c30:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    4c34:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
    4c3b:	00 00 
    4c3d:	4c 89 f8             	mov    %r15,%rax
    4c40:	0f 85 c2 04 00 00    	jne    5108 <csum_and_copy_to_iter+0x5f8>
    4c46:	48 83 c4 68          	add    $0x68,%rsp
    4c4a:	5b                   	pop    %rbx
    4c4b:	41 5c                	pop    %r12
    4c4d:	41 5d                	pop    %r13
    4c4f:	41 5e                	pop    %r14
    4c51:	41 5f                	pop    %r15
    4c53:	5d                   	pop    %rbp
    4c54:	c3                   	retq   
    4c55:	4d 89 fa             	mov    %r15,%r10
    4c58:	8b 55 b8             	mov    -0x48(%rbp),%edx
    4c5b:	4c 01 eb             	add    %r13,%rbx
    4c5e:	01 c2                	add    %eax,%edx
    4c60:	83 d2 00             	adc    $0x0,%edx
    4c63:	4d 29 ea             	sub    %r13,%r10
    4c66:	4d 89 eb             	mov    %r13,%r11
    4c69:	89 55 b8             	mov    %edx,-0x48(%rbp)
    4c6c:	45 31 ed             	xor    %r13d,%r13d
    4c6f:	e9 6e ff ff ff       	jmpq   4be2 <csum_and_copy_to_iter+0xd2>
    4c74:	49 8b 44 24 18       	mov    0x18(%r12),%rax
    4c79:	4c 89 e7             	mov    %r12,%rdi
    4c7c:	48 89 75 98          	mov    %rsi,-0x68(%rbp)
    4c80:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    4c84:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    4c88:	44 8b 68 5c          	mov    0x5c(%rax),%r13d
    4c8c:	e8 1f b4 ff ff       	callq  b0 <sanity>
    4c91:	84 c0                	test   %al,%al
    4c93:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    4c97:	48 8b 75 98          	mov    -0x68(%rbp),%rsi
    4c9b:	0f 85 8e 01 00 00    	jne    4e2f <csum_and_copy_to_iter+0x31f>
    4ca1:	45 31 ff             	xor    %r15d,%r15d
    4ca4:	eb 8a                	jmp    4c30 <csum_and_copy_to_iter+0x120>
    4ca6:	0f 0b                	ud2    
    4ca8:	eb f7                	jmp    4ca1 <csum_and_copy_to_iter+0x191>
    4caa:	49 8b 74 24 18       	mov    0x18(%r12),%rsi
    4caf:	45 31 d2             	xor    %r10d,%r10d
    4cb2:	4c 89 df             	mov    %r11,%rdi
    4cb5:	45 89 f9             	mov    %r15d,%r9d
    4cb8:	48 c7 45 a8 00 00 00 	movq   $0x0,-0x58(%rbp)
    4cbf:	00 
    4cc0:	45 31 ed             	xor    %r13d,%r13d
    4cc3:	45 89 d6             	mov    %r10d,%r14d
    4cc6:	4c 89 bd 70 ff ff ff 	mov    %r15,-0x90(%rbp)
    4ccd:	4d 89 e3             	mov    %r12,%r11
    4cd0:	48 89 b5 78 ff ff ff 	mov    %rsi,-0x88(%rbp)
    4cd7:	4d 89 ec             	mov    %r13,%r12
    4cda:	49 c1 e4 04          	shl    $0x4,%r12
    4cde:	45 85 c9             	test   %r9d,%r9d
    4ce1:	4a 8d 0c 26          	lea    (%rsi,%r12,1),%rcx
    4ce5:	0f 84 18 01 00 00    	je     4e03 <csum_and_copy_to_iter+0x2f3>
    4ceb:	8b 41 0c             	mov    0xc(%rcx),%eax
    4cee:	44 8b 79 08          	mov    0x8(%rcx),%r15d
    4cf2:	41 b8 00 10 00 00    	mov    $0x1000,%r8d
    4cf8:	01 d8                	add    %ebx,%eax
    4cfa:	41 29 df             	sub    %ebx,%r15d
    4cfd:	89 c2                	mov    %eax,%edx
    4cff:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    4d05:	45 39 cf             	cmp    %r9d,%r15d
    4d08:	45 0f 47 f9          	cmova  %r9d,%r15d
    4d0c:	41 29 d0             	sub    %edx,%r8d
    4d0f:	45 39 c7             	cmp    %r8d,%r15d
    4d12:	45 0f 47 f8          	cmova  %r8d,%r15d
    4d16:	45 85 ff             	test   %r15d,%r15d
    4d19:	0f 84 a8 00 00 00    	je     4dc7 <csum_and_copy_to_iter+0x2b7>
    4d1f:	4c 89 5d 80          	mov    %r11,-0x80(%rbp)
    4d23:	44 89 4d 8c          	mov    %r9d,-0x74(%rbp)
    4d27:	48 8b 09             	mov    (%rcx),%rcx
    4d2a:	65 4c 8b 04 25 00 00 	mov    %gs:0x0,%r8
    4d31:	00 00 
    4d33:	41 83 80 80 12 00 00 	addl   $0x1,0x1280(%r8)
    4d3a:	01 
    4d3b:	4c 89 45 90          	mov    %r8,-0x70(%rbp)
    4d3f:	45 89 fa             	mov    %r15d,%r10d
    4d42:	c1 e8 0c             	shr    $0xc,%eax
    4d45:	4a 8d 34 17          	lea    (%rdi,%r10,1),%rsi
    4d49:	4c 89 55 98          	mov    %r10,-0x68(%rbp)
    4d4d:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
    4d51:	89 c6                	mov    %eax,%esi
    4d53:	48 c1 e6 06          	shl    $0x6,%rsi
    4d57:	48 01 ce             	add    %rcx,%rsi
    4d5a:	48 2b 35 00 00 00 00 	sub    0x0(%rip),%rsi        # 4d61 <csum_and_copy_to_iter+0x251>
    4d61:	31 c9                	xor    %ecx,%ecx
    4d63:	48 c1 fe 06          	sar    $0x6,%rsi
    4d67:	48 c1 e6 0c          	shl    $0xc,%rsi
    4d6b:	48 03 35 00 00 00 00 	add    0x0(%rip),%rsi        # 4d72 <csum_and_copy_to_iter+0x262>
    4d72:	48 01 d6             	add    %rdx,%rsi
    4d75:	44 89 fa             	mov    %r15d,%edx
    4d78:	e8 00 00 00 00       	callq  4d7d <csum_and_copy_to_iter+0x26d>
    4d7d:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    4d81:	89 c2                	mov    %eax,%edx
    4d83:	c1 ca 08             	ror    $0x8,%edx
    4d86:	f6 c1 01             	test   $0x1,%cl
    4d89:	0f 45 c2             	cmovne %edx,%eax
    4d8c:	8b 55 b8             	mov    -0x48(%rbp),%edx
    4d8f:	01 c2                	add    %eax,%edx
    4d91:	83 d2 00             	adc    $0x0,%edx
    4d94:	89 55 b8             	mov    %edx,-0x48(%rbp)
    4d97:	4c 8b 45 90          	mov    -0x70(%rbp),%r8
    4d9b:	41 83 a8 80 12 00 00 	subl   $0x1,0x1280(%r8)
    4da2:	01 
    4da3:	4c 8b 55 98          	mov    -0x68(%rbp),%r10
    4da7:	44 8b 4d 8c          	mov    -0x74(%rbp),%r9d
    4dab:	4c 8b 5d 80          	mov    -0x80(%rbp),%r11
    4daf:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
    4db3:	4c 01 d1             	add    %r10,%rcx
    4db6:	45 39 f9             	cmp    %r15d,%r9d
    4db9:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
    4dbd:	49 8b 73 18          	mov    0x18(%r11),%rsi
    4dc1:	0f 82 94 02 00 00    	jb     505b <csum_and_copy_to_iter+0x54b>
    4dc7:	45 29 f9             	sub    %r15d,%r9d
    4dca:	44 01 fb             	add    %r15d,%ebx
    4dcd:	0f 84 04 ff ff ff    	je     4cd7 <csum_and_copy_to_iter+0x1c7>
    4dd3:	42 8b 44 26 08       	mov    0x8(%rsi,%r12,1),%eax
    4dd8:	39 d8                	cmp    %ebx,%eax
    4dda:	0f 87 f7 fe ff ff    	ja     4cd7 <csum_and_copy_to_iter+0x1c7>
    4de0:	45 8d 6e 01          	lea    0x1(%r14),%r13d
    4de4:	4c 89 ea             	mov    %r13,%rdx
    4de7:	4d 89 ee             	mov    %r13,%r14
    4dea:	48 c1 e2 04          	shl    $0x4,%rdx
    4dee:	29 c3                	sub    %eax,%ebx
    4df0:	0f 84 e1 fe ff ff    	je     4cd7 <csum_and_copy_to_iter+0x1c7>
    4df6:	8b 44 16 08          	mov    0x8(%rsi,%rdx,1),%eax
    4dfa:	39 d8                	cmp    %ebx,%eax
    4dfc:	76 e2                	jbe    4de0 <csum_and_copy_to_iter+0x2d0>
    4dfe:	e9 d4 fe ff ff       	jmpq   4cd7 <csum_and_copy_to_iter+0x1c7>
    4e03:	48 89 cf             	mov    %rcx,%rdi
    4e06:	48 2b bd 78 ff ff ff 	sub    -0x88(%rbp),%rdi
    4e0d:	4d 89 dc             	mov    %r11,%r12
    4e10:	49 89 4c 24 18       	mov    %rcx,0x18(%r12)
    4e15:	4c 8b bd 70 ff ff ff 	mov    -0x90(%rbp),%r15
    4e1c:	89 db                	mov    %ebx,%ebx
    4e1e:	49 8b 43 10          	mov    0x10(%r11),%rax
    4e22:	48 c1 ff 04          	sar    $0x4,%rdi
    4e26:	49 29 7b 20          	sub    %rdi,0x20(%r11)
    4e2a:	e9 eb fd ff ff       	jmpq   4c1a <csum_and_copy_to_iter+0x10a>
    4e2f:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
    4e33:	48 8d 55 c4          	lea    -0x3c(%rbp),%rdx
    4e37:	4c 89 e7             	mov    %r12,%rdi
    4e3a:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    4e3e:	e8 4d b4 ff ff       	callq  290 <push_pipe>
    4e43:	48 85 c0             	test   %rax,%rax
    4e46:	49 89 c7             	mov    %rax,%r15
    4e49:	0f 84 52 fe ff ff    	je     4ca1 <csum_and_copy_to_iter+0x191>
    4e4f:	41 8d 45 ff          	lea    -0x1(%r13),%eax
    4e53:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    4e57:	45 31 ed             	xor    %r13d,%r13d
    4e5a:	4d 89 fe             	mov    %r15,%r14
    4e5d:	4c 89 7d 90          	mov    %r15,-0x70(%rbp)
    4e61:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    4e65:	89 45 98             	mov    %eax,-0x68(%rbp)
    4e68:	4d 89 ef             	mov    %r13,%r15
    4e6b:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    4e6e:	44 8b 6d b8          	mov    -0x48(%rbp),%r13d
    4e72:	4d 89 e2             	mov    %r12,%r10
    4e75:	4d 89 dc             	mov    %r11,%r12
    4e78:	bb 00 10 00 00       	mov    $0x1000,%ebx
    4e7d:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    4e81:	4c 89 55 a8          	mov    %r10,-0x58(%rbp)
    4e85:	48 29 d3             	sub    %rdx,%rbx
    4e88:	4c 39 f3             	cmp    %r14,%rbx
    4e8b:	49 0f 47 de          	cmova  %r14,%rbx
    4e8f:	23 45 98             	and    -0x68(%rbp),%eax
    4e92:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    4e96:	48 c1 e0 03          	shl    $0x3,%rax
    4e9a:	48 03 81 90 00 00 00 	add    0x90(%rcx),%rax
    4ea1:	48 8b 30             	mov    (%rax),%rsi
    4ea4:	65 4c 8b 04 25 00 00 	mov    %gs:0x0,%r8
    4eab:	00 00 
    4ead:	41 83 80 80 12 00 00 	addl   $0x1,0x1280(%r8)
    4eb4:	01 
    4eb5:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
    4eb9:	48 2b 35 00 00 00 00 	sub    0x0(%rip),%rsi        # 4ec0 <csum_and_copy_to_iter+0x3b0>
    4ec0:	31 c9                	xor    %ecx,%ecx
    4ec2:	89 da                	mov    %ebx,%edx
    4ec4:	4c 89 e7             	mov    %r12,%rdi
    4ec7:	48 c1 fe 06          	sar    $0x6,%rsi
    4ecb:	48 c1 e6 0c          	shl    $0xc,%rsi
    4ecf:	48 03 35 00 00 00 00 	add    0x0(%rip),%rsi        # 4ed6 <csum_and_copy_to_iter+0x3c6>
    4ed6:	48 03 75 c8          	add    -0x38(%rbp),%rsi
    4eda:	e8 00 00 00 00       	callq  4edf <csum_and_copy_to_iter+0x3cf>
    4edf:	89 c2                	mov    %eax,%edx
    4ee1:	c1 ca 08             	ror    $0x8,%edx
    4ee4:	41 f6 c7 01          	test   $0x1,%r15b
    4ee8:	0f 45 c2             	cmovne %edx,%eax
    4eeb:	41 01 c5             	add    %eax,%r13d
    4eee:	41 83 d5 00          	adc    $0x0,%r13d
    4ef2:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
    4ef6:	41 83 a8 80 12 00 00 	subl   $0x1,0x1280(%r8)
    4efd:	01 
    4efe:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    4f02:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    4f05:	49 01 df             	add    %rbx,%r15
    4f08:	4c 8b 55 a8          	mov    -0x58(%rbp),%r10
    4f0c:	49 01 dc             	add    %rbx,%r12
    4f0f:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
    4f16:	00 
    4f17:	48 01 da             	add    %rbx,%rdx
    4f1a:	41 89 42 20          	mov    %eax,0x20(%r10)
    4f1e:	49 89 52 08          	mov    %rdx,0x8(%r10)
    4f22:	83 c0 01             	add    $0x1,%eax
    4f25:	31 d2                	xor    %edx,%edx
    4f27:	49 29 de             	sub    %rbx,%r14
    4f2a:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    4f2d:	0f 85 45 ff ff ff    	jne    4e78 <csum_and_copy_to_iter+0x368>
    4f33:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    4f37:	4c 8b 7d 90          	mov    -0x70(%rbp),%r15
    4f3b:	4d 29 7a 10          	sub    %r15,0x10(%r10)
    4f3f:	44 89 28             	mov    %r13d,(%rax)
    4f42:	e9 e9 fc ff ff       	jmpq   4c30 <csum_and_copy_to_iter+0x120>
    4f47:	4d 8b 6c 24 18       	mov    0x18(%r12),%r13
    4f4c:	4d 8b 75 08          	mov    0x8(%r13),%r14
    4f50:	49 29 de             	sub    %rbx,%r14
    4f53:	49 39 f6             	cmp    %rsi,%r14
    4f56:	4c 0f 47 f6          	cmova  %rsi,%r14
    4f5a:	4d 85 f6             	test   %r14,%r14
    4f5d:	0f 84 73 01 00 00    	je     50d6 <csum_and_copy_to_iter+0x5c6>
    4f63:	49 8b 75 00          	mov    0x0(%r13),%rsi
    4f67:	4b 8d 04 33          	lea    (%r11,%r14,1),%rax
    4f6b:	44 89 f2             	mov    %r14d,%edx
    4f6e:	31 c9                	xor    %ecx,%ecx
    4f70:	4c 89 df             	mov    %r11,%rdi
    4f73:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    4f77:	48 01 de             	add    %rbx,%rsi
    4f7a:	4c 01 f3             	add    %r14,%rbx
    4f7d:	e8 00 00 00 00       	callq  4f82 <csum_and_copy_to_iter+0x472>
    4f82:	4d 89 f8             	mov    %r15,%r8
    4f85:	8b 55 b8             	mov    -0x48(%rbp),%edx
    4f88:	4d 29 f0             	sub    %r14,%r8
    4f8b:	01 c2                	add    %eax,%edx
    4f8d:	83 d2 00             	adc    $0x0,%edx
    4f90:	89 55 b8             	mov    %edx,-0x48(%rbp)
    4f93:	4d 85 c0             	test   %r8,%r8
    4f96:	0f 85 d4 00 00 00    	jne    5070 <csum_and_copy_to_iter+0x560>
    4f9c:	49 39 5d 08          	cmp    %rbx,0x8(%r13)
    4fa0:	75 06                	jne    4fa8 <csum_and_copy_to_iter+0x498>
    4fa2:	49 83 c5 10          	add    $0x10,%r13
    4fa6:	31 db                	xor    %ebx,%ebx
    4fa8:	4c 89 e8             	mov    %r13,%rax
    4fab:	49 2b 44 24 18       	sub    0x18(%r12),%rax
    4fb0:	4d 89 6c 24 18       	mov    %r13,0x18(%r12)
    4fb5:	48 c1 f8 04          	sar    $0x4,%rax
    4fb9:	49 29 44 24 20       	sub    %rax,0x20(%r12)
    4fbe:	49 8b 44 24 10       	mov    0x10(%r12),%rax
    4fc3:	e9 52 fc ff ff       	jmpq   4c1a <csum_and_copy_to_iter+0x10a>
    4fc8:	48 01 f3             	add    %rsi,%rbx
    4fcb:	e9 4a fc ff ff       	jmpq   4c1a <csum_and_copy_to_iter+0x10a>
    4fd0:	49 83 c6 10          	add    $0x10,%r14
    4fd4:	4d 89 d5             	mov    %r10,%r13
    4fd7:	4d 39 56 08          	cmp    %r10,0x8(%r14)
    4fdb:	4d 0f 46 6e 08       	cmovbe 0x8(%r14),%r13
    4fe0:	4d 85 ed             	test   %r13,%r13
    4fe3:	0f 84 f9 fb ff ff    	je     4be2 <csum_and_copy_to_iter+0xd2>
    4fe9:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
    4fed:	49 8b 36             	mov    (%r14),%rsi
    4ff0:	4c 8d 45 c8          	lea    -0x38(%rbp),%r8
    4ff4:	31 c9                	xor    %ecx,%ecx
    4ff6:	44 89 ea             	mov    %r13d,%edx
    4ff9:	4c 89 5d 98          	mov    %r11,-0x68(%rbp)
    4ffd:	4c 89 55 a0          	mov    %r10,-0x60(%rbp)
    5001:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%rbp)
    5008:	31 db                	xor    %ebx,%ebx
    500a:	4a 8d 04 2f          	lea    (%rdi,%r13,1),%rax
    500e:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    5012:	e8 00 00 00 00       	callq  5017 <csum_and_copy_to_iter+0x507>
    5017:	8b 55 c8             	mov    -0x38(%rbp),%edx
    501a:	4c 8b 55 a0          	mov    -0x60(%rbp),%r10
    501e:	4c 8b 5d 98          	mov    -0x68(%rbp),%r11
    5022:	85 d2                	test   %edx,%edx
    5024:	0f 85 b8 fb ff ff    	jne    4be2 <csum_and_copy_to_iter+0xd2>
    502a:	89 c2                	mov    %eax,%edx
    502c:	4c 89 eb             	mov    %r13,%rbx
    502f:	c1 ca 08             	ror    $0x8,%edx
    5032:	41 f6 c3 01          	test   $0x1,%r11b
    5036:	0f 45 c2             	cmovne %edx,%eax
    5039:	8b 55 b8             	mov    -0x48(%rbp),%edx
    503c:	4d 01 eb             	add    %r13,%r11
    503f:	01 c2                	add    %eax,%edx
    5041:	83 d2 00             	adc    $0x0,%edx
    5044:	4d 29 ea             	sub    %r13,%r10
    5047:	89 55 b8             	mov    %edx,-0x48(%rbp)
    504a:	45 31 ed             	xor    %r13d,%r13d
    504d:	e9 90 fb ff ff       	jmpq   4be2 <csum_and_copy_to_iter+0xd2>
    5052:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    5056:	e9 81 fb ff ff       	jmpq   4bdc <csum_and_copy_to_iter+0xcc>
    505b:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 5062 <csum_and_copy_to_iter+0x552>
    5062:	74 7e                	je     50e2 <csum_and_copy_to_iter+0x5d2>
    5064:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
    5068:	45 31 c9             	xor    %r9d,%r9d
    506b:	e9 67 fc ff ff       	jmpq   4cd7 <csum_and_copy_to_iter+0x1c7>
    5070:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
    5074:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
    5078:	4d 89 fc             	mov    %r15,%r12
    507b:	4d 89 f7             	mov    %r14,%r15
    507e:	4d 89 c6             	mov    %r8,%r14
    5081:	49 83 c5 10          	add    $0x10,%r13
    5085:	4c 89 f3             	mov    %r14,%rbx
    5088:	4d 39 75 08          	cmp    %r14,0x8(%r13)
    508c:	49 0f 46 5d 08       	cmovbe 0x8(%r13),%rbx
    5091:	48 85 db             	test   %rbx,%rbx
    5094:	74 eb                	je     5081 <csum_and_copy_to_iter+0x571>
    5096:	49 8b 75 00          	mov    0x0(%r13),%rsi
    509a:	48 8d 04 1f          	lea    (%rdi,%rbx,1),%rax
    509e:	31 c9                	xor    %ecx,%ecx
    50a0:	89 da                	mov    %ebx,%edx
    50a2:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    50a6:	e8 00 00 00 00       	callq  50ab <csum_and_copy_to_iter+0x59b>
    50ab:	89 c2                	mov    %eax,%edx
    50ad:	c1 ca 08             	ror    $0x8,%edx
    50b0:	41 f6 c7 01          	test   $0x1,%r15b
    50b4:	0f 45 c2             	cmovne %edx,%eax
    50b7:	8b 55 b8             	mov    -0x48(%rbp),%edx
    50ba:	49 01 df             	add    %rbx,%r15
    50bd:	01 c2                	add    %eax,%edx
    50bf:	83 d2 00             	adc    $0x0,%edx
    50c2:	49 29 de             	sub    %rbx,%r14
    50c5:	89 55 b8             	mov    %edx,-0x48(%rbp)
    50c8:	75 43                	jne    510d <csum_and_copy_to_iter+0x5fd>
    50ca:	4d 89 e7             	mov    %r12,%r15
    50cd:	4c 8b 65 a8          	mov    -0x58(%rbp),%r12
    50d1:	e9 c6 fe ff ff       	jmpq   4f9c <csum_and_copy_to_iter+0x48c>
    50d6:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    50da:	49 89 f0             	mov    %rsi,%r8
    50dd:	e9 b1 fe ff ff       	jmpq   4f93 <csum_and_copy_to_iter+0x483>
    50e2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    50e9:	4c 89 5d 98          	mov    %r11,-0x68(%rbp)
    50ed:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 50f4 <csum_and_copy_to_iter+0x5e4>
    50f4:	e8 00 00 00 00       	callq  50f9 <csum_and_copy_to_iter+0x5e9>
    50f9:	0f 0b                	ud2    
    50fb:	4c 8b 5d 98          	mov    -0x68(%rbp),%r11
    50ff:	49 8b 73 18          	mov    0x18(%r11),%rsi
    5103:	e9 5c ff ff ff       	jmpq   5064 <csum_and_copy_to_iter+0x554>
    5108:	e8 00 00 00 00       	callq  510d <csum_and_copy_to_iter+0x5fd>
    510d:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
    5111:	e9 6b ff ff ff       	jmpq   5081 <csum_and_copy_to_iter+0x571>
    5116:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    511d:	00 00 00 

0000000000005120 <iov_iter_get_pages_alloc>:
    5120:	55                   	push   %rbp
    5121:	48 89 e5             	mov    %rsp,%rbp
    5124:	41 57                	push   %r15
    5126:	41 56                	push   %r14
    5128:	41 55                	push   %r13
    512a:	41 54                	push   %r12
    512c:	49 89 fd             	mov    %rdi,%r13
    512f:	53                   	push   %rbx
    5130:	48 89 d3             	mov    %rdx,%rbx
    5133:	49 89 f4             	mov    %rsi,%r12
    5136:	49 89 ce             	mov    %rcx,%r14
    5139:	48 83 ec 20          	sub    $0x20,%rsp
    513d:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    5144:	00 00 
    5146:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    514a:	31 c0                	xor    %eax,%eax
    514c:	8b 07                	mov    (%rdi),%eax
    514e:	48 39 57 10          	cmp    %rdx,0x10(%rdi)
    5152:	48 0f 46 5f 10       	cmovbe 0x10(%rdi),%rbx
    5157:	89 c2                	mov    %eax,%edx
    5159:	83 e2 fe             	and    $0xfffffffe,%edx
    515c:	83 fa 20             	cmp    $0x20,%edx
    515f:	0f 84 4f 01 00 00    	je     52b4 <iov_iter_get_pages_alloc+0x194>
    5165:	83 fa 40             	cmp    $0x40,%edx
    5168:	0f 84 39 01 00 00    	je     52a7 <iov_iter_get_pages_alloc+0x187>
    516e:	48 85 db             	test   %rbx,%rbx
    5171:	0f 84 39 01 00 00    	je     52b0 <iov_iter_get_pages_alloc+0x190>
    5177:	a8 10                	test   $0x10,%al
    5179:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
    517d:	0f 85 92 02 00 00    	jne    5415 <iov_iter_get_pages_alloc+0x2f5>
    5183:	a8 08                	test   $0x8,%al
    5185:	0f 85 01 01 00 00    	jne    528c <iov_iter_get_pages_alloc+0x16c>
    518b:	a8 40                	test   $0x40,%al
    518d:	0f 85 1d 01 00 00    	jne    52b0 <iov_iter_get_pages_alloc+0x190>
    5193:	49 8b 55 18          	mov    0x18(%r13),%rdx
    5197:	48 8b 42 08          	mov    0x8(%rdx),%rax
    519b:	48 29 f8             	sub    %rdi,%rax
    519e:	48 39 d8             	cmp    %rbx,%rax
    51a1:	48 0f 47 c3          	cmova  %rbx,%rax
    51a5:	48 85 c0             	test   %rax,%rax
    51a8:	0f 84 c1 00 00 00    	je     526f <iov_iter_get_pages_alloc+0x14f>
    51ae:	48 8b 0a             	mov    (%rdx),%rcx
    51b1:	48 01 f9             	add    %rdi,%rcx
    51b4:	48 89 cb             	mov    %rcx,%rbx
    51b7:	bf 08 00 00 00       	mov    $0x8,%edi
    51bc:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    51c0:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
    51c6:	49 89 1e             	mov    %rbx,(%r14)
    51c9:	48 01 c3             	add    %rax,%rbx
    51cc:	4c 8d bb ff 0f 00 00 	lea    0xfff(%rbx),%r15
    51d3:	49 c1 ef 0c          	shr    $0xc,%r15
    51d7:	49 63 c7             	movslq %r15d,%rax
    51da:	48 f7 e7             	mul    %rdi
    51dd:	48 89 c7             	mov    %rax,%rdi
    51e0:	0f 80 80 00 00 00    	jo     5266 <iov_iter_get_pages_alloc+0x146>
    51e6:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    51eb:	be c0 0c 00 00       	mov    $0xcc0,%esi
    51f0:	e8 00 00 00 00       	callq  51f5 <iov_iter_get_pages_alloc+0xd5>
    51f5:	48 85 c0             	test   %rax,%rax
    51f8:	74 6c                	je     5266 <iov_iter_get_pages_alloc+0x146>
    51fa:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    51fe:	41 8b 55 00          	mov    0x0(%r13),%edx
    5202:	44 89 fe             	mov    %r15d,%esi
    5205:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    5209:	48 81 e1 00 f0 ff ff 	and    $0xfffffffffffff000,%rcx
    5210:	f7 d2                	not    %edx
    5212:	83 e2 01             	and    $0x1,%edx
    5215:	48 89 cf             	mov    %rcx,%rdi
    5218:	48 89 c1             	mov    %rax,%rcx
    521b:	e8 00 00 00 00       	callq  5220 <iov_iter_get_pages_alloc+0x100>
    5220:	85 c0                	test   %eax,%eax
    5222:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
    5226:	0f 88 dc 02 00 00    	js     5508 <iov_iter_get_pages_alloc+0x3e8>
    522c:	48 63 d0             	movslq %eax,%rdx
    522f:	4d 89 04 24          	mov    %r8,(%r12)
    5233:	48 c1 e2 0c          	shl    $0xc,%rdx
    5237:	44 39 f8             	cmp    %r15d,%eax
    523a:	48 0f 45 da          	cmovne %rdx,%rbx
    523e:	48 89 d8             	mov    %rbx,%rax
    5241:	49 2b 06             	sub    (%r14),%rax
    5244:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    5248:	65 48 33 34 25 28 00 	xor    %gs:0x28,%rsi
    524f:	00 00 
    5251:	0f 85 22 03 00 00    	jne    5579 <iov_iter_get_pages_alloc+0x459>
    5257:	48 83 c4 20          	add    $0x20,%rsp
    525b:	5b                   	pop    %rbx
    525c:	41 5c                	pop    %r12
    525e:	41 5d                	pop    %r13
    5260:	41 5e                	pop    %r14
    5262:	41 5f                	pop    %r15
    5264:	5d                   	pop    %rbp
    5265:	c3                   	retq   
    5266:	48 c7 c0 f4 ff ff ff 	mov    $0xfffffffffffffff4,%rax
    526d:	eb d5                	jmp    5244 <iov_iter_get_pages_alloc+0x124>
    526f:	48 83 c2 10          	add    $0x10,%rdx
    5273:	48 89 d8             	mov    %rbx,%rax
    5276:	48 39 5a 08          	cmp    %rbx,0x8(%rdx)
    527a:	48 0f 46 42 08       	cmovbe 0x8(%rdx),%rax
    527f:	48 85 c0             	test   %rax,%rax
    5282:	74 eb                	je     526f <iov_iter_get_pages_alloc+0x14f>
    5284:	48 8b 0a             	mov    (%rdx),%rcx
    5287:	e9 28 ff ff ff       	jmpq   51b4 <iov_iter_get_pages_alloc+0x94>
    528c:	49 8b 55 18          	mov    0x18(%r13),%rdx
    5290:	48 8b 42 08          	mov    0x8(%rdx),%rax
    5294:	48 29 f8             	sub    %rdi,%rax
    5297:	48 39 d8             	cmp    %rbx,%rax
    529a:	48 0f 47 c3          	cmova  %rbx,%rax
    529e:	48 85 c0             	test   %rax,%rax
    52a1:	0f 84 0f 02 00 00    	je     54b6 <iov_iter_get_pages_alloc+0x396>
    52a7:	48 c7 c0 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rax
    52ae:	eb 94                	jmp    5244 <iov_iter_get_pages_alloc+0x124>
    52b0:	31 c0                	xor    %eax,%eax
    52b2:	eb 90                	jmp    5244 <iov_iter_get_pages_alloc+0x124>
    52b4:	31 c0                	xor    %eax,%eax
    52b6:	48 85 db             	test   %rbx,%rbx
    52b9:	74 89                	je     5244 <iov_iter_get_pages_alloc+0x124>
    52bb:	e8 f0 ad ff ff       	callq  b0 <sanity>
    52c0:	84 c0                	test   %al,%al
    52c2:	74 e3                	je     52a7 <iov_iter_get_pages_alloc+0x187>
    52c4:	49 8b 45 08          	mov    0x8(%r13),%rax
    52c8:	45 8b 7d 20          	mov    0x20(%r13),%r15d
    52cc:	48 85 c0             	test   %rax,%rax
    52cf:	74 36                	je     5307 <iov_iter_get_pages_alloc+0x1e7>
    52d1:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    52d5:	8b 71 5c             	mov    0x5c(%rcx),%esi
    52d8:	48 8b b9 90 00 00 00 	mov    0x90(%rcx),%rdi
    52df:	8d 56 ff             	lea    -0x1(%rsi),%edx
    52e2:	44 21 fa             	and    %r15d,%edx
    52e5:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
    52e9:	48 8d 14 d7          	lea    (%rdi,%rdx,8),%rdx
    52ed:	48 81 7a 10 00 00 00 	cmpq   $0x0,0x10(%rdx)
    52f4:	00 
    52f5:	75 0c                	jne    5303 <iov_iter_get_pages_alloc+0x1e3>
    52f7:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
    52fd:	0f 85 4d 02 00 00    	jne    5550 <iov_iter_get_pages_alloc+0x430>
    5303:	41 83 c7 01          	add    $0x1,%r15d
    5307:	49 c7 06 00 00 00 00 	movq   $0x0,(%r14)
    530e:	49 8b 55 18          	mov    0x18(%r13),%rdx
    5312:	44 89 fe             	mov    %r15d,%esi
    5315:	31 c0                	xor    %eax,%eax
    5317:	8b 4a 58             	mov    0x58(%rdx),%ecx
    531a:	2b 72 54             	sub    0x54(%rdx),%esi
    531d:	39 ce                	cmp    %ecx,%esi
    531f:	0f 83 f7 01 00 00    	jae    551c <iov_iter_get_pages_alloc+0x3fc>
    5325:	8b 7a 5c             	mov    0x5c(%rdx),%edi
    5328:	29 f7                	sub    %esi,%edi
    532a:	39 cf                	cmp    %ecx,%edi
    532c:	48 0f 47 f9          	cmova  %rcx,%rdi
    5330:	48 89 fa             	mov    %rdi,%rdx
    5333:	48 c1 e2 0c          	shl    $0xc,%rdx
    5337:	48 29 c2             	sub    %rax,%rdx
    533a:	48 39 d3             	cmp    %rdx,%rbx
    533d:	0f 87 2e 02 00 00    	ja     5571 <iov_iter_get_pages_alloc+0x451>
    5343:	48 8d bc 03 ff 0f 00 	lea    0xfff(%rbx,%rax,1),%rdi
    534a:	00 
    534b:	48 c1 ef 0c          	shr    $0xc,%rdi
    534f:	89 ff                	mov    %edi,%edi
    5351:	48 c1 e7 03          	shl    $0x3,%rdi
    5355:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    535a:	be c0 0c 00 00       	mov    $0xcc0,%esi
    535f:	e8 00 00 00 00       	callq  5364 <iov_iter_get_pages_alloc+0x244>
    5364:	48 85 c0             	test   %rax,%rax
    5367:	0f 84 f9 fe ff ff    	je     5266 <iov_iter_get_pages_alloc+0x146>
    536d:	4d 8b 45 18          	mov    0x18(%r13),%r8
    5371:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    5375:	48 8d 55 cc          	lea    -0x34(%rbp),%rdx
    5379:	4c 89 f1             	mov    %r14,%rcx
    537c:	48 89 de             	mov    %rbx,%rsi
    537f:	4c 89 ef             	mov    %r13,%rdi
    5382:	44 89 7d cc          	mov    %r15d,-0x34(%rbp)
    5386:	41 8b 40 5c          	mov    0x5c(%r8),%eax
    538a:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
    538e:	44 8d 78 ff          	lea    -0x1(%rax),%r15d
    5392:	e8 f9 ae ff ff       	callq  290 <push_pipe>
    5397:	48 85 c0             	test   %rax,%rax
    539a:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
    539e:	0f 84 90 01 00 00    	je     5534 <iov_iter_get_pages_alloc+0x414>
    53a4:	49 8b 36             	mov    (%r14),%rsi
    53a7:	48 01 c6             	add    %rax,%rsi
    53aa:	48 85 f6             	test   %rsi,%rsi
    53ad:	7e 54                	jle    5403 <iov_iter_get_pages_alloc+0x2e3>
    53af:	48 83 ee 01          	sub    $0x1,%rsi
    53b3:	8b 55 cc             	mov    -0x34(%rbp),%edx
    53b6:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
    53ba:	48 c1 ee 0c          	shr    $0xc,%rsi
    53be:	4c 89 c9             	mov    %r9,%rcx
    53c1:	49 8d 7c f1 08       	lea    0x8(%r9,%rsi,8),%rdi
    53c6:	49 8b b0 90 00 00 00 	mov    0x90(%r8),%rsi
    53cd:	44 21 fa             	and    %r15d,%edx
    53d0:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
    53d4:	48 8d 14 d6          	lea    (%rsi,%rdx,8),%rdx
    53d8:	48 8b 12             	mov    (%rdx),%rdx
    53db:	48 89 11             	mov    %rdx,(%rcx)
    53de:	48 8b 72 08          	mov    0x8(%rdx),%rsi
    53e2:	4c 8d 56 ff          	lea    -0x1(%rsi),%r10
    53e6:	83 e6 01             	and    $0x1,%esi
    53e9:	49 0f 45 d2          	cmovne %r10,%rdx
    53ed:	f0 ff 42 34          	lock incl 0x34(%rdx)
    53f1:	8b 75 cc             	mov    -0x34(%rbp),%esi
    53f4:	48 83 c1 08          	add    $0x8,%rcx
    53f8:	48 39 f9             	cmp    %rdi,%rcx
    53fb:	8d 56 01             	lea    0x1(%rsi),%edx
    53fe:	89 55 cc             	mov    %edx,-0x34(%rbp)
    5401:	75 c3                	jne    53c6 <iov_iter_get_pages_alloc+0x2a6>
    5403:	48 85 c0             	test   %rax,%rax
    5406:	0f 8e 2f 01 00 00    	jle    553b <iov_iter_get_pages_alloc+0x41b>
    540c:	4d 89 0c 24          	mov    %r9,(%r12)
    5410:	e9 2f fe ff ff       	jmpq   5244 <iov_iter_get_pages_alloc+0x124>
    5415:	85 db                	test   %ebx,%ebx
    5417:	89 de                	mov    %ebx,%esi
    5419:	0f 84 91 fe ff ff    	je     52b0 <iov_iter_get_pages_alloc+0x190>
    541f:	4d 8b 45 18          	mov    0x18(%r13),%r8
    5423:	31 c9                	xor    %ecx,%ecx
    5425:	41 b9 00 10 00 00    	mov    $0x1000,%r9d
    542b:	45 8b 78 0c          	mov    0xc(%r8),%r15d
    542f:	49 8b 18             	mov    (%r8),%rbx
    5432:	41 8b 50 08          	mov    0x8(%r8),%edx
    5436:	41 01 ff             	add    %edi,%r15d
    5439:	41 89 d5             	mov    %edx,%r13d
    543c:	44 89 f8             	mov    %r15d,%eax
    543f:	45 89 ca             	mov    %r9d,%r10d
    5442:	41 29 fd             	sub    %edi,%r13d
    5445:	25 ff 0f 00 00       	and    $0xfff,%eax
    544a:	41 39 f5             	cmp    %esi,%r13d
    544d:	44 0f 47 ee          	cmova  %esi,%r13d
    5451:	41 29 c2             	sub    %eax,%r10d
    5454:	45 39 d5             	cmp    %r10d,%r13d
    5457:	45 0f 47 ea          	cmova  %r10d,%r13d
    545b:	45 85 ed             	test   %r13d,%r13d
    545e:	74 71                	je     54d1 <iov_iter_get_pages_alloc+0x3b1>
    5460:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    5465:	49 89 06             	mov    %rax,(%r14)
    5468:	be c0 0c 00 00       	mov    $0xcc0,%esi
    546d:	bf 08 00 00 00       	mov    $0x8,%edi
    5472:	e8 00 00 00 00       	callq  5477 <iov_iter_get_pages_alloc+0x357>
    5477:	48 89 c2             	mov    %rax,%rdx
    547a:	49 89 04 24          	mov    %rax,(%r12)
    547e:	48 c7 c0 f4 ff ff ff 	mov    $0xfffffffffffffff4,%rax
    5485:	48 85 d2             	test   %rdx,%rdx
    5488:	0f 84 b6 fd ff ff    	je     5244 <iov_iter_get_pages_alloc+0x124>
    548e:	41 c1 ef 0c          	shr    $0xc,%r15d
    5492:	49 c1 e7 06          	shl    $0x6,%r15
    5496:	4c 01 fb             	add    %r15,%rbx
    5499:	48 89 1a             	mov    %rbx,(%rdx)
    549c:	48 8b 43 08          	mov    0x8(%rbx),%rax
    54a0:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
    54a4:	a8 01                	test   $0x1,%al
    54a6:	48 0f 45 da          	cmovne %rdx,%rbx
    54aa:	f0 ff 43 34          	lock incl 0x34(%rbx)
    54ae:	44 89 e8             	mov    %r13d,%eax
    54b1:	e9 8e fd ff ff       	jmpq   5244 <iov_iter_get_pages_alloc+0x124>
    54b6:	48 83 c2 10          	add    $0x10,%rdx
    54ba:	48 89 d8             	mov    %rbx,%rax
    54bd:	48 39 5a 08          	cmp    %rbx,0x8(%rdx)
    54c1:	48 0f 46 42 08       	cmovbe 0x8(%rdx),%rax
    54c6:	48 85 c0             	test   %rax,%rax
    54c9:	0f 85 d8 fd ff ff    	jne    52a7 <iov_iter_get_pages_alloc+0x187>
    54cf:	eb e5                	jmp    54b6 <iov_iter_get_pages_alloc+0x396>
    54d1:	85 ff                	test   %edi,%edi
    54d3:	0f 84 60 ff ff ff    	je     5439 <iov_iter_get_pages_alloc+0x319>
    54d9:	39 d7                	cmp    %edx,%edi
    54db:	73 09                	jae    54e6 <iov_iter_get_pages_alloc+0x3c6>
    54dd:	e9 57 ff ff ff       	jmpq   5439 <iov_iter_get_pages_alloc+0x319>
    54e2:	39 d7                	cmp    %edx,%edi
    54e4:	72 3f                	jb     5525 <iov_iter_get_pages_alloc+0x405>
    54e6:	8d 41 01             	lea    0x1(%rcx),%eax
    54e9:	29 d7                	sub    %edx,%edi
    54eb:	48 89 c1             	mov    %rax,%rcx
    54ee:	48 c1 e0 04          	shl    $0x4,%rax
    54f2:	4c 01 c0             	add    %r8,%rax
    54f5:	85 ff                	test   %edi,%edi
    54f7:	8b 50 08             	mov    0x8(%rax),%edx
    54fa:	75 e6                	jne    54e2 <iov_iter_get_pages_alloc+0x3c2>
    54fc:	48 8b 18             	mov    (%rax),%rbx
    54ff:	44 8b 78 0c          	mov    0xc(%rax),%r15d
    5503:	e9 31 ff ff ff       	jmpq   5439 <iov_iter_get_pages_alloc+0x319>
    5508:	4c 89 c7             	mov    %r8,%rdi
    550b:	89 45 c0             	mov    %eax,-0x40(%rbp)
    550e:	e8 00 00 00 00       	callq  5513 <iov_iter_get_pages_alloc+0x3f3>
    5513:	48 63 45 c0          	movslq -0x40(%rbp),%rax
    5517:	e9 28 fd ff ff       	jmpq   5244 <iov_iter_get_pages_alloc+0x124>
    551c:	31 ff                	xor    %edi,%edi
    551e:	31 db                	xor    %ebx,%ebx
    5520:	e9 2c fe ff ff       	jmpq   5351 <iov_iter_get_pages_alloc+0x231>
    5525:	44 8b 78 0c          	mov    0xc(%rax),%r15d
    5529:	48 8b 18             	mov    (%rax),%rbx
    552c:	41 01 ff             	add    %edi,%r15d
    552f:	e9 05 ff ff ff       	jmpq   5439 <iov_iter_get_pages_alloc+0x319>
    5534:	48 c7 c0 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rax
    553b:	4c 89 cf             	mov    %r9,%rdi
    553e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    5542:	e8 00 00 00 00       	callq  5547 <iov_iter_get_pages_alloc+0x427>
    5547:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    554b:	e9 f4 fc ff ff       	jmpq   5244 <iov_iter_get_pages_alloc+0x124>
    5550:	49 89 06             	mov    %rax,(%r14)
    5553:	49 8b 55 18          	mov    0x18(%r13),%rdx
    5557:	44 89 fe             	mov    %r15d,%esi
    555a:	8b 4a 58             	mov    0x58(%rdx),%ecx
    555d:	2b 72 54             	sub    0x54(%rdx),%esi
    5560:	39 f1                	cmp    %esi,%ecx
    5562:	0f 87 bd fd ff ff    	ja     5325 <iov_iter_get_pages_alloc+0x205>
    5568:	31 d2                	xor    %edx,%edx
    556a:	31 ff                	xor    %edi,%edi
    556c:	e9 c6 fd ff ff       	jmpq   5337 <iov_iter_get_pages_alloc+0x217>
    5571:	48 89 d3             	mov    %rdx,%rbx
    5574:	e9 d8 fd ff ff       	jmpq   5351 <iov_iter_get_pages_alloc+0x231>
    5579:	e8 00 00 00 00       	callq  557e <iov_iter_get_pages_alloc+0x45e>

Disassembly of section .altinstr_replacement:

0000000000000000 <.altinstr_replacement>:
   0:	0f 01 cb             	stac   
   3:	0f 01 ca             	clac   
   6:	e8 00 00 00 00       	callq  b <.altinstr_replacement+0xb>
   b:	e8 00 00 00 00       	callq  10 <.altinstr_replacement+0x10>
  10:	e8 00 00 00 00       	callq  15 <.altinstr_replacement+0x15>
  15:	e8 00 00 00 00       	callq  1a <.altinstr_replacement+0x1a>
  1a:	0f 01 cb             	stac   
  1d:	0f ae e8             	lfence 
  20:	0f 01 ca             	clac   
  23:	0f 01 cb             	stac   
  26:	0f ae e8             	lfence 
  29:	0f 01 ca             	clac   
  2c:	0f 01 cb             	stac   
  2f:	0f ae e8             	lfence 
  32:	0f 01 ca             	clac   
  35:	0f 01 cb             	stac   
  38:	0f ae e8             	lfence 
  3b:	0f 01 ca             	clac   

Disassembly of section .fixup:

0000000000000000 <.fixup>:
   0:	b8 f2 ff ff ff       	mov    $0xfffffff2,%eax
   5:	40 30 ff             	xor    %dil,%dil
   8:	e9 00 00 00 00       	jmpq   d <.fixup+0xd>
   d:	b8 f2 ff ff ff       	mov    $0xfffffff2,%eax
  12:	30 d2                	xor    %dl,%dl
  14:	e9 00 00 00 00       	jmpq   19 <.fixup+0x19>
  19:	b8 f2 ff ff ff       	mov    $0xfffffff2,%eax
  1e:	30 c9                	xor    %cl,%cl
  20:	e9 00 00 00 00       	jmpq   25 <.fixup+0x25>
  25:	b8 f2 ff ff ff       	mov    $0xfffffff2,%eax
  2a:	30 d2                	xor    %dl,%dl
  2c:	e9 00 00 00 00       	jmpq   31 <__addressable_hash_and_copy_to_iter1804+0x1>
