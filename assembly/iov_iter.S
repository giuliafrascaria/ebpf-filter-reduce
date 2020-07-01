
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

0000000000000a80 <copyout_bpf>:
     a80:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
     a87:	00 00 
     a89:	55                   	push   %rbp
     a8a:	48 8b 88 50 13 00 00 	mov    0x1350(%rax),%rcx
     a91:	48 89 f8             	mov    %rdi,%rax
     a94:	48 01 d0             	add    %rdx,%rax
     a97:	48 89 e5             	mov    %rsp,%rbp
     a9a:	72 0c                	jb     aa8 <copyout_bpf+0x28>
     a9c:	48 39 c1             	cmp    %rax,%rcx
     a9f:	72 07                	jb     aa8 <copyout_bpf+0x28>
     aa1:	e8 00 00 00 00       	callq  aa6 <copyout_bpf+0x26>
     aa6:	89 c2                	mov    %eax,%edx
     aa8:	89 d0                	mov    %edx,%eax
     aaa:	5d                   	pop    %rbp
     aab:	c3                   	retq   
     aac:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000ab0 <copy_page_to_iter_iovec_bpf>:
     ab0:	55                   	push   %rbp
     ab1:	48 89 e5             	mov    %rsp,%rbp
     ab4:	41 57                	push   %r15
     ab6:	41 56                	push   %r14
     ab8:	41 55                	push   %r13
     aba:	41 54                	push   %r12
     abc:	53                   	push   %rbx
     abd:	48 83 ec 18          	sub    $0x18,%rsp
     ac1:	48 39 51 10          	cmp    %rdx,0x10(%rcx)
     ac5:	48 0f 46 51 10       	cmovbe 0x10(%rcx),%rdx
     aca:	48 85 d2             	test   %rdx,%rdx
     acd:	49 89 d4             	mov    %rdx,%r12
     ad0:	0f 84 ac 00 00 00    	je     b82 <copy_page_to_iter_iovec_bpf+0xd2>
     ad6:	4c 8b 79 18          	mov    0x18(%rcx),%r15
     ada:	48 89 cb             	mov    %rcx,%rbx
     add:	48 8b 49 08          	mov    0x8(%rcx),%rcx
     ae1:	49 89 fd             	mov    %rdi,%r13
     ae4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
     ae8:	4d 8b 77 08          	mov    0x8(%r15),%r14
     aec:	49 8b 3f             	mov    (%r15),%rdi
     aef:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
     af3:	49 29 ce             	sub    %rcx,%r14
     af6:	48 01 cf             	add    %rcx,%rdi
     af9:	49 39 d6             	cmp    %rdx,%r14
     afc:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
     b00:	4c 0f 47 f2          	cmova  %rdx,%r14
     b04:	e8 00 00 00 00       	callq  b09 <copy_page_to_iter_iovec_bpf+0x59>
     b09:	4c 2b 2d 00 00 00 00 	sub    0x0(%rip),%r13        # b10 <copy_page_to_iter_iovec_bpf+0x60>
     b10:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
     b14:	4c 89 f2             	mov    %r14,%rdx
     b17:	49 c1 fd 06          	sar    $0x6,%r13
     b1b:	49 c1 e5 0c          	shl    $0xc,%r13
     b1f:	4c 03 2d 00 00 00 00 	add    0x0(%rip),%r13        # b26 <copy_page_to_iter_iovec_bpf+0x76>
     b26:	4c 03 6d d0          	add    -0x30(%rbp),%r13
     b2a:	4c 89 ee             	mov    %r13,%rsi
     b2d:	e8 00 00 00 00       	callq  b32 <copy_page_to_iter_iovec_bpf+0x82>
     b32:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
     b36:	48 98                	cltq   
     b38:	4d 89 e1             	mov    %r12,%r9
     b3b:	49 29 c6             	sub    %rax,%r14
     b3e:	4d 29 f1             	sub    %r14,%r9
     b41:	4c 01 f1             	add    %r14,%rcx
     b44:	48 85 c0             	test   %rax,%rax
     b47:	75 05                	jne    b4e <copy_page_to_iter_iovec_bpf+0x9e>
     b49:	4d 85 c9             	test   %r9,%r9
     b4c:	75 46                	jne    b94 <copy_page_to_iter_iovec_bpf+0xe4>
     b4e:	49 39 4f 08          	cmp    %rcx,0x8(%r15)
     b52:	75 06                	jne    b5a <copy_page_to_iter_iovec_bpf+0xaa>
     b54:	49 83 c7 10          	add    $0x10,%r15
     b58:	31 c9                	xor    %ecx,%ecx
     b5a:	48 8b 43 10          	mov    0x10(%rbx),%rax
     b5e:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
     b62:	4c 01 c8             	add    %r9,%rax
     b65:	4c 29 e0             	sub    %r12,%rax
     b68:	4d 29 cc             	sub    %r9,%r12
     b6b:	48 89 43 10          	mov    %rax,0x10(%rbx)
     b6f:	4c 89 f8             	mov    %r15,%rax
     b72:	48 2b 43 18          	sub    0x18(%rbx),%rax
     b76:	4c 89 7b 18          	mov    %r15,0x18(%rbx)
     b7a:	48 c1 f8 04          	sar    $0x4,%rax
     b7e:	48 29 43 20          	sub    %rax,0x20(%rbx)
     b82:	48 83 c4 18          	add    $0x18,%rsp
     b86:	4c 89 e0             	mov    %r12,%rax
     b89:	5b                   	pop    %rbx
     b8a:	41 5c                	pop    %r12
     b8c:	41 5d                	pop    %r13
     b8e:	41 5e                	pop    %r14
     b90:	41 5f                	pop    %r15
     b92:	5d                   	pop    %rbp
     b93:	c3                   	retq   
     b94:	4d 01 ee             	add    %r13,%r14
     b97:	49 83 c7 10          	add    $0x10,%r15
     b9b:	4d 89 cd             	mov    %r9,%r13
     b9e:	49 8b 3f             	mov    (%r15),%rdi
     ba1:	4d 39 4f 08          	cmp    %r9,0x8(%r15)
     ba5:	4c 89 f6             	mov    %r14,%rsi
     ba8:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
     bac:	4d 0f 46 6f 08       	cmovbe 0x8(%r15),%r13
     bb1:	4c 89 ea             	mov    %r13,%rdx
     bb4:	e8 00 00 00 00       	callq  bb9 <copy_page_to_iter_iovec_bpf+0x109>
     bb9:	4c 8b 4d d0          	mov    -0x30(%rbp),%r9
     bbd:	48 98                	cltq   
     bbf:	4c 89 e9             	mov    %r13,%rcx
     bc2:	48 29 c1             	sub    %rax,%rcx
     bc5:	49 01 ce             	add    %rcx,%r14
     bc8:	49 29 c9             	sub    %rcx,%r9
     bcb:	48 85 c0             	test   %rax,%rax
     bce:	0f 85 7a ff ff ff    	jne    b4e <copy_page_to_iter_iovec_bpf+0x9e>
     bd4:	4d 85 c9             	test   %r9,%r9
     bd7:	0f 84 71 ff ff ff    	je     b4e <copy_page_to_iter_iovec_bpf+0x9e>
     bdd:	eb b8                	jmp    b97 <copy_page_to_iter_iovec_bpf+0xe7>
     bdf:	90                   	nop

0000000000000be0 <copyin>:
     be0:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
     be7:	00 00 
     be9:	55                   	push   %rbp
     bea:	48 8b 88 50 13 00 00 	mov    0x1350(%rax),%rcx
     bf1:	48 89 f0             	mov    %rsi,%rax
     bf4:	48 01 d0             	add    %rdx,%rax
     bf7:	48 89 e5             	mov    %rsp,%rbp
     bfa:	72 0c                	jb     c08 <copyin+0x28>
     bfc:	48 39 c1             	cmp    %rax,%rcx
     bff:	72 07                	jb     c08 <copyin+0x28>
     c01:	e8 00 00 00 00       	callq  c06 <copyin+0x26>
     c06:	89 c2                	mov    %eax,%edx
     c08:	89 d0                	mov    %edx,%eax
     c0a:	5d                   	pop    %rbp
     c0b:	c3                   	retq   
     c0c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000c10 <iov_iter_fault_in_readable>:
     c10:	f6 07 18             	testb  $0x18,(%rdi)
     c13:	0f 85 82 00 00 00    	jne    c9b <iov_iter_fault_in_readable+0x8b>
     c19:	55                   	push   %rbp
     c1a:	48 89 e5             	mov    %rsp,%rbp
     c1d:	48 83 ec 08          	sub    $0x8,%rsp
     c21:	4c 8b 57 18          	mov    0x18(%rdi),%r10
     c25:	48 8b 57 08          	mov    0x8(%rdi),%rdx
     c29:	49 8b 4a 08          	mov    0x8(%r10),%rcx
     c2d:	48 29 d1             	sub    %rdx,%rcx
     c30:	48 39 f1             	cmp    %rsi,%rcx
     c33:	48 0f 47 ce          	cmova  %rsi,%rcx
     c37:	48 85 c9             	test   %rcx,%rcx
     c3a:	74 56                	je     c92 <iov_iter_fault_in_readable+0x82>
     c3c:	49 03 12             	add    (%r10),%rdx
     c3f:	48 63 c1             	movslq %ecx,%rax
     c42:	85 c9                	test   %ecx,%ecx
     c44:	4c 8d 44 02 ff       	lea    -0x1(%rdx,%rax,1),%r8
     c49:	74 44                	je     c8f <iov_iter_fault_in_readable+0x7f>
     c4b:	45 31 c9             	xor    %r9d,%r9d
     c4e:	4c 39 c2             	cmp    %r8,%rdx
     c51:	76 0e                	jbe    c61 <iov_iter_fault_in_readable+0x51>
     c53:	eb 23                	jmp    c78 <iov_iter_fault_in_readable+0x68>
     c55:	48 81 c2 00 10 00 00 	add    $0x1000,%rdx
     c5c:	49 39 d0             	cmp    %rdx,%r8
     c5f:	72 1e                	jb     c7f <iov_iter_fault_in_readable+0x6f>
     c61:	90                   	nop
     c62:	90                   	nop
     c63:	90                   	nop
     c64:	90                   	nop
     c65:	90                   	nop
     c66:	90                   	nop
     c67:	44 89 c8             	mov    %r9d,%eax
     c6a:	40 8a 3a             	mov    (%rdx),%dil
     c6d:	90                   	nop
     c6e:	90                   	nop
     c6f:	90                   	nop
     c70:	85 c0                	test   %eax,%eax
     c72:	40 88 7d fe          	mov    %dil,-0x2(%rbp)
     c76:	74 dd                	je     c55 <iov_iter_fault_in_readable+0x45>
     c78:	b8 f2 ff ff ff       	mov    $0xfffffff2,%eax
     c7d:	c9                   	leaveq 
     c7e:	c3                   	retq   
     c7f:	4c 31 c2             	xor    %r8,%rdx
     c82:	48 f7 c2 00 f0 ff ff 	test   $0xfffffffffffff000,%rdx
     c89:	74 13                	je     c9e <iov_iter_fault_in_readable+0x8e>
     c8b:	0f b6 45 fe          	movzbl -0x2(%rbp),%eax
     c8f:	48 29 ce             	sub    %rcx,%rsi
     c92:	48 85 f6             	test   %rsi,%rsi
     c95:	75 1c                	jne    cb3 <iov_iter_fault_in_readable+0xa3>
     c97:	31 c0                	xor    %eax,%eax
     c99:	c9                   	leaveq 
     c9a:	c3                   	retq   
     c9b:	31 c0                	xor    %eax,%eax
     c9d:	c3                   	retq   
     c9e:	90                   	nop
     c9f:	90                   	nop
     ca0:	90                   	nop
     ca1:	90                   	nop
     ca2:	90                   	nop
     ca3:	90                   	nop
     ca4:	41 8a 10             	mov    (%r8),%dl
     ca7:	90                   	nop
     ca8:	90                   	nop
     ca9:	90                   	nop
     caa:	85 c0                	test   %eax,%eax
     cac:	88 55 fe             	mov    %dl,-0x2(%rbp)
     caf:	74 de                	je     c8f <iov_iter_fault_in_readable+0x7f>
     cb1:	eb ca                	jmp    c7d <iov_iter_fault_in_readable+0x6d>
     cb3:	45 31 c9             	xor    %r9d,%r9d
     cb6:	49 83 c2 10          	add    $0x10,%r10
     cba:	49 89 f0             	mov    %rsi,%r8
     cbd:	49 39 72 08          	cmp    %rsi,0x8(%r10)
     cc1:	4d 0f 46 42 08       	cmovbe 0x8(%r10),%r8
     cc6:	4d 85 c0             	test   %r8,%r8
     cc9:	74 eb                	je     cb6 <iov_iter_fault_in_readable+0xa6>
     ccb:	49 8b 12             	mov    (%r10),%rdx
     cce:	49 63 c0             	movslq %r8d,%rax
     cd1:	45 85 c0             	test   %r8d,%r8d
     cd4:	48 8d 7c 02 ff       	lea    -0x1(%rdx,%rax,1),%rdi
     cd9:	74 3d                	je     d18 <iov_iter_fault_in_readable+0x108>
     cdb:	48 39 fa             	cmp    %rdi,%rdx
     cde:	76 0e                	jbe    cee <iov_iter_fault_in_readable+0xde>
     ce0:	eb 96                	jmp    c78 <iov_iter_fault_in_readable+0x68>
     ce2:	48 81 c2 00 10 00 00 	add    $0x1000,%rdx
     ce9:	48 39 d7             	cmp    %rdx,%rdi
     cec:	72 1a                	jb     d08 <iov_iter_fault_in_readable+0xf8>
     cee:	90                   	nop
     cef:	90                   	nop
     cf0:	90                   	nop
     cf1:	90                   	nop
     cf2:	90                   	nop
     cf3:	90                   	nop
     cf4:	44 89 c8             	mov    %r9d,%eax
     cf7:	8a 0a                	mov    (%rdx),%cl
     cf9:	90                   	nop
     cfa:	90                   	nop
     cfb:	90                   	nop
     cfc:	85 c0                	test   %eax,%eax
     cfe:	88 4d ff             	mov    %cl,-0x1(%rbp)
     d01:	74 df                	je     ce2 <iov_iter_fault_in_readable+0xd2>
     d03:	e9 70 ff ff ff       	jmpq   c78 <iov_iter_fault_in_readable+0x68>
     d08:	48 31 fa             	xor    %rdi,%rdx
     d0b:	48 f7 c2 00 f0 ff ff 	test   $0xfffffffffffff000,%rdx
     d12:	74 10                	je     d24 <iov_iter_fault_in_readable+0x114>
     d14:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
     d18:	4c 29 c6             	sub    %r8,%rsi
     d1b:	75 99                	jne    cb6 <iov_iter_fault_in_readable+0xa6>
     d1d:	31 c0                	xor    %eax,%eax
     d1f:	e9 75 ff ff ff       	jmpq   c99 <iov_iter_fault_in_readable+0x89>
     d24:	90                   	nop
     d25:	90                   	nop
     d26:	90                   	nop
     d27:	90                   	nop
     d28:	90                   	nop
     d29:	90                   	nop
     d2a:	8a 17                	mov    (%rdi),%dl
     d2c:	90                   	nop
     d2d:	90                   	nop
     d2e:	90                   	nop
     d2f:	85 c0                	test   %eax,%eax
     d31:	88 55 ff             	mov    %dl,-0x1(%rbp)
     d34:	74 e2                	je     d18 <iov_iter_fault_in_readable+0x108>
     d36:	e9 42 ff ff ff       	jmpq   c7d <iov_iter_fault_in_readable+0x6d>
     d3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000d40 <iov_iter_revert>:
     d40:	48 85 f6             	test   %rsi,%rsi
     d43:	0f 84 91 00 00 00    	je     dda <iov_iter_revert+0x9a>
     d49:	55                   	push   %rbp
     d4a:	48 81 fe 00 f0 ff 7f 	cmp    $0x7ffff000,%rsi
     d51:	48 89 e5             	mov    %rsp,%rbp
     d54:	41 56                	push   %r14
     d56:	41 55                	push   %r13
     d58:	41 54                	push   %r12
     d5a:	53                   	push   %rbx
     d5b:	0f 87 a5 00 00 00    	ja     e06 <iov_iter_revert+0xc6>
     d61:	8b 0f                	mov    (%rdi),%ecx
     d63:	48 01 77 10          	add    %rsi,0x10(%rdi)
     d67:	83 e1 fe             	and    $0xfffffffe,%ecx
     d6a:	83 f9 20             	cmp    $0x20,%ecx
     d6d:	0f 84 a7 00 00 00    	je     e1a <iov_iter_revert+0xda>
     d73:	83 f9 40             	cmp    $0x40,%ecx
     d76:	74 59                	je     dd1 <iov_iter_revert+0x91>
     d78:	48 8b 47 08          	mov    0x8(%rdi),%rax
     d7c:	48 39 c6             	cmp    %rax,%rsi
     d7f:	0f 86 85 00 00 00    	jbe    e0a <iov_iter_revert+0xca>
     d85:	48 29 c6             	sub    %rax,%rsi
     d88:	4c 8b 47 18          	mov    0x18(%rdi),%r8
     d8c:	48 8b 47 20          	mov    0x20(%rdi),%rax
     d90:	83 f9 10             	cmp    $0x10,%ecx
     d93:	49 8d 50 f0          	lea    -0x10(%r8),%rdx
     d97:	4c 8d 48 01          	lea    0x1(%rax),%r9
     d9b:	74 3f                	je     ddc <iov_iter_revert+0x9c>
     d9d:	49 8b 48 f8          	mov    -0x8(%r8),%rcx
     da1:	48 83 c0 02          	add    $0x2,%rax
     da5:	4c 89 4f 20          	mov    %r9,0x20(%rdi)
     da9:	48 39 ce             	cmp    %rcx,%rsi
     dac:	76 18                	jbe    dc6 <iov_iter_revert+0x86>
     dae:	48 83 ea 10          	sub    $0x10,%rdx
     db2:	48 29 ce             	sub    %rcx,%rsi
     db5:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
     db9:	48 89 47 20          	mov    %rax,0x20(%rdi)
     dbd:	48 83 c0 01          	add    $0x1,%rax
     dc1:	48 39 f1             	cmp    %rsi,%rcx
     dc4:	72 e8                	jb     dae <iov_iter_revert+0x6e>
     dc6:	48 29 f1             	sub    %rsi,%rcx
     dc9:	48 89 57 18          	mov    %rdx,0x18(%rdi)
     dcd:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
     dd1:	5b                   	pop    %rbx
     dd2:	41 5c                	pop    %r12
     dd4:	41 5d                	pop    %r13
     dd6:	41 5e                	pop    %r14
     dd8:	5d                   	pop    %rbp
     dd9:	c3                   	retq   
     dda:	f3 c3                	repz retq 
     ddc:	41 8b 48 f8          	mov    -0x8(%r8),%ecx
     de0:	48 83 c0 02          	add    $0x2,%rax
     de4:	4c 89 4f 20          	mov    %r9,0x20(%rdi)
     de8:	48 39 f1             	cmp    %rsi,%rcx
     deb:	73 d9                	jae    dc6 <iov_iter_revert+0x86>
     ded:	48 83 ea 10          	sub    $0x10,%rdx
     df1:	48 29 ce             	sub    %rcx,%rsi
     df4:	8b 4a 08             	mov    0x8(%rdx),%ecx
     df7:	48 89 47 20          	mov    %rax,0x20(%rdi)
     dfb:	48 83 c0 01          	add    $0x1,%rax
     dff:	48 39 f1             	cmp    %rsi,%rcx
     e02:	72 e9                	jb     ded <iov_iter_revert+0xad>
     e04:	eb c0                	jmp    dc6 <iov_iter_revert+0x86>
     e06:	0f 0b                	ud2    
     e08:	eb c7                	jmp    dd1 <iov_iter_revert+0x91>
     e0a:	48 29 f0             	sub    %rsi,%rax
     e0d:	48 89 47 08          	mov    %rax,0x8(%rdi)
     e11:	5b                   	pop    %rbx
     e12:	41 5c                	pop    %r12
     e14:	41 5d                	pop    %r13
     e16:	41 5e                	pop    %r14
     e18:	5d                   	pop    %rbp
     e19:	c3                   	retq   
     e1a:	4c 8b 67 18          	mov    0x18(%rdi),%r12
     e1e:	8b 5f 20             	mov    0x20(%rdi),%ebx
     e21:	48 8b 57 08          	mov    0x8(%rdi),%rdx
     e25:	41 8b 44 24 5c       	mov    0x5c(%r12),%eax
     e2a:	4d 8b 84 24 90 00 00 	mov    0x90(%r12),%r8
     e31:	00 
     e32:	49 89 d1             	mov    %rdx,%r9
     e35:	8d 48 ff             	lea    -0x1(%rax),%ecx
     e38:	89 c8                	mov    %ecx,%eax
     e3a:	21 d8                	and    %ebx,%eax
     e3c:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
     e40:	41 8b 44 c0 08       	mov    0x8(%r8,%rax,8),%eax
     e45:	49 29 c1             	sub    %rax,%r9
     e48:	4c 39 ce             	cmp    %r9,%rsi
     e4b:	4c 89 c8             	mov    %r9,%rax
     e4e:	72 38                	jb     e88 <iov_iter_revert+0x148>
     e50:	48 29 c6             	sub    %rax,%rsi
     e53:	75 09                	jne    e5e <iov_iter_revert+0x11e>
     e55:	39 5f 24             	cmp    %ebx,0x24(%rdi)
     e58:	0f 84 b6 00 00 00    	je     f14 <iov_iter_revert+0x1d4>
     e5e:	83 eb 01             	sub    $0x1,%ebx
     e61:	89 c8                	mov    %ecx,%eax
     e63:	21 d8                	and    %ebx,%eax
     e65:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
     e69:	49 8d 14 c0          	lea    (%r8,%rax,8),%rdx
     e6d:	8b 42 08             	mov    0x8(%rdx),%eax
     e70:	41 89 c2             	mov    %eax,%r10d
     e73:	44 03 52 0c          	add    0xc(%rdx),%r10d
     e77:	4d 89 d3             	mov    %r10,%r11
     e7a:	4c 89 d2             	mov    %r10,%rdx
     e7d:	49 29 c3             	sub    %rax,%r11
     e80:	49 39 f3             	cmp    %rsi,%r11
     e83:	4c 89 d8             	mov    %r11,%rax
     e86:	76 c8                	jbe    e50 <iov_iter_revert+0x110>
     e88:	48 29 f2             	sub    %rsi,%rdx
     e8b:	89 5f 20             	mov    %ebx,0x20(%rdi)
     e8e:	48 89 57 08          	mov    %rdx,0x8(%rdi)
     e92:	45 8b 74 24 50       	mov    0x50(%r12),%r14d
     e97:	45 39 74 24 54       	cmp    %r14d,0x54(%r12)
     e9c:	0f 84 2f ff ff ff    	je     dd1 <iov_iter_revert+0x91>
     ea2:	41 8b 44 24 5c       	mov    0x5c(%r12),%eax
     ea7:	48 85 d2             	test   %rdx,%rdx
     eaa:	44 8d 68 ff          	lea    -0x1(%rax),%r13d
     eae:	74 1e                	je     ece <iov_iter_revert+0x18e>
     eb0:	89 d8                	mov    %ebx,%eax
     eb2:	83 c3 01             	add    $0x1,%ebx
     eb5:	44 21 e8             	and    %r13d,%eax
     eb8:	48 8d 0c 80          	lea    (%rax,%rax,4),%rcx
     ebc:	49 8b 84 24 90 00 00 	mov    0x90(%r12),%rax
     ec3:	00 
     ec4:	48 8d 04 c8          	lea    (%rax,%rcx,8),%rax
     ec8:	2b 50 08             	sub    0x8(%rax),%edx
     ecb:	89 50 0c             	mov    %edx,0xc(%rax)
     ece:	44 39 f3             	cmp    %r14d,%ebx
     ed1:	74 37                	je     f0a <iov_iter_revert+0x1ca>
     ed3:	41 83 ee 01          	sub    $0x1,%r14d
     ed7:	4c 89 e7             	mov    %r12,%rdi
     eda:	44 89 f0             	mov    %r14d,%eax
     edd:	44 21 e8             	and    %r13d,%eax
     ee0:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
     ee4:	49 8b 84 24 90 00 00 	mov    0x90(%r12),%rax
     eeb:	00 
     eec:	48 8d 34 d0          	lea    (%rax,%rdx,8),%rsi
     ef0:	48 8b 46 10          	mov    0x10(%rsi),%rax
     ef4:	48 c7 46 10 00 00 00 	movq   $0x0,0x10(%rsi)
     efb:	00 
     efc:	48 8b 40 08          	mov    0x8(%rax),%rax
     f00:	e8 00 00 00 00       	callq  f05 <iov_iter_revert+0x1c5>
     f05:	41 39 de             	cmp    %ebx,%r14d
     f08:	75 c9                	jne    ed3 <iov_iter_revert+0x193>
     f0a:	41 89 5c 24 50       	mov    %ebx,0x50(%r12)
     f0f:	e9 bd fe ff ff       	jmpq   dd1 <iov_iter_revert+0x91>
     f14:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
     f1b:	00 
     f1c:	89 5f 20             	mov    %ebx,0x20(%rdi)
     f1f:	45 8b 74 24 50       	mov    0x50(%r12),%r14d
     f24:	45 39 74 24 54       	cmp    %r14d,0x54(%r12)
     f29:	0f 84 a2 fe ff ff    	je     dd1 <iov_iter_revert+0x91>
     f2f:	41 8b 44 24 5c       	mov    0x5c(%r12),%eax
     f34:	44 8d 68 ff          	lea    -0x1(%rax),%r13d
     f38:	eb 94                	jmp    ece <iov_iter_revert+0x18e>
     f3a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000f40 <iov_iter_get_pages>:
     f40:	55                   	push   %rbp
     f41:	48 89 e5             	mov    %rsp,%rbp
     f44:	41 57                	push   %r15
     f46:	41 56                	push   %r14
     f48:	41 55                	push   %r13
     f4a:	41 54                	push   %r12
     f4c:	49 89 f5             	mov    %rsi,%r13
     f4f:	53                   	push   %rbx
     f50:	48 89 d3             	mov    %rdx,%rbx
     f53:	49 89 fc             	mov    %rdi,%r12
     f56:	4d 89 c6             	mov    %r8,%r14
     f59:	48 83 ec 18          	sub    $0x18,%rsp
     f5d:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     f64:	00 00 
     f66:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     f6a:	31 c0                	xor    %eax,%eax
     f6c:	48 39 57 10          	cmp    %rdx,0x10(%rdi)
     f70:	8b 17                	mov    (%rdi),%edx
     f72:	48 0f 46 5f 10       	cmovbe 0x10(%rdi),%rbx
     f77:	89 d0                	mov    %edx,%eax
     f79:	83 e0 fe             	and    $0xfffffffe,%eax
     f7c:	83 f8 20             	cmp    $0x20,%eax
     f7f:	0f 84 19 01 00 00    	je     109e <iov_iter_get_pages+0x15e>
     f85:	83 f8 40             	cmp    $0x40,%eax
     f88:	0f 84 03 01 00 00    	je     1091 <iov_iter_get_pages+0x151>
     f8e:	48 85 db             	test   %rbx,%rbx
     f91:	0f 84 03 01 00 00    	je     109a <iov_iter_get_pages+0x15a>
     f97:	f6 c2 10             	test   $0x10,%dl
     f9a:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
     f9e:	0f 85 06 02 00 00    	jne    11aa <iov_iter_get_pages+0x26a>
     fa4:	f6 c2 08             	test   $0x8,%dl
     fa7:	0f 85 c8 00 00 00    	jne    1075 <iov_iter_get_pages+0x135>
     fad:	83 e2 40             	and    $0x40,%edx
     fb0:	0f 85 e4 00 00 00    	jne    109a <iov_iter_get_pages+0x15a>
     fb6:	49 8b 54 24 18       	mov    0x18(%r12),%rdx
     fbb:	89 c9                	mov    %ecx,%ecx
     fbd:	48 8b 42 08          	mov    0x8(%rdx),%rax
     fc1:	48 29 f8             	sub    %rdi,%rax
     fc4:	48 39 d8             	cmp    %rbx,%rax
     fc7:	48 0f 47 c3          	cmova  %rbx,%rax
     fcb:	48 c1 e1 0c          	shl    $0xc,%rcx
     fcf:	48 85 c0             	test   %rax,%rax
     fd2:	0f 84 80 00 00 00    	je     1058 <iov_iter_get_pages+0x118>
     fd8:	48 03 3a             	add    (%rdx),%rdi
     fdb:	48 89 fb             	mov    %rdi,%rbx
     fde:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
     fe4:	48 01 d8             	add    %rbx,%rax
     fe7:	49 89 1e             	mov    %rbx,(%r14)
     fea:	41 8b 14 24          	mov    (%r12),%edx
     fee:	48 39 c8             	cmp    %rcx,%rax
     ff1:	48 0f 46 c8          	cmovbe %rax,%rcx
     ff5:	48 81 e7 00 f0 ff ff 	and    $0xfffffffffffff000,%rdi
     ffc:	4c 8d b9 ff 0f 00 00 	lea    0xfff(%rcx),%r15
    1003:	f7 d2                	not    %edx
    1005:	48 89 cb             	mov    %rcx,%rbx
    1008:	83 e2 01             	and    $0x1,%edx
    100b:	4c 89 e9             	mov    %r13,%rcx
    100e:	49 c1 ef 0c          	shr    $0xc,%r15
    1012:	44 89 fe             	mov    %r15d,%esi
    1015:	e8 00 00 00 00       	callq  101a <iov_iter_get_pages+0xda>
    101a:	85 c0                	test   %eax,%eax
    101c:	0f 88 1a 02 00 00    	js     123c <iov_iter_get_pages+0x2fc>
    1022:	48 63 d0             	movslq %eax,%rdx
    1025:	48 c1 e2 0c          	shl    $0xc,%rdx
    1029:	44 39 f8             	cmp    %r15d,%eax
    102c:	48 0f 45 da          	cmovne %rdx,%rbx
    1030:	48 89 d8             	mov    %rbx,%rax
    1033:	49 2b 06             	sub    (%r14),%rax
    1036:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    103a:	65 48 33 34 25 28 00 	xor    %gs:0x28,%rsi
    1041:	00 00 
    1043:	0f 85 60 02 00 00    	jne    12a9 <iov_iter_get_pages+0x369>
    1049:	48 83 c4 18          	add    $0x18,%rsp
    104d:	5b                   	pop    %rbx
    104e:	41 5c                	pop    %r12
    1050:	41 5d                	pop    %r13
    1052:	41 5e                	pop    %r14
    1054:	41 5f                	pop    %r15
    1056:	5d                   	pop    %rbp
    1057:	c3                   	retq   
    1058:	48 83 c2 10          	add    $0x10,%rdx
    105c:	48 89 d8             	mov    %rbx,%rax
    105f:	48 39 5a 08          	cmp    %rbx,0x8(%rdx)
    1063:	48 0f 46 42 08       	cmovbe 0x8(%rdx),%rax
    1068:	48 85 c0             	test   %rax,%rax
    106b:	74 eb                	je     1058 <iov_iter_get_pages+0x118>
    106d:	48 8b 3a             	mov    (%rdx),%rdi
    1070:	e9 66 ff ff ff       	jmpq   fdb <iov_iter_get_pages+0x9b>
    1075:	49 8b 54 24 18       	mov    0x18(%r12),%rdx
    107a:	48 8b 42 08          	mov    0x8(%rdx),%rax
    107e:	48 29 f8             	sub    %rdi,%rax
    1081:	48 39 d8             	cmp    %rbx,%rax
    1084:	48 0f 47 c3          	cmova  %rbx,%rax
    1088:	48 85 c0             	test   %rax,%rax
    108b:	0f 84 90 01 00 00    	je     1221 <iov_iter_get_pages+0x2e1>
    1091:	48 c7 c0 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rax
    1098:	eb 9c                	jmp    1036 <iov_iter_get_pages+0xf6>
    109a:	31 c0                	xor    %eax,%eax
    109c:	eb 98                	jmp    1036 <iov_iter_get_pages+0xf6>
    109e:	31 c0                	xor    %eax,%eax
    10a0:	48 85 db             	test   %rbx,%rbx
    10a3:	74 91                	je     1036 <iov_iter_get_pages+0xf6>
    10a5:	89 4d c4             	mov    %ecx,-0x3c(%rbp)
    10a8:	e8 03 f0 ff ff       	callq  b0 <sanity>
    10ad:	84 c0                	test   %al,%al
    10af:	8b 4d c4             	mov    -0x3c(%rbp),%ecx
    10b2:	74 dd                	je     1091 <iov_iter_get_pages+0x151>
    10b4:	49 8b 54 24 08       	mov    0x8(%r12),%rdx
    10b9:	41 8b 7c 24 20       	mov    0x20(%r12),%edi
    10be:	48 85 d2             	test   %rdx,%rdx
    10c1:	74 34                	je     10f7 <iov_iter_get_pages+0x1b7>
    10c3:	49 8b 74 24 18       	mov    0x18(%r12),%rsi
    10c8:	8b 46 5c             	mov    0x5c(%rsi),%eax
    10cb:	4c 8b 86 90 00 00 00 	mov    0x90(%rsi),%r8
    10d2:	83 e8 01             	sub    $0x1,%eax
    10d5:	21 f8                	and    %edi,%eax
    10d7:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    10db:	49 8d 04 c0          	lea    (%r8,%rax,8),%rax
    10df:	48 81 78 10 00 00 00 	cmpq   $0x0,0x10(%rax)
    10e6:	00 
    10e7:	75 09                	jne    10f2 <iov_iter_get_pages+0x1b2>
    10e9:	48 81 fa 00 10 00 00 	cmp    $0x1000,%rdx
    10f0:	75 05                	jne    10f7 <iov_iter_get_pages+0x1b7>
    10f2:	83 c7 01             	add    $0x1,%edi
    10f5:	31 d2                	xor    %edx,%edx
    10f7:	49 89 16             	mov    %rdx,(%r14)
    10fa:	4d 8b 7c 24 18       	mov    0x18(%r12),%r15
    10ff:	89 f8                	mov    %edi,%eax
    1101:	41 8b 77 58          	mov    0x58(%r15),%esi
    1105:	41 2b 47 54          	sub    0x54(%r15),%eax
    1109:	45 8b 47 5c          	mov    0x5c(%r15),%r8d
    110d:	39 c6                	cmp    %eax,%esi
    110f:	0f 87 2e 01 00 00    	ja     1243 <iov_iter_get_pages+0x303>
    1115:	31 f6                	xor    %esi,%esi
    1117:	48 29 d6             	sub    %rdx,%rsi
    111a:	41 83 e8 01          	sub    $0x1,%r8d
    111e:	48 8d 55 cc          	lea    -0x34(%rbp),%rdx
    1122:	48 39 de             	cmp    %rbx,%rsi
    1125:	89 7d cc             	mov    %edi,-0x34(%rbp)
    1128:	4c 89 f1             	mov    %r14,%rcx
    112b:	48 0f 47 f3          	cmova  %rbx,%rsi
    112f:	4c 89 e7             	mov    %r12,%rdi
    1132:	44 89 45 c4          	mov    %r8d,-0x3c(%rbp)
    1136:	e8 55 f1 ff ff       	callq  290 <push_pipe>
    113b:	48 85 c0             	test   %rax,%rax
    113e:	0f 84 4d ff ff ff    	je     1091 <iov_iter_get_pages+0x151>
    1144:	49 8b 0e             	mov    (%r14),%rcx
    1147:	48 01 c1             	add    %rax,%rcx
    114a:	48 85 c9             	test   %rcx,%rcx
    114d:	0f 8e e3 fe ff ff    	jle    1036 <iov_iter_get_pages+0xf6>
    1153:	48 83 e9 01          	sub    $0x1,%rcx
    1157:	8b 55 cc             	mov    -0x34(%rbp),%edx
    115a:	44 8b 45 c4          	mov    -0x3c(%rbp),%r8d
    115e:	48 c1 e9 0c          	shr    $0xc,%rcx
    1162:	49 8d 7c cd 08       	lea    0x8(%r13,%rcx,8),%rdi
    1167:	49 8b 8f 90 00 00 00 	mov    0x90(%r15),%rcx
    116e:	44 21 c2             	and    %r8d,%edx
    1171:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
    1175:	48 8d 14 d1          	lea    (%rcx,%rdx,8),%rdx
    1179:	48 8b 12             	mov    (%rdx),%rdx
    117c:	49 89 55 00          	mov    %rdx,0x0(%r13)
    1180:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
    1184:	48 8d 71 ff          	lea    -0x1(%rcx),%rsi
    1188:	83 e1 01             	and    $0x1,%ecx
    118b:	48 0f 45 d6          	cmovne %rsi,%rdx
    118f:	f0 ff 42 34          	lock incl 0x34(%rdx)
    1193:	8b 75 cc             	mov    -0x34(%rbp),%esi
    1196:	49 83 c5 08          	add    $0x8,%r13
    119a:	4c 39 ef             	cmp    %r13,%rdi
    119d:	8d 56 01             	lea    0x1(%rsi),%edx
    11a0:	89 55 cc             	mov    %edx,-0x34(%rbp)
    11a3:	75 c2                	jne    1167 <iov_iter_get_pages+0x227>
    11a5:	e9 8c fe ff ff       	jmpq   1036 <iov_iter_get_pages+0xf6>
    11aa:	85 db                	test   %ebx,%ebx
    11ac:	41 89 d8             	mov    %ebx,%r8d
    11af:	0f 84 e5 fe ff ff    	je     109a <iov_iter_get_pages+0x15a>
    11b5:	49 8b 74 24 18       	mov    0x18(%r12),%rsi
    11ba:	45 31 c9             	xor    %r9d,%r9d
    11bd:	41 bb 00 10 00 00    	mov    $0x1000,%r11d
    11c3:	8b 56 0c             	mov    0xc(%rsi),%edx
    11c6:	48 8b 0e             	mov    (%rsi),%rcx
    11c9:	44 8b 66 08          	mov    0x8(%rsi),%r12d
    11cd:	01 fa                	add    %edi,%edx
    11cf:	44 89 e0             	mov    %r12d,%eax
    11d2:	41 89 d2             	mov    %edx,%r10d
    11d5:	44 89 db             	mov    %r11d,%ebx
    11d8:	29 f8                	sub    %edi,%eax
    11da:	41 81 e2 ff 0f 00 00 	and    $0xfff,%r10d
    11e1:	44 39 c0             	cmp    %r8d,%eax
    11e4:	49 0f 47 c0          	cmova  %r8,%rax
    11e8:	44 29 d3             	sub    %r10d,%ebx
    11eb:	39 d8                	cmp    %ebx,%eax
    11ed:	48 0f 47 c3          	cmova  %rbx,%rax
    11f1:	85 c0                	test   %eax,%eax
    11f3:	74 6c                	je     1261 <iov_iter_get_pages+0x321>
    11f5:	c1 ea 0c             	shr    $0xc,%edx
    11f8:	44 89 d6             	mov    %r10d,%esi
    11fb:	48 c1 e2 06          	shl    $0x6,%rdx
    11ff:	49 89 36             	mov    %rsi,(%r14)
    1202:	48 01 ca             	add    %rcx,%rdx
    1205:	49 89 55 00          	mov    %rdx,0x0(%r13)
    1209:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
    120d:	48 8d 71 ff          	lea    -0x1(%rcx),%rsi
    1211:	83 e1 01             	and    $0x1,%ecx
    1214:	48 0f 45 d6          	cmovne %rsi,%rdx
    1218:	f0 ff 42 34          	lock incl 0x34(%rdx)
    121c:	e9 15 fe ff ff       	jmpq   1036 <iov_iter_get_pages+0xf6>
    1221:	48 83 c2 10          	add    $0x10,%rdx
    1225:	48 89 d8             	mov    %rbx,%rax
    1228:	48 39 5a 08          	cmp    %rbx,0x8(%rdx)
    122c:	48 0f 46 42 08       	cmovbe 0x8(%rdx),%rax
    1231:	48 85 c0             	test   %rax,%rax
    1234:	0f 85 57 fe ff ff    	jne    1091 <iov_iter_get_pages+0x151>
    123a:	eb e5                	jmp    1221 <iov_iter_get_pages+0x2e1>
    123c:	48 98                	cltq   
    123e:	e9 f3 fd ff ff       	jmpq   1036 <iov_iter_get_pages+0xf6>
    1243:	45 89 c3             	mov    %r8d,%r11d
    1246:	41 29 c3             	sub    %eax,%r11d
    1249:	39 f1                	cmp    %esi,%ecx
    124b:	44 89 d8             	mov    %r11d,%eax
    124e:	48 0f 46 f1          	cmovbe %rcx,%rsi
    1252:	39 f0                	cmp    %esi,%eax
    1254:	48 0f 46 f0          	cmovbe %rax,%rsi
    1258:	48 c1 e6 0c          	shl    $0xc,%rsi
    125c:	e9 b6 fe ff ff       	jmpq   1117 <iov_iter_get_pages+0x1d7>
    1261:	85 ff                	test   %edi,%edi
    1263:	0f 84 66 ff ff ff    	je     11cf <iov_iter_get_pages+0x28f>
    1269:	44 39 e7             	cmp    %r12d,%edi
    126c:	73 0a                	jae    1278 <iov_iter_get_pages+0x338>
    126e:	e9 5c ff ff ff       	jmpq   11cf <iov_iter_get_pages+0x28f>
    1273:	44 39 e7             	cmp    %r12d,%edi
    1276:	72 24                	jb     129c <iov_iter_get_pages+0x35c>
    1278:	41 8d 41 01          	lea    0x1(%r9),%eax
    127c:	44 29 e7             	sub    %r12d,%edi
    127f:	49 89 c1             	mov    %rax,%r9
    1282:	48 c1 e0 04          	shl    $0x4,%rax
    1286:	48 01 f0             	add    %rsi,%rax
    1289:	85 ff                	test   %edi,%edi
    128b:	44 8b 60 08          	mov    0x8(%rax),%r12d
    128f:	75 e2                	jne    1273 <iov_iter_get_pages+0x333>
    1291:	48 8b 08             	mov    (%rax),%rcx
    1294:	8b 50 0c             	mov    0xc(%rax),%edx
    1297:	e9 33 ff ff ff       	jmpq   11cf <iov_iter_get_pages+0x28f>
    129c:	8b 50 0c             	mov    0xc(%rax),%edx
    129f:	48 8b 08             	mov    (%rax),%rcx
    12a2:	01 fa                	add    %edi,%edx
    12a4:	e9 26 ff ff ff       	jmpq   11cf <iov_iter_get_pages+0x28f>
    12a9:	e8 00 00 00 00       	callq  12ae <iov_iter_get_pages+0x36e>
    12ae:	66 90                	xchg   %ax,%ax

00000000000012b0 <iov_iter_alignment>:
    12b0:	55                   	push   %rbp
    12b1:	48 89 e5             	mov    %rsp,%rbp
    12b4:	41 54                	push   %r12
    12b6:	53                   	push   %rbx
    12b7:	48 83 ec 08          	sub    $0x8,%rsp
    12bb:	8b 07                	mov    (%rdi),%eax
    12bd:	48 8b 77 10          	mov    0x10(%rdi),%rsi
    12c1:	89 c2                	mov    %eax,%edx
    12c3:	83 e2 fe             	and    $0xfffffffe,%edx
    12c6:	83 fa 20             	cmp    $0x20,%edx
    12c9:	74 7a                	je     1345 <iov_iter_alignment+0x95>
    12cb:	48 85 f6             	test   %rsi,%rsi
    12ce:	74 6a                	je     133a <iov_iter_alignment+0x8a>
    12d0:	a8 10                	test   $0x10,%al
    12d2:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    12d6:	0f 85 a7 00 00 00    	jne    1383 <iov_iter_alignment+0xd3>
    12dc:	a8 08                	test   $0x8,%al
    12de:	0f 85 1d 01 00 00    	jne    1401 <iov_iter_alignment+0x151>
    12e4:	a8 40                	test   $0x40,%al
    12e6:	75 52                	jne    133a <iov_iter_alignment+0x8a>
    12e8:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
    12ec:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
    12f0:	48 29 d1             	sub    %rdx,%rcx
    12f3:	48 39 f1             	cmp    %rsi,%rcx
    12f6:	48 0f 47 ce          	cmova  %rsi,%rcx
    12fa:	48 85 c9             	test   %rcx,%rcx
    12fd:	74 17                	je     1316 <iov_iter_alignment+0x66>
    12ff:	48 8b 07             	mov    (%rdi),%rax
    1302:	48 01 d0             	add    %rdx,%rax
    1305:	48 09 c8             	or     %rcx,%rax
    1308:	48 29 ce             	sub    %rcx,%rsi
    130b:	75 0b                	jne    1318 <iov_iter_alignment+0x68>
    130d:	48 83 c4 08          	add    $0x8,%rsp
    1311:	5b                   	pop    %rbx
    1312:	41 5c                	pop    %r12
    1314:	5d                   	pop    %rbp
    1315:	c3                   	retq   
    1316:	31 c0                	xor    %eax,%eax
    1318:	48 83 c7 10          	add    $0x10,%rdi
    131c:	48 89 f1             	mov    %rsi,%rcx
    131f:	48 39 77 08          	cmp    %rsi,0x8(%rdi)
    1323:	48 0f 46 4f 08       	cmovbe 0x8(%rdi),%rcx
    1328:	48 85 c9             	test   %rcx,%rcx
    132b:	74 eb                	je     1318 <iov_iter_alignment+0x68>
    132d:	48 0b 07             	or     (%rdi),%rax
    1330:	48 09 c8             	or     %rcx,%rax
    1333:	48 29 ce             	sub    %rcx,%rsi
    1336:	74 d5                	je     130d <iov_iter_alignment+0x5d>
    1338:	eb de                	jmp    1318 <iov_iter_alignment+0x68>
    133a:	48 83 c4 08          	add    $0x8,%rsp
    133e:	31 c0                	xor    %eax,%eax
    1340:	5b                   	pop    %rbx
    1341:	41 5c                	pop    %r12
    1343:	5d                   	pop    %rbp
    1344:	c3                   	retq   
    1345:	31 c0                	xor    %eax,%eax
    1347:	48 85 f6             	test   %rsi,%rsi
    134a:	74 c1                	je     130d <iov_iter_alignment+0x5d>
    134c:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
    1350:	48 89 f0             	mov    %rsi,%rax
    1353:	48 85 c9             	test   %rcx,%rcx
    1356:	74 b5                	je     130d <iov_iter_alignment+0x5d>
    1358:	48 8b 77 18          	mov    0x18(%rdi),%rsi
    135c:	8b 5e 5c             	mov    0x5c(%rsi),%ebx
    135f:	8d 53 ff             	lea    -0x1(%rbx),%edx
    1362:	23 57 20             	and    0x20(%rdi),%edx
    1365:	48 8b be 90 00 00 00 	mov    0x90(%rsi),%rdi
    136c:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
    1370:	48 8d 14 d7          	lea    (%rdi,%rdx,8),%rdx
    1374:	48 81 7a 10 00 00 00 	cmpq   $0x0,0x10(%rdx)
    137b:	00 
    137c:	75 8f                	jne    130d <iov_iter_alignment+0x5d>
    137e:	48 09 c8             	or     %rcx,%rax
    1381:	eb 8a                	jmp    130d <iov_iter_alignment+0x5d>
    1383:	41 89 f0             	mov    %esi,%r8d
    1386:	31 c0                	xor    %eax,%eax
    1388:	31 f6                	xor    %esi,%esi
    138a:	41 bb 00 10 00 00    	mov    $0x1000,%r11d
    1390:	45 85 c0             	test   %r8d,%r8d
    1393:	0f 84 74 ff ff ff    	je     130d <iov_iter_alignment+0x5d>
    1399:	4c 8b 57 18          	mov    0x18(%rdi),%r10
    139d:	41 89 f1             	mov    %esi,%r9d
    13a0:	45 89 dc             	mov    %r11d,%r12d
    13a3:	49 c1 e1 04          	shl    $0x4,%r9
    13a7:	4d 01 d1             	add    %r10,%r9
    13aa:	41 8b 49 08          	mov    0x8(%r9),%ecx
    13ae:	41 8b 59 0c          	mov    0xc(%r9),%ebx
    13b2:	41 89 c9             	mov    %ecx,%r9d
    13b5:	01 d3                	add    %edx,%ebx
    13b7:	41 29 d1             	sub    %edx,%r9d
    13ba:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
    13c0:	45 39 c1             	cmp    %r8d,%r9d
    13c3:	45 0f 47 c8          	cmova  %r8d,%r9d
    13c7:	41 29 dc             	sub    %ebx,%r12d
    13ca:	45 39 e1             	cmp    %r12d,%r9d
    13cd:	45 0f 47 cc          	cmova  %r12d,%r9d
    13d1:	45 85 c9             	test   %r9d,%r9d
    13d4:	74 0b                	je     13e1 <iov_iter_alignment+0x131>
    13d6:	44 09 cb             	or     %r9d,%ebx
    13d9:	48 09 d8             	or     %rbx,%rax
    13dc:	45 39 c8             	cmp    %r9d,%r8d
    13df:	72 6f                	jb     1450 <iov_iter_alignment+0x1a0>
    13e1:	45 29 c8             	sub    %r9d,%r8d
    13e4:	44 01 ca             	add    %r9d,%edx
    13e7:	74 a7                	je     1390 <iov_iter_alignment+0xe0>
    13e9:	39 d1                	cmp    %edx,%ecx
    13eb:	77 a3                	ja     1390 <iov_iter_alignment+0xe0>
    13ed:	83 c6 01             	add    $0x1,%esi
    13f0:	29 ca                	sub    %ecx,%edx
    13f2:	74 9c                	je     1390 <iov_iter_alignment+0xe0>
    13f4:	89 f1                	mov    %esi,%ecx
    13f6:	48 c1 e1 04          	shl    $0x4,%rcx
    13fa:	41 8b 4c 0a 08       	mov    0x8(%r10,%rcx,1),%ecx
    13ff:	eb e8                	jmp    13e9 <iov_iter_alignment+0x139>
    1401:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
    1405:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
    1409:	48 29 d1             	sub    %rdx,%rcx
    140c:	48 39 f1             	cmp    %rsi,%rcx
    140f:	48 0f 47 ce          	cmova  %rsi,%rcx
    1413:	48 85 c9             	test   %rcx,%rcx
    1416:	74 67                	je     147f <iov_iter_alignment+0x1cf>
    1418:	48 8b 07             	mov    (%rdi),%rax
    141b:	48 01 d0             	add    %rdx,%rax
    141e:	48 09 c8             	or     %rcx,%rax
    1421:	48 29 ce             	sub    %rcx,%rsi
    1424:	0f 84 e3 fe ff ff    	je     130d <iov_iter_alignment+0x5d>
    142a:	48 83 c7 10          	add    $0x10,%rdi
    142e:	48 89 f1             	mov    %rsi,%rcx
    1431:	48 39 77 08          	cmp    %rsi,0x8(%rdi)
    1435:	48 0f 46 4f 08       	cmovbe 0x8(%rdi),%rcx
    143a:	48 85 c9             	test   %rcx,%rcx
    143d:	74 eb                	je     142a <iov_iter_alignment+0x17a>
    143f:	48 0b 07             	or     (%rdi),%rax
    1442:	48 09 c8             	or     %rcx,%rax
    1445:	48 29 ce             	sub    %rcx,%rsi
    1448:	0f 84 bf fe ff ff    	je     130d <iov_iter_alignment+0x5d>
    144e:	eb da                	jmp    142a <iov_iter_alignment+0x17a>
    1450:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1457 <iov_iter_alignment+0x1a7>
    1457:	0f 85 b0 fe ff ff    	jne    130d <iov_iter_alignment+0x5d>
    145d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    1464:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1468:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 146f <iov_iter_alignment+0x1bf>
    146f:	e8 00 00 00 00       	callq  1474 <iov_iter_alignment+0x1c4>
    1474:	0f 0b                	ud2    
    1476:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    147a:	e9 8e fe ff ff       	jmpq   130d <iov_iter_alignment+0x5d>
    147f:	31 c0                	xor    %eax,%eax
    1481:	eb a7                	jmp    142a <iov_iter_alignment+0x17a>
    1483:	0f 1f 00             	nopl   (%rax)
    1486:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    148d:	00 00 00 

0000000000001490 <iov_iter_gap_alignment>:
    1490:	55                   	push   %rbp
    1491:	48 89 e5             	mov    %rsp,%rbp
    1494:	41 55                	push   %r13
    1496:	41 54                	push   %r12
    1498:	53                   	push   %rbx
    1499:	48 83 ec 08          	sub    $0x8,%rsp
    149d:	8b 0f                	mov    (%rdi),%ecx
    149f:	89 c8                	mov    %ecx,%eax
    14a1:	83 e0 fe             	and    $0xfffffffe,%eax
    14a4:	83 e8 20             	sub    $0x20,%eax
    14a7:	83 e0 de             	and    $0xffffffde,%eax
    14aa:	0f 84 9c 00 00 00    	je     154c <iov_iter_gap_alignment+0xbc>
    14b0:	4c 8b 47 10          	mov    0x10(%rdi),%r8
    14b4:	4d 85 c0             	test   %r8,%r8
    14b7:	0f 84 a1 00 00 00    	je     155e <iov_iter_gap_alignment+0xce>
    14bd:	f6 c1 10             	test   $0x10,%cl
    14c0:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    14c4:	0f 85 a1 00 00 00    	jne    156b <iov_iter_gap_alignment+0xdb>
    14ca:	f6 c1 08             	test   $0x8,%cl
    14cd:	0f 85 2b 01 00 00    	jne    15fe <iov_iter_gap_alignment+0x16e>
    14d3:	83 e1 40             	and    $0x40,%ecx
    14d6:	0f 85 82 00 00 00    	jne    155e <iov_iter_gap_alignment+0xce>
    14dc:	48 8b 4f 18          	mov    0x18(%rdi),%rcx
    14e0:	48 8b 41 08          	mov    0x8(%rcx),%rax
    14e4:	48 29 d0             	sub    %rdx,%rax
    14e7:	49 39 c0             	cmp    %rax,%r8
    14ea:	48 89 c2             	mov    %rax,%rdx
    14ed:	49 0f 46 d0          	cmovbe %r8,%rdx
    14f1:	48 85 d2             	test   %rdx,%rdx
    14f4:	74 1c                	je     1512 <iov_iter_gap_alignment+0x82>
    14f6:	49 39 c0             	cmp    %rax,%r8
    14f9:	b8 00 00 00 00       	mov    $0x0,%eax
    14fe:	49 0f 47 c0          	cmova  %r8,%rax
    1502:	49 29 d0             	sub    %rdx,%r8
    1505:	75 0d                	jne    1514 <iov_iter_gap_alignment+0x84>
    1507:	48 83 c4 08          	add    $0x8,%rsp
    150b:	5b                   	pop    %rbx
    150c:	41 5c                	pop    %r12
    150e:	41 5d                	pop    %r13
    1510:	5d                   	pop    %rbp
    1511:	c3                   	retq   
    1512:	31 c0                	xor    %eax,%eax
    1514:	48 83 c1 10          	add    $0x10,%rcx
    1518:	48 8b 51 08          	mov    0x8(%rcx),%rdx
    151c:	49 39 d0             	cmp    %rdx,%r8
    151f:	48 89 d6             	mov    %rdx,%rsi
    1522:	49 0f 46 f0          	cmovbe %r8,%rsi
    1526:	48 85 f6             	test   %rsi,%rsi
    1529:	74 e9                	je     1514 <iov_iter_gap_alignment+0x84>
    152b:	48 8b 39             	mov    (%rcx),%rdi
    152e:	48 09 c7             	or     %rax,%rdi
    1531:	48 85 c0             	test   %rax,%rax
    1534:	48 0f 45 c7          	cmovne %rdi,%rax
    1538:	48 89 c7             	mov    %rax,%rdi
    153b:	4c 09 c7             	or     %r8,%rdi
    153e:	49 39 d0             	cmp    %rdx,%r8
    1541:	48 0f 47 c7          	cmova  %rdi,%rax
    1545:	49 29 f0             	sub    %rsi,%r8
    1548:	74 bd                	je     1507 <iov_iter_gap_alignment+0x77>
    154a:	eb c8                	jmp    1514 <iov_iter_gap_alignment+0x84>
    154c:	0f 0b                	ud2    
    154e:	48 83 c4 08          	add    $0x8,%rsp
    1552:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1557:	5b                   	pop    %rbx
    1558:	41 5c                	pop    %r12
    155a:	41 5d                	pop    %r13
    155c:	5d                   	pop    %rbp
    155d:	c3                   	retq   
    155e:	48 83 c4 08          	add    $0x8,%rsp
    1562:	31 c0                	xor    %eax,%eax
    1564:	5b                   	pop    %rbx
    1565:	41 5c                	pop    %r12
    1567:	41 5d                	pop    %r13
    1569:	5d                   	pop    %rbp
    156a:	c3                   	retq   
    156b:	44 89 c3             	mov    %r8d,%ebx
    156e:	31 f6                	xor    %esi,%esi
    1570:	31 c0                	xor    %eax,%eax
    1572:	41 bc 00 10 00 00    	mov    $0x1000,%r12d
    1578:	85 db                	test   %ebx,%ebx
    157a:	74 8b                	je     1507 <iov_iter_gap_alignment+0x77>
    157c:	4c 8b 5f 18          	mov    0x18(%rdi),%r11
    1580:	41 89 f1             	mov    %esi,%r9d
    1583:	45 89 e5             	mov    %r12d,%r13d
    1586:	49 c1 e1 04          	shl    $0x4,%r9
    158a:	4d 01 d9             	add    %r11,%r9
    158d:	41 8b 49 08          	mov    0x8(%r9),%ecx
    1591:	45 8b 51 0c          	mov    0xc(%r9),%r10d
    1595:	41 89 c9             	mov    %ecx,%r9d
    1598:	41 01 d2             	add    %edx,%r10d
    159b:	41 29 d1             	sub    %edx,%r9d
    159e:	41 81 e2 ff 0f 00 00 	and    $0xfff,%r10d
    15a5:	41 39 d9             	cmp    %ebx,%r9d
    15a8:	44 0f 47 cb          	cmova  %ebx,%r9d
    15ac:	45 29 d5             	sub    %r10d,%r13d
    15af:	45 39 e9             	cmp    %r13d,%r9d
    15b2:	45 0f 47 cd          	cmova  %r13d,%r9d
    15b6:	45 85 c9             	test   %r9d,%r9d
    15b9:	74 23                	je     15de <iov_iter_gap_alignment+0x14e>
    15bb:	49 09 c2             	or     %rax,%r10
    15be:	48 85 c0             	test   %rax,%rax
    15c1:	49 0f 45 c2          	cmovne %r10,%rax
    15c5:	45 89 ca             	mov    %r9d,%r10d
    15c8:	49 89 c5             	mov    %rax,%r13
    15cb:	4d 09 c5             	or     %r8,%r13
    15ce:	4d 39 c2             	cmp    %r8,%r10
    15d1:	49 0f 45 c5          	cmovne %r13,%rax
    15d5:	44 39 cb             	cmp    %r9d,%ebx
    15d8:	0f 82 8f 00 00 00    	jb     166d <iov_iter_gap_alignment+0x1dd>
    15de:	44 29 cb             	sub    %r9d,%ebx
    15e1:	44 01 ca             	add    %r9d,%edx
    15e4:	74 92                	je     1578 <iov_iter_gap_alignment+0xe8>
    15e6:	39 d1                	cmp    %edx,%ecx
    15e8:	77 8e                	ja     1578 <iov_iter_gap_alignment+0xe8>
    15ea:	83 c6 01             	add    $0x1,%esi
    15ed:	29 ca                	sub    %ecx,%edx
    15ef:	74 87                	je     1578 <iov_iter_gap_alignment+0xe8>
    15f1:	89 f1                	mov    %esi,%ecx
    15f3:	48 c1 e1 04          	shl    $0x4,%rcx
    15f7:	41 8b 4c 0b 08       	mov    0x8(%r11,%rcx,1),%ecx
    15fc:	eb e8                	jmp    15e6 <iov_iter_gap_alignment+0x156>
    15fe:	48 8b 4f 18          	mov    0x18(%rdi),%rcx
    1602:	48 8b 41 08          	mov    0x8(%rcx),%rax
    1606:	48 29 d0             	sub    %rdx,%rax
    1609:	49 39 c0             	cmp    %rax,%r8
    160c:	48 89 c2             	mov    %rax,%rdx
    160f:	49 0f 46 d0          	cmovbe %r8,%rdx
    1613:	48 85 d2             	test   %rdx,%rdx
    1616:	0f 84 80 00 00 00    	je     169c <iov_iter_gap_alignment+0x20c>
    161c:	49 39 c0             	cmp    %rax,%r8
    161f:	b8 00 00 00 00       	mov    $0x0,%eax
    1624:	49 0f 47 c0          	cmova  %r8,%rax
    1628:	49 29 d0             	sub    %rdx,%r8
    162b:	0f 84 d6 fe ff ff    	je     1507 <iov_iter_gap_alignment+0x77>
    1631:	48 83 c1 10          	add    $0x10,%rcx
    1635:	48 8b 71 08          	mov    0x8(%rcx),%rsi
    1639:	49 39 f0             	cmp    %rsi,%r8
    163c:	48 89 f2             	mov    %rsi,%rdx
    163f:	49 0f 46 d0          	cmovbe %r8,%rdx
    1643:	48 85 d2             	test   %rdx,%rdx
    1646:	74 e9                	je     1631 <iov_iter_gap_alignment+0x1a1>
    1648:	48 8b 39             	mov    (%rcx),%rdi
    164b:	48 09 c7             	or     %rax,%rdi
    164e:	48 85 c0             	test   %rax,%rax
    1651:	48 0f 45 c7          	cmovne %rdi,%rax
    1655:	48 89 c7             	mov    %rax,%rdi
    1658:	4c 09 c7             	or     %r8,%rdi
    165b:	49 39 f0             	cmp    %rsi,%r8
    165e:	48 0f 47 c7          	cmova  %rdi,%rax
    1662:	49 29 d0             	sub    %rdx,%r8
    1665:	0f 84 9c fe ff ff    	je     1507 <iov_iter_gap_alignment+0x77>
    166b:	eb c4                	jmp    1631 <iov_iter_gap_alignment+0x1a1>
    166d:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1674 <iov_iter_gap_alignment+0x1e4>
    1674:	0f 85 8d fe ff ff    	jne    1507 <iov_iter_gap_alignment+0x77>
    167a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    1681:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1685:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 168c <iov_iter_gap_alignment+0x1fc>
    168c:	e8 00 00 00 00       	callq  1691 <iov_iter_gap_alignment+0x201>
    1691:	0f 0b                	ud2    
    1693:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1697:	e9 6b fe ff ff       	jmpq   1507 <iov_iter_gap_alignment+0x77>
    169c:	31 c0                	xor    %eax,%eax
    169e:	eb 91                	jmp    1631 <iov_iter_gap_alignment+0x1a1>

00000000000016a0 <iov_iter_for_each_range>:
    16a0:	55                   	push   %rbp
    16a1:	48 89 e5             	mov    %rsp,%rbp
    16a4:	41 57                	push   %r15
    16a6:	41 56                	push   %r14
    16a8:	41 55                	push   %r13
    16aa:	41 54                	push   %r12
    16ac:	53                   	push   %rbx
    16ad:	48 83 ec 48          	sub    $0x48,%rsp
    16b1:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    16b8:	00 00 
    16ba:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    16be:	31 c0                	xor    %eax,%eax
    16c0:	48 85 f6             	test   %rsi,%rsi
    16c3:	74 4d                	je     1712 <iov_iter_for_each_range+0x72>
    16c5:	49 89 f7             	mov    %rsi,%r15
    16c8:	8b 37                	mov    (%rdi),%esi
    16ca:	45 31 e4             	xor    %r12d,%r12d
    16cd:	49 89 fd             	mov    %rdi,%r13
    16d0:	48 8b 5f 08          	mov    0x8(%rdi),%rbx
    16d4:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    16d9:	40 f6 c6 10          	test   $0x10,%sil
    16dd:	0f 85 0a 01 00 00    	jne    17ed <iov_iter_for_each_range+0x14d>
    16e3:	40 f6 c6 08          	test   $0x8,%sil
    16e7:	0f 85 72 01 00 00    	jne    185f <iov_iter_for_each_range+0x1bf>
    16ed:	83 e6 40             	and    $0x40,%esi
    16f0:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    16f5:	75 1b                	jne    1712 <iov_iter_for_each_range+0x72>
    16f7:	48 8b 4f 18          	mov    0x18(%rdi),%rcx
    16fb:	48 8b 51 08          	mov    0x8(%rcx),%rdx
    16ff:	48 29 da             	sub    %rbx,%rdx
    1702:	4c 39 fa             	cmp    %r15,%rdx
    1705:	49 0f 47 d7          	cmova  %r15,%rdx
    1709:	48 85 d2             	test   %rdx,%rdx
    170c:	0f 84 2e 01 00 00    	je     1840 <iov_iter_for_each_range+0x1a0>
    1712:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    1716:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
    171d:	00 00 
    171f:	0f 85 df 01 00 00    	jne    1904 <iov_iter_for_each_range+0x264>
    1725:	48 83 c4 48          	add    $0x48,%rsp
    1729:	5b                   	pop    %rbx
    172a:	41 5c                	pop    %r12
    172c:	41 5d                	pop    %r13
    172e:	41 5e                	pop    %r14
    1730:	41 5f                	pop    %r15
    1732:	5d                   	pop    %rbp
    1733:	c3                   	retq   
    1734:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)
    1738:	4c 89 4d a0          	mov    %r9,-0x60(%rbp)
    173c:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    1740:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
    1744:	44 89 55 b0          	mov    %r10d,-0x50(%rbp)
    1748:	89 7d b8             	mov    %edi,-0x48(%rbp)
    174b:	4d 8b 36             	mov    (%r14),%r14
    174e:	e8 00 00 00 00       	callq  1753 <iov_iter_for_each_range+0xb3>
    1753:	8b 7d b8             	mov    -0x48(%rbp),%edi
    1756:	44 8b 55 b0          	mov    -0x50(%rbp),%r10d
    175a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
    175e:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
    1762:	c1 ef 0c             	shr    $0xc,%edi
    1765:	89 f8                	mov    %edi,%eax
    1767:	48 89 ce             	mov    %rcx,%rsi
    176a:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    176e:	48 c1 e0 06          	shl    $0x6,%rax
    1772:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    1776:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
    177a:	4c 01 f0             	add    %r14,%rax
    177d:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 1784 <iov_iter_for_each_range+0xe4>
    1784:	48 c1 f8 06          	sar    $0x6,%rax
    1788:	48 c1 e0 0c          	shl    $0xc,%rax
    178c:	48 03 05 00 00 00 00 	add    0x0(%rip),%rax        # 1793 <iov_iter_for_each_range+0xf3>
    1793:	49 01 c2             	add    %rax,%r10
    1796:	8b 45 ac             	mov    -0x54(%rbp),%eax
    1799:	4c 89 55 c0          	mov    %r10,-0x40(%rbp)
    179d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    17a1:	e8 00 00 00 00       	callq  17a6 <iov_iter_for_each_range+0x106>
    17a6:	44 8b 45 ac          	mov    -0x54(%rbp),%r8d
    17aa:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
    17ae:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    17b2:	4c 8b 4d a0          	mov    -0x60(%rbp),%r9
    17b6:	45 39 f8             	cmp    %r15d,%r8d
    17b9:	0f 87 12 01 00 00    	ja     18d1 <iov_iter_for_each_range+0x231>
    17bf:	49 8b 75 18          	mov    0x18(%r13),%rsi
    17c3:	45 29 c7             	sub    %r8d,%r15d
    17c6:	44 01 c3             	add    %r8d,%ebx
    17c9:	74 22                	je     17ed <iov_iter_for_each_range+0x14d>
    17cb:	42 8b 7c 0e 08       	mov    0x8(%rsi,%r9,1),%edi
    17d0:	39 fb                	cmp    %edi,%ebx
    17d2:	73 11                	jae    17e5 <iov_iter_for_each_range+0x145>
    17d4:	eb 17                	jmp    17ed <iov_iter_for_each_range+0x14d>
    17d6:	44 89 e7             	mov    %r12d,%edi
    17d9:	48 c1 e7 04          	shl    $0x4,%rdi
    17dd:	8b 7c 3e 08          	mov    0x8(%rsi,%rdi,1),%edi
    17e1:	39 df                	cmp    %ebx,%edi
    17e3:	77 08                	ja     17ed <iov_iter_for_each_range+0x14d>
    17e5:	41 83 c4 01          	add    $0x1,%r12d
    17e9:	29 fb                	sub    %edi,%ebx
    17eb:	75 e9                	jne    17d6 <iov_iter_for_each_range+0x136>
    17ed:	45 85 ff             	test   %r15d,%r15d
    17f0:	0f 84 1c ff ff ff    	je     1712 <iov_iter_for_each_range+0x72>
    17f6:	49 8b 75 18          	mov    0x18(%r13),%rsi
    17fa:	45 89 e1             	mov    %r12d,%r9d
    17fd:	49 c1 e1 04          	shl    $0x4,%r9
    1801:	4e 8d 34 0e          	lea    (%rsi,%r9,1),%r14
    1805:	41 8b 7e 0c          	mov    0xc(%r14),%edi
    1809:	45 8b 46 08          	mov    0x8(%r14),%r8d
    180d:	01 df                	add    %ebx,%edi
    180f:	41 29 d8             	sub    %ebx,%r8d
    1812:	41 89 fa             	mov    %edi,%r10d
    1815:	45 89 c3             	mov    %r8d,%r11d
    1818:	41 81 e2 ff 0f 00 00 	and    $0xfff,%r10d
    181f:	45 39 f8             	cmp    %r15d,%r8d
    1822:	41 b8 00 10 00 00    	mov    $0x1000,%r8d
    1828:	45 0f 47 df          	cmova  %r15d,%r11d
    182c:	45 29 d0             	sub    %r10d,%r8d
    182f:	45 39 c3             	cmp    %r8d,%r11d
    1832:	45 0f 46 c3          	cmovbe %r11d,%r8d
    1836:	45 85 c0             	test   %r8d,%r8d
    1839:	74 88                	je     17c3 <iov_iter_for_each_range+0x123>
    183b:	e9 f4 fe ff ff       	jmpq   1734 <iov_iter_for_each_range+0x94>
    1840:	48 83 c1 10          	add    $0x10,%rcx
    1844:	4c 89 f8             	mov    %r15,%rax
    1847:	4c 39 79 08          	cmp    %r15,0x8(%rcx)
    184b:	48 0f 46 41 08       	cmovbe 0x8(%rcx),%rax
    1850:	48 85 c0             	test   %rax,%rax
    1853:	74 eb                	je     1840 <iov_iter_for_each_range+0x1a0>
    1855:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    185a:	e9 b3 fe ff ff       	jmpq   1712 <iov_iter_for_each_range+0x72>
    185f:	4c 8b 6f 18          	mov    0x18(%rdi),%r13
    1863:	4d 8b 65 08          	mov    0x8(%r13),%r12
    1867:	49 29 dc             	sub    %rbx,%r12
    186a:	4d 39 fc             	cmp    %r15,%r12
    186d:	4d 0f 47 e7          	cmova  %r15,%r12
    1871:	4d 85 e4             	test   %r12,%r12
    1874:	0f 84 84 00 00 00    	je     18fe <iov_iter_for_each_range+0x25e>
    187a:	49 03 5d 00          	add    0x0(%r13),%rbx
    187e:	4c 89 65 c8          	mov    %r12,-0x38(%rbp)
    1882:	48 89 5d c0          	mov    %rbx,-0x40(%rbp)
    1886:	48 8d 5d c0          	lea    -0x40(%rbp),%rbx
    188a:	48 89 ce             	mov    %rcx,%rsi
    188d:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    1891:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    1895:	48 89 df             	mov    %rbx,%rdi
    1898:	e8 00 00 00 00       	callq  189d <iov_iter_for_each_range+0x1fd>
    189d:	4d 29 e7             	sub    %r12,%r15
    18a0:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
    18a4:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    18a8:	0f 84 64 fe ff ff    	je     1712 <iov_iter_for_each_range+0x72>
    18ae:	49 83 c5 10          	add    $0x10,%r13
    18b2:	4d 89 fc             	mov    %r15,%r12
    18b5:	4d 39 7d 08          	cmp    %r15,0x8(%r13)
    18b9:	4d 0f 46 65 08       	cmovbe 0x8(%r13),%r12
    18be:	4d 85 e4             	test   %r12,%r12
    18c1:	74 eb                	je     18ae <iov_iter_for_each_range+0x20e>
    18c3:	49 8b 45 00          	mov    0x0(%r13),%rax
    18c7:	4c 89 65 c8          	mov    %r12,-0x38(%rbp)
    18cb:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    18cf:	eb b9                	jmp    188a <iov_iter_for_each_range+0x1ea>
    18d1:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 18d8 <iov_iter_for_each_range+0x238>
    18d8:	0f 85 34 fe ff ff    	jne    1712 <iov_iter_for_each_range+0x72>
    18de:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    18e5:	89 45 b8             	mov    %eax,-0x48(%rbp)
    18e8:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 18ef <iov_iter_for_each_range+0x24f>
    18ef:	e8 00 00 00 00       	callq  18f4 <iov_iter_for_each_range+0x254>
    18f4:	0f 0b                	ud2    
    18f6:	8b 45 b8             	mov    -0x48(%rbp),%eax
    18f9:	e9 14 fe ff ff       	jmpq   1712 <iov_iter_for_each_range+0x72>
    18fe:	48 8d 5d c0          	lea    -0x40(%rbp),%rbx
    1902:	eb aa                	jmp    18ae <iov_iter_for_each_range+0x20e>
    1904:	e8 00 00 00 00       	callq  1909 <iov_iter_for_each_range+0x269>
    1909:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001910 <iov_iter_npages>:
    1910:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
    1914:	48 85 c9             	test   %rcx,%rcx
    1917:	0f 84 c6 00 00 00    	je     19e3 <iov_iter_npages+0xd3>
    191d:	8b 07                	mov    (%rdi),%eax
    191f:	89 c2                	mov    %eax,%edx
    1921:	83 e2 fe             	and    $0xfffffffe,%edx
    1924:	83 fa 40             	cmp    $0x40,%edx
    1927:	0f 84 b6 00 00 00    	je     19e3 <iov_iter_npages+0xd3>
    192d:	55                   	push   %rbp
    192e:	48 89 e5             	mov    %rsp,%rbp
    1931:	41 54                	push   %r12
    1933:	53                   	push   %rbx
    1934:	48 89 fb             	mov    %rdi,%rbx
    1937:	48 83 ec 08          	sub    $0x8,%rsp
    193b:	83 fa 20             	cmp    $0x20,%edx
    193e:	0f 84 a2 00 00 00    	je     19e6 <iov_iter_npages+0xd6>
    1944:	a8 10                	test   $0x10,%al
    1946:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    194a:	0f 85 0e 01 00 00    	jne    1a5e <iov_iter_npages+0x14e>
    1950:	a8 08                	test   $0x8,%al
    1952:	0f 85 94 01 00 00    	jne    1aec <iov_iter_npages+0x1dc>
    1958:	a8 40                	test   $0x40,%al
    195a:	75 3f                	jne    199b <iov_iter_npages+0x8b>
    195c:	4c 8b 47 18          	mov    0x18(%rdi),%r8
    1960:	49 8b 78 08          	mov    0x8(%r8),%rdi
    1964:	48 29 d7             	sub    %rdx,%rdi
    1967:	48 39 cf             	cmp    %rcx,%rdi
    196a:	48 0f 47 f9          	cmova  %rcx,%rdi
    196e:	48 85 ff             	test   %rdi,%rdi
    1971:	0f 84 f6 01 00 00    	je     1b6d <iov_iter_npages+0x25d>
    1977:	49 03 10             	add    (%r8),%rdx
    197a:	48 8d 84 17 ff 0f 00 	lea    0xfff(%rdi,%rdx,1),%rax
    1981:	00 
    1982:	48 c1 ea 0c          	shr    $0xc,%rdx
    1986:	48 c1 e8 0c          	shr    $0xc,%rax
    198a:	29 d0                	sub    %edx,%eax
    198c:	39 f0                	cmp    %esi,%eax
    198e:	7c 16                	jl     19a6 <iov_iter_npages+0x96>
    1990:	48 83 c4 08          	add    $0x8,%rsp
    1994:	89 f0                	mov    %esi,%eax
    1996:	5b                   	pop    %rbx
    1997:	41 5c                	pop    %r12
    1999:	5d                   	pop    %rbp
    199a:	c3                   	retq   
    199b:	31 c0                	xor    %eax,%eax
    199d:	48 83 c4 08          	add    $0x8,%rsp
    19a1:	5b                   	pop    %rbx
    19a2:	41 5c                	pop    %r12
    19a4:	5d                   	pop    %rbp
    19a5:	c3                   	retq   
    19a6:	48 29 f9             	sub    %rdi,%rcx
    19a9:	74 f2                	je     199d <iov_iter_npages+0x8d>
    19ab:	49 83 c0 10          	add    $0x10,%r8
    19af:	48 89 ca             	mov    %rcx,%rdx
    19b2:	49 39 48 08          	cmp    %rcx,0x8(%r8)
    19b6:	49 0f 46 50 08       	cmovbe 0x8(%r8),%rdx
    19bb:	48 85 d2             	test   %rdx,%rdx
    19be:	74 eb                	je     19ab <iov_iter_npages+0x9b>
    19c0:	49 8b 38             	mov    (%r8),%rdi
    19c3:	4c 8d 8c 3a ff 0f 00 	lea    0xfff(%rdx,%rdi,1),%r9
    19ca:	00 
    19cb:	48 c1 ef 0c          	shr    $0xc,%rdi
    19cf:	29 f8                	sub    %edi,%eax
    19d1:	49 c1 e9 0c          	shr    $0xc,%r9
    19d5:	44 01 c8             	add    %r9d,%eax
    19d8:	39 c6                	cmp    %eax,%esi
    19da:	7e b4                	jle    1990 <iov_iter_npages+0x80>
    19dc:	48 29 d1             	sub    %rdx,%rcx
    19df:	74 bc                	je     199d <iov_iter_npages+0x8d>
    19e1:	eb c8                	jmp    19ab <iov_iter_npages+0x9b>
    19e3:	31 c0                	xor    %eax,%eax
    19e5:	c3                   	retq   
    19e6:	89 75 ec             	mov    %esi,-0x14(%rbp)
    19e9:	4c 8b 67 18          	mov    0x18(%rdi),%r12
    19ed:	e8 be e6 ff ff       	callq  b0 <sanity>
    19f2:	84 c0                	test   %al,%al
    19f4:	74 a5                	je     199b <iov_iter_npages+0x8b>
    19f6:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
    19fa:	8b 43 20             	mov    0x20(%rbx),%eax
    19fd:	8b 75 ec             	mov    -0x14(%rbp),%esi
    1a00:	48 85 c9             	test   %rcx,%rcx
    1a03:	74 31                	je     1a36 <iov_iter_npages+0x126>
    1a05:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
    1a09:	8b 5f 5c             	mov    0x5c(%rdi),%ebx
    1a0c:	4c 8b 87 90 00 00 00 	mov    0x90(%rdi),%r8
    1a13:	8d 53 ff             	lea    -0x1(%rbx),%edx
    1a16:	21 c2                	and    %eax,%edx
    1a18:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
    1a1c:	49 8d 14 d0          	lea    (%r8,%rdx,8),%rdx
    1a20:	48 81 7a 10 00 00 00 	cmpq   $0x0,0x10(%rdx)
    1a27:	00 
    1a28:	75 09                	jne    1a33 <iov_iter_npages+0x123>
    1a2a:	48 81 f9 00 10 00 00 	cmp    $0x1000,%rcx
    1a31:	75 03                	jne    1a36 <iov_iter_npages+0x126>
    1a33:	83 c0 01             	add    $0x1,%eax
    1a36:	41 2b 44 24 54       	sub    0x54(%r12),%eax
    1a3b:	41 8b 4c 24 58       	mov    0x58(%r12),%ecx
    1a40:	89 c2                	mov    %eax,%edx
    1a42:	31 c0                	xor    %eax,%eax
    1a44:	39 d1                	cmp    %edx,%ecx
    1a46:	76 0c                	jbe    1a54 <iov_iter_npages+0x144>
    1a48:	41 8b 44 24 5c       	mov    0x5c(%r12),%eax
    1a4d:	29 d0                	sub    %edx,%eax
    1a4f:	39 c8                	cmp    %ecx,%eax
    1a51:	0f 47 c1             	cmova  %ecx,%eax
    1a54:	39 c6                	cmp    %eax,%esi
    1a56:	0f 4e c6             	cmovle %esi,%eax
    1a59:	e9 3f ff ff ff       	jmpq   199d <iov_iter_npages+0x8d>
    1a5e:	41 89 c9             	mov    %ecx,%r9d
    1a61:	45 31 c0             	xor    %r8d,%r8d
    1a64:	31 c0                	xor    %eax,%eax
    1a66:	41 bb 00 10 00 00    	mov    $0x1000,%r11d
    1a6c:	45 85 c9             	test   %r9d,%r9d
    1a6f:	0f 84 28 ff ff ff    	je     199d <iov_iter_npages+0x8d>
    1a75:	4c 8b 53 18          	mov    0x18(%rbx),%r10
    1a79:	44 89 c7             	mov    %r8d,%edi
    1a7c:	48 c1 e7 04          	shl    $0x4,%rdi
    1a80:	4c 01 d7             	add    %r10,%rdi
    1a83:	44 8b 67 0c          	mov    0xc(%rdi),%r12d
    1a87:	8b 4f 08             	mov    0x8(%rdi),%ecx
    1a8a:	41 01 d4             	add    %edx,%r12d
    1a8d:	44 89 e7             	mov    %r12d,%edi
    1a90:	45 89 dc             	mov    %r11d,%r12d
    1a93:	81 e7 ff 0f 00 00    	and    $0xfff,%edi
    1a99:	41 29 fc             	sub    %edi,%r12d
    1a9c:	44 89 e7             	mov    %r12d,%edi
    1a9f:	41 89 cc             	mov    %ecx,%r12d
    1aa2:	41 29 d4             	sub    %edx,%r12d
    1aa5:	45 39 cc             	cmp    %r9d,%r12d
    1aa8:	45 0f 47 e1          	cmova  %r9d,%r12d
    1aac:	44 39 e7             	cmp    %r12d,%edi
    1aaf:	41 0f 47 fc          	cmova  %r12d,%edi
    1ab3:	85 ff                	test   %edi,%edi
    1ab5:	74 14                	je     1acb <iov_iter_npages+0x1bb>
    1ab7:	83 c0 01             	add    $0x1,%eax
    1aba:	39 c6                	cmp    %eax,%esi
    1abc:	0f 8e ce fe ff ff    	jle    1990 <iov_iter_npages+0x80>
    1ac2:	41 39 f9             	cmp    %edi,%r9d
    1ac5:	0f 82 a9 00 00 00    	jb     1b74 <iov_iter_npages+0x264>
    1acb:	41 29 f9             	sub    %edi,%r9d
    1ace:	01 fa                	add    %edi,%edx
    1ad0:	74 9a                	je     1a6c <iov_iter_npages+0x15c>
    1ad2:	39 d1                	cmp    %edx,%ecx
    1ad4:	77 96                	ja     1a6c <iov_iter_npages+0x15c>
    1ad6:	41 83 c0 01          	add    $0x1,%r8d
    1ada:	29 ca                	sub    %ecx,%edx
    1adc:	74 8e                	je     1a6c <iov_iter_npages+0x15c>
    1ade:	44 89 c1             	mov    %r8d,%ecx
    1ae1:	48 c1 e1 04          	shl    $0x4,%rcx
    1ae5:	41 8b 4c 0a 08       	mov    0x8(%r10,%rcx,1),%ecx
    1aea:	eb e6                	jmp    1ad2 <iov_iter_npages+0x1c2>
    1aec:	4c 8b 47 18          	mov    0x18(%rdi),%r8
    1af0:	49 8b 78 08          	mov    0x8(%r8),%rdi
    1af4:	48 29 d7             	sub    %rdx,%rdi
    1af7:	48 39 cf             	cmp    %rcx,%rdi
    1afa:	48 0f 47 f9          	cmova  %rcx,%rdi
    1afe:	48 85 ff             	test   %rdi,%rdi
    1b01:	0f 84 9a 00 00 00    	je     1ba1 <iov_iter_npages+0x291>
    1b07:	49 03 10             	add    (%r8),%rdx
    1b0a:	48 8d 84 17 ff 0f 00 	lea    0xfff(%rdi,%rdx,1),%rax
    1b11:	00 
    1b12:	48 c1 ea 0c          	shr    $0xc,%rdx
    1b16:	48 c1 e8 0c          	shr    $0xc,%rax
    1b1a:	29 d0                	sub    %edx,%eax
    1b1c:	39 c6                	cmp    %eax,%esi
    1b1e:	0f 8e 6c fe ff ff    	jle    1990 <iov_iter_npages+0x80>
    1b24:	48 29 f9             	sub    %rdi,%rcx
    1b27:	0f 84 70 fe ff ff    	je     199d <iov_iter_npages+0x8d>
    1b2d:	49 83 c0 10          	add    $0x10,%r8
    1b31:	48 89 ca             	mov    %rcx,%rdx
    1b34:	49 39 48 08          	cmp    %rcx,0x8(%r8)
    1b38:	49 0f 46 50 08       	cmovbe 0x8(%r8),%rdx
    1b3d:	48 85 d2             	test   %rdx,%rdx
    1b40:	74 eb                	je     1b2d <iov_iter_npages+0x21d>
    1b42:	49 8b 38             	mov    (%r8),%rdi
    1b45:	4c 8d 8c 3a ff 0f 00 	lea    0xfff(%rdx,%rdi,1),%r9
    1b4c:	00 
    1b4d:	48 c1 ef 0c          	shr    $0xc,%rdi
    1b51:	29 f8                	sub    %edi,%eax
    1b53:	49 c1 e9 0c          	shr    $0xc,%r9
    1b57:	44 01 c8             	add    %r9d,%eax
    1b5a:	39 c6                	cmp    %eax,%esi
    1b5c:	0f 8e 2e fe ff ff    	jle    1990 <iov_iter_npages+0x80>
    1b62:	48 29 d1             	sub    %rdx,%rcx
    1b65:	0f 84 32 fe ff ff    	je     199d <iov_iter_npages+0x8d>
    1b6b:	eb c0                	jmp    1b2d <iov_iter_npages+0x21d>
    1b6d:	31 c0                	xor    %eax,%eax
    1b6f:	e9 37 fe ff ff       	jmpq   19ab <iov_iter_npages+0x9b>
    1b74:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1b7b <iov_iter_npages+0x26b>
    1b7b:	0f 85 1c fe ff ff    	jne    199d <iov_iter_npages+0x8d>
    1b81:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    1b88:	89 45 ec             	mov    %eax,-0x14(%rbp)
    1b8b:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 1b92 <iov_iter_npages+0x282>
    1b92:	e8 00 00 00 00       	callq  1b97 <iov_iter_npages+0x287>
    1b97:	0f 0b                	ud2    
    1b99:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1b9c:	e9 fc fd ff ff       	jmpq   199d <iov_iter_npages+0x8d>
    1ba1:	31 c0                	xor    %eax,%eax
    1ba3:	eb 88                	jmp    1b2d <iov_iter_npages+0x21d>
    1ba5:	90                   	nop
    1ba6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1bad:	00 00 00 

0000000000001bb0 <iov_iter_copy_from_user_atomic>:
    1bb0:	55                   	push   %rbp
    1bb1:	48 89 e5             	mov    %rsp,%rbp
    1bb4:	41 57                	push   %r15
    1bb6:	41 56                	push   %r14
    1bb8:	41 55                	push   %r13
    1bba:	41 54                	push   %r12
    1bbc:	49 89 f4             	mov    %rsi,%r12
    1bbf:	53                   	push   %rbx
    1bc0:	48 89 cb             	mov    %rcx,%rbx
    1bc3:	48 83 ec 08          	sub    $0x8,%rsp
    1bc7:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    1bce:	00 00 
    1bd0:	83 80 80 12 00 00 01 	addl   $0x1,0x1280(%rax)
    1bd7:	48 89 d1             	mov    %rdx,%rcx
    1bda:	48 89 f8             	mov    %rdi,%rax
    1bdd:	48 01 d9             	add    %rbx,%rcx
    1be0:	48 89 ce             	mov    %rcx,%rsi
    1be3:	0f 82 e4 00 00 00    	jb     1ccd <iov_iter_copy_from_user_atomic+0x11d>
    1be9:	48 81 f9 00 10 00 00 	cmp    $0x1000,%rcx
    1bf0:	0f 87 d7 00 00 00    	ja     1ccd <iov_iter_copy_from_user_atomic+0x11d>
    1bf6:	41 8b 34 24          	mov    (%r12),%esi
    1bfa:	89 f1                	mov    %esi,%ecx
    1bfc:	83 e1 fe             	and    $0xfffffffe,%ecx
    1bff:	83 e9 20             	sub    $0x20,%ecx
    1c02:	83 e1 de             	and    $0xffffffde,%ecx
    1c05:	0f 84 19 02 00 00    	je     1e24 <iov_iter_copy_from_user_atomic+0x274>
    1c0b:	48 85 db             	test   %rbx,%rbx
    1c0e:	0f 84 33 02 00 00    	je     1e47 <iov_iter_copy_from_user_atomic+0x297>
    1c14:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 1c1b <iov_iter_copy_from_user_atomic+0x6b>
    1c1b:	45 31 d2             	xor    %r10d,%r10d
    1c1e:	4d 8b 44 24 08       	mov    0x8(%r12),%r8
    1c23:	41 89 dd             	mov    %ebx,%r13d
    1c26:	41 be 00 10 00 00    	mov    $0x1000,%r14d
    1c2c:	49 89 c1             	mov    %rax,%r9
    1c2f:	49 c1 f9 06          	sar    $0x6,%r9
    1c33:	49 c1 e1 0c          	shl    $0xc,%r9
    1c37:	4c 03 0d 00 00 00 00 	add    0x0(%rip),%r9        # 1c3e <iov_iter_copy_from_user_atomic+0x8e>
    1c3e:	49 01 d1             	add    %rdx,%r9
    1c41:	40 f6 c6 10          	test   $0x10,%sil
    1c45:	0f 85 2e 01 00 00    	jne    1d79 <iov_iter_copy_from_user_atomic+0x1c9>
    1c4b:	40 f6 c6 08          	test   $0x8,%sil
    1c4f:	0f 85 70 01 00 00    	jne    1dc5 <iov_iter_copy_from_user_atomic+0x215>
    1c55:	83 e6 40             	and    $0x40,%esi
    1c58:	0f 85 a4 01 00 00    	jne    1e02 <iov_iter_copy_from_user_atomic+0x252>
    1c5e:	4d 8b 74 24 18       	mov    0x18(%r12),%r14
    1c63:	4d 8b 6e 08          	mov    0x8(%r14),%r13
    1c67:	4d 29 c5             	sub    %r8,%r13
    1c6a:	49 39 dd             	cmp    %rbx,%r13
    1c6d:	4c 0f 47 eb          	cmova  %rbx,%r13
    1c71:	4d 85 ed             	test   %r13,%r13
    1c74:	0f 84 1a 02 00 00    	je     1e94 <iov_iter_copy_from_user_atomic+0x2e4>
    1c7a:	49 8b 36             	mov    (%r14),%rsi
    1c7d:	4c 89 ea             	mov    %r13,%rdx
    1c80:	4c 89 cf             	mov    %r9,%rdi
    1c83:	4f 8d 24 29          	lea    (%r9,%r13,1),%r12
    1c87:	49 89 df             	mov    %rbx,%r15
    1c8a:	4c 01 c6             	add    %r8,%rsi
    1c8d:	e8 4e ef ff ff       	callq  be0 <copyin>
    1c92:	48 98                	cltq   
    1c94:	49 29 c5             	sub    %rax,%r13
    1c97:	4d 29 ef             	sub    %r13,%r15
    1c9a:	48 85 c0             	test   %rax,%rax
    1c9d:	75 09                	jne    1ca8 <iov_iter_copy_from_user_atomic+0xf8>
    1c9f:	4d 85 ff             	test   %r15,%r15
    1ca2:	0f 85 a6 01 00 00    	jne    1e4e <iov_iter_copy_from_user_atomic+0x29e>
    1ca8:	48 89 d8             	mov    %rbx,%rax
    1cab:	4c 29 f8             	sub    %r15,%rax
    1cae:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    1cb5:	00 00 
    1cb7:	83 aa 80 12 00 00 01 	subl   $0x1,0x1280(%rdx)
    1cbe:	48 83 c4 08          	add    $0x8,%rsp
    1cc2:	5b                   	pop    %rbx
    1cc3:	41 5c                	pop    %r12
    1cc5:	41 5d                	pop    %r13
    1cc7:	41 5e                	pop    %r14
    1cc9:	41 5f                	pop    %r15
    1ccb:	5d                   	pop    %rbp
    1ccc:	c3                   	retq   
    1ccd:	4c 8b 47 08          	mov    0x8(%rdi),%r8
    1cd1:	41 f6 c0 01          	test   $0x1,%r8b
    1cd5:	0f 85 2f 01 00 00    	jne    1e0a <iov_iter_copy_from_user_atomic+0x25a>
    1cdb:	48 39 de             	cmp    %rbx,%rsi
    1cde:	72 21                	jb     1d01 <iov_iter_copy_from_user_atomic+0x151>
    1ce0:	48 8b 0f             	mov    (%rdi),%rcx
    1ce3:	41 b8 00 10 00 00    	mov    $0x1000,%r8d
    1ce9:	f7 c1 00 00 01 00    	test   $0x10000,%ecx
    1cef:	74 07                	je     1cf8 <iov_iter_copy_from_user_atomic+0x148>
    1cf1:	0f b6 4f 51          	movzbl 0x51(%rdi),%ecx
    1cf5:	49 d3 e0             	shl    %cl,%r8
    1cf8:	4c 39 c6             	cmp    %r8,%rsi
    1cfb:	0f 86 f5 fe ff ff    	jbe    1bf6 <iov_iter_copy_from_user_atomic+0x46>
    1d01:	0f 0b                	ud2    
    1d03:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    1d0a:	00 00 
    1d0c:	83 a8 80 12 00 00 01 	subl   $0x1,0x1280(%rax)
    1d13:	48 83 c4 08          	add    $0x8,%rsp
    1d17:	31 c0                	xor    %eax,%eax
    1d19:	5b                   	pop    %rbx
    1d1a:	41 5c                	pop    %r12
    1d1c:	41 5d                	pop    %r13
    1d1e:	41 5e                	pop    %r14
    1d20:	41 5f                	pop    %r15
    1d22:	5d                   	pop    %rbp
    1d23:	c3                   	retq   
    1d24:	c1 ee 0c             	shr    $0xc,%esi
    1d27:	44 89 d9             	mov    %r11d,%ecx
    1d2a:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1d2e:	48 c1 e6 06          	shl    $0x6,%rsi
    1d32:	48 03 37             	add    (%rdi),%rsi
    1d35:	4c 89 cf             	mov    %r9,%rdi
    1d38:	4d 8d 3c 09          	lea    (%r9,%rcx,1),%r15
    1d3c:	e8 af e6 ff ff       	callq  3f0 <memcpy_from_page>
    1d41:	45 39 eb             	cmp    %r13d,%r11d
    1d44:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1d48:	0f 87 53 01 00 00    	ja     1ea1 <iov_iter_copy_from_user_atomic+0x2f1>
    1d4e:	49 8b 4c 24 18       	mov    0x18(%r12),%rcx
    1d53:	4d 89 f9             	mov    %r15,%r9
    1d56:	45 29 dd             	sub    %r11d,%r13d
    1d59:	45 01 d8             	add    %r11d,%r8d
    1d5c:	75 12                	jne    1d70 <iov_iter_copy_from_user_atomic+0x1c0>
    1d5e:	eb 19                	jmp    1d79 <iov_iter_copy_from_user_atomic+0x1c9>
    1d60:	41 83 c2 01          	add    $0x1,%r10d
    1d64:	41 29 c0             	sub    %eax,%r8d
    1d67:	74 10                	je     1d79 <iov_iter_copy_from_user_atomic+0x1c9>
    1d69:	44 89 d0             	mov    %r10d,%eax
    1d6c:	48 c1 e0 04          	shl    $0x4,%rax
    1d70:	8b 44 01 08          	mov    0x8(%rcx,%rax,1),%eax
    1d74:	44 39 c0             	cmp    %r8d,%eax
    1d77:	76 e7                	jbe    1d60 <iov_iter_copy_from_user_atomic+0x1b0>
    1d79:	45 85 ed             	test   %r13d,%r13d
    1d7c:	0f 84 80 00 00 00    	je     1e02 <iov_iter_copy_from_user_atomic+0x252>
    1d82:	49 8b 4c 24 18       	mov    0x18(%r12),%rcx
    1d87:	44 89 d0             	mov    %r10d,%eax
    1d8a:	45 89 f7             	mov    %r14d,%r15d
    1d8d:	48 c1 e0 04          	shl    $0x4,%rax
    1d91:	48 8d 3c 01          	lea    (%rcx,%rax,1),%rdi
    1d95:	8b 77 0c             	mov    0xc(%rdi),%esi
    1d98:	44 8b 5f 08          	mov    0x8(%rdi),%r11d
    1d9c:	44 01 c6             	add    %r8d,%esi
    1d9f:	45 29 c3             	sub    %r8d,%r11d
    1da2:	89 f2                	mov    %esi,%edx
    1da4:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1daa:	45 39 eb             	cmp    %r13d,%r11d
    1dad:	45 0f 47 dd          	cmova  %r13d,%r11d
    1db1:	41 29 d7             	sub    %edx,%r15d
    1db4:	45 39 fb             	cmp    %r15d,%r11d
    1db7:	45 0f 47 df          	cmova  %r15d,%r11d
    1dbb:	45 85 db             	test   %r11d,%r11d
    1dbe:	74 96                	je     1d56 <iov_iter_copy_from_user_atomic+0x1a6>
    1dc0:	e9 5f ff ff ff       	jmpq   1d24 <iov_iter_copy_from_user_atomic+0x174>
    1dc5:	4d 8b 6c 24 18       	mov    0x18(%r12),%r13
    1dca:	4d 8b 65 08          	mov    0x8(%r13),%r12
    1dce:	4d 29 c4             	sub    %r8,%r12
    1dd1:	49 39 dc             	cmp    %rbx,%r12
    1dd4:	4c 0f 47 e3          	cmova  %rbx,%r12
    1dd8:	4d 85 e4             	test   %r12,%r12
    1ddb:	0f 84 e7 00 00 00    	je     1ec8 <iov_iter_copy_from_user_atomic+0x318>
    1de1:	49 8b 75 00          	mov    0x0(%r13),%rsi
    1de5:	4c 89 cf             	mov    %r9,%rdi
    1de8:	4c 89 e2             	mov    %r12,%rdx
    1deb:	49 89 de             	mov    %rbx,%r14
    1dee:	4c 01 c6             	add    %r8,%rsi
    1df1:	e8 00 00 00 00       	callq  1df6 <iov_iter_copy_from_user_atomic+0x246>
    1df6:	4d 29 e6             	sub    %r12,%r14
    1df9:	49 89 c1             	mov    %rax,%r9
    1dfc:	0f 85 04 01 00 00    	jne    1f06 <iov_iter_copy_from_user_atomic+0x356>
    1e02:	48 89 d8             	mov    %rbx,%rax
    1e05:	e9 a4 fe ff ff       	jmpq   1cae <iov_iter_copy_from_user_atomic+0xfe>
    1e0a:	49 8d 78 ff          	lea    -0x1(%r8),%rdi
    1e0e:	48 89 c6             	mov    %rax,%rsi
    1e11:	48 29 fe             	sub    %rdi,%rsi
    1e14:	48 c1 fe 06          	sar    $0x6,%rsi
    1e18:	48 c1 e6 0c          	shl    $0xc,%rsi
    1e1c:	48 01 ce             	add    %rcx,%rsi
    1e1f:	e9 b7 fe ff ff       	jmpq   1cdb <iov_iter_copy_from_user_atomic+0x12b>
    1e24:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    1e2b:	00 00 
    1e2d:	83 a8 80 12 00 00 01 	subl   $0x1,0x1280(%rax)
    1e34:	0f 0b                	ud2    
    1e36:	48 83 c4 08          	add    $0x8,%rsp
    1e3a:	31 c0                	xor    %eax,%eax
    1e3c:	5b                   	pop    %rbx
    1e3d:	41 5c                	pop    %r12
    1e3f:	41 5d                	pop    %r13
    1e41:	41 5e                	pop    %r14
    1e43:	41 5f                	pop    %r15
    1e45:	5d                   	pop    %rbp
    1e46:	c3                   	retq   
    1e47:	31 c0                	xor    %eax,%eax
    1e49:	e9 60 fe ff ff       	jmpq   1cae <iov_iter_copy_from_user_atomic+0xfe>
    1e4e:	49 83 c6 10          	add    $0x10,%r14
    1e52:	4c 89 f9             	mov    %r15,%rcx
    1e55:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    1e59:	49 0f 46 4e 08       	cmovbe 0x8(%r14),%rcx
    1e5e:	48 85 c9             	test   %rcx,%rcx
    1e61:	74 2a                	je     1e8d <iov_iter_copy_from_user_atomic+0x2dd>
    1e63:	49 8b 36             	mov    (%r14),%rsi
    1e66:	48 89 ca             	mov    %rcx,%rdx
    1e69:	4c 89 e7             	mov    %r12,%rdi
    1e6c:	4d 8d 2c 0c          	lea    (%r12,%rcx,1),%r13
    1e70:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    1e74:	e8 67 ed ff ff       	callq  be0 <copyin>
    1e79:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    1e7d:	48 98                	cltq   
    1e7f:	4d 89 ec             	mov    %r13,%r12
    1e82:	48 29 c1             	sub    %rax,%rcx
    1e85:	49 29 cf             	sub    %rcx,%r15
    1e88:	e9 0d fe ff ff       	jmpq   1c9a <iov_iter_copy_from_user_atomic+0xea>
    1e8d:	31 c0                	xor    %eax,%eax
    1e8f:	e9 06 fe ff ff       	jmpq   1c9a <iov_iter_copy_from_user_atomic+0xea>
    1e94:	4d 89 cc             	mov    %r9,%r12
    1e97:	49 89 df             	mov    %rbx,%r15
    1e9a:	31 c0                	xor    %eax,%eax
    1e9c:	e9 f9 fd ff ff       	jmpq   1c9a <iov_iter_copy_from_user_atomic+0xea>
    1ea1:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1ea8 <iov_iter_copy_from_user_atomic+0x2f8>
    1ea8:	0f 85 54 ff ff ff    	jne    1e02 <iov_iter_copy_from_user_atomic+0x252>
    1eae:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    1eb5:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 1ebc <iov_iter_copy_from_user_atomic+0x30c>
    1ebc:	e8 00 00 00 00       	callq  1ec1 <iov_iter_copy_from_user_atomic+0x311>
    1ec1:	0f 0b                	ud2    
    1ec3:	e9 3a ff ff ff       	jmpq   1e02 <iov_iter_copy_from_user_atomic+0x252>
    1ec8:	49 89 de             	mov    %rbx,%r14
    1ecb:	49 83 c5 10          	add    $0x10,%r13
    1ecf:	4d 89 f7             	mov    %r14,%r15
    1ed2:	4d 39 75 08          	cmp    %r14,0x8(%r13)
    1ed6:	4d 0f 46 7d 08       	cmovbe 0x8(%r13),%r15
    1edb:	4d 85 ff             	test   %r15,%r15
    1ede:	74 21                	je     1f01 <iov_iter_copy_from_user_atomic+0x351>
    1ee0:	49 8b 75 00          	mov    0x0(%r13),%rsi
    1ee4:	4c 89 fa             	mov    %r15,%rdx
    1ee7:	4c 89 cf             	mov    %r9,%rdi
    1eea:	4f 8d 24 39          	lea    (%r9,%r15,1),%r12
    1eee:	e8 00 00 00 00       	callq  1ef3 <iov_iter_copy_from_user_atomic+0x343>
    1ef3:	4d 29 fe             	sub    %r15,%r14
    1ef6:	0f 84 06 ff ff ff    	je     1e02 <iov_iter_copy_from_user_atomic+0x252>
    1efc:	4d 89 e1             	mov    %r12,%r9
    1eff:	eb ca                	jmp    1ecb <iov_iter_copy_from_user_atomic+0x31b>
    1f01:	4d 89 cc             	mov    %r9,%r12
    1f04:	eb f6                	jmp    1efc <iov_iter_copy_from_user_atomic+0x34c>
    1f06:	4d 01 e1             	add    %r12,%r9
    1f09:	eb c0                	jmp    1ecb <iov_iter_copy_from_user_atomic+0x31b>
    1f0b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001f10 <iov_iter_advance>:
    1f10:	55                   	push   %rbp
    1f11:	48 89 e5             	mov    %rsp,%rbp
    1f14:	41 57                	push   %r15
    1f16:	41 56                	push   %r14
    1f18:	41 55                	push   %r13
    1f1a:	41 54                	push   %r12
    1f1c:	49 89 fc             	mov    %rdi,%r12
    1f1f:	53                   	push   %rbx
    1f20:	48 83 ec 08          	sub    $0x8,%rsp
    1f24:	8b 07                	mov    (%rdi),%eax
    1f26:	4c 8b 47 10          	mov    0x10(%rdi),%r8
    1f2a:	89 c2                	mov    %eax,%edx
    1f2c:	83 e2 fe             	and    $0xfffffffe,%edx
    1f2f:	83 fa 20             	cmp    $0x20,%edx
    1f32:	0f 84 a6 00 00 00    	je     1fde <iov_iter_advance+0xce>
    1f38:	83 fa 40             	cmp    $0x40,%edx
    1f3b:	0f 84 9a 01 00 00    	je     20db <iov_iter_advance+0x1cb>
    1f41:	4d 85 c0             	test   %r8,%r8
    1f44:	0f 84 85 00 00 00    	je     1fcf <iov_iter_advance+0xbf>
    1f4a:	4c 39 c6             	cmp    %r8,%rsi
    1f4d:	48 8b 5f 08          	mov    0x8(%rdi),%rbx
    1f51:	49 0f 47 f0          	cmova  %r8,%rsi
    1f55:	a8 10                	test   $0x10,%al
    1f57:	0f 85 ac 01 00 00    	jne    2109 <iov_iter_advance+0x1f9>
    1f5d:	a8 08                	test   $0x8,%al
    1f5f:	0f 85 4e 02 00 00    	jne    21b3 <iov_iter_advance+0x2a3>
    1f65:	a8 40                	test   $0x40,%al
    1f67:	0f 85 b6 02 00 00    	jne    2223 <iov_iter_advance+0x313>
    1f6d:	48 8b 4f 18          	mov    0x18(%rdi),%rcx
    1f71:	48 8b 79 08          	mov    0x8(%rcx),%rdi
    1f75:	48 89 f8             	mov    %rdi,%rax
    1f78:	48 29 d8             	sub    %rbx,%rax
    1f7b:	48 39 f0             	cmp    %rsi,%rax
    1f7e:	48 0f 47 c6          	cmova  %rsi,%rax
    1f82:	48 85 c0             	test   %rax,%rax
    1f85:	0f 84 a0 02 00 00    	je     222b <iov_iter_advance+0x31b>
    1f8b:	48 89 f2             	mov    %rsi,%rdx
    1f8e:	48 01 c3             	add    %rax,%rbx
    1f91:	48 29 c2             	sub    %rax,%rdx
    1f94:	48 89 d0             	mov    %rdx,%rax
    1f97:	48 85 c0             	test   %rax,%rax
    1f9a:	48 89 ca             	mov    %rcx,%rdx
    1f9d:	0f 85 44 01 00 00    	jne    20e7 <iov_iter_advance+0x1d7>
    1fa3:	48 39 fb             	cmp    %rdi,%rbx
    1fa6:	75 06                	jne    1fae <iov_iter_advance+0x9e>
    1fa8:	48 83 c2 10          	add    $0x10,%rdx
    1fac:	31 db                	xor    %ebx,%ebx
    1fae:	48 89 d0             	mov    %rdx,%rax
    1fb1:	49 89 54 24 18       	mov    %rdx,0x18(%r12)
    1fb6:	48 29 c8             	sub    %rcx,%rax
    1fb9:	48 c1 f8 04          	sar    $0x4,%rax
    1fbd:	49 29 44 24 20       	sub    %rax,0x20(%r12)
    1fc2:	49 29 f0             	sub    %rsi,%r8
    1fc5:	49 89 5c 24 08       	mov    %rbx,0x8(%r12)
    1fca:	4d 89 44 24 10       	mov    %r8,0x10(%r12)
    1fcf:	48 83 c4 08          	add    $0x8,%rsp
    1fd3:	5b                   	pop    %rbx
    1fd4:	41 5c                	pop    %r12
    1fd6:	41 5d                	pop    %r13
    1fd8:	41 5e                	pop    %r14
    1fda:	41 5f                	pop    %r15
    1fdc:	5d                   	pop    %rbp
    1fdd:	c3                   	retq   
    1fde:	4c 39 c6             	cmp    %r8,%rsi
    1fe1:	4c 8b 7f 18          	mov    0x18(%rdi),%r15
    1fe5:	49 0f 47 f0          	cmova  %r8,%rsi
    1fe9:	48 85 f6             	test   %rsi,%rsi
    1fec:	74 62                	je     2050 <iov_iter_advance+0x140>
    1fee:	41 8b 47 5c          	mov    0x5c(%r15),%eax
    1ff2:	8b 57 20             	mov    0x20(%rdi),%edx
    1ff5:	4c 8b 5f 08          	mov    0x8(%rdi),%r11
    1ff9:	4d 8b 97 90 00 00 00 	mov    0x90(%r15),%r10
    2000:	44 8d 48 ff          	lea    -0x1(%rax),%r9d
    2004:	44 89 c9             	mov    %r9d,%ecx
    2007:	21 d1                	and    %edx,%ecx
    2009:	4d 85 db             	test   %r11,%r11
    200c:	48 8d 04 89          	lea    (%rcx,%rcx,4),%rax
    2010:	49 8d 3c c2          	lea    (%r10,%rax,8),%rdi
    2014:	48 89 f0             	mov    %rsi,%rax
    2017:	74 1f                	je     2038 <iov_iter_advance+0x128>
    2019:	8b 4f 08             	mov    0x8(%rdi),%ecx
    201c:	49 8d 04 33          	lea    (%r11,%rsi,1),%rax
    2020:	48 29 c8             	sub    %rcx,%rax
    2023:	eb 13                	jmp    2038 <iov_iter_advance+0x128>
    2025:	48 29 c8             	sub    %rcx,%rax
    2028:	83 c2 01             	add    $0x1,%edx
    202b:	44 89 c9             	mov    %r9d,%ecx
    202e:	21 d1                	and    %edx,%ecx
    2030:	48 8d 0c 89          	lea    (%rcx,%rcx,4),%rcx
    2034:	49 8d 3c ca          	lea    (%r10,%rcx,8),%rdi
    2038:	8b 4f 0c             	mov    0xc(%rdi),%ecx
    203b:	48 39 c1             	cmp    %rax,%rcx
    203e:	72 e5                	jb     2025 <iov_iter_advance+0x115>
    2040:	41 89 54 24 20       	mov    %edx,0x20(%r12)
    2045:	8b 57 08             	mov    0x8(%rdi),%edx
    2048:	48 01 d0             	add    %rdx,%rax
    204b:	49 89 44 24 08       	mov    %rax,0x8(%r12)
    2050:	49 29 f0             	sub    %rsi,%r8
    2053:	4d 89 44 24 10       	mov    %r8,0x10(%r12)
    2058:	41 8b 5f 50          	mov    0x50(%r15),%ebx
    205c:	41 39 5f 54          	cmp    %ebx,0x54(%r15)
    2060:	0f 84 69 ff ff ff    	je     1fcf <iov_iter_advance+0xbf>
    2066:	41 8b 47 5c          	mov    0x5c(%r15),%eax
    206a:	45 8b 6c 24 20       	mov    0x20(%r12),%r13d
    206f:	44 8d 70 ff          	lea    -0x1(%rax),%r14d
    2073:	49 8b 44 24 08       	mov    0x8(%r12),%rax
    2078:	48 85 c0             	test   %rax,%rax
    207b:	74 50                	je     20cd <iov_iter_advance+0x1bd>
    207d:	44 89 f2             	mov    %r14d,%edx
    2080:	44 21 ea             	and    %r13d,%edx
    2083:	41 83 c5 01          	add    $0x1,%r13d
    2087:	48 8d 0c 92          	lea    (%rdx,%rdx,4),%rcx
    208b:	49 8b 97 90 00 00 00 	mov    0x90(%r15),%rdx
    2092:	48 8d 14 ca          	lea    (%rdx,%rcx,8),%rdx
    2096:	2b 42 08             	sub    0x8(%rdx),%eax
    2099:	89 42 0c             	mov    %eax,0xc(%rdx)
    209c:	eb 2f                	jmp    20cd <iov_iter_advance+0x1bd>
    209e:	83 eb 01             	sub    $0x1,%ebx
    20a1:	44 89 f0             	mov    %r14d,%eax
    20a4:	4c 89 ff             	mov    %r15,%rdi
    20a7:	21 d8                	and    %ebx,%eax
    20a9:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
    20ad:	49 8b 87 90 00 00 00 	mov    0x90(%r15),%rax
    20b4:	48 8d 34 d0          	lea    (%rax,%rdx,8),%rsi
    20b8:	48 8b 46 10          	mov    0x10(%rsi),%rax
    20bc:	48 c7 46 10 00 00 00 	movq   $0x0,0x10(%rsi)
    20c3:	00 
    20c4:	48 8b 40 08          	mov    0x8(%rax),%rax
    20c8:	e8 00 00 00 00       	callq  20cd <iov_iter_advance+0x1bd>
    20cd:	44 39 eb             	cmp    %r13d,%ebx
    20d0:	75 cc                	jne    209e <iov_iter_advance+0x18e>
    20d2:	45 89 6f 50          	mov    %r13d,0x50(%r15)
    20d6:	e9 f4 fe ff ff       	jmpq   1fcf <iov_iter_advance+0xbf>
    20db:	49 29 f0             	sub    %rsi,%r8
    20de:	4c 89 47 10          	mov    %r8,0x10(%rdi)
    20e2:	e9 e8 fe ff ff       	jmpq   1fcf <iov_iter_advance+0xbf>
    20e7:	48 83 c2 10          	add    $0x10,%rdx
    20eb:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
    20ef:	48 39 f8             	cmp    %rdi,%rax
    20f2:	48 89 fb             	mov    %rdi,%rbx
    20f5:	48 0f 46 d8          	cmovbe %rax,%rbx
    20f9:	48 85 db             	test   %rbx,%rbx
    20fc:	74 e9                	je     20e7 <iov_iter_advance+0x1d7>
    20fe:	48 29 d8             	sub    %rbx,%rax
    2101:	0f 84 9c fe ff ff    	je     1fa3 <iov_iter_advance+0x93>
    2107:	eb de                	jmp    20e7 <iov_iter_advance+0x1d7>
    2109:	4c 8b 6f 18          	mov    0x18(%rdi),%r13
    210d:	41 89 f1             	mov    %esi,%r9d
    2110:	31 c9                	xor    %ecx,%ecx
    2112:	31 ff                	xor    %edi,%edi
    2114:	41 ba 00 10 00 00    	mov    $0x1000,%r10d
    211a:	49 89 fe             	mov    %rdi,%r14
    211d:	49 c1 e6 04          	shl    $0x4,%r14
    2121:	45 85 c9             	test   %r9d,%r9d
    2124:	4b 8d 54 35 00       	lea    0x0(%r13,%r14,1),%rdx
    2129:	74 70                	je     219b <iov_iter_advance+0x28b>
    212b:	44 8b 7a 0c          	mov    0xc(%rdx),%r15d
    212f:	8b 42 08             	mov    0x8(%rdx),%eax
    2132:	45 89 d3             	mov    %r10d,%r11d
    2135:	41 01 df             	add    %ebx,%r15d
    2138:	44 89 fa             	mov    %r15d,%edx
    213b:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    2141:	41 29 d3             	sub    %edx,%r11d
    2144:	44 89 da             	mov    %r11d,%edx
    2147:	41 89 c3             	mov    %eax,%r11d
    214a:	41 29 db             	sub    %ebx,%r11d
    214d:	45 39 cb             	cmp    %r9d,%r11d
    2150:	45 0f 47 d9          	cmova  %r9d,%r11d
    2154:	44 39 da             	cmp    %r11d,%edx
    2157:	41 0f 47 d3          	cmova  %r11d,%edx
    215b:	41 39 d1             	cmp    %edx,%r9d
    215e:	72 28                	jb     2188 <iov_iter_advance+0x278>
    2160:	41 29 d1             	sub    %edx,%r9d
    2163:	01 d3                	add    %edx,%ebx
    2165:	74 b3                	je     211a <iov_iter_advance+0x20a>
    2167:	39 d8                	cmp    %ebx,%eax
    2169:	77 af                	ja     211a <iov_iter_advance+0x20a>
    216b:	8d 79 01             	lea    0x1(%rcx),%edi
    216e:	48 89 fa             	mov    %rdi,%rdx
    2171:	48 89 f9             	mov    %rdi,%rcx
    2174:	48 c1 e2 04          	shl    $0x4,%rdx
    2178:	4c 01 ea             	add    %r13,%rdx
    217b:	29 c3                	sub    %eax,%ebx
    217d:	74 9b                	je     211a <iov_iter_advance+0x20a>
    217f:	8b 42 08             	mov    0x8(%rdx),%eax
    2182:	39 d8                	cmp    %ebx,%eax
    2184:	76 e5                	jbe    216b <iov_iter_advance+0x25b>
    2186:	eb 92                	jmp    211a <iov_iter_advance+0x20a>
    2188:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 218f <iov_iter_advance+0x27f>
    218f:	4c 89 ea             	mov    %r13,%rdx
    2192:	0f 84 a0 00 00 00    	je     2238 <iov_iter_advance+0x328>
    2198:	4c 01 f2             	add    %r14,%rdx
    219b:	49 89 54 24 18       	mov    %rdx,0x18(%r12)
    21a0:	4c 29 ea             	sub    %r13,%rdx
    21a3:	89 db                	mov    %ebx,%ebx
    21a5:	48 c1 fa 04          	sar    $0x4,%rdx
    21a9:	49 29 54 24 20       	sub    %rdx,0x20(%r12)
    21ae:	e9 0f fe ff ff       	jmpq   1fc2 <iov_iter_advance+0xb2>
    21b3:	48 8b 57 18          	mov    0x18(%rdi),%rdx
    21b7:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
    21bb:	48 89 f8             	mov    %rdi,%rax
    21be:	48 29 d8             	sub    %rbx,%rax
    21c1:	48 39 f0             	cmp    %rsi,%rax
    21c4:	48 0f 47 c6          	cmova  %rsi,%rax
    21c8:	48 85 c0             	test   %rax,%rax
    21cb:	74 66                	je     2233 <iov_iter_advance+0x323>
    21cd:	48 89 f1             	mov    %rsi,%rcx
    21d0:	48 01 c3             	add    %rax,%rbx
    21d3:	48 29 c1             	sub    %rax,%rcx
    21d6:	48 89 c8             	mov    %rcx,%rax
    21d9:	48 85 c0             	test   %rax,%rax
    21dc:	48 89 d1             	mov    %rdx,%rcx
    21df:	75 24                	jne    2205 <iov_iter_advance+0x2f5>
    21e1:	48 39 fb             	cmp    %rdi,%rbx
    21e4:	75 06                	jne    21ec <iov_iter_advance+0x2dc>
    21e6:	48 83 c1 10          	add    $0x10,%rcx
    21ea:	31 db                	xor    %ebx,%ebx
    21ec:	48 89 c8             	mov    %rcx,%rax
    21ef:	49 89 4c 24 18       	mov    %rcx,0x18(%r12)
    21f4:	48 29 d0             	sub    %rdx,%rax
    21f7:	48 c1 f8 04          	sar    $0x4,%rax
    21fb:	49 29 44 24 20       	sub    %rax,0x20(%r12)
    2200:	e9 bd fd ff ff       	jmpq   1fc2 <iov_iter_advance+0xb2>
    2205:	48 83 c1 10          	add    $0x10,%rcx
    2209:	48 8b 79 08          	mov    0x8(%rcx),%rdi
    220d:	48 39 f8             	cmp    %rdi,%rax
    2210:	48 89 fb             	mov    %rdi,%rbx
    2213:	48 0f 46 d8          	cmovbe %rax,%rbx
    2217:	48 85 db             	test   %rbx,%rbx
    221a:	74 e9                	je     2205 <iov_iter_advance+0x2f5>
    221c:	48 29 d8             	sub    %rbx,%rax
    221f:	74 c0                	je     21e1 <iov_iter_advance+0x2d1>
    2221:	eb e2                	jmp    2205 <iov_iter_advance+0x2f5>
    2223:	48 01 f3             	add    %rsi,%rbx
    2226:	e9 97 fd ff ff       	jmpq   1fc2 <iov_iter_advance+0xb2>
    222b:	48 89 f0             	mov    %rsi,%rax
    222e:	e9 64 fd ff ff       	jmpq   1f97 <iov_iter_advance+0x87>
    2233:	48 89 f0             	mov    %rsi,%rax
    2236:	eb a1                	jmp    21d9 <iov_iter_advance+0x2c9>
    2238:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    223f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    2243:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 224a <iov_iter_advance+0x33a>
    224a:	e8 00 00 00 00       	callq  224f <iov_iter_advance+0x33f>
    224f:	0f 0b                	ud2    
    2251:	49 8b 54 24 18       	mov    0x18(%r12),%rdx
    2256:	4d 8b 44 24 10       	mov    0x10(%r12),%r8
    225b:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    225f:	e9 34 ff ff ff       	jmpq   2198 <iov_iter_advance+0x288>
    2264:	66 90                	xchg   %ax,%ax
    2266:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    226d:	00 00 00 

0000000000002270 <_copy_from_iter_full>:
    2270:	55                   	push   %rbp
    2271:	48 89 e5             	mov    %rsp,%rbp
    2274:	41 57                	push   %r15
    2276:	41 56                	push   %r14
    2278:	41 55                	push   %r13
    227a:	41 54                	push   %r12
    227c:	53                   	push   %rbx
    227d:	48 89 d3             	mov    %rdx,%rbx
    2280:	48 83 ec 10          	sub    $0x10,%rsp
    2284:	8b 02                	mov    (%rdx),%eax
    2286:	89 c2                	mov    %eax,%edx
    2288:	83 e2 fe             	and    $0xfffffffe,%edx
    228b:	83 fa 20             	cmp    $0x20,%edx
    228e:	0f 84 ae 01 00 00    	je     2442 <_copy_from_iter_full+0x1d2>
    2294:	48 39 73 10          	cmp    %rsi,0x10(%rbx)
    2298:	49 89 f4             	mov    %rsi,%r12
    229b:	0f 82 46 01 00 00    	jb     23e7 <_copy_from_iter_full+0x177>
    22a1:	48 85 f6             	test   %rsi,%rsi
    22a4:	74 64                	je     230a <_copy_from_iter_full+0x9a>
    22a6:	45 31 c9             	xor    %r9d,%r9d
    22a9:	a8 10                	test   $0x10,%al
    22ab:	49 89 fd             	mov    %rdi,%r13
    22ae:	4c 8b 43 08          	mov    0x8(%rbx),%r8
    22b2:	41 89 f3             	mov    %esi,%r11d
    22b5:	41 be 00 10 00 00    	mov    $0x1000,%r14d
    22bb:	0f 85 92 00 00 00    	jne    2353 <_copy_from_iter_full+0xe3>
    22c1:	a8 08                	test   $0x8,%al
    22c3:	0f 85 8c 01 00 00    	jne    2455 <_copy_from_iter_full+0x1e5>
    22c9:	a8 40                	test   $0x40,%al
    22cb:	75 3d                	jne    230a <_copy_from_iter_full+0x9a>
    22cd:	4c 8b 7b 18          	mov    0x18(%rbx),%r15
    22d1:	4d 8b 77 08          	mov    0x8(%r15),%r14
    22d5:	4d 29 c6             	sub    %r8,%r14
    22d8:	49 39 f6             	cmp    %rsi,%r14
    22db:	4c 0f 47 f6          	cmova  %rsi,%r14
    22df:	4d 85 f6             	test   %r14,%r14
    22e2:	0f 84 10 01 00 00    	je     23f8 <_copy_from_iter_full+0x188>
    22e8:	49 8b 37             	mov    (%r15),%rsi
    22eb:	4c 89 f2             	mov    %r14,%rdx
    22ee:	4c 01 c6             	add    %r8,%rsi
    22f1:	e8 ea e8 ff ff       	callq  be0 <copyin>
    22f6:	85 c0                	test   %eax,%eax
    22f8:	0f 85 e9 00 00 00    	jne    23e7 <_copy_from_iter_full+0x177>
    22fe:	4c 89 e1             	mov    %r12,%rcx
    2301:	4c 29 f1             	sub    %r14,%rcx
    2304:	0f 85 cd 01 00 00    	jne    24d7 <_copy_from_iter_full+0x267>
    230a:	4c 89 e6             	mov    %r12,%rsi
    230d:	48 89 df             	mov    %rbx,%rdi
    2310:	e8 00 00 00 00       	callq  2315 <_copy_from_iter_full+0xa5>
    2315:	48 83 c4 10          	add    $0x10,%rsp
    2319:	b8 01 00 00 00       	mov    $0x1,%eax
    231e:	5b                   	pop    %rbx
    231f:	41 5c                	pop    %r12
    2321:	41 5d                	pop    %r13
    2323:	41 5e                	pop    %r14
    2325:	41 5f                	pop    %r15
    2327:	5d                   	pop    %rbp
    2328:	c3                   	retq   
    2329:	48 8b 4b 18          	mov    0x18(%rbx),%rcx
    232d:	4d 89 fd             	mov    %r15,%r13
    2330:	45 29 d3             	sub    %r10d,%r11d
    2333:	45 01 d0             	add    %r10d,%r8d
    2336:	75 12                	jne    234a <_copy_from_iter_full+0xda>
    2338:	eb 19                	jmp    2353 <_copy_from_iter_full+0xe3>
    233a:	41 83 c1 01          	add    $0x1,%r9d
    233e:	41 29 c0             	sub    %eax,%r8d
    2341:	74 10                	je     2353 <_copy_from_iter_full+0xe3>
    2343:	44 89 c8             	mov    %r9d,%eax
    2346:	48 c1 e0 04          	shl    $0x4,%rax
    234a:	8b 44 01 08          	mov    0x8(%rcx,%rax,1),%eax
    234e:	44 39 c0             	cmp    %r8d,%eax
    2351:	76 e7                	jbe    233a <_copy_from_iter_full+0xca>
    2353:	45 85 db             	test   %r11d,%r11d
    2356:	74 b2                	je     230a <_copy_from_iter_full+0x9a>
    2358:	48 8b 4b 18          	mov    0x18(%rbx),%rcx
    235c:	44 89 c8             	mov    %r9d,%eax
    235f:	45 89 f7             	mov    %r14d,%r15d
    2362:	48 c1 e0 04          	shl    $0x4,%rax
    2366:	48 8d 3c 01          	lea    (%rcx,%rax,1),%rdi
    236a:	8b 77 0c             	mov    0xc(%rdi),%esi
    236d:	44 8b 57 08          	mov    0x8(%rdi),%r10d
    2371:	44 01 c6             	add    %r8d,%esi
    2374:	45 29 c2             	sub    %r8d,%r10d
    2377:	89 f2                	mov    %esi,%edx
    2379:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    237f:	45 39 da             	cmp    %r11d,%r10d
    2382:	45 0f 47 d3          	cmova  %r11d,%r10d
    2386:	41 29 d7             	sub    %edx,%r15d
    2389:	45 39 fa             	cmp    %r15d,%r10d
    238c:	45 0f 47 d7          	cmova  %r15d,%r10d
    2390:	45 85 d2             	test   %r10d,%r10d
    2393:	74 9b                	je     2330 <_copy_from_iter_full+0xc0>
    2395:	c1 ee 0c             	shr    $0xc,%esi
    2398:	44 89 d1             	mov    %r10d,%ecx
    239b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    239f:	48 c1 e6 06          	shl    $0x6,%rsi
    23a3:	48 03 37             	add    (%rdi),%rsi
    23a6:	4c 89 ef             	mov    %r13,%rdi
    23a9:	4d 8d 7c 0d 00       	lea    0x0(%r13,%rcx,1),%r15
    23ae:	e8 3d e0 ff ff       	callq  3f0 <memcpy_from_page>
    23b3:	45 39 d3             	cmp    %r10d,%r11d
    23b6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    23ba:	0f 83 69 ff ff ff    	jae    2329 <_copy_from_iter_full+0xb9>
    23c0:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 23c7 <_copy_from_iter_full+0x157>
    23c7:	0f 85 3d ff ff ff    	jne    230a <_copy_from_iter_full+0x9a>
    23cd:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    23d4:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 23db <_copy_from_iter_full+0x16b>
    23db:	e8 00 00 00 00       	callq  23e0 <_copy_from_iter_full+0x170>
    23e0:	0f 0b                	ud2    
    23e2:	e9 23 ff ff ff       	jmpq   230a <_copy_from_iter_full+0x9a>
    23e7:	48 83 c4 10          	add    $0x10,%rsp
    23eb:	31 c0                	xor    %eax,%eax
    23ed:	5b                   	pop    %rbx
    23ee:	41 5c                	pop    %r12
    23f0:	41 5d                	pop    %r13
    23f2:	41 5e                	pop    %r14
    23f4:	41 5f                	pop    %r15
    23f6:	5d                   	pop    %rbp
    23f7:	c3                   	retq   
    23f8:	48 89 f1             	mov    %rsi,%rcx
    23fb:	49 83 c7 10          	add    $0x10,%r15
    23ff:	49 89 ce             	mov    %rcx,%r14
    2402:	49 39 4f 08          	cmp    %rcx,0x8(%r15)
    2406:	4d 0f 46 77 08       	cmovbe 0x8(%r15),%r14
    240b:	4d 85 f6             	test   %r14,%r14
    240e:	74 eb                	je     23fb <_copy_from_iter_full+0x18b>
    2410:	49 8b 37             	mov    (%r15),%rsi
    2413:	4b 8d 44 35 00       	lea    0x0(%r13,%r14,1),%rax
    2418:	4c 89 f2             	mov    %r14,%rdx
    241b:	4c 89 ef             	mov    %r13,%rdi
    241e:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    2422:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    2426:	e8 b5 e7 ff ff       	callq  be0 <copyin>
    242b:	85 c0                	test   %eax,%eax
    242d:	75 b8                	jne    23e7 <_copy_from_iter_full+0x177>
    242f:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    2433:	4c 29 f1             	sub    %r14,%rcx
    2436:	0f 84 ce fe ff ff    	je     230a <_copy_from_iter_full+0x9a>
    243c:	4c 8b 6d c8          	mov    -0x38(%rbp),%r13
    2440:	eb b9                	jmp    23fb <_copy_from_iter_full+0x18b>
    2442:	0f 0b                	ud2    
    2444:	48 83 c4 10          	add    $0x10,%rsp
    2448:	31 c0                	xor    %eax,%eax
    244a:	5b                   	pop    %rbx
    244b:	41 5c                	pop    %r12
    244d:	41 5d                	pop    %r13
    244f:	41 5e                	pop    %r14
    2451:	41 5f                	pop    %r15
    2453:	5d                   	pop    %rbp
    2454:	c3                   	retq   
    2455:	4c 8b 7b 18          	mov    0x18(%rbx),%r15
    2459:	4d 8b 77 08          	mov    0x8(%r15),%r14
    245d:	4d 29 c6             	sub    %r8,%r14
    2460:	49 39 f6             	cmp    %rsi,%r14
    2463:	4c 0f 47 f6          	cmova  %rsi,%r14
    2467:	4d 85 f6             	test   %r14,%r14
    246a:	74 1f                	je     248b <_copy_from_iter_full+0x21b>
    246c:	49 8b 37             	mov    (%r15),%rsi
    246f:	4c 89 f2             	mov    %r14,%rdx
    2472:	4c 01 c6             	add    %r8,%rsi
    2475:	e8 00 00 00 00       	callq  247a <_copy_from_iter_full+0x20a>
    247a:	4c 89 e1             	mov    %r12,%rcx
    247d:	4c 29 f1             	sub    %r14,%rcx
    2480:	0f 84 84 fe ff ff    	je     230a <_copy_from_iter_full+0x9a>
    2486:	4d 01 f5             	add    %r14,%r13
    2489:	eb 03                	jmp    248e <_copy_from_iter_full+0x21e>
    248b:	48 89 f1             	mov    %rsi,%rcx
    248e:	49 83 c7 10          	add    $0x10,%r15
    2492:	49 89 ce             	mov    %rcx,%r14
    2495:	49 39 4f 08          	cmp    %rcx,0x8(%r15)
    2499:	4d 0f 46 77 08       	cmovbe 0x8(%r15),%r14
    249e:	4d 85 f6             	test   %r14,%r14
    24a1:	74 2e                	je     24d1 <_copy_from_iter_full+0x261>
    24a3:	49 8b 37             	mov    (%r15),%rsi
    24a6:	4b 8d 44 35 00       	lea    0x0(%r13,%r14,1),%rax
    24ab:	4c 89 f2             	mov    %r14,%rdx
    24ae:	4c 89 ef             	mov    %r13,%rdi
    24b1:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    24b5:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    24b9:	e8 00 00 00 00       	callq  24be <_copy_from_iter_full+0x24e>
    24be:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    24c2:	4c 29 f1             	sub    %r14,%rcx
    24c5:	0f 84 3f fe ff ff    	je     230a <_copy_from_iter_full+0x9a>
    24cb:	4c 8b 6d d0          	mov    -0x30(%rbp),%r13
    24cf:	eb bd                	jmp    248e <_copy_from_iter_full+0x21e>
    24d1:	4c 89 6d d0          	mov    %r13,-0x30(%rbp)
    24d5:	eb f4                	jmp    24cb <_copy_from_iter_full+0x25b>
    24d7:	4d 01 f5             	add    %r14,%r13
    24da:	e9 1c ff ff ff       	jmpq   23fb <_copy_from_iter_full+0x18b>
    24df:	90                   	nop

00000000000024e0 <_copy_from_iter_full_nocache>:
    24e0:	55                   	push   %rbp
    24e1:	48 89 e5             	mov    %rsp,%rbp
    24e4:	41 57                	push   %r15
    24e6:	41 56                	push   %r14
    24e8:	41 55                	push   %r13
    24ea:	41 54                	push   %r12
    24ec:	53                   	push   %rbx
    24ed:	48 89 d3             	mov    %rdx,%rbx
    24f0:	48 83 ec 10          	sub    $0x10,%rsp
    24f4:	8b 02                	mov    (%rdx),%eax
    24f6:	89 c2                	mov    %eax,%edx
    24f8:	83 e2 fe             	and    $0xfffffffe,%edx
    24fb:	83 fa 20             	cmp    $0x20,%edx
    24fe:	0f 84 b2 01 00 00    	je     26b6 <_copy_from_iter_full_nocache+0x1d6>
    2504:	48 39 73 10          	cmp    %rsi,0x10(%rbx)
    2508:	49 89 f4             	mov    %rsi,%r12
    250b:	0f 82 48 01 00 00    	jb     2659 <_copy_from_iter_full_nocache+0x179>
    2511:	48 85 f6             	test   %rsi,%rsi
    2514:	74 66                	je     257c <_copy_from_iter_full_nocache+0x9c>
    2516:	45 31 c9             	xor    %r9d,%r9d
    2519:	a8 10                	test   $0x10,%al
    251b:	49 89 fd             	mov    %rdi,%r13
    251e:	4c 8b 43 08          	mov    0x8(%rbx),%r8
    2522:	41 89 f3             	mov    %esi,%r11d
    2525:	41 be 00 10 00 00    	mov    $0x1000,%r14d
    252b:	0f 85 94 00 00 00    	jne    25c5 <_copy_from_iter_full_nocache+0xe5>
    2531:	a8 08                	test   $0x8,%al
    2533:	0f 85 90 01 00 00    	jne    26c9 <_copy_from_iter_full_nocache+0x1e9>
    2539:	a8 40                	test   $0x40,%al
    253b:	75 3f                	jne    257c <_copy_from_iter_full_nocache+0x9c>
    253d:	4c 8b 7b 18          	mov    0x18(%rbx),%r15
    2541:	4d 8b 77 08          	mov    0x8(%r15),%r14
    2545:	4d 29 c6             	sub    %r8,%r14
    2548:	49 39 f6             	cmp    %rsi,%r14
    254b:	4c 0f 47 f6          	cmova  %rsi,%r14
    254f:	4d 85 f6             	test   %r14,%r14
    2552:	0f 84 12 01 00 00    	je     266a <_copy_from_iter_full_nocache+0x18a>
    2558:	49 8b 37             	mov    (%r15),%rsi
    255b:	31 c9                	xor    %ecx,%ecx
    255d:	44 89 f2             	mov    %r14d,%edx
    2560:	4c 01 c6             	add    %r8,%rsi
    2563:	e8 00 00 00 00       	callq  2568 <_copy_from_iter_full_nocache+0x88>
    2568:	85 c0                	test   %eax,%eax
    256a:	0f 85 e9 00 00 00    	jne    2659 <_copy_from_iter_full_nocache+0x179>
    2570:	4d 89 e0             	mov    %r12,%r8
    2573:	4d 29 f0             	sub    %r14,%r8
    2576:	0f 85 cf 01 00 00    	jne    274b <_copy_from_iter_full_nocache+0x26b>
    257c:	4c 89 e6             	mov    %r12,%rsi
    257f:	48 89 df             	mov    %rbx,%rdi
    2582:	e8 00 00 00 00       	callq  2587 <_copy_from_iter_full_nocache+0xa7>
    2587:	48 83 c4 10          	add    $0x10,%rsp
    258b:	b8 01 00 00 00       	mov    $0x1,%eax
    2590:	5b                   	pop    %rbx
    2591:	41 5c                	pop    %r12
    2593:	41 5d                	pop    %r13
    2595:	41 5e                	pop    %r14
    2597:	41 5f                	pop    %r15
    2599:	5d                   	pop    %rbp
    259a:	c3                   	retq   
    259b:	48 8b 4b 18          	mov    0x18(%rbx),%rcx
    259f:	4d 89 fd             	mov    %r15,%r13
    25a2:	45 29 d3             	sub    %r10d,%r11d
    25a5:	45 01 d0             	add    %r10d,%r8d
    25a8:	75 12                	jne    25bc <_copy_from_iter_full_nocache+0xdc>
    25aa:	eb 19                	jmp    25c5 <_copy_from_iter_full_nocache+0xe5>
    25ac:	41 83 c1 01          	add    $0x1,%r9d
    25b0:	41 29 c0             	sub    %eax,%r8d
    25b3:	74 10                	je     25c5 <_copy_from_iter_full_nocache+0xe5>
    25b5:	44 89 c8             	mov    %r9d,%eax
    25b8:	48 c1 e0 04          	shl    $0x4,%rax
    25bc:	8b 44 01 08          	mov    0x8(%rcx,%rax,1),%eax
    25c0:	44 39 c0             	cmp    %r8d,%eax
    25c3:	76 e7                	jbe    25ac <_copy_from_iter_full_nocache+0xcc>
    25c5:	45 85 db             	test   %r11d,%r11d
    25c8:	74 b2                	je     257c <_copy_from_iter_full_nocache+0x9c>
    25ca:	48 8b 4b 18          	mov    0x18(%rbx),%rcx
    25ce:	44 89 c8             	mov    %r9d,%eax
    25d1:	45 89 f7             	mov    %r14d,%r15d
    25d4:	48 c1 e0 04          	shl    $0x4,%rax
    25d8:	48 8d 3c 01          	lea    (%rcx,%rax,1),%rdi
    25dc:	8b 77 0c             	mov    0xc(%rdi),%esi
    25df:	44 8b 57 08          	mov    0x8(%rdi),%r10d
    25e3:	44 01 c6             	add    %r8d,%esi
    25e6:	45 29 c2             	sub    %r8d,%r10d
    25e9:	89 f2                	mov    %esi,%edx
    25eb:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    25f1:	45 39 da             	cmp    %r11d,%r10d
    25f4:	45 0f 47 d3          	cmova  %r11d,%r10d
    25f8:	41 29 d7             	sub    %edx,%r15d
    25fb:	45 39 fa             	cmp    %r15d,%r10d
    25fe:	45 0f 47 d7          	cmova  %r15d,%r10d
    2602:	45 85 d2             	test   %r10d,%r10d
    2605:	74 9b                	je     25a2 <_copy_from_iter_full_nocache+0xc2>
    2607:	c1 ee 0c             	shr    $0xc,%esi
    260a:	44 89 d1             	mov    %r10d,%ecx
    260d:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2611:	48 c1 e6 06          	shl    $0x6,%rsi
    2615:	48 03 37             	add    (%rdi),%rsi
    2618:	4c 89 ef             	mov    %r13,%rdi
    261b:	4d 8d 7c 0d 00       	lea    0x0(%r13,%rcx,1),%r15
    2620:	e8 cb dd ff ff       	callq  3f0 <memcpy_from_page>
    2625:	45 39 d3             	cmp    %r10d,%r11d
    2628:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    262c:	0f 83 69 ff ff ff    	jae    259b <_copy_from_iter_full_nocache+0xbb>
    2632:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 2639 <_copy_from_iter_full_nocache+0x159>
    2639:	0f 85 3d ff ff ff    	jne    257c <_copy_from_iter_full_nocache+0x9c>
    263f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    2646:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 264d <_copy_from_iter_full_nocache+0x16d>
    264d:	e8 00 00 00 00       	callq  2652 <_copy_from_iter_full_nocache+0x172>
    2652:	0f 0b                	ud2    
    2654:	e9 23 ff ff ff       	jmpq   257c <_copy_from_iter_full_nocache+0x9c>
    2659:	48 83 c4 10          	add    $0x10,%rsp
    265d:	31 c0                	xor    %eax,%eax
    265f:	5b                   	pop    %rbx
    2660:	41 5c                	pop    %r12
    2662:	41 5d                	pop    %r13
    2664:	41 5e                	pop    %r14
    2666:	41 5f                	pop    %r15
    2668:	5d                   	pop    %rbp
    2669:	c3                   	retq   
    266a:	49 89 f0             	mov    %rsi,%r8
    266d:	49 83 c7 10          	add    $0x10,%r15
    2671:	4d 89 c6             	mov    %r8,%r14
    2674:	4d 39 47 08          	cmp    %r8,0x8(%r15)
    2678:	4d 0f 46 77 08       	cmovbe 0x8(%r15),%r14
    267d:	4d 85 f6             	test   %r14,%r14
    2680:	74 eb                	je     266d <_copy_from_iter_full_nocache+0x18d>
    2682:	49 8b 37             	mov    (%r15),%rsi
    2685:	4b 8d 44 35 00       	lea    0x0(%r13,%r14,1),%rax
    268a:	31 c9                	xor    %ecx,%ecx
    268c:	44 89 f2             	mov    %r14d,%edx
    268f:	4c 89 ef             	mov    %r13,%rdi
    2692:	4c 89 45 d0          	mov    %r8,-0x30(%rbp)
    2696:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    269a:	e8 00 00 00 00       	callq  269f <_copy_from_iter_full_nocache+0x1bf>
    269f:	85 c0                	test   %eax,%eax
    26a1:	75 b6                	jne    2659 <_copy_from_iter_full_nocache+0x179>
    26a3:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
    26a7:	4d 29 f0             	sub    %r14,%r8
    26aa:	0f 84 cc fe ff ff    	je     257c <_copy_from_iter_full_nocache+0x9c>
    26b0:	4c 8b 6d c8          	mov    -0x38(%rbp),%r13
    26b4:	eb b7                	jmp    266d <_copy_from_iter_full_nocache+0x18d>
    26b6:	0f 0b                	ud2    
    26b8:	48 83 c4 10          	add    $0x10,%rsp
    26bc:	31 c0                	xor    %eax,%eax
    26be:	5b                   	pop    %rbx
    26bf:	41 5c                	pop    %r12
    26c1:	41 5d                	pop    %r13
    26c3:	41 5e                	pop    %r14
    26c5:	41 5f                	pop    %r15
    26c7:	5d                   	pop    %rbp
    26c8:	c3                   	retq   
    26c9:	4c 8b 7b 18          	mov    0x18(%rbx),%r15
    26cd:	4d 8b 77 08          	mov    0x8(%r15),%r14
    26d1:	4d 29 c6             	sub    %r8,%r14
    26d4:	49 39 f6             	cmp    %rsi,%r14
    26d7:	4c 0f 47 f6          	cmova  %rsi,%r14
    26db:	4d 85 f6             	test   %r14,%r14
    26de:	74 1f                	je     26ff <_copy_from_iter_full_nocache+0x21f>
    26e0:	49 8b 37             	mov    (%r15),%rsi
    26e3:	4c 89 f2             	mov    %r14,%rdx
    26e6:	4c 01 c6             	add    %r8,%rsi
    26e9:	e8 00 00 00 00       	callq  26ee <_copy_from_iter_full_nocache+0x20e>
    26ee:	4c 89 e1             	mov    %r12,%rcx
    26f1:	4c 29 f1             	sub    %r14,%rcx
    26f4:	0f 84 82 fe ff ff    	je     257c <_copy_from_iter_full_nocache+0x9c>
    26fa:	4d 01 f5             	add    %r14,%r13
    26fd:	eb 03                	jmp    2702 <_copy_from_iter_full_nocache+0x222>
    26ff:	48 89 f1             	mov    %rsi,%rcx
    2702:	49 83 c7 10          	add    $0x10,%r15
    2706:	49 89 ce             	mov    %rcx,%r14
    2709:	49 39 4f 08          	cmp    %rcx,0x8(%r15)
    270d:	4d 0f 46 77 08       	cmovbe 0x8(%r15),%r14
    2712:	4d 85 f6             	test   %r14,%r14
    2715:	74 2e                	je     2745 <_copy_from_iter_full_nocache+0x265>
    2717:	49 8b 37             	mov    (%r15),%rsi
    271a:	4b 8d 44 35 00       	lea    0x0(%r13,%r14,1),%rax
    271f:	4c 89 f2             	mov    %r14,%rdx
    2722:	4c 89 ef             	mov    %r13,%rdi
    2725:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    2729:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    272d:	e8 00 00 00 00       	callq  2732 <_copy_from_iter_full_nocache+0x252>
    2732:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    2736:	4c 29 f1             	sub    %r14,%rcx
    2739:	0f 84 3d fe ff ff    	je     257c <_copy_from_iter_full_nocache+0x9c>
    273f:	4c 8b 6d d0          	mov    -0x30(%rbp),%r13
    2743:	eb bd                	jmp    2702 <_copy_from_iter_full_nocache+0x222>
    2745:	4c 89 6d d0          	mov    %r13,-0x30(%rbp)
    2749:	eb f4                	jmp    273f <_copy_from_iter_full_nocache+0x25f>
    274b:	4d 01 f5             	add    %r14,%r13
    274e:	e9 1a ff ff ff       	jmpq   266d <_copy_from_iter_full_nocache+0x18d>
    2753:	0f 1f 00             	nopl   (%rax)
    2756:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    275d:	00 00 00 

0000000000002760 <csum_and_copy_from_iter_full>:
    2760:	55                   	push   %rbp
    2761:	49 89 d3             	mov    %rdx,%r11
    2764:	48 89 e5             	mov    %rsp,%rbp
    2767:	41 57                	push   %r15
    2769:	41 56                	push   %r14
    276b:	41 55                	push   %r13
    276d:	41 54                	push   %r12
    276f:	53                   	push   %rbx
    2770:	48 83 ec 50          	sub    $0x50,%rsp
    2774:	8b 11                	mov    (%rcx),%edx
    2776:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    277d:	00 00 
    277f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2783:	31 c0                	xor    %eax,%eax
    2785:	89 d0                	mov    %edx,%eax
    2787:	83 e0 fe             	and    $0xfffffffe,%eax
    278a:	83 e8 20             	sub    $0x20,%eax
    278d:	83 e0 de             	and    $0xffffffde,%eax
    2790:	0f 84 eb 00 00 00    	je     2881 <csum_and_copy_from_iter_full+0x121>
    2796:	48 39 71 10          	cmp    %rsi,0x10(%rcx)
    279a:	49 89 f1             	mov    %rsi,%r9
    279d:	49 89 ce             	mov    %rcx,%r14
    27a0:	0f 82 d7 00 00 00    	jb     287d <csum_and_copy_from_iter_full+0x11d>
    27a6:	41 8b 03             	mov    (%r11),%eax
    27a9:	48 85 f6             	test   %rsi,%rsi
    27ac:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    27af:	0f 84 90 00 00 00    	je     2845 <csum_and_copy_from_iter_full+0xe5>
    27b5:	f6 c2 10             	test   $0x10,%dl
    27b8:	49 89 fa             	mov    %rdi,%r10
    27bb:	48 8b 59 08          	mov    0x8(%rcx),%rbx
    27bf:	0f 85 c2 00 00 00    	jne    2887 <csum_and_copy_from_iter_full+0x127>
    27c5:	f6 c2 08             	test   $0x8,%dl
    27c8:	0f 85 fe 01 00 00    	jne    29cc <csum_and_copy_from_iter_full+0x26c>
    27ce:	83 e2 40             	and    $0x40,%edx
    27d1:	75 72                	jne    2845 <csum_and_copy_from_iter_full+0xe5>
    27d3:	4c 8b 79 18          	mov    0x18(%rcx),%r15
    27d7:	4d 8b 67 08          	mov    0x8(%r15),%r12
    27db:	49 29 dc             	sub    %rbx,%r12
    27de:	49 39 f4             	cmp    %rsi,%r12
    27e1:	4c 0f 47 e6          	cmova  %rsi,%r12
    27e5:	4d 85 e4             	test   %r12,%r12
    27e8:	0f 84 51 02 00 00    	je     2a3f <csum_and_copy_from_iter_full+0x2df>
    27ee:	49 8b 3f             	mov    (%r15),%rdi
    27f1:	4c 8d 6d cc          	lea    -0x34(%rbp),%r13
    27f5:	31 c9                	xor    %ecx,%ecx
    27f7:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
    27fb:	44 89 e2             	mov    %r12d,%edx
    27fe:	4c 89 d6             	mov    %r10,%rsi
    2801:	4d 89 e8             	mov    %r13,%r8
    2804:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    2808:	4c 89 55 b8          	mov    %r10,-0x48(%rbp)
    280c:	48 01 df             	add    %rbx,%rdi
    280f:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    2816:	e8 00 00 00 00       	callq  281b <csum_and_copy_from_iter_full+0xbb>
    281b:	8b 4d cc             	mov    -0x34(%rbp),%ecx
    281e:	4c 8b 55 b8          	mov    -0x48(%rbp),%r10
    2822:	4c 8b 4d b0          	mov    -0x50(%rbp),%r9
    2826:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    282a:	85 c9                	test   %ecx,%ecx
    282c:	75 4f                	jne    287d <csum_and_copy_from_iter_full+0x11d>
    282e:	4c 89 cb             	mov    %r9,%rbx
    2831:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    2834:	01 c2                	add    %eax,%edx
    2836:	83 d2 00             	adc    $0x0,%edx
    2839:	4c 29 e3             	sub    %r12,%rbx
    283c:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    283f:	0f 85 4e 03 00 00    	jne    2b93 <csum_and_copy_from_iter_full+0x433>
    2845:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    2848:	4c 89 ce             	mov    %r9,%rsi
    284b:	4c 89 f7             	mov    %r14,%rdi
    284e:	41 89 03             	mov    %eax,(%r11)
    2851:	e8 00 00 00 00       	callq  2856 <csum_and_copy_from_iter_full+0xf6>
    2856:	b8 01 00 00 00       	mov    $0x1,%eax
    285b:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    285f:	65 48 33 34 25 28 00 	xor    %gs:0x28,%rsi
    2866:	00 00 
    2868:	0f 85 20 03 00 00    	jne    2b8e <csum_and_copy_from_iter_full+0x42e>
    286e:	48 83 c4 50          	add    $0x50,%rsp
    2872:	5b                   	pop    %rbx
    2873:	41 5c                	pop    %r12
    2875:	41 5d                	pop    %r13
    2877:	41 5e                	pop    %r14
    2879:	41 5f                	pop    %r15
    287b:	5d                   	pop    %rbp
    287c:	c3                   	retq   
    287d:	31 c0                	xor    %eax,%eax
    287f:	eb da                	jmp    285b <csum_and_copy_from_iter_full+0xfb>
    2881:	0f 0b                	ud2    
    2883:	31 c0                	xor    %eax,%eax
    2885:	eb d4                	jmp    285b <csum_and_copy_from_iter_full+0xfb>
    2887:	41 89 f7             	mov    %esi,%r15d
    288a:	45 31 ed             	xor    %r13d,%r13d
    288d:	48 c7 45 b8 00 00 00 	movq   $0x0,-0x48(%rbp)
    2894:	00 
    2895:	48 89 fe             	mov    %rdi,%rsi
    2898:	4c 89 4d 88          	mov    %r9,-0x78(%rbp)
    289c:	49 89 ca             	mov    %rcx,%r10
    289f:	45 85 ff             	test   %r15d,%r15d
    28a2:	0f 84 66 02 00 00    	je     2b0e <csum_and_copy_from_iter_full+0x3ae>
    28a8:	49 8b 42 18          	mov    0x18(%r10),%rax
    28ac:	45 89 ee             	mov    %r13d,%r14d
    28af:	41 b8 00 10 00 00    	mov    $0x1000,%r8d
    28b5:	49 c1 e6 04          	shl    $0x4,%r14
    28b9:	4a 8d 3c 30          	lea    (%rax,%r14,1),%rdi
    28bd:	8b 57 0c             	mov    0xc(%rdi),%edx
    28c0:	44 8b 67 08          	mov    0x8(%rdi),%r12d
    28c4:	01 da                	add    %ebx,%edx
    28c6:	41 29 dc             	sub    %ebx,%r12d
    28c9:	89 d1                	mov    %edx,%ecx
    28cb:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
    28d1:	45 39 fc             	cmp    %r15d,%r12d
    28d4:	45 0f 47 e7          	cmova  %r15d,%r12d
    28d8:	41 29 c8             	sub    %ecx,%r8d
    28db:	45 39 c4             	cmp    %r8d,%r12d
    28de:	45 0f 47 e0          	cmova  %r8d,%r12d
    28e2:	45 85 e4             	test   %r12d,%r12d
    28e5:	0f 84 a8 00 00 00    	je     2993 <csum_and_copy_from_iter_full+0x233>
    28eb:	4c 89 55 98          	mov    %r10,-0x68(%rbp)
    28ef:	4c 89 5d a0          	mov    %r11,-0x60(%rbp)
    28f3:	48 8b 07             	mov    (%rdi),%rax
    28f6:	65 4c 8b 04 25 00 00 	mov    %gs:0x0,%r8
    28fd:	00 00 
    28ff:	41 83 80 80 12 00 00 	addl   $0x1,0x1280(%r8)
    2906:	01 
    2907:	4c 89 45 a8          	mov    %r8,-0x58(%rbp)
    290b:	45 89 e1             	mov    %r12d,%r9d
    290e:	c1 ea 0c             	shr    $0xc,%edx
    2911:	4a 8d 3c 0e          	lea    (%rsi,%r9,1),%rdi
    2915:	4c 89 4d b0          	mov    %r9,-0x50(%rbp)
    2919:	48 89 7d 90          	mov    %rdi,-0x70(%rbp)
    291d:	89 d7                	mov    %edx,%edi
    291f:	44 89 e2             	mov    %r12d,%edx
    2922:	48 c1 e7 06          	shl    $0x6,%rdi
    2926:	48 01 c7             	add    %rax,%rdi
    2929:	48 2b 3d 00 00 00 00 	sub    0x0(%rip),%rdi        # 2930 <csum_and_copy_from_iter_full+0x1d0>
    2930:	48 c1 ff 06          	sar    $0x6,%rdi
    2934:	48 c1 e7 0c          	shl    $0xc,%rdi
    2938:	48 03 3d 00 00 00 00 	add    0x0(%rip),%rdi        # 293f <csum_and_copy_from_iter_full+0x1df>
    293f:	48 01 cf             	add    %rcx,%rdi
    2942:	31 c9                	xor    %ecx,%ecx
    2944:	e8 00 00 00 00       	callq  2949 <csum_and_copy_from_iter_full+0x1e9>
    2949:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    294d:	89 c2                	mov    %eax,%edx
    294f:	c1 ca 08             	ror    $0x8,%edx
    2952:	f6 c1 01             	test   $0x1,%cl
    2955:	0f 45 c2             	cmovne %edx,%eax
    2958:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    295b:	01 c2                	add    %eax,%edx
    295d:	83 d2 00             	adc    $0x0,%edx
    2960:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    2963:	4c 8b 45 a8          	mov    -0x58(%rbp),%r8
    2967:	41 83 a8 80 12 00 00 	subl   $0x1,0x1280(%r8)
    296e:	01 
    296f:	4c 8b 4d b0          	mov    -0x50(%rbp),%r9
    2973:	4c 8b 5d a0          	mov    -0x60(%rbp),%r11
    2977:	4c 8b 55 98          	mov    -0x68(%rbp),%r10
    297b:	4c 01 c9             	add    %r9,%rcx
    297e:	45 39 fc             	cmp    %r15d,%r12d
    2981:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
    2985:	0f 87 45 01 00 00    	ja     2ad0 <csum_and_copy_from_iter_full+0x370>
    298b:	49 8b 42 18          	mov    0x18(%r10),%rax
    298f:	48 8b 75 90          	mov    -0x70(%rbp),%rsi
    2993:	45 29 e7             	sub    %r12d,%r15d
    2996:	44 01 e3             	add    %r12d,%ebx
    2999:	0f 84 00 ff ff ff    	je     289f <csum_and_copy_from_iter_full+0x13f>
    299f:	42 8b 54 30 08       	mov    0x8(%rax,%r14,1),%edx
    29a4:	39 da                	cmp    %ebx,%edx
    29a6:	0f 87 f3 fe ff ff    	ja     289f <csum_and_copy_from_iter_full+0x13f>
    29ac:	41 83 c5 01          	add    $0x1,%r13d
    29b0:	29 d3                	sub    %edx,%ebx
    29b2:	0f 84 e7 fe ff ff    	je     289f <csum_and_copy_from_iter_full+0x13f>
    29b8:	44 89 ea             	mov    %r13d,%edx
    29bb:	48 c1 e2 04          	shl    $0x4,%rdx
    29bf:	8b 54 10 08          	mov    0x8(%rax,%rdx,1),%edx
    29c3:	39 da                	cmp    %ebx,%edx
    29c5:	76 e5                	jbe    29ac <csum_and_copy_from_iter_full+0x24c>
    29c7:	e9 d3 fe ff ff       	jmpq   289f <csum_and_copy_from_iter_full+0x13f>
    29cc:	4c 8b 69 18          	mov    0x18(%rcx),%r13
    29d0:	4d 8b 65 08          	mov    0x8(%r13),%r12
    29d4:	49 29 dc             	sub    %rbx,%r12
    29d7:	49 39 f4             	cmp    %rsi,%r12
    29da:	4c 0f 47 e6          	cmova  %rsi,%r12
    29de:	4d 85 e4             	test   %r12,%r12
    29e1:	0f 84 33 01 00 00    	je     2b1a <csum_and_copy_from_iter_full+0x3ba>
    29e7:	49 8b 7d 00          	mov    0x0(%r13),%rdi
    29eb:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
    29ef:	31 c9                	xor    %ecx,%ecx
    29f1:	44 89 e2             	mov    %r12d,%edx
    29f4:	4c 89 d6             	mov    %r10,%rsi
    29f7:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    29fb:	4c 89 55 b8          	mov    %r10,-0x48(%rbp)
    29ff:	48 01 df             	add    %rbx,%rdi
    2a02:	e8 00 00 00 00       	callq  2a07 <csum_and_copy_from_iter_full+0x2a7>
    2a07:	4c 8b 4d b0          	mov    -0x50(%rbp),%r9
    2a0b:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    2a0e:	01 c2                	add    %eax,%edx
    2a10:	83 d2 00             	adc    $0x0,%edx
    2a13:	4c 8b 55 b8          	mov    -0x48(%rbp),%r10
    2a17:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    2a1a:	4c 89 cb             	mov    %r9,%rbx
    2a1d:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    2a21:	4c 29 e3             	sub    %r12,%rbx
    2a24:	0f 84 1b fe ff ff    	je     2845 <csum_and_copy_from_iter_full+0xe5>
    2a2a:	4d 01 e2             	add    %r12,%r10
    2a2d:	4c 89 75 b8          	mov    %r14,-0x48(%rbp)
    2a31:	4d 89 e6             	mov    %r12,%r14
    2a34:	4c 89 d6             	mov    %r10,%rsi
    2a37:	4d 89 cc             	mov    %r9,%r12
    2a3a:	e9 eb 00 00 00       	jmpq   2b2a <csum_and_copy_from_iter_full+0x3ca>
    2a3f:	4c 8d 6d cc          	lea    -0x34(%rbp),%r13
    2a43:	48 89 f3             	mov    %rsi,%rbx
    2a46:	4c 89 75 b8          	mov    %r14,-0x48(%rbp)
    2a4a:	4c 89 d6             	mov    %r10,%rsi
    2a4d:	4d 89 ee             	mov    %r13,%r14
    2a50:	4d 89 e5             	mov    %r12,%r13
    2a53:	49 89 dc             	mov    %rbx,%r12
    2a56:	49 83 c7 10          	add    $0x10,%r15
    2a5a:	4c 89 e3             	mov    %r12,%rbx
    2a5d:	4d 39 67 08          	cmp    %r12,0x8(%r15)
    2a61:	49 0f 46 5f 08       	cmovbe 0x8(%r15),%rbx
    2a66:	48 85 db             	test   %rbx,%rbx
    2a69:	74 eb                	je     2a56 <csum_and_copy_from_iter_full+0x2f6>
    2a6b:	49 8b 3f             	mov    (%r15),%rdi
    2a6e:	48 8d 04 1e          	lea    (%rsi,%rbx,1),%rax
    2a72:	31 c9                	xor    %ecx,%ecx
    2a74:	89 da                	mov    %ebx,%edx
    2a76:	4d 89 f0             	mov    %r14,%r8
    2a79:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    2a7d:	4c 89 4d b0          	mov    %r9,-0x50(%rbp)
    2a81:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    2a88:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    2a8c:	e8 00 00 00 00       	callq  2a91 <csum_and_copy_from_iter_full+0x331>
    2a91:	8b 55 cc             	mov    -0x34(%rbp),%edx
    2a94:	4c 8b 4d b0          	mov    -0x50(%rbp),%r9
    2a98:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    2a9c:	85 d2                	test   %edx,%edx
    2a9e:	0f 85 d9 fd ff ff    	jne    287d <csum_and_copy_from_iter_full+0x11d>
    2aa4:	89 c2                	mov    %eax,%edx
    2aa6:	c1 ca 08             	ror    $0x8,%edx
    2aa9:	41 f6 c5 01          	test   $0x1,%r13b
    2aad:	0f 45 c2             	cmovne %edx,%eax
    2ab0:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    2ab3:	49 01 dd             	add    %rbx,%r13
    2ab6:	01 c2                	add    %eax,%edx
    2ab8:	83 d2 00             	adc    $0x0,%edx
    2abb:	49 29 dc             	sub    %rbx,%r12
    2abe:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    2ac1:	0f 85 d4 00 00 00    	jne    2b9b <csum_and_copy_from_iter_full+0x43b>
    2ac7:	4c 8b 75 b8          	mov    -0x48(%rbp),%r14
    2acb:	e9 75 fd ff ff       	jmpq   2845 <csum_and_copy_from_iter_full+0xe5>
    2ad0:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 2ad7 <csum_and_copy_from_iter_full+0x377>
    2ad7:	4c 8b 4d 88          	mov    -0x78(%rbp),%r9
    2adb:	4d 89 d6             	mov    %r10,%r14
    2ade:	0f 85 61 fd ff ff    	jne    2845 <csum_and_copy_from_iter_full+0xe5>
    2ae4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    2aeb:	4c 89 5d b0          	mov    %r11,-0x50(%rbp)
    2aef:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
    2af3:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 2afa <csum_and_copy_from_iter_full+0x39a>
    2afa:	e8 00 00 00 00       	callq  2aff <csum_and_copy_from_iter_full+0x39f>
    2aff:	0f 0b                	ud2    
    2b01:	4c 8b 4d b8          	mov    -0x48(%rbp),%r9
    2b05:	4c 8b 5d b0          	mov    -0x50(%rbp),%r11
    2b09:	e9 37 fd ff ff       	jmpq   2845 <csum_and_copy_from_iter_full+0xe5>
    2b0e:	4c 8b 4d 88          	mov    -0x78(%rbp),%r9
    2b12:	4d 89 d6             	mov    %r10,%r14
    2b15:	e9 2b fd ff ff       	jmpq   2845 <csum_and_copy_from_iter_full+0xe5>
    2b1a:	48 89 f3             	mov    %rsi,%rbx
    2b1d:	4d 89 e6             	mov    %r12,%r14
    2b20:	48 89 fe             	mov    %rdi,%rsi
    2b23:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
    2b27:	4d 89 cc             	mov    %r9,%r12
    2b2a:	49 83 c5 10          	add    $0x10,%r13
    2b2e:	49 89 df             	mov    %rbx,%r15
    2b31:	49 39 5d 08          	cmp    %rbx,0x8(%r13)
    2b35:	4d 0f 46 7d 08       	cmovbe 0x8(%r13),%r15
    2b3a:	4d 85 ff             	test   %r15,%r15
    2b3d:	74 45                	je     2b84 <csum_and_copy_from_iter_full+0x424>
    2b3f:	49 8b 7d 00          	mov    0x0(%r13),%rdi
    2b43:	4a 8d 04 3e          	lea    (%rsi,%r15,1),%rax
    2b47:	31 c9                	xor    %ecx,%ecx
    2b49:	44 89 fa             	mov    %r15d,%edx
    2b4c:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    2b50:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    2b54:	e8 00 00 00 00       	callq  2b59 <csum_and_copy_from_iter_full+0x3f9>
    2b59:	89 c2                	mov    %eax,%edx
    2b5b:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    2b5f:	c1 ca 08             	ror    $0x8,%edx
    2b62:	41 f6 c6 01          	test   $0x1,%r14b
    2b66:	0f 45 c2             	cmovne %edx,%eax
    2b69:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    2b6c:	4d 01 fe             	add    %r15,%r14
    2b6f:	01 c2                	add    %eax,%edx
    2b71:	83 d2 00             	adc    $0x0,%edx
    2b74:	4c 29 fb             	sub    %r15,%rbx
    2b77:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    2b7a:	75 0c                	jne    2b88 <csum_and_copy_from_iter_full+0x428>
    2b7c:	4d 89 e1             	mov    %r12,%r9
    2b7f:	e9 43 ff ff ff       	jmpq   2ac7 <csum_and_copy_from_iter_full+0x367>
    2b84:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
    2b88:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    2b8c:	eb 9c                	jmp    2b2a <csum_and_copy_from_iter_full+0x3ca>
    2b8e:	e8 00 00 00 00       	callq  2b93 <csum_and_copy_from_iter_full+0x433>
    2b93:	4d 01 e2             	add    %r12,%r10
    2b96:	e9 ab fe ff ff       	jmpq   2a46 <csum_and_copy_from_iter_full+0x2e6>
    2b9b:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
    2b9f:	e9 b2 fe ff ff       	jmpq   2a56 <csum_and_copy_from_iter_full+0x2f6>
    2ba4:	66 90                	xchg   %ax,%ax
    2ba6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2bad:	00 00 00 

0000000000002bb0 <_copy_to_iter_mcsafe>:
    2bb0:	55                   	push   %rbp
    2bb1:	49 89 f8             	mov    %rdi,%r8
    2bb4:	48 89 e5             	mov    %rsp,%rbp
    2bb7:	41 57                	push   %r15
    2bb9:	41 56                	push   %r14
    2bbb:	41 55                	push   %r13
    2bbd:	41 54                	push   %r12
    2bbf:	49 89 d5             	mov    %rdx,%r13
    2bc2:	53                   	push   %rbx
    2bc3:	48 83 ec 48          	sub    $0x48,%rsp
    2bc7:	8b 12                	mov    (%rdx),%edx
    2bc9:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    2bd0:	00 00 
    2bd2:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2bd6:	31 c0                	xor    %eax,%eax
    2bd8:	89 d0                	mov    %edx,%eax
    2bda:	83 e0 fe             	and    $0xfffffffe,%eax
    2bdd:	83 f8 20             	cmp    $0x20,%eax
    2be0:	0f 84 4c 01 00 00    	je     2d32 <_copy_to_iter_mcsafe+0x182>
    2be6:	49 8b 45 10          	mov    0x10(%r13),%rax
    2bea:	48 39 f0             	cmp    %rsi,%rax
    2bed:	48 0f 46 f0          	cmovbe %rax,%rsi
    2bf1:	48 85 c0             	test   %rax,%rax
    2bf4:	49 89 f4             	mov    %rsi,%r12
    2bf7:	0f 84 a5 00 00 00    	je     2ca2 <_copy_to_iter_mcsafe+0xf2>
    2bfd:	f6 c2 10             	test   $0x10,%dl
    2c00:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    2c04:	49 8b 5d 08          	mov    0x8(%r13),%rbx
    2c08:	0f 85 9c 01 00 00    	jne    2daa <_copy_to_iter_mcsafe+0x1fa>
    2c0e:	f6 c2 08             	test   $0x8,%dl
    2c11:	0f 85 b0 00 00 00    	jne    2cc7 <_copy_to_iter_mcsafe+0x117>
    2c17:	83 e2 40             	and    $0x40,%edx
    2c1a:	0f 85 6a 02 00 00    	jne    2e8a <_copy_to_iter_mcsafe+0x2da>
    2c20:	4d 8b 75 18          	mov    0x18(%r13),%r14
    2c24:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    2c28:	49 29 df             	sub    %rbx,%r15
    2c2b:	49 39 f7             	cmp    %rsi,%r15
    2c2e:	4c 0f 47 fe          	cmova  %rsi,%r15
    2c32:	4d 85 ff             	test   %r15,%r15
    2c35:	0f 84 47 03 00 00    	je     2f82 <_copy_to_iter_mcsafe+0x3d2>
    2c3b:	4a 8d 04 3f          	lea    (%rdi,%r15,1),%rax
    2c3f:	49 8b 3e             	mov    (%r14),%rdi
    2c42:	4c 89 fa             	mov    %r15,%rdx
    2c45:	4c 89 c6             	mov    %r8,%rsi
    2c48:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    2c4c:	48 01 df             	add    %rbx,%rdi
    2c4f:	e8 cc dc ff ff       	callq  920 <copyout_mcsafe>
    2c54:	48 98                	cltq   
    2c56:	4c 89 e1             	mov    %r12,%rcx
    2c59:	49 29 c7             	sub    %rax,%r15
    2c5c:	4c 29 f9             	sub    %r15,%rcx
    2c5f:	4c 01 fb             	add    %r15,%rbx
    2c62:	49 89 cf             	mov    %rcx,%r15
    2c65:	48 85 c0             	test   %rax,%rax
    2c68:	75 09                	jne    2c73 <_copy_to_iter_mcsafe+0xc3>
    2c6a:	4d 85 ff             	test   %r15,%r15
    2c6d:	0f 85 ef 00 00 00    	jne    2d62 <_copy_to_iter_mcsafe+0x1b2>
    2c73:	4d 29 fc             	sub    %r15,%r12
    2c76:	49 39 5e 08          	cmp    %rbx,0x8(%r14)
    2c7a:	0f 84 a7 00 00 00    	je     2d27 <_copy_to_iter_mcsafe+0x177>
    2c80:	4c 89 f0             	mov    %r14,%rax
    2c83:	49 2b 45 18          	sub    0x18(%r13),%rax
    2c87:	4d 89 75 18          	mov    %r14,0x18(%r13)
    2c8b:	48 c1 f8 04          	sar    $0x4,%rax
    2c8f:	49 29 45 20          	sub    %rax,0x20(%r13)
    2c93:	49 8b 45 10          	mov    0x10(%r13),%rax
    2c97:	4c 29 e0             	sub    %r12,%rax
    2c9a:	49 89 5d 08          	mov    %rbx,0x8(%r13)
    2c9e:	49 89 45 10          	mov    %rax,0x10(%r13)
    2ca2:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    2ca6:	65 48 33 3c 25 28 00 	xor    %gs:0x28,%rdi
    2cad:	00 00 
    2caf:	4c 89 e0             	mov    %r12,%rax
    2cb2:	0f 85 c0 03 00 00    	jne    3078 <_copy_to_iter_mcsafe+0x4c8>
    2cb8:	48 83 c4 48          	add    $0x48,%rsp
    2cbc:	5b                   	pop    %rbx
    2cbd:	41 5c                	pop    %r12
    2cbf:	41 5d                	pop    %r13
    2cc1:	41 5e                	pop    %r14
    2cc3:	41 5f                	pop    %r15
    2cc5:	5d                   	pop    %rbp
    2cc6:	c3                   	retq   
    2cc7:	4d 8b 75 18          	mov    0x18(%r13),%r14
    2ccb:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    2ccf:	49 29 df             	sub    %rbx,%r15
    2cd2:	49 39 f7             	cmp    %rsi,%r15
    2cd5:	4c 0f 47 fe          	cmova  %rsi,%r15
    2cd9:	4d 85 ff             	test   %r15,%r15
    2cdc:	0f 84 ec 02 00 00    	je     2fce <_copy_to_iter_mcsafe+0x41e>
    2ce2:	49 8b 3e             	mov    (%r14),%rdi
    2ce5:	4b 8d 04 38          	lea    (%r8,%r15,1),%rax
    2ce9:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    2ced:	48 01 df             	add    %rbx,%rdi
    2cf0:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    2cf5:	4c 89 fa             	mov    %r15,%rdx
    2cf8:	4c 89 c6             	mov    %r8,%rsi
    2cfb:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
    2cff:	e8 00 00 00 00       	callq  2d04 <_copy_to_iter_mcsafe+0x154>
    2d04:	4c 89 e0             	mov    %r12,%rax
    2d07:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
    2d0b:	4c 01 fb             	add    %r15,%rbx
    2d0e:	4c 29 f8             	sub    %r15,%rax
    2d11:	49 89 c7             	mov    %rax,%r15
    2d14:	4d 85 ff             	test   %r15,%r15
    2d17:	0f 85 bd 02 00 00    	jne    2fda <_copy_to_iter_mcsafe+0x42a>
    2d1d:	49 3b 5e 08          	cmp    0x8(%r14),%rbx
    2d21:	0f 85 59 ff ff ff    	jne    2c80 <_copy_to_iter_mcsafe+0xd0>
    2d27:	49 83 c6 10          	add    $0x10,%r14
    2d2b:	31 db                	xor    %ebx,%ebx
    2d2d:	e9 4e ff ff ff       	jmpq   2c80 <_copy_to_iter_mcsafe+0xd0>
    2d32:	49 8b 5d 18          	mov    0x18(%r13),%rbx
    2d36:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    2d3a:	4c 89 ef             	mov    %r13,%rdi
    2d3d:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
    2d41:	44 8b 73 5c          	mov    0x5c(%rbx),%r14d
    2d45:	e8 66 d3 ff ff       	callq  b0 <sanity>
    2d4a:	84 c0                	test   %al,%al
    2d4c:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
    2d50:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    2d54:	0f 85 70 01 00 00    	jne    2eca <_copy_to_iter_mcsafe+0x31a>
    2d5a:	45 31 e4             	xor    %r12d,%r12d
    2d5d:	e9 40 ff ff ff       	jmpq   2ca2 <_copy_to_iter_mcsafe+0xf2>
    2d62:	49 83 c6 10          	add    $0x10,%r14
    2d66:	4c 89 f9             	mov    %r15,%rcx
    2d69:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    2d6d:	49 0f 46 4e 08       	cmovbe 0x8(%r14),%rcx
    2d72:	48 85 c9             	test   %rcx,%rcx
    2d75:	0f 84 b4 02 00 00    	je     302f <_copy_to_iter_mcsafe+0x47f>
    2d7b:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
    2d7f:	49 8b 3e             	mov    (%r14),%rdi
    2d82:	48 89 ca             	mov    %rcx,%rdx
    2d85:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    2d89:	48 8d 04 0e          	lea    (%rsi,%rcx,1),%rax
    2d8d:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    2d91:	e8 8a db ff ff       	callq  920 <copyout_mcsafe>
    2d96:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    2d9a:	48 98                	cltq   
    2d9c:	48 29 c1             	sub    %rax,%rcx
    2d9f:	48 89 cb             	mov    %rcx,%rbx
    2da2:	49 29 cf             	sub    %rcx,%r15
    2da5:	e9 bb fe ff ff       	jmpq   2c65 <_copy_to_iter_mcsafe+0xb5>
    2daa:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    2dae:	45 31 ff             	xor    %r15d,%r15d
    2db1:	45 31 c9             	xor    %r9d,%r9d
    2db4:	4d 89 eb             	mov    %r13,%r11
    2db7:	49 89 f2             	mov    %rsi,%r10
    2dba:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    2dbe:	4d 89 cd             	mov    %r9,%r13
    2dc1:	49 c1 e5 04          	shl    $0x4,%r13
    2dc5:	45 85 e4             	test   %r12d,%r12d
    2dc8:	4a 8d 3c 29          	lea    (%rcx,%r13,1),%rdi
    2dcc:	0f 84 f1 01 00 00    	je     2fc3 <_copy_to_iter_mcsafe+0x413>
    2dd2:	8b 47 0c             	mov    0xc(%rdi),%eax
    2dd5:	44 8b 77 08          	mov    0x8(%rdi),%r14d
    2dd9:	ba 00 10 00 00       	mov    $0x1000,%edx
    2dde:	01 d8                	add    %ebx,%eax
    2de0:	41 29 de             	sub    %ebx,%r14d
    2de3:	89 c6                	mov    %eax,%esi
    2de5:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
    2deb:	45 39 e6             	cmp    %r12d,%r14d
    2dee:	45 0f 47 f4          	cmova  %r12d,%r14d
    2df2:	29 f2                	sub    %esi,%edx
    2df4:	41 39 d6             	cmp    %edx,%r14d
    2df7:	44 0f 47 f2          	cmova  %edx,%r14d
    2dfb:	45 85 f6             	test   %r14d,%r14d
    2dfe:	74 4e                	je     2e4e <_copy_to_iter_mcsafe+0x29e>
    2e00:	c1 e8 0c             	shr    $0xc,%eax
    2e03:	44 89 f1             	mov    %r14d,%ecx
    2e06:	4c 89 4d a0          	mov    %r9,-0x60(%rbp)
    2e0a:	48 c1 e0 06          	shl    $0x6,%rax
    2e0e:	48 03 07             	add    (%rdi),%rax
    2e11:	49 8d 14 08          	lea    (%r8,%rcx,1),%rdx
    2e15:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    2e19:	4c 89 55 b0          	mov    %r10,-0x50(%rbp)
    2e1d:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
    2e21:	4c 89 c2             	mov    %r8,%rdx
    2e24:	48 89 c7             	mov    %rax,%rdi
    2e27:	e8 c4 d7 ff ff       	callq  5f0 <memcpy_mcsafe_to_page>
    2e2c:	48 85 c0             	test   %rax,%rax
    2e2f:	4c 8b 55 b0          	mov    -0x50(%rbp),%r10
    2e33:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    2e37:	4c 8b 4d a0          	mov    -0x60(%rbp),%r9
    2e3b:	0f 85 72 01 00 00    	jne    2fb3 <_copy_to_iter_mcsafe+0x403>
    2e41:	45 39 f4             	cmp    %r14d,%r12d
    2e44:	49 8b 4b 18          	mov    0x18(%r11),%rcx
    2e48:	72 48                	jb     2e92 <_copy_to_iter_mcsafe+0x2e2>
    2e4a:	4c 8b 45 98          	mov    -0x68(%rbp),%r8
    2e4e:	45 29 f4             	sub    %r14d,%r12d
    2e51:	44 01 f3             	add    %r14d,%ebx
    2e54:	0f 84 64 ff ff ff    	je     2dbe <_copy_to_iter_mcsafe+0x20e>
    2e5a:	42 8b 44 29 08       	mov    0x8(%rcx,%r13,1),%eax
    2e5f:	39 d8                	cmp    %ebx,%eax
    2e61:	0f 87 57 ff ff ff    	ja     2dbe <_copy_to_iter_mcsafe+0x20e>
    2e67:	45 8d 4f 01          	lea    0x1(%r15),%r9d
    2e6b:	4c 89 ca             	mov    %r9,%rdx
    2e6e:	4d 89 cf             	mov    %r9,%r15
    2e71:	48 c1 e2 04          	shl    $0x4,%rdx
    2e75:	29 c3                	sub    %eax,%ebx
    2e77:	0f 84 41 ff ff ff    	je     2dbe <_copy_to_iter_mcsafe+0x20e>
    2e7d:	8b 44 11 08          	mov    0x8(%rcx,%rdx,1),%eax
    2e81:	39 d8                	cmp    %ebx,%eax
    2e83:	76 e2                	jbe    2e67 <_copy_to_iter_mcsafe+0x2b7>
    2e85:	e9 34 ff ff ff       	jmpq   2dbe <_copy_to_iter_mcsafe+0x20e>
    2e8a:	48 01 f3             	add    %rsi,%rbx
    2e8d:	e9 05 fe ff ff       	jmpq   2c97 <_copy_to_iter_mcsafe+0xe7>
    2e92:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 2e99 <_copy_to_iter_mcsafe+0x2e9>
    2e99:	4c 89 d8             	mov    %r11,%rax
    2e9c:	4d 89 d4             	mov    %r10,%r12
    2e9f:	4d 89 eb             	mov    %r13,%r11
    2ea2:	49 89 c5             	mov    %rax,%r13
    2ea5:	0f 84 8b 01 00 00    	je     3036 <_copy_to_iter_mcsafe+0x486>
    2eab:	4a 8d 3c 19          	lea    (%rcx,%r11,1),%rdi
    2eaf:	49 89 7d 18          	mov    %rdi,0x18(%r13)
    2eb3:	48 2b 7d 90          	sub    -0x70(%rbp),%rdi
    2eb7:	89 db                	mov    %ebx,%ebx
    2eb9:	49 8b 45 10          	mov    0x10(%r13),%rax
    2ebd:	48 c1 ff 04          	sar    $0x4,%rdi
    2ec1:	49 29 7d 20          	sub    %rdi,0x20(%r13)
    2ec5:	e9 cd fd ff ff       	jmpq   2c97 <_copy_to_iter_mcsafe+0xe7>
    2eca:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
    2ece:	48 8d 55 c4          	lea    -0x3c(%rbp),%rdx
    2ed2:	4c 89 ef             	mov    %r13,%rdi
    2ed5:	4c 89 45 a8          	mov    %r8,-0x58(%rbp)
    2ed9:	e8 b2 d3 ff ff       	callq  290 <push_pipe>
    2ede:	48 85 c0             	test   %rax,%rax
    2ee1:	49 89 c7             	mov    %rax,%r15
    2ee4:	0f 84 70 fe ff ff    	je     2d5a <_copy_to_iter_mcsafe+0x1aa>
    2eea:	4c 8b 45 a8          	mov    -0x58(%rbp),%r8
    2eee:	41 8d 46 ff          	lea    -0x1(%r14),%eax
    2ef2:	48 89 5d b0          	mov    %rbx,-0x50(%rbp)
    2ef6:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
    2efa:	4c 89 eb             	mov    %r13,%rbx
    2efd:	45 31 e4             	xor    %r12d,%r12d
    2f00:	89 45 b8             	mov    %eax,-0x48(%rbp)
    2f03:	4d 89 fd             	mov    %r15,%r13
    2f06:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    2f09:	4d 89 c6             	mov    %r8,%r14
    2f0c:	eb 18                	jmp    2f26 <_copy_to_iter_mcsafe+0x376>
    2f0e:	8d 42 01             	lea    0x1(%rdx),%eax
    2f11:	4d 01 fe             	add    %r15,%r14
    2f14:	31 f6                	xor    %esi,%esi
    2f16:	4d 29 fd             	sub    %r15,%r13
    2f19:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
    2f20:	00 
    2f21:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    2f24:	74 53                	je     2f79 <_copy_to_iter_mcsafe+0x3c9>
    2f26:	41 bf 00 10 00 00    	mov    $0x1000,%r15d
    2f2c:	48 8b 7d b0          	mov    -0x50(%rbp),%rdi
    2f30:	4c 89 f2             	mov    %r14,%rdx
    2f33:	49 29 f7             	sub    %rsi,%r15
    2f36:	4d 39 ef             	cmp    %r13,%r15
    2f39:	4d 0f 47 fd          	cmova  %r13,%r15
    2f3d:	23 45 b8             	and    -0x48(%rbp),%eax
    2f40:	4c 89 f9             	mov    %r15,%rcx
    2f43:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    2f47:	48 c1 e0 03          	shl    $0x3,%rax
    2f4b:	48 03 87 90 00 00 00 	add    0x90(%rdi),%rax
    2f52:	48 8b 38             	mov    (%rax),%rdi
    2f55:	e8 96 d6 ff ff       	callq  5f0 <memcpy_mcsafe_to_page>
    2f5a:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
    2f5e:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    2f61:	4c 89 f9             	mov    %r15,%rcx
    2f64:	48 29 c1             	sub    %rax,%rcx
    2f67:	49 01 cc             	add    %rcx,%r12
    2f6a:	48 01 ce             	add    %rcx,%rsi
    2f6d:	48 85 c0             	test   %rax,%rax
    2f70:	89 53 20             	mov    %edx,0x20(%rbx)
    2f73:	48 89 73 08          	mov    %rsi,0x8(%rbx)
    2f77:	74 95                	je     2f0e <_copy_to_iter_mcsafe+0x35e>
    2f79:	4c 29 63 10          	sub    %r12,0x10(%rbx)
    2f7d:	e9 20 fd ff ff       	jmpq   2ca2 <_copy_to_iter_mcsafe+0xf2>
    2f82:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    2f86:	49 89 f7             	mov    %rsi,%r15
    2f89:	31 c0                	xor    %eax,%eax
    2f8b:	e9 d5 fc ff ff       	jmpq   2c65 <_copy_to_iter_mcsafe+0xb5>
    2f90:	4c 89 fa             	mov    %r15,%rdx
    2f93:	4c 89 c6             	mov    %r8,%rsi
    2f96:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
    2f9a:	e8 00 00 00 00       	callq  2f9f <_copy_to_iter_mcsafe+0x3ef>
    2f9f:	48 85 c0             	test   %rax,%rax
    2fa2:	0f 84 5c fd ff ff    	je     2d04 <_copy_to_iter_mcsafe+0x154>
    2fa8:	49 29 c7             	sub    %rax,%r15
    2fab:	4d 89 fc             	mov    %r15,%r12
    2fae:	e9 ef fc ff ff       	jmpq   2ca2 <_copy_to_iter_mcsafe+0xf2>
    2fb3:	4c 8b 65 98          	mov    -0x68(%rbp),%r12
    2fb7:	4c 2b 65 b8          	sub    -0x48(%rbp),%r12
    2fbb:	49 29 c4             	sub    %rax,%r12
    2fbe:	e9 df fc ff ff       	jmpq   2ca2 <_copy_to_iter_mcsafe+0xf2>
    2fc3:	4d 89 d4             	mov    %r10,%r12
    2fc6:	4d 89 dd             	mov    %r11,%r13
    2fc9:	e9 e1 fe ff ff       	jmpq   2eaf <_copy_to_iter_mcsafe+0x2ff>
    2fce:	48 89 7d b0          	mov    %rdi,-0x50(%rbp)
    2fd2:	49 89 f7             	mov    %rsi,%r15
    2fd5:	e9 3a fd ff ff       	jmpq   2d14 <_copy_to_iter_mcsafe+0x164>
    2fda:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    2fde:	4c 89 65 b0          	mov    %r12,-0x50(%rbp)
    2fe2:	4d 89 f4             	mov    %r14,%r12
    2fe5:	4d 89 ee             	mov    %r13,%r14
    2fe8:	4d 89 c5             	mov    %r8,%r13
    2feb:	49 83 c4 10          	add    $0x10,%r12
    2fef:	4c 89 fb             	mov    %r15,%rbx
    2ff2:	4d 39 7c 24 08       	cmp    %r15,0x8(%r12)
    2ff7:	49 0f 46 5c 24 08    	cmovbe 0x8(%r12),%rbx
    2ffd:	48 85 db             	test   %rbx,%rbx
    3000:	74 e9                	je     2feb <_copy_to_iter_mcsafe+0x43b>
    3002:	48 8d 04 1e          	lea    (%rsi,%rbx,1),%rax
    3006:	49 8b 3c 24          	mov    (%r12),%rdi
    300a:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    300e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    3013:	48 89 da             	mov    %rbx,%rdx
    3016:	e8 00 00 00 00       	callq  301b <_copy_to_iter_mcsafe+0x46b>
    301b:	49 29 df             	sub    %rbx,%r15
    301e:	75 5d                	jne    307d <_copy_to_iter_mcsafe+0x4cd>
    3020:	4d 89 f5             	mov    %r14,%r13
    3023:	4d 89 e6             	mov    %r12,%r14
    3026:	4c 8b 65 b0          	mov    -0x50(%rbp),%r12
    302a:	e9 ee fc ff ff       	jmpq   2d1d <_copy_to_iter_mcsafe+0x16d>
    302f:	31 c0                	xor    %eax,%eax
    3031:	e9 2f fc ff ff       	jmpq   2c65 <_copy_to_iter_mcsafe+0xb5>
    3036:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    303d:	4c 89 5d b8          	mov    %r11,-0x48(%rbp)
    3041:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 3048 <_copy_to_iter_mcsafe+0x498>
    3048:	e8 00 00 00 00       	callq  304d <_copy_to_iter_mcsafe+0x49d>
    304d:	0f 0b                	ud2    
    304f:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    3053:	4c 8b 5d b8          	mov    -0x48(%rbp),%r11
    3057:	e9 4f fe ff ff       	jmpq   2eab <_copy_to_iter_mcsafe+0x2fb>
    305c:	48 89 da             	mov    %rbx,%rdx
    305f:	e8 00 00 00 00       	callq  3064 <_copy_to_iter_mcsafe+0x4b4>
    3064:	48 85 c0             	test   %rax,%rax
    3067:	74 b2                	je     301b <_copy_to_iter_mcsafe+0x46b>
    3069:	4c 8b 65 b8          	mov    -0x48(%rbp),%r12
    306d:	4d 29 ec             	sub    %r13,%r12
    3070:	49 29 c4             	sub    %rax,%r12
    3073:	e9 2a fc ff ff       	jmpq   2ca2 <_copy_to_iter_mcsafe+0xf2>
    3078:	e8 00 00 00 00       	callq  307d <_copy_to_iter_mcsafe+0x4cd>
    307d:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
    3081:	e9 65 ff ff ff       	jmpq   2feb <_copy_to_iter_mcsafe+0x43b>
    3086:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    308d:	00 00 00 

0000000000003090 <iov_iter_zero>:
    3090:	55                   	push   %rbp
    3091:	48 89 e5             	mov    %rsp,%rbp
    3094:	41 57                	push   %r15
    3096:	41 56                	push   %r14
    3098:	41 55                	push   %r13
    309a:	41 54                	push   %r12
    309c:	49 89 fd             	mov    %rdi,%r13
    309f:	53                   	push   %rbx
    30a0:	49 89 f4             	mov    %rsi,%r12
    30a3:	48 83 ec 38          	sub    $0x38,%rsp
    30a7:	8b 16                	mov    (%rsi),%edx
    30a9:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    30b0:	00 00 
    30b2:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    30b6:	31 c0                	xor    %eax,%eax
    30b8:	89 d0                	mov    %edx,%eax
    30ba:	83 e0 fe             	and    $0xfffffffe,%eax
    30bd:	83 f8 20             	cmp    $0x20,%eax
    30c0:	0f 84 28 01 00 00    	je     31ee <iov_iter_zero+0x15e>
    30c6:	48 8b 46 10          	mov    0x10(%rsi),%rax
    30ca:	48 39 f8             	cmp    %rdi,%rax
    30cd:	4c 0f 46 e8          	cmovbe %rax,%r13
    30d1:	48 85 c0             	test   %rax,%rax
    30d4:	0f 84 9a 00 00 00    	je     3174 <iov_iter_zero+0xe4>
    30da:	f6 c2 10             	test   $0x10,%dl
    30dd:	48 8b 5e 08          	mov    0x8(%rsi),%rbx
    30e1:	0f 85 61 01 00 00    	jne    3248 <iov_iter_zero+0x1b8>
    30e7:	f6 c2 08             	test   $0x8,%dl
    30ea:	0f 85 a9 00 00 00    	jne    3199 <iov_iter_zero+0x109>
    30f0:	83 e2 40             	and    $0x40,%edx
    30f3:	0f 85 64 02 00 00    	jne    335d <iov_iter_zero+0x2cd>
    30f9:	4c 8b 7e 18          	mov    0x18(%rsi),%r15
    30fd:	4d 8b 77 08          	mov    0x8(%r15),%r14
    3101:	49 29 de             	sub    %rbx,%r14
    3104:	4d 39 ee             	cmp    %r13,%r14
    3107:	4d 0f 47 f5          	cmova  %r13,%r14
    310b:	4d 85 f6             	test   %r14,%r14
    310e:	0f 84 ed 02 00 00    	je     3401 <iov_iter_zero+0x371>
    3114:	49 8b 3f             	mov    (%r15),%rdi
    3117:	4c 89 f6             	mov    %r14,%rsi
    311a:	48 01 df             	add    %rbx,%rdi
    311d:	e8 00 00 00 00       	callq  3122 <iov_iter_zero+0x92>
    3122:	4c 89 ee             	mov    %r13,%rsi
    3125:	49 29 c6             	sub    %rax,%r14
    3128:	4c 29 f6             	sub    %r14,%rsi
    312b:	4c 01 f3             	add    %r14,%rbx
    312e:	49 89 f6             	mov    %rsi,%r14
    3131:	48 85 c0             	test   %rax,%rax
    3134:	75 09                	jne    313f <iov_iter_zero+0xaf>
    3136:	4d 85 f6             	test   %r14,%r14
    3139:	0f 85 cf 00 00 00    	jne    320e <iov_iter_zero+0x17e>
    313f:	4d 29 f5             	sub    %r14,%r13
    3142:	49 39 5f 08          	cmp    %rbx,0x8(%r15)
    3146:	0f 84 97 00 00 00    	je     31e3 <iov_iter_zero+0x153>
    314c:	4c 89 f8             	mov    %r15,%rax
    314f:	49 2b 44 24 18       	sub    0x18(%r12),%rax
    3154:	4d 89 7c 24 18       	mov    %r15,0x18(%r12)
    3159:	48 c1 f8 04          	sar    $0x4,%rax
    315d:	49 29 44 24 20       	sub    %rax,0x20(%r12)
    3162:	49 8b 44 24 10       	mov    0x10(%r12),%rax
    3167:	4c 29 e8             	sub    %r13,%rax
    316a:	49 89 5c 24 08       	mov    %rbx,0x8(%r12)
    316f:	49 89 44 24 10       	mov    %rax,0x10(%r12)
    3174:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    3178:	65 48 33 34 25 28 00 	xor    %gs:0x28,%rsi
    317f:	00 00 
    3181:	4c 89 e8             	mov    %r13,%rax
    3184:	0f 85 af 02 00 00    	jne    3439 <iov_iter_zero+0x3a9>
    318a:	48 83 c4 38          	add    $0x38,%rsp
    318e:	5b                   	pop    %rbx
    318f:	41 5c                	pop    %r12
    3191:	41 5d                	pop    %r13
    3193:	41 5e                	pop    %r14
    3195:	41 5f                	pop    %r15
    3197:	5d                   	pop    %rbp
    3198:	c3                   	retq   
    3199:	4c 8b 7e 18          	mov    0x18(%rsi),%r15
    319d:	4d 8b 77 08          	mov    0x8(%r15),%r14
    31a1:	49 29 de             	sub    %rbx,%r14
    31a4:	4d 39 ee             	cmp    %r13,%r14
    31a7:	4d 0f 47 f5          	cmova  %r13,%r14
    31ab:	4d 85 f6             	test   %r14,%r14
    31ae:	0f 84 57 02 00 00    	je     340b <iov_iter_zero+0x37b>
    31b4:	49 8b 3f             	mov    (%r15),%rdi
    31b7:	4c 89 f2             	mov    %r14,%rdx
    31ba:	31 f6                	xor    %esi,%esi
    31bc:	48 01 df             	add    %rbx,%rdi
    31bf:	4c 01 f3             	add    %r14,%rbx
    31c2:	e8 00 00 00 00       	callq  31c7 <iov_iter_zero+0x137>
    31c7:	4c 89 e8             	mov    %r13,%rax
    31ca:	4c 29 f0             	sub    %r14,%rax
    31cd:	49 89 c6             	mov    %rax,%r14
    31d0:	4d 85 f6             	test   %r14,%r14
    31d3:	0f 85 57 01 00 00    	jne    3330 <iov_iter_zero+0x2a0>
    31d9:	49 3b 5f 08          	cmp    0x8(%r15),%rbx
    31dd:	0f 85 69 ff ff ff    	jne    314c <iov_iter_zero+0xbc>
    31e3:	49 83 c7 10          	add    $0x10,%r15
    31e7:	31 db                	xor    %ebx,%ebx
    31e9:	e9 5e ff ff ff       	jmpq   314c <iov_iter_zero+0xbc>
    31ee:	48 8b 5e 18          	mov    0x18(%rsi),%rbx
    31f2:	48 89 f7             	mov    %rsi,%rdi
    31f5:	44 8b 73 5c          	mov    0x5c(%rbx),%r14d
    31f9:	e8 b2 ce ff ff       	callq  b0 <sanity>
    31fe:	84 c0                	test   %al,%al
    3200:	0f 85 5f 01 00 00    	jne    3365 <iov_iter_zero+0x2d5>
    3206:	45 31 ed             	xor    %r13d,%r13d
    3209:	e9 66 ff ff ff       	jmpq   3174 <iov_iter_zero+0xe4>
    320e:	49 83 c7 10          	add    $0x10,%r15
    3212:	4c 89 f2             	mov    %r14,%rdx
    3215:	4d 39 77 08          	cmp    %r14,0x8(%r15)
    3219:	49 0f 46 57 08       	cmovbe 0x8(%r15),%rdx
    321e:	48 85 d2             	test   %rdx,%rdx
    3221:	0f 84 ec 01 00 00    	je     3413 <iov_iter_zero+0x383>
    3227:	49 8b 3f             	mov    (%r15),%rdi
    322a:	48 89 d6             	mov    %rdx,%rsi
    322d:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    3231:	e8 00 00 00 00       	callq  3236 <iov_iter_zero+0x1a6>
    3236:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
    323a:	48 29 c2             	sub    %rax,%rdx
    323d:	48 89 d3             	mov    %rdx,%rbx
    3240:	49 29 d6             	sub    %rdx,%r14
    3243:	e9 e9 fe ff ff       	jmpq   3131 <iov_iter_zero+0xa1>
    3248:	48 8b 56 18          	mov    0x18(%rsi),%rdx
    324c:	31 c9                	xor    %ecx,%ecx
    324e:	45 89 e9             	mov    %r13d,%r9d
    3251:	45 31 c0             	xor    %r8d,%r8d
    3254:	41 89 ce             	mov    %ecx,%r14d
    3257:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
    325b:	4c 89 c1             	mov    %r8,%rcx
    325e:	48 c1 e1 04          	shl    $0x4,%rcx
    3262:	45 85 c9             	test   %r9d,%r9d
    3265:	4c 8d 1c 0a          	lea    (%rdx,%rcx,1),%r11
    3269:	0f 84 a3 00 00 00    	je     3312 <iov_iter_zero+0x282>
    326f:	41 8b 7b 0c          	mov    0xc(%r11),%edi
    3273:	41 8b 43 08          	mov    0x8(%r11),%eax
    3277:	41 bf 00 10 00 00    	mov    $0x1000,%r15d
    327d:	01 df                	add    %ebx,%edi
    327f:	29 d8                	sub    %ebx,%eax
    3281:	89 fe                	mov    %edi,%esi
    3283:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
    3289:	44 39 c8             	cmp    %r9d,%eax
    328c:	41 0f 47 c1          	cmova  %r9d,%eax
    3290:	41 29 f7             	sub    %esi,%r15d
    3293:	44 39 f8             	cmp    %r15d,%eax
    3296:	44 0f 46 f8          	cmovbe %eax,%r15d
    329a:	45 85 ff             	test   %r15d,%r15d
    329d:	74 34                	je     32d3 <iov_iter_zero+0x243>
    329f:	c1 ef 0c             	shr    $0xc,%edi
    32a2:	44 89 fa             	mov    %r15d,%edx
    32a5:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
    32a9:	48 c1 e7 06          	shl    $0x6,%rdi
    32ad:	49 03 3b             	add    (%r11),%rdi
    32b0:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
    32b4:	44 89 4d b8          	mov    %r9d,-0x48(%rbp)
    32b8:	e8 93 d3 ff ff       	callq  650 <memzero_page>
    32bd:	44 8b 4d b8          	mov    -0x48(%rbp),%r9d
    32c1:	49 8b 54 24 18       	mov    0x18(%r12),%rdx
    32c6:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
    32ca:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    32ce:	45 39 f9             	cmp    %r15d,%r9d
    32d1:	72 2b                	jb     32fe <iov_iter_zero+0x26e>
    32d3:	45 29 f9             	sub    %r15d,%r9d
    32d6:	44 01 fb             	add    %r15d,%ebx
    32d9:	74 80                	je     325b <iov_iter_zero+0x1cb>
    32db:	8b 44 0a 08          	mov    0x8(%rdx,%rcx,1),%eax
    32df:	39 d8                	cmp    %ebx,%eax
    32e1:	0f 87 74 ff ff ff    	ja     325b <iov_iter_zero+0x1cb>
    32e7:	45 8d 46 01          	lea    0x1(%r14),%r8d
    32eb:	4c 89 c1             	mov    %r8,%rcx
    32ee:	4d 89 c6             	mov    %r8,%r14
    32f1:	48 c1 e1 04          	shl    $0x4,%rcx
    32f5:	29 c3                	sub    %eax,%ebx
    32f7:	75 e2                	jne    32db <iov_iter_zero+0x24b>
    32f9:	e9 5d ff ff ff       	jmpq   325b <iov_iter_zero+0x1cb>
    32fe:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 3305 <iov_iter_zero+0x275>
    3305:	49 89 cf             	mov    %rcx,%r15
    3308:	0f 84 0c 01 00 00    	je     341a <iov_iter_zero+0x38a>
    330e:	4e 8d 1c 3a          	lea    (%rdx,%r15,1),%r11
    3312:	4d 89 5c 24 18       	mov    %r11,0x18(%r12)
    3317:	4c 2b 5d a0          	sub    -0x60(%rbp),%r11
    331b:	89 db                	mov    %ebx,%ebx
    331d:	49 8b 44 24 10       	mov    0x10(%r12),%rax
    3322:	49 c1 fb 04          	sar    $0x4,%r11
    3326:	4d 29 5c 24 20       	sub    %r11,0x20(%r12)
    332b:	e9 37 fe ff ff       	jmpq   3167 <iov_iter_zero+0xd7>
    3330:	49 83 c7 10          	add    $0x10,%r15
    3334:	4c 89 f3             	mov    %r14,%rbx
    3337:	4d 39 77 08          	cmp    %r14,0x8(%r15)
    333b:	49 0f 46 5f 08       	cmovbe 0x8(%r15),%rbx
    3340:	48 85 db             	test   %rbx,%rbx
    3343:	74 eb                	je     3330 <iov_iter_zero+0x2a0>
    3345:	49 8b 3f             	mov    (%r15),%rdi
    3348:	31 f6                	xor    %esi,%esi
    334a:	48 89 da             	mov    %rbx,%rdx
    334d:	e8 00 00 00 00       	callq  3352 <iov_iter_zero+0x2c2>
    3352:	49 29 de             	sub    %rbx,%r14
    3355:	0f 84 7e fe ff ff    	je     31d9 <iov_iter_zero+0x149>
    335b:	eb d3                	jmp    3330 <iov_iter_zero+0x2a0>
    335d:	4c 01 eb             	add    %r13,%rbx
    3360:	e9 02 fe ff ff       	jmpq   3167 <iov_iter_zero+0xd7>
    3365:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
    3369:	48 8d 55 c4          	lea    -0x3c(%rbp),%rdx
    336d:	4c 89 ee             	mov    %r13,%rsi
    3370:	4c 89 e7             	mov    %r12,%rdi
    3373:	e8 18 cf ff ff       	callq  290 <push_pipe>
    3378:	48 85 c0             	test   %rax,%rax
    337b:	49 89 c5             	mov    %rax,%r13
    337e:	0f 84 82 fe ff ff    	je     3206 <iov_iter_zero+0x176>
    3384:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
    3388:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    338b:	45 8d 7e ff          	lea    -0x1(%r14),%r15d
    338f:	4d 89 ee             	mov    %r13,%r14
    3392:	4c 89 6d b8          	mov    %r13,-0x48(%rbp)
    3396:	4d 89 e5             	mov    %r12,%r13
    3399:	4d 89 f4             	mov    %r14,%r12
    339c:	41 be 00 10 00 00    	mov    $0x1000,%r14d
    33a2:	48 8b 93 90 00 00 00 	mov    0x90(%rbx),%rdx
    33a9:	49 29 f6             	sub    %rsi,%r14
    33ac:	4d 39 e6             	cmp    %r12,%r14
    33af:	4d 0f 47 f4          	cmova  %r12,%r14
    33b3:	44 21 f8             	and    %r15d,%eax
    33b6:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    33ba:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
    33be:	4c 89 f2             	mov    %r14,%rdx
    33c1:	48 8b 38             	mov    (%rax),%rdi
    33c4:	e8 87 d2 ff ff       	callq  650 <memzero_page>
    33c9:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    33cc:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    33d0:	31 f6                	xor    %esi,%esi
    33d2:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
    33d9:	00 
    33da:	4c 01 f2             	add    %r14,%rdx
    33dd:	41 89 45 20          	mov    %eax,0x20(%r13)
    33e1:	83 c0 01             	add    $0x1,%eax
    33e4:	4d 29 f4             	sub    %r14,%r12
    33e7:	49 89 55 08          	mov    %rdx,0x8(%r13)
    33eb:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    33ee:	75 ac                	jne    339c <iov_iter_zero+0x30c>
    33f0:	4d 89 ec             	mov    %r13,%r12
    33f3:	4c 8b 6d b8          	mov    -0x48(%rbp),%r13
    33f7:	4d 29 6c 24 10       	sub    %r13,0x10(%r12)
    33fc:	e9 73 fd ff ff       	jmpq   3174 <iov_iter_zero+0xe4>
    3401:	4d 89 ee             	mov    %r13,%r14
    3404:	31 c0                	xor    %eax,%eax
    3406:	e9 26 fd ff ff       	jmpq   3131 <iov_iter_zero+0xa1>
    340b:	4d 89 ee             	mov    %r13,%r14
    340e:	e9 bd fd ff ff       	jmpq   31d0 <iov_iter_zero+0x140>
    3413:	31 c0                	xor    %eax,%eax
    3415:	e9 17 fd ff ff       	jmpq   3131 <iov_iter_zero+0xa1>
    341a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    3421:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 3428 <iov_iter_zero+0x398>
    3428:	e8 00 00 00 00       	callq  342d <iov_iter_zero+0x39d>
    342d:	0f 0b                	ud2    
    342f:	49 8b 54 24 18       	mov    0x18(%r12),%rdx
    3434:	e9 d5 fe ff ff       	jmpq   330e <iov_iter_zero+0x27e>
    3439:	e8 00 00 00 00       	callq  343e <iov_iter_zero+0x3ae>
    343e:	66 90                	xchg   %ax,%ax

0000000000003440 <_copy_to_iter_bpf>:
    3440:	55                   	push   %rbp
    3441:	48 89 e5             	mov    %rsp,%rbp
    3444:	41 57                	push   %r15
    3446:	41 56                	push   %r14
    3448:	41 55                	push   %r13
    344a:	41 54                	push   %r12
    344c:	49 89 d5             	mov    %rdx,%r13
    344f:	53                   	push   %rbx
    3450:	48 83 ec 28          	sub    $0x28,%rsp
    3454:	8b 12                	mov    (%rdx),%edx
    3456:	89 d0                	mov    %edx,%eax
    3458:	83 e0 fe             	and    $0xfffffffe,%eax
    345b:	83 f8 20             	cmp    $0x20,%eax
    345e:	0f 84 cb 00 00 00    	je     352f <_copy_to_iter_bpf+0xef>
    3464:	49 8b 45 10          	mov    0x10(%r13),%rax
    3468:	48 39 f0             	cmp    %rsi,%rax
    346b:	48 0f 46 f0          	cmovbe %rax,%rsi
    346f:	48 85 c0             	test   %rax,%rax
    3472:	49 89 f4             	mov    %rsi,%r12
    3475:	0f 84 a2 00 00 00    	je     351d <_copy_to_iter_bpf+0xdd>
    347b:	f6 c2 10             	test   $0x10,%dl
    347e:	49 8b 5d 08          	mov    0x8(%r13),%rbx
    3482:	0f 85 fc 00 00 00    	jne    3584 <_copy_to_iter_bpf+0x144>
    3488:	f6 c2 08             	test   $0x8,%dl
    348b:	0f 85 d8 01 00 00    	jne    3669 <_copy_to_iter_bpf+0x229>
    3491:	83 e2 40             	and    $0x40,%edx
    3494:	0f 85 43 02 00 00    	jne    36dd <_copy_to_iter_bpf+0x29d>
    349a:	4d 8b 7d 18          	mov    0x18(%r13),%r15
    349e:	4d 8b 77 08          	mov    0x8(%r15),%r14
    34a2:	49 29 de             	sub    %rbx,%r14
    34a5:	49 39 f6             	cmp    %rsi,%r14
    34a8:	4c 0f 47 f6          	cmova  %rsi,%r14
    34ac:	4d 85 f6             	test   %r14,%r14
    34af:	0f 84 30 02 00 00    	je     36e5 <_copy_to_iter_bpf+0x2a5>
    34b5:	4a 8d 04 37          	lea    (%rdi,%r14,1),%rax
    34b9:	4c 89 f2             	mov    %r14,%rdx
    34bc:	48 89 fe             	mov    %rdi,%rsi
    34bf:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    34c3:	49 8b 07             	mov    (%r15),%rax
    34c6:	48 01 d8             	add    %rbx,%rax
    34c9:	48 89 c7             	mov    %rax,%rdi
    34cc:	e8 00 00 00 00       	callq  34d1 <_copy_to_iter_bpf+0x91>
    34d1:	48 98                	cltq   
    34d3:	4c 89 e1             	mov    %r12,%rcx
    34d6:	49 29 c6             	sub    %rax,%r14
    34d9:	4c 29 f1             	sub    %r14,%rcx
    34dc:	4c 01 f3             	add    %r14,%rbx
    34df:	49 89 ce             	mov    %rcx,%r14
    34e2:	48 85 c0             	test   %rax,%rax
    34e5:	75 05                	jne    34ec <_copy_to_iter_bpf+0xac>
    34e7:	4d 85 f6             	test   %r14,%r14
    34ea:	75 50                	jne    353c <_copy_to_iter_bpf+0xfc>
    34ec:	4d 29 f4             	sub    %r14,%r12
    34ef:	49 39 5f 08          	cmp    %rbx,0x8(%r15)
    34f3:	75 06                	jne    34fb <_copy_to_iter_bpf+0xbb>
    34f5:	49 83 c7 10          	add    $0x10,%r15
    34f9:	31 db                	xor    %ebx,%ebx
    34fb:	4c 89 f8             	mov    %r15,%rax
    34fe:	49 2b 45 18          	sub    0x18(%r13),%rax
    3502:	4d 89 7d 18          	mov    %r15,0x18(%r13)
    3506:	48 c1 f8 04          	sar    $0x4,%rax
    350a:	49 29 45 20          	sub    %rax,0x20(%r13)
    350e:	49 8b 45 10          	mov    0x10(%r13),%rax
    3512:	4c 29 e0             	sub    %r12,%rax
    3515:	49 89 5d 08          	mov    %rbx,0x8(%r13)
    3519:	49 89 45 10          	mov    %rax,0x10(%r13)
    351d:	48 83 c4 28          	add    $0x28,%rsp
    3521:	4c 89 e0             	mov    %r12,%rax
    3524:	5b                   	pop    %rbx
    3525:	41 5c                	pop    %r12
    3527:	41 5d                	pop    %r13
    3529:	41 5e                	pop    %r14
    352b:	41 5f                	pop    %r15
    352d:	5d                   	pop    %rbp
    352e:	c3                   	retq   
    352f:	4c 89 ea             	mov    %r13,%rdx
    3532:	e8 a9 cf ff ff       	callq  4e0 <copy_pipe_to_iter>
    3537:	49 89 c4             	mov    %rax,%r12
    353a:	eb e1                	jmp    351d <_copy_to_iter_bpf+0xdd>
    353c:	49 83 c7 10          	add    $0x10,%r15
    3540:	4c 89 f1             	mov    %r14,%rcx
    3543:	4d 39 77 08          	cmp    %r14,0x8(%r15)
    3547:	49 0f 46 4f 08       	cmovbe 0x8(%r15),%rcx
    354c:	48 85 c9             	test   %rcx,%rcx
    354f:	0f 84 32 02 00 00    	je     3787 <_copy_to_iter_bpf+0x347>
    3555:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    3559:	49 8b 3f             	mov    (%r15),%rdi
    355c:	48 89 ca             	mov    %rcx,%rdx
    355f:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    3563:	48 8d 04 0e          	lea    (%rsi,%rcx,1),%rax
    3567:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    356b:	e8 00 00 00 00       	callq  3570 <_copy_to_iter_bpf+0x130>
    3570:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    3574:	48 98                	cltq   
    3576:	48 29 c1             	sub    %rax,%rcx
    3579:	48 89 cb             	mov    %rcx,%rbx
    357c:	49 29 ce             	sub    %rcx,%r14
    357f:	e9 5e ff ff ff       	jmpq   34e2 <_copy_to_iter_bpf+0xa2>
    3584:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    3588:	31 c0                	xor    %eax,%eax
    358a:	41 89 f1             	mov    %esi,%r9d
    358d:	45 31 c0             	xor    %r8d,%r8d
    3590:	41 89 c6             	mov    %eax,%r14d
    3593:	49 89 f3             	mov    %rsi,%r11
    3596:	4d 89 ea             	mov    %r13,%r10
    3599:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    359d:	4d 89 c5             	mov    %r8,%r13
    35a0:	49 c1 e5 04          	shl    $0x4,%r13
    35a4:	45 85 c9             	test   %r9d,%r9d
    35a7:	4a 8d 14 29          	lea    (%rcx,%r13,1),%rdx
    35ab:	0f 84 7a 01 00 00    	je     372b <_copy_to_iter_bpf+0x2eb>
    35b1:	8b 42 0c             	mov    0xc(%rdx),%eax
    35b4:	44 8b 7a 08          	mov    0x8(%rdx),%r15d
    35b8:	41 bc 00 10 00 00    	mov    $0x1000,%r12d
    35be:	01 d8                	add    %ebx,%eax
    35c0:	41 29 df             	sub    %ebx,%r15d
    35c3:	89 c6                	mov    %eax,%esi
    35c5:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
    35cb:	45 39 cf             	cmp    %r9d,%r15d
    35ce:	45 0f 47 f9          	cmova  %r9d,%r15d
    35d2:	41 29 f4             	sub    %esi,%r12d
    35d5:	45 39 e7             	cmp    %r12d,%r15d
    35d8:	45 0f 47 fc          	cmova  %r12d,%r15d
    35dc:	45 85 ff             	test   %r15d,%r15d
    35df:	74 4c                	je     362d <_copy_to_iter_bpf+0x1ed>
    35e1:	c1 e8 0c             	shr    $0xc,%eax
    35e4:	44 89 f9             	mov    %r15d,%ecx
    35e7:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
    35eb:	48 c1 e0 06          	shl    $0x6,%rax
    35ef:	48 03 02             	add    (%rdx),%rax
    35f2:	4c 8d 24 0f          	lea    (%rdi,%rcx,1),%r12
    35f6:	48 89 fa             	mov    %rdi,%rdx
    35f9:	4c 89 55 c0          	mov    %r10,-0x40(%rbp)
    35fd:	4c 89 5d c8          	mov    %r11,-0x38(%rbp)
    3601:	44 89 4d d0          	mov    %r9d,-0x30(%rbp)
    3605:	48 89 c7             	mov    %rax,%rdi
    3608:	e8 83 ce ff ff       	callq  490 <memcpy_to_page>
    360d:	44 8b 4d d0          	mov    -0x30(%rbp),%r9d
    3611:	4c 8b 55 c0          	mov    -0x40(%rbp),%r10
    3615:	4c 8b 5d c8          	mov    -0x38(%rbp),%r11
    3619:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
    361d:	45 39 f9             	cmp    %r15d,%r9d
    3620:	49 8b 4a 18          	mov    0x18(%r10),%rcx
    3624:	0f 82 c9 00 00 00    	jb     36f3 <_copy_to_iter_bpf+0x2b3>
    362a:	4c 89 e7             	mov    %r12,%rdi
    362d:	45 29 f9             	sub    %r15d,%r9d
    3630:	44 01 fb             	add    %r15d,%ebx
    3633:	0f 84 64 ff ff ff    	je     359d <_copy_to_iter_bpf+0x15d>
    3639:	42 8b 44 29 08       	mov    0x8(%rcx,%r13,1),%eax
    363e:	39 c3                	cmp    %eax,%ebx
    3640:	0f 82 57 ff ff ff    	jb     359d <_copy_to_iter_bpf+0x15d>
    3646:	45 8d 46 01          	lea    0x1(%r14),%r8d
    364a:	4c 89 c2             	mov    %r8,%rdx
    364d:	4d 89 c6             	mov    %r8,%r14
    3650:	48 c1 e2 04          	shl    $0x4,%rdx
    3654:	29 c3                	sub    %eax,%ebx
    3656:	0f 84 41 ff ff ff    	je     359d <_copy_to_iter_bpf+0x15d>
    365c:	8b 44 11 08          	mov    0x8(%rcx,%rdx,1),%eax
    3660:	39 d8                	cmp    %ebx,%eax
    3662:	76 e2                	jbe    3646 <_copy_to_iter_bpf+0x206>
    3664:	e9 34 ff ff ff       	jmpq   359d <_copy_to_iter_bpf+0x15d>
    3669:	4d 8b 75 18          	mov    0x18(%r13),%r14
    366d:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    3671:	49 29 df             	sub    %rbx,%r15
    3674:	49 39 f7             	cmp    %rsi,%r15
    3677:	4c 0f 47 fe          	cmova  %rsi,%r15
    367b:	4d 85 ff             	test   %r15,%r15
    367e:	0f 84 af 00 00 00    	je     3733 <_copy_to_iter_bpf+0x2f3>
    3684:	4a 8d 04 3f          	lea    (%rdi,%r15,1),%rax
    3688:	4c 89 fa             	mov    %r15,%rdx
    368b:	48 89 fe             	mov    %rdi,%rsi
    368e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3692:	49 8b 06             	mov    (%r14),%rax
    3695:	48 01 d8             	add    %rbx,%rax
    3698:	4c 01 fb             	add    %r15,%rbx
    369b:	48 89 c7             	mov    %rax,%rdi
    369e:	e8 00 00 00 00       	callq  36a3 <_copy_to_iter_bpf+0x263>
    36a3:	4c 89 e0             	mov    %r12,%rax
    36a6:	4c 29 f8             	sub    %r15,%rax
    36a9:	49 89 c7             	mov    %rax,%r15
    36ac:	4d 85 ff             	test   %r15,%r15
    36af:	0f 85 8a 00 00 00    	jne    373f <_copy_to_iter_bpf+0x2ff>
    36b5:	49 3b 5e 08          	cmp    0x8(%r14),%rbx
    36b9:	75 06                	jne    36c1 <_copy_to_iter_bpf+0x281>
    36bb:	49 83 c6 10          	add    $0x10,%r14
    36bf:	31 db                	xor    %ebx,%ebx
    36c1:	4c 89 f0             	mov    %r14,%rax
    36c4:	49 2b 45 18          	sub    0x18(%r13),%rax
    36c8:	4d 89 75 18          	mov    %r14,0x18(%r13)
    36cc:	48 c1 f8 04          	sar    $0x4,%rax
    36d0:	49 29 45 20          	sub    %rax,0x20(%r13)
    36d4:	49 8b 45 10          	mov    0x10(%r13),%rax
    36d8:	e9 35 fe ff ff       	jmpq   3512 <_copy_to_iter_bpf+0xd2>
    36dd:	48 01 f3             	add    %rsi,%rbx
    36e0:	e9 2d fe ff ff       	jmpq   3512 <_copy_to_iter_bpf+0xd2>
    36e5:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    36e9:	49 89 f6             	mov    %rsi,%r14
    36ec:	31 c0                	xor    %eax,%eax
    36ee:	e9 ef fd ff ff       	jmpq   34e2 <_copy_to_iter_bpf+0xa2>
    36f3:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 36fa <_copy_to_iter_bpf+0x2ba>
    36fa:	4c 89 d0             	mov    %r10,%rax
    36fd:	4d 89 dc             	mov    %r11,%r12
    3700:	4d 89 ea             	mov    %r13,%r10
    3703:	49 89 c5             	mov    %rax,%r13
    3706:	0f 84 82 00 00 00    	je     378e <_copy_to_iter_bpf+0x34e>
    370c:	4a 8d 14 11          	lea    (%rcx,%r10,1),%rdx
    3710:	49 89 55 18          	mov    %rdx,0x18(%r13)
    3714:	48 2b 55 b0          	sub    -0x50(%rbp),%rdx
    3718:	89 db                	mov    %ebx,%ebx
    371a:	49 8b 45 10          	mov    0x10(%r13),%rax
    371e:	48 c1 fa 04          	sar    $0x4,%rdx
    3722:	49 29 55 20          	sub    %rdx,0x20(%r13)
    3726:	e9 e7 fd ff ff       	jmpq   3512 <_copy_to_iter_bpf+0xd2>
    372b:	4d 89 dc             	mov    %r11,%r12
    372e:	4d 89 d5             	mov    %r10,%r13
    3731:	eb dd                	jmp    3710 <_copy_to_iter_bpf+0x2d0>
    3733:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    3737:	49 89 f7             	mov    %rsi,%r15
    373a:	e9 6d ff ff ff       	jmpq   36ac <_copy_to_iter_bpf+0x26c>
    373f:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    3743:	4c 89 e8             	mov    %r13,%rax
    3746:	4d 89 e5             	mov    %r12,%r13
    3749:	49 89 c4             	mov    %rax,%r12
    374c:	49 83 c6 10          	add    $0x10,%r14
    3750:	4c 89 fb             	mov    %r15,%rbx
    3753:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    3757:	49 0f 46 5e 08       	cmovbe 0x8(%r14),%rbx
    375c:	48 85 db             	test   %rbx,%rbx
    375f:	74 eb                	je     374c <_copy_to_iter_bpf+0x30c>
    3761:	49 8b 3e             	mov    (%r14),%rdi
    3764:	48 8d 04 1e          	lea    (%rsi,%rbx,1),%rax
    3768:	48 89 da             	mov    %rbx,%rdx
    376b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    376f:	e8 00 00 00 00       	callq  3774 <_copy_to_iter_bpf+0x334>
    3774:	49 29 df             	sub    %rbx,%r15
    3777:	75 3b                	jne    37b4 <_copy_to_iter_bpf+0x374>
    3779:	4c 89 e0             	mov    %r12,%rax
    377c:	4d 89 ec             	mov    %r13,%r12
    377f:	49 89 c5             	mov    %rax,%r13
    3782:	e9 2e ff ff ff       	jmpq   36b5 <_copy_to_iter_bpf+0x275>
    3787:	31 c0                	xor    %eax,%eax
    3789:	e9 54 fd ff ff       	jmpq   34e2 <_copy_to_iter_bpf+0xa2>
    378e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    3795:	4c 89 55 d0          	mov    %r10,-0x30(%rbp)
    3799:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 37a0 <_copy_to_iter_bpf+0x360>
    37a0:	e8 00 00 00 00       	callq  37a5 <_copy_to_iter_bpf+0x365>
    37a5:	0f 0b                	ud2    
    37a7:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    37ab:	4c 8b 55 d0          	mov    -0x30(%rbp),%r10
    37af:	e9 58 ff ff ff       	jmpq   370c <_copy_to_iter_bpf+0x2cc>
    37b4:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    37b8:	eb 92                	jmp    374c <_copy_to_iter_bpf+0x30c>
    37ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000037c0 <copy_to_iter_bpf>:
    37c0:	55                   	push   %rbp
    37c1:	48 81 fe ff ff ff 7f 	cmp    $0x7fffffff,%rsi
    37c8:	48 89 e5             	mov    %rsp,%rbp
    37cb:	41 55                	push   %r13
    37cd:	41 54                	push   %r12
    37cf:	53                   	push   %rbx
    37d0:	77 28                	ja     37fa <copy_to_iter_bpf+0x3a>
    37d2:	49 89 d5             	mov    %rdx,%r13
    37d5:	48 89 f3             	mov    %rsi,%rbx
    37d8:	49 89 fc             	mov    %rdi,%r12
    37db:	ba 01 00 00 00       	mov    $0x1,%edx
    37e0:	e8 00 00 00 00       	callq  37e5 <copy_to_iter_bpf+0x25>
    37e5:	4c 89 ea             	mov    %r13,%rdx
    37e8:	48 89 de             	mov    %rbx,%rsi
    37eb:	4c 89 e7             	mov    %r12,%rdi
    37ee:	e8 00 00 00 00       	callq  37f3 <copy_to_iter_bpf+0x33>
    37f3:	5b                   	pop    %rbx
    37f4:	41 5c                	pop    %r12
    37f6:	41 5d                	pop    %r13
    37f8:	5d                   	pop    %rbp
    37f9:	c3                   	retq   
    37fa:	0f 0b                	ud2    
    37fc:	31 c0                	xor    %eax,%eax
    37fe:	eb f3                	jmp    37f3 <copy_to_iter_bpf+0x33>

0000000000003800 <copy_page_to_iter_bpf>:
    3800:	55                   	push   %rbp
    3801:	48 89 f0             	mov    %rsi,%rax
    3804:	49 89 c9             	mov    %rcx,%r9
    3807:	48 01 d0             	add    %rdx,%rax
    380a:	48 89 e5             	mov    %rsp,%rbp
    380d:	49 89 c0             	mov    %rax,%r8
    3810:	53                   	push   %rbx
    3811:	72 32                	jb     3845 <copy_page_to_iter_bpf+0x45>
    3813:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
    3819:	77 2a                	ja     3845 <copy_page_to_iter_bpf+0x45>
    381b:	48 89 d0             	mov    %rdx,%rax
    381e:	41 8b 11             	mov    (%r9),%edx
    3821:	f6 c2 18             	test   $0x18,%dl
    3824:	75 55                	jne    387b <copy_page_to_iter_bpf+0x7b>
    3826:	83 e2 fe             	and    $0xfffffffe,%edx
    3829:	83 fa 40             	cmp    $0x40,%edx
    382c:	74 14                	je     3842 <copy_page_to_iter_bpf+0x42>
    382e:	83 fa 20             	cmp    $0x20,%edx
    3831:	4c 89 c9             	mov    %r9,%rcx
    3834:	48 89 c2             	mov    %rax,%rdx
    3837:	0f 84 93 00 00 00    	je     38d0 <copy_page_to_iter_bpf+0xd0>
    383d:	e8 00 00 00 00       	callq  3842 <copy_page_to_iter_bpf+0x42>
    3842:	5b                   	pop    %rbx
    3843:	5d                   	pop    %rbp
    3844:	c3                   	retq   
    3845:	4c 8b 57 08          	mov    0x8(%rdi),%r10
    3849:	48 89 f9             	mov    %rdi,%rcx
    384c:	41 f6 c2 01          	test   $0x1,%r10b
    3850:	75 67                	jne    38b9 <copy_page_to_iter_bpf+0xb9>
    3852:	4c 39 c2             	cmp    %r8,%rdx
    3855:	77 1d                	ja     3874 <copy_page_to_iter_bpf+0x74>
    3857:	4c 8b 11             	mov    (%rcx),%r10
    385a:	b8 00 10 00 00       	mov    $0x1000,%eax
    385f:	41 f7 c2 00 00 01 00 	test   $0x10000,%r10d
    3866:	74 07                	je     386f <copy_page_to_iter_bpf+0x6f>
    3868:	0f b6 49 51          	movzbl 0x51(%rcx),%ecx
    386c:	48 d3 e0             	shl    %cl,%rax
    386f:	49 39 c0             	cmp    %rax,%r8
    3872:	76 a7                	jbe    381b <copy_page_to_iter_bpf+0x1b>
    3874:	0f 0b                	ud2    
    3876:	31 c0                	xor    %eax,%eax
    3878:	5b                   	pop    %rbx
    3879:	5d                   	pop    %rbp
    387a:	c3                   	retq   
    387b:	65 48 8b 1c 25 00 00 	mov    %gs:0x0,%rbx
    3882:	00 00 
    3884:	83 83 80 12 00 00 01 	addl   $0x1,0x1280(%rbx)
    388b:	48 2b 3d 00 00 00 00 	sub    0x0(%rip),%rdi        # 3892 <copy_page_to_iter_bpf+0x92>
    3892:	4c 89 ca             	mov    %r9,%rdx
    3895:	48 c1 ff 06          	sar    $0x6,%rdi
    3899:	48 c1 e7 0c          	shl    $0xc,%rdi
    389d:	48 03 3d 00 00 00 00 	add    0x0(%rip),%rdi        # 38a4 <copy_page_to_iter_bpf+0xa4>
    38a4:	48 01 f7             	add    %rsi,%rdi
    38a7:	48 89 c6             	mov    %rax,%rsi
    38aa:	e8 11 ff ff ff       	callq  37c0 <copy_to_iter_bpf>
    38af:	83 ab 80 12 00 00 01 	subl   $0x1,0x1280(%rbx)
    38b6:	5b                   	pop    %rbx
    38b7:	5d                   	pop    %rbp
    38b8:	c3                   	retq   
    38b9:	49 8d 4a ff          	lea    -0x1(%r10),%rcx
    38bd:	49 89 f8             	mov    %rdi,%r8
    38c0:	49 29 c8             	sub    %rcx,%r8
    38c3:	49 c1 f8 06          	sar    $0x6,%r8
    38c7:	49 c1 e0 0c          	shl    $0xc,%r8
    38cb:	49 01 c0             	add    %rax,%r8
    38ce:	eb 82                	jmp    3852 <copy_page_to_iter_bpf+0x52>
    38d0:	e8 ab c8 ff ff       	callq  180 <copy_page_to_iter_pipe>
    38d5:	e9 68 ff ff ff       	jmpq   3842 <copy_page_to_iter_bpf+0x42>
    38da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000038e0 <_copy_to_iter>:
    38e0:	55                   	push   %rbp
    38e1:	48 89 e5             	mov    %rsp,%rbp
    38e4:	41 57                	push   %r15
    38e6:	41 56                	push   %r14
    38e8:	41 55                	push   %r13
    38ea:	41 54                	push   %r12
    38ec:	49 89 d5             	mov    %rdx,%r13
    38ef:	53                   	push   %rbx
    38f0:	48 83 ec 28          	sub    $0x28,%rsp
    38f4:	8b 12                	mov    (%rdx),%edx
    38f6:	89 d0                	mov    %edx,%eax
    38f8:	83 e0 fe             	and    $0xfffffffe,%eax
    38fb:	83 f8 20             	cmp    $0x20,%eax
    38fe:	0f 84 cb 00 00 00    	je     39cf <_copy_to_iter+0xef>
    3904:	49 8b 45 10          	mov    0x10(%r13),%rax
    3908:	48 39 f0             	cmp    %rsi,%rax
    390b:	48 0f 46 f0          	cmovbe %rax,%rsi
    390f:	48 85 c0             	test   %rax,%rax
    3912:	49 89 f4             	mov    %rsi,%r12
    3915:	0f 84 a2 00 00 00    	je     39bd <_copy_to_iter+0xdd>
    391b:	f6 c2 10             	test   $0x10,%dl
    391e:	49 8b 5d 08          	mov    0x8(%r13),%rbx
    3922:	0f 85 fc 00 00 00    	jne    3a24 <_copy_to_iter+0x144>
    3928:	f6 c2 08             	test   $0x8,%dl
    392b:	0f 85 d8 01 00 00    	jne    3b09 <_copy_to_iter+0x229>
    3931:	83 e2 40             	and    $0x40,%edx
    3934:	0f 85 43 02 00 00    	jne    3b7d <_copy_to_iter+0x29d>
    393a:	4d 8b 7d 18          	mov    0x18(%r13),%r15
    393e:	4d 8b 77 08          	mov    0x8(%r15),%r14
    3942:	49 29 de             	sub    %rbx,%r14
    3945:	49 39 f6             	cmp    %rsi,%r14
    3948:	4c 0f 47 f6          	cmova  %rsi,%r14
    394c:	4d 85 f6             	test   %r14,%r14
    394f:	0f 84 30 02 00 00    	je     3b85 <_copy_to_iter+0x2a5>
    3955:	4a 8d 04 37          	lea    (%rdi,%r14,1),%rax
    3959:	4c 89 f2             	mov    %r14,%rdx
    395c:	48 89 fe             	mov    %rdi,%rsi
    395f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3963:	49 8b 07             	mov    (%r15),%rax
    3966:	48 01 d8             	add    %rbx,%rax
    3969:	48 89 c7             	mov    %rax,%rdi
    396c:	e8 df d0 ff ff       	callq  a50 <copyout>
    3971:	48 98                	cltq   
    3973:	4c 89 e1             	mov    %r12,%rcx
    3976:	49 29 c6             	sub    %rax,%r14
    3979:	4c 29 f1             	sub    %r14,%rcx
    397c:	4c 01 f3             	add    %r14,%rbx
    397f:	49 89 ce             	mov    %rcx,%r14
    3982:	48 85 c0             	test   %rax,%rax
    3985:	75 05                	jne    398c <_copy_to_iter+0xac>
    3987:	4d 85 f6             	test   %r14,%r14
    398a:	75 50                	jne    39dc <_copy_to_iter+0xfc>
    398c:	4d 29 f4             	sub    %r14,%r12
    398f:	49 39 5f 08          	cmp    %rbx,0x8(%r15)
    3993:	75 06                	jne    399b <_copy_to_iter+0xbb>
    3995:	49 83 c7 10          	add    $0x10,%r15
    3999:	31 db                	xor    %ebx,%ebx
    399b:	4c 89 f8             	mov    %r15,%rax
    399e:	49 2b 45 18          	sub    0x18(%r13),%rax
    39a2:	4d 89 7d 18          	mov    %r15,0x18(%r13)
    39a6:	48 c1 f8 04          	sar    $0x4,%rax
    39aa:	49 29 45 20          	sub    %rax,0x20(%r13)
    39ae:	49 8b 45 10          	mov    0x10(%r13),%rax
    39b2:	4c 29 e0             	sub    %r12,%rax
    39b5:	49 89 5d 08          	mov    %rbx,0x8(%r13)
    39b9:	49 89 45 10          	mov    %rax,0x10(%r13)
    39bd:	48 83 c4 28          	add    $0x28,%rsp
    39c1:	4c 89 e0             	mov    %r12,%rax
    39c4:	5b                   	pop    %rbx
    39c5:	41 5c                	pop    %r12
    39c7:	41 5d                	pop    %r13
    39c9:	41 5e                	pop    %r14
    39cb:	41 5f                	pop    %r15
    39cd:	5d                   	pop    %rbp
    39ce:	c3                   	retq   
    39cf:	4c 89 ea             	mov    %r13,%rdx
    39d2:	e8 09 cb ff ff       	callq  4e0 <copy_pipe_to_iter>
    39d7:	49 89 c4             	mov    %rax,%r12
    39da:	eb e1                	jmp    39bd <_copy_to_iter+0xdd>
    39dc:	49 83 c7 10          	add    $0x10,%r15
    39e0:	4c 89 f1             	mov    %r14,%rcx
    39e3:	4d 39 77 08          	cmp    %r14,0x8(%r15)
    39e7:	49 0f 46 4f 08       	cmovbe 0x8(%r15),%rcx
    39ec:	48 85 c9             	test   %rcx,%rcx
    39ef:	0f 84 32 02 00 00    	je     3c27 <_copy_to_iter+0x347>
    39f5:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    39f9:	49 8b 3f             	mov    (%r15),%rdi
    39fc:	48 89 ca             	mov    %rcx,%rdx
    39ff:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    3a03:	48 8d 04 0e          	lea    (%rsi,%rcx,1),%rax
    3a07:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3a0b:	e8 40 d0 ff ff       	callq  a50 <copyout>
    3a10:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    3a14:	48 98                	cltq   
    3a16:	48 29 c1             	sub    %rax,%rcx
    3a19:	48 89 cb             	mov    %rcx,%rbx
    3a1c:	49 29 ce             	sub    %rcx,%r14
    3a1f:	e9 5e ff ff ff       	jmpq   3982 <_copy_to_iter+0xa2>
    3a24:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    3a28:	31 c0                	xor    %eax,%eax
    3a2a:	41 89 f1             	mov    %esi,%r9d
    3a2d:	45 31 c0             	xor    %r8d,%r8d
    3a30:	41 89 c6             	mov    %eax,%r14d
    3a33:	49 89 f3             	mov    %rsi,%r11
    3a36:	4d 89 ea             	mov    %r13,%r10
    3a39:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    3a3d:	4d 89 c5             	mov    %r8,%r13
    3a40:	49 c1 e5 04          	shl    $0x4,%r13
    3a44:	45 85 c9             	test   %r9d,%r9d
    3a47:	4a 8d 14 29          	lea    (%rcx,%r13,1),%rdx
    3a4b:	0f 84 7a 01 00 00    	je     3bcb <_copy_to_iter+0x2eb>
    3a51:	8b 42 0c             	mov    0xc(%rdx),%eax
    3a54:	44 8b 7a 08          	mov    0x8(%rdx),%r15d
    3a58:	41 bc 00 10 00 00    	mov    $0x1000,%r12d
    3a5e:	01 d8                	add    %ebx,%eax
    3a60:	41 29 df             	sub    %ebx,%r15d
    3a63:	89 c6                	mov    %eax,%esi
    3a65:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
    3a6b:	45 39 cf             	cmp    %r9d,%r15d
    3a6e:	45 0f 47 f9          	cmova  %r9d,%r15d
    3a72:	41 29 f4             	sub    %esi,%r12d
    3a75:	45 39 e7             	cmp    %r12d,%r15d
    3a78:	45 0f 47 fc          	cmova  %r12d,%r15d
    3a7c:	45 85 ff             	test   %r15d,%r15d
    3a7f:	74 4c                	je     3acd <_copy_to_iter+0x1ed>
    3a81:	c1 e8 0c             	shr    $0xc,%eax
    3a84:	44 89 f9             	mov    %r15d,%ecx
    3a87:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
    3a8b:	48 c1 e0 06          	shl    $0x6,%rax
    3a8f:	48 03 02             	add    (%rdx),%rax
    3a92:	4c 8d 24 0f          	lea    (%rdi,%rcx,1),%r12
    3a96:	48 89 fa             	mov    %rdi,%rdx
    3a99:	4c 89 55 c0          	mov    %r10,-0x40(%rbp)
    3a9d:	4c 89 5d c8          	mov    %r11,-0x38(%rbp)
    3aa1:	44 89 4d d0          	mov    %r9d,-0x30(%rbp)
    3aa5:	48 89 c7             	mov    %rax,%rdi
    3aa8:	e8 e3 c9 ff ff       	callq  490 <memcpy_to_page>
    3aad:	44 8b 4d d0          	mov    -0x30(%rbp),%r9d
    3ab1:	4c 8b 55 c0          	mov    -0x40(%rbp),%r10
    3ab5:	4c 8b 5d c8          	mov    -0x38(%rbp),%r11
    3ab9:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
    3abd:	45 39 f9             	cmp    %r15d,%r9d
    3ac0:	49 8b 4a 18          	mov    0x18(%r10),%rcx
    3ac4:	0f 82 c9 00 00 00    	jb     3b93 <_copy_to_iter+0x2b3>
    3aca:	4c 89 e7             	mov    %r12,%rdi
    3acd:	45 29 f9             	sub    %r15d,%r9d
    3ad0:	44 01 fb             	add    %r15d,%ebx
    3ad3:	0f 84 64 ff ff ff    	je     3a3d <_copy_to_iter+0x15d>
    3ad9:	42 8b 44 29 08       	mov    0x8(%rcx,%r13,1),%eax
    3ade:	39 c3                	cmp    %eax,%ebx
    3ae0:	0f 82 57 ff ff ff    	jb     3a3d <_copy_to_iter+0x15d>
    3ae6:	45 8d 46 01          	lea    0x1(%r14),%r8d
    3aea:	4c 89 c2             	mov    %r8,%rdx
    3aed:	4d 89 c6             	mov    %r8,%r14
    3af0:	48 c1 e2 04          	shl    $0x4,%rdx
    3af4:	29 c3                	sub    %eax,%ebx
    3af6:	0f 84 41 ff ff ff    	je     3a3d <_copy_to_iter+0x15d>
    3afc:	8b 44 11 08          	mov    0x8(%rcx,%rdx,1),%eax
    3b00:	39 d8                	cmp    %ebx,%eax
    3b02:	76 e2                	jbe    3ae6 <_copy_to_iter+0x206>
    3b04:	e9 34 ff ff ff       	jmpq   3a3d <_copy_to_iter+0x15d>
    3b09:	4d 8b 75 18          	mov    0x18(%r13),%r14
    3b0d:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    3b11:	49 29 df             	sub    %rbx,%r15
    3b14:	49 39 f7             	cmp    %rsi,%r15
    3b17:	4c 0f 47 fe          	cmova  %rsi,%r15
    3b1b:	4d 85 ff             	test   %r15,%r15
    3b1e:	0f 84 af 00 00 00    	je     3bd3 <_copy_to_iter+0x2f3>
    3b24:	4a 8d 04 3f          	lea    (%rdi,%r15,1),%rax
    3b28:	4c 89 fa             	mov    %r15,%rdx
    3b2b:	48 89 fe             	mov    %rdi,%rsi
    3b2e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3b32:	49 8b 06             	mov    (%r14),%rax
    3b35:	48 01 d8             	add    %rbx,%rax
    3b38:	4c 01 fb             	add    %r15,%rbx
    3b3b:	48 89 c7             	mov    %rax,%rdi
    3b3e:	e8 00 00 00 00       	callq  3b43 <_copy_to_iter+0x263>
    3b43:	4c 89 e0             	mov    %r12,%rax
    3b46:	4c 29 f8             	sub    %r15,%rax
    3b49:	49 89 c7             	mov    %rax,%r15
    3b4c:	4d 85 ff             	test   %r15,%r15
    3b4f:	0f 85 8a 00 00 00    	jne    3bdf <_copy_to_iter+0x2ff>
    3b55:	49 3b 5e 08          	cmp    0x8(%r14),%rbx
    3b59:	75 06                	jne    3b61 <_copy_to_iter+0x281>
    3b5b:	49 83 c6 10          	add    $0x10,%r14
    3b5f:	31 db                	xor    %ebx,%ebx
    3b61:	4c 89 f0             	mov    %r14,%rax
    3b64:	49 2b 45 18          	sub    0x18(%r13),%rax
    3b68:	4d 89 75 18          	mov    %r14,0x18(%r13)
    3b6c:	48 c1 f8 04          	sar    $0x4,%rax
    3b70:	49 29 45 20          	sub    %rax,0x20(%r13)
    3b74:	49 8b 45 10          	mov    0x10(%r13),%rax
    3b78:	e9 35 fe ff ff       	jmpq   39b2 <_copy_to_iter+0xd2>
    3b7d:	48 01 f3             	add    %rsi,%rbx
    3b80:	e9 2d fe ff ff       	jmpq   39b2 <_copy_to_iter+0xd2>
    3b85:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    3b89:	49 89 f6             	mov    %rsi,%r14
    3b8c:	31 c0                	xor    %eax,%eax
    3b8e:	e9 ef fd ff ff       	jmpq   3982 <_copy_to_iter+0xa2>
    3b93:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 3b9a <_copy_to_iter+0x2ba>
    3b9a:	4c 89 d0             	mov    %r10,%rax
    3b9d:	4d 89 dc             	mov    %r11,%r12
    3ba0:	4d 89 ea             	mov    %r13,%r10
    3ba3:	49 89 c5             	mov    %rax,%r13
    3ba6:	0f 84 82 00 00 00    	je     3c2e <_copy_to_iter+0x34e>
    3bac:	4a 8d 14 11          	lea    (%rcx,%r10,1),%rdx
    3bb0:	49 89 55 18          	mov    %rdx,0x18(%r13)
    3bb4:	48 2b 55 b0          	sub    -0x50(%rbp),%rdx
    3bb8:	89 db                	mov    %ebx,%ebx
    3bba:	49 8b 45 10          	mov    0x10(%r13),%rax
    3bbe:	48 c1 fa 04          	sar    $0x4,%rdx
    3bc2:	49 29 55 20          	sub    %rdx,0x20(%r13)
    3bc6:	e9 e7 fd ff ff       	jmpq   39b2 <_copy_to_iter+0xd2>
    3bcb:	4d 89 dc             	mov    %r11,%r12
    3bce:	4d 89 d5             	mov    %r10,%r13
    3bd1:	eb dd                	jmp    3bb0 <_copy_to_iter+0x2d0>
    3bd3:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    3bd7:	49 89 f7             	mov    %rsi,%r15
    3bda:	e9 6d ff ff ff       	jmpq   3b4c <_copy_to_iter+0x26c>
    3bdf:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    3be3:	4c 89 e8             	mov    %r13,%rax
    3be6:	4d 89 e5             	mov    %r12,%r13
    3be9:	49 89 c4             	mov    %rax,%r12
    3bec:	49 83 c6 10          	add    $0x10,%r14
    3bf0:	4c 89 fb             	mov    %r15,%rbx
    3bf3:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    3bf7:	49 0f 46 5e 08       	cmovbe 0x8(%r14),%rbx
    3bfc:	48 85 db             	test   %rbx,%rbx
    3bff:	74 eb                	je     3bec <_copy_to_iter+0x30c>
    3c01:	49 8b 3e             	mov    (%r14),%rdi
    3c04:	48 8d 04 1e          	lea    (%rsi,%rbx,1),%rax
    3c08:	48 89 da             	mov    %rbx,%rdx
    3c0b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3c0f:	e8 00 00 00 00       	callq  3c14 <_copy_to_iter+0x334>
    3c14:	49 29 df             	sub    %rbx,%r15
    3c17:	75 3b                	jne    3c54 <_copy_to_iter+0x374>
    3c19:	4c 89 e0             	mov    %r12,%rax
    3c1c:	4d 89 ec             	mov    %r13,%r12
    3c1f:	49 89 c5             	mov    %rax,%r13
    3c22:	e9 2e ff ff ff       	jmpq   3b55 <_copy_to_iter+0x275>
    3c27:	31 c0                	xor    %eax,%eax
    3c29:	e9 54 fd ff ff       	jmpq   3982 <_copy_to_iter+0xa2>
    3c2e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    3c35:	4c 89 55 d0          	mov    %r10,-0x30(%rbp)
    3c39:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 3c40 <_copy_to_iter+0x360>
    3c40:	e8 00 00 00 00       	callq  3c45 <_copy_to_iter+0x365>
    3c45:	0f 0b                	ud2    
    3c47:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    3c4b:	4c 8b 55 d0          	mov    -0x30(%rbp),%r10
    3c4f:	e9 58 ff ff ff       	jmpq   3bac <_copy_to_iter+0x2cc>
    3c54:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    3c58:	eb 92                	jmp    3bec <_copy_to_iter+0x30c>
    3c5a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000003c60 <copy_page_to_iter>:
    3c60:	55                   	push   %rbp
    3c61:	48 89 f0             	mov    %rsi,%rax
    3c64:	48 89 e5             	mov    %rsp,%rbp
    3c67:	41 57                	push   %r15
    3c69:	41 56                	push   %r14
    3c6b:	41 55                	push   %r13
    3c6d:	41 54                	push   %r12
    3c6f:	49 89 cd             	mov    %rcx,%r13
    3c72:	53                   	push   %rbx
    3c73:	48 83 ec 18          	sub    $0x18,%rsp
    3c77:	48 01 d0             	add    %rdx,%rax
    3c7a:	49 89 c0             	mov    %rax,%r8
    3c7d:	0f 82 97 00 00 00    	jb     3d1a <copy_page_to_iter+0xba>
    3c83:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
    3c89:	0f 87 8b 00 00 00    	ja     3d1a <copy_page_to_iter+0xba>
    3c8f:	41 8b 45 00          	mov    0x0(%r13),%eax
    3c93:	49 89 d4             	mov    %rdx,%r12
    3c96:	48 89 fb             	mov    %rdi,%rbx
    3c99:	a8 18                	test   $0x18,%al
    3c9b:	0f 84 b7 00 00 00    	je     3d58 <copy_page_to_iter+0xf8>
    3ca1:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    3ca8:	00 00 
    3caa:	83 80 80 12 00 00 01 	addl   $0x1,0x1280(%rax)
    3cb1:	48 2b 1d 00 00 00 00 	sub    0x0(%rip),%rbx        # 3cb8 <copy_page_to_iter+0x58>
    3cb8:	48 c1 fb 06          	sar    $0x6,%rbx
    3cbc:	48 c1 e3 0c          	shl    $0xc,%rbx
    3cc0:	48 03 1d 00 00 00 00 	add    0x0(%rip),%rbx        # 3cc7 <copy_page_to_iter+0x67>
    3cc7:	48 01 f3             	add    %rsi,%rbx
    3cca:	48 81 fa ff ff ff 7f 	cmp    $0x7fffffff,%rdx
    3cd1:	0f 87 b1 01 00 00    	ja     3e88 <copy_page_to_iter+0x228>
    3cd7:	4c 89 e6             	mov    %r12,%rsi
    3cda:	ba 01 00 00 00       	mov    $0x1,%edx
    3cdf:	48 89 df             	mov    %rbx,%rdi
    3ce2:	e8 00 00 00 00       	callq  3ce7 <copy_page_to_iter+0x87>
    3ce7:	4c 89 e6             	mov    %r12,%rsi
    3cea:	4c 89 ea             	mov    %r13,%rdx
    3ced:	48 89 df             	mov    %rbx,%rdi
    3cf0:	e8 00 00 00 00       	callq  3cf5 <copy_page_to_iter+0x95>
    3cf5:	49 89 c4             	mov    %rax,%r12
    3cf8:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    3cff:	00 00 
    3d01:	83 a8 80 12 00 00 01 	subl   $0x1,0x1280(%rax)
    3d08:	48 83 c4 18          	add    $0x18,%rsp
    3d0c:	4c 89 e0             	mov    %r12,%rax
    3d0f:	5b                   	pop    %rbx
    3d10:	41 5c                	pop    %r12
    3d12:	41 5d                	pop    %r13
    3d14:	41 5e                	pop    %r14
    3d16:	41 5f                	pop    %r15
    3d18:	5d                   	pop    %rbp
    3d19:	c3                   	retq   
    3d1a:	4c 8b 4f 08          	mov    0x8(%rdi),%r9
    3d1e:	48 89 f9             	mov    %rdi,%rcx
    3d21:	41 f6 c1 01          	test   $0x1,%r9b
    3d25:	0f 85 f8 00 00 00    	jne    3e23 <copy_page_to_iter+0x1c3>
    3d2b:	4c 39 c2             	cmp    %r8,%rdx
    3d2e:	77 21                	ja     3d51 <copy_page_to_iter+0xf1>
    3d30:	4c 8b 09             	mov    (%rcx),%r9
    3d33:	b8 00 10 00 00       	mov    $0x1000,%eax
    3d38:	41 f7 c1 00 00 01 00 	test   $0x10000,%r9d
    3d3f:	74 07                	je     3d48 <copy_page_to_iter+0xe8>
    3d41:	0f b6 49 51          	movzbl 0x51(%rcx),%ecx
    3d45:	48 d3 e0             	shl    %cl,%rax
    3d48:	4c 39 c0             	cmp    %r8,%rax
    3d4b:	0f 83 3e ff ff ff    	jae    3c8f <copy_page_to_iter+0x2f>
    3d51:	0f 0b                	ud2    
    3d53:	45 31 e4             	xor    %r12d,%r12d
    3d56:	eb b0                	jmp    3d08 <copy_page_to_iter+0xa8>
    3d58:	83 e0 fe             	and    $0xfffffffe,%eax
    3d5b:	83 f8 40             	cmp    $0x40,%eax
    3d5e:	74 a8                	je     3d08 <copy_page_to_iter+0xa8>
    3d60:	83 f8 20             	cmp    $0x20,%eax
    3d63:	0f 84 29 01 00 00    	je     3e92 <copy_page_to_iter+0x232>
    3d69:	49 39 55 10          	cmp    %rdx,0x10(%r13)
    3d6d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    3d71:	4d 0f 46 65 10       	cmovbe 0x10(%r13),%r12
    3d76:	4d 85 e4             	test   %r12,%r12
    3d79:	74 8d                	je     3d08 <copy_page_to_iter+0xa8>
    3d7b:	4d 8b 45 18          	mov    0x18(%r13),%r8
    3d7f:	4d 8b 7d 08          	mov    0x8(%r13),%r15
    3d83:	4d 8b 70 08          	mov    0x8(%r8),%r14
    3d87:	49 8b 38             	mov    (%r8),%rdi
    3d8a:	4c 89 45 c8          	mov    %r8,-0x38(%rbp)
    3d8e:	4d 29 fe             	sub    %r15,%r14
    3d91:	4c 01 ff             	add    %r15,%rdi
    3d94:	4d 39 e6             	cmp    %r12,%r14
    3d97:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
    3d9b:	4d 0f 47 f4          	cmova  %r12,%r14
    3d9f:	e8 00 00 00 00       	callq  3da4 <copy_page_to_iter+0x144>
    3da4:	48 2b 1d 00 00 00 00 	sub    0x0(%rip),%rbx        # 3dab <copy_page_to_iter+0x14b>
    3dab:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    3daf:	4c 89 f2             	mov    %r14,%rdx
    3db2:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
    3db6:	48 c1 fb 06          	sar    $0x6,%rbx
    3dba:	48 c1 e3 0c          	shl    $0xc,%rbx
    3dbe:	48 03 1d 00 00 00 00 	add    0x0(%rip),%rbx        # 3dc5 <copy_page_to_iter+0x165>
    3dc5:	48 01 f3             	add    %rsi,%rbx
    3dc8:	48 89 de             	mov    %rbx,%rsi
    3dcb:	e8 80 cc ff ff       	callq  a50 <copyout>
    3dd0:	48 98                	cltq   
    3dd2:	4c 8b 45 c8          	mov    -0x38(%rbp),%r8
    3dd6:	49 29 c6             	sub    %rax,%r14
    3dd9:	4b 8d 0c 37          	lea    (%r15,%r14,1),%rcx
    3ddd:	4d 89 e7             	mov    %r12,%r15
    3de0:	4d 29 f7             	sub    %r14,%r15
    3de3:	74 05                	je     3dea <copy_page_to_iter+0x18a>
    3de5:	48 85 c0             	test   %rax,%rax
    3de8:	74 53                	je     3e3d <copy_page_to_iter+0x1dd>
    3dea:	49 3b 48 08          	cmp    0x8(%r8),%rcx
    3dee:	75 06                	jne    3df6 <copy_page_to_iter+0x196>
    3df0:	49 83 c0 10          	add    $0x10,%r8
    3df4:	31 c9                	xor    %ecx,%ecx
    3df6:	49 8b 45 10          	mov    0x10(%r13),%rax
    3dfa:	49 89 4d 08          	mov    %rcx,0x8(%r13)
    3dfe:	4c 01 f8             	add    %r15,%rax
    3e01:	4c 29 e0             	sub    %r12,%rax
    3e04:	4d 29 fc             	sub    %r15,%r12
    3e07:	49 89 45 10          	mov    %rax,0x10(%r13)
    3e0b:	4c 89 c0             	mov    %r8,%rax
    3e0e:	49 2b 45 18          	sub    0x18(%r13),%rax
    3e12:	4d 89 45 18          	mov    %r8,0x18(%r13)
    3e16:	48 c1 f8 04          	sar    $0x4,%rax
    3e1a:	49 29 45 20          	sub    %rax,0x20(%r13)
    3e1e:	e9 e5 fe ff ff       	jmpq   3d08 <copy_page_to_iter+0xa8>
    3e23:	49 8d 49 ff          	lea    -0x1(%r9),%rcx
    3e27:	49 89 f8             	mov    %rdi,%r8
    3e2a:	49 29 c8             	sub    %rcx,%r8
    3e2d:	49 c1 f8 06          	sar    $0x6,%r8
    3e31:	49 c1 e0 0c          	shl    $0xc,%r8
    3e35:	49 01 c0             	add    %rax,%r8
    3e38:	e9 ee fe ff ff       	jmpq   3d2b <copy_page_to_iter+0xcb>
    3e3d:	4c 01 f3             	add    %r14,%rbx
    3e40:	49 83 c0 10          	add    $0x10,%r8
    3e44:	4d 89 fe             	mov    %r15,%r14
    3e47:	49 8b 38             	mov    (%r8),%rdi
    3e4a:	4d 39 78 08          	cmp    %r15,0x8(%r8)
    3e4e:	48 89 de             	mov    %rbx,%rsi
    3e51:	4c 89 45 d0          	mov    %r8,-0x30(%rbp)
    3e55:	4d 0f 46 70 08       	cmovbe 0x8(%r8),%r14
    3e5a:	4c 89 f2             	mov    %r14,%rdx
    3e5d:	e8 ee cb ff ff       	callq  a50 <copyout>
    3e62:	4c 89 f1             	mov    %r14,%rcx
    3e65:	48 98                	cltq   
    3e67:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
    3e6b:	48 29 c1             	sub    %rax,%rcx
    3e6e:	48 01 cb             	add    %rcx,%rbx
    3e71:	49 29 cf             	sub    %rcx,%r15
    3e74:	48 85 c0             	test   %rax,%rax
    3e77:	0f 85 6d ff ff ff    	jne    3dea <copy_page_to_iter+0x18a>
    3e7d:	4d 85 ff             	test   %r15,%r15
    3e80:	0f 84 64 ff ff ff    	je     3dea <copy_page_to_iter+0x18a>
    3e86:	eb b8                	jmp    3e40 <copy_page_to_iter+0x1e0>
    3e88:	0f 0b                	ud2    
    3e8a:	45 31 e4             	xor    %r12d,%r12d
    3e8d:	e9 66 fe ff ff       	jmpq   3cf8 <copy_page_to_iter+0x98>
    3e92:	4c 89 e9             	mov    %r13,%rcx
    3e95:	e8 e6 c2 ff ff       	callq  180 <copy_page_to_iter_pipe>
    3e9a:	49 89 c4             	mov    %rax,%r12
    3e9d:	e9 66 fe ff ff       	jmpq   3d08 <copy_page_to_iter+0xa8>
    3ea2:	0f 1f 40 00          	nopl   0x0(%rax)
    3ea6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3ead:	00 00 00 

0000000000003eb0 <hash_and_copy_to_iter>:
    3eb0:	55                   	push   %rbp
    3eb1:	48 89 e5             	mov    %rsp,%rbp
    3eb4:	41 57                	push   %r15
    3eb6:	41 56                	push   %r14
    3eb8:	41 55                	push   %r13
    3eba:	41 54                	push   %r12
    3ebc:	49 89 fc             	mov    %rdi,%r12
    3ebf:	53                   	push   %rbx
    3ec0:	48 89 d3             	mov    %rdx,%rbx
    3ec3:	48 83 ec 28          	sub    $0x28,%rsp
    3ec7:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    3ece:	00 00 
    3ed0:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3ed4:	31 c0                	xor    %eax,%eax
    3ed6:	48 81 fe ff ff ff 7f 	cmp    $0x7fffffff,%rsi
    3edd:	77 77                	ja     3f56 <hash_and_copy_to_iter+0xa6>
    3edf:	49 89 ce             	mov    %rcx,%r14
    3ee2:	49 89 f5             	mov    %rsi,%r13
    3ee5:	ba 01 00 00 00       	mov    $0x1,%edx
    3eea:	e8 00 00 00 00       	callq  3eef <hash_and_copy_to_iter+0x3f>
    3eef:	4c 89 f2             	mov    %r14,%rdx
    3ef2:	4c 89 ee             	mov    %r13,%rsi
    3ef5:	4c 89 e7             	mov    %r12,%rdi
    3ef8:	e8 00 00 00 00       	callq  3efd <hash_and_copy_to_iter+0x4d>
    3efd:	49 89 c7             	mov    %rax,%r15
    3f00:	41 89 c6             	mov    %eax,%r14d
    3f03:	4c 8d 6d b0          	lea    -0x50(%rbp),%r13
    3f07:	44 89 f2             	mov    %r14d,%edx
    3f0a:	4c 89 e6             	mov    %r12,%rsi
    3f0d:	4c 89 ef             	mov    %r13,%rdi
    3f10:	e8 00 00 00 00       	callq  3f15 <hash_and_copy_to_iter+0x65>
    3f15:	48 8b 43 20          	mov    0x20(%rbx),%rax
    3f19:	4c 89 6b 38          	mov    %r13,0x38(%rbx)
    3f1d:	48 89 df             	mov    %rbx,%rdi
    3f20:	44 89 73 30          	mov    %r14d,0x30(%rbx)
    3f24:	48 c7 43 40 00 00 00 	movq   $0x0,0x40(%rbx)
    3f2b:	00 
    3f2c:	48 8b 40 c0          	mov    -0x40(%rax),%rax
    3f30:	e8 00 00 00 00       	callq  3f35 <hash_and_copy_to_iter+0x85>
    3f35:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    3f39:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
    3f40:	00 00 
    3f42:	4c 89 f8             	mov    %r15,%rax
    3f45:	75 19                	jne    3f60 <hash_and_copy_to_iter+0xb0>
    3f47:	48 83 c4 28          	add    $0x28,%rsp
    3f4b:	5b                   	pop    %rbx
    3f4c:	41 5c                	pop    %r12
    3f4e:	41 5d                	pop    %r13
    3f50:	41 5e                	pop    %r14
    3f52:	41 5f                	pop    %r15
    3f54:	5d                   	pop    %rbp
    3f55:	c3                   	retq   
    3f56:	0f 0b                	ud2    
    3f58:	45 31 f6             	xor    %r14d,%r14d
    3f5b:	45 31 ff             	xor    %r15d,%r15d
    3f5e:	eb a3                	jmp    3f03 <hash_and_copy_to_iter+0x53>
    3f60:	e8 00 00 00 00       	callq  3f65 <hash_and_copy_to_iter+0xb5>
    3f65:	90                   	nop
    3f66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3f6d:	00 00 00 

0000000000003f70 <_copy_from_iter>:
    3f70:	55                   	push   %rbp
    3f71:	48 89 e5             	mov    %rsp,%rbp
    3f74:	41 57                	push   %r15
    3f76:	41 56                	push   %r14
    3f78:	41 55                	push   %r13
    3f7a:	41 54                	push   %r12
    3f7c:	49 89 d5             	mov    %rdx,%r13
    3f7f:	53                   	push   %rbx
    3f80:	48 83 ec 10          	sub    $0x10,%rsp
    3f84:	8b 12                	mov    (%rdx),%edx
    3f86:	89 d0                	mov    %edx,%eax
    3f88:	83 e0 fe             	and    $0xfffffffe,%eax
    3f8b:	83 f8 20             	cmp    $0x20,%eax
    3f8e:	0f 84 c5 00 00 00    	je     4059 <_copy_from_iter+0xe9>
    3f94:	49 8b 45 10          	mov    0x10(%r13),%rax
    3f98:	48 39 f0             	cmp    %rsi,%rax
    3f9b:	48 0f 46 f0          	cmovbe %rax,%rsi
    3f9f:	48 85 c0             	test   %rax,%rax
    3fa2:	49 89 f4             	mov    %rsi,%r12
    3fa5:	0f 84 9c 00 00 00    	je     4047 <_copy_from_iter+0xd7>
    3fab:	f6 c2 10             	test   $0x10,%dl
    3fae:	49 8b 5d 08          	mov    0x8(%r13),%rbx
    3fb2:	0f 85 f0 00 00 00    	jne    40a8 <_copy_from_iter+0x138>
    3fb8:	f6 c2 08             	test   $0x8,%dl
    3fbb:	0f 85 c1 01 00 00    	jne    4182 <_copy_from_iter+0x212>
    3fc1:	83 e2 40             	and    $0x40,%edx
    3fc4:	0f 85 22 02 00 00    	jne    41ec <_copy_from_iter+0x27c>
    3fca:	4d 8b 7d 18          	mov    0x18(%r13),%r15
    3fce:	4d 8b 77 08          	mov    0x8(%r15),%r14
    3fd2:	49 29 de             	sub    %rbx,%r14
    3fd5:	49 39 f6             	cmp    %rsi,%r14
    3fd8:	4c 0f 47 f6          	cmova  %rsi,%r14
    3fdc:	4d 85 f6             	test   %r14,%r14
    3fdf:	0f 84 0f 02 00 00    	je     41f4 <_copy_from_iter+0x284>
    3fe5:	49 8b 37             	mov    (%r15),%rsi
    3fe8:	4a 8d 04 37          	lea    (%rdi,%r14,1),%rax
    3fec:	4c 89 f2             	mov    %r14,%rdx
    3fef:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3ff3:	48 01 de             	add    %rbx,%rsi
    3ff6:	e8 e5 cb ff ff       	callq  be0 <copyin>
    3ffb:	48 98                	cltq   
    3ffd:	4c 89 e1             	mov    %r12,%rcx
    4000:	49 29 c6             	sub    %rax,%r14
    4003:	4c 29 f1             	sub    %r14,%rcx
    4006:	4c 01 f3             	add    %r14,%rbx
    4009:	49 89 ce             	mov    %rcx,%r14
    400c:	48 85 c0             	test   %rax,%rax
    400f:	75 05                	jne    4016 <_copy_from_iter+0xa6>
    4011:	4d 85 f6             	test   %r14,%r14
    4014:	75 4a                	jne    4060 <_copy_from_iter+0xf0>
    4016:	4d 29 f4             	sub    %r14,%r12
    4019:	49 39 5f 08          	cmp    %rbx,0x8(%r15)
    401d:	75 06                	jne    4025 <_copy_from_iter+0xb5>
    401f:	49 83 c7 10          	add    $0x10,%r15
    4023:	31 db                	xor    %ebx,%ebx
    4025:	4c 89 f8             	mov    %r15,%rax
    4028:	49 2b 45 18          	sub    0x18(%r13),%rax
    402c:	4d 89 7d 18          	mov    %r15,0x18(%r13)
    4030:	48 c1 f8 04          	sar    $0x4,%rax
    4034:	49 29 45 20          	sub    %rax,0x20(%r13)
    4038:	49 8b 45 10          	mov    0x10(%r13),%rax
    403c:	4c 29 e0             	sub    %r12,%rax
    403f:	49 89 5d 08          	mov    %rbx,0x8(%r13)
    4043:	49 89 45 10          	mov    %rax,0x10(%r13)
    4047:	48 83 c4 10          	add    $0x10,%rsp
    404b:	4c 89 e0             	mov    %r12,%rax
    404e:	5b                   	pop    %rbx
    404f:	41 5c                	pop    %r12
    4051:	41 5d                	pop    %r13
    4053:	41 5e                	pop    %r14
    4055:	41 5f                	pop    %r15
    4057:	5d                   	pop    %rbp
    4058:	c3                   	retq   
    4059:	0f 0b                	ud2    
    405b:	45 31 e4             	xor    %r12d,%r12d
    405e:	eb e7                	jmp    4047 <_copy_from_iter+0xd7>
    4060:	49 83 c7 10          	add    $0x10,%r15
    4064:	4c 89 f1             	mov    %r14,%rcx
    4067:	4d 39 77 08          	cmp    %r14,0x8(%r15)
    406b:	49 0f 46 4f 08       	cmovbe 0x8(%r15),%rcx
    4070:	48 85 c9             	test   %rcx,%rcx
    4073:	0f 84 dd 01 00 00    	je     4256 <_copy_from_iter+0x2e6>
    4079:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    407d:	49 8b 37             	mov    (%r15),%rsi
    4080:	48 89 ca             	mov    %rcx,%rdx
    4083:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    4087:	48 8d 04 0f          	lea    (%rdi,%rcx,1),%rax
    408b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    408f:	e8 4c cb ff ff       	callq  be0 <copyin>
    4094:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    4098:	48 98                	cltq   
    409a:	48 29 c1             	sub    %rax,%rcx
    409d:	48 89 cb             	mov    %rcx,%rbx
    40a0:	49 29 ce             	sub    %rcx,%r14
    40a3:	e9 64 ff ff ff       	jmpq   400c <_copy_from_iter+0x9c>
    40a8:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    40ac:	41 89 f3             	mov    %esi,%r11d
    40af:	45 31 c9             	xor    %r9d,%r9d
    40b2:	45 31 d2             	xor    %r10d,%r10d
    40b5:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    40b9:	4d 89 d7             	mov    %r10,%r15
    40bc:	49 c1 e7 04          	shl    $0x4,%r15
    40c0:	45 85 db             	test   %r11d,%r11d
    40c3:	4a 8d 34 39          	lea    (%rcx,%r15,1),%rsi
    40c7:	0f 84 9a 00 00 00    	je     4167 <_copy_from_iter+0x1f7>
    40cd:	8b 46 0c             	mov    0xc(%rsi),%eax
    40d0:	44 8b 46 08          	mov    0x8(%rsi),%r8d
    40d4:	41 be 00 10 00 00    	mov    $0x1000,%r14d
    40da:	01 d8                	add    %ebx,%eax
    40dc:	41 29 d8             	sub    %ebx,%r8d
    40df:	89 c2                	mov    %eax,%edx
    40e1:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    40e7:	45 39 d8             	cmp    %r11d,%r8d
    40ea:	45 0f 47 c3          	cmova  %r11d,%r8d
    40ee:	41 29 d6             	sub    %edx,%r14d
    40f1:	45 39 f0             	cmp    %r14d,%r8d
    40f4:	45 0f 47 c6          	cmova  %r14d,%r8d
    40f8:	45 85 c0             	test   %r8d,%r8d
    40fb:	74 25                	je     4122 <_copy_from_iter+0x1b2>
    40fd:	c1 e8 0c             	shr    $0xc,%eax
    4100:	44 89 c1             	mov    %r8d,%ecx
    4103:	48 c1 e0 06          	shl    $0x6,%rax
    4107:	48 03 06             	add    (%rsi),%rax
    410a:	4c 8d 34 0f          	lea    (%rdi,%rcx,1),%r14
    410e:	48 89 c6             	mov    %rax,%rsi
    4111:	e8 da c2 ff ff       	callq  3f0 <memcpy_from_page>
    4116:	45 39 c3             	cmp    %r8d,%r11d
    4119:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    411d:	72 37                	jb     4156 <_copy_from_iter+0x1e6>
    411f:	4c 89 f7             	mov    %r14,%rdi
    4122:	45 29 c3             	sub    %r8d,%r11d
    4125:	44 01 c3             	add    %r8d,%ebx
    4128:	74 8f                	je     40b9 <_copy_from_iter+0x149>
    412a:	42 8b 44 39 08       	mov    0x8(%rcx,%r15,1),%eax
    412f:	39 c3                	cmp    %eax,%ebx
    4131:	72 86                	jb     40b9 <_copy_from_iter+0x149>
    4133:	45 8d 51 01          	lea    0x1(%r9),%r10d
    4137:	4c 89 d2             	mov    %r10,%rdx
    413a:	4d 89 d1             	mov    %r10,%r9
    413d:	48 c1 e2 04          	shl    $0x4,%rdx
    4141:	29 c3                	sub    %eax,%ebx
    4143:	0f 84 70 ff ff ff    	je     40b9 <_copy_from_iter+0x149>
    4149:	8b 44 11 08          	mov    0x8(%rcx,%rdx,1),%eax
    414d:	39 d8                	cmp    %ebx,%eax
    414f:	76 e2                	jbe    4133 <_copy_from_iter+0x1c3>
    4151:	e9 63 ff ff ff       	jmpq   40b9 <_copy_from_iter+0x149>
    4156:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 415d <_copy_from_iter+0x1ed>
    415d:	0f 84 fa 00 00 00    	je     425d <_copy_from_iter+0x2ed>
    4163:	4a 8d 34 39          	lea    (%rcx,%r15,1),%rsi
    4167:	49 89 75 18          	mov    %rsi,0x18(%r13)
    416b:	48 2b 75 d0          	sub    -0x30(%rbp),%rsi
    416f:	89 db                	mov    %ebx,%ebx
    4171:	49 8b 45 10          	mov    0x10(%r13),%rax
    4175:	48 c1 fe 04          	sar    $0x4,%rsi
    4179:	49 29 75 20          	sub    %rsi,0x20(%r13)
    417d:	e9 ba fe ff ff       	jmpq   403c <_copy_from_iter+0xcc>
    4182:	4d 8b 75 18          	mov    0x18(%r13),%r14
    4186:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    418a:	49 29 df             	sub    %rbx,%r15
    418d:	49 39 f7             	cmp    %rsi,%r15
    4190:	4c 0f 47 fe          	cmova  %rsi,%r15
    4194:	4d 85 ff             	test   %r15,%r15
    4197:	0f 84 ad 00 00 00    	je     424a <_copy_from_iter+0x2da>
    419d:	49 8b 36             	mov    (%r14),%rsi
    41a0:	4a 8d 04 3f          	lea    (%rdi,%r15,1),%rax
    41a4:	4c 89 fa             	mov    %r15,%rdx
    41a7:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    41ab:	48 01 de             	add    %rbx,%rsi
    41ae:	4c 01 fb             	add    %r15,%rbx
    41b1:	e8 00 00 00 00       	callq  41b6 <_copy_from_iter+0x246>
    41b6:	4c 89 e0             	mov    %r12,%rax
    41b9:	4c 29 f8             	sub    %r15,%rax
    41bc:	49 89 c7             	mov    %rax,%r15
    41bf:	4d 85 ff             	test   %r15,%r15
    41c2:	75 3e                	jne    4202 <_copy_from_iter+0x292>
    41c4:	49 3b 5e 08          	cmp    0x8(%r14),%rbx
    41c8:	75 06                	jne    41d0 <_copy_from_iter+0x260>
    41ca:	49 83 c6 10          	add    $0x10,%r14
    41ce:	31 db                	xor    %ebx,%ebx
    41d0:	4c 89 f0             	mov    %r14,%rax
    41d3:	49 2b 45 18          	sub    0x18(%r13),%rax
    41d7:	4d 89 75 18          	mov    %r14,0x18(%r13)
    41db:	48 c1 f8 04          	sar    $0x4,%rax
    41df:	49 29 45 20          	sub    %rax,0x20(%r13)
    41e3:	49 8b 45 10          	mov    0x10(%r13),%rax
    41e7:	e9 50 fe ff ff       	jmpq   403c <_copy_from_iter+0xcc>
    41ec:	48 01 f3             	add    %rsi,%rbx
    41ef:	e9 48 fe ff ff       	jmpq   403c <_copy_from_iter+0xcc>
    41f4:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    41f8:	49 89 f6             	mov    %rsi,%r14
    41fb:	31 c0                	xor    %eax,%eax
    41fd:	e9 0a fe ff ff       	jmpq   400c <_copy_from_iter+0x9c>
    4202:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    4206:	4c 89 e8             	mov    %r13,%rax
    4209:	4d 89 e5             	mov    %r12,%r13
    420c:	49 89 c4             	mov    %rax,%r12
    420f:	49 83 c6 10          	add    $0x10,%r14
    4213:	4c 89 fb             	mov    %r15,%rbx
    4216:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    421a:	49 0f 46 5e 08       	cmovbe 0x8(%r14),%rbx
    421f:	48 85 db             	test   %rbx,%rbx
    4222:	74 eb                	je     420f <_copy_from_iter+0x29f>
    4224:	49 8b 36             	mov    (%r14),%rsi
    4227:	48 8d 04 1f          	lea    (%rdi,%rbx,1),%rax
    422b:	48 89 da             	mov    %rbx,%rdx
    422e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    4232:	e8 00 00 00 00       	callq  4237 <_copy_from_iter+0x2c7>
    4237:	49 29 df             	sub    %rbx,%r15
    423a:	75 3f                	jne    427b <_copy_from_iter+0x30b>
    423c:	4c 89 e0             	mov    %r12,%rax
    423f:	4d 89 ec             	mov    %r13,%r12
    4242:	49 89 c5             	mov    %rax,%r13
    4245:	e9 7a ff ff ff       	jmpq   41c4 <_copy_from_iter+0x254>
    424a:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    424e:	49 89 f7             	mov    %rsi,%r15
    4251:	e9 69 ff ff ff       	jmpq   41bf <_copy_from_iter+0x24f>
    4256:	31 c0                	xor    %eax,%eax
    4258:	e9 af fd ff ff       	jmpq   400c <_copy_from_iter+0x9c>
    425d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    4264:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 426b <_copy_from_iter+0x2fb>
    426b:	e8 00 00 00 00       	callq  4270 <_copy_from_iter+0x300>
    4270:	0f 0b                	ud2    
    4272:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    4276:	e9 e8 fe ff ff       	jmpq   4163 <_copy_from_iter+0x1f3>
    427b:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    427f:	eb 8e                	jmp    420f <_copy_from_iter+0x29f>
    4281:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    4286:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    428d:	00 00 00 

0000000000004290 <copy_page_from_iter>:
    4290:	55                   	push   %rbp
    4291:	48 89 f0             	mov    %rsi,%rax
    4294:	48 89 e5             	mov    %rsp,%rbp
    4297:	41 57                	push   %r15
    4299:	41 56                	push   %r14
    429b:	41 55                	push   %r13
    429d:	41 54                	push   %r12
    429f:	49 89 cf             	mov    %rcx,%r15
    42a2:	53                   	push   %rbx
    42a3:	48 83 ec 18          	sub    $0x18,%rsp
    42a7:	48 01 d0             	add    %rdx,%rax
    42aa:	49 89 c0             	mov    %rax,%r8
    42ad:	0f 82 f1 00 00 00    	jb     43a4 <copy_page_from_iter+0x114>
    42b3:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
    42b9:	0f 87 e5 00 00 00    	ja     43a4 <copy_page_from_iter+0x114>
    42bf:	41 8b 0f             	mov    (%r15),%ecx
    42c2:	89 c8                	mov    %ecx,%eax
    42c4:	83 e0 fe             	and    $0xfffffffe,%eax
    42c7:	83 e8 20             	sub    $0x20,%eax
    42ca:	83 e0 de             	and    $0xffffffde,%eax
    42cd:	0f 84 76 01 00 00    	je     4449 <copy_page_from_iter+0x1b9>
    42d3:	83 e1 18             	and    $0x18,%ecx
    42d6:	48 89 d3             	mov    %rdx,%rbx
    42d9:	49 89 fc             	mov    %rdi,%r12
    42dc:	0f 85 fb 00 00 00    	jne    43dd <copy_page_from_iter+0x14d>
    42e2:	49 39 57 10          	cmp    %rdx,0x10(%r15)
    42e6:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    42ea:	49 0f 46 5f 10       	cmovbe 0x10(%r15),%rbx
    42ef:	48 85 db             	test   %rbx,%rbx
    42f2:	0f 84 25 01 00 00    	je     441d <copy_page_from_iter+0x18d>
    42f8:	4d 8b 47 18          	mov    0x18(%r15),%r8
    42fc:	4d 8b 77 08          	mov    0x8(%r15),%r14
    4300:	4d 8b 68 08          	mov    0x8(%r8),%r13
    4304:	49 8b 00             	mov    (%r8),%rax
    4307:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
    430b:	4d 29 f5             	sub    %r14,%r13
    430e:	4c 01 f0             	add    %r14,%rax
    4311:	49 39 dd             	cmp    %rbx,%r13
    4314:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    4318:	4c 0f 47 eb          	cmova  %rbx,%r13
    431c:	e8 00 00 00 00       	callq  4321 <copy_page_from_iter+0x91>
    4321:	4c 2b 25 00 00 00 00 	sub    0x0(%rip),%r12        # 4328 <copy_page_from_iter+0x98>
    4328:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    432c:	4c 89 ea             	mov    %r13,%rdx
    432f:	49 c1 fc 06          	sar    $0x6,%r12
    4333:	49 c1 e4 0c          	shl    $0xc,%r12
    4337:	4c 03 25 00 00 00 00 	add    0x0(%rip),%r12        # 433e <copy_page_from_iter+0xae>
    433e:	49 01 f4             	add    %rsi,%r12
    4341:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
    4345:	4c 89 e7             	mov    %r12,%rdi
    4348:	e8 93 c8 ff ff       	callq  be0 <copyin>
    434d:	48 98                	cltq   
    434f:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
    4353:	49 29 c5             	sub    %rax,%r13
    4356:	4b 8d 0c 2e          	lea    (%r14,%r13,1),%rcx
    435a:	49 89 de             	mov    %rbx,%r14
    435d:	4d 29 ee             	sub    %r13,%r14
    4360:	48 85 c0             	test   %rax,%rax
    4363:	75 09                	jne    436e <copy_page_from_iter+0xde>
    4365:	4d 85 f6             	test   %r14,%r14
    4368:	0f 85 e1 00 00 00    	jne    444f <copy_page_from_iter+0x1bf>
    436e:	49 3b 48 08          	cmp    0x8(%r8),%rcx
    4372:	75 06                	jne    437a <copy_page_from_iter+0xea>
    4374:	49 83 c0 10          	add    $0x10,%r8
    4378:	31 c9                	xor    %ecx,%ecx
    437a:	49 8b 47 10          	mov    0x10(%r15),%rax
    437e:	49 89 4f 08          	mov    %rcx,0x8(%r15)
    4382:	4c 01 f0             	add    %r14,%rax
    4385:	48 29 d8             	sub    %rbx,%rax
    4388:	4c 29 f3             	sub    %r14,%rbx
    438b:	49 89 47 10          	mov    %rax,0x10(%r15)
    438f:	4c 89 c0             	mov    %r8,%rax
    4392:	49 2b 47 18          	sub    0x18(%r15),%rax
    4396:	4d 89 47 18          	mov    %r8,0x18(%r15)
    439a:	48 c1 f8 04          	sar    $0x4,%rax
    439e:	49 29 47 20          	sub    %rax,0x20(%r15)
    43a2:	eb 79                	jmp    441d <copy_page_from_iter+0x18d>
    43a4:	4c 8b 4f 08          	mov    0x8(%rdi),%r9
    43a8:	48 89 f9             	mov    %rdi,%rcx
    43ab:	41 f6 c1 01          	test   $0x1,%r9b
    43af:	75 7e                	jne    442f <copy_page_from_iter+0x19f>
    43b1:	4c 39 c2             	cmp    %r8,%rdx
    43b4:	77 21                	ja     43d7 <copy_page_from_iter+0x147>
    43b6:	4c 8b 09             	mov    (%rcx),%r9
    43b9:	b8 00 10 00 00       	mov    $0x1000,%eax
    43be:	41 f7 c1 00 00 01 00 	test   $0x10000,%r9d
    43c5:	74 07                	je     43ce <copy_page_from_iter+0x13e>
    43c7:	0f b6 49 51          	movzbl 0x51(%rcx),%ecx
    43cb:	48 d3 e0             	shl    %cl,%rax
    43ce:	49 39 c0             	cmp    %rax,%r8
    43d1:	0f 86 e8 fe ff ff    	jbe    42bf <copy_page_from_iter+0x2f>
    43d7:	0f 0b                	ud2    
    43d9:	31 db                	xor    %ebx,%ebx
    43db:	eb 40                	jmp    441d <copy_page_from_iter+0x18d>
    43dd:	65 4c 8b 2c 25 00 00 	mov    %gs:0x0,%r13
    43e4:	00 00 
    43e6:	41 83 85 80 12 00 00 	addl   $0x1,0x1280(%r13)
    43ed:	01 
    43ee:	48 2b 3d 00 00 00 00 	sub    0x0(%rip),%rdi        # 43f5 <copy_page_from_iter+0x165>
    43f5:	4c 89 fa             	mov    %r15,%rdx
    43f8:	48 c1 ff 06          	sar    $0x6,%rdi
    43fc:	48 c1 e7 0c          	shl    $0xc,%rdi
    4400:	48 03 3d 00 00 00 00 	add    0x0(%rip),%rdi        # 4407 <copy_page_from_iter+0x177>
    4407:	48 01 f7             	add    %rsi,%rdi
    440a:	48 89 de             	mov    %rbx,%rsi
    440d:	e8 00 00 00 00       	callq  4412 <copy_page_from_iter+0x182>
    4412:	48 89 c3             	mov    %rax,%rbx
    4415:	41 83 ad 80 12 00 00 	subl   $0x1,0x1280(%r13)
    441c:	01 
    441d:	48 83 c4 18          	add    $0x18,%rsp
    4421:	48 89 d8             	mov    %rbx,%rax
    4424:	5b                   	pop    %rbx
    4425:	41 5c                	pop    %r12
    4427:	41 5d                	pop    %r13
    4429:	41 5e                	pop    %r14
    442b:	41 5f                	pop    %r15
    442d:	5d                   	pop    %rbp
    442e:	c3                   	retq   
    442f:	49 8d 49 ff          	lea    -0x1(%r9),%rcx
    4433:	49 89 f8             	mov    %rdi,%r8
    4436:	49 29 c8             	sub    %rcx,%r8
    4439:	49 c1 f8 06          	sar    $0x6,%r8
    443d:	49 c1 e0 0c          	shl    $0xc,%r8
    4441:	49 01 c0             	add    %rax,%r8
    4444:	e9 68 ff ff ff       	jmpq   43b1 <copy_page_from_iter+0x121>
    4449:	0f 0b                	ud2    
    444b:	31 db                	xor    %ebx,%ebx
    444d:	eb ce                	jmp    441d <copy_page_from_iter+0x18d>
    444f:	4d 01 ec             	add    %r13,%r12
    4452:	49 83 c0 10          	add    $0x10,%r8
    4456:	4d 89 f5             	mov    %r14,%r13
    4459:	49 8b 30             	mov    (%r8),%rsi
    445c:	4d 39 70 08          	cmp    %r14,0x8(%r8)
    4460:	4c 89 e7             	mov    %r12,%rdi
    4463:	4c 89 45 d0          	mov    %r8,-0x30(%rbp)
    4467:	4d 0f 46 68 08       	cmovbe 0x8(%r8),%r13
    446c:	4c 89 ea             	mov    %r13,%rdx
    446f:	e8 6c c7 ff ff       	callq  be0 <copyin>
    4474:	4c 89 e9             	mov    %r13,%rcx
    4477:	48 98                	cltq   
    4479:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
    447d:	48 29 c1             	sub    %rax,%rcx
    4480:	49 01 cc             	add    %rcx,%r12
    4483:	49 29 ce             	sub    %rcx,%r14
    4486:	48 85 c0             	test   %rax,%rax
    4489:	0f 85 df fe ff ff    	jne    436e <copy_page_from_iter+0xde>
    448f:	4d 85 f6             	test   %r14,%r14
    4492:	0f 84 d6 fe ff ff    	je     436e <copy_page_from_iter+0xde>
    4498:	eb b8                	jmp    4452 <copy_page_from_iter+0x1c2>
    449a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000044a0 <_copy_from_iter_nocache>:
    44a0:	55                   	push   %rbp
    44a1:	48 89 e5             	mov    %rsp,%rbp
    44a4:	41 57                	push   %r15
    44a6:	41 56                	push   %r14
    44a8:	41 55                	push   %r13
    44aa:	41 54                	push   %r12
    44ac:	49 89 d5             	mov    %rdx,%r13
    44af:	53                   	push   %rbx
    44b0:	48 83 ec 10          	sub    $0x10,%rsp
    44b4:	8b 12                	mov    (%rdx),%edx
    44b6:	89 d0                	mov    %edx,%eax
    44b8:	83 e0 fe             	and    $0xfffffffe,%eax
    44bb:	83 f8 20             	cmp    $0x20,%eax
    44be:	0f 84 20 01 00 00    	je     45e4 <_copy_from_iter_nocache+0x144>
    44c4:	49 8b 45 10          	mov    0x10(%r13),%rax
    44c8:	48 39 f0             	cmp    %rsi,%rax
    44cb:	48 0f 46 f0          	cmovbe %rax,%rsi
    44cf:	48 85 c0             	test   %rax,%rax
    44d2:	49 89 f4             	mov    %rsi,%r12
    44d5:	0f 84 a0 00 00 00    	je     457b <_copy_from_iter_nocache+0xdb>
    44db:	f6 c2 10             	test   $0x10,%dl
    44de:	49 8b 5d 08          	mov    0x8(%r13),%rbx
    44e2:	0f 85 4d 01 00 00    	jne    4635 <_copy_from_iter_nocache+0x195>
    44e8:	f6 c2 08             	test   $0x8,%dl
    44eb:	0f 85 9c 00 00 00    	jne    458d <_copy_from_iter_nocache+0xed>
    44f1:	83 e2 40             	and    $0x40,%edx
    44f4:	0f 85 15 02 00 00    	jne    470f <_copy_from_iter_nocache+0x26f>
    44fa:	4d 8b 75 18          	mov    0x18(%r13),%r14
    44fe:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    4502:	49 29 df             	sub    %rbx,%r15
    4505:	49 39 f7             	cmp    %rsi,%r15
    4508:	4c 0f 47 fe          	cmova  %rsi,%r15
    450c:	4d 85 ff             	test   %r15,%r15
    450f:	0f 84 02 02 00 00    	je     4717 <_copy_from_iter_nocache+0x277>
    4515:	49 8b 36             	mov    (%r14),%rsi
    4518:	4a 8d 04 3f          	lea    (%rdi,%r15,1),%rax
    451c:	31 c9                	xor    %ecx,%ecx
    451e:	44 89 fa             	mov    %r15d,%edx
    4521:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    4525:	48 01 de             	add    %rbx,%rsi
    4528:	e8 00 00 00 00       	callq  452d <_copy_from_iter_nocache+0x8d>
    452d:	48 98                	cltq   
    452f:	4c 89 e1             	mov    %r12,%rcx
    4532:	49 29 c7             	sub    %rax,%r15
    4535:	4c 29 f9             	sub    %r15,%rcx
    4538:	4c 01 fb             	add    %r15,%rbx
    453b:	49 89 cf             	mov    %rcx,%r15
    453e:	48 85 c0             	test   %rax,%rax
    4541:	75 09                	jne    454c <_copy_from_iter_nocache+0xac>
    4543:	4d 85 ff             	test   %r15,%r15
    4546:	0f 85 9f 00 00 00    	jne    45eb <_copy_from_iter_nocache+0x14b>
    454c:	4d 29 fc             	sub    %r15,%r12
    454f:	49 39 5e 08          	cmp    %rbx,0x8(%r14)
    4553:	0f 84 80 00 00 00    	je     45d9 <_copy_from_iter_nocache+0x139>
    4559:	4c 89 f0             	mov    %r14,%rax
    455c:	49 2b 45 18          	sub    0x18(%r13),%rax
    4560:	4d 89 75 18          	mov    %r14,0x18(%r13)
    4564:	48 c1 f8 04          	sar    $0x4,%rax
    4568:	49 29 45 20          	sub    %rax,0x20(%r13)
    456c:	49 8b 45 10          	mov    0x10(%r13),%rax
    4570:	4c 29 e0             	sub    %r12,%rax
    4573:	49 89 5d 08          	mov    %rbx,0x8(%r13)
    4577:	49 89 45 10          	mov    %rax,0x10(%r13)
    457b:	48 83 c4 10          	add    $0x10,%rsp
    457f:	4c 89 e0             	mov    %r12,%rax
    4582:	5b                   	pop    %rbx
    4583:	41 5c                	pop    %r12
    4585:	41 5d                	pop    %r13
    4587:	41 5e                	pop    %r14
    4589:	41 5f                	pop    %r15
    458b:	5d                   	pop    %rbp
    458c:	c3                   	retq   
    458d:	4d 8b 75 18          	mov    0x18(%r13),%r14
    4591:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    4595:	49 29 df             	sub    %rbx,%r15
    4598:	49 39 f7             	cmp    %rsi,%r15
    459b:	4c 0f 47 fe          	cmova  %rsi,%r15
    459f:	4d 85 ff             	test   %r15,%r15
    45a2:	0f 84 c5 01 00 00    	je     476d <_copy_from_iter_nocache+0x2cd>
    45a8:	49 8b 36             	mov    (%r14),%rsi
    45ab:	4a 8d 04 3f          	lea    (%rdi,%r15,1),%rax
    45af:	4c 89 fa             	mov    %r15,%rdx
    45b2:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    45b6:	48 01 de             	add    %rbx,%rsi
    45b9:	4c 01 fb             	add    %r15,%rbx
    45bc:	e8 00 00 00 00       	callq  45c1 <_copy_from_iter_nocache+0x121>
    45c1:	4c 89 e0             	mov    %r12,%rax
    45c4:	4c 29 f8             	sub    %r15,%rax
    45c7:	49 89 c7             	mov    %rax,%r15
    45ca:	4d 85 ff             	test   %r15,%r15
    45cd:	0f 85 52 01 00 00    	jne    4725 <_copy_from_iter_nocache+0x285>
    45d3:	49 3b 5e 08          	cmp    0x8(%r14),%rbx
    45d7:	75 80                	jne    4559 <_copy_from_iter_nocache+0xb9>
    45d9:	49 83 c6 10          	add    $0x10,%r14
    45dd:	31 db                	xor    %ebx,%ebx
    45df:	e9 75 ff ff ff       	jmpq   4559 <_copy_from_iter_nocache+0xb9>
    45e4:	0f 0b                	ud2    
    45e6:	45 31 e4             	xor    %r12d,%r12d
    45e9:	eb 90                	jmp    457b <_copy_from_iter_nocache+0xdb>
    45eb:	49 83 c6 10          	add    $0x10,%r14
    45ef:	4d 89 f8             	mov    %r15,%r8
    45f2:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    45f6:	4d 0f 46 46 08       	cmovbe 0x8(%r14),%r8
    45fb:	4d 85 c0             	test   %r8,%r8
    45fe:	0f 84 75 01 00 00    	je     4779 <_copy_from_iter_nocache+0x2d9>
    4604:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    4608:	49 8b 36             	mov    (%r14),%rsi
    460b:	44 89 c2             	mov    %r8d,%edx
    460e:	31 c9                	xor    %ecx,%ecx
    4610:	4c 89 45 c8          	mov    %r8,-0x38(%rbp)
    4614:	4a 8d 04 07          	lea    (%rdi,%r8,1),%rax
    4618:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    461c:	e8 00 00 00 00       	callq  4621 <_copy_from_iter_nocache+0x181>
    4621:	4c 8b 45 c8          	mov    -0x38(%rbp),%r8
    4625:	48 98                	cltq   
    4627:	4c 89 c3             	mov    %r8,%rbx
    462a:	48 29 c3             	sub    %rax,%rbx
    462d:	49 29 df             	sub    %rbx,%r15
    4630:	e9 09 ff ff ff       	jmpq   453e <_copy_from_iter_nocache+0x9e>
    4635:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    4639:	41 89 f3             	mov    %esi,%r11d
    463c:	45 31 c9             	xor    %r9d,%r9d
    463f:	45 31 d2             	xor    %r10d,%r10d
    4642:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    4646:	4d 89 d7             	mov    %r10,%r15
    4649:	49 c1 e7 04          	shl    $0x4,%r15
    464d:	45 85 db             	test   %r11d,%r11d
    4650:	4a 8d 34 39          	lea    (%rcx,%r15,1),%rsi
    4654:	0f 84 9a 00 00 00    	je     46f4 <_copy_from_iter_nocache+0x254>
    465a:	8b 46 0c             	mov    0xc(%rsi),%eax
    465d:	44 8b 46 08          	mov    0x8(%rsi),%r8d
    4661:	41 be 00 10 00 00    	mov    $0x1000,%r14d
    4667:	01 d8                	add    %ebx,%eax
    4669:	41 29 d8             	sub    %ebx,%r8d
    466c:	89 c2                	mov    %eax,%edx
    466e:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    4674:	45 39 d8             	cmp    %r11d,%r8d
    4677:	45 0f 47 c3          	cmova  %r11d,%r8d
    467b:	41 29 d6             	sub    %edx,%r14d
    467e:	45 39 f0             	cmp    %r14d,%r8d
    4681:	45 0f 47 c6          	cmova  %r14d,%r8d
    4685:	45 85 c0             	test   %r8d,%r8d
    4688:	74 25                	je     46af <_copy_from_iter_nocache+0x20f>
    468a:	c1 e8 0c             	shr    $0xc,%eax
    468d:	44 89 c1             	mov    %r8d,%ecx
    4690:	48 c1 e0 06          	shl    $0x6,%rax
    4694:	48 03 06             	add    (%rsi),%rax
    4697:	4c 8d 34 0f          	lea    (%rdi,%rcx,1),%r14
    469b:	48 89 c6             	mov    %rax,%rsi
    469e:	e8 4d bd ff ff       	callq  3f0 <memcpy_from_page>
    46a3:	45 39 c3             	cmp    %r8d,%r11d
    46a6:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    46aa:	72 37                	jb     46e3 <_copy_from_iter_nocache+0x243>
    46ac:	4c 89 f7             	mov    %r14,%rdi
    46af:	45 29 c3             	sub    %r8d,%r11d
    46b2:	44 01 c3             	add    %r8d,%ebx
    46b5:	74 8f                	je     4646 <_copy_from_iter_nocache+0x1a6>
    46b7:	42 8b 44 39 08       	mov    0x8(%rcx,%r15,1),%eax
    46bc:	39 c3                	cmp    %eax,%ebx
    46be:	72 86                	jb     4646 <_copy_from_iter_nocache+0x1a6>
    46c0:	45 8d 51 01          	lea    0x1(%r9),%r10d
    46c4:	4c 89 d2             	mov    %r10,%rdx
    46c7:	4d 89 d1             	mov    %r10,%r9
    46ca:	48 c1 e2 04          	shl    $0x4,%rdx
    46ce:	29 c3                	sub    %eax,%ebx
    46d0:	0f 84 70 ff ff ff    	je     4646 <_copy_from_iter_nocache+0x1a6>
    46d6:	8b 44 11 08          	mov    0x8(%rcx,%rdx,1),%eax
    46da:	39 d8                	cmp    %ebx,%eax
    46dc:	76 e2                	jbe    46c0 <_copy_from_iter_nocache+0x220>
    46de:	e9 63 ff ff ff       	jmpq   4646 <_copy_from_iter_nocache+0x1a6>
    46e3:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 46ea <_copy_from_iter_nocache+0x24a>
    46ea:	0f 84 90 00 00 00    	je     4780 <_copy_from_iter_nocache+0x2e0>
    46f0:	4a 8d 34 39          	lea    (%rcx,%r15,1),%rsi
    46f4:	49 89 75 18          	mov    %rsi,0x18(%r13)
    46f8:	48 2b 75 d0          	sub    -0x30(%rbp),%rsi
    46fc:	89 db                	mov    %ebx,%ebx
    46fe:	49 8b 45 10          	mov    0x10(%r13),%rax
    4702:	48 c1 fe 04          	sar    $0x4,%rsi
    4706:	49 29 75 20          	sub    %rsi,0x20(%r13)
    470a:	e9 61 fe ff ff       	jmpq   4570 <_copy_from_iter_nocache+0xd0>
    470f:	48 01 f3             	add    %rsi,%rbx
    4712:	e9 59 fe ff ff       	jmpq   4570 <_copy_from_iter_nocache+0xd0>
    4717:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    471b:	49 89 f7             	mov    %rsi,%r15
    471e:	31 c0                	xor    %eax,%eax
    4720:	e9 19 fe ff ff       	jmpq   453e <_copy_from_iter_nocache+0x9e>
    4725:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    4729:	4c 89 e8             	mov    %r13,%rax
    472c:	4d 89 e5             	mov    %r12,%r13
    472f:	49 89 c4             	mov    %rax,%r12
    4732:	49 83 c6 10          	add    $0x10,%r14
    4736:	4c 89 fb             	mov    %r15,%rbx
    4739:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    473d:	49 0f 46 5e 08       	cmovbe 0x8(%r14),%rbx
    4742:	48 85 db             	test   %rbx,%rbx
    4745:	74 eb                	je     4732 <_copy_from_iter_nocache+0x292>
    4747:	49 8b 36             	mov    (%r14),%rsi
    474a:	48 8d 04 1f          	lea    (%rdi,%rbx,1),%rax
    474e:	48 89 da             	mov    %rbx,%rdx
    4751:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    4755:	e8 00 00 00 00       	callq  475a <_copy_from_iter_nocache+0x2ba>
    475a:	49 29 df             	sub    %rbx,%r15
    475d:	75 3f                	jne    479e <_copy_from_iter_nocache+0x2fe>
    475f:	4c 89 e0             	mov    %r12,%rax
    4762:	4d 89 ec             	mov    %r13,%r12
    4765:	49 89 c5             	mov    %rax,%r13
    4768:	e9 66 fe ff ff       	jmpq   45d3 <_copy_from_iter_nocache+0x133>
    476d:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    4771:	49 89 f7             	mov    %rsi,%r15
    4774:	e9 51 fe ff ff       	jmpq   45ca <_copy_from_iter_nocache+0x12a>
    4779:	31 c0                	xor    %eax,%eax
    477b:	e9 be fd ff ff       	jmpq   453e <_copy_from_iter_nocache+0x9e>
    4780:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    4787:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 478e <_copy_from_iter_nocache+0x2ee>
    478e:	e8 00 00 00 00       	callq  4793 <_copy_from_iter_nocache+0x2f3>
    4793:	0f 0b                	ud2    
    4795:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    4799:	e9 52 ff ff ff       	jmpq   46f0 <_copy_from_iter_nocache+0x250>
    479e:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    47a2:	eb 8e                	jmp    4732 <_copy_from_iter_nocache+0x292>
    47a4:	66 90                	xchg   %ax,%ax
    47a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    47ad:	00 00 00 

00000000000047b0 <_copy_from_iter_flushcache>:
    47b0:	55                   	push   %rbp
    47b1:	48 89 e5             	mov    %rsp,%rbp
    47b4:	41 57                	push   %r15
    47b6:	41 56                	push   %r14
    47b8:	41 55                	push   %r13
    47ba:	41 54                	push   %r12
    47bc:	49 89 d5             	mov    %rdx,%r13
    47bf:	53                   	push   %rbx
    47c0:	48 83 ec 28          	sub    $0x28,%rsp
    47c4:	8b 12                	mov    (%rdx),%edx
    47c6:	89 d0                	mov    %edx,%eax
    47c8:	83 e0 fe             	and    $0xfffffffe,%eax
    47cb:	83 f8 20             	cmp    $0x20,%eax
    47ce:	0f 84 c5 00 00 00    	je     4899 <_copy_from_iter_flushcache+0xe9>
    47d4:	49 8b 45 10          	mov    0x10(%r13),%rax
    47d8:	48 39 f0             	cmp    %rsi,%rax
    47db:	48 0f 46 f0          	cmovbe %rax,%rsi
    47df:	48 85 c0             	test   %rax,%rax
    47e2:	49 89 f4             	mov    %rsi,%r12
    47e5:	0f 84 9c 00 00 00    	je     4887 <_copy_from_iter_flushcache+0xd7>
    47eb:	f6 c2 10             	test   $0x10,%dl
    47ee:	49 8b 5d 08          	mov    0x8(%r13),%rbx
    47f2:	0f 85 ef 00 00 00    	jne    48e7 <_copy_from_iter_flushcache+0x137>
    47f8:	f6 c2 08             	test   $0x8,%dl
    47fb:	0f 85 c8 01 00 00    	jne    49c9 <_copy_from_iter_flushcache+0x219>
    4801:	83 e2 40             	and    $0x40,%edx
    4804:	0f 85 2d 02 00 00    	jne    4a37 <_copy_from_iter_flushcache+0x287>
    480a:	4d 8b 7d 18          	mov    0x18(%r13),%r15
    480e:	4d 8b 77 08          	mov    0x8(%r15),%r14
    4812:	49 29 de             	sub    %rbx,%r14
    4815:	49 39 f6             	cmp    %rsi,%r14
    4818:	4c 0f 47 f6          	cmova  %rsi,%r14
    481c:	4d 85 f6             	test   %r14,%r14
    481f:	0f 84 1a 02 00 00    	je     4a3f <_copy_from_iter_flushcache+0x28f>
    4825:	49 8b 37             	mov    (%r15),%rsi
    4828:	4a 8d 04 37          	lea    (%rdi,%r14,1),%rax
    482c:	44 89 f2             	mov    %r14d,%edx
    482f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    4833:	48 01 de             	add    %rbx,%rsi
    4836:	e8 00 00 00 00       	callq  483b <_copy_from_iter_flushcache+0x8b>
    483b:	48 98                	cltq   
    483d:	4c 89 e1             	mov    %r12,%rcx
    4840:	49 29 c6             	sub    %rax,%r14
    4843:	4c 29 f1             	sub    %r14,%rcx
    4846:	4c 01 f3             	add    %r14,%rbx
    4849:	49 89 ce             	mov    %rcx,%r14
    484c:	48 85 c0             	test   %rax,%rax
    484f:	75 05                	jne    4856 <_copy_from_iter_flushcache+0xa6>
    4851:	4d 85 f6             	test   %r14,%r14
    4854:	75 4a                	jne    48a0 <_copy_from_iter_flushcache+0xf0>
    4856:	4d 29 f4             	sub    %r14,%r12
    4859:	49 39 5f 08          	cmp    %rbx,0x8(%r15)
    485d:	75 06                	jne    4865 <_copy_from_iter_flushcache+0xb5>
    485f:	49 83 c7 10          	add    $0x10,%r15
    4863:	31 db                	xor    %ebx,%ebx
    4865:	4c 89 f8             	mov    %r15,%rax
    4868:	49 2b 45 18          	sub    0x18(%r13),%rax
    486c:	4d 89 7d 18          	mov    %r15,0x18(%r13)
    4870:	48 c1 f8 04          	sar    $0x4,%rax
    4874:	49 29 45 20          	sub    %rax,0x20(%r13)
    4878:	49 8b 45 10          	mov    0x10(%r13),%rax
    487c:	4c 29 e0             	sub    %r12,%rax
    487f:	49 89 5d 08          	mov    %rbx,0x8(%r13)
    4883:	49 89 45 10          	mov    %rax,0x10(%r13)
    4887:	48 83 c4 28          	add    $0x28,%rsp
    488b:	4c 89 e0             	mov    %r12,%rax
    488e:	5b                   	pop    %rbx
    488f:	41 5c                	pop    %r12
    4891:	41 5d                	pop    %r13
    4893:	41 5e                	pop    %r14
    4895:	41 5f                	pop    %r15
    4897:	5d                   	pop    %rbp
    4898:	c3                   	retq   
    4899:	0f 0b                	ud2    
    489b:	45 31 e4             	xor    %r12d,%r12d
    489e:	eb e7                	jmp    4887 <_copy_from_iter_flushcache+0xd7>
    48a0:	49 83 c7 10          	add    $0x10,%r15
    48a4:	4c 89 f1             	mov    %r14,%rcx
    48a7:	4d 39 77 08          	cmp    %r14,0x8(%r15)
    48ab:	49 0f 46 4f 08       	cmovbe 0x8(%r15),%rcx
    48b0:	48 85 c9             	test   %rcx,%rcx
    48b3:	0f 84 2b 02 00 00    	je     4ae4 <_copy_from_iter_flushcache+0x334>
    48b9:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    48bd:	49 8b 37             	mov    (%r15),%rsi
    48c0:	89 ca                	mov    %ecx,%edx
    48c2:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    48c6:	48 8d 04 0f          	lea    (%rdi,%rcx,1),%rax
    48ca:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    48ce:	e8 00 00 00 00       	callq  48d3 <_copy_from_iter_flushcache+0x123>
    48d3:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    48d7:	48 98                	cltq   
    48d9:	48 29 c1             	sub    %rax,%rcx
    48dc:	48 89 cb             	mov    %rcx,%rbx
    48df:	49 29 ce             	sub    %rcx,%r14
    48e2:	e9 65 ff ff ff       	jmpq   484c <_copy_from_iter_flushcache+0x9c>
    48e7:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    48eb:	31 c0                	xor    %eax,%eax
    48ed:	41 89 f1             	mov    %esi,%r9d
    48f0:	45 31 c0             	xor    %r8d,%r8d
    48f3:	41 89 c6             	mov    %eax,%r14d
    48f6:	49 89 f3             	mov    %rsi,%r11
    48f9:	4d 89 ea             	mov    %r13,%r10
    48fc:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    4900:	4d 89 c5             	mov    %r8,%r13
    4903:	49 c1 e5 04          	shl    $0x4,%r13
    4907:	45 85 c9             	test   %r9d,%r9d
    490a:	4a 8d 34 29          	lea    (%rcx,%r13,1),%rsi
    490e:	0f 84 71 01 00 00    	je     4a85 <_copy_from_iter_flushcache+0x2d5>
    4914:	8b 46 0c             	mov    0xc(%rsi),%eax
    4917:	44 8b 7e 08          	mov    0x8(%rsi),%r15d
    491b:	41 bc 00 10 00 00    	mov    $0x1000,%r12d
    4921:	01 d8                	add    %ebx,%eax
    4923:	41 29 df             	sub    %ebx,%r15d
    4926:	89 c2                	mov    %eax,%edx
    4928:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    492e:	45 39 cf             	cmp    %r9d,%r15d
    4931:	45 0f 47 f9          	cmova  %r9d,%r15d
    4935:	41 29 d4             	sub    %edx,%r12d
    4938:	45 39 e7             	cmp    %r12d,%r15d
    493b:	45 0f 47 fc          	cmova  %r12d,%r15d
    493f:	45 85 ff             	test   %r15d,%r15d
    4942:	74 49                	je     498d <_copy_from_iter_flushcache+0x1dd>
    4944:	c1 e8 0c             	shr    $0xc,%eax
    4947:	44 89 f9             	mov    %r15d,%ecx
    494a:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
    494e:	48 c1 e0 06          	shl    $0x6,%rax
    4952:	48 03 06             	add    (%rsi),%rax
    4955:	4c 89 55 c0          	mov    %r10,-0x40(%rbp)
    4959:	4c 89 5d c8          	mov    %r11,-0x38(%rbp)
    495d:	44 89 4d d0          	mov    %r9d,-0x30(%rbp)
    4961:	4c 8d 24 0f          	lea    (%rdi,%rcx,1),%r12
    4965:	48 89 c6             	mov    %rax,%rsi
    4968:	e8 00 00 00 00       	callq  496d <_copy_from_iter_flushcache+0x1bd>
    496d:	44 8b 4d d0          	mov    -0x30(%rbp),%r9d
    4971:	4c 8b 55 c0          	mov    -0x40(%rbp),%r10
    4975:	4c 8b 5d c8          	mov    -0x38(%rbp),%r11
    4979:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
    497d:	45 39 f9             	cmp    %r15d,%r9d
    4980:	49 8b 4a 18          	mov    0x18(%r10),%rcx
    4984:	0f 82 c3 00 00 00    	jb     4a4d <_copy_from_iter_flushcache+0x29d>
    498a:	4c 89 e7             	mov    %r12,%rdi
    498d:	45 29 f9             	sub    %r15d,%r9d
    4990:	44 01 fb             	add    %r15d,%ebx
    4993:	0f 84 67 ff ff ff    	je     4900 <_copy_from_iter_flushcache+0x150>
    4999:	42 8b 44 29 08       	mov    0x8(%rcx,%r13,1),%eax
    499e:	39 c3                	cmp    %eax,%ebx
    49a0:	0f 82 5a ff ff ff    	jb     4900 <_copy_from_iter_flushcache+0x150>
    49a6:	45 8d 46 01          	lea    0x1(%r14),%r8d
    49aa:	4c 89 c2             	mov    %r8,%rdx
    49ad:	4d 89 c6             	mov    %r8,%r14
    49b0:	48 c1 e2 04          	shl    $0x4,%rdx
    49b4:	29 c3                	sub    %eax,%ebx
    49b6:	0f 84 44 ff ff ff    	je     4900 <_copy_from_iter_flushcache+0x150>
    49bc:	8b 44 11 08          	mov    0x8(%rcx,%rdx,1),%eax
    49c0:	39 d8                	cmp    %ebx,%eax
    49c2:	76 e2                	jbe    49a6 <_copy_from_iter_flushcache+0x1f6>
    49c4:	e9 37 ff ff ff       	jmpq   4900 <_copy_from_iter_flushcache+0x150>
    49c9:	4d 8b 75 18          	mov    0x18(%r13),%r14
    49cd:	4d 8b 7e 08          	mov    0x8(%r14),%r15
    49d1:	49 29 df             	sub    %rbx,%r15
    49d4:	49 39 f7             	cmp    %rsi,%r15
    49d7:	4c 0f 47 fe          	cmova  %rsi,%r15
    49db:	4d 85 ff             	test   %r15,%r15
    49de:	0f 84 ac 00 00 00    	je     4a90 <_copy_from_iter_flushcache+0x2e0>
    49e4:	49 8b 36             	mov    (%r14),%rsi
    49e7:	4a 8d 04 3f          	lea    (%rdi,%r15,1),%rax
    49eb:	4c 89 fa             	mov    %r15,%rdx
    49ee:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    49f2:	48 01 de             	add    %rbx,%rsi
    49f5:	4c 01 fb             	add    %r15,%rbx
    49f8:	e8 00 00 00 00       	callq  49fd <_copy_from_iter_flushcache+0x24d>
    49fd:	4c 89 e0             	mov    %r12,%rax
    4a00:	4c 29 f8             	sub    %r15,%rax
    4a03:	49 89 c7             	mov    %rax,%r15
    4a06:	4d 85 ff             	test   %r15,%r15
    4a09:	0f 85 8d 00 00 00    	jne    4a9c <_copy_from_iter_flushcache+0x2ec>
    4a0f:	49 39 5e 08          	cmp    %rbx,0x8(%r14)
    4a13:	75 06                	jne    4a1b <_copy_from_iter_flushcache+0x26b>
    4a15:	49 83 c6 10          	add    $0x10,%r14
    4a19:	31 db                	xor    %ebx,%ebx
    4a1b:	4c 89 f2             	mov    %r14,%rdx
    4a1e:	49 2b 55 18          	sub    0x18(%r13),%rdx
    4a22:	49 8b 45 10          	mov    0x10(%r13),%rax
    4a26:	4d 89 75 18          	mov    %r14,0x18(%r13)
    4a2a:	48 c1 fa 04          	sar    $0x4,%rdx
    4a2e:	49 29 55 20          	sub    %rdx,0x20(%r13)
    4a32:	e9 45 fe ff ff       	jmpq   487c <_copy_from_iter_flushcache+0xcc>
    4a37:	48 01 f3             	add    %rsi,%rbx
    4a3a:	e9 3d fe ff ff       	jmpq   487c <_copy_from_iter_flushcache+0xcc>
    4a3f:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    4a43:	49 89 f6             	mov    %rsi,%r14
    4a46:	31 c0                	xor    %eax,%eax
    4a48:	e9 ff fd ff ff       	jmpq   484c <_copy_from_iter_flushcache+0x9c>
    4a4d:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 4a54 <_copy_from_iter_flushcache+0x2a4>
    4a54:	4c 89 d0             	mov    %r10,%rax
    4a57:	4d 89 dc             	mov    %r11,%r12
    4a5a:	4d 89 ea             	mov    %r13,%r10
    4a5d:	49 89 c5             	mov    %rax,%r13
    4a60:	0f 84 85 00 00 00    	je     4aeb <_copy_from_iter_flushcache+0x33b>
    4a66:	4e 8d 1c 11          	lea    (%rcx,%r10,1),%r11
    4a6a:	4d 89 5d 18          	mov    %r11,0x18(%r13)
    4a6e:	4c 2b 5d b0          	sub    -0x50(%rbp),%r11
    4a72:	89 db                	mov    %ebx,%ebx
    4a74:	49 8b 45 10          	mov    0x10(%r13),%rax
    4a78:	49 c1 fb 04          	sar    $0x4,%r11
    4a7c:	4d 29 5d 20          	sub    %r11,0x20(%r13)
    4a80:	e9 f7 fd ff ff       	jmpq   487c <_copy_from_iter_flushcache+0xcc>
    4a85:	4d 89 dc             	mov    %r11,%r12
    4a88:	4d 89 d5             	mov    %r10,%r13
    4a8b:	49 89 f3             	mov    %rsi,%r11
    4a8e:	eb da                	jmp    4a6a <_copy_from_iter_flushcache+0x2ba>
    4a90:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    4a94:	49 89 f7             	mov    %rsi,%r15
    4a97:	e9 6a ff ff ff       	jmpq   4a06 <_copy_from_iter_flushcache+0x256>
    4a9c:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    4aa0:	4c 89 e8             	mov    %r13,%rax
    4aa3:	4d 89 e5             	mov    %r12,%r13
    4aa6:	49 89 c4             	mov    %rax,%r12
    4aa9:	49 83 c6 10          	add    $0x10,%r14
    4aad:	4c 89 fb             	mov    %r15,%rbx
    4ab0:	4d 39 7e 08          	cmp    %r15,0x8(%r14)
    4ab4:	49 0f 46 5e 08       	cmovbe 0x8(%r14),%rbx
    4ab9:	48 85 db             	test   %rbx,%rbx
    4abc:	74 eb                	je     4aa9 <_copy_from_iter_flushcache+0x2f9>
    4abe:	49 8b 36             	mov    (%r14),%rsi
    4ac1:	48 8d 04 1f          	lea    (%rdi,%rbx,1),%rax
    4ac5:	48 89 da             	mov    %rbx,%rdx
    4ac8:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    4acc:	e8 00 00 00 00       	callq  4ad1 <_copy_from_iter_flushcache+0x321>
    4ad1:	49 29 df             	sub    %rbx,%r15
    4ad4:	75 3b                	jne    4b11 <_copy_from_iter_flushcache+0x361>
    4ad6:	4c 89 e0             	mov    %r12,%rax
    4ad9:	4d 89 ec             	mov    %r13,%r12
    4adc:	49 89 c5             	mov    %rax,%r13
    4adf:	e9 2b ff ff ff       	jmpq   4a0f <_copy_from_iter_flushcache+0x25f>
    4ae4:	31 c0                	xor    %eax,%eax
    4ae6:	e9 61 fd ff ff       	jmpq   484c <_copy_from_iter_flushcache+0x9c>
    4aeb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    4af2:	4c 89 55 d0          	mov    %r10,-0x30(%rbp)
    4af6:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 4afd <_copy_from_iter_flushcache+0x34d>
    4afd:	e8 00 00 00 00       	callq  4b02 <_copy_from_iter_flushcache+0x352>
    4b02:	0f 0b                	ud2    
    4b04:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    4b08:	4c 8b 55 d0          	mov    -0x30(%rbp),%r10
    4b0c:	e9 55 ff ff ff       	jmpq   4a66 <_copy_from_iter_flushcache+0x2b6>
    4b11:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    4b15:	eb 92                	jmp    4aa9 <_copy_from_iter_flushcache+0x2f9>
    4b17:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    4b1e:	00 00 

0000000000004b20 <csum_and_copy_from_iter>:
    4b20:	55                   	push   %rbp
    4b21:	49 89 d2             	mov    %rdx,%r10
    4b24:	48 89 e5             	mov    %rsp,%rbp
    4b27:	41 57                	push   %r15
    4b29:	41 56                	push   %r14
    4b2b:	41 55                	push   %r13
    4b2d:	41 54                	push   %r12
    4b2f:	53                   	push   %rbx
    4b30:	48 83 ec 60          	sub    $0x60,%rsp
    4b34:	8b 11                	mov    (%rcx),%edx
    4b36:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    4b3d:	00 00 
    4b3f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    4b43:	31 c0                	xor    %eax,%eax
    4b45:	89 d0                	mov    %edx,%eax
    4b47:	83 e0 fe             	and    $0xfffffffe,%eax
    4b4a:	83 e8 20             	sub    $0x20,%eax
    4b4d:	83 e0 de             	and    $0xffffffde,%eax
    4b50:	0f 84 27 01 00 00    	je     4c7d <csum_and_copy_from_iter+0x15d>
    4b56:	41 8b 02             	mov    (%r10),%eax
    4b59:	49 89 cc             	mov    %rcx,%r12
    4b5c:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    4b5f:	48 8b 41 10          	mov    0x10(%rcx),%rax
    4b63:	48 39 f0             	cmp    %rsi,%rax
    4b66:	48 0f 46 f0          	cmovbe %rax,%rsi
    4b6a:	48 85 c0             	test   %rax,%rax
    4b6d:	49 89 f6             	mov    %rsi,%r14
    4b70:	0f 84 bd 00 00 00    	je     4c33 <csum_and_copy_from_iter+0x113>
    4b76:	f6 c2 10             	test   $0x10,%dl
    4b79:	48 8b 59 08          	mov    0x8(%rcx),%rbx
    4b7d:	0f 85 01 01 00 00    	jne    4c84 <csum_and_copy_from_iter+0x164>
    4b83:	f6 c2 08             	test   $0x8,%dl
    4b86:	0f 85 7d 02 00 00    	jne    4e09 <csum_and_copy_from_iter+0x2e9>
    4b8c:	83 e2 40             	and    $0x40,%edx
    4b8f:	0f 85 46 03 00 00    	jne    4edb <csum_and_copy_from_iter+0x3bb>
    4b95:	4c 8b 79 18          	mov    0x18(%rcx),%r15
    4b99:	4d 8b 6f 08          	mov    0x8(%r15),%r13
    4b9d:	49 29 dd             	sub    %rbx,%r13
    4ba0:	49 39 f5             	cmp    %rsi,%r13
    4ba3:	4c 0f 47 ee          	cmova  %rsi,%r13
    4ba7:	4d 85 ed             	test   %r13,%r13
    4baa:	0f 84 c1 03 00 00    	je     4f71 <csum_and_copy_from_iter+0x451>
    4bb0:	49 8b 07             	mov    (%r15),%rax
    4bb3:	4a 8d 0c 2f          	lea    (%rdi,%r13,1),%rcx
    4bb7:	4c 8d 45 cc          	lea    -0x34(%rbp),%r8
    4bbb:	48 89 fe             	mov    %rdi,%rsi
    4bbe:	44 89 ea             	mov    %r13d,%edx
    4bc1:	4c 89 55 b8          	mov    %r10,-0x48(%rbp)
    4bc5:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    4bc9:	31 c9                	xor    %ecx,%ecx
    4bcb:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    4bd2:	48 01 d8             	add    %rbx,%rax
    4bd5:	48 89 c7             	mov    %rax,%rdi
    4bd8:	e8 00 00 00 00       	callq  4bdd <csum_and_copy_from_iter+0xbd>
    4bdd:	8b 4d cc             	mov    -0x34(%rbp),%ecx
    4be0:	4c 8b 55 b8          	mov    -0x48(%rbp),%r10
    4be4:	85 c9                	test   %ecx,%ecx
    4be6:	74 76                	je     4c5e <csum_and_copy_from_iter+0x13e>
    4be8:	4d 89 f1             	mov    %r14,%r9
    4beb:	45 31 db             	xor    %r11d,%r11d
    4bee:	4d 85 ed             	test   %r13,%r13
    4bf1:	75 09                	jne    4bfc <csum_and_copy_from_iter+0xdc>
    4bf3:	4d 85 c9             	test   %r9,%r9
    4bf6:	0f 85 e7 02 00 00    	jne    4ee3 <csum_and_copy_from_iter+0x3c3>
    4bfc:	4d 29 ce             	sub    %r9,%r14
    4bff:	49 39 5f 08          	cmp    %rbx,0x8(%r15)
    4c03:	75 06                	jne    4c0b <csum_and_copy_from_iter+0xeb>
    4c05:	49 83 c7 10          	add    $0x10,%r15
    4c09:	31 db                	xor    %ebx,%ebx
    4c0b:	4c 89 f8             	mov    %r15,%rax
    4c0e:	49 2b 44 24 18       	sub    0x18(%r12),%rax
    4c13:	4d 89 7c 24 18       	mov    %r15,0x18(%r12)
    4c18:	48 c1 f8 04          	sar    $0x4,%rax
    4c1c:	49 29 44 24 20       	sub    %rax,0x20(%r12)
    4c21:	49 8b 44 24 10       	mov    0x10(%r12),%rax
    4c26:	4c 29 f0             	sub    %r14,%rax
    4c29:	49 89 5c 24 08       	mov    %rbx,0x8(%r12)
    4c2e:	49 89 44 24 10       	mov    %rax,0x10(%r12)
    4c33:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    4c36:	41 89 02             	mov    %eax,(%r10)
    4c39:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    4c3d:	65 48 33 3c 25 28 00 	xor    %gs:0x28,%rdi
    4c44:	00 00 
    4c46:	4c 89 f0             	mov    %r14,%rax
    4c49:	0f 85 6f 03 00 00    	jne    4fbe <csum_and_copy_from_iter+0x49e>
    4c4f:	48 83 c4 60          	add    $0x60,%rsp
    4c53:	5b                   	pop    %rbx
    4c54:	41 5c                	pop    %r12
    4c56:	41 5d                	pop    %r13
    4c58:	41 5e                	pop    %r14
    4c5a:	41 5f                	pop    %r15
    4c5c:	5d                   	pop    %rbp
    4c5d:	c3                   	retq   
    4c5e:	4d 89 f1             	mov    %r14,%r9
    4c61:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    4c64:	4c 01 eb             	add    %r13,%rbx
    4c67:	01 c2                	add    %eax,%edx
    4c69:	83 d2 00             	adc    $0x0,%edx
    4c6c:	4d 29 e9             	sub    %r13,%r9
    4c6f:	4d 89 eb             	mov    %r13,%r11
    4c72:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    4c75:	45 31 ed             	xor    %r13d,%r13d
    4c78:	e9 71 ff ff ff       	jmpq   4bee <csum_and_copy_from_iter+0xce>
    4c7d:	0f 0b                	ud2    
    4c7f:	45 31 f6             	xor    %r14d,%r14d
    4c82:	eb b5                	jmp    4c39 <csum_and_copy_from_iter+0x119>
    4c84:	48 8b 71 18          	mov    0x18(%rcx),%rsi
    4c88:	45 31 db             	xor    %r11d,%r11d
    4c8b:	45 89 f0             	mov    %r14d,%r8d
    4c8e:	4c 89 75 80          	mov    %r14,-0x80(%rbp)
    4c92:	45 31 ff             	xor    %r15d,%r15d
    4c95:	4d 89 de             	mov    %r11,%r14
    4c98:	48 c7 45 b8 00 00 00 	movq   $0x0,-0x48(%rbp)
    4c9f:	00 
    4ca0:	48 89 f8             	mov    %rdi,%rax
    4ca3:	4c 89 95 78 ff ff ff 	mov    %r10,-0x88(%rbp)
    4caa:	48 89 75 88          	mov    %rsi,-0x78(%rbp)
    4cae:	49 89 cb             	mov    %rcx,%r11
    4cb1:	4d 89 f4             	mov    %r14,%r12
    4cb4:	49 c1 e4 04          	shl    $0x4,%r12
    4cb8:	45 85 c0             	test   %r8d,%r8d
    4cbb:	4e 8d 0c 26          	lea    (%rsi,%r12,1),%r9
    4cbf:	0f 84 1b 01 00 00    	je     4de0 <csum_and_copy_from_iter+0x2c0>
    4cc5:	41 8b 51 0c          	mov    0xc(%r9),%edx
    4cc9:	45 8b 69 08          	mov    0x8(%r9),%r13d
    4ccd:	bf 00 10 00 00       	mov    $0x1000,%edi
    4cd2:	01 da                	add    %ebx,%edx
    4cd4:	41 29 dd             	sub    %ebx,%r13d
    4cd7:	89 d1                	mov    %edx,%ecx
    4cd9:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
    4cdf:	45 39 c5             	cmp    %r8d,%r13d
    4ce2:	45 0f 47 e8          	cmova  %r8d,%r13d
    4ce6:	29 cf                	sub    %ecx,%edi
    4ce8:	41 39 fd             	cmp    %edi,%r13d
    4ceb:	44 0f 47 ef          	cmova  %edi,%r13d
    4cef:	45 85 ed             	test   %r13d,%r13d
    4cf2:	0f 84 ac 00 00 00    	je     4da4 <csum_and_copy_from_iter+0x284>
    4cf8:	4c 89 5d 90          	mov    %r11,-0x70(%rbp)
    4cfc:	44 89 45 98          	mov    %r8d,-0x68(%rbp)
    4d00:	49 8b 31             	mov    (%r9),%rsi
    4d03:	65 4c 8b 0c 25 00 00 	mov    %gs:0x0,%r9
    4d0a:	00 00 
    4d0c:	41 83 81 80 12 00 00 	addl   $0x1,0x1280(%r9)
    4d13:	01 
    4d14:	4c 89 4d a0          	mov    %r9,-0x60(%rbp)
    4d18:	45 89 ea             	mov    %r13d,%r10d
    4d1b:	c1 ea 0c             	shr    $0xc,%edx
    4d1e:	4a 8d 3c 10          	lea    (%rax,%r10,1),%rdi
    4d22:	4c 89 55 a8          	mov    %r10,-0x58(%rbp)
    4d26:	48 89 7d b0          	mov    %rdi,-0x50(%rbp)
    4d2a:	89 d7                	mov    %edx,%edi
    4d2c:	44 89 ea             	mov    %r13d,%edx
    4d2f:	48 c1 e7 06          	shl    $0x6,%rdi
    4d33:	48 01 f7             	add    %rsi,%rdi
    4d36:	48 2b 3d 00 00 00 00 	sub    0x0(%rip),%rdi        # 4d3d <csum_and_copy_from_iter+0x21d>
    4d3d:	48 89 c6             	mov    %rax,%rsi
    4d40:	48 c1 ff 06          	sar    $0x6,%rdi
    4d44:	48 c1 e7 0c          	shl    $0xc,%rdi
    4d48:	48 03 3d 00 00 00 00 	add    0x0(%rip),%rdi        # 4d4f <csum_and_copy_from_iter+0x22f>
    4d4f:	48 01 cf             	add    %rcx,%rdi
    4d52:	31 c9                	xor    %ecx,%ecx
    4d54:	e8 00 00 00 00       	callq  4d59 <csum_and_copy_from_iter+0x239>
    4d59:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
    4d5d:	89 c2                	mov    %eax,%edx
    4d5f:	c1 ca 08             	ror    $0x8,%edx
    4d62:	40 f6 c7 01          	test   $0x1,%dil
    4d66:	0f 45 c2             	cmovne %edx,%eax
    4d69:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    4d6c:	01 c2                	add    %eax,%edx
    4d6e:	83 d2 00             	adc    $0x0,%edx
    4d71:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    4d74:	4c 8b 4d a0          	mov    -0x60(%rbp),%r9
    4d78:	41 83 a9 80 12 00 00 	subl   $0x1,0x1280(%r9)
    4d7f:	01 
    4d80:	4c 8b 55 a8          	mov    -0x58(%rbp),%r10
    4d84:	44 8b 45 98          	mov    -0x68(%rbp),%r8d
    4d88:	4c 8b 5d 90          	mov    -0x70(%rbp),%r11
    4d8c:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    4d90:	4c 01 d7             	add    %r10,%rdi
    4d93:	45 39 e8             	cmp    %r13d,%r8d
    4d96:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    4d9a:	49 8b 73 18          	mov    0x18(%r11),%rsi
    4d9e:	0f 82 d6 01 00 00    	jb     4f7a <csum_and_copy_from_iter+0x45a>
    4da4:	45 29 e8             	sub    %r13d,%r8d
    4da7:	44 01 eb             	add    %r13d,%ebx
    4daa:	0f 84 01 ff ff ff    	je     4cb1 <csum_and_copy_from_iter+0x191>
    4db0:	42 8b 54 26 08       	mov    0x8(%rsi,%r12,1),%edx
    4db5:	39 da                	cmp    %ebx,%edx
    4db7:	0f 87 f4 fe ff ff    	ja     4cb1 <csum_and_copy_from_iter+0x191>
    4dbd:	45 8d 77 01          	lea    0x1(%r15),%r14d
    4dc1:	4c 89 f1             	mov    %r14,%rcx
    4dc4:	4d 89 f7             	mov    %r14,%r15
    4dc7:	48 c1 e1 04          	shl    $0x4,%rcx
    4dcb:	29 d3                	sub    %edx,%ebx
    4dcd:	0f 84 de fe ff ff    	je     4cb1 <csum_and_copy_from_iter+0x191>
    4dd3:	8b 54 0e 08          	mov    0x8(%rsi,%rcx,1),%edx
    4dd7:	39 da                	cmp    %ebx,%edx
    4dd9:	76 e2                	jbe    4dbd <csum_and_copy_from_iter+0x29d>
    4ddb:	e9 d1 fe ff ff       	jmpq   4cb1 <csum_and_copy_from_iter+0x191>
    4de0:	4d 89 4b 18          	mov    %r9,0x18(%r11)
    4de4:	4c 2b 4d 88          	sub    -0x78(%rbp),%r9
    4de8:	4d 89 dc             	mov    %r11,%r12
    4deb:	4c 8b 75 80          	mov    -0x80(%rbp),%r14
    4def:	4c 8b 95 78 ff ff ff 	mov    -0x88(%rbp),%r10
    4df6:	89 db                	mov    %ebx,%ebx
    4df8:	49 8b 43 10          	mov    0x10(%r11),%rax
    4dfc:	49 c1 f9 04          	sar    $0x4,%r9
    4e00:	4d 29 4b 20          	sub    %r9,0x20(%r11)
    4e04:	e9 1d fe ff ff       	jmpq   4c26 <csum_and_copy_from_iter+0x106>
    4e09:	4c 8b 79 18          	mov    0x18(%rcx),%r15
    4e0d:	49 8b 47 08          	mov    0x8(%r15),%rax
    4e11:	48 29 d8             	sub    %rbx,%rax
    4e14:	48 39 f0             	cmp    %rsi,%rax
    4e17:	48 0f 47 c6          	cmova  %rsi,%rax
    4e1b:	48 85 c0             	test   %rax,%rax
    4e1e:	49 89 c5             	mov    %rax,%r13
    4e21:	0f 84 68 01 00 00    	je     4f8f <csum_and_copy_from_iter+0x46f>
    4e27:	48 8d 04 07          	lea    (%rdi,%rax,1),%rax
    4e2b:	44 89 ea             	mov    %r13d,%edx
    4e2e:	48 89 fe             	mov    %rdi,%rsi
    4e31:	31 c9                	xor    %ecx,%ecx
    4e33:	4c 89 55 b8          	mov    %r10,-0x48(%rbp)
    4e37:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    4e3b:	49 8b 07             	mov    (%r15),%rax
    4e3e:	48 01 d8             	add    %rbx,%rax
    4e41:	4c 01 eb             	add    %r13,%rbx
    4e44:	48 89 c7             	mov    %rax,%rdi
    4e47:	e8 00 00 00 00       	callq  4e4c <csum_and_copy_from_iter+0x32c>
    4e4c:	4c 8b 55 b8          	mov    -0x48(%rbp),%r10
    4e50:	4d 89 f0             	mov    %r14,%r8
    4e53:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    4e56:	4d 29 e8             	sub    %r13,%r8
    4e59:	01 c2                	add    %eax,%edx
    4e5b:	83 d2 00             	adc    $0x0,%edx
    4e5e:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    4e61:	4d 85 c0             	test   %r8,%r8
    4e64:	0f 84 95 fd ff ff    	je     4bff <csum_and_copy_from_iter+0xdf>
    4e6a:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    4e6e:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
    4e72:	4d 89 f4             	mov    %r14,%r12
    4e75:	4d 89 ee             	mov    %r13,%r14
    4e78:	4d 89 c5             	mov    %r8,%r13
    4e7b:	49 83 c7 10          	add    $0x10,%r15
    4e7f:	4c 89 eb             	mov    %r13,%rbx
    4e82:	4d 39 6f 08          	cmp    %r13,0x8(%r15)
    4e86:	49 0f 46 5f 08       	cmovbe 0x8(%r15),%rbx
    4e8b:	48 85 db             	test   %rbx,%rbx
    4e8e:	74 eb                	je     4e7b <csum_and_copy_from_iter+0x35b>
    4e90:	49 8b 3f             	mov    (%r15),%rdi
    4e93:	48 8d 04 1e          	lea    (%rsi,%rbx,1),%rax
    4e97:	31 c9                	xor    %ecx,%ecx
    4e99:	89 da                	mov    %ebx,%edx
    4e9b:	4c 89 55 b0          	mov    %r10,-0x50(%rbp)
    4e9f:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    4ea3:	e8 00 00 00 00       	callq  4ea8 <csum_and_copy_from_iter+0x388>
    4ea8:	89 c2                	mov    %eax,%edx
    4eaa:	4c 8b 55 b0          	mov    -0x50(%rbp),%r10
    4eae:	c1 ca 08             	ror    $0x8,%edx
    4eb1:	41 f6 c6 01          	test   $0x1,%r14b
    4eb5:	0f 45 c2             	cmovne %edx,%eax
    4eb8:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    4ebb:	49 01 de             	add    %rbx,%r14
    4ebe:	01 c2                	add    %eax,%edx
    4ec0:	83 d2 00             	adc    $0x0,%edx
    4ec3:	49 29 dd             	sub    %rbx,%r13
    4ec6:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    4ec9:	0f 85 f4 00 00 00    	jne    4fc3 <csum_and_copy_from_iter+0x4a3>
    4ecf:	4d 89 e6             	mov    %r12,%r14
    4ed2:	4c 8b 65 b8          	mov    -0x48(%rbp),%r12
    4ed6:	e9 24 fd ff ff       	jmpq   4bff <csum_and_copy_from_iter+0xdf>
    4edb:	48 01 f3             	add    %rsi,%rbx
    4ede:	e9 43 fd ff ff       	jmpq   4c26 <csum_and_copy_from_iter+0x106>
    4ee3:	49 83 c7 10          	add    $0x10,%r15
    4ee7:	4d 89 cd             	mov    %r9,%r13
    4eea:	4d 39 4f 08          	cmp    %r9,0x8(%r15)
    4eee:	4d 0f 46 6f 08       	cmovbe 0x8(%r15),%r13
    4ef3:	4d 85 ed             	test   %r13,%r13
    4ef6:	0f 84 f2 fc ff ff    	je     4bee <csum_and_copy_from_iter+0xce>
    4efc:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    4f00:	49 8b 3f             	mov    (%r15),%rdi
    4f03:	4c 8d 45 cc          	lea    -0x34(%rbp),%r8
    4f07:	31 c9                	xor    %ecx,%ecx
    4f09:	44 89 ea             	mov    %r13d,%edx
    4f0c:	4c 89 55 98          	mov    %r10,-0x68(%rbp)
    4f10:	4c 89 5d a0          	mov    %r11,-0x60(%rbp)
    4f14:	4c 89 4d a8          	mov    %r9,-0x58(%rbp)
    4f18:	31 db                	xor    %ebx,%ebx
    4f1a:	4a 8d 04 2e          	lea    (%rsi,%r13,1),%rax
    4f1e:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    4f25:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    4f29:	e8 00 00 00 00       	callq  4f2e <csum_and_copy_from_iter+0x40e>
    4f2e:	8b 55 cc             	mov    -0x34(%rbp),%edx
    4f31:	4c 8b 4d a8          	mov    -0x58(%rbp),%r9
    4f35:	4c 8b 5d a0          	mov    -0x60(%rbp),%r11
    4f39:	4c 8b 55 98          	mov    -0x68(%rbp),%r10
    4f3d:	85 d2                	test   %edx,%edx
    4f3f:	75 23                	jne    4f64 <csum_and_copy_from_iter+0x444>
    4f41:	89 c2                	mov    %eax,%edx
    4f43:	4c 89 eb             	mov    %r13,%rbx
    4f46:	c1 ca 08             	ror    $0x8,%edx
    4f49:	41 f6 c3 01          	test   $0x1,%r11b
    4f4d:	0f 45 c2             	cmovne %edx,%eax
    4f50:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    4f53:	4d 01 eb             	add    %r13,%r11
    4f56:	01 c2                	add    %eax,%edx
    4f58:	83 d2 00             	adc    $0x0,%edx
    4f5b:	4d 29 e9             	sub    %r13,%r9
    4f5e:	89 55 c4             	mov    %edx,-0x3c(%rbp)
    4f61:	45 31 ed             	xor    %r13d,%r13d
    4f64:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    4f68:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    4f6c:	e9 7d fc ff ff       	jmpq   4bee <csum_and_copy_from_iter+0xce>
    4f71:	48 89 7d b0          	mov    %rdi,-0x50(%rbp)
    4f75:	e9 6e fc ff ff       	jmpq   4be8 <csum_and_copy_from_iter+0xc8>
    4f7a:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 4f81 <csum_and_copy_from_iter+0x461>
    4f81:	74 18                	je     4f9b <csum_and_copy_from_iter+0x47b>
    4f83:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    4f87:	45 31 c0             	xor    %r8d,%r8d
    4f8a:	e9 22 fd ff ff       	jmpq   4cb1 <csum_and_copy_from_iter+0x191>
    4f8f:	48 89 7d b0          	mov    %rdi,-0x50(%rbp)
    4f93:	49 89 f0             	mov    %rsi,%r8
    4f96:	e9 c6 fe ff ff       	jmpq   4e61 <csum_and_copy_from_iter+0x341>
    4f9b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    4fa2:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    4fa6:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 4fad <csum_and_copy_from_iter+0x48d>
    4fad:	e8 00 00 00 00       	callq  4fb2 <csum_and_copy_from_iter+0x492>
    4fb2:	0f 0b                	ud2    
    4fb4:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    4fb8:	49 8b 73 18          	mov    0x18(%r11),%rsi
    4fbc:	eb c5                	jmp    4f83 <csum_and_copy_from_iter+0x463>
    4fbe:	e8 00 00 00 00       	callq  4fc3 <csum_and_copy_from_iter+0x4a3>
    4fc3:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
    4fc7:	e9 af fe ff ff       	jmpq   4e7b <csum_and_copy_from_iter+0x35b>
    4fcc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000004fd0 <csum_and_copy_to_iter>:
    4fd0:	55                   	push   %rbp
    4fd1:	49 89 fb             	mov    %rdi,%r11
    4fd4:	48 89 d7             	mov    %rdx,%rdi
    4fd7:	48 89 e5             	mov    %rsp,%rbp
    4fda:	41 57                	push   %r15
    4fdc:	41 56                	push   %r14
    4fde:	41 55                	push   %r13
    4fe0:	41 54                	push   %r12
    4fe2:	49 89 cc             	mov    %rcx,%r12
    4fe5:	53                   	push   %rbx
    4fe6:	48 83 ec 68          	sub    $0x68,%rsp
    4fea:	48 89 55 b0          	mov    %rdx,-0x50(%rbp)
    4fee:	8b 11                	mov    (%rcx),%edx
    4ff0:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    4ff7:	00 00 
    4ff9:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    4ffd:	31 c0                	xor    %eax,%eax
    4fff:	8b 0f                	mov    (%rdi),%ecx
    5001:	89 d0                	mov    %edx,%eax
    5003:	83 e0 fe             	and    $0xfffffffe,%eax
    5006:	83 f8 20             	cmp    $0x20,%eax
    5009:	89 4d b8             	mov    %ecx,-0x48(%rbp)
    500c:	0f 84 22 01 00 00    	je     5134 <csum_and_copy_to_iter+0x164>
    5012:	83 f8 40             	cmp    $0x40,%eax
    5015:	0f 84 4b 01 00 00    	je     5166 <csum_and_copy_to_iter+0x196>
    501b:	49 8b 44 24 10       	mov    0x10(%r12),%rax
    5020:	48 39 f0             	cmp    %rsi,%rax
    5023:	48 0f 46 f0          	cmovbe %rax,%rsi
    5027:	48 85 c0             	test   %rax,%rax
    502a:	49 89 f7             	mov    %rsi,%r15
    502d:	0f 84 b4 00 00 00    	je     50e7 <csum_and_copy_to_iter+0x117>
    5033:	f6 c2 10             	test   $0x10,%dl
    5036:	49 8b 5c 24 08       	mov    0x8(%r12),%rbx
    503b:	0f 85 29 01 00 00    	jne    516a <csum_and_copy_to_iter+0x19a>
    5041:	f6 c2 08             	test   $0x8,%dl
    5044:	0f 85 bd 03 00 00    	jne    5407 <csum_and_copy_to_iter+0x437>
    504a:	83 e2 40             	and    $0x40,%edx
    504d:	0f 85 35 04 00 00    	jne    5488 <csum_and_copy_to_iter+0x4b8>
    5053:	4d 8b 74 24 18       	mov    0x18(%r12),%r14
    5058:	4d 8b 6e 08          	mov    0x8(%r14),%r13
    505c:	49 29 dd             	sub    %rbx,%r13
    505f:	49 39 f5             	cmp    %rsi,%r13
    5062:	4c 0f 47 ee          	cmova  %rsi,%r13
    5066:	4d 85 ed             	test   %r13,%r13
    5069:	0f 84 a3 04 00 00    	je     5512 <csum_and_copy_to_iter+0x542>
    506f:	49 8b 36             	mov    (%r14),%rsi
    5072:	4b 8d 04 2b          	lea    (%r11,%r13,1),%rax
    5076:	4c 8d 45 c8          	lea    -0x38(%rbp),%r8
    507a:	31 c9                	xor    %ecx,%ecx
    507c:	44 89 ea             	mov    %r13d,%edx
    507f:	4c 89 df             	mov    %r11,%rdi
    5082:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%rbp)
    5089:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    508d:	48 01 de             	add    %rbx,%rsi
    5090:	e8 00 00 00 00       	callq  5095 <csum_and_copy_to_iter+0xc5>
    5095:	8b 4d c8             	mov    -0x38(%rbp),%ecx
    5098:	85 c9                	test   %ecx,%ecx
    509a:	74 79                	je     5115 <csum_and_copy_to_iter+0x145>
    509c:	4d 89 fa             	mov    %r15,%r10
    509f:	45 31 db             	xor    %r11d,%r11d
    50a2:	4d 85 ed             	test   %r13,%r13
    50a5:	75 09                	jne    50b0 <csum_and_copy_to_iter+0xe0>
    50a7:	4d 85 d2             	test   %r10,%r10
    50aa:	0f 85 e0 03 00 00    	jne    5490 <csum_and_copy_to_iter+0x4c0>
    50b0:	4d 29 d7             	sub    %r10,%r15
    50b3:	49 39 5e 08          	cmp    %rbx,0x8(%r14)
    50b7:	75 06                	jne    50bf <csum_and_copy_to_iter+0xef>
    50b9:	49 83 c6 10          	add    $0x10,%r14
    50bd:	31 db                	xor    %ebx,%ebx
    50bf:	4c 89 f0             	mov    %r14,%rax
    50c2:	49 2b 44 24 18       	sub    0x18(%r12),%rax
    50c7:	4d 89 74 24 18       	mov    %r14,0x18(%r12)
    50cc:	48 c1 f8 04          	sar    $0x4,%rax
    50d0:	49 29 44 24 20       	sub    %rax,0x20(%r12)
    50d5:	49 8b 44 24 10       	mov    0x10(%r12),%rax
    50da:	4c 29 f8             	sub    %r15,%rax
    50dd:	49 89 5c 24 08       	mov    %rbx,0x8(%r12)
    50e2:	49 89 44 24 10       	mov    %rax,0x10(%r12)
    50e7:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    50eb:	8b 4d b8             	mov    -0x48(%rbp),%ecx
    50ee:	89 08                	mov    %ecx,(%rax)
    50f0:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    50f4:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
    50fb:	00 00 
    50fd:	4c 89 f8             	mov    %r15,%rax
    5100:	0f 85 c2 04 00 00    	jne    55c8 <csum_and_copy_to_iter+0x5f8>
    5106:	48 83 c4 68          	add    $0x68,%rsp
    510a:	5b                   	pop    %rbx
    510b:	41 5c                	pop    %r12
    510d:	41 5d                	pop    %r13
    510f:	41 5e                	pop    %r14
    5111:	41 5f                	pop    %r15
    5113:	5d                   	pop    %rbp
    5114:	c3                   	retq   
    5115:	4d 89 fa             	mov    %r15,%r10
    5118:	8b 55 b8             	mov    -0x48(%rbp),%edx
    511b:	4c 01 eb             	add    %r13,%rbx
    511e:	01 c2                	add    %eax,%edx
    5120:	83 d2 00             	adc    $0x0,%edx
    5123:	4d 29 ea             	sub    %r13,%r10
    5126:	4d 89 eb             	mov    %r13,%r11
    5129:	89 55 b8             	mov    %edx,-0x48(%rbp)
    512c:	45 31 ed             	xor    %r13d,%r13d
    512f:	e9 6e ff ff ff       	jmpq   50a2 <csum_and_copy_to_iter+0xd2>
    5134:	49 8b 44 24 18       	mov    0x18(%r12),%rax
    5139:	4c 89 e7             	mov    %r12,%rdi
    513c:	48 89 75 98          	mov    %rsi,-0x68(%rbp)
    5140:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    5144:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    5148:	44 8b 68 5c          	mov    0x5c(%rax),%r13d
    514c:	e8 5f af ff ff       	callq  b0 <sanity>
    5151:	84 c0                	test   %al,%al
    5153:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    5157:	48 8b 75 98          	mov    -0x68(%rbp),%rsi
    515b:	0f 85 8e 01 00 00    	jne    52ef <csum_and_copy_to_iter+0x31f>
    5161:	45 31 ff             	xor    %r15d,%r15d
    5164:	eb 8a                	jmp    50f0 <csum_and_copy_to_iter+0x120>
    5166:	0f 0b                	ud2    
    5168:	eb f7                	jmp    5161 <csum_and_copy_to_iter+0x191>
    516a:	49 8b 74 24 18       	mov    0x18(%r12),%rsi
    516f:	45 31 d2             	xor    %r10d,%r10d
    5172:	4c 89 df             	mov    %r11,%rdi
    5175:	45 89 f9             	mov    %r15d,%r9d
    5178:	48 c7 45 a8 00 00 00 	movq   $0x0,-0x58(%rbp)
    517f:	00 
    5180:	45 31 ed             	xor    %r13d,%r13d
    5183:	45 89 d6             	mov    %r10d,%r14d
    5186:	4c 89 bd 70 ff ff ff 	mov    %r15,-0x90(%rbp)
    518d:	4d 89 e3             	mov    %r12,%r11
    5190:	48 89 b5 78 ff ff ff 	mov    %rsi,-0x88(%rbp)
    5197:	4d 89 ec             	mov    %r13,%r12
    519a:	49 c1 e4 04          	shl    $0x4,%r12
    519e:	45 85 c9             	test   %r9d,%r9d
    51a1:	4a 8d 0c 26          	lea    (%rsi,%r12,1),%rcx
    51a5:	0f 84 18 01 00 00    	je     52c3 <csum_and_copy_to_iter+0x2f3>
    51ab:	8b 41 0c             	mov    0xc(%rcx),%eax
    51ae:	44 8b 79 08          	mov    0x8(%rcx),%r15d
    51b2:	41 b8 00 10 00 00    	mov    $0x1000,%r8d
    51b8:	01 d8                	add    %ebx,%eax
    51ba:	41 29 df             	sub    %ebx,%r15d
    51bd:	89 c2                	mov    %eax,%edx
    51bf:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    51c5:	45 39 cf             	cmp    %r9d,%r15d
    51c8:	45 0f 47 f9          	cmova  %r9d,%r15d
    51cc:	41 29 d0             	sub    %edx,%r8d
    51cf:	45 39 c7             	cmp    %r8d,%r15d
    51d2:	45 0f 47 f8          	cmova  %r8d,%r15d
    51d6:	45 85 ff             	test   %r15d,%r15d
    51d9:	0f 84 a8 00 00 00    	je     5287 <csum_and_copy_to_iter+0x2b7>
    51df:	4c 89 5d 80          	mov    %r11,-0x80(%rbp)
    51e3:	44 89 4d 8c          	mov    %r9d,-0x74(%rbp)
    51e7:	48 8b 09             	mov    (%rcx),%rcx
    51ea:	65 4c 8b 04 25 00 00 	mov    %gs:0x0,%r8
    51f1:	00 00 
    51f3:	41 83 80 80 12 00 00 	addl   $0x1,0x1280(%r8)
    51fa:	01 
    51fb:	4c 89 45 90          	mov    %r8,-0x70(%rbp)
    51ff:	45 89 fa             	mov    %r15d,%r10d
    5202:	c1 e8 0c             	shr    $0xc,%eax
    5205:	4a 8d 34 17          	lea    (%rdi,%r10,1),%rsi
    5209:	4c 89 55 98          	mov    %r10,-0x68(%rbp)
    520d:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
    5211:	89 c6                	mov    %eax,%esi
    5213:	48 c1 e6 06          	shl    $0x6,%rsi
    5217:	48 01 ce             	add    %rcx,%rsi
    521a:	48 2b 35 00 00 00 00 	sub    0x0(%rip),%rsi        # 5221 <csum_and_copy_to_iter+0x251>
    5221:	31 c9                	xor    %ecx,%ecx
    5223:	48 c1 fe 06          	sar    $0x6,%rsi
    5227:	48 c1 e6 0c          	shl    $0xc,%rsi
    522b:	48 03 35 00 00 00 00 	add    0x0(%rip),%rsi        # 5232 <csum_and_copy_to_iter+0x262>
    5232:	48 01 d6             	add    %rdx,%rsi
    5235:	44 89 fa             	mov    %r15d,%edx
    5238:	e8 00 00 00 00       	callq  523d <csum_and_copy_to_iter+0x26d>
    523d:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    5241:	89 c2                	mov    %eax,%edx
    5243:	c1 ca 08             	ror    $0x8,%edx
    5246:	f6 c1 01             	test   $0x1,%cl
    5249:	0f 45 c2             	cmovne %edx,%eax
    524c:	8b 55 b8             	mov    -0x48(%rbp),%edx
    524f:	01 c2                	add    %eax,%edx
    5251:	83 d2 00             	adc    $0x0,%edx
    5254:	89 55 b8             	mov    %edx,-0x48(%rbp)
    5257:	4c 8b 45 90          	mov    -0x70(%rbp),%r8
    525b:	41 83 a8 80 12 00 00 	subl   $0x1,0x1280(%r8)
    5262:	01 
    5263:	4c 8b 55 98          	mov    -0x68(%rbp),%r10
    5267:	44 8b 4d 8c          	mov    -0x74(%rbp),%r9d
    526b:	4c 8b 5d 80          	mov    -0x80(%rbp),%r11
    526f:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
    5273:	4c 01 d1             	add    %r10,%rcx
    5276:	45 39 f9             	cmp    %r15d,%r9d
    5279:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
    527d:	49 8b 73 18          	mov    0x18(%r11),%rsi
    5281:	0f 82 94 02 00 00    	jb     551b <csum_and_copy_to_iter+0x54b>
    5287:	45 29 f9             	sub    %r15d,%r9d
    528a:	44 01 fb             	add    %r15d,%ebx
    528d:	0f 84 04 ff ff ff    	je     5197 <csum_and_copy_to_iter+0x1c7>
    5293:	42 8b 44 26 08       	mov    0x8(%rsi,%r12,1),%eax
    5298:	39 d8                	cmp    %ebx,%eax
    529a:	0f 87 f7 fe ff ff    	ja     5197 <csum_and_copy_to_iter+0x1c7>
    52a0:	45 8d 6e 01          	lea    0x1(%r14),%r13d
    52a4:	4c 89 ea             	mov    %r13,%rdx
    52a7:	4d 89 ee             	mov    %r13,%r14
    52aa:	48 c1 e2 04          	shl    $0x4,%rdx
    52ae:	29 c3                	sub    %eax,%ebx
    52b0:	0f 84 e1 fe ff ff    	je     5197 <csum_and_copy_to_iter+0x1c7>
    52b6:	8b 44 16 08          	mov    0x8(%rsi,%rdx,1),%eax
    52ba:	39 d8                	cmp    %ebx,%eax
    52bc:	76 e2                	jbe    52a0 <csum_and_copy_to_iter+0x2d0>
    52be:	e9 d4 fe ff ff       	jmpq   5197 <csum_and_copy_to_iter+0x1c7>
    52c3:	48 89 cf             	mov    %rcx,%rdi
    52c6:	48 2b bd 78 ff ff ff 	sub    -0x88(%rbp),%rdi
    52cd:	4d 89 dc             	mov    %r11,%r12
    52d0:	49 89 4c 24 18       	mov    %rcx,0x18(%r12)
    52d5:	4c 8b bd 70 ff ff ff 	mov    -0x90(%rbp),%r15
    52dc:	89 db                	mov    %ebx,%ebx
    52de:	49 8b 43 10          	mov    0x10(%r11),%rax
    52e2:	48 c1 ff 04          	sar    $0x4,%rdi
    52e6:	49 29 7b 20          	sub    %rdi,0x20(%r11)
    52ea:	e9 eb fd ff ff       	jmpq   50da <csum_and_copy_to_iter+0x10a>
    52ef:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
    52f3:	48 8d 55 c4          	lea    -0x3c(%rbp),%rdx
    52f7:	4c 89 e7             	mov    %r12,%rdi
    52fa:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    52fe:	e8 8d af ff ff       	callq  290 <push_pipe>
    5303:	48 85 c0             	test   %rax,%rax
    5306:	49 89 c7             	mov    %rax,%r15
    5309:	0f 84 52 fe ff ff    	je     5161 <csum_and_copy_to_iter+0x191>
    530f:	41 8d 45 ff          	lea    -0x1(%r13),%eax
    5313:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
    5317:	45 31 ed             	xor    %r13d,%r13d
    531a:	4d 89 fe             	mov    %r15,%r14
    531d:	4c 89 7d 90          	mov    %r15,-0x70(%rbp)
    5321:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    5325:	89 45 98             	mov    %eax,-0x68(%rbp)
    5328:	4d 89 ef             	mov    %r13,%r15
    532b:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    532e:	44 8b 6d b8          	mov    -0x48(%rbp),%r13d
    5332:	4d 89 e2             	mov    %r12,%r10
    5335:	4d 89 dc             	mov    %r11,%r12
    5338:	bb 00 10 00 00       	mov    $0x1000,%ebx
    533d:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    5341:	4c 89 55 a8          	mov    %r10,-0x58(%rbp)
    5345:	48 29 d3             	sub    %rdx,%rbx
    5348:	4c 39 f3             	cmp    %r14,%rbx
    534b:	49 0f 47 de          	cmova  %r14,%rbx
    534f:	23 45 98             	and    -0x68(%rbp),%eax
    5352:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    5356:	48 c1 e0 03          	shl    $0x3,%rax
    535a:	48 03 81 90 00 00 00 	add    0x90(%rcx),%rax
    5361:	48 8b 30             	mov    (%rax),%rsi
    5364:	65 4c 8b 04 25 00 00 	mov    %gs:0x0,%r8
    536b:	00 00 
    536d:	41 83 80 80 12 00 00 	addl   $0x1,0x1280(%r8)
    5374:	01 
    5375:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
    5379:	48 2b 35 00 00 00 00 	sub    0x0(%rip),%rsi        # 5380 <csum_and_copy_to_iter+0x3b0>
    5380:	31 c9                	xor    %ecx,%ecx
    5382:	89 da                	mov    %ebx,%edx
    5384:	4c 89 e7             	mov    %r12,%rdi
    5387:	48 c1 fe 06          	sar    $0x6,%rsi
    538b:	48 c1 e6 0c          	shl    $0xc,%rsi
    538f:	48 03 35 00 00 00 00 	add    0x0(%rip),%rsi        # 5396 <csum_and_copy_to_iter+0x3c6>
    5396:	48 03 75 c8          	add    -0x38(%rbp),%rsi
    539a:	e8 00 00 00 00       	callq  539f <csum_and_copy_to_iter+0x3cf>
    539f:	89 c2                	mov    %eax,%edx
    53a1:	c1 ca 08             	ror    $0x8,%edx
    53a4:	41 f6 c7 01          	test   $0x1,%r15b
    53a8:	0f 45 c2             	cmovne %edx,%eax
    53ab:	41 01 c5             	add    %eax,%r13d
    53ae:	41 83 d5 00          	adc    $0x0,%r13d
    53b2:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
    53b6:	41 83 a8 80 12 00 00 	subl   $0x1,0x1280(%r8)
    53bd:	01 
    53be:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    53c2:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    53c5:	49 01 df             	add    %rbx,%r15
    53c8:	4c 8b 55 a8          	mov    -0x58(%rbp),%r10
    53cc:	49 01 dc             	add    %rbx,%r12
    53cf:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
    53d6:	00 
    53d7:	48 01 da             	add    %rbx,%rdx
    53da:	41 89 42 20          	mov    %eax,0x20(%r10)
    53de:	49 89 52 08          	mov    %rdx,0x8(%r10)
    53e2:	83 c0 01             	add    $0x1,%eax
    53e5:	31 d2                	xor    %edx,%edx
    53e7:	49 29 de             	sub    %rbx,%r14
    53ea:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    53ed:	0f 85 45 ff ff ff    	jne    5338 <csum_and_copy_to_iter+0x368>
    53f3:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    53f7:	4c 8b 7d 90          	mov    -0x70(%rbp),%r15
    53fb:	4d 29 7a 10          	sub    %r15,0x10(%r10)
    53ff:	44 89 28             	mov    %r13d,(%rax)
    5402:	e9 e9 fc ff ff       	jmpq   50f0 <csum_and_copy_to_iter+0x120>
    5407:	4d 8b 6c 24 18       	mov    0x18(%r12),%r13
    540c:	4d 8b 75 08          	mov    0x8(%r13),%r14
    5410:	49 29 de             	sub    %rbx,%r14
    5413:	49 39 f6             	cmp    %rsi,%r14
    5416:	4c 0f 47 f6          	cmova  %rsi,%r14
    541a:	4d 85 f6             	test   %r14,%r14
    541d:	0f 84 73 01 00 00    	je     5596 <csum_and_copy_to_iter+0x5c6>
    5423:	49 8b 75 00          	mov    0x0(%r13),%rsi
    5427:	4b 8d 04 33          	lea    (%r11,%r14,1),%rax
    542b:	44 89 f2             	mov    %r14d,%edx
    542e:	31 c9                	xor    %ecx,%ecx
    5430:	4c 89 df             	mov    %r11,%rdi
    5433:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    5437:	48 01 de             	add    %rbx,%rsi
    543a:	4c 01 f3             	add    %r14,%rbx
    543d:	e8 00 00 00 00       	callq  5442 <csum_and_copy_to_iter+0x472>
    5442:	4d 89 f8             	mov    %r15,%r8
    5445:	8b 55 b8             	mov    -0x48(%rbp),%edx
    5448:	4d 29 f0             	sub    %r14,%r8
    544b:	01 c2                	add    %eax,%edx
    544d:	83 d2 00             	adc    $0x0,%edx
    5450:	89 55 b8             	mov    %edx,-0x48(%rbp)
    5453:	4d 85 c0             	test   %r8,%r8
    5456:	0f 85 d4 00 00 00    	jne    5530 <csum_and_copy_to_iter+0x560>
    545c:	49 39 5d 08          	cmp    %rbx,0x8(%r13)
    5460:	75 06                	jne    5468 <csum_and_copy_to_iter+0x498>
    5462:	49 83 c5 10          	add    $0x10,%r13
    5466:	31 db                	xor    %ebx,%ebx
    5468:	4c 89 e8             	mov    %r13,%rax
    546b:	49 2b 44 24 18       	sub    0x18(%r12),%rax
    5470:	4d 89 6c 24 18       	mov    %r13,0x18(%r12)
    5475:	48 c1 f8 04          	sar    $0x4,%rax
    5479:	49 29 44 24 20       	sub    %rax,0x20(%r12)
    547e:	49 8b 44 24 10       	mov    0x10(%r12),%rax
    5483:	e9 52 fc ff ff       	jmpq   50da <csum_and_copy_to_iter+0x10a>
    5488:	48 01 f3             	add    %rsi,%rbx
    548b:	e9 4a fc ff ff       	jmpq   50da <csum_and_copy_to_iter+0x10a>
    5490:	49 83 c6 10          	add    $0x10,%r14
    5494:	4d 89 d5             	mov    %r10,%r13
    5497:	4d 39 56 08          	cmp    %r10,0x8(%r14)
    549b:	4d 0f 46 6e 08       	cmovbe 0x8(%r14),%r13
    54a0:	4d 85 ed             	test   %r13,%r13
    54a3:	0f 84 f9 fb ff ff    	je     50a2 <csum_and_copy_to_iter+0xd2>
    54a9:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
    54ad:	49 8b 36             	mov    (%r14),%rsi
    54b0:	4c 8d 45 c8          	lea    -0x38(%rbp),%r8
    54b4:	31 c9                	xor    %ecx,%ecx
    54b6:	44 89 ea             	mov    %r13d,%edx
    54b9:	4c 89 5d 98          	mov    %r11,-0x68(%rbp)
    54bd:	4c 89 55 a0          	mov    %r10,-0x60(%rbp)
    54c1:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%rbp)
    54c8:	31 db                	xor    %ebx,%ebx
    54ca:	4a 8d 04 2f          	lea    (%rdi,%r13,1),%rax
    54ce:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    54d2:	e8 00 00 00 00       	callq  54d7 <csum_and_copy_to_iter+0x507>
    54d7:	8b 55 c8             	mov    -0x38(%rbp),%edx
    54da:	4c 8b 55 a0          	mov    -0x60(%rbp),%r10
    54de:	4c 8b 5d 98          	mov    -0x68(%rbp),%r11
    54e2:	85 d2                	test   %edx,%edx
    54e4:	0f 85 b8 fb ff ff    	jne    50a2 <csum_and_copy_to_iter+0xd2>
    54ea:	89 c2                	mov    %eax,%edx
    54ec:	4c 89 eb             	mov    %r13,%rbx
    54ef:	c1 ca 08             	ror    $0x8,%edx
    54f2:	41 f6 c3 01          	test   $0x1,%r11b
    54f6:	0f 45 c2             	cmovne %edx,%eax
    54f9:	8b 55 b8             	mov    -0x48(%rbp),%edx
    54fc:	4d 01 eb             	add    %r13,%r11
    54ff:	01 c2                	add    %eax,%edx
    5501:	83 d2 00             	adc    $0x0,%edx
    5504:	4d 29 ea             	sub    %r13,%r10
    5507:	89 55 b8             	mov    %edx,-0x48(%rbp)
    550a:	45 31 ed             	xor    %r13d,%r13d
    550d:	e9 90 fb ff ff       	jmpq   50a2 <csum_and_copy_to_iter+0xd2>
    5512:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    5516:	e9 81 fb ff ff       	jmpq   509c <csum_and_copy_to_iter+0xcc>
    551b:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 5522 <csum_and_copy_to_iter+0x552>
    5522:	74 7e                	je     55a2 <csum_and_copy_to_iter+0x5d2>
    5524:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
    5528:	45 31 c9             	xor    %r9d,%r9d
    552b:	e9 67 fc ff ff       	jmpq   5197 <csum_and_copy_to_iter+0x1c7>
    5530:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
    5534:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
    5538:	4d 89 fc             	mov    %r15,%r12
    553b:	4d 89 f7             	mov    %r14,%r15
    553e:	4d 89 c6             	mov    %r8,%r14
    5541:	49 83 c5 10          	add    $0x10,%r13
    5545:	4c 89 f3             	mov    %r14,%rbx
    5548:	4d 39 75 08          	cmp    %r14,0x8(%r13)
    554c:	49 0f 46 5d 08       	cmovbe 0x8(%r13),%rbx
    5551:	48 85 db             	test   %rbx,%rbx
    5554:	74 eb                	je     5541 <csum_and_copy_to_iter+0x571>
    5556:	49 8b 75 00          	mov    0x0(%r13),%rsi
    555a:	48 8d 04 1f          	lea    (%rdi,%rbx,1),%rax
    555e:	31 c9                	xor    %ecx,%ecx
    5560:	89 da                	mov    %ebx,%edx
    5562:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    5566:	e8 00 00 00 00       	callq  556b <csum_and_copy_to_iter+0x59b>
    556b:	89 c2                	mov    %eax,%edx
    556d:	c1 ca 08             	ror    $0x8,%edx
    5570:	41 f6 c7 01          	test   $0x1,%r15b
    5574:	0f 45 c2             	cmovne %edx,%eax
    5577:	8b 55 b8             	mov    -0x48(%rbp),%edx
    557a:	49 01 df             	add    %rbx,%r15
    557d:	01 c2                	add    %eax,%edx
    557f:	83 d2 00             	adc    $0x0,%edx
    5582:	49 29 de             	sub    %rbx,%r14
    5585:	89 55 b8             	mov    %edx,-0x48(%rbp)
    5588:	75 43                	jne    55cd <csum_and_copy_to_iter+0x5fd>
    558a:	4d 89 e7             	mov    %r12,%r15
    558d:	4c 8b 65 a8          	mov    -0x58(%rbp),%r12
    5591:	e9 c6 fe ff ff       	jmpq   545c <csum_and_copy_to_iter+0x48c>
    5596:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
    559a:	49 89 f0             	mov    %rsi,%r8
    559d:	e9 b1 fe ff ff       	jmpq   5453 <csum_and_copy_to_iter+0x483>
    55a2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
    55a9:	4c 89 5d 98          	mov    %r11,-0x68(%rbp)
    55ad:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 55b4 <csum_and_copy_to_iter+0x5e4>
    55b4:	e8 00 00 00 00       	callq  55b9 <csum_and_copy_to_iter+0x5e9>
    55b9:	0f 0b                	ud2    
    55bb:	4c 8b 5d 98          	mov    -0x68(%rbp),%r11
    55bf:	49 8b 73 18          	mov    0x18(%r11),%rsi
    55c3:	e9 5c ff ff ff       	jmpq   5524 <csum_and_copy_to_iter+0x554>
    55c8:	e8 00 00 00 00       	callq  55cd <csum_and_copy_to_iter+0x5fd>
    55cd:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
    55d1:	e9 6b ff ff ff       	jmpq   5541 <csum_and_copy_to_iter+0x571>
    55d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    55dd:	00 00 00 

00000000000055e0 <iov_iter_get_pages_alloc>:
    55e0:	55                   	push   %rbp
    55e1:	48 89 e5             	mov    %rsp,%rbp
    55e4:	41 57                	push   %r15
    55e6:	41 56                	push   %r14
    55e8:	41 55                	push   %r13
    55ea:	41 54                	push   %r12
    55ec:	49 89 fd             	mov    %rdi,%r13
    55ef:	53                   	push   %rbx
    55f0:	48 89 d3             	mov    %rdx,%rbx
    55f3:	49 89 f4             	mov    %rsi,%r12
    55f6:	49 89 ce             	mov    %rcx,%r14
    55f9:	48 83 ec 20          	sub    $0x20,%rsp
    55fd:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    5604:	00 00 
    5606:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    560a:	31 c0                	xor    %eax,%eax
    560c:	8b 07                	mov    (%rdi),%eax
    560e:	48 39 57 10          	cmp    %rdx,0x10(%rdi)
    5612:	48 0f 46 5f 10       	cmovbe 0x10(%rdi),%rbx
    5617:	89 c2                	mov    %eax,%edx
    5619:	83 e2 fe             	and    $0xfffffffe,%edx
    561c:	83 fa 20             	cmp    $0x20,%edx
    561f:	0f 84 4f 01 00 00    	je     5774 <iov_iter_get_pages_alloc+0x194>
    5625:	83 fa 40             	cmp    $0x40,%edx
    5628:	0f 84 39 01 00 00    	je     5767 <iov_iter_get_pages_alloc+0x187>
    562e:	48 85 db             	test   %rbx,%rbx
    5631:	0f 84 39 01 00 00    	je     5770 <iov_iter_get_pages_alloc+0x190>
    5637:	a8 10                	test   $0x10,%al
    5639:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
    563d:	0f 85 92 02 00 00    	jne    58d5 <iov_iter_get_pages_alloc+0x2f5>
    5643:	a8 08                	test   $0x8,%al
    5645:	0f 85 01 01 00 00    	jne    574c <iov_iter_get_pages_alloc+0x16c>
    564b:	a8 40                	test   $0x40,%al
    564d:	0f 85 1d 01 00 00    	jne    5770 <iov_iter_get_pages_alloc+0x190>
    5653:	49 8b 55 18          	mov    0x18(%r13),%rdx
    5657:	48 8b 42 08          	mov    0x8(%rdx),%rax
    565b:	48 29 f8             	sub    %rdi,%rax
    565e:	48 39 d8             	cmp    %rbx,%rax
    5661:	48 0f 47 c3          	cmova  %rbx,%rax
    5665:	48 85 c0             	test   %rax,%rax
    5668:	0f 84 c1 00 00 00    	je     572f <iov_iter_get_pages_alloc+0x14f>
    566e:	48 8b 0a             	mov    (%rdx),%rcx
    5671:	48 01 f9             	add    %rdi,%rcx
    5674:	48 89 cb             	mov    %rcx,%rbx
    5677:	bf 08 00 00 00       	mov    $0x8,%edi
    567c:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    5680:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
    5686:	49 89 1e             	mov    %rbx,(%r14)
    5689:	48 01 c3             	add    %rax,%rbx
    568c:	4c 8d bb ff 0f 00 00 	lea    0xfff(%rbx),%r15
    5693:	49 c1 ef 0c          	shr    $0xc,%r15
    5697:	49 63 c7             	movslq %r15d,%rax
    569a:	48 f7 e7             	mul    %rdi
    569d:	48 89 c7             	mov    %rax,%rdi
    56a0:	0f 80 80 00 00 00    	jo     5726 <iov_iter_get_pages_alloc+0x146>
    56a6:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    56ab:	be c0 0c 00 00       	mov    $0xcc0,%esi
    56b0:	e8 00 00 00 00       	callq  56b5 <iov_iter_get_pages_alloc+0xd5>
    56b5:	48 85 c0             	test   %rax,%rax
    56b8:	74 6c                	je     5726 <iov_iter_get_pages_alloc+0x146>
    56ba:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    56be:	41 8b 55 00          	mov    0x0(%r13),%edx
    56c2:	44 89 fe             	mov    %r15d,%esi
    56c5:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    56c9:	48 81 e1 00 f0 ff ff 	and    $0xfffffffffffff000,%rcx
    56d0:	f7 d2                	not    %edx
    56d2:	83 e2 01             	and    $0x1,%edx
    56d5:	48 89 cf             	mov    %rcx,%rdi
    56d8:	48 89 c1             	mov    %rax,%rcx
    56db:	e8 00 00 00 00       	callq  56e0 <iov_iter_get_pages_alloc+0x100>
    56e0:	85 c0                	test   %eax,%eax
    56e2:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
    56e6:	0f 88 dc 02 00 00    	js     59c8 <iov_iter_get_pages_alloc+0x3e8>
    56ec:	48 63 d0             	movslq %eax,%rdx
    56ef:	4d 89 04 24          	mov    %r8,(%r12)
    56f3:	48 c1 e2 0c          	shl    $0xc,%rdx
    56f7:	44 39 f8             	cmp    %r15d,%eax
    56fa:	48 0f 45 da          	cmovne %rdx,%rbx
    56fe:	48 89 d8             	mov    %rbx,%rax
    5701:	49 2b 06             	sub    (%r14),%rax
    5704:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    5708:	65 48 33 34 25 28 00 	xor    %gs:0x28,%rsi
    570f:	00 00 
    5711:	0f 85 22 03 00 00    	jne    5a39 <iov_iter_get_pages_alloc+0x459>
    5717:	48 83 c4 20          	add    $0x20,%rsp
    571b:	5b                   	pop    %rbx
    571c:	41 5c                	pop    %r12
    571e:	41 5d                	pop    %r13
    5720:	41 5e                	pop    %r14
    5722:	41 5f                	pop    %r15
    5724:	5d                   	pop    %rbp
    5725:	c3                   	retq   
    5726:	48 c7 c0 f4 ff ff ff 	mov    $0xfffffffffffffff4,%rax
    572d:	eb d5                	jmp    5704 <iov_iter_get_pages_alloc+0x124>
    572f:	48 83 c2 10          	add    $0x10,%rdx
    5733:	48 89 d8             	mov    %rbx,%rax
    5736:	48 39 5a 08          	cmp    %rbx,0x8(%rdx)
    573a:	48 0f 46 42 08       	cmovbe 0x8(%rdx),%rax
    573f:	48 85 c0             	test   %rax,%rax
    5742:	74 eb                	je     572f <iov_iter_get_pages_alloc+0x14f>
    5744:	48 8b 0a             	mov    (%rdx),%rcx
    5747:	e9 28 ff ff ff       	jmpq   5674 <iov_iter_get_pages_alloc+0x94>
    574c:	49 8b 55 18          	mov    0x18(%r13),%rdx
    5750:	48 8b 42 08          	mov    0x8(%rdx),%rax
    5754:	48 29 f8             	sub    %rdi,%rax
    5757:	48 39 d8             	cmp    %rbx,%rax
    575a:	48 0f 47 c3          	cmova  %rbx,%rax
    575e:	48 85 c0             	test   %rax,%rax
    5761:	0f 84 0f 02 00 00    	je     5976 <iov_iter_get_pages_alloc+0x396>
    5767:	48 c7 c0 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rax
    576e:	eb 94                	jmp    5704 <iov_iter_get_pages_alloc+0x124>
    5770:	31 c0                	xor    %eax,%eax
    5772:	eb 90                	jmp    5704 <iov_iter_get_pages_alloc+0x124>
    5774:	31 c0                	xor    %eax,%eax
    5776:	48 85 db             	test   %rbx,%rbx
    5779:	74 89                	je     5704 <iov_iter_get_pages_alloc+0x124>
    577b:	e8 30 a9 ff ff       	callq  b0 <sanity>
    5780:	84 c0                	test   %al,%al
    5782:	74 e3                	je     5767 <iov_iter_get_pages_alloc+0x187>
    5784:	49 8b 45 08          	mov    0x8(%r13),%rax
    5788:	45 8b 7d 20          	mov    0x20(%r13),%r15d
    578c:	48 85 c0             	test   %rax,%rax
    578f:	74 36                	je     57c7 <iov_iter_get_pages_alloc+0x1e7>
    5791:	49 8b 4d 18          	mov    0x18(%r13),%rcx
    5795:	8b 71 5c             	mov    0x5c(%rcx),%esi
    5798:	48 8b b9 90 00 00 00 	mov    0x90(%rcx),%rdi
    579f:	8d 56 ff             	lea    -0x1(%rsi),%edx
    57a2:	44 21 fa             	and    %r15d,%edx
    57a5:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
    57a9:	48 8d 14 d7          	lea    (%rdi,%rdx,8),%rdx
    57ad:	48 81 7a 10 00 00 00 	cmpq   $0x0,0x10(%rdx)
    57b4:	00 
    57b5:	75 0c                	jne    57c3 <iov_iter_get_pages_alloc+0x1e3>
    57b7:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
    57bd:	0f 85 4d 02 00 00    	jne    5a10 <iov_iter_get_pages_alloc+0x430>
    57c3:	41 83 c7 01          	add    $0x1,%r15d
    57c7:	49 c7 06 00 00 00 00 	movq   $0x0,(%r14)
    57ce:	49 8b 55 18          	mov    0x18(%r13),%rdx
    57d2:	44 89 fe             	mov    %r15d,%esi
    57d5:	31 c0                	xor    %eax,%eax
    57d7:	8b 4a 58             	mov    0x58(%rdx),%ecx
    57da:	2b 72 54             	sub    0x54(%rdx),%esi
    57dd:	39 ce                	cmp    %ecx,%esi
    57df:	0f 83 f7 01 00 00    	jae    59dc <iov_iter_get_pages_alloc+0x3fc>
    57e5:	8b 7a 5c             	mov    0x5c(%rdx),%edi
    57e8:	29 f7                	sub    %esi,%edi
    57ea:	39 cf                	cmp    %ecx,%edi
    57ec:	48 0f 47 f9          	cmova  %rcx,%rdi
    57f0:	48 89 fa             	mov    %rdi,%rdx
    57f3:	48 c1 e2 0c          	shl    $0xc,%rdx
    57f7:	48 29 c2             	sub    %rax,%rdx
    57fa:	48 39 d3             	cmp    %rdx,%rbx
    57fd:	0f 87 2e 02 00 00    	ja     5a31 <iov_iter_get_pages_alloc+0x451>
    5803:	48 8d bc 03 ff 0f 00 	lea    0xfff(%rbx,%rax,1),%rdi
    580a:	00 
    580b:	48 c1 ef 0c          	shr    $0xc,%rdi
    580f:	89 ff                	mov    %edi,%edi
    5811:	48 c1 e7 03          	shl    $0x3,%rdi
    5815:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    581a:	be c0 0c 00 00       	mov    $0xcc0,%esi
    581f:	e8 00 00 00 00       	callq  5824 <iov_iter_get_pages_alloc+0x244>
    5824:	48 85 c0             	test   %rax,%rax
    5827:	0f 84 f9 fe ff ff    	je     5726 <iov_iter_get_pages_alloc+0x146>
    582d:	4d 8b 45 18          	mov    0x18(%r13),%r8
    5831:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    5835:	48 8d 55 cc          	lea    -0x34(%rbp),%rdx
    5839:	4c 89 f1             	mov    %r14,%rcx
    583c:	48 89 de             	mov    %rbx,%rsi
    583f:	4c 89 ef             	mov    %r13,%rdi
    5842:	44 89 7d cc          	mov    %r15d,-0x34(%rbp)
    5846:	41 8b 40 5c          	mov    0x5c(%r8),%eax
    584a:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
    584e:	44 8d 78 ff          	lea    -0x1(%rax),%r15d
    5852:	e8 39 aa ff ff       	callq  290 <push_pipe>
    5857:	48 85 c0             	test   %rax,%rax
    585a:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
    585e:	0f 84 90 01 00 00    	je     59f4 <iov_iter_get_pages_alloc+0x414>
    5864:	49 8b 36             	mov    (%r14),%rsi
    5867:	48 01 c6             	add    %rax,%rsi
    586a:	48 85 f6             	test   %rsi,%rsi
    586d:	7e 54                	jle    58c3 <iov_iter_get_pages_alloc+0x2e3>
    586f:	48 83 ee 01          	sub    $0x1,%rsi
    5873:	8b 55 cc             	mov    -0x34(%rbp),%edx
    5876:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
    587a:	48 c1 ee 0c          	shr    $0xc,%rsi
    587e:	4c 89 c9             	mov    %r9,%rcx
    5881:	49 8d 7c f1 08       	lea    0x8(%r9,%rsi,8),%rdi
    5886:	49 8b b0 90 00 00 00 	mov    0x90(%r8),%rsi
    588d:	44 21 fa             	and    %r15d,%edx
    5890:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
    5894:	48 8d 14 d6          	lea    (%rsi,%rdx,8),%rdx
    5898:	48 8b 12             	mov    (%rdx),%rdx
    589b:	48 89 11             	mov    %rdx,(%rcx)
    589e:	48 8b 72 08          	mov    0x8(%rdx),%rsi
    58a2:	4c 8d 56 ff          	lea    -0x1(%rsi),%r10
    58a6:	83 e6 01             	and    $0x1,%esi
    58a9:	49 0f 45 d2          	cmovne %r10,%rdx
    58ad:	f0 ff 42 34          	lock incl 0x34(%rdx)
    58b1:	8b 75 cc             	mov    -0x34(%rbp),%esi
    58b4:	48 83 c1 08          	add    $0x8,%rcx
    58b8:	48 39 f9             	cmp    %rdi,%rcx
    58bb:	8d 56 01             	lea    0x1(%rsi),%edx
    58be:	89 55 cc             	mov    %edx,-0x34(%rbp)
    58c1:	75 c3                	jne    5886 <iov_iter_get_pages_alloc+0x2a6>
    58c3:	48 85 c0             	test   %rax,%rax
    58c6:	0f 8e 2f 01 00 00    	jle    59fb <iov_iter_get_pages_alloc+0x41b>
    58cc:	4d 89 0c 24          	mov    %r9,(%r12)
    58d0:	e9 2f fe ff ff       	jmpq   5704 <iov_iter_get_pages_alloc+0x124>
    58d5:	85 db                	test   %ebx,%ebx
    58d7:	89 de                	mov    %ebx,%esi
    58d9:	0f 84 91 fe ff ff    	je     5770 <iov_iter_get_pages_alloc+0x190>
    58df:	4d 8b 45 18          	mov    0x18(%r13),%r8
    58e3:	31 c9                	xor    %ecx,%ecx
    58e5:	41 b9 00 10 00 00    	mov    $0x1000,%r9d
    58eb:	45 8b 78 0c          	mov    0xc(%r8),%r15d
    58ef:	49 8b 18             	mov    (%r8),%rbx
    58f2:	41 8b 50 08          	mov    0x8(%r8),%edx
    58f6:	41 01 ff             	add    %edi,%r15d
    58f9:	41 89 d5             	mov    %edx,%r13d
    58fc:	44 89 f8             	mov    %r15d,%eax
    58ff:	45 89 ca             	mov    %r9d,%r10d
    5902:	41 29 fd             	sub    %edi,%r13d
    5905:	25 ff 0f 00 00       	and    $0xfff,%eax
    590a:	41 39 f5             	cmp    %esi,%r13d
    590d:	44 0f 47 ee          	cmova  %esi,%r13d
    5911:	41 29 c2             	sub    %eax,%r10d
    5914:	45 39 d5             	cmp    %r10d,%r13d
    5917:	45 0f 47 ea          	cmova  %r10d,%r13d
    591b:	45 85 ed             	test   %r13d,%r13d
    591e:	74 71                	je     5991 <iov_iter_get_pages_alloc+0x3b1>
    5920:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    5925:	49 89 06             	mov    %rax,(%r14)
    5928:	be c0 0c 00 00       	mov    $0xcc0,%esi
    592d:	bf 08 00 00 00       	mov    $0x8,%edi
    5932:	e8 00 00 00 00       	callq  5937 <iov_iter_get_pages_alloc+0x357>
    5937:	48 89 c2             	mov    %rax,%rdx
    593a:	49 89 04 24          	mov    %rax,(%r12)
    593e:	48 c7 c0 f4 ff ff ff 	mov    $0xfffffffffffffff4,%rax
    5945:	48 85 d2             	test   %rdx,%rdx
    5948:	0f 84 b6 fd ff ff    	je     5704 <iov_iter_get_pages_alloc+0x124>
    594e:	41 c1 ef 0c          	shr    $0xc,%r15d
    5952:	49 c1 e7 06          	shl    $0x6,%r15
    5956:	4c 01 fb             	add    %r15,%rbx
    5959:	48 89 1a             	mov    %rbx,(%rdx)
    595c:	48 8b 43 08          	mov    0x8(%rbx),%rax
    5960:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
    5964:	a8 01                	test   $0x1,%al
    5966:	48 0f 45 da          	cmovne %rdx,%rbx
    596a:	f0 ff 43 34          	lock incl 0x34(%rbx)
    596e:	44 89 e8             	mov    %r13d,%eax
    5971:	e9 8e fd ff ff       	jmpq   5704 <iov_iter_get_pages_alloc+0x124>
    5976:	48 83 c2 10          	add    $0x10,%rdx
    597a:	48 89 d8             	mov    %rbx,%rax
    597d:	48 39 5a 08          	cmp    %rbx,0x8(%rdx)
    5981:	48 0f 46 42 08       	cmovbe 0x8(%rdx),%rax
    5986:	48 85 c0             	test   %rax,%rax
    5989:	0f 85 d8 fd ff ff    	jne    5767 <iov_iter_get_pages_alloc+0x187>
    598f:	eb e5                	jmp    5976 <iov_iter_get_pages_alloc+0x396>
    5991:	85 ff                	test   %edi,%edi
    5993:	0f 84 60 ff ff ff    	je     58f9 <iov_iter_get_pages_alloc+0x319>
    5999:	39 d7                	cmp    %edx,%edi
    599b:	73 09                	jae    59a6 <iov_iter_get_pages_alloc+0x3c6>
    599d:	e9 57 ff ff ff       	jmpq   58f9 <iov_iter_get_pages_alloc+0x319>
    59a2:	39 d7                	cmp    %edx,%edi
    59a4:	72 3f                	jb     59e5 <iov_iter_get_pages_alloc+0x405>
    59a6:	8d 41 01             	lea    0x1(%rcx),%eax
    59a9:	29 d7                	sub    %edx,%edi
    59ab:	48 89 c1             	mov    %rax,%rcx
    59ae:	48 c1 e0 04          	shl    $0x4,%rax
    59b2:	4c 01 c0             	add    %r8,%rax
    59b5:	85 ff                	test   %edi,%edi
    59b7:	8b 50 08             	mov    0x8(%rax),%edx
    59ba:	75 e6                	jne    59a2 <iov_iter_get_pages_alloc+0x3c2>
    59bc:	48 8b 18             	mov    (%rax),%rbx
    59bf:	44 8b 78 0c          	mov    0xc(%rax),%r15d
    59c3:	e9 31 ff ff ff       	jmpq   58f9 <iov_iter_get_pages_alloc+0x319>
    59c8:	4c 89 c7             	mov    %r8,%rdi
    59cb:	89 45 c0             	mov    %eax,-0x40(%rbp)
    59ce:	e8 00 00 00 00       	callq  59d3 <iov_iter_get_pages_alloc+0x3f3>
    59d3:	48 63 45 c0          	movslq -0x40(%rbp),%rax
    59d7:	e9 28 fd ff ff       	jmpq   5704 <iov_iter_get_pages_alloc+0x124>
    59dc:	31 ff                	xor    %edi,%edi
    59de:	31 db                	xor    %ebx,%ebx
    59e0:	e9 2c fe ff ff       	jmpq   5811 <iov_iter_get_pages_alloc+0x231>
    59e5:	44 8b 78 0c          	mov    0xc(%rax),%r15d
    59e9:	48 8b 18             	mov    (%rax),%rbx
    59ec:	41 01 ff             	add    %edi,%r15d
    59ef:	e9 05 ff ff ff       	jmpq   58f9 <iov_iter_get_pages_alloc+0x319>
    59f4:	48 c7 c0 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rax
    59fb:	4c 89 cf             	mov    %r9,%rdi
    59fe:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    5a02:	e8 00 00 00 00       	callq  5a07 <iov_iter_get_pages_alloc+0x427>
    5a07:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    5a0b:	e9 f4 fc ff ff       	jmpq   5704 <iov_iter_get_pages_alloc+0x124>
    5a10:	49 89 06             	mov    %rax,(%r14)
    5a13:	49 8b 55 18          	mov    0x18(%r13),%rdx
    5a17:	44 89 fe             	mov    %r15d,%esi
    5a1a:	8b 4a 58             	mov    0x58(%rdx),%ecx
    5a1d:	2b 72 54             	sub    0x54(%rdx),%esi
    5a20:	39 f1                	cmp    %esi,%ecx
    5a22:	0f 87 bd fd ff ff    	ja     57e5 <iov_iter_get_pages_alloc+0x205>
    5a28:	31 d2                	xor    %edx,%edx
    5a2a:	31 ff                	xor    %edi,%edi
    5a2c:	e9 c6 fd ff ff       	jmpq   57f7 <iov_iter_get_pages_alloc+0x217>
    5a31:	48 89 d3             	mov    %rdx,%rbx
    5a34:	e9 d8 fd ff ff       	jmpq   5811 <iov_iter_get_pages_alloc+0x231>
    5a39:	e8 00 00 00 00       	callq  5a3e <iov_iter_get_pages_alloc+0x45e>

Disassembly of section .altinstr_replacement:

0000000000000000 <.altinstr_replacement>:
   0:	0f 01 cb             	stac   
   3:	0f 01 ca             	clac   
   6:	e8 00 00 00 00       	callq  b <.altinstr_replacement+0xb>
   b:	e8 00 00 00 00       	callq  10 <.altinstr_replacement+0x10>
  10:	e8 00 00 00 00       	callq  15 <.altinstr_replacement+0x15>
  15:	e8 00 00 00 00       	callq  1a <.altinstr_replacement+0x1a>
  1a:	e8 00 00 00 00       	callq  1f <.altinstr_replacement+0x1f>
  1f:	e8 00 00 00 00       	callq  24 <.altinstr_replacement+0x24>
  24:	0f 01 cb             	stac   
  27:	0f ae e8             	lfence 
  2a:	0f 01 ca             	clac   
  2d:	0f 01 cb             	stac   
  30:	0f ae e8             	lfence 
  33:	0f 01 ca             	clac   
  36:	0f 01 cb             	stac   
  39:	0f ae e8             	lfence 
  3c:	0f 01 ca             	clac   
  3f:	0f 01 cb             	stac   
  42:	0f ae e8             	lfence 
  45:	0f 01 ca             	clac   

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
