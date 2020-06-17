
read_write.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <vfs_setpos>:
       0:	e8 00 00 00 00       	callq  5 <vfs_setpos+0x5>
       5:	55                   	push   %rbp
       6:	48 85 f6             	test   %rsi,%rsi
       9:	48 89 f0             	mov    %rsi,%rax
       c:	48 89 e5             	mov    %rsp,%rbp
       f:	78 1c                	js     2d <vfs_setpos+0x2d>
      11:	48 39 d0             	cmp    %rdx,%rax
      14:	7f 1d                	jg     33 <vfs_setpos+0x33>
      16:	48 39 47 68          	cmp    %rax,0x68(%rdi)
      1a:	74 0f                	je     2b <vfs_setpos+0x2b>
      1c:	48 89 47 68          	mov    %rax,0x68(%rdi)
      20:	48 c7 87 b8 00 00 00 	movq   $0x0,0xb8(%rdi)
      27:	00 00 00 00 
      2b:	5d                   	pop    %rbp
      2c:	c3                   	retq   
      2d:	f6 47 45 20          	testb  $0x20,0x45(%rdi)
      31:	75 de                	jne    11 <vfs_setpos+0x11>
      33:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
      3a:	5d                   	pop    %rbp
      3b:	c3                   	retq   
      3c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000040 <noop_llseek>:
      40:	e8 00 00 00 00       	callq  45 <noop_llseek+0x5>
      45:	55                   	push   %rbp
      46:	48 8b 47 68          	mov    0x68(%rdi),%rax
      4a:	48 89 e5             	mov    %rsp,%rbp
      4d:	5d                   	pop    %rbp
      4e:	c3                   	retq   
      4f:	90                   	nop

0000000000000050 <no_llseek>:
      50:	e8 00 00 00 00       	callq  55 <no_llseek+0x5>
      55:	55                   	push   %rbp
      56:	48 c7 c0 e3 ff ff ff 	mov    $0xffffffffffffffe3,%rax
      5d:	48 89 e5             	mov    %rsp,%rbp
      60:	5d                   	pop    %rbp
      61:	c3                   	retq   
      62:	0f 1f 40 00          	nopl   0x0(%rax)
      66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
      6d:	00 00 00 

0000000000000070 <vfs_llseek>:
      70:	e8 00 00 00 00       	callq  75 <vfs_llseek+0x5>
      75:	f6 47 44 04          	testb  $0x4,0x44(%rdi)
      79:	55                   	push   %rbp
      7a:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
      81:	48 89 e5             	mov    %rsp,%rbp
      84:	74 16                	je     9c <vfs_llseek+0x2c>
      86:	48 8b 47 28          	mov    0x28(%rdi),%rax
      8a:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx
      91:	48 8b 40 08          	mov    0x8(%rax),%rax
      95:	48 85 c0             	test   %rax,%rax
      98:	48 0f 44 c1          	cmove  %rcx,%rax
      9c:	e8 00 00 00 00       	callq  a1 <vfs_llseek+0x31>
      a1:	5d                   	pop    %rbp
      a2:	c3                   	retq   
      a3:	0f 1f 00             	nopl   (%rax)
      a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
      ad:	00 00 00 

00000000000000b0 <default_llseek>:
      b0:	e8 00 00 00 00       	callq  b5 <default_llseek+0x5>
      b5:	55                   	push   %rbp
      b6:	48 89 e5             	mov    %rsp,%rbp
      b9:	41 57                	push   %r15
      bb:	41 56                	push   %r14
      bd:	41 55                	push   %r13
      bf:	41 54                	push   %r12
      c1:	49 89 fc             	mov    %rdi,%r12
      c4:	53                   	push   %rbx
      c5:	4c 8b 77 20          	mov    0x20(%rdi),%r14
      c9:	89 d3                	mov    %edx,%ebx
      cb:	49 89 f7             	mov    %rsi,%r15
      ce:	4d 8d ae a0 00 00 00 	lea    0xa0(%r14),%r13
      d5:	4c 89 ef             	mov    %r13,%rdi
      d8:	e8 00 00 00 00       	callq  dd <default_llseek+0x2d>
      dd:	83 fb 02             	cmp    $0x2,%ebx
      e0:	74 7b                	je     15d <default_llseek+0xad>
      e2:	7e 65                	jle    149 <default_llseek+0x99>
      e4:	83 fb 03             	cmp    $0x3,%ebx
      e7:	74 41                	je     12a <default_llseek+0x7a>
      e9:	83 fb 04             	cmp    $0x4,%ebx
      ec:	75 42                	jne    130 <default_llseek+0x80>
      ee:	49 8b 5e 50          	mov    0x50(%r14),%rbx
      f2:	4c 39 fb             	cmp    %r15,%rbx
      f5:	7e 6f                	jle    166 <default_llseek+0xb6>
      f7:	48 85 db             	test   %rbx,%rbx
      fa:	78 3c                	js     138 <default_llseek+0x88>
      fc:	49 39 5c 24 68       	cmp    %rbx,0x68(%r12)
     101:	74 11                	je     114 <default_llseek+0x64>
     103:	49 89 5c 24 68       	mov    %rbx,0x68(%r12)
     108:	49 c7 84 24 b8 00 00 	movq   $0x0,0xb8(%r12)
     10f:	00 00 00 00 00 
     114:	4c 89 ef             	mov    %r13,%rdi
     117:	e8 00 00 00 00       	callq  11c <default_llseek+0x6c>
     11c:	48 89 d8             	mov    %rbx,%rax
     11f:	5b                   	pop    %rbx
     120:	41 5c                	pop    %r12
     122:	41 5d                	pop    %r13
     124:	41 5e                	pop    %r14
     126:	41 5f                	pop    %r15
     128:	5d                   	pop    %rbp
     129:	c3                   	retq   
     12a:	4d 39 7e 50          	cmp    %r15,0x50(%r14)
     12e:	7e 36                	jle    166 <default_llseek+0xb6>
     130:	4c 89 fb             	mov    %r15,%rbx
     133:	48 85 db             	test   %rbx,%rbx
     136:	79 c4                	jns    fc <default_llseek+0x4c>
     138:	41 f6 44 24 45 20    	testb  $0x20,0x45(%r12)
     13e:	75 bc                	jne    fc <default_llseek+0x4c>
     140:	48 c7 c3 ea ff ff ff 	mov    $0xffffffffffffffea,%rbx
     147:	eb cb                	jmp    114 <default_llseek+0x64>
     149:	83 fb 01             	cmp    $0x1,%ebx
     14c:	75 e2                	jne    130 <default_llseek+0x80>
     14e:	4d 85 ff             	test   %r15,%r15
     151:	49 8b 5c 24 68       	mov    0x68(%r12),%rbx
     156:	74 bc                	je     114 <default_llseek+0x64>
     158:	4c 01 fb             	add    %r15,%rbx
     15b:	eb 9a                	jmp    f7 <default_llseek+0x47>
     15d:	49 8b 5e 50          	mov    0x50(%r14),%rbx
     161:	4c 01 fb             	add    %r15,%rbx
     164:	eb 91                	jmp    f7 <default_llseek+0x47>
     166:	48 c7 c3 fa ff ff ff 	mov    $0xfffffffffffffffa,%rbx
     16d:	eb a5                	jmp    114 <default_llseek+0x64>
     16f:	90                   	nop

0000000000000170 <generic_copy_file_range>:
     170:	e8 00 00 00 00       	callq  175 <generic_copy_file_range+0x5>
     175:	55                   	push   %rbp
     176:	b8 00 f0 ff 7f       	mov    $0x7ffff000,%eax
     17b:	48 89 e5             	mov    %rsp,%rbp
     17e:	48 83 ec 10          	sub    $0x10,%rsp
     182:	49 81 f8 00 f0 ff 7f 	cmp    $0x7ffff000,%r8
     189:	48 89 75 f8          	mov    %rsi,-0x8(%rbp)
     18d:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
     191:	48 8d 75 f8          	lea    -0x8(%rbp),%rsi
     195:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
     199:	4c 0f 47 c0          	cmova  %rax,%r8
     19d:	45 31 c9             	xor    %r9d,%r9d
     1a0:	e8 00 00 00 00       	callq  1a5 <generic_copy_file_range+0x35>
     1a5:	c9                   	leaveq 
     1a6:	c3                   	retq   
     1a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     1ae:	00 00 

00000000000001b0 <generic_file_llseek_size>:
     1b0:	e8 00 00 00 00       	callq  1b5 <generic_file_llseek_size+0x5>
     1b5:	83 fa 02             	cmp    $0x2,%edx
     1b8:	74 66                	je     220 <generic_file_llseek_size+0x70>
     1ba:	7e 43                	jle    1ff <generic_file_llseek_size+0x4f>
     1bc:	83 fa 03             	cmp    $0x3,%edx
     1bf:	74 30                	je     1f1 <generic_file_llseek_size+0x41>
     1c1:	83 fa 04             	cmp    $0x4,%edx
     1c4:	75 08                	jne    1ce <generic_file_llseek_size+0x1e>
     1c6:	4c 39 c6             	cmp    %r8,%rsi
     1c9:	73 2b                	jae    1f6 <generic_file_llseek_size+0x46>
     1cb:	4c 89 c6             	mov    %r8,%rsi
     1ce:	48 85 f6             	test   %rsi,%rsi
     1d1:	78 3e                	js     211 <generic_file_llseek_size+0x61>
     1d3:	48 39 ce             	cmp    %rcx,%rsi
     1d6:	7f 3f                	jg     217 <generic_file_llseek_size+0x67>
     1d8:	48 3b 77 68          	cmp    0x68(%rdi),%rsi
     1dc:	74 0f                	je     1ed <generic_file_llseek_size+0x3d>
     1de:	48 89 77 68          	mov    %rsi,0x68(%rdi)
     1e2:	48 c7 87 b8 00 00 00 	movq   $0x0,0xb8(%rdi)
     1e9:	00 00 00 00 
     1ed:	48 89 f0             	mov    %rsi,%rax
     1f0:	c3                   	retq   
     1f1:	4c 39 c6             	cmp    %r8,%rsi
     1f4:	72 d8                	jb     1ce <generic_file_llseek_size+0x1e>
     1f6:	48 c7 c6 fa ff ff ff 	mov    $0xfffffffffffffffa,%rsi
     1fd:	eb ee                	jmp    1ed <generic_file_llseek_size+0x3d>
     1ff:	83 fa 01             	cmp    $0x1,%edx
     202:	75 ca                	jne    1ce <generic_file_llseek_size+0x1e>
     204:	48 85 f6             	test   %rsi,%rsi
     207:	75 1c                	jne    225 <generic_file_llseek_size+0x75>
     209:	48 8b 77 68          	mov    0x68(%rdi),%rsi
     20d:	48 89 f0             	mov    %rsi,%rax
     210:	c3                   	retq   
     211:	f6 47 45 20          	testb  $0x20,0x45(%rdi)
     215:	75 bc                	jne    1d3 <generic_file_llseek_size+0x23>
     217:	48 c7 c6 ea ff ff ff 	mov    $0xffffffffffffffea,%rsi
     21e:	eb cd                	jmp    1ed <generic_file_llseek_size+0x3d>
     220:	4c 01 c6             	add    %r8,%rsi
     223:	eb a9                	jmp    1ce <generic_file_llseek_size+0x1e>
     225:	55                   	push   %rbp
     226:	48 89 e5             	mov    %rsp,%rbp
     229:	41 56                	push   %r14
     22b:	4c 8d 77 30          	lea    0x30(%rdi),%r14
     22f:	41 55                	push   %r13
     231:	41 54                	push   %r12
     233:	49 89 fd             	mov    %rdi,%r13
     236:	53                   	push   %rbx
     237:	4c 89 f7             	mov    %r14,%rdi
     23a:	48 89 f3             	mov    %rsi,%rbx
     23d:	49 89 cc             	mov    %rcx,%r12
     240:	e8 00 00 00 00       	callq  245 <generic_file_llseek_size+0x95>
     245:	49 8b 45 68          	mov    0x68(%r13),%rax
     249:	48 01 c3             	add    %rax,%rbx
     24c:	48 89 de             	mov    %rbx,%rsi
     24f:	78 2f                	js     280 <generic_file_llseek_size+0xd0>
     251:	49 39 f4             	cmp    %rsi,%r12
     254:	7c 31                	jl     287 <generic_file_llseek_size+0xd7>
     256:	48 39 f0             	cmp    %rsi,%rax
     259:	74 0f                	je     26a <generic_file_llseek_size+0xba>
     25b:	49 89 75 68          	mov    %rsi,0x68(%r13)
     25f:	49 c7 85 b8 00 00 00 	movq   $0x0,0xb8(%r13)
     266:	00 00 00 00 
     26a:	4c 89 f7             	mov    %r14,%rdi
     26d:	ff 14 25 00 00 00 00 	callq  *0x0
     274:	5b                   	pop    %rbx
     275:	48 89 f0             	mov    %rsi,%rax
     278:	41 5c                	pop    %r12
     27a:	41 5d                	pop    %r13
     27c:	41 5e                	pop    %r14
     27e:	5d                   	pop    %rbp
     27f:	c3                   	retq   
     280:	41 f6 45 45 20       	testb  $0x20,0x45(%r13)
     285:	75 ca                	jne    251 <generic_file_llseek_size+0xa1>
     287:	48 c7 c6 ea ff ff ff 	mov    $0xffffffffffffffea,%rsi
     28e:	eb da                	jmp    26a <generic_file_llseek_size+0xba>

0000000000000290 <generic_file_llseek>:
     290:	e8 00 00 00 00       	callq  295 <generic_file_llseek+0x5>
     295:	48 8b 87 f0 00 00 00 	mov    0xf0(%rdi),%rax
     29c:	55                   	push   %rbp
     29d:	48 89 e5             	mov    %rsp,%rbp
     2a0:	48 8b 00             	mov    (%rax),%rax
     2a3:	48 8b 48 28          	mov    0x28(%rax),%rcx
     2a7:	4c 8b 40 50          	mov    0x50(%rax),%r8
     2ab:	48 8b 49 20          	mov    0x20(%rcx),%rcx
     2af:	e8 00 00 00 00       	callq  2b4 <generic_file_llseek+0x24>
     2b4:	5d                   	pop    %rbp
     2b5:	c3                   	retq   
     2b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     2bd:	00 00 00 

00000000000002c0 <fixed_size_llseek>:
     2c0:	e8 00 00 00 00       	callq  2c5 <fixed_size_llseek+0x5>
     2c5:	83 fa 02             	cmp    $0x2,%edx
     2c8:	77 0e                	ja     2d8 <fixed_size_llseek+0x18>
     2ca:	55                   	push   %rbp
     2cb:	49 89 c8             	mov    %rcx,%r8
     2ce:	48 89 e5             	mov    %rsp,%rbp
     2d1:	e8 00 00 00 00       	callq  2d6 <fixed_size_llseek+0x16>
     2d6:	5d                   	pop    %rbp
     2d7:	c3                   	retq   
     2d8:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
     2df:	c3                   	retq   

00000000000002e0 <no_seek_end_llseek>:
     2e0:	e8 00 00 00 00       	callq  2e5 <no_seek_end_llseek+0x5>
     2e5:	83 fa 01             	cmp    $0x1,%edx
     2e8:	77 18                	ja     302 <no_seek_end_llseek+0x22>
     2ea:	55                   	push   %rbp
     2eb:	45 31 c0             	xor    %r8d,%r8d
     2ee:	48 b9 ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rcx
     2f5:	ff ff 7f 
     2f8:	48 89 e5             	mov    %rsp,%rbp
     2fb:	e8 00 00 00 00       	callq  300 <no_seek_end_llseek+0x20>
     300:	5d                   	pop    %rbp
     301:	c3                   	retq   
     302:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
     309:	c3                   	retq   
     30a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000310 <no_seek_end_llseek_size>:
     310:	e8 00 00 00 00       	callq  315 <no_seek_end_llseek_size+0x5>
     315:	83 fa 01             	cmp    $0x1,%edx
     318:	77 0e                	ja     328 <no_seek_end_llseek_size+0x18>
     31a:	55                   	push   %rbp
     31b:	45 31 c0             	xor    %r8d,%r8d
     31e:	48 89 e5             	mov    %rsp,%rbp
     321:	e8 00 00 00 00       	callq  326 <no_seek_end_llseek_size+0x16>
     326:	5d                   	pop    %rbp
     327:	c3                   	retq   
     328:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
     32f:	c3                   	retq   

0000000000000330 <do_iter_readv_writev>:
     330:	e8 00 00 00 00       	callq  335 <do_iter_readv_writev+0x5>
     335:	55                   	push   %rbp
     336:	48 89 e5             	mov    %rsp,%rbp
     339:	53                   	push   %rbx
     33a:	48 89 d3             	mov    %rdx,%rbx
     33d:	48 83 ec 38          	sub    $0x38,%rsp
     341:	44 8b 4f 40          	mov    0x40(%rdi),%r9d
     345:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     34c:	00 00 
     34e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     352:	31 c0                	xor    %eax,%eax
     354:	31 c0                	xor    %eax,%eax
     356:	41 f7 c1 00 04 00 00 	test   $0x400,%r9d
     35d:	0f 95 c0             	setne  %al
     360:	01 c0                	add    %eax,%eax
     362:	41 f7 c1 00 40 00 00 	test   $0x4000,%r9d
     369:	0f 85 44 01 00 00    	jne    4b3 <do_iter_readv_writev+0x183>
     36f:	48 8b 97 f0 00 00 00 	mov    0xf0(%rdi),%rdx
     376:	48 8b 12             	mov    (%rdx),%rdx
     379:	f6 42 0d 20          	testb  $0x20,0xd(%rdx)
     37d:	0f 85 30 01 00 00    	jne    4b3 <do_iter_readv_writev+0x183>
     383:	41 f7 c1 00 10 00 00 	test   $0x1000,%r9d
     38a:	75 19                	jne    3a5 <do_iter_readv_writev+0x75>
     38c:	48 8b 97 f0 00 00 00 	mov    0xf0(%rdi),%rdx
     393:	48 8b 12             	mov    (%rdx),%rdx
     396:	4c 8b 52 28          	mov    0x28(%rdx),%r10
     39a:	41 f6 42 50 10       	testb  $0x10,0x50(%r10)
     39f:	0f 84 3a 01 00 00    	je     4df <do_iter_readv_writev+0x1af>
     3a5:	83 c8 10             	or     $0x10,%eax
     3a8:	89 c2                	mov    %eax,%edx
     3aa:	83 ca 20             	or     $0x20,%edx
     3ad:	41 81 e1 00 00 10 00 	and    $0x100000,%r9d
     3b4:	44 8b 4f 34          	mov    0x34(%rdi),%r9d
     3b8:	0f 45 c2             	cmovne %edx,%eax
     3bb:	45 85 c9             	test   %r9d,%r9d
     3be:	0f 85 f7 00 00 00    	jne    4bb <do_iter_readv_writev+0x18b>
     3c4:	48 8b 57 20          	mov    0x20(%rdi),%rdx
     3c8:	44 0f b6 8a 8f 00 00 	movzbl 0x8f(%rdx),%r9d
     3cf:	00 
     3d0:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
     3d7:	00 00 
     3d9:	4c 8b 92 80 0b 00 00 	mov    0xb80(%rdx),%r10
     3e0:	31 d2                	xor    %edx,%edx
     3e2:	4d 85 d2             	test   %r10,%r10
     3e5:	74 05                	je     3ec <do_iter_readv_writev+0xbc>
     3e7:	41 0f b7 52 14       	movzwl 0x14(%r10),%edx
     3ec:	41 f7 c0 e0 ff ff ff 	test   $0xffffffe0,%r8d
     3f3:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
     3fa:	00 
     3fb:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
     402:	00 
     403:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
     40a:	00 
     40b:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
     412:	00 
     413:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
     417:	89 45 e0             	mov    %eax,-0x20(%rbp)
     41a:	66 44 89 4d e4       	mov    %r9w,-0x1c(%rbp)
     41f:	66 89 55 e6          	mov    %dx,-0x1a(%rbp)
     423:	0f 85 c5 00 00 00    	jne    4ee <do_iter_readv_writev+0x1be>
     429:	41 f6 c0 08          	test   $0x8,%r8b
     42d:	74 0f                	je     43e <do_iter_readv_writev+0x10e>
     42f:	f6 47 47 08          	testb  $0x8,0x47(%rdi)
     433:	0f 84 b5 00 00 00    	je     4ee <do_iter_readv_writev+0x1be>
     439:	0c 80                	or     $0x80,%al
     43b:	89 45 e0             	mov    %eax,-0x20(%rbp)
     43e:	41 f6 c0 01          	test   $0x1,%r8b
     442:	74 04                	je     448 <do_iter_readv_writev+0x118>
     444:	83 4d e0 08          	orl    $0x8,-0x20(%rbp)
     448:	41 f6 c0 02          	test   $0x2,%r8b
     44c:	74 04                	je     452 <do_iter_readv_writev+0x122>
     44e:	83 4d e0 10          	orl    $0x10,-0x20(%rbp)
     452:	41 f6 c0 04          	test   $0x4,%r8b
     456:	74 04                	je     45c <do_iter_readv_writev+0x12c>
     458:	83 4d e0 30          	orl    $0x30,-0x20(%rbp)
     45c:	41 83 e0 10          	and    $0x10,%r8d
     460:	74 04                	je     466 <do_iter_readv_writev+0x136>
     462:	83 4d e0 02          	orl    $0x2,-0x20(%rbp)
     466:	31 c0                	xor    %eax,%eax
     468:	48 85 db             	test   %rbx,%rbx
     46b:	74 03                	je     470 <do_iter_readv_writev+0x140>
     46d:	48 8b 03             	mov    (%rbx),%rax
     470:	85 c9                	test   %ecx,%ecx
     472:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
     476:	48 8b 47 28          	mov    0x28(%rdi),%rax
     47a:	74 54                	je     4d0 <do_iter_readv_writev+0x1a0>
     47c:	48 8b 40 28          	mov    0x28(%rax),%rax
     480:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
     484:	e8 00 00 00 00       	callq  489 <do_iter_readv_writev+0x159>
     489:	48 3d ef fd ff ff    	cmp    $0xfffffffffffffdef,%rax
     48f:	74 66                	je     4f7 <do_iter_readv_writev+0x1c7>
     491:	48 85 db             	test   %rbx,%rbx
     494:	74 07                	je     49d <do_iter_readv_writev+0x16d>
     496:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
     49a:	48 89 13             	mov    %rdx,(%rbx)
     49d:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
     4a1:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
     4a8:	00 00 
     4aa:	75 4d                	jne    4f9 <do_iter_readv_writev+0x1c9>
     4ac:	48 83 c4 38          	add    $0x38,%rsp
     4b0:	5b                   	pop    %rbx
     4b1:	5d                   	pop    %rbp
     4b2:	c3                   	retq   
     4b3:	83 c8 04             	or     $0x4,%eax
     4b6:	e9 c8 fe ff ff       	jmpq   383 <do_iter_readv_writev+0x53>
     4bb:	41 81 f9 ff ff 00 00 	cmp    $0xffff,%r9d
     4c2:	0f 86 08 ff ff ff    	jbe    3d0 <do_iter_readv_writev+0xa0>
     4c8:	45 31 c9             	xor    %r9d,%r9d
     4cb:	e9 00 ff ff ff       	jmpq   3d0 <do_iter_readv_writev+0xa0>
     4d0:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
     4d4:	48 8b 40 20          	mov    0x20(%rax),%rax
     4d8:	e8 00 00 00 00       	callq  4dd <do_iter_readv_writev+0x1ad>
     4dd:	eb aa                	jmp    489 <do_iter_readv_writev+0x159>
     4df:	f6 42 0c 01          	testb  $0x1,0xc(%rdx)
     4e3:	0f 84 bf fe ff ff    	je     3a8 <do_iter_readv_writev+0x78>
     4e9:	e9 b7 fe ff ff       	jmpq   3a5 <do_iter_readv_writev+0x75>
     4ee:	48 c7 c0 a1 ff ff ff 	mov    $0xffffffffffffffa1,%rax
     4f5:	eb a6                	jmp    49d <do_iter_readv_writev+0x16d>
     4f7:	0f 0b                	ud2    
     4f9:	e8 00 00 00 00       	callq  4fe <do_iter_readv_writev+0x1ce>
     4fe:	66 90                	xchg   %ax,%ax

0000000000000500 <remap_verify_area>:
     500:	e8 00 00 00 00       	callq  505 <remap_verify_area+0x5>
     505:	48 85 f6             	test   %rsi,%rsi
     508:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     50d:	78 41                	js     550 <remap_verify_area+0x50>
     50f:	48 85 d2             	test   %rdx,%rdx
     512:	78 3c                	js     550 <remap_verify_area+0x50>
     514:	49 89 f0             	mov    %rsi,%r8
     517:	49 01 d0             	add    %rdx,%r8
     51a:	78 36                	js     552 <remap_verify_area+0x52>
     51c:	55                   	push   %rbp
     51d:	48 89 e5             	mov    %rsp,%rbp
     520:	41 54                	push   %r12
     522:	53                   	push   %rbx
     523:	48 89 fb             	mov    %rdi,%rbx
     526:	48 8b 7f 20          	mov    0x20(%rdi),%rdi
     52a:	41 89 cc             	mov    %ecx,%r12d
     52d:	48 83 bf 70 01 00 00 	cmpq   $0x0,0x170(%rdi)
     534:	00 
     535:	75 1d                	jne    554 <remap_verify_area+0x54>
     537:	41 80 fc 01          	cmp    $0x1,%r12b
     53b:	48 89 df             	mov    %rbx,%rdi
     53e:	19 f6                	sbb    %esi,%esi
     540:	83 e6 02             	and    $0x2,%esi
     543:	83 c6 02             	add    $0x2,%esi
     546:	e8 00 00 00 00       	callq  54b <remap_verify_area+0x4b>
     54b:	5b                   	pop    %rbx
     54c:	41 5c                	pop    %r12
     54e:	5d                   	pop    %rbp
     54f:	c3                   	retq   
     550:	f3 c3                	repz retq 
     552:	f3 c3                	repz retq 
     554:	48 8b 47 28          	mov    0x28(%rdi),%rax
     558:	f6 40 50 40          	testb  $0x40,0x50(%rax)
     55c:	74 d9                	je     537 <remap_verify_area+0x37>
     55e:	0f b7 07             	movzwl (%rdi),%eax
     561:	66 25 08 04          	and    $0x408,%ax
     565:	66 3d 00 04          	cmp    $0x400,%ax
     569:	75 cc                	jne    537 <remap_verify_area+0x37>
     56b:	49 83 e8 01          	sub    $0x1,%r8
     56f:	48 b9 ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rcx
     576:	ff ff 7f 
     579:	48 85 d2             	test   %rdx,%rdx
     57c:	49 0f 45 c8          	cmovne %r8,%rcx
     580:	48 89 f2             	mov    %rsi,%rdx
     583:	45 0f b6 c4          	movzbl %r12b,%r8d
     587:	48 89 de             	mov    %rbx,%rsi
     58a:	e8 00 00 00 00       	callq  58f <remap_verify_area+0x8f>
     58f:	85 c0                	test   %eax,%eax
     591:	79 a4                	jns    537 <remap_verify_area+0x37>
     593:	eb b6                	jmp    54b <remap_verify_area+0x4b>
     595:	90                   	nop
     596:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     59d:	00 00 00 

00000000000005a0 <vfs_dedupe_file_range_one>:
     5a0:	e8 00 00 00 00       	callq  5a5 <vfs_dedupe_file_range_one+0x5>
     5a5:	55                   	push   %rbp
     5a6:	48 89 e5             	mov    %rsp,%rbp
     5a9:	41 57                	push   %r15
     5ab:	41 56                	push   %r14
     5ad:	41 55                	push   %r13
     5af:	41 54                	push   %r12
     5b1:	45 89 cc             	mov    %r9d,%r12d
     5b4:	53                   	push   %rbx
     5b5:	49 89 ff             	mov    %rdi,%r15
     5b8:	48 89 d3             	mov    %rdx,%rbx
     5bb:	49 89 ce             	mov    %rcx,%r14
     5be:	4d 89 c5             	mov    %r8,%r13
     5c1:	48 83 ec 08          	sub    $0x8,%rsp
     5c5:	41 83 e1 fc          	and    $0xfffffffc,%r9d
     5c9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
     5cd:	0f 85 0e 01 00 00    	jne    6e1 <vfs_dedupe_file_range_one+0x141>
     5d3:	48 89 df             	mov    %rbx,%rdi
     5d6:	e8 00 00 00 00       	callq  5db <vfs_dedupe_file_range_one+0x3b>
     5db:	48 98                	cltq   
     5dd:	48 85 c0             	test   %rax,%rax
     5e0:	74 0f                	je     5f1 <vfs_dedupe_file_range_one+0x51>
     5e2:	48 83 c4 08          	add    $0x8,%rsp
     5e6:	5b                   	pop    %rbx
     5e7:	41 5c                	pop    %r12
     5e9:	41 5d                	pop    %r13
     5eb:	41 5e                	pop    %r14
     5ed:	41 5f                	pop    %r15
     5ef:	5d                   	pop    %rbp
     5f0:	c3                   	retq   
     5f1:	b9 01 00 00 00       	mov    $0x1,%ecx
     5f6:	4c 89 ea             	mov    %r13,%rdx
     5f9:	4c 89 f6             	mov    %r14,%rsi
     5fc:	48 89 df             	mov    %rbx,%rdi
     5ff:	e8 fc fe ff ff       	callq  500 <remap_verify_area>
     604:	48 98                	cltq   
     606:	48 85 c0             	test   %rax,%rax
     609:	79 1f                	jns    62a <vfs_dedupe_file_range_one+0x8a>
     60b:	48 89 df             	mov    %rbx,%rdi
     60e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     612:	e8 00 00 00 00       	callq  617 <vfs_dedupe_file_range_one+0x77>
     617:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
     61b:	48 83 c4 08          	add    $0x8,%rsp
     61f:	5b                   	pop    %rbx
     620:	41 5c                	pop    %r12
     622:	41 5d                	pop    %r13
     624:	41 5e                	pop    %r14
     626:	41 5f                	pop    %r15
     628:	5d                   	pop    %rbp
     629:	c3                   	retq   
     62a:	bf 15 00 00 00       	mov    $0x15,%edi
     62f:	e8 00 00 00 00       	callq  634 <vfs_dedupe_file_range_one+0x94>
     634:	84 c0                	test   %al,%al
     636:	75 39                	jne    671 <vfs_dedupe_file_range_one+0xd1>
     638:	f6 43 44 02          	testb  $0x2,0x44(%rbx)
     63c:	75 33                	jne    671 <vfs_dedupe_file_range_one+0xd1>
     63e:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
     645:	00 00 
     647:	48 8b 7b 20          	mov    0x20(%rbx),%rdi
     64b:	48 8b 80 30 0a 00 00 	mov    0xa30(%rax),%rax
     652:	8b 77 04             	mov    0x4(%rdi),%esi
     655:	39 70 1c             	cmp    %esi,0x1c(%rax)
     658:	74 17                	je     671 <vfs_dedupe_file_range_one+0xd1>
     65a:	be 02 00 00 00       	mov    $0x2,%esi
     65f:	e8 00 00 00 00       	callq  664 <vfs_dedupe_file_range_one+0xc4>
     664:	85 c0                	test   %eax,%eax
     666:	74 09                	je     671 <vfs_dedupe_file_range_one+0xd1>
     668:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
     66f:	eb 9a                	jmp    60b <vfs_dedupe_file_range_one+0x6b>
     671:	48 8b 4b 10          	mov    0x10(%rbx),%rcx
     675:	49 39 4f 10          	cmp    %rcx,0x10(%r15)
     679:	48 c7 c0 ee ff ff ff 	mov    $0xffffffffffffffee,%rax
     680:	75 89                	jne    60b <vfs_dedupe_file_range_one+0x6b>
     682:	48 8b 43 20          	mov    0x20(%rbx),%rax
     686:	0f b7 10             	movzwl (%rax),%edx
     689:	48 c7 c0 eb ff ff ff 	mov    $0xffffffffffffffeb,%rax
     690:	66 81 e2 00 f0       	and    $0xf000,%dx
     695:	66 81 fa 00 40       	cmp    $0x4000,%dx
     69a:	0f 84 6b ff ff ff    	je     60b <vfs_dedupe_file_range_one+0x6b>
     6a0:	48 8b 43 28          	mov    0x28(%rbx),%rax
     6a4:	4c 8b 90 f0 00 00 00 	mov    0xf0(%rax),%r10
     6ab:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
     6b2:	4d 85 d2             	test   %r10,%r10
     6b5:	0f 84 50 ff ff ff    	je     60b <vfs_dedupe_file_range_one+0x6b>
     6bb:	4d 85 ed             	test   %r13,%r13
     6be:	74 28                	je     6e8 <vfs_dedupe_file_range_one+0x148>
     6c0:	45 89 e1             	mov    %r12d,%r9d
     6c3:	4d 89 e8             	mov    %r13,%r8
     6c6:	4c 89 f1             	mov    %r14,%rcx
     6c9:	41 83 c9 01          	or     $0x1,%r9d
     6cd:	48 89 da             	mov    %rbx,%rdx
     6d0:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
     6d4:	4c 89 ff             	mov    %r15,%rdi
     6d7:	e8 00 00 00 00       	callq  6dc <vfs_dedupe_file_range_one+0x13c>
     6dc:	e9 2a ff ff ff       	jmpq   60b <vfs_dedupe_file_range_one+0x6b>
     6e1:	0f 0b                	ud2    
     6e3:	e9 eb fe ff ff       	jmpq   5d3 <vfs_dedupe_file_range_one+0x33>
     6e8:	31 c0                	xor    %eax,%eax
     6ea:	e9 1c ff ff ff       	jmpq   60b <vfs_dedupe_file_range_one+0x6b>
     6ef:	90                   	nop

00000000000006f0 <vfs_dedupe_file_range>:
     6f0:	e8 00 00 00 00       	callq  6f5 <vfs_dedupe_file_range+0x5>
     6f5:	55                   	push   %rbp
     6f6:	48 89 e5             	mov    %rsp,%rbp
     6f9:	41 57                	push   %r15
     6fb:	41 56                	push   %r14
     6fd:	41 55                	push   %r13
     6ff:	41 54                	push   %r12
     701:	53                   	push   %rbx
     702:	48 83 ec 10          	sub    $0x10,%rsp
     706:	f6 47 44 01          	testb  $0x1,0x44(%rdi)
     70a:	4c 8b 47 20          	mov    0x20(%rdi),%r8
     70e:	44 0f b7 66 10       	movzwl 0x10(%rsi),%r12d
     713:	0f 84 97 01 00 00    	je     8b0 <vfs_dedupe_file_range+0x1c0>
     719:	48 f7 46 10 00 00 ff 	testq  $0xffffffffffff0000,0x10(%rsi)
     720:	ff 
     721:	0f 85 89 01 00 00    	jne    8b0 <vfs_dedupe_file_range+0x1c0>
     727:	41 0f b7 00          	movzwl (%r8),%eax
     72b:	4c 8b 3e             	mov    (%rsi),%r15
     72e:	4c 8b 76 08          	mov    0x8(%rsi),%r14
     732:	4c 89 45 d0          	mov    %r8,-0x30(%rbp)
     736:	66 25 00 f0          	and    $0xf000,%ax
     73a:	66 3d 00 40          	cmp    $0x4000,%ax
     73e:	0f 84 2a 01 00 00    	je     86e <vfs_dedupe_file_range+0x17e>
     744:	66 3d 00 80          	cmp    $0x8000,%ax
     748:	0f 85 62 01 00 00    	jne    8b0 <vfs_dedupe_file_range+0x1c0>
     74e:	48 8b 47 28          	mov    0x28(%rdi),%rax
     752:	48 83 b8 f0 00 00 00 	cmpq   $0x0,0xf0(%rax)
     759:	00 
     75a:	0f 84 57 01 00 00    	je     8b7 <vfs_dedupe_file_range+0x1c7>
     760:	31 c9                	xor    %ecx,%ecx
     762:	48 89 f3             	mov    %rsi,%rbx
     765:	4c 89 f2             	mov    %r14,%rdx
     768:	4c 89 fe             	mov    %r15,%rsi
     76b:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
     76f:	e8 8c fd ff ff       	callq  500 <remap_verify_area>
     774:	85 c0                	test   %eax,%eax
     776:	0f 88 f7 00 00 00    	js     873 <vfs_dedupe_file_range+0x183>
     77c:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
     780:	4b 8d 04 37          	lea    (%r15,%r14,1),%rax
     784:	49 3b 40 50          	cmp    0x50(%r8),%rax
     788:	0f 87 22 01 00 00    	ja     8b0 <vfs_dedupe_file_range+0x1c0>
     78e:	49 81 fe 00 00 00 40 	cmp    $0x40000000,%r14
     795:	b8 00 00 00 40       	mov    $0x40000000,%eax
     79a:	49 0f 46 c6          	cmovbe %r14,%rax
     79e:	66 45 85 e4          	test   %r12w,%r12w
     7a2:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     7a6:	0f 84 df 00 00 00    	je     88b <vfs_dedupe_file_range+0x19b>
     7ac:	41 83 ec 01          	sub    $0x1,%r12d
     7b0:	48 8d 43 28          	lea    0x28(%rbx),%rax
     7b4:	4c 89 e2             	mov    %r12,%rdx
     7b7:	48 c1 e2 05          	shl    $0x5,%rdx
     7bb:	48 8d 54 13 48       	lea    0x48(%rbx,%rdx,1),%rdx
     7c0:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
     7c7:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
     7ce:	48 83 c0 20          	add    $0x20,%rax
     7d2:	48 39 d0             	cmp    %rdx,%rax
     7d5:	75 e9                	jne    7c0 <vfs_dedupe_file_range+0xd0>
     7d7:	49 83 c4 01          	add    $0x1,%r12
     7db:	48 83 c3 18          	add    $0x18,%rbx
     7df:	49 c1 e4 05          	shl    $0x5,%r12
     7e3:	49 01 dc             	add    %rbx,%r12
     7e6:	eb 2e                	jmp    816 <vfs_dedupe_file_range+0x126>
     7e8:	8b 43 1c             	mov    0x1c(%rbx),%eax
     7eb:	85 c0                	test   %eax,%eax
     7ed:	74 4d                	je     83c <vfs_dedupe_file_range+0x14c>
     7ef:	c7 43 18 ea ff ff ff 	movl   $0xffffffea,0x18(%rbx)
     7f6:	41 83 e5 01          	and    $0x1,%r13d
     7fa:	75 36                	jne    832 <vfs_dedupe_file_range+0x142>
     7fc:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
     803:	00 00 
     805:	48 8b 10             	mov    (%rax),%rdx
     808:	83 e2 04             	and    $0x4,%edx
     80b:	75 75                	jne    882 <vfs_dedupe_file_range+0x192>
     80d:	48 83 c3 20          	add    $0x20,%rbx
     811:	4c 39 e3             	cmp    %r12,%rbx
     814:	74 75                	je     88b <vfs_dedupe_file_range+0x19b>
     816:	8b 3b                	mov    (%rbx),%edi
     818:	e8 00 00 00 00       	callq  81d <vfs_dedupe_file_range+0x12d>
     81d:	49 89 c6             	mov    %rax,%r14
     820:	49 89 c5             	mov    %rax,%r13
     823:	49 83 e6 fc          	and    $0xfffffffffffffffc,%r14
     827:	75 bf                	jne    7e8 <vfs_dedupe_file_range+0xf8>
     829:	c7 43 18 f7 ff ff ff 	movl   $0xfffffff7,0x18(%rbx)
     830:	eb ca                	jmp    7fc <vfs_dedupe_file_range+0x10c>
     832:	4c 89 f7             	mov    %r14,%rdi
     835:	e8 00 00 00 00       	callq  83a <vfs_dedupe_file_range+0x14a>
     83a:	eb c0                	jmp    7fc <vfs_dedupe_file_range+0x10c>
     83c:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
     840:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
     844:	41 b9 02 00 00 00    	mov    $0x2,%r9d
     84a:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
     84e:	4c 89 f2             	mov    %r14,%rdx
     851:	4c 89 fe             	mov    %r15,%rsi
     854:	e8 00 00 00 00       	callq  859 <vfs_dedupe_file_range+0x169>
     859:	48 83 f8 cc          	cmp    $0xffffffffffffffcc,%rax
     85d:	74 3d                	je     89c <vfs_dedupe_file_range+0x1ac>
     85f:	48 85 c0             	test   %rax,%rax
     862:	78 44                	js     8a8 <vfs_dedupe_file_range+0x1b8>
     864:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
     868:	48 89 43 10          	mov    %rax,0x10(%rbx)
     86c:	eb 88                	jmp    7f6 <vfs_dedupe_file_range+0x106>
     86e:	b8 eb ff ff ff       	mov    $0xffffffeb,%eax
     873:	48 83 c4 10          	add    $0x10,%rsp
     877:	5b                   	pop    %rbx
     878:	41 5c                	pop    %r12
     87a:	41 5d                	pop    %r13
     87c:	41 5e                	pop    %r14
     87e:	41 5f                	pop    %r15
     880:	5d                   	pop    %rbp
     881:	c3                   	retq   
     882:	f6 80 d1 0a 00 00 01 	testb  $0x1,0xad1(%rax)
     889:	74 82                	je     80d <vfs_dedupe_file_range+0x11d>
     88b:	48 83 c4 10          	add    $0x10,%rsp
     88f:	31 c0                	xor    %eax,%eax
     891:	5b                   	pop    %rbx
     892:	41 5c                	pop    %r12
     894:	41 5d                	pop    %r13
     896:	41 5e                	pop    %r14
     898:	41 5f                	pop    %r15
     89a:	5d                   	pop    %rbp
     89b:	c3                   	retq   
     89c:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%rbx)
     8a3:	e9 4e ff ff ff       	jmpq   7f6 <vfs_dedupe_file_range+0x106>
     8a8:	89 43 18             	mov    %eax,0x18(%rbx)
     8ab:	e9 46 ff ff ff       	jmpq   7f6 <vfs_dedupe_file_range+0x106>
     8b0:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     8b5:	eb bc                	jmp    873 <vfs_dedupe_file_range+0x183>
     8b7:	b8 a1 ff ff ff       	mov    $0xffffffa1,%eax
     8bc:	eb b5                	jmp    873 <vfs_dedupe_file_range+0x183>
     8be:	66 90                	xchg   %ax,%ax

00000000000008c0 <__x64_sys_llseek>:
     8c0:	e8 00 00 00 00       	callq  8c5 <__x64_sys_llseek+0x5>
     8c5:	55                   	push   %rbp
     8c6:	48 89 e5             	mov    %rsp,%rbp
     8c9:	41 57                	push   %r15
     8cb:	41 56                	push   %r14
     8cd:	41 55                	push   %r13
     8cf:	41 54                	push   %r12
     8d1:	53                   	push   %rbx
     8d2:	48 83 ec 20          	sub    $0x20,%rsp
     8d6:	4c 8b 67 48          	mov    0x48(%rdi),%r12
     8da:	4c 8b 77 60          	mov    0x60(%rdi),%r14
     8de:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     8e5:	00 00 
     8e7:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     8eb:	31 c0                	xor    %eax,%eax
     8ed:	48 8b 47 38          	mov    0x38(%rdi),%rax
     8f1:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     8f5:	48 8b 47 68          	mov    0x68(%rdi),%rax
     8f9:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
     8fd:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     901:	e8 00 00 00 00       	callq  906 <__x64_sys_llseek+0x46>
     906:	49 89 c5             	mov    %rax,%r13
     909:	49 83 e5 fc          	and    $0xfffffffffffffffc,%r13
     90d:	0f 84 ce 00 00 00    	je     9e1 <__x64_sys_llseek+0x121>
     913:	41 83 fc 04          	cmp    $0x4,%r12d
     917:	49 89 c7             	mov    %rax,%r15
     91a:	48 c7 c3 ea ff ff ff 	mov    $0xffffffffffffffea,%rbx
     921:	76 3d                	jbe    960 <__x64_sys_llseek+0xa0>
     923:	41 f6 c7 02          	test   $0x2,%r15b
     927:	0f 85 a7 00 00 00    	jne    9d4 <__x64_sys_llseek+0x114>
     92d:	41 83 e7 01          	and    $0x1,%r15d
     931:	74 08                	je     93b <__x64_sys_llseek+0x7b>
     933:	4c 89 ef             	mov    %r13,%rdi
     936:	e8 00 00 00 00       	callq  93b <__x64_sys_llseek+0x7b>
     93b:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
     93f:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
     946:	00 00 
     948:	48 89 d8             	mov    %rbx,%rax
     94b:	0f 85 9c 00 00 00    	jne    9ed <__x64_sys_llseek+0x12d>
     951:	48 83 c4 20          	add    $0x20,%rsp
     955:	5b                   	pop    %rbx
     956:	41 5c                	pop    %r12
     958:	41 5d                	pop    %r13
     95a:	41 5e                	pop    %r14
     95c:	41 5f                	pop    %r15
     95e:	5d                   	pop    %rbp
     95f:	c3                   	retq   
     960:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
     964:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
     96b:	48 c1 e6 20          	shl    $0x20,%rsi
     96f:	4c 09 f6             	or     %r14,%rsi
     972:	41 f6 45 44 04       	testb  $0x4,0x44(%r13)
     977:	74 16                	je     98f <__x64_sys_llseek+0xcf>
     979:	49 8b 45 28          	mov    0x28(%r13),%rax
     97d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
     984:	48 8b 40 08          	mov    0x8(%rax),%rax
     988:	48 85 c0             	test   %rax,%rax
     98b:	48 0f 44 c7          	cmove  %rdi,%rax
     98f:	44 89 e2             	mov    %r12d,%edx
     992:	4c 89 ef             	mov    %r13,%rdi
     995:	e8 00 00 00 00       	callq  99a <__x64_sys_llseek+0xda>
     99a:	48 85 c0             	test   %rax,%rax
     99d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
     9a1:	48 63 d8             	movslq %eax,%rbx
     9a4:	0f 88 79 ff ff ff    	js     923 <__x64_sys_llseek+0x63>
     9aa:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
     9ae:	48 8d 75 c8          	lea    -0x38(%rbp),%rsi
     9b2:	ba 08 00 00 00       	mov    $0x8,%edx
     9b7:	e8 00 00 00 00       	callq  9bc <__x64_sys_llseek+0xfc>
     9bc:	48 83 f8 01          	cmp    $0x1,%rax
     9c0:	48 19 db             	sbb    %rbx,%rbx
     9c3:	48 f7 d3             	not    %rbx
     9c6:	48 83 e3 f2          	and    $0xfffffffffffffff2,%rbx
     9ca:	41 f6 c7 02          	test   $0x2,%r15b
     9ce:	0f 84 59 ff ff ff    	je     92d <__x64_sys_llseek+0x6d>
     9d4:	4c 89 ef             	mov    %r13,%rdi
     9d7:	e8 00 00 00 00       	callq  9dc <__x64_sys_llseek+0x11c>
     9dc:	e9 4c ff ff ff       	jmpq   92d <__x64_sys_llseek+0x6d>
     9e1:	48 c7 c3 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rbx
     9e8:	e9 4e ff ff ff       	jmpq   93b <__x64_sys_llseek+0x7b>
     9ed:	e8 00 00 00 00       	callq  9f2 <__x64_sys_llseek+0x132>
     9f2:	0f 1f 40 00          	nopl   0x0(%rax)
     9f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     9fd:	00 00 00 

0000000000000a00 <__ia32_sys_llseek>:
     a00:	e8 00 00 00 00       	callq  a05 <__ia32_sys_llseek+0x5>
     a05:	55                   	push   %rbp
     a06:	48 89 e5             	mov    %rsp,%rbp
     a09:	41 57                	push   %r15
     a0b:	41 56                	push   %r14
     a0d:	41 55                	push   %r13
     a0f:	41 54                	push   %r12
     a11:	53                   	push   %rbx
     a12:	48 83 ec 20          	sub    $0x20,%rsp
     a16:	4c 8b 67 70          	mov    0x70(%rdi),%r12
     a1a:	4c 8b 77 58          	mov    0x58(%rdi),%r14
     a1e:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     a25:	00 00 
     a27:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     a2b:	31 c0                	xor    %eax,%eax
     a2d:	48 8b 47 68          	mov    0x68(%rdi),%rax
     a31:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     a35:	48 8b 47 60          	mov    0x60(%rdi),%rax
     a39:	48 8b 7f 28          	mov    0x28(%rdi),%rdi
     a3d:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     a41:	e8 00 00 00 00       	callq  a46 <__ia32_sys_llseek+0x46>
     a46:	49 89 c5             	mov    %rax,%r13
     a49:	49 83 e5 fc          	and    $0xfffffffffffffffc,%r13
     a4d:	0f 84 cc 00 00 00    	je     b1f <__ia32_sys_llseek+0x11f>
     a53:	41 83 fc 04          	cmp    $0x4,%r12d
     a57:	49 89 c7             	mov    %rax,%r15
     a5a:	48 c7 c3 ea ff ff ff 	mov    $0xffffffffffffffea,%rbx
     a61:	76 3d                	jbe    aa0 <__ia32_sys_llseek+0xa0>
     a63:	41 f6 c7 02          	test   $0x2,%r15b
     a67:	0f 85 a5 00 00 00    	jne    b12 <__ia32_sys_llseek+0x112>
     a6d:	41 83 e7 01          	and    $0x1,%r15d
     a71:	74 08                	je     a7b <__ia32_sys_llseek+0x7b>
     a73:	4c 89 ef             	mov    %r13,%rdi
     a76:	e8 00 00 00 00       	callq  a7b <__ia32_sys_llseek+0x7b>
     a7b:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
     a7f:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
     a86:	00 00 
     a88:	48 89 d8             	mov    %rbx,%rax
     a8b:	0f 85 9a 00 00 00    	jne    b2b <__ia32_sys_llseek+0x12b>
     a91:	48 83 c4 20          	add    $0x20,%rsp
     a95:	5b                   	pop    %rbx
     a96:	41 5c                	pop    %r12
     a98:	41 5d                	pop    %r13
     a9a:	41 5e                	pop    %r14
     a9c:	41 5f                	pop    %r15
     a9e:	5d                   	pop    %rbp
     a9f:	c3                   	retq   
     aa0:	8b 75 c0             	mov    -0x40(%rbp),%esi
     aa3:	49 c1 e6 20          	shl    $0x20,%r14
     aa7:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
     aae:	4c 09 f6             	or     %r14,%rsi
     ab1:	41 f6 45 44 04       	testb  $0x4,0x44(%r13)
     ab6:	74 16                	je     ace <__ia32_sys_llseek+0xce>
     ab8:	49 8b 45 28          	mov    0x28(%r13),%rax
     abc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
     ac3:	48 8b 40 08          	mov    0x8(%rax),%rax
     ac7:	48 85 c0             	test   %rax,%rax
     aca:	48 0f 44 c7          	cmove  %rdi,%rax
     ace:	44 89 e2             	mov    %r12d,%edx
     ad1:	4c 89 ef             	mov    %r13,%rdi
     ad4:	e8 00 00 00 00       	callq  ad9 <__ia32_sys_llseek+0xd9>
     ad9:	48 85 c0             	test   %rax,%rax
     adc:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
     ae0:	48 63 d8             	movslq %eax,%rbx
     ae3:	0f 88 7a ff ff ff    	js     a63 <__ia32_sys_llseek+0x63>
     ae9:	8b 7d b8             	mov    -0x48(%rbp),%edi
     aec:	48 8d 75 c8          	lea    -0x38(%rbp),%rsi
     af0:	ba 08 00 00 00       	mov    $0x8,%edx
     af5:	e8 00 00 00 00       	callq  afa <__ia32_sys_llseek+0xfa>
     afa:	48 83 f8 01          	cmp    $0x1,%rax
     afe:	48 19 db             	sbb    %rbx,%rbx
     b01:	48 f7 d3             	not    %rbx
     b04:	48 83 e3 f2          	and    $0xfffffffffffffff2,%rbx
     b08:	41 f6 c7 02          	test   $0x2,%r15b
     b0c:	0f 84 5b ff ff ff    	je     a6d <__ia32_sys_llseek+0x6d>
     b12:	4c 89 ef             	mov    %r13,%rdi
     b15:	e8 00 00 00 00       	callq  b1a <__ia32_sys_llseek+0x11a>
     b1a:	e9 4e ff ff ff       	jmpq   a6d <__ia32_sys_llseek+0x6d>
     b1f:	48 c7 c3 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rbx
     b26:	e9 50 ff ff ff       	jmpq   a7b <__ia32_sys_llseek+0x7b>
     b2b:	e8 00 00 00 00       	callq  b30 <new_sync_read>

0000000000000b30 <new_sync_read>:
     b30:	e8 00 00 00 00       	callq  b35 <new_sync_read+0x5>
     b35:	55                   	push   %rbp
     b36:	49 89 d0             	mov    %rdx,%r8
     b39:	48 89 e5             	mov    %rsp,%rbp
     b3c:	41 54                	push   %r12
     b3e:	53                   	push   %rbx
     b3f:	49 89 cc             	mov    %rcx,%r12
     b42:	48 89 fb             	mov    %rdi,%rbx
     b45:	48 83 ec 70          	sub    $0x70,%rsp
     b49:	8b 4f 40             	mov    0x40(%rdi),%ecx
     b4c:	48 89 75 80          	mov    %rsi,-0x80(%rbp)
     b50:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     b57:	00 00 
     b59:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     b5d:	31 c0                	xor    %eax,%eax
     b5f:	31 c0                	xor    %eax,%eax
     b61:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
     b65:	f6 c5 04             	test   $0x4,%ch
     b68:	0f 95 c0             	setne  %al
     b6b:	01 c0                	add    %eax,%eax
     b6d:	f6 c5 40             	test   $0x40,%ch
     b70:	0f 85 04 01 00 00    	jne    c7a <new_sync_read+0x14a>
     b76:	48 8b 97 f0 00 00 00 	mov    0xf0(%rdi),%rdx
     b7d:	48 8b 12             	mov    (%rdx),%rdx
     b80:	f6 42 0d 20          	testb  $0x20,0xd(%rdx)
     b84:	0f 85 f0 00 00 00    	jne    c7a <new_sync_read+0x14a>
     b8a:	f6 c5 10             	test   $0x10,%ch
     b8d:	75 18                	jne    ba7 <new_sync_read+0x77>
     b8f:	48 8b 93 f0 00 00 00 	mov    0xf0(%rbx),%rdx
     b96:	48 8b 12             	mov    (%rdx),%rdx
     b99:	48 8b 72 28          	mov    0x28(%rdx),%rsi
     b9d:	f6 46 50 10          	testb  $0x10,0x50(%rsi)
     ba1:	0f 84 ee 00 00 00    	je     c95 <new_sync_read+0x165>
     ba7:	83 c8 10             	or     $0x10,%eax
     baa:	89 c2                	mov    %eax,%edx
     bac:	83 ca 20             	or     $0x20,%edx
     baf:	81 e1 00 00 10 00    	and    $0x100000,%ecx
     bb5:	8b 4b 34             	mov    0x34(%rbx),%ecx
     bb8:	0f 45 c2             	cmovne %edx,%eax
     bbb:	85 c9                	test   %ecx,%ecx
     bbd:	0f 85 bf 00 00 00    	jne    c82 <new_sync_read+0x152>
     bc3:	48 8b 53 20          	mov    0x20(%rbx),%rdx
     bc7:	0f b6 8a 8f 00 00 00 	movzbl 0x8f(%rdx),%ecx
     bce:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
     bd5:	00 00 
     bd7:	48 8b b2 80 0b 00 00 	mov    0xb80(%rdx),%rsi
     bde:	31 d2                	xor    %edx,%edx
     be0:	48 85 f6             	test   %rsi,%rsi
     be3:	74 04                	je     be9 <new_sync_read+0xb9>
     be5:	0f b7 56 14          	movzwl 0x14(%rsi),%edx
     be9:	4d 85 e4             	test   %r12,%r12
     bec:	48 c7 45 c0 00 00 00 	movq   $0x0,-0x40(%rbp)
     bf3:	00 
     bf4:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
     bfb:	00 
     bfc:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
     c03:	00 
     c04:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
     c0b:	00 
     c0c:	48 89 5d b8          	mov    %rbx,-0x48(%rbp)
     c10:	89 45 d8             	mov    %eax,-0x28(%rbp)
     c13:	66 89 4d dc          	mov    %cx,-0x24(%rbp)
     c17:	66 89 55 de          	mov    %dx,-0x22(%rbp)
     c1b:	0f 84 83 00 00 00    	je     ca4 <new_sync_read+0x174>
     c21:	49 8b 04 24          	mov    (%r12),%rax
     c25:	48 8d 55 80          	lea    -0x80(%rbp),%rdx
     c29:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
     c2d:	31 f6                	xor    %esi,%esi
     c2f:	b9 01 00 00 00       	mov    $0x1,%ecx
     c34:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     c38:	e8 00 00 00 00       	callq  c3d <new_sync_read+0x10d>
     c3d:	48 8b 43 28          	mov    0x28(%rbx),%rax
     c41:	48 8d 75 90          	lea    -0x70(%rbp),%rsi
     c45:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
     c49:	48 8b 40 20          	mov    0x20(%rax),%rax
     c4d:	e8 00 00 00 00       	callq  c52 <new_sync_read+0x122>
     c52:	48 3d ef fd ff ff    	cmp    $0xfffffffffffffdef,%rax
     c58:	74 7b                	je     cd5 <new_sync_read+0x1a5>
     c5a:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
     c5e:	49 89 14 24          	mov    %rdx,(%r12)
     c62:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
     c66:	65 48 33 3c 25 28 00 	xor    %gs:0x28,%rdi
     c6d:	00 00 
     c6f:	75 66                	jne    cd7 <new_sync_read+0x1a7>
     c71:	48 83 c4 70          	add    $0x70,%rsp
     c75:	5b                   	pop    %rbx
     c76:	41 5c                	pop    %r12
     c78:	5d                   	pop    %rbp
     c79:	c3                   	retq   
     c7a:	83 c8 04             	or     $0x4,%eax
     c7d:	e9 08 ff ff ff       	jmpq   b8a <new_sync_read+0x5a>
     c82:	81 f9 ff ff 00 00    	cmp    $0xffff,%ecx
     c88:	0f 86 40 ff ff ff    	jbe    bce <new_sync_read+0x9e>
     c8e:	31 c9                	xor    %ecx,%ecx
     c90:	e9 39 ff ff ff       	jmpq   bce <new_sync_read+0x9e>
     c95:	f6 42 0c 01          	testb  $0x1,0xc(%rdx)
     c99:	0f 84 0b ff ff ff    	je     baa <new_sync_read+0x7a>
     c9f:	e9 03 ff ff ff       	jmpq   ba7 <new_sync_read+0x77>
     ca4:	48 8d 55 80          	lea    -0x80(%rbp),%rdx
     ca8:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
     cac:	31 f6                	xor    %esi,%esi
     cae:	b9 01 00 00 00       	mov    $0x1,%ecx
     cb3:	e8 00 00 00 00       	callq  cb8 <new_sync_read+0x188>
     cb8:	48 8b 43 28          	mov    0x28(%rbx),%rax
     cbc:	48 8d 75 90          	lea    -0x70(%rbp),%rsi
     cc0:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
     cc4:	48 8b 40 20          	mov    0x20(%rax),%rax
     cc8:	e8 00 00 00 00       	callq  ccd <new_sync_read+0x19d>
     ccd:	48 3d ef fd ff ff    	cmp    $0xfffffffffffffdef,%rax
     cd3:	75 8d                	jne    c62 <new_sync_read+0x132>
     cd5:	0f 0b                	ud2    
     cd7:	e8 00 00 00 00       	callq  cdc <new_sync_read+0x1ac>
     cdc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000ce0 <new_sync_write>:
     ce0:	e8 00 00 00 00       	callq  ce5 <new_sync_write+0x5>
     ce5:	55                   	push   %rbp
     ce6:	49 89 d0             	mov    %rdx,%r8
     ce9:	48 89 e5             	mov    %rsp,%rbp
     cec:	41 54                	push   %r12
     cee:	53                   	push   %rbx
     cef:	49 89 cc             	mov    %rcx,%r12
     cf2:	48 89 fb             	mov    %rdi,%rbx
     cf5:	48 83 ec 70          	sub    $0x70,%rsp
     cf9:	8b 4f 40             	mov    0x40(%rdi),%ecx
     cfc:	48 89 75 80          	mov    %rsi,-0x80(%rbp)
     d00:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     d07:	00 00 
     d09:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     d0d:	31 c0                	xor    %eax,%eax
     d0f:	31 c0                	xor    %eax,%eax
     d11:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
     d15:	f6 c5 04             	test   $0x4,%ch
     d18:	0f 95 c0             	setne  %al
     d1b:	01 c0                	add    %eax,%eax
     d1d:	f6 c5 40             	test   $0x40,%ch
     d20:	0f 85 10 01 00 00    	jne    e36 <new_sync_write+0x156>
     d26:	48 8b 97 f0 00 00 00 	mov    0xf0(%rdi),%rdx
     d2d:	48 8b 12             	mov    (%rdx),%rdx
     d30:	f6 42 0d 20          	testb  $0x20,0xd(%rdx)
     d34:	0f 85 fc 00 00 00    	jne    e36 <new_sync_write+0x156>
     d3a:	f6 c5 10             	test   $0x10,%ch
     d3d:	75 18                	jne    d57 <new_sync_write+0x77>
     d3f:	48 8b 93 f0 00 00 00 	mov    0xf0(%rbx),%rdx
     d46:	48 8b 12             	mov    (%rdx),%rdx
     d49:	48 8b 72 28          	mov    0x28(%rdx),%rsi
     d4d:	f6 46 50 10          	testb  $0x10,0x50(%rsi)
     d51:	0f 84 fa 00 00 00    	je     e51 <new_sync_write+0x171>
     d57:	83 c8 10             	or     $0x10,%eax
     d5a:	89 c2                	mov    %eax,%edx
     d5c:	83 ca 20             	or     $0x20,%edx
     d5f:	81 e1 00 00 10 00    	and    $0x100000,%ecx
     d65:	8b 4b 34             	mov    0x34(%rbx),%ecx
     d68:	0f 45 c2             	cmovne %edx,%eax
     d6b:	85 c9                	test   %ecx,%ecx
     d6d:	0f 85 cb 00 00 00    	jne    e3e <new_sync_write+0x15e>
     d73:	48 8b 53 20          	mov    0x20(%rbx),%rdx
     d77:	0f b6 8a 8f 00 00 00 	movzbl 0x8f(%rdx),%ecx
     d7e:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
     d85:	00 00 
     d87:	48 8b b2 80 0b 00 00 	mov    0xb80(%rdx),%rsi
     d8e:	31 d2                	xor    %edx,%edx
     d90:	48 85 f6             	test   %rsi,%rsi
     d93:	74 04                	je     d99 <new_sync_write+0xb9>
     d95:	0f b7 56 14          	movzwl 0x14(%rsi),%edx
     d99:	4d 85 e4             	test   %r12,%r12
     d9c:	48 c7 45 c0 00 00 00 	movq   $0x0,-0x40(%rbp)
     da3:	00 
     da4:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
     dab:	00 
     dac:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
     db3:	00 
     db4:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
     dbb:	00 
     dbc:	48 89 5d b8          	mov    %rbx,-0x48(%rbp)
     dc0:	89 45 d8             	mov    %eax,-0x28(%rbp)
     dc3:	66 89 4d dc          	mov    %cx,-0x24(%rbp)
     dc7:	66 89 55 de          	mov    %dx,-0x22(%rbp)
     dcb:	0f 84 8f 00 00 00    	je     e60 <new_sync_write+0x180>
     dd1:	49 8b 04 24          	mov    (%r12),%rax
     dd5:	48 8d 55 80          	lea    -0x80(%rbp),%rdx
     dd9:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
     ddd:	b9 01 00 00 00       	mov    $0x1,%ecx
     de2:	be 01 00 00 00       	mov    $0x1,%esi
     de7:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     deb:	e8 00 00 00 00       	callq  df0 <new_sync_write+0x110>
     df0:	48 8b 43 28          	mov    0x28(%rbx),%rax
     df4:	48 8d 75 90          	lea    -0x70(%rbp),%rsi
     df8:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
     dfc:	48 8b 40 28          	mov    0x28(%rax),%rax
     e00:	e8 00 00 00 00       	callq  e05 <new_sync_write+0x125>
     e05:	48 3d ef fd ff ff    	cmp    $0xfffffffffffffdef,%rax
     e0b:	0f 84 83 00 00 00    	je     e94 <new_sync_write+0x1b4>
     e11:	48 85 c0             	test   %rax,%rax
     e14:	7e 08                	jle    e1e <new_sync_write+0x13e>
     e16:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
     e1a:	49 89 14 24          	mov    %rdx,(%r12)
     e1e:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
     e22:	65 48 33 3c 25 28 00 	xor    %gs:0x28,%rdi
     e29:	00 00 
     e2b:	75 69                	jne    e96 <new_sync_write+0x1b6>
     e2d:	48 83 c4 70          	add    $0x70,%rsp
     e31:	5b                   	pop    %rbx
     e32:	41 5c                	pop    %r12
     e34:	5d                   	pop    %rbp
     e35:	c3                   	retq   
     e36:	83 c8 04             	or     $0x4,%eax
     e39:	e9 fc fe ff ff       	jmpq   d3a <new_sync_write+0x5a>
     e3e:	81 f9 ff ff 00 00    	cmp    $0xffff,%ecx
     e44:	0f 86 34 ff ff ff    	jbe    d7e <new_sync_write+0x9e>
     e4a:	31 c9                	xor    %ecx,%ecx
     e4c:	e9 2d ff ff ff       	jmpq   d7e <new_sync_write+0x9e>
     e51:	f6 42 0c 01          	testb  $0x1,0xc(%rdx)
     e55:	0f 84 ff fe ff ff    	je     d5a <new_sync_write+0x7a>
     e5b:	e9 f7 fe ff ff       	jmpq   d57 <new_sync_write+0x77>
     e60:	48 8d 55 80          	lea    -0x80(%rbp),%rdx
     e64:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
     e68:	b9 01 00 00 00       	mov    $0x1,%ecx
     e6d:	be 01 00 00 00       	mov    $0x1,%esi
     e72:	e8 00 00 00 00       	callq  e77 <new_sync_write+0x197>
     e77:	48 8b 43 28          	mov    0x28(%rbx),%rax
     e7b:	48 8d 75 90          	lea    -0x70(%rbp),%rsi
     e7f:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
     e83:	48 8b 40 28          	mov    0x28(%rax),%rax
     e87:	e8 00 00 00 00       	callq  e8c <new_sync_write+0x1ac>
     e8c:	48 3d ef fd ff ff    	cmp    $0xfffffffffffffdef,%rax
     e92:	75 8a                	jne    e1e <new_sync_write+0x13e>
     e94:	0f 0b                	ud2    
     e96:	e8 00 00 00 00       	callq  e9b <new_sync_write+0x1bb>
     e9b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000ea0 <__vfs_write>:
     ea0:	e8 00 00 00 00       	callq  ea5 <__vfs_write+0x5>
     ea5:	4c 8b 47 28          	mov    0x28(%rdi),%r8
     ea9:	55                   	push   %rbp
     eaa:	48 89 e5             	mov    %rsp,%rbp
     ead:	49 8b 40 18          	mov    0x18(%r8),%rax
     eb1:	48 85 c0             	test   %rax,%rax
     eb4:	74 07                	je     ebd <__vfs_write+0x1d>
     eb6:	e8 00 00 00 00       	callq  ebb <__vfs_write+0x1b>
     ebb:	5d                   	pop    %rbp
     ebc:	c3                   	retq   
     ebd:	49 83 78 28 00       	cmpq   $0x0,0x28(%r8)
     ec2:	74 07                	je     ecb <__vfs_write+0x2b>
     ec4:	e8 17 fe ff ff       	callq  ce0 <new_sync_write>
     ec9:	5d                   	pop    %rbp
     eca:	c3                   	retq   
     ecb:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
     ed2:	5d                   	pop    %rbp
     ed3:	c3                   	retq   
     ed4:	66 90                	xchg   %ax,%ax
     ed6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     edd:	00 00 00 

0000000000000ee0 <vfs_dedupe_get_page.isra.22>:
     ee0:	e8 00 00 00 00       	callq  ee5 <vfs_dedupe_get_page.isra.22+0x5>
     ee5:	55                   	push   %rbp
     ee6:	48 c1 fe 0c          	sar    $0xc,%rsi
     eea:	31 c9                	xor    %ecx,%ecx
     eec:	31 d2                	xor    %edx,%edx
     eee:	48 89 e5             	mov    %rsp,%rbp
     ef1:	e8 00 00 00 00       	callq  ef6 <vfs_dedupe_get_page.isra.22+0x16>
     ef6:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
     efc:	77 38                	ja     f36 <vfs_dedupe_get_page.isra.22+0x56>
     efe:	48 8b 48 08          	mov    0x8(%rax),%rcx
     f02:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
     f06:	83 e1 01             	and    $0x1,%ecx
     f09:	48 0f 44 d0          	cmove  %rax,%rdx
     f0d:	48 8b 12             	mov    (%rdx),%rdx
     f10:	83 e2 04             	and    $0x4,%edx
     f13:	75 23                	jne    f38 <vfs_dedupe_get_page.isra.22+0x58>
     f15:	48 8b 50 08          	mov    0x8(%rax),%rdx
     f19:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
     f1d:	83 e2 01             	and    $0x1,%edx
     f20:	48 0f 45 c1          	cmovne %rcx,%rax
     f24:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
     f29:	f0 ff 48 34          	lock decl 0x34(%rax)
     f2d:	74 0b                	je     f3a <vfs_dedupe_get_page.isra.22+0x5a>
     f2f:	48 c7 c0 fb ff ff ff 	mov    $0xfffffffffffffffb,%rax
     f36:	5d                   	pop    %rbp
     f37:	c3                   	retq   
     f38:	5d                   	pop    %rbp
     f39:	c3                   	retq   
     f3a:	48 89 c7             	mov    %rax,%rdi
     f3d:	e8 00 00 00 00       	callq  f42 <vfs_dedupe_get_page.isra.22+0x62>
     f42:	48 c7 c0 fb ff ff ff 	mov    $0xfffffffffffffffb,%rax
     f49:	5d                   	pop    %rbp
     f4a:	c3                   	retq   
     f4b:	48 8b 10             	mov    (%rax),%rdx
     f4e:	48 c1 ea 33          	shr    $0x33,%rdx
     f52:	83 e2 07             	and    $0x7,%edx
     f55:	83 fa 04             	cmp    $0x4,%edx
     f58:	75 cf                	jne    f29 <vfs_dedupe_get_page.isra.22+0x49>
     f5a:	48 8b 50 08          	mov    0x8(%rax),%rdx
     f5e:	8b 92 d0 00 00 00    	mov    0xd0(%rdx),%edx
     f64:	83 ea 01             	sub    $0x1,%edx
     f67:	83 fa 01             	cmp    $0x1,%edx
     f6a:	77 bd                	ja     f29 <vfs_dedupe_get_page.isra.22+0x49>
     f6c:	48 89 c7             	mov    %rax,%rdi
     f6f:	e8 00 00 00 00       	callq  f74 <vfs_dedupe_get_page.isra.22+0x94>
     f74:	48 c7 c0 fb ff ff ff 	mov    $0xfffffffffffffffb,%rax
     f7b:	5d                   	pop    %rbp
     f7c:	c3                   	retq   
     f7d:	0f 1f 00             	nopl   (%rax)

0000000000000f80 <__kernel_write>:
     f80:	e8 00 00 00 00       	callq  f85 <__kernel_write+0x5>
     f85:	55                   	push   %rbp
     f86:	48 89 e5             	mov    %rsp,%rbp
     f89:	41 57                	push   %r15
     f8b:	41 56                	push   %r14
     f8d:	41 55                	push   %r13
     f8f:	41 54                	push   %r12
     f91:	53                   	push   %rbx
     f92:	f6 47 46 04          	testb  $0x4,0x46(%rdi)
     f96:	0f 84 da 00 00 00    	je     1076 <__kernel_write+0xf6>
     f9c:	65 48 8b 1c 25 00 00 	mov    %gs:0x0,%rbx
     fa3:	00 00 
     fa5:	49 89 fc             	mov    %rdi,%r12
     fa8:	4c 8b b3 50 13 00 00 	mov    0x1350(%rbx),%r14
     faf:	48 c7 83 50 13 00 00 	movq   $0xffffffffffffffff,0x1350(%rbx)
     fb6:	ff ff ff ff 
     fba:	f0 80 4b 03 80       	lock orb $0x80,0x3(%rbx)
     fbf:	b8 00 f0 ff 7f       	mov    $0x7ffff000,%eax
     fc4:	48 81 fa 00 f0 ff 7f 	cmp    $0x7ffff000,%rdx
     fcb:	48 0f 47 d0          	cmova  %rax,%rdx
     fcf:	e8 cc fe ff ff       	callq  ea0 <__vfs_write>
     fd4:	4c 89 b3 50 13 00 00 	mov    %r14,0x1350(%rbx)
     fdb:	49 89 c5             	mov    %rax,%r13
     fde:	f0 80 4b 03 80       	lock orb $0x80,0x3(%rbx)
     fe3:	48 85 c0             	test   %rax,%rax
     fe6:	7f 1f                	jg     1007 <__kernel_write+0x87>
     fe8:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
     fef:	00 00 
     ff1:	48 83 80 b8 0b 00 00 	addq   $0x1,0xbb8(%rax)
     ff8:	01 
     ff9:	5b                   	pop    %rbx
     ffa:	4c 89 e8             	mov    %r13,%rax
     ffd:	41 5c                	pop    %r12
     fff:	41 5d                	pop    %r13
    1001:	41 5e                	pop    %r14
    1003:	41 5f                	pop    %r15
    1005:	5d                   	pop    %rbp
    1006:	c3                   	retq   
    1007:	41 f6 44 24 47 04    	testb  $0x4,0x47(%r12)
    100d:	75 3b                	jne    104a <__kernel_write+0xca>
    100f:	4d 8b 74 24 20       	mov    0x20(%r12),%r14
    1014:	bb 02 00 00 00       	mov    $0x2,%ebx
    1019:	4d 8d 7c 24 10       	lea    0x10(%r12),%r15
    101e:	49 8b 7c 24 18       	mov    0x18(%r12),%rdi
    1023:	b9 01 00 00 00       	mov    $0x1,%ecx
    1028:	4c 89 fa             	mov    %r15,%rdx
    102b:	41 0f b7 06          	movzwl (%r14),%eax
    102f:	66 25 00 f0          	and    $0xf000,%ax
    1033:	66 3d 00 40          	cmp    $0x4000,%ax
    1037:	b8 02 00 00 40       	mov    $0x40000002,%eax
    103c:	0f 44 d8             	cmove  %eax,%ebx
    103f:	89 de                	mov    %ebx,%esi
    1041:	e8 00 00 00 00       	callq  1046 <__kernel_write+0xc6>
    1046:	85 c0                	test   %eax,%eax
    1048:	74 12                	je     105c <__kernel_write+0xdc>
    104a:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    1051:	00 00 
    1053:	4c 01 a8 a8 0b 00 00 	add    %r13,0xba8(%rax)
    105a:	eb 8c                	jmp    fe8 <__kernel_write+0x68>
    105c:	45 31 c9             	xor    %r9d,%r9d
    105f:	45 31 c0             	xor    %r8d,%r8d
    1062:	b9 01 00 00 00       	mov    $0x1,%ecx
    1067:	4c 89 fa             	mov    %r15,%rdx
    106a:	89 de                	mov    %ebx,%esi
    106c:	4c 89 f7             	mov    %r14,%rdi
    106f:	e8 00 00 00 00       	callq  1074 <__kernel_write+0xf4>
    1074:	eb d4                	jmp    104a <__kernel_write+0xca>
    1076:	49 c7 c5 ea ff ff ff 	mov    $0xffffffffffffffea,%r13
    107d:	e9 77 ff ff ff       	jmpq   ff9 <__kernel_write+0x79>
    1082:	0f 1f 40 00          	nopl   0x0(%rax)
    1086:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    108d:	00 00 00 

0000000000001090 <do_clone_file_range>:
    1090:	e8 00 00 00 00       	callq  1095 <do_clone_file_range+0x5>
    1095:	55                   	push   %rbp
    1096:	48 89 e5             	mov    %rsp,%rbp
    1099:	41 57                	push   %r15
    109b:	41 56                	push   %r14
    109d:	41 55                	push   %r13
    109f:	41 54                	push   %r12
    10a1:	53                   	push   %rbx
    10a2:	48 83 ec 08          	sub    $0x8,%rsp
    10a6:	41 f6 c1 01          	test   $0x1,%r9b
    10aa:	0f 85 7d 01 00 00    	jne    122d <do_clone_file_range+0x19d>
    10b0:	4c 8b 5f 20          	mov    0x20(%rdi),%r11
    10b4:	48 8b 42 20          	mov    0x20(%rdx),%rax
    10b8:	49 c7 c2 ee ff ff ff 	mov    $0xffffffffffffffee,%r10
    10bf:	48 8b 40 28          	mov    0x28(%rax),%rax
    10c3:	49 39 43 28          	cmp    %rax,0x28(%r11)
    10c7:	75 4d                	jne    1116 <do_clone_file_range+0x86>
    10c9:	49 89 f6             	mov    %rsi,%r14
    10cc:	48 89 d6             	mov    %rdx,%rsi
    10cf:	44 89 4d d0          	mov    %r9d,-0x30(%rbp)
    10d3:	4d 89 c5             	mov    %r8,%r13
    10d6:	49 89 cc             	mov    %rcx,%r12
    10d9:	48 89 d3             	mov    %rdx,%rbx
    10dc:	49 89 ff             	mov    %rdi,%r15
    10df:	e8 00 00 00 00       	callq  10e4 <do_clone_file_range+0x54>
    10e4:	4c 63 d0             	movslq %eax,%r10
    10e7:	4d 85 d2             	test   %r10,%r10
    10ea:	78 2a                	js     1116 <do_clone_file_range+0x86>
    10ec:	49 8b 47 28          	mov    0x28(%r15),%rax
    10f0:	48 83 b8 f0 00 00 00 	cmpq   $0x0,0xf0(%rax)
    10f7:	00 
    10f8:	0f 84 58 01 00 00    	je     1256 <do_clone_file_range+0x1c6>
    10fe:	31 c9                	xor    %ecx,%ecx
    1100:	4c 89 ea             	mov    %r13,%rdx
    1103:	4c 89 f6             	mov    %r14,%rsi
    1106:	4c 89 ff             	mov    %r15,%rdi
    1109:	e8 f2 f3 ff ff       	callq  500 <remap_verify_area>
    110e:	4c 63 d0             	movslq %eax,%r10
    1111:	4d 85 d2             	test   %r10,%r10
    1114:	74 12                	je     1128 <do_clone_file_range+0x98>
    1116:	48 83 c4 08          	add    $0x8,%rsp
    111a:	4c 89 d0             	mov    %r10,%rax
    111d:	5b                   	pop    %rbx
    111e:	41 5c                	pop    %r12
    1120:	41 5d                	pop    %r13
    1122:	41 5e                	pop    %r14
    1124:	41 5f                	pop    %r15
    1126:	5d                   	pop    %rbp
    1127:	c3                   	retq   
    1128:	b9 01 00 00 00       	mov    $0x1,%ecx
    112d:	4c 89 ea             	mov    %r13,%rdx
    1130:	4c 89 e6             	mov    %r12,%rsi
    1133:	48 89 df             	mov    %rbx,%rdi
    1136:	e8 c5 f3 ff ff       	callq  500 <remap_verify_area>
    113b:	4c 63 d0             	movslq %eax,%r10
    113e:	4d 85 d2             	test   %r10,%r10
    1141:	75 d3                	jne    1116 <do_clone_file_range+0x86>
    1143:	49 8b 47 28          	mov    0x28(%r15),%rax
    1147:	44 8b 4d d0          	mov    -0x30(%rbp),%r9d
    114b:	4d 89 e8             	mov    %r13,%r8
    114e:	4c 89 e1             	mov    %r12,%rcx
    1151:	48 89 da             	mov    %rbx,%rdx
    1154:	4c 89 f6             	mov    %r14,%rsi
    1157:	4c 89 ff             	mov    %r15,%rdi
    115a:	48 8b 80 f0 00 00 00 	mov    0xf0(%rax),%rax
    1161:	e8 00 00 00 00       	callq  1166 <do_clone_file_range+0xd6>
    1166:	48 85 c0             	test   %rax,%rax
    1169:	49 89 c2             	mov    %rax,%r10
    116c:	78 a8                	js     1116 <do_clone_file_range+0x86>
    116e:	41 f6 47 47 04       	testb  $0x4,0x47(%r15)
    1173:	75 44                	jne    11b9 <do_clone_file_range+0x129>
    1175:	4d 8b 6f 20          	mov    0x20(%r15),%r13
    1179:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    117d:	41 bc 01 00 00 00    	mov    $0x1,%r12d
    1183:	4d 8d 77 10          	lea    0x10(%r15),%r14
    1187:	49 8b 7f 18          	mov    0x18(%r15),%rdi
    118b:	b9 01 00 00 00       	mov    $0x1,%ecx
    1190:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
    1195:	4c 89 f2             	mov    %r14,%rdx
    1198:	66 25 00 f0          	and    $0xf000,%ax
    119c:	66 3d 00 40          	cmp    $0x4000,%ax
    11a0:	b8 01 00 00 40       	mov    $0x40000001,%eax
    11a5:	44 0f 44 e0          	cmove  %eax,%r12d
    11a9:	44 89 e6             	mov    %r12d,%esi
    11ac:	e8 00 00 00 00       	callq  11b1 <do_clone_file_range+0x121>
    11b1:	85 c0                	test   %eax,%eax
    11b3:	4c 8b 55 d0          	mov    -0x30(%rbp),%r10
    11b7:	74 7b                	je     1234 <do_clone_file_range+0x1a4>
    11b9:	f6 43 47 04          	testb  $0x4,0x47(%rbx)
    11bd:	0f 85 53 ff ff ff    	jne    1116 <do_clone_file_range+0x86>
    11c3:	4c 8b 6b 20          	mov    0x20(%rbx),%r13
    11c7:	41 bc 02 00 00 00    	mov    $0x2,%r12d
    11cd:	4c 8d 73 10          	lea    0x10(%rbx),%r14
    11d1:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
    11d5:	b9 01 00 00 00       	mov    $0x1,%ecx
    11da:	4c 89 55 d0          	mov    %r10,-0x30(%rbp)
    11de:	4c 89 f2             	mov    %r14,%rdx
    11e1:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
    11e6:	66 25 00 f0          	and    $0xf000,%ax
    11ea:	66 3d 00 40          	cmp    $0x4000,%ax
    11ee:	b8 02 00 00 40       	mov    $0x40000002,%eax
    11f3:	44 0f 44 e0          	cmove  %eax,%r12d
    11f7:	44 89 e6             	mov    %r12d,%esi
    11fa:	e8 00 00 00 00       	callq  11ff <do_clone_file_range+0x16f>
    11ff:	85 c0                	test   %eax,%eax
    1201:	4c 8b 55 d0          	mov    -0x30(%rbp),%r10
    1205:	0f 85 0b ff ff ff    	jne    1116 <do_clone_file_range+0x86>
    120b:	45 31 c9             	xor    %r9d,%r9d
    120e:	45 31 c0             	xor    %r8d,%r8d
    1211:	b9 01 00 00 00       	mov    $0x1,%ecx
    1216:	4c 89 f2             	mov    %r14,%rdx
    1219:	44 89 e6             	mov    %r12d,%esi
    121c:	4c 89 ef             	mov    %r13,%rdi
    121f:	e8 00 00 00 00       	callq  1224 <do_clone_file_range+0x194>
    1224:	4c 8b 55 d0          	mov    -0x30(%rbp),%r10
    1228:	e9 e9 fe ff ff       	jmpq   1116 <do_clone_file_range+0x86>
    122d:	0f 0b                	ud2    
    122f:	e9 7c fe ff ff       	jmpq   10b0 <do_clone_file_range+0x20>
    1234:	45 31 c9             	xor    %r9d,%r9d
    1237:	45 31 c0             	xor    %r8d,%r8d
    123a:	b9 01 00 00 00       	mov    $0x1,%ecx
    123f:	4c 89 f2             	mov    %r14,%rdx
    1242:	44 89 e6             	mov    %r12d,%esi
    1245:	4c 89 ef             	mov    %r13,%rdi
    1248:	e8 00 00 00 00       	callq  124d <do_clone_file_range+0x1bd>
    124d:	4c 8b 55 d0          	mov    -0x30(%rbp),%r10
    1251:	e9 63 ff ff ff       	jmpq   11b9 <do_clone_file_range+0x129>
    1256:	49 c7 c2 a1 ff ff ff 	mov    $0xffffffffffffffa1,%r10
    125d:	e9 b4 fe ff ff       	jmpq   1116 <do_clone_file_range+0x86>
    1262:	0f 1f 40 00          	nopl   0x0(%rax)
    1266:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    126d:	00 00 00 

0000000000001270 <vfs_clone_file_range>:
    1270:	e8 00 00 00 00       	callq  1275 <vfs_clone_file_range+0x5>
    1275:	55                   	push   %rbp
    1276:	48 89 e5             	mov    %rsp,%rbp
    1279:	41 55                	push   %r13
    127b:	41 54                	push   %r12
    127d:	53                   	push   %rbx
    127e:	48 89 d3             	mov    %rdx,%rbx
    1281:	49 89 fc             	mov    %rdi,%r12
    1284:	49 89 f5             	mov    %rsi,%r13
    1287:	48 83 ec 18          	sub    $0x18,%rsp
    128b:	48 8b 52 20          	mov    0x20(%rdx),%rdx
    128f:	0f b7 02             	movzwl (%rdx),%eax
    1292:	66 25 00 f0          	and    $0xf000,%ax
    1296:	66 3d 00 80          	cmp    $0x8000,%ax
    129a:	74 2c                	je     12c8 <vfs_clone_file_range+0x58>
    129c:	48 89 da             	mov    %rbx,%rdx
    129f:	4c 89 ee             	mov    %r13,%rsi
    12a2:	4c 89 e7             	mov    %r12,%rdi
    12a5:	e8 00 00 00 00       	callq  12aa <vfs_clone_file_range+0x3a>
    12aa:	48 8b 4b 20          	mov    0x20(%rbx),%rcx
    12ae:	0f b7 11             	movzwl (%rcx),%edx
    12b1:	66 81 e2 00 f0       	and    $0xf000,%dx
    12b6:	66 81 fa 00 80       	cmp    $0x8000,%dx
    12bb:	74 38                	je     12f5 <vfs_clone_file_range+0x85>
    12bd:	48 83 c4 18          	add    $0x18,%rsp
    12c1:	5b                   	pop    %rbx
    12c2:	41 5c                	pop    %r12
    12c4:	41 5d                	pop    %r13
    12c6:	5d                   	pop    %rbp
    12c7:	c3                   	retq   
    12c8:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
    12cc:	be 01 00 00 00       	mov    $0x1,%esi
    12d1:	ba 01 00 00 00       	mov    $0x1,%edx
    12d6:	44 89 4d d4          	mov    %r9d,-0x2c(%rbp)
    12da:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    12de:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    12e2:	e8 00 00 00 00       	callq  12e7 <vfs_clone_file_range+0x77>
    12e7:	44 8b 4d d4          	mov    -0x2c(%rbp),%r9d
    12eb:	4c 8b 45 d8          	mov    -0x28(%rbp),%r8
    12ef:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    12f3:	eb a7                	jmp    129c <vfs_clone_file_range+0x2c>
    12f5:	48 8b 79 28          	mov    0x28(%rcx),%rdi
    12f9:	be 01 00 00 00       	mov    $0x1,%esi
    12fe:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1302:	e8 00 00 00 00       	callq  1307 <vfs_clone_file_range+0x97>
    1307:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    130b:	48 83 c4 18          	add    $0x18,%rsp
    130f:	5b                   	pop    %rbx
    1310:	41 5c                	pop    %r12
    1312:	41 5d                	pop    %r13
    1314:	5d                   	pop    %rbp
    1315:	c3                   	retq   
    1316:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    131d:	00 00 00 

0000000000001320 <generic_remap_file_range_prep>:
    1320:	e8 00 00 00 00       	callq  1325 <generic_remap_file_range_prep+0x5>
    1325:	55                   	push   %rbp
    1326:	48 89 e5             	mov    %rsp,%rbp
    1329:	41 57                	push   %r15
    132b:	41 56                	push   %r14
    132d:	41 55                	push   %r13
    132f:	41 54                	push   %r12
    1331:	53                   	push   %rbx
    1332:	48 83 ec 60          	sub    $0x60,%rsp
    1336:	4c 8b 62 20          	mov    0x20(%rdx),%r12
    133a:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    133e:	44 89 4d d4          	mov    %r9d,-0x2c(%rbp)
    1342:	48 8b 5f 20          	mov    0x20(%rdi),%rbx
    1346:	41 8b 44 24 0c       	mov    0xc(%r12),%eax
    134b:	a8 08                	test   $0x8,%al
    134d:	0f 85 b5 01 00 00    	jne    1508 <generic_remap_file_range_prep+0x1e8>
    1353:	0b 43 0c             	or     0xc(%rbx),%eax
    1356:	f6 c4 01             	test   $0x1,%ah
    1359:	0f 85 a1 01 00 00    	jne    1500 <generic_remap_file_range_prep+0x1e0>
    135f:	0f b7 03             	movzwl (%rbx),%eax
    1362:	66 25 00 f0          	and    $0xf000,%ax
    1366:	66 3d 00 40          	cmp    $0x4000,%ax
    136a:	0f 84 a0 01 00 00    	je     1510 <generic_remap_file_range_prep+0x1f0>
    1370:	49 89 d6             	mov    %rdx,%r14
    1373:	41 0f b7 14 24       	movzwl (%r12),%edx
    1378:	66 81 e2 00 f0       	and    $0xf000,%dx
    137d:	66 81 fa 00 40       	cmp    $0x4000,%dx
    1382:	0f 84 88 01 00 00    	je     1510 <generic_remap_file_range_prep+0x1f0>
    1388:	66 81 fa 00 80       	cmp    $0x8000,%dx
    138d:	0f 85 65 01 00 00    	jne    14f8 <generic_remap_file_range_prep+0x1d8>
    1393:	66 3d 00 80          	cmp    $0x8000,%ax
    1397:	0f 85 5b 01 00 00    	jne    14f8 <generic_remap_file_range_prep+0x1d8>
    139d:	49 83 38 00          	cmpq   $0x0,(%r8)
    13a1:	49 89 f5             	mov    %rsi,%r13
    13a4:	4d 89 c2             	mov    %r8,%r10
    13a7:	75 2f                	jne    13d8 <generic_remap_file_range_prep+0xb8>
    13a9:	48 8b 43 50          	mov    0x50(%rbx),%rax
    13ad:	48 39 c6             	cmp    %rax,%rsi
    13b0:	0f 84 22 01 00 00    	je     14d8 <generic_remap_file_range_prep+0x1b8>
    13b6:	f6 45 d4 01          	testb  $0x1,-0x2c(%rbp)
    13ba:	0f 85 18 01 00 00    	jne    14d8 <generic_remap_file_range_prep+0x1b8>
    13c0:	48 39 c6             	cmp    %rax,%rsi
    13c3:	0f 8f 2f 01 00 00    	jg     14f8 <generic_remap_file_range_prep+0x1d8>
    13c9:	48 29 f0             	sub    %rsi,%rax
    13cc:	48 85 c0             	test   %rax,%rax
    13cf:	49 89 00             	mov    %rax,(%r8)
    13d2:	0f 84 00 01 00 00    	je     14d8 <generic_remap_file_range_prep+0x1b8>
    13d8:	44 8b 4d d4          	mov    -0x2c(%rbp),%r9d
    13dc:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    13e0:	4d 89 d0             	mov    %r10,%r8
    13e3:	4c 89 f2             	mov    %r14,%rdx
    13e6:	4c 89 ee             	mov    %r13,%rsi
    13e9:	4c 89 55 c0          	mov    %r10,-0x40(%rbp)
    13ed:	e8 00 00 00 00       	callq  13f2 <generic_remap_file_range_prep+0xd2>
    13f2:	85 c0                	test   %eax,%eax
    13f4:	41 89 c7             	mov    %eax,%r15d
    13f7:	4c 8b 55 c0          	mov    -0x40(%rbp),%r10
    13fb:	0f 85 da 00 00 00    	jne    14db <generic_remap_file_range_prep+0x1bb>
    1401:	48 89 df             	mov    %rbx,%rdi
    1404:	4c 89 55 c0          	mov    %r10,-0x40(%rbp)
    1408:	e8 00 00 00 00       	callq  140d <generic_remap_file_range_prep+0xed>
    140d:	4c 39 e3             	cmp    %r12,%rbx
    1410:	4c 8b 55 c0          	mov    -0x40(%rbp),%r10
    1414:	74 0c                	je     1422 <generic_remap_file_range_prep+0x102>
    1416:	4c 89 e7             	mov    %r12,%rdi
    1419:	e8 00 00 00 00       	callq  141e <generic_remap_file_range_prep+0xfe>
    141e:	4c 8b 55 c0          	mov    -0x40(%rbp),%r10
    1422:	49 8b 12             	mov    (%r10),%rdx
    1425:	48 8b 7b 30          	mov    0x30(%rbx),%rdi
    1429:	4c 89 ee             	mov    %r13,%rsi
    142c:	4c 89 55 c0          	mov    %r10,-0x40(%rbp)
    1430:	4c 01 ea             	add    %r13,%rdx
    1433:	48 83 ea 01          	sub    $0x1,%rdx
    1437:	e8 00 00 00 00       	callq  143c <generic_remap_file_range_prep+0x11c>
    143c:	85 c0                	test   %eax,%eax
    143e:	41 89 c7             	mov    %eax,%r15d
    1441:	4c 8b 55 c0          	mov    -0x40(%rbp),%r10
    1445:	0f 85 90 00 00 00    	jne    14db <generic_remap_file_range_prep+0x1bb>
    144b:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
    144f:	49 8b 12             	mov    (%r10),%rdx
    1452:	49 8b 7c 24 30       	mov    0x30(%r12),%rdi
    1457:	48 01 f2             	add    %rsi,%rdx
    145a:	48 83 ea 01          	sub    $0x1,%rdx
    145e:	e8 00 00 00 00       	callq  1463 <generic_remap_file_range_prep+0x143>
    1463:	85 c0                	test   %eax,%eax
    1465:	41 89 c7             	mov    %eax,%r15d
    1468:	75 71                	jne    14db <generic_remap_file_range_prep+0x1bb>
    146a:	4c 8b 55 c0          	mov    -0x40(%rbp),%r10
    146e:	49 8b 02             	mov    (%r10),%rax
    1471:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    1475:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    1478:	83 e0 01             	and    $0x1,%eax
    147b:	89 45 d0             	mov    %eax,-0x30(%rbp)
    147e:	0f 85 94 00 00 00    	jne    1518 <generic_remap_file_range_prep+0x1f8>
    1484:	0f b6 8b 8e 00 00 00 	movzbl 0x8e(%rbx),%ecx
    148b:	b8 01 00 00 00       	mov    $0x1,%eax
    1490:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
    1494:	d3 e0                	shl    %cl,%eax
    1496:	8d 50 ff             	lea    -0x1(%rax),%edx
    1499:	48 85 d6             	test   %rdx,%rsi
    149c:	74 2d                	je     14cb <generic_remap_file_range_prep+0x1ab>
    149e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    14a2:	48 01 f0             	add    %rsi,%rax
    14a5:	49 3b 44 24 50       	cmp    0x50(%r12),%rax
    14aa:	7d 1f                	jge    14cb <generic_remap_file_range_prep+0x1ab>
    14ac:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    14b0:	48 f7 d2             	not    %rdx
    14b3:	48 21 c2             	and    %rax,%rdx
    14b6:	48 39 c2             	cmp    %rax,%rdx
    14b9:	74 09                	je     14c4 <generic_remap_file_range_prep+0x1a4>
    14bb:	f6 45 d4 02          	testb  $0x2,-0x2c(%rbp)
    14bf:	74 2c                	je     14ed <generic_remap_file_range_prep+0x1cd>
    14c1:	49 89 12             	mov    %rdx,(%r10)
    14c4:	8b 45 d0             	mov    -0x30(%rbp),%eax
    14c7:	85 c0                	test   %eax,%eax
    14c9:	75 10                	jne    14db <generic_remap_file_range_prep+0x1bb>
    14cb:	4c 89 f7             	mov    %r14,%rdi
    14ce:	e8 00 00 00 00       	callq  14d3 <generic_remap_file_range_prep+0x1b3>
    14d3:	41 89 c7             	mov    %eax,%r15d
    14d6:	eb 03                	jmp    14db <generic_remap_file_range_prep+0x1bb>
    14d8:	45 31 ff             	xor    %r15d,%r15d
    14db:	48 83 c4 60          	add    $0x60,%rsp
    14df:	44 89 f8             	mov    %r15d,%eax
    14e2:	5b                   	pop    %rbx
    14e3:	41 5c                	pop    %r12
    14e5:	41 5d                	pop    %r13
    14e7:	41 5e                	pop    %r14
    14e9:	41 5f                	pop    %r15
    14eb:	5d                   	pop    %rbp
    14ec:	c3                   	retq   
    14ed:	8b 55 d0             	mov    -0x30(%rbp),%edx
    14f0:	85 d2                	test   %edx,%edx
    14f2:	0f 85 6a 03 00 00    	jne    1862 <generic_remap_file_range_prep+0x542>
    14f8:	41 bf ea ff ff ff    	mov    $0xffffffea,%r15d
    14fe:	eb db                	jmp    14db <generic_remap_file_range_prep+0x1bb>
    1500:	41 bf e6 ff ff ff    	mov    $0xffffffe6,%r15d
    1506:	eb d3                	jmp    14db <generic_remap_file_range_prep+0x1bb>
    1508:	41 bf ff ff ff ff    	mov    $0xffffffff,%r15d
    150e:	eb cb                	jmp    14db <generic_remap_file_range_prep+0x1bb>
    1510:	41 bf eb ff ff ff    	mov    $0xffffffeb,%r15d
    1516:	eb c3                	jmp    14db <generic_remap_file_range_prep+0x1bb>
    1518:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
    151c:	48 85 ff             	test   %rdi,%rdi
    151f:	74 ba                	je     14db <generic_remap_file_range_prep+0x1bb>
    1521:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
    1525:	4d 89 eb             	mov    %r13,%r11
    1528:	41 81 e3 ff 0f 00 00 	and    $0xfff,%r11d
    152f:	4c 89 5d 98          	mov    %r11,-0x68(%rbp)
    1533:	48 89 f0             	mov    %rsi,%rax
    1536:	25 ff 0f 00 00       	and    $0xfff,%eax
    153b:	48 89 c1             	mov    %rax,%rcx
    153e:	48 89 45 90          	mov    %rax,-0x70(%rbp)
    1542:	b8 00 10 00 00       	mov    $0x1000,%eax
    1547:	48 89 c2             	mov    %rax,%rdx
    154a:	4c 29 d8             	sub    %r11,%rax
    154d:	48 29 ca             	sub    %rcx,%rdx
    1550:	48 39 c2             	cmp    %rax,%rdx
    1553:	48 0f 46 c2          	cmovbe %rdx,%rax
    1557:	48 39 f8             	cmp    %rdi,%rax
    155a:	48 0f 4f c7          	cmovg  %rdi,%rax
    155e:	48 85 c0             	test   %rax,%rax
    1561:	7e 95                	jle    14f8 <generic_remap_file_range_prep+0x1d8>
    1563:	4c 89 75 80          	mov    %r14,-0x80(%rbp)
    1567:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
    156b:	49 89 c6             	mov    %rax,%r14
    156e:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
    1572:	44 89 7d 8c          	mov    %r15d,-0x74(%rbp)
    1576:	4c 89 6d b8          	mov    %r13,-0x48(%rbp)
    157a:	4c 89 95 78 ff ff ff 	mov    %r10,-0x88(%rbp)
    1581:	48 8b 7b 30          	mov    0x30(%rbx),%rdi
    1585:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
    1589:	e8 52 f9 ff ff       	callq  ee0 <vfs_dedupe_get_page.isra.22>
    158e:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
    1594:	49 89 c4             	mov    %rax,%r12
    1597:	0f 87 d0 02 00 00    	ja     186d <generic_remap_file_range_prep+0x54d>
    159d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    15a1:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    15a5:	48 8b 78 30          	mov    0x30(%rax),%rdi
    15a9:	e8 32 f9 ff ff       	callq  ee0 <vfs_dedupe_get_page.isra.22>
    15ae:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
    15b4:	49 89 c5             	mov    %rax,%r13
    15b7:	0f 87 74 02 00 00    	ja     1831 <generic_remap_file_range_prep+0x511>
    15bd:	48 8b 40 20          	mov    0x20(%rax),%rax
    15c1:	49 39 44 24 20       	cmp    %rax,0x20(%r12)
    15c6:	0f 87 5a 02 00 00    	ja     1826 <generic_remap_file_range_prep+0x506>
    15cc:	4d 89 ef             	mov    %r13,%r15
    15cf:	4c 89 e2             	mov    %r12,%rdx
    15d2:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
    15d6:	e8 00 00 00 00       	callq  15db <generic_remap_file_range_prep+0x2bb>
    15db:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
    15df:	48 8b 72 08          	mov    0x8(%rdx),%rsi
    15e3:	48 8d 46 ff          	lea    -0x1(%rsi),%rax
    15e7:	83 e6 01             	and    $0x1,%esi
    15ea:	48 0f 44 c2          	cmove  %rdx,%rax
    15ee:	f0 48 0f ba 28 00    	lock btsq $0x0,(%rax)
    15f4:	0f 82 7f 02 00 00    	jb     1879 <generic_remap_file_range_prep+0x559>
    15fa:	4c 39 fa             	cmp    %r15,%rdx
    15fd:	74 20                	je     161f <generic_remap_file_range_prep+0x2ff>
    15ff:	e8 00 00 00 00       	callq  1604 <generic_remap_file_range_prep+0x2e4>
    1604:	49 8b 57 08          	mov    0x8(%r15),%rdx
    1608:	48 8d 42 ff          	lea    -0x1(%rdx),%rax
    160c:	83 e2 01             	and    $0x1,%edx
    160f:	49 0f 44 c7          	cmove  %r15,%rax
    1613:	f0 48 0f ba 28 00    	lock btsq $0x0,(%rax)
    1619:	0f 82 bb 02 00 00    	jb     18da <generic_remap_file_range_prep+0x5ba>
    161f:	49 8b 54 24 08       	mov    0x8(%r12),%rdx
    1624:	48 8d 42 ff          	lea    -0x1(%rdx),%rax
    1628:	83 e2 01             	and    $0x1,%edx
    162b:	49 0f 44 c4          	cmove  %r12,%rax
    162f:	48 8b 00             	mov    (%rax),%rax
    1632:	a8 04                	test   $0x4,%al
    1634:	0f 84 75 01 00 00    	je     17af <generic_remap_file_range_prep+0x48f>
    163a:	49 8b 55 08          	mov    0x8(%r13),%rdx
    163e:	48 8d 42 ff          	lea    -0x1(%rdx),%rax
    1642:	83 e2 01             	and    $0x1,%edx
    1645:	49 0f 44 c5          	cmove  %r13,%rax
    1649:	48 8b 00             	mov    (%rax),%rax
    164c:	a8 04                	test   $0x4,%al
    164e:	0f 84 5b 01 00 00    	je     17af <generic_remap_file_range_prep+0x48f>
    1654:	48 8b 43 30          	mov    0x30(%rbx),%rax
    1658:	49 39 44 24 18       	cmp    %rax,0x18(%r12)
    165d:	0f 85 4c 01 00 00    	jne    17af <generic_remap_file_range_prep+0x48f>
    1663:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    1667:	48 8b 40 30          	mov    0x30(%rax),%rax
    166b:	49 39 45 18          	cmp    %rax,0x18(%r13)
    166f:	0f 85 3a 01 00 00    	jne    17af <generic_remap_file_range_prep+0x48f>
    1675:	65 4c 8b 0c 25 00 00 	mov    %gs:0x0,%r9
    167c:	00 00 
    167e:	41 83 81 80 12 00 00 	addl   $0x1,0x1280(%r9)
    1685:	01 
    1686:	4c 89 e7             	mov    %r12,%rdi
    1689:	48 2b 3d 00 00 00 00 	sub    0x0(%rip),%rdi        # 1690 <generic_remap_file_range_prep+0x370>
    1690:	48 c1 ff 06          	sar    $0x6,%rdi
    1694:	48 c1 e7 0c          	shl    $0xc,%rdi
    1698:	48 03 3d 00 00 00 00 	add    0x0(%rip),%rdi        # 169f <generic_remap_file_range_prep+0x37f>
    169f:	41 83 81 80 12 00 00 	addl   $0x1,0x1280(%r9)
    16a6:	01 
    16a7:	4c 89 4d a0          	mov    %r9,-0x60(%rbp)
    16ab:	4c 89 ee             	mov    %r13,%rsi
    16ae:	48 2b 35 00 00 00 00 	sub    0x0(%rip),%rsi        # 16b5 <generic_remap_file_range_prep+0x395>
    16b5:	48 03 7d 98          	add    -0x68(%rbp),%rdi
    16b9:	4c 89 f2             	mov    %r14,%rdx
    16bc:	48 c1 fe 06          	sar    $0x6,%rsi
    16c0:	48 c1 e6 0c          	shl    $0xc,%rsi
    16c4:	48 03 35 00 00 00 00 	add    0x0(%rip),%rsi        # 16cb <generic_remap_file_range_prep+0x3ab>
    16cb:	48 03 75 90          	add    -0x70(%rbp),%rsi
    16cf:	e8 00 00 00 00       	callq  16d4 <generic_remap_file_range_prep+0x3b4>
    16d4:	85 c0                	test   %eax,%eax
    16d6:	41 0f 94 c7          	sete   %r15b
    16da:	4c 8b 4d a0          	mov    -0x60(%rbp),%r9
    16de:	41 83 a9 80 12 00 00 	subl   $0x1,0x1280(%r9)
    16e5:	01 
    16e6:	41 83 a9 80 12 00 00 	subl   $0x1,0x1280(%r9)
    16ed:	01 
    16ee:	4c 89 e7             	mov    %r12,%rdi
    16f1:	e8 00 00 00 00       	callq  16f6 <generic_remap_file_range_prep+0x3d6>
    16f6:	4d 39 ec             	cmp    %r13,%r12
    16f9:	74 08                	je     1703 <generic_remap_file_range_prep+0x3e3>
    16fb:	4c 89 ef             	mov    %r13,%rdi
    16fe:	e8 00 00 00 00       	callq  1703 <generic_remap_file_range_prep+0x3e3>
    1703:	49 8b 45 08          	mov    0x8(%r13),%rax
    1707:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
    170b:	a8 01                	test   $0x1,%al
    170d:	4c 0f 45 ea          	cmovne %rdx,%r13
    1711:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1716:	f0 41 ff 4d 34       	lock decl 0x34(%r13)
    171b:	75 08                	jne    1725 <generic_remap_file_range_prep+0x405>
    171d:	4c 89 ef             	mov    %r13,%rdi
    1720:	e8 00 00 00 00       	callq  1725 <generic_remap_file_range_prep+0x405>
    1725:	49 8b 44 24 08       	mov    0x8(%r12),%rax
    172a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
    172e:	a8 01                	test   $0x1,%al
    1730:	4c 0f 45 e2          	cmovne %rdx,%r12
    1734:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1739:	f0 41 ff 4c 24 34    	lock decl 0x34(%r12)
    173f:	75 08                	jne    1749 <generic_remap_file_range_prep+0x429>
    1741:	4c 89 e7             	mov    %r12,%rdi
    1744:	e8 00 00 00 00       	callq  1749 <generic_remap_file_range_prep+0x429>
    1749:	45 84 ff             	test   %r15b,%r15b
    174c:	0f 84 10 01 00 00    	je     1862 <generic_remap_file_range_prep+0x542>
    1752:	4c 01 75 b8          	add    %r14,-0x48(%rbp)
    1756:	4c 01 75 b0          	add    %r14,-0x50(%rbp)
    175a:	4c 29 75 c0          	sub    %r14,-0x40(%rbp)
    175e:	0f 84 2a 01 00 00    	je     188e <generic_remap_file_range_prep+0x56e>
    1764:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
    1768:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    176c:	41 be 00 10 00 00    	mov    $0x1000,%r14d
    1772:	4c 89 f0             	mov    %r14,%rax
    1775:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
    177b:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
    1781:	48 29 f0             	sub    %rsi,%rax
    1784:	49 29 ce             	sub    %rcx,%r14
    1787:	48 89 75 98          	mov    %rsi,-0x68(%rbp)
    178b:	4c 39 f0             	cmp    %r14,%rax
    178e:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    1792:	4c 0f 46 f0          	cmovbe %rax,%r14
    1796:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    179a:	49 39 c6             	cmp    %rax,%r14
    179d:	4c 0f 4f f0          	cmovg  %rax,%r14
    17a1:	4d 85 f6             	test   %r14,%r14
    17a4:	0f 8f d7 fd ff ff    	jg     1581 <generic_remap_file_range_prep+0x261>
    17aa:	e9 49 fd ff ff       	jmpq   14f8 <generic_remap_file_range_prep+0x1d8>
    17af:	45 31 ff             	xor    %r15d,%r15d
    17b2:	e9 37 ff ff ff       	jmpq   16ee <generic_remap_file_range_prep+0x3ce>
    17b7:	49 8b 04 24          	mov    (%r12),%rax
    17bb:	48 c1 e8 33          	shr    $0x33,%rax
    17bf:	83 e0 07             	and    $0x7,%eax
    17c2:	83 f8 04             	cmp    $0x4,%eax
    17c5:	0f 85 6e ff ff ff    	jne    1739 <generic_remap_file_range_prep+0x419>
    17cb:	49 8b 44 24 08       	mov    0x8(%r12),%rax
    17d0:	8b 80 d0 00 00 00    	mov    0xd0(%rax),%eax
    17d6:	83 e8 01             	sub    $0x1,%eax
    17d9:	83 f8 01             	cmp    $0x1,%eax
    17dc:	0f 87 57 ff ff ff    	ja     1739 <generic_remap_file_range_prep+0x419>
    17e2:	4c 89 e7             	mov    %r12,%rdi
    17e5:	e8 00 00 00 00       	callq  17ea <generic_remap_file_range_prep+0x4ca>
    17ea:	e9 5a ff ff ff       	jmpq   1749 <generic_remap_file_range_prep+0x429>
    17ef:	49 8b 45 00          	mov    0x0(%r13),%rax
    17f3:	48 c1 e8 33          	shr    $0x33,%rax
    17f7:	83 e0 07             	and    $0x7,%eax
    17fa:	83 f8 04             	cmp    $0x4,%eax
    17fd:	0f 85 13 ff ff ff    	jne    1716 <generic_remap_file_range_prep+0x3f6>
    1803:	49 8b 45 08          	mov    0x8(%r13),%rax
    1807:	8b 80 d0 00 00 00    	mov    0xd0(%rax),%eax
    180d:	83 e8 01             	sub    $0x1,%eax
    1810:	83 f8 01             	cmp    $0x1,%eax
    1813:	0f 87 fd fe ff ff    	ja     1716 <generic_remap_file_range_prep+0x3f6>
    1819:	4c 89 ef             	mov    %r13,%rdi
    181c:	e8 00 00 00 00       	callq  1821 <generic_remap_file_range_prep+0x501>
    1821:	e9 ff fe ff ff       	jmpq   1725 <generic_remap_file_range_prep+0x405>
    1826:	4d 89 e7             	mov    %r12,%r15
    1829:	4c 89 ea             	mov    %r13,%rdx
    182c:	e9 a1 fd ff ff       	jmpq   15d2 <generic_remap_file_range_prep+0x2b2>
    1831:	49 8b 44 24 08       	mov    0x8(%r12),%rax
    1836:	4c 89 e1             	mov    %r12,%rcx
    1839:	45 89 ef             	mov    %r13d,%r15d
    183c:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
    1840:	a8 01                	test   $0x1,%al
    1842:	48 0f 45 ca          	cmovne %rdx,%rcx
    1846:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    184b:	f0 ff 49 34          	lock decl 0x34(%rcx)
    184f:	75 08                	jne    1859 <generic_remap_file_range_prep+0x539>
    1851:	48 89 cf             	mov    %rcx,%rdi
    1854:	e8 00 00 00 00       	callq  1859 <generic_remap_file_range_prep+0x539>
    1859:	45 85 ff             	test   %r15d,%r15d
    185c:	0f 85 79 fc ff ff    	jne    14db <generic_remap_file_range_prep+0x1bb>
    1862:	41 bf cc ff ff ff    	mov    $0xffffffcc,%r15d
    1868:	e9 6e fc ff ff       	jmpq   14db <generic_remap_file_range_prep+0x1bb>
    186d:	85 c0                	test   %eax,%eax
    186f:	41 89 c7             	mov    %eax,%r15d
    1872:	74 ee                	je     1862 <generic_remap_file_range_prep+0x542>
    1874:	e9 62 fc ff ff       	jmpq   14db <generic_remap_file_range_prep+0x1bb>
    1879:	48 89 d7             	mov    %rdx,%rdi
    187c:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
    1880:	e8 00 00 00 00       	callq  1885 <generic_remap_file_range_prep+0x565>
    1885:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
    1889:	e9 6c fd ff ff       	jmpq   15fa <generic_remap_file_range_prep+0x2da>
    188e:	0f b6 8b 8e 00 00 00 	movzbl 0x8e(%rbx),%ecx
    1895:	4c 8b 95 78 ff ff ff 	mov    -0x88(%rbp),%r10
    189c:	b8 01 00 00 00       	mov    $0x1,%eax
    18a1:	4c 8b 65 a8          	mov    -0x58(%rbp),%r12
    18a5:	44 8b 7d 8c          	mov    -0x74(%rbp),%r15d
    18a9:	4c 8b 75 80          	mov    -0x80(%rbp),%r14
    18ad:	d3 e0                	shl    %cl,%eax
    18af:	8d 50 ff             	lea    -0x1(%rax),%edx
    18b2:	49 8b 02             	mov    (%r10),%rax
    18b5:	48 85 d0             	test   %rdx,%rax
    18b8:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    18bc:	0f 84 19 fc ff ff    	je     14db <generic_remap_file_range_prep+0x1bb>
    18c2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    18c6:	48 03 45 c0          	add    -0x40(%rbp),%rax
    18ca:	49 39 44 24 50       	cmp    %rax,0x50(%r12)
    18cf:	0f 8f d7 fb ff ff    	jg     14ac <generic_remap_file_range_prep+0x18c>
    18d5:	e9 01 fc ff ff       	jmpq   14db <generic_remap_file_range_prep+0x1bb>
    18da:	4c 89 ff             	mov    %r15,%rdi
    18dd:	e8 00 00 00 00       	callq  18e2 <generic_remap_file_range_prep+0x5c2>
    18e2:	e9 38 fd ff ff       	jmpq   161f <generic_remap_file_range_prep+0x2ff>
    18e7:	48 8b 01             	mov    (%rcx),%rax
    18ea:	48 c1 e8 33          	shr    $0x33,%rax
    18ee:	83 e0 07             	and    $0x7,%eax
    18f1:	83 f8 04             	cmp    $0x4,%eax
    18f4:	0f 85 51 ff ff ff    	jne    184b <generic_remap_file_range_prep+0x52b>
    18fa:	48 8b 41 08          	mov    0x8(%rcx),%rax
    18fe:	8b 80 d0 00 00 00    	mov    0xd0(%rax),%eax
    1904:	83 e8 01             	sub    $0x1,%eax
    1907:	83 f8 01             	cmp    $0x1,%eax
    190a:	0f 87 3b ff ff ff    	ja     184b <generic_remap_file_range_prep+0x52b>
    1910:	48 89 cf             	mov    %rcx,%rdi
    1913:	e8 00 00 00 00       	callq  1918 <generic_remap_file_range_prep+0x5f8>
    1918:	45 85 ed             	test   %r13d,%r13d
    191b:	0f 84 41 ff ff ff    	je     1862 <generic_remap_file_range_prep+0x542>
    1921:	e9 b5 fb ff ff       	jmpq   14db <generic_remap_file_range_prep+0x1bb>
    1926:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    192d:	00 00 00 

0000000000001930 <ksys_lseek>:
    1930:	e8 00 00 00 00       	callq  1935 <ksys_lseek+0x5>
    1935:	55                   	push   %rbp
    1936:	48 89 e5             	mov    %rsp,%rbp
    1939:	41 57                	push   %r15
    193b:	41 56                	push   %r14
    193d:	41 55                	push   %r13
    193f:	41 54                	push   %r12
    1941:	49 89 f7             	mov    %rsi,%r15
    1944:	53                   	push   %rbx
    1945:	41 89 d6             	mov    %edx,%r14d
    1948:	e8 00 00 00 00       	callq  194d <ksys_lseek+0x1d>
    194d:	49 89 c4             	mov    %rax,%r12
    1950:	49 83 e4 fc          	and    $0xfffffffffffffffc,%r12
    1954:	74 76                	je     19cc <ksys_lseek+0x9c>
    1956:	41 83 fe 04          	cmp    $0x4,%r14d
    195a:	48 89 c3             	mov    %rax,%rbx
    195d:	49 c7 c5 ea ff ff ff 	mov    $0xffffffffffffffea,%r13
    1964:	76 20                	jbe    1986 <ksys_lseek+0x56>
    1966:	f6 c3 02             	test   $0x2,%bl
    1969:	75 57                	jne    19c2 <ksys_lseek+0x92>
    196b:	83 e3 01             	and    $0x1,%ebx
    196e:	74 08                	je     1978 <ksys_lseek+0x48>
    1970:	4c 89 e7             	mov    %r12,%rdi
    1973:	e8 00 00 00 00       	callq  1978 <ksys_lseek+0x48>
    1978:	5b                   	pop    %rbx
    1979:	4c 89 e8             	mov    %r13,%rax
    197c:	41 5c                	pop    %r12
    197e:	41 5d                	pop    %r13
    1980:	41 5e                	pop    %r14
    1982:	41 5f                	pop    %r15
    1984:	5d                   	pop    %rbp
    1985:	c3                   	retq   
    1986:	41 f6 44 24 44 04    	testb  $0x4,0x44(%r12)
    198c:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
    1993:	74 17                	je     19ac <ksys_lseek+0x7c>
    1995:	49 8b 44 24 28       	mov    0x28(%r12),%rax
    199a:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
    19a1:	48 8b 40 08          	mov    0x8(%rax),%rax
    19a5:	48 85 c0             	test   %rax,%rax
    19a8:	48 0f 44 c2          	cmove  %rdx,%rax
    19ac:	44 89 f2             	mov    %r14d,%edx
    19af:	4c 89 fe             	mov    %r15,%rsi
    19b2:	4c 89 e7             	mov    %r12,%rdi
    19b5:	e8 00 00 00 00       	callq  19ba <ksys_lseek+0x8a>
    19ba:	f6 c3 02             	test   $0x2,%bl
    19bd:	49 89 c5             	mov    %rax,%r13
    19c0:	74 a9                	je     196b <ksys_lseek+0x3b>
    19c2:	4c 89 e7             	mov    %r12,%rdi
    19c5:	e8 00 00 00 00       	callq  19ca <ksys_lseek+0x9a>
    19ca:	eb 9f                	jmp    196b <ksys_lseek+0x3b>
    19cc:	49 c7 c5 f7 ff ff ff 	mov    $0xfffffffffffffff7,%r13
    19d3:	eb a3                	jmp    1978 <ksys_lseek+0x48>
    19d5:	90                   	nop
    19d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    19dd:	00 00 00 

00000000000019e0 <__x64_sys_lseek>:
    19e0:	e8 00 00 00 00       	callq  19e5 <__x64_sys_lseek+0x5>
    19e5:	55                   	push   %rbp
    19e6:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    19ea:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    19ee:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    19f2:	48 89 e5             	mov    %rsp,%rbp
    19f5:	e8 00 00 00 00       	callq  19fa <__x64_sys_lseek+0x1a>
    19fa:	5d                   	pop    %rbp
    19fb:	c3                   	retq   
    19fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001a00 <__ia32_sys_lseek>:
    1a00:	e8 00 00 00 00       	callq  1a05 <__ia32_sys_lseek+0x5>
    1a05:	55                   	push   %rbp
    1a06:	8b 77 58             	mov    0x58(%rdi),%esi
    1a09:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    1a0d:	48 8b 7f 28          	mov    0x28(%rdi),%rdi
    1a11:	48 89 e5             	mov    %rsp,%rbp
    1a14:	e8 00 00 00 00       	callq  1a19 <__ia32_sys_lseek+0x19>
    1a19:	5d                   	pop    %rbp
    1a1a:	c3                   	retq   
    1a1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001a20 <__ia32_compat_sys_lseek>:
    1a20:	e8 00 00 00 00       	callq  1a25 <__ia32_compat_sys_lseek+0x5>
    1a25:	55                   	push   %rbp
    1a26:	48 63 77 58          	movslq 0x58(%rdi),%rsi
    1a2a:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    1a2e:	48 8b 7f 28          	mov    0x28(%rdi),%rdi
    1a32:	48 89 e5             	mov    %rsp,%rbp
    1a35:	e8 00 00 00 00       	callq  1a3a <__ia32_compat_sys_lseek+0x1a>
    1a3a:	5d                   	pop    %rbp
    1a3b:	c3                   	retq   
    1a3c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001a40 <__x32_compat_sys_lseek>:
    1a40:	e8 00 00 00 00       	callq  1a45 <__x32_compat_sys_lseek+0x5>
    1a45:	55                   	push   %rbp
    1a46:	48 63 77 68          	movslq 0x68(%rdi),%rsi
    1a4a:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    1a4e:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    1a52:	48 89 e5             	mov    %rsp,%rbp
    1a55:	e8 00 00 00 00       	callq  1a5a <__x32_compat_sys_lseek+0x1a>
    1a5a:	5d                   	pop    %rbp
    1a5b:	c3                   	retq   
    1a5c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001a60 <rw_verify_area>:
    1a60:	e8 00 00 00 00       	callq  1a65 <rw_verify_area+0x5>
    1a65:	48 85 c9             	test   %rcx,%rcx
    1a68:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    1a6d:	78 49                	js     1ab8 <rw_verify_area+0x58>
    1a6f:	55                   	push   %rbp
    1a70:	48 85 d2             	test   %rdx,%rdx
    1a73:	48 89 e5             	mov    %rsp,%rbp
    1a76:	41 54                	push   %r12
    1a78:	53                   	push   %rbx
    1a79:	41 89 fc             	mov    %edi,%r12d
    1a7c:	48 89 f3             	mov    %rsi,%rbx
    1a7f:	74 1e                	je     1a9f <rw_verify_area+0x3f>
    1a81:	48 8b 12             	mov    (%rdx),%rdx
    1a84:	48 85 d2             	test   %rdx,%rdx
    1a87:	78 31                	js     1aba <rw_verify_area+0x5a>
    1a89:	48 89 d7             	mov    %rdx,%rdi
    1a8c:	48 01 cf             	add    %rcx,%rdi
    1a8f:	78 75                	js     1b06 <rw_verify_area+0xa6>
    1a91:	48 8b 7b 20          	mov    0x20(%rbx),%rdi
    1a95:	48 83 bf 70 01 00 00 	cmpq   $0x0,0x170(%rdi)
    1a9c:	00 
    1a9d:	75 33                	jne    1ad2 <rw_verify_area+0x72>
    1a9f:	41 83 fc 01          	cmp    $0x1,%r12d
    1aa3:	48 89 df             	mov    %rbx,%rdi
    1aa6:	19 f6                	sbb    %esi,%esi
    1aa8:	83 e6 02             	and    $0x2,%esi
    1aab:	83 c6 02             	add    $0x2,%esi
    1aae:	e8 00 00 00 00       	callq  1ab3 <rw_verify_area+0x53>
    1ab3:	5b                   	pop    %rbx
    1ab4:	41 5c                	pop    %r12
    1ab6:	5d                   	pop    %rbp
    1ab7:	c3                   	retq   
    1ab8:	f3 c3                	repz retq 
    1aba:	f6 46 45 20          	testb  $0x20,0x45(%rsi)
    1abe:	74 f3                	je     1ab3 <rw_verify_area+0x53>
    1ac0:	48 89 d0             	mov    %rdx,%rax
    1ac3:	48 f7 d8             	neg    %rax
    1ac6:	48 39 c8             	cmp    %rcx,%rax
    1ac9:	77 c6                	ja     1a91 <rw_verify_area+0x31>
    1acb:	b8 b5 ff ff ff       	mov    $0xffffffb5,%eax
    1ad0:	eb e1                	jmp    1ab3 <rw_verify_area+0x53>
    1ad2:	48 8b 47 28          	mov    0x28(%rdi),%rax
    1ad6:	f6 40 50 40          	testb  $0x40,0x50(%rax)
    1ada:	74 c3                	je     1a9f <rw_verify_area+0x3f>
    1adc:	0f b7 07             	movzwl (%rdi),%eax
    1adf:	66 25 08 04          	and    $0x408,%ax
    1ae3:	66 3d 00 04          	cmp    $0x400,%ax
    1ae7:	75 b6                	jne    1a9f <rw_verify_area+0x3f>
    1ae9:	45 31 c0             	xor    %r8d,%r8d
    1aec:	48 8d 4c 0a ff       	lea    -0x1(%rdx,%rcx,1),%rcx
    1af1:	45 85 e4             	test   %r12d,%r12d
    1af4:	41 0f 95 c0          	setne  %r8b
    1af8:	48 89 de             	mov    %rbx,%rsi
    1afb:	e8 00 00 00 00       	callq  1b00 <rw_verify_area+0xa0>
    1b00:	85 c0                	test   %eax,%eax
    1b02:	79 9b                	jns    1a9f <rw_verify_area+0x3f>
    1b04:	eb ad                	jmp    1ab3 <rw_verify_area+0x53>
    1b06:	f6 46 45 20          	testb  $0x20,0x45(%rsi)
    1b0a:	75 85                	jne    1a91 <rw_verify_area+0x31>
    1b0c:	eb a5                	jmp    1ab3 <rw_verify_area+0x53>
    1b0e:	66 90                	xchg   %ax,%ax

0000000000001b10 <vfs_iocb_iter_read>:
    1b10:	e8 00 00 00 00       	callq  1b15 <vfs_iocb_iter_read+0x5>
    1b15:	55                   	push   %rbp
    1b16:	48 89 e5             	mov    %rsp,%rbp
    1b19:	41 57                	push   %r15
    1b1b:	41 56                	push   %r14
    1b1d:	41 55                	push   %r13
    1b1f:	41 54                	push   %r12
    1b21:	53                   	push   %rbx
    1b22:	48 8b 47 28          	mov    0x28(%rdi),%rax
    1b26:	48 83 78 20 00       	cmpq   $0x0,0x20(%rax)
    1b2b:	0f 84 d7 00 00 00    	je     1c08 <vfs_iocb_iter_read+0xf8>
    1b31:	44 8b 47 44          	mov    0x44(%rdi),%r8d
    1b35:	41 f6 c0 01          	test   $0x1,%r8b
    1b39:	0f 84 d2 00 00 00    	je     1c11 <vfs_iocb_iter_read+0x101>
    1b3f:	41 f7 c0 00 00 02 00 	test   $0x20000,%r8d
    1b46:	0f 84 bc 00 00 00    	je     1c08 <vfs_iocb_iter_read+0xf8>
    1b4c:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    1b50:	48 89 d3             	mov    %rdx,%rbx
    1b53:	49 89 f6             	mov    %rsi,%r14
    1b56:	49 89 fc             	mov    %rdi,%r12
    1b59:	48 85 c9             	test   %rcx,%rcx
    1b5c:	0f 84 a1 00 00 00    	je     1c03 <vfs_iocb_iter_read+0xf3>
    1b62:	48 8d 56 08          	lea    0x8(%rsi),%rdx
    1b66:	48 89 fe             	mov    %rdi,%rsi
    1b69:	31 ff                	xor    %edi,%edi
    1b6b:	e8 00 00 00 00       	callq  1b70 <vfs_iocb_iter_read+0x60>
    1b70:	4c 63 e8             	movslq %eax,%r13
    1b73:	4d 85 ed             	test   %r13,%r13
    1b76:	78 7d                	js     1bf5 <vfs_iocb_iter_read+0xe5>
    1b78:	49 8b 44 24 28       	mov    0x28(%r12),%rax
    1b7d:	48 89 de             	mov    %rbx,%rsi
    1b80:	4c 89 f7             	mov    %r14,%rdi
    1b83:	48 8b 40 20          	mov    0x20(%rax),%rax
    1b87:	e8 00 00 00 00       	callq  1b8c <vfs_iocb_iter_read+0x7c>
    1b8c:	48 85 c0             	test   %rax,%rax
    1b8f:	49 89 c5             	mov    %rax,%r13
    1b92:	78 61                	js     1bf5 <vfs_iocb_iter_read+0xe5>
    1b94:	45 8b 44 24 44       	mov    0x44(%r12),%r8d
    1b99:	41 81 e0 00 00 00 04 	and    $0x4000000,%r8d
    1ba0:	75 53                	jne    1bf5 <vfs_iocb_iter_read+0xe5>
    1ba2:	4d 8b 74 24 20       	mov    0x20(%r12),%r14
    1ba7:	bb 01 00 00 40       	mov    $0x40000001,%ebx
    1bac:	4d 8d 7c 24 10       	lea    0x10(%r12),%r15
    1bb1:	49 8b 7c 24 18       	mov    0x18(%r12),%rdi
    1bb6:	b9 01 00 00 00       	mov    $0x1,%ecx
    1bbb:	4c 89 fa             	mov    %r15,%rdx
    1bbe:	41 0f b7 06          	movzwl (%r14),%eax
    1bc2:	66 25 00 f0          	and    $0xf000,%ax
    1bc6:	66 3d 00 40          	cmp    $0x4000,%ax
    1bca:	b8 01 00 00 00       	mov    $0x1,%eax
    1bcf:	0f 45 d8             	cmovne %eax,%ebx
    1bd2:	89 de                	mov    %ebx,%esi
    1bd4:	e8 00 00 00 00       	callq  1bd9 <vfs_iocb_iter_read+0xc9>
    1bd9:	85 c0                	test   %eax,%eax
    1bdb:	75 18                	jne    1bf5 <vfs_iocb_iter_read+0xe5>
    1bdd:	45 31 c9             	xor    %r9d,%r9d
    1be0:	45 31 c0             	xor    %r8d,%r8d
    1be3:	b9 01 00 00 00       	mov    $0x1,%ecx
    1be8:	4c 89 fa             	mov    %r15,%rdx
    1beb:	89 de                	mov    %ebx,%esi
    1bed:	4c 89 f7             	mov    %r14,%rdi
    1bf0:	e8 00 00 00 00       	callq  1bf5 <vfs_iocb_iter_read+0xe5>
    1bf5:	5b                   	pop    %rbx
    1bf6:	4c 89 e8             	mov    %r13,%rax
    1bf9:	41 5c                	pop    %r12
    1bfb:	41 5d                	pop    %r13
    1bfd:	41 5e                	pop    %r14
    1bff:	41 5f                	pop    %r15
    1c01:	5d                   	pop    %rbp
    1c02:	c3                   	retq   
    1c03:	45 31 ed             	xor    %r13d,%r13d
    1c06:	eb 91                	jmp    1b99 <vfs_iocb_iter_read+0x89>
    1c08:	49 c7 c5 ea ff ff ff 	mov    $0xffffffffffffffea,%r13
    1c0f:	eb e4                	jmp    1bf5 <vfs_iocb_iter_read+0xe5>
    1c11:	49 c7 c5 f7 ff ff ff 	mov    $0xfffffffffffffff7,%r13
    1c18:	eb db                	jmp    1bf5 <vfs_iocb_iter_read+0xe5>
    1c1a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001c20 <do_iter_read>:
    1c20:	e8 00 00 00 00       	callq  1c25 <do_iter_read+0x5>
    1c25:	55                   	push   %rbp
    1c26:	48 89 e5             	mov    %rsp,%rbp
    1c29:	41 57                	push   %r15
    1c2b:	41 56                	push   %r14
    1c2d:	41 55                	push   %r13
    1c2f:	41 54                	push   %r12
    1c31:	53                   	push   %rbx
    1c32:	8b 47 44             	mov    0x44(%rdi),%eax
    1c35:	a8 01                	test   $0x1,%al
    1c37:	0f 84 45 01 00 00    	je     1d82 <do_iter_read+0x162>
    1c3d:	a9 00 00 02 00       	test   $0x20000,%eax
    1c42:	0f 84 46 01 00 00    	je     1d8e <do_iter_read+0x16e>
    1c48:	41 89 cf             	mov    %ecx,%r15d
    1c4b:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
    1c4f:	49 89 d6             	mov    %rdx,%r14
    1c52:	49 89 f4             	mov    %rsi,%r12
    1c55:	48 89 fb             	mov    %rdi,%rbx
    1c58:	48 85 c9             	test   %rcx,%rcx
    1c5b:	75 6c                	jne    1cc9 <do_iter_read+0xa9>
    1c5d:	45 31 ed             	xor    %r13d,%r13d
    1c60:	a9 00 00 00 04       	test   $0x4000000,%eax
    1c65:	75 54                	jne    1cbb <do_iter_read+0x9b>
    1c67:	4c 8b 73 20          	mov    0x20(%rbx),%r14
    1c6b:	41 bc 01 00 00 40    	mov    $0x40000001,%r12d
    1c71:	4c 8d 7b 10          	lea    0x10(%rbx),%r15
    1c75:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
    1c79:	b9 01 00 00 00       	mov    $0x1,%ecx
    1c7e:	4c 89 fa             	mov    %r15,%rdx
    1c81:	41 0f b7 06          	movzwl (%r14),%eax
    1c85:	66 25 00 f0          	and    $0xf000,%ax
    1c89:	66 3d 00 40          	cmp    $0x4000,%ax
    1c8d:	b8 01 00 00 00       	mov    $0x1,%eax
    1c92:	44 0f 45 e0          	cmovne %eax,%r12d
    1c96:	44 89 e6             	mov    %r12d,%esi
    1c99:	e8 00 00 00 00       	callq  1c9e <do_iter_read+0x7e>
    1c9e:	85 c0                	test   %eax,%eax
    1ca0:	75 19                	jne    1cbb <do_iter_read+0x9b>
    1ca2:	45 31 c9             	xor    %r9d,%r9d
    1ca5:	45 31 c0             	xor    %r8d,%r8d
    1ca8:	b9 01 00 00 00       	mov    $0x1,%ecx
    1cad:	4c 89 fa             	mov    %r15,%rdx
    1cb0:	44 89 e6             	mov    %r12d,%esi
    1cb3:	4c 89 f7             	mov    %r14,%rdi
    1cb6:	e8 00 00 00 00       	callq  1cbb <do_iter_read+0x9b>
    1cbb:	5b                   	pop    %rbx
    1cbc:	4c 89 e8             	mov    %r13,%rax
    1cbf:	41 5c                	pop    %r12
    1cc1:	41 5d                	pop    %r13
    1cc3:	41 5e                	pop    %r14
    1cc5:	41 5f                	pop    %r15
    1cc7:	5d                   	pop    %rbp
    1cc8:	c3                   	retq   
    1cc9:	48 89 fe             	mov    %rdi,%rsi
    1ccc:	31 ff                	xor    %edi,%edi
    1cce:	e8 00 00 00 00       	callq  1cd3 <do_iter_read+0xb3>
    1cd3:	4c 63 e8             	movslq %eax,%r13
    1cd6:	4d 85 ed             	test   %r13,%r13
    1cd9:	78 e0                	js     1cbb <do_iter_read+0x9b>
    1cdb:	48 8b 53 28          	mov    0x28(%rbx),%rdx
    1cdf:	48 83 7a 20 00       	cmpq   $0x0,0x20(%rdx)
    1ce4:	74 23                	je     1d09 <do_iter_read+0xe9>
    1ce6:	45 89 f8             	mov    %r15d,%r8d
    1ce9:	31 c9                	xor    %ecx,%ecx
    1ceb:	4c 89 f2             	mov    %r14,%rdx
    1cee:	4c 89 e6             	mov    %r12,%rsi
    1cf1:	48 89 df             	mov    %rbx,%rdi
    1cf4:	e8 37 e6 ff ff       	callq  330 <do_iter_readv_writev>
    1cf9:	49 89 c5             	mov    %rax,%r13
    1cfc:	4d 85 ed             	test   %r13,%r13
    1cff:	78 ba                	js     1cbb <do_iter_read+0x9b>
    1d01:	8b 43 44             	mov    0x44(%rbx),%eax
    1d04:	e9 57 ff ff ff       	jmpq   1c60 <do_iter_read+0x40>
    1d09:	41 83 e7 fe          	and    $0xfffffffe,%r15d
    1d0d:	0f 85 87 00 00 00    	jne    1d9a <do_iter_read+0x17a>
    1d13:	49 8b 4c 24 10       	mov    0x10(%r12),%rcx
    1d18:	45 31 ed             	xor    %r13d,%r13d
    1d1b:	48 85 c9             	test   %rcx,%rcx
    1d1e:	75 23                	jne    1d43 <do_iter_read+0x123>
    1d20:	eb df                	jmp    1d01 <do_iter_read+0xe1>
    1d22:	49 01 c5             	add    %rax,%r13
    1d25:	49 39 c7             	cmp    %rax,%r15
    1d28:	75 d2                	jne    1cfc <do_iter_read+0xdc>
    1d2a:	4c 89 fe             	mov    %r15,%rsi
    1d2d:	4c 89 e7             	mov    %r12,%rdi
    1d30:	e8 00 00 00 00       	callq  1d35 <do_iter_read+0x115>
    1d35:	49 8b 4c 24 10       	mov    0x10(%r12),%rcx
    1d3a:	48 85 c9             	test   %rcx,%rcx
    1d3d:	74 bd                	je     1cfc <do_iter_read+0xdc>
    1d3f:	48 8b 53 28          	mov    0x28(%rbx),%rdx
    1d43:	49 8b 44 24 18       	mov    0x18(%r12),%rax
    1d48:	49 8b 74 24 08       	mov    0x8(%r12),%rsi
    1d4d:	48 89 df             	mov    %rbx,%rdi
    1d50:	4c 8b 78 08          	mov    0x8(%rax),%r15
    1d54:	49 29 f7             	sub    %rsi,%r15
    1d57:	49 39 cf             	cmp    %rcx,%r15
    1d5a:	4c 0f 47 f9          	cmova  %rcx,%r15
    1d5e:	48 03 30             	add    (%rax),%rsi
    1d61:	4c 89 f1             	mov    %r14,%rcx
    1d64:	48 8b 42 10          	mov    0x10(%rdx),%rax
    1d68:	4c 89 fa             	mov    %r15,%rdx
    1d6b:	e8 00 00 00 00       	callq  1d70 <do_iter_read+0x150>
    1d70:	48 85 c0             	test   %rax,%rax
    1d73:	79 ad                	jns    1d22 <do_iter_read+0x102>
    1d75:	4d 85 ed             	test   %r13,%r13
    1d78:	75 82                	jne    1cfc <do_iter_read+0xdc>
    1d7a:	49 89 c5             	mov    %rax,%r13
    1d7d:	e9 39 ff ff ff       	jmpq   1cbb <do_iter_read+0x9b>
    1d82:	49 c7 c5 f7 ff ff ff 	mov    $0xfffffffffffffff7,%r13
    1d89:	e9 2d ff ff ff       	jmpq   1cbb <do_iter_read+0x9b>
    1d8e:	49 c7 c5 ea ff ff ff 	mov    $0xffffffffffffffea,%r13
    1d95:	e9 21 ff ff ff       	jmpq   1cbb <do_iter_read+0x9b>
    1d9a:	49 c7 c5 a1 ff ff ff 	mov    $0xffffffffffffffa1,%r13
    1da1:	e9 15 ff ff ff       	jmpq   1cbb <do_iter_read+0x9b>
    1da6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1dad:	00 00 00 

0000000000001db0 <vfs_iter_read>:
    1db0:	e8 00 00 00 00       	callq  1db5 <vfs_iter_read+0x5>
    1db5:	48 8b 47 28          	mov    0x28(%rdi),%rax
    1db9:	48 83 78 20 00       	cmpq   $0x0,0x20(%rax)
    1dbe:	74 0b                	je     1dcb <vfs_iter_read+0x1b>
    1dc0:	55                   	push   %rbp
    1dc1:	48 89 e5             	mov    %rsp,%rbp
    1dc4:	e8 57 fe ff ff       	callq  1c20 <do_iter_read>
    1dc9:	5d                   	pop    %rbp
    1dca:	c3                   	retq   
    1dcb:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
    1dd2:	c3                   	retq   
    1dd3:	0f 1f 00             	nopl   (%rax)
    1dd6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1ddd:	00 00 00 

0000000000001de0 <compat_readv>:
    1de0:	e8 00 00 00 00       	callq  1de5 <compat_readv+0x5>
    1de5:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
    1dea:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1dee:	41 ff 72 f8          	pushq  -0x8(%r10)
    1df2:	55                   	push   %rbp
    1df3:	48 89 e5             	mov    %rsp,%rbp
    1df6:	41 55                	push   %r13
    1df8:	41 54                	push   %r12
    1dfa:	41 52                	push   %r10
    1dfc:	53                   	push   %rbx
    1dfd:	45 89 c5             	mov    %r8d,%r13d
    1e00:	4c 8d 8d 28 ff ff ff 	lea    -0xd8(%rbp),%r9
    1e07:	4c 8d 85 20 ff ff ff 	lea    -0xe0(%rbp),%r8
    1e0e:	48 89 fb             	mov    %rdi,%rbx
    1e11:	48 81 ec c0 00 00 00 	sub    $0xc0,%rsp
    1e18:	31 ff                	xor    %edi,%edi
    1e1a:	49 89 cc             	mov    %rcx,%r12
    1e1d:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    1e24:	00 00 
    1e26:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    1e2a:	31 c0                	xor    %eax,%eax
    1e2c:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
    1e33:	b9 08 00 00 00       	mov    $0x8,%ecx
    1e38:	48 89 85 20 ff ff ff 	mov    %rax,-0xe0(%rbp)
    1e3f:	e8 00 00 00 00       	callq  1e44 <compat_readv+0x64>
    1e44:	48 85 c0             	test   %rax,%rax
    1e47:	79 34                	jns    1e7d <compat_readv+0x9d>
    1e49:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    1e50:	00 00 
    1e52:	48 83 82 b0 0b 00 00 	addq   $0x1,0xbb0(%rdx)
    1e59:	01 
    1e5a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    1e5e:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
    1e65:	00 00 
    1e67:	75 52                	jne    1ebb <compat_readv+0xdb>
    1e69:	48 81 c4 c0 00 00 00 	add    $0xc0,%rsp
    1e70:	5b                   	pop    %rbx
    1e71:	41 5a                	pop    %r10
    1e73:	41 5c                	pop    %r12
    1e75:	41 5d                	pop    %r13
    1e77:	5d                   	pop    %rbp
    1e78:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
    1e7c:	c3                   	retq   
    1e7d:	48 8d b5 28 ff ff ff 	lea    -0xd8(%rbp),%rsi
    1e84:	48 89 df             	mov    %rbx,%rdi
    1e87:	44 89 e9             	mov    %r13d,%ecx
    1e8a:	4c 89 e2             	mov    %r12,%rdx
    1e8d:	e8 8e fd ff ff       	callq  1c20 <do_iter_read>
    1e92:	48 8b bd 20 ff ff ff 	mov    -0xe0(%rbp),%rdi
    1e99:	48 89 c3             	mov    %rax,%rbx
    1e9c:	e8 00 00 00 00       	callq  1ea1 <compat_readv+0xc1>
    1ea1:	48 85 db             	test   %rbx,%rbx
    1ea4:	7e 1a                	jle    1ec0 <compat_readv+0xe0>
    1ea6:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    1ead:	00 00 
    1eaf:	48 89 d8             	mov    %rbx,%rax
    1eb2:	48 01 9a a0 0b 00 00 	add    %rbx,0xba0(%rdx)
    1eb9:	eb 8e                	jmp    1e49 <compat_readv+0x69>
    1ebb:	e8 00 00 00 00       	callq  1ec0 <compat_readv+0xe0>
    1ec0:	48 89 d8             	mov    %rbx,%rax
    1ec3:	eb 84                	jmp    1e49 <compat_readv+0x69>
    1ec5:	90                   	nop
    1ec6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1ecd:	00 00 00 

0000000000001ed0 <do_compat_readv>:
    1ed0:	e8 00 00 00 00       	callq  1ed5 <do_compat_readv+0x5>
    1ed5:	55                   	push   %rbp
    1ed6:	48 89 e5             	mov    %rsp,%rbp
    1ed9:	41 57                	push   %r15
    1edb:	41 56                	push   %r14
    1edd:	41 55                	push   %r13
    1edf:	41 54                	push   %r12
    1ee1:	49 89 f6             	mov    %rsi,%r14
    1ee4:	53                   	push   %rbx
    1ee5:	41 89 d5             	mov    %edx,%r13d
    1ee8:	41 89 cf             	mov    %ecx,%r15d
    1eeb:	48 83 ec 18          	sub    $0x18,%rsp
    1eef:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    1ef6:	00 00 
    1ef8:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1efc:	31 c0                	xor    %eax,%eax
    1efe:	e8 00 00 00 00       	callq  1f03 <do_compat_readv+0x33>
    1f03:	48 89 c3             	mov    %rax,%rbx
    1f06:	48 c7 c0 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rax
    1f0d:	49 89 dc             	mov    %rbx,%r12
    1f10:	49 83 e4 fc          	and    $0xfffffffffffffffc,%r12
    1f14:	74 36                	je     1f4c <do_compat_readv+0x7c>
    1f16:	49 8b 44 24 68       	mov    0x68(%r12),%rax
    1f1b:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
    1f1f:	44 89 ea             	mov    %r13d,%edx
    1f22:	45 89 f8             	mov    %r15d,%r8d
    1f25:	4c 89 f6             	mov    %r14,%rsi
    1f28:	4c 89 e7             	mov    %r12,%rdi
    1f2b:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    1f2f:	e8 ac fe ff ff       	callq  1de0 <compat_readv>
    1f34:	48 85 c0             	test   %rax,%rax
    1f37:	78 09                	js     1f42 <do_compat_readv+0x72>
    1f39:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    1f3d:	49 89 54 24 68       	mov    %rdx,0x68(%r12)
    1f42:	f6 c3 02             	test   $0x2,%bl
    1f45:	75 35                	jne    1f7c <do_compat_readv+0xac>
    1f47:	83 e3 01             	and    $0x1,%ebx
    1f4a:	75 1e                	jne    1f6a <do_compat_readv+0x9a>
    1f4c:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    1f50:	65 48 33 34 25 28 00 	xor    %gs:0x28,%rsi
    1f57:	00 00 
    1f59:	75 38                	jne    1f93 <do_compat_readv+0xc3>
    1f5b:	48 83 c4 18          	add    $0x18,%rsp
    1f5f:	5b                   	pop    %rbx
    1f60:	41 5c                	pop    %r12
    1f62:	41 5d                	pop    %r13
    1f64:	41 5e                	pop    %r14
    1f66:	41 5f                	pop    %r15
    1f68:	5d                   	pop    %rbp
    1f69:	c3                   	retq   
    1f6a:	4c 89 e7             	mov    %r12,%rdi
    1f6d:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    1f71:	e8 00 00 00 00       	callq  1f76 <do_compat_readv+0xa6>
    1f76:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1f7a:	eb d0                	jmp    1f4c <do_compat_readv+0x7c>
    1f7c:	4c 89 e7             	mov    %r12,%rdi
    1f7f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    1f83:	e8 00 00 00 00       	callq  1f88 <do_compat_readv+0xb8>
    1f88:	83 e3 01             	and    $0x1,%ebx
    1f8b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1f8f:	74 bb                	je     1f4c <do_compat_readv+0x7c>
    1f91:	eb d7                	jmp    1f6a <do_compat_readv+0x9a>
    1f93:	e8 00 00 00 00       	callq  1f98 <do_compat_readv+0xc8>
    1f98:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1f9f:	00 

0000000000001fa0 <__ia32_compat_sys_readv>:
    1fa0:	e8 00 00 00 00       	callq  1fa5 <__ia32_compat_sys_readv+0x5>
    1fa5:	55                   	push   %rbp
    1fa6:	8b 77 58             	mov    0x58(%rdi),%esi
    1fa9:	31 c9                	xor    %ecx,%ecx
    1fab:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    1faf:	48 8b 7f 28          	mov    0x28(%rdi),%rdi
    1fb3:	48 89 e5             	mov    %rsp,%rbp
    1fb6:	e8 15 ff ff ff       	callq  1ed0 <do_compat_readv>
    1fbb:	5d                   	pop    %rbp
    1fbc:	c3                   	retq   
    1fbd:	0f 1f 00             	nopl   (%rax)

0000000000001fc0 <__x32_compat_sys_readv>:
    1fc0:	e8 00 00 00 00       	callq  1fc5 <__x32_compat_sys_readv+0x5>
    1fc5:	55                   	push   %rbp
    1fc6:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    1fca:	31 c9                	xor    %ecx,%ecx
    1fcc:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    1fd0:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    1fd4:	48 89 e5             	mov    %rsp,%rbp
    1fd7:	e8 f4 fe ff ff       	callq  1ed0 <do_compat_readv>
    1fdc:	5d                   	pop    %rbp
    1fdd:	c3                   	retq   
    1fde:	66 90                	xchg   %ax,%ax

0000000000001fe0 <do_compat_preadv64>:
    1fe0:	e8 00 00 00 00       	callq  1fe5 <do_compat_preadv64+0x5>
    1fe5:	55                   	push   %rbp
    1fe6:	48 89 e5             	mov    %rsp,%rbp
    1fe9:	41 57                	push   %r15
    1feb:	41 56                	push   %r14
    1fed:	41 55                	push   %r13
    1fef:	41 54                	push   %r12
    1ff1:	53                   	push   %rbx
    1ff2:	48 83 ec 10          	sub    $0x10,%rsp
    1ff6:	48 85 c9             	test   %rcx,%rcx
    1ff9:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    1ffd:	78 64                	js     2063 <do_compat_preadv64+0x83>
    1fff:	45 89 c5             	mov    %r8d,%r13d
    2002:	49 89 d4             	mov    %rdx,%r12
    2005:	48 89 f3             	mov    %rsi,%rbx
    2008:	e8 00 00 00 00       	callq  200d <do_compat_preadv64+0x2d>
    200d:	49 89 c7             	mov    %rax,%r15
    2010:	49 89 c6             	mov    %rax,%r14
    2013:	49 83 e7 fc          	and    $0xfffffffffffffffc,%r15
    2017:	74 53                	je     206c <do_compat_preadv64+0x8c>
    2019:	41 f6 47 44 08       	testb  $0x8,0x44(%r15)
    201e:	48 c7 c0 e3 ff ff ff 	mov    $0xffffffffffffffe3,%rax
    2025:	75 25                	jne    204c <do_compat_preadv64+0x6c>
    2027:	41 83 e6 01          	and    $0x1,%r14d
    202b:	74 10                	je     203d <do_compat_preadv64+0x5d>
    202d:	4c 89 ff             	mov    %r15,%rdi
    2030:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    2034:	e8 00 00 00 00       	callq  2039 <do_compat_preadv64+0x59>
    2039:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    203d:	48 83 c4 10          	add    $0x10,%rsp
    2041:	5b                   	pop    %rbx
    2042:	41 5c                	pop    %r12
    2044:	41 5d                	pop    %r13
    2046:	41 5e                	pop    %r14
    2048:	41 5f                	pop    %r15
    204a:	5d                   	pop    %rbp
    204b:	c3                   	retq   
    204c:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
    2050:	45 89 e8             	mov    %r13d,%r8d
    2053:	4c 89 e2             	mov    %r12,%rdx
    2056:	48 89 de             	mov    %rbx,%rsi
    2059:	4c 89 ff             	mov    %r15,%rdi
    205c:	e8 7f fd ff ff       	callq  1de0 <compat_readv>
    2061:	eb c4                	jmp    2027 <do_compat_preadv64+0x47>
    2063:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
    206a:	eb d1                	jmp    203d <do_compat_preadv64+0x5d>
    206c:	48 c7 c0 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rax
    2073:	eb c8                	jmp    203d <do_compat_preadv64+0x5d>
    2075:	90                   	nop
    2076:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    207d:	00 00 00 

0000000000002080 <__ia32_compat_sys_preadv64>:
    2080:	e8 00 00 00 00       	callq  2085 <__ia32_compat_sys_preadv64+0x5>
    2085:	55                   	push   %rbp
    2086:	8b 4f 68             	mov    0x68(%rdi),%ecx
    2089:	45 31 c0             	xor    %r8d,%r8d
    208c:	8b 57 60             	mov    0x60(%rdi),%edx
    208f:	8b 77 58             	mov    0x58(%rdi),%esi
    2092:	8b 7f 28             	mov    0x28(%rdi),%edi
    2095:	48 89 e5             	mov    %rsp,%rbp
    2098:	e8 43 ff ff ff       	callq  1fe0 <do_compat_preadv64>
    209d:	5d                   	pop    %rbp
    209e:	c3                   	retq   
    209f:	90                   	nop

00000000000020a0 <__x32_compat_sys_preadv64>:
    20a0:	e8 00 00 00 00       	callq  20a5 <__x32_compat_sys_preadv64+0x5>
    20a5:	55                   	push   %rbp
    20a6:	48 8b 4f 38          	mov    0x38(%rdi),%rcx
    20aa:	45 31 c0             	xor    %r8d,%r8d
    20ad:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    20b1:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    20b5:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    20b9:	48 89 e5             	mov    %rsp,%rbp
    20bc:	e8 1f ff ff ff       	callq  1fe0 <do_compat_preadv64>
    20c1:	5d                   	pop    %rbp
    20c2:	c3                   	retq   
    20c3:	0f 1f 00             	nopl   (%rax)
    20c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    20cd:	00 00 00 

00000000000020d0 <__ia32_compat_sys_preadv>:
    20d0:	e8 00 00 00 00       	callq  20d5 <__ia32_compat_sys_preadv+0x5>
    20d5:	55                   	push   %rbp
    20d6:	8b 4f 68             	mov    0x68(%rdi),%ecx
    20d9:	45 31 c0             	xor    %r8d,%r8d
    20dc:	48 8b 47 70          	mov    0x70(%rdi),%rax
    20e0:	8b 57 60             	mov    0x60(%rdi),%edx
    20e3:	8b 77 58             	mov    0x58(%rdi),%esi
    20e6:	8b 7f 28             	mov    0x28(%rdi),%edi
    20e9:	48 89 e5             	mov    %rsp,%rbp
    20ec:	48 c1 e0 20          	shl    $0x20,%rax
    20f0:	48 09 c1             	or     %rax,%rcx
    20f3:	e8 e8 fe ff ff       	callq  1fe0 <do_compat_preadv64>
    20f8:	5d                   	pop    %rbp
    20f9:	c3                   	retq   
    20fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000002100 <__x32_compat_sys_preadv>:
    2100:	e8 00 00 00 00       	callq  2105 <__x32_compat_sys_preadv+0x5>
    2105:	55                   	push   %rbp
    2106:	48 8b 4f 48          	mov    0x48(%rdi),%rcx
    210a:	45 31 c0             	xor    %r8d,%r8d
    210d:	8b 47 38             	mov    0x38(%rdi),%eax
    2110:	8b 57 60             	mov    0x60(%rdi),%edx
    2113:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    2117:	8b 7f 70             	mov    0x70(%rdi),%edi
    211a:	48 89 e5             	mov    %rsp,%rbp
    211d:	48 c1 e1 20          	shl    $0x20,%rcx
    2121:	48 09 c1             	or     %rax,%rcx
    2124:	e8 b7 fe ff ff       	callq  1fe0 <do_compat_preadv64>
    2129:	5d                   	pop    %rbp
    212a:	c3                   	retq   
    212b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002130 <__ia32_compat_sys_preadv64v2>:
    2130:	e8 00 00 00 00       	callq  2135 <__ia32_compat_sys_preadv64v2+0x5>
    2135:	55                   	push   %rbp
    2136:	48 89 f8             	mov    %rdi,%rax
    2139:	8b 4f 68             	mov    0x68(%rdi),%ecx
    213c:	8b 57 60             	mov    0x60(%rdi),%edx
    213f:	8b 77 58             	mov    0x58(%rdi),%esi
    2142:	8b 7f 28             	mov    0x28(%rdi),%edi
    2145:	44 8b 40 70          	mov    0x70(%rax),%r8d
    2149:	48 89 e5             	mov    %rsp,%rbp
    214c:	e8 8f fe ff ff       	callq  1fe0 <do_compat_preadv64>
    2151:	5d                   	pop    %rbp
    2152:	c3                   	retq   
    2153:	0f 1f 00             	nopl   (%rax)
    2156:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    215d:	00 00 00 

0000000000002160 <__ia32_compat_sys_preadv2>:
    2160:	e8 00 00 00 00       	callq  2165 <__ia32_compat_sys_preadv2+0x5>
    2165:	55                   	push   %rbp
    2166:	48 8b 4f 70          	mov    0x70(%rdi),%rcx
    216a:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    216e:	48 8b 47 28          	mov    0x28(%rdi),%rax
    2172:	4c 8b 47 20          	mov    0x20(%rdi),%r8
    2176:	8b 77 58             	mov    0x58(%rdi),%esi
    2179:	48 89 e5             	mov    %rsp,%rbp
    217c:	8b 7f 68             	mov    0x68(%rdi),%edi
    217f:	48 c1 e1 20          	shl    $0x20,%rcx
    2183:	48 09 f9             	or     %rdi,%rcx
    2186:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
    218a:	74 0b                	je     2197 <__ia32_compat_sys_preadv2+0x37>
    218c:	89 d2                	mov    %edx,%edx
    218e:	89 c7                	mov    %eax,%edi
    2190:	e8 4b fe ff ff       	callq  1fe0 <do_compat_preadv64>
    2195:	5d                   	pop    %rbp
    2196:	c3                   	retq   
    2197:	44 89 c1             	mov    %r8d,%ecx
    219a:	89 c7                	mov    %eax,%edi
    219c:	e8 2f fd ff ff       	callq  1ed0 <do_compat_readv>
    21a1:	5d                   	pop    %rbp
    21a2:	c3                   	retq   
    21a3:	0f 1f 00             	nopl   (%rax)
    21a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    21ad:	00 00 00 

00000000000021b0 <__x32_compat_sys_preadv64v2>:
    21b0:	e8 00 00 00 00       	callq  21b5 <__x32_compat_sys_preadv64v2+0x5>
    21b5:	55                   	push   %rbp
    21b6:	48 8b 4f 38          	mov    0x38(%rdi),%rcx
    21ba:	48 89 f8             	mov    %rdi,%rax
    21bd:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    21c1:	4c 8b 40 48          	mov    0x48(%rax),%r8
    21c5:	48 89 e5             	mov    %rsp,%rbp
    21c8:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    21cc:	48 8b 70 68          	mov    0x68(%rax),%rsi
    21d0:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
    21d4:	74 07                	je     21dd <__x32_compat_sys_preadv64v2+0x2d>
    21d6:	e8 05 fe ff ff       	callq  1fe0 <do_compat_preadv64>
    21db:	5d                   	pop    %rbp
    21dc:	c3                   	retq   
    21dd:	44 89 c1             	mov    %r8d,%ecx
    21e0:	e8 eb fc ff ff       	callq  1ed0 <do_compat_readv>
    21e5:	5d                   	pop    %rbp
    21e6:	c3                   	retq   
    21e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    21ee:	00 00 

00000000000021f0 <__x32_compat_sys_preadv2>:
    21f0:	e8 00 00 00 00       	callq  21f5 <__x32_compat_sys_preadv2+0x5>
    21f5:	55                   	push   %rbp
    21f6:	48 8b 4f 48          	mov    0x48(%rdi),%rcx
    21fa:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    21fe:	48 8b 47 70          	mov    0x70(%rdi),%rax
    2202:	4c 8b 47 40          	mov    0x40(%rdi),%r8
    2206:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    220a:	48 89 e5             	mov    %rsp,%rbp
    220d:	8b 7f 38             	mov    0x38(%rdi),%edi
    2210:	48 c1 e1 20          	shl    $0x20,%rcx
    2214:	48 09 f9             	or     %rdi,%rcx
    2217:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
    221b:	74 0b                	je     2228 <__x32_compat_sys_preadv2+0x38>
    221d:	89 d2                	mov    %edx,%edx
    221f:	89 c7                	mov    %eax,%edi
    2221:	e8 ba fd ff ff       	callq  1fe0 <do_compat_preadv64>
    2226:	5d                   	pop    %rbp
    2227:	c3                   	retq   
    2228:	44 89 c1             	mov    %r8d,%ecx
    222b:	89 c7                	mov    %eax,%edi
    222d:	e8 9e fc ff ff       	callq  1ed0 <do_compat_readv>
    2232:	5d                   	pop    %rbp
    2233:	c3                   	retq   
    2234:	66 90                	xchg   %ax,%ax
    2236:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    223d:	00 00 00 

0000000000002240 <vfs_iocb_iter_write>:
    2240:	e8 00 00 00 00       	callq  2245 <vfs_iocb_iter_write+0x5>
    2245:	55                   	push   %rbp
    2246:	48 89 e5             	mov    %rsp,%rbp
    2249:	41 57                	push   %r15
    224b:	41 56                	push   %r14
    224d:	41 55                	push   %r13
    224f:	41 54                	push   %r12
    2251:	53                   	push   %rbx
    2252:	48 8b 47 28          	mov    0x28(%rdi),%rax
    2256:	48 83 78 28 00       	cmpq   $0x0,0x28(%rax)
    225b:	0f 84 d0 00 00 00    	je     2331 <vfs_iocb_iter_write+0xf1>
    2261:	8b 47 44             	mov    0x44(%rdi),%eax
    2264:	a8 02                	test   $0x2,%al
    2266:	0f 84 d1 00 00 00    	je     233d <vfs_iocb_iter_write+0xfd>
    226c:	a9 00 00 04 00       	test   $0x40000,%eax
    2271:	0f 84 ba 00 00 00    	je     2331 <vfs_iocb_iter_write+0xf1>
    2277:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    227b:	45 31 e4             	xor    %r12d,%r12d
    227e:	48 85 c9             	test   %rcx,%rcx
    2281:	75 0e                	jne    2291 <vfs_iocb_iter_write+0x51>
    2283:	5b                   	pop    %rbx
    2284:	4c 89 e0             	mov    %r12,%rax
    2287:	41 5c                	pop    %r12
    2289:	41 5d                	pop    %r13
    228b:	41 5e                	pop    %r14
    228d:	41 5f                	pop    %r15
    228f:	5d                   	pop    %rbp
    2290:	c3                   	retq   
    2291:	49 89 d5             	mov    %rdx,%r13
    2294:	48 8d 56 08          	lea    0x8(%rsi),%rdx
    2298:	49 89 f6             	mov    %rsi,%r14
    229b:	48 89 fb             	mov    %rdi,%rbx
    229e:	48 89 fe             	mov    %rdi,%rsi
    22a1:	bf 01 00 00 00       	mov    $0x1,%edi
    22a6:	e8 00 00 00 00       	callq  22ab <vfs_iocb_iter_write+0x6b>
    22ab:	4c 63 e0             	movslq %eax,%r12
    22ae:	4d 85 e4             	test   %r12,%r12
    22b1:	78 d0                	js     2283 <vfs_iocb_iter_write+0x43>
    22b3:	48 8b 43 28          	mov    0x28(%rbx),%rax
    22b7:	4c 89 ee             	mov    %r13,%rsi
    22ba:	4c 89 f7             	mov    %r14,%rdi
    22bd:	48 8b 40 28          	mov    0x28(%rax),%rax
    22c1:	e8 00 00 00 00       	callq  22c6 <vfs_iocb_iter_write+0x86>
    22c6:	48 85 c0             	test   %rax,%rax
    22c9:	49 89 c4             	mov    %rax,%r12
    22cc:	7e b5                	jle    2283 <vfs_iocb_iter_write+0x43>
    22ce:	f6 43 47 04          	testb  $0x4,0x47(%rbx)
    22d2:	75 af                	jne    2283 <vfs_iocb_iter_write+0x43>
    22d4:	4c 8b 73 20          	mov    0x20(%rbx),%r14
    22d8:	41 bd 02 00 00 00    	mov    $0x2,%r13d
    22de:	4c 8d 7b 10          	lea    0x10(%rbx),%r15
    22e2:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
    22e6:	b9 01 00 00 00       	mov    $0x1,%ecx
    22eb:	4c 89 fa             	mov    %r15,%rdx
    22ee:	41 0f b7 06          	movzwl (%r14),%eax
    22f2:	66 25 00 f0          	and    $0xf000,%ax
    22f6:	66 3d 00 40          	cmp    $0x4000,%ax
    22fa:	b8 02 00 00 40       	mov    $0x40000002,%eax
    22ff:	44 0f 44 e8          	cmove  %eax,%r13d
    2303:	44 89 ee             	mov    %r13d,%esi
    2306:	e8 00 00 00 00       	callq  230b <vfs_iocb_iter_write+0xcb>
    230b:	85 c0                	test   %eax,%eax
    230d:	0f 85 70 ff ff ff    	jne    2283 <vfs_iocb_iter_write+0x43>
    2313:	45 31 c9             	xor    %r9d,%r9d
    2316:	45 31 c0             	xor    %r8d,%r8d
    2319:	b9 01 00 00 00       	mov    $0x1,%ecx
    231e:	4c 89 fa             	mov    %r15,%rdx
    2321:	44 89 ee             	mov    %r13d,%esi
    2324:	4c 89 f7             	mov    %r14,%rdi
    2327:	e8 00 00 00 00       	callq  232c <vfs_iocb_iter_write+0xec>
    232c:	e9 52 ff ff ff       	jmpq   2283 <vfs_iocb_iter_write+0x43>
    2331:	49 c7 c4 ea ff ff ff 	mov    $0xffffffffffffffea,%r12
    2338:	e9 46 ff ff ff       	jmpq   2283 <vfs_iocb_iter_write+0x43>
    233d:	49 c7 c4 f7 ff ff ff 	mov    $0xfffffffffffffff7,%r12
    2344:	e9 3a ff ff ff       	jmpq   2283 <vfs_iocb_iter_write+0x43>
    2349:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002350 <do_iter_write>:
    2350:	e8 00 00 00 00       	callq  2355 <do_iter_write+0x5>
    2355:	55                   	push   %rbp
    2356:	48 89 e5             	mov    %rsp,%rbp
    2359:	41 57                	push   %r15
    235b:	41 56                	push   %r14
    235d:	41 55                	push   %r13
    235f:	41 54                	push   %r12
    2361:	53                   	push   %rbx
    2362:	8b 47 44             	mov    0x44(%rdi),%eax
    2365:	a8 02                	test   $0x2,%al
    2367:	0f 84 5a 01 00 00    	je     24c7 <do_iter_write+0x177>
    236d:	a9 00 00 04 00       	test   $0x40000,%eax
    2372:	0f 84 5b 01 00 00    	je     24d3 <do_iter_write+0x183>
    2378:	48 8b 46 10          	mov    0x10(%rsi),%rax
    237c:	48 85 c0             	test   %rax,%rax
    237f:	75 11                	jne    2392 <do_iter_write+0x42>
    2381:	45 31 ff             	xor    %r15d,%r15d
    2384:	5b                   	pop    %rbx
    2385:	4c 89 f8             	mov    %r15,%rax
    2388:	41 5c                	pop    %r12
    238a:	41 5d                	pop    %r13
    238c:	41 5e                	pop    %r14
    238e:	41 5f                	pop    %r15
    2390:	5d                   	pop    %rbp
    2391:	c3                   	retq   
    2392:	89 cb                	mov    %ecx,%ebx
    2394:	49 89 f4             	mov    %rsi,%r12
    2397:	49 89 fd             	mov    %rdi,%r13
    239a:	48 89 fe             	mov    %rdi,%rsi
    239d:	48 89 c1             	mov    %rax,%rcx
    23a0:	bf 01 00 00 00       	mov    $0x1,%edi
    23a5:	49 89 d6             	mov    %rdx,%r14
    23a8:	e8 00 00 00 00       	callq  23ad <do_iter_write+0x5d>
    23ad:	4c 63 f8             	movslq %eax,%r15
    23b0:	4d 85 ff             	test   %r15,%r15
    23b3:	78 cf                	js     2384 <do_iter_write+0x34>
    23b5:	49 8b 55 28          	mov    0x28(%r13),%rdx
    23b9:	48 83 7a 28 00       	cmpq   $0x0,0x28(%rdx)
    23be:	74 7f                	je     243f <do_iter_write+0xef>
    23c0:	41 89 d8             	mov    %ebx,%r8d
    23c3:	b9 01 00 00 00       	mov    $0x1,%ecx
    23c8:	4c 89 f2             	mov    %r14,%rdx
    23cb:	4c 89 e6             	mov    %r12,%rsi
    23ce:	4c 89 ef             	mov    %r13,%rdi
    23d1:	e8 5a df ff ff       	callq  330 <do_iter_readv_writev>
    23d6:	49 89 c7             	mov    %rax,%r15
    23d9:	4d 85 ff             	test   %r15,%r15
    23dc:	7e a6                	jle    2384 <do_iter_write+0x34>
    23de:	41 f6 45 47 04       	testb  $0x4,0x47(%r13)
    23e3:	75 9f                	jne    2384 <do_iter_write+0x34>
    23e5:	4d 8b 65 20          	mov    0x20(%r13),%r12
    23e9:	bb 02 00 00 40       	mov    $0x40000002,%ebx
    23ee:	4d 8d 75 10          	lea    0x10(%r13),%r14
    23f2:	49 8b 7d 18          	mov    0x18(%r13),%rdi
    23f6:	b9 01 00 00 00       	mov    $0x1,%ecx
    23fb:	4c 89 f2             	mov    %r14,%rdx
    23fe:	41 0f b7 04 24       	movzwl (%r12),%eax
    2403:	66 25 00 f0          	and    $0xf000,%ax
    2407:	66 3d 00 40          	cmp    $0x4000,%ax
    240b:	b8 02 00 00 00       	mov    $0x2,%eax
    2410:	0f 45 d8             	cmovne %eax,%ebx
    2413:	89 de                	mov    %ebx,%esi
    2415:	e8 00 00 00 00       	callq  241a <do_iter_write+0xca>
    241a:	85 c0                	test   %eax,%eax
    241c:	0f 85 62 ff ff ff    	jne    2384 <do_iter_write+0x34>
    2422:	45 31 c9             	xor    %r9d,%r9d
    2425:	45 31 c0             	xor    %r8d,%r8d
    2428:	b9 01 00 00 00       	mov    $0x1,%ecx
    242d:	4c 89 f2             	mov    %r14,%rdx
    2430:	89 de                	mov    %ebx,%esi
    2432:	4c 89 e7             	mov    %r12,%rdi
    2435:	e8 00 00 00 00       	callq  243a <do_iter_write+0xea>
    243a:	e9 45 ff ff ff       	jmpq   2384 <do_iter_write+0x34>
    243f:	83 e3 fe             	and    $0xfffffffe,%ebx
    2442:	0f 85 97 00 00 00    	jne    24df <do_iter_write+0x18f>
    2448:	49 8b 4c 24 10       	mov    0x10(%r12),%rcx
    244d:	48 85 c9             	test   %rcx,%rcx
    2450:	0f 84 2b ff ff ff    	je     2381 <do_iter_write+0x31>
    2456:	45 31 ff             	xor    %r15d,%r15d
    2459:	eb 29                	jmp    2484 <do_iter_write+0x134>
    245b:	49 01 c7             	add    %rax,%r15
    245e:	48 39 c3             	cmp    %rax,%rbx
    2461:	0f 85 72 ff ff ff    	jne    23d9 <do_iter_write+0x89>
    2467:	48 89 de             	mov    %rbx,%rsi
    246a:	4c 89 e7             	mov    %r12,%rdi
    246d:	e8 00 00 00 00       	callq  2472 <do_iter_write+0x122>
    2472:	49 8b 4c 24 10       	mov    0x10(%r12),%rcx
    2477:	48 85 c9             	test   %rcx,%rcx
    247a:	0f 84 59 ff ff ff    	je     23d9 <do_iter_write+0x89>
    2480:	49 8b 55 28          	mov    0x28(%r13),%rdx
    2484:	49 8b 44 24 18       	mov    0x18(%r12),%rax
    2489:	49 8b 74 24 08       	mov    0x8(%r12),%rsi
    248e:	4c 89 ef             	mov    %r13,%rdi
    2491:	48 8b 58 08          	mov    0x8(%rax),%rbx
    2495:	48 29 f3             	sub    %rsi,%rbx
    2498:	48 39 cb             	cmp    %rcx,%rbx
    249b:	48 0f 47 d9          	cmova  %rcx,%rbx
    249f:	48 03 30             	add    (%rax),%rsi
    24a2:	4c 89 f1             	mov    %r14,%rcx
    24a5:	48 8b 42 18          	mov    0x18(%rdx),%rax
    24a9:	48 89 da             	mov    %rbx,%rdx
    24ac:	e8 00 00 00 00       	callq  24b1 <do_iter_write+0x161>
    24b1:	48 85 c0             	test   %rax,%rax
    24b4:	79 a5                	jns    245b <do_iter_write+0x10b>
    24b6:	4d 85 ff             	test   %r15,%r15
    24b9:	0f 85 1a ff ff ff    	jne    23d9 <do_iter_write+0x89>
    24bf:	49 89 c7             	mov    %rax,%r15
    24c2:	e9 bd fe ff ff       	jmpq   2384 <do_iter_write+0x34>
    24c7:	49 c7 c7 f7 ff ff ff 	mov    $0xfffffffffffffff7,%r15
    24ce:	e9 b1 fe ff ff       	jmpq   2384 <do_iter_write+0x34>
    24d3:	49 c7 c7 ea ff ff ff 	mov    $0xffffffffffffffea,%r15
    24da:	e9 a5 fe ff ff       	jmpq   2384 <do_iter_write+0x34>
    24df:	49 c7 c7 a1 ff ff ff 	mov    $0xffffffffffffffa1,%r15
    24e6:	e9 99 fe ff ff       	jmpq   2384 <do_iter_write+0x34>
    24eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000024f0 <vfs_iter_write>:
    24f0:	e8 00 00 00 00       	callq  24f5 <vfs_iter_write+0x5>
    24f5:	48 8b 47 28          	mov    0x28(%rdi),%rax
    24f9:	48 83 78 28 00       	cmpq   $0x0,0x28(%rax)
    24fe:	74 0b                	je     250b <vfs_iter_write+0x1b>
    2500:	55                   	push   %rbp
    2501:	48 89 e5             	mov    %rsp,%rbp
    2504:	e8 47 fe ff ff       	callq  2350 <do_iter_write>
    2509:	5d                   	pop    %rbp
    250a:	c3                   	retq   
    250b:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
    2512:	c3                   	retq   
    2513:	0f 1f 00             	nopl   (%rax)
    2516:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    251d:	00 00 00 

0000000000002520 <vfs_writev>:
    2520:	e8 00 00 00 00       	callq  2525 <vfs_writev+0x5>
    2525:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
    252a:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    252e:	41 ff 72 f8          	pushq  -0x8(%r10)
    2532:	55                   	push   %rbp
    2533:	48 89 e5             	mov    %rsp,%rbp
    2536:	41 55                	push   %r13
    2538:	41 54                	push   %r12
    253a:	41 52                	push   %r10
    253c:	53                   	push   %rbx
    253d:	45 89 c5             	mov    %r8d,%r13d
    2540:	4c 8d 8d 28 ff ff ff 	lea    -0xd8(%rbp),%r9
    2547:	4c 8d 85 20 ff ff ff 	lea    -0xe0(%rbp),%r8
    254e:	48 89 fb             	mov    %rdi,%rbx
    2551:	48 81 ec d0 00 00 00 	sub    $0xd0,%rsp
    2558:	49 89 cc             	mov    %rcx,%r12
    255b:	bf 01 00 00 00       	mov    $0x1,%edi
    2560:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    2567:	00 00 
    2569:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    256d:	31 c0                	xor    %eax,%eax
    256f:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
    2576:	b9 08 00 00 00       	mov    $0x8,%ecx
    257b:	48 89 85 20 ff ff ff 	mov    %rax,-0xe0(%rbp)
    2582:	e8 00 00 00 00       	callq  2587 <vfs_writev+0x67>
    2587:	48 85 c0             	test   %rax,%rax
    258a:	78 53                	js     25df <vfs_writev+0xbf>
    258c:	48 8b 53 20          	mov    0x20(%rbx),%rdx
    2590:	0f b7 02             	movzwl (%rdx),%eax
    2593:	66 25 00 f0          	and    $0xf000,%ax
    2597:	66 3d 00 80          	cmp    $0x8000,%ax
    259b:	74 65                	je     2602 <vfs_writev+0xe2>
    259d:	48 8d b5 28 ff ff ff 	lea    -0xd8(%rbp),%rsi
    25a4:	44 89 e9             	mov    %r13d,%ecx
    25a7:	4c 89 e2             	mov    %r12,%rdx
    25aa:	48 89 df             	mov    %rbx,%rdi
    25ad:	e8 9e fd ff ff       	callq  2350 <do_iter_write>
    25b2:	48 8b 4b 20          	mov    0x20(%rbx),%rcx
    25b6:	0f b7 11             	movzwl (%rcx),%edx
    25b9:	66 81 e2 00 f0       	and    $0xf000,%dx
    25be:	66 81 fa 00 80       	cmp    $0x8000,%dx
    25c3:	74 52                	je     2617 <vfs_writev+0xf7>
    25c5:	48 8b bd 20 ff ff ff 	mov    -0xe0(%rbp),%rdi
    25cc:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
    25d3:	e8 00 00 00 00       	callq  25d8 <vfs_writev+0xb8>
    25d8:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
    25df:	48 8b 5d d8          	mov    -0x28(%rbp),%rbx
    25e3:	65 48 33 1c 25 28 00 	xor    %gs:0x28,%rbx
    25ea:	00 00 
    25ec:	75 47                	jne    2635 <vfs_writev+0x115>
    25ee:	48 81 c4 d0 00 00 00 	add    $0xd0,%rsp
    25f5:	5b                   	pop    %rbx
    25f6:	41 5a                	pop    %r10
    25f8:	41 5c                	pop    %r12
    25fa:	41 5d                	pop    %r13
    25fc:	5d                   	pop    %rbp
    25fd:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
    2601:	c3                   	retq   
    2602:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
    2606:	be 01 00 00 00       	mov    $0x1,%esi
    260b:	ba 01 00 00 00       	mov    $0x1,%edx
    2610:	e8 00 00 00 00       	callq  2615 <vfs_writev+0xf5>
    2615:	eb 86                	jmp    259d <vfs_writev+0x7d>
    2617:	48 8b 79 28          	mov    0x28(%rcx),%rdi
    261b:	be 01 00 00 00       	mov    $0x1,%esi
    2620:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
    2627:	e8 00 00 00 00       	callq  262c <vfs_writev+0x10c>
    262c:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
    2633:	eb 90                	jmp    25c5 <vfs_writev+0xa5>
    2635:	e8 00 00 00 00       	callq  263a <vfs_writev+0x11a>
    263a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000002640 <do_writev>:
    2640:	e8 00 00 00 00       	callq  2645 <do_writev+0x5>
    2645:	55                   	push   %rbp
    2646:	48 89 e5             	mov    %rsp,%rbp
    2649:	41 57                	push   %r15
    264b:	41 56                	push   %r14
    264d:	41 55                	push   %r13
    264f:	41 54                	push   %r12
    2651:	49 89 f5             	mov    %rsi,%r13
    2654:	53                   	push   %rbx
    2655:	49 89 d6             	mov    %rdx,%r14
    2658:	41 89 cf             	mov    %ecx,%r15d
    265b:	48 83 ec 18          	sub    $0x18,%rsp
    265f:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    2666:	00 00 
    2668:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    266c:	31 c0                	xor    %eax,%eax
    266e:	e8 00 00 00 00       	callq  2673 <do_writev+0x33>
    2673:	49 89 c4             	mov    %rax,%r12
    2676:	49 83 e4 fc          	and    $0xfffffffffffffffc,%r12
    267a:	0f 84 ce 00 00 00    	je     274e <do_writev+0x10e>
    2680:	41 f6 44 24 46 20    	testb  $0x20,0x46(%r12)
    2686:	48 89 c3             	mov    %rax,%rbx
    2689:	74 75                	je     2700 <do_writev+0xc0>
    268b:	45 89 f8             	mov    %r15d,%r8d
    268e:	31 c9                	xor    %ecx,%ecx
    2690:	4c 89 f2             	mov    %r14,%rdx
    2693:	4c 89 ee             	mov    %r13,%rsi
    2696:	4c 89 e7             	mov    %r12,%rdi
    2699:	e8 82 fe ff ff       	callq  2520 <vfs_writev>
    269e:	f6 c3 02             	test   $0x2,%bl
    26a1:	0f 85 92 00 00 00    	jne    2739 <do_writev+0xf9>
    26a7:	83 e3 01             	and    $0x1,%ebx
    26aa:	74 10                	je     26bc <do_writev+0x7c>
    26ac:	4c 89 e7             	mov    %r12,%rdi
    26af:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    26b3:	e8 00 00 00 00       	callq  26b8 <do_writev+0x78>
    26b8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    26bc:	48 85 c0             	test   %rax,%rax
    26bf:	7e 10                	jle    26d1 <do_writev+0x91>
    26c1:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    26c8:	00 00 
    26ca:	48 01 82 a8 0b 00 00 	add    %rax,0xba8(%rdx)
    26d1:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    26d8:	00 00 
    26da:	48 83 82 b8 0b 00 00 	addq   $0x1,0xbb8(%rdx)
    26e1:	01 
    26e2:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    26e6:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
    26ed:	00 00 
    26ef:	75 69                	jne    275a <do_writev+0x11a>
    26f1:	48 83 c4 18          	add    $0x18,%rsp
    26f5:	5b                   	pop    %rbx
    26f6:	41 5c                	pop    %r12
    26f8:	41 5d                	pop    %r13
    26fa:	41 5e                	pop    %r14
    26fc:	41 5f                	pop    %r15
    26fe:	5d                   	pop    %rbp
    26ff:	c3                   	retq   
    2700:	49 8b 44 24 68       	mov    0x68(%r12),%rax
    2705:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
    2709:	45 89 f8             	mov    %r15d,%r8d
    270c:	4c 89 f2             	mov    %r14,%rdx
    270f:	4c 89 ee             	mov    %r13,%rsi
    2712:	4c 89 e7             	mov    %r12,%rdi
    2715:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    2719:	e8 02 fe ff ff       	callq  2520 <vfs_writev>
    271e:	48 85 c0             	test   %rax,%rax
    2721:	0f 88 77 ff ff ff    	js     269e <do_writev+0x5e>
    2727:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    272b:	f6 c3 02             	test   $0x2,%bl
    272e:	49 89 54 24 68       	mov    %rdx,0x68(%r12)
    2733:	0f 84 6e ff ff ff    	je     26a7 <do_writev+0x67>
    2739:	4c 89 e7             	mov    %r12,%rdi
    273c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    2740:	e8 00 00 00 00       	callq  2745 <do_writev+0x105>
    2745:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2749:	e9 59 ff ff ff       	jmpq   26a7 <do_writev+0x67>
    274e:	48 c7 c0 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rax
    2755:	e9 77 ff ff ff       	jmpq   26d1 <do_writev+0x91>
    275a:	e8 00 00 00 00       	callq  275f <do_writev+0x11f>
    275f:	90                   	nop

0000000000002760 <__x64_sys_writev>:
    2760:	e8 00 00 00 00       	callq  2765 <__x64_sys_writev+0x5>
    2765:	55                   	push   %rbp
    2766:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    276a:	31 c9                	xor    %ecx,%ecx
    276c:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    2770:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    2774:	48 89 e5             	mov    %rsp,%rbp
    2777:	e8 c4 fe ff ff       	callq  2640 <do_writev>
    277c:	5d                   	pop    %rbp
    277d:	c3                   	retq   
    277e:	66 90                	xchg   %ax,%ax

0000000000002780 <__ia32_sys_writev>:
    2780:	e8 00 00 00 00       	callq  2785 <__ia32_sys_writev+0x5>
    2785:	55                   	push   %rbp
    2786:	8b 57 60             	mov    0x60(%rdi),%edx
    2789:	31 c9                	xor    %ecx,%ecx
    278b:	8b 77 58             	mov    0x58(%rdi),%esi
    278e:	8b 7f 28             	mov    0x28(%rdi),%edi
    2791:	48 89 e5             	mov    %rsp,%rbp
    2794:	e8 a7 fe ff ff       	callq  2640 <do_writev>
    2799:	5d                   	pop    %rbp
    279a:	c3                   	retq   
    279b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000027a0 <do_pwritev>:
    27a0:	e8 00 00 00 00       	callq  27a5 <do_pwritev+0x5>
    27a5:	55                   	push   %rbp
    27a6:	48 89 e5             	mov    %rsp,%rbp
    27a9:	41 57                	push   %r15
    27ab:	41 56                	push   %r14
    27ad:	41 55                	push   %r13
    27af:	41 54                	push   %r12
    27b1:	53                   	push   %rbx
    27b2:	48 83 ec 10          	sub    $0x10,%rsp
    27b6:	48 85 c9             	test   %rcx,%rcx
    27b9:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    27bd:	0f 88 96 00 00 00    	js     2859 <do_pwritev+0xb9>
    27c3:	45 89 c6             	mov    %r8d,%r14d
    27c6:	49 89 d5             	mov    %rdx,%r13
    27c9:	49 89 f4             	mov    %rsi,%r12
    27cc:	e8 00 00 00 00       	callq  27d1 <do_pwritev+0x31>
    27d1:	48 89 c3             	mov    %rax,%rbx
    27d4:	48 c7 c0 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rax
    27db:	49 89 df             	mov    %rbx,%r15
    27de:	49 83 e7 fc          	and    $0xfffffffffffffffc,%r15
    27e2:	74 25                	je     2809 <do_pwritev+0x69>
    27e4:	83 e3 01             	and    $0x1,%ebx
    27e7:	41 f6 47 44 10       	testb  $0x10,0x44(%r15)
    27ec:	75 3b                	jne    2829 <do_pwritev+0x89>
    27ee:	85 db                	test   %ebx,%ebx
    27f0:	48 c7 c0 e3 ff ff ff 	mov    $0xffffffffffffffe3,%rax
    27f7:	74 10                	je     2809 <do_pwritev+0x69>
    27f9:	4c 89 ff             	mov    %r15,%rdi
    27fc:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    2800:	e8 00 00 00 00       	callq  2805 <do_pwritev+0x65>
    2805:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2809:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    2810:	00 00 
    2812:	48 83 82 b8 0b 00 00 	addq   $0x1,0xbb8(%rdx)
    2819:	01 
    281a:	48 83 c4 10          	add    $0x10,%rsp
    281e:	5b                   	pop    %rbx
    281f:	41 5c                	pop    %r12
    2821:	41 5d                	pop    %r13
    2823:	41 5e                	pop    %r14
    2825:	41 5f                	pop    %r15
    2827:	5d                   	pop    %rbp
    2828:	c3                   	retq   
    2829:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
    282d:	45 89 f0             	mov    %r14d,%r8d
    2830:	4c 89 ea             	mov    %r13,%rdx
    2833:	4c 89 e6             	mov    %r12,%rsi
    2836:	4c 89 ff             	mov    %r15,%rdi
    2839:	e8 e2 fc ff ff       	callq  2520 <vfs_writev>
    283e:	85 db                	test   %ebx,%ebx
    2840:	75 20                	jne    2862 <do_pwritev+0xc2>
    2842:	48 85 c0             	test   %rax,%rax
    2845:	7e c2                	jle    2809 <do_pwritev+0x69>
    2847:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    284e:	00 00 
    2850:	48 01 82 a8 0b 00 00 	add    %rax,0xba8(%rdx)
    2857:	eb b0                	jmp    2809 <do_pwritev+0x69>
    2859:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
    2860:	eb b8                	jmp    281a <do_pwritev+0x7a>
    2862:	4c 89 ff             	mov    %r15,%rdi
    2865:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    2869:	e8 00 00 00 00       	callq  286e <do_pwritev+0xce>
    286e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2872:	eb ce                	jmp    2842 <do_pwritev+0xa2>
    2874:	66 90                	xchg   %ax,%ax
    2876:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    287d:	00 00 00 

0000000000002880 <__x64_sys_pwritev>:
    2880:	e8 00 00 00 00       	callq  2885 <__x64_sys_pwritev+0x5>
    2885:	55                   	push   %rbp
    2886:	48 8b 4f 38          	mov    0x38(%rdi),%rcx
    288a:	45 31 c0             	xor    %r8d,%r8d
    288d:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    2891:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    2895:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    2899:	48 89 e5             	mov    %rsp,%rbp
    289c:	e8 ff fe ff ff       	callq  27a0 <do_pwritev>
    28a1:	5d                   	pop    %rbp
    28a2:	c3                   	retq   
    28a3:	0f 1f 00             	nopl   (%rax)
    28a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    28ad:	00 00 00 

00000000000028b0 <__ia32_sys_pwritev>:
    28b0:	e8 00 00 00 00       	callq  28b5 <__ia32_sys_pwritev+0x5>
    28b5:	55                   	push   %rbp
    28b6:	8b 4f 68             	mov    0x68(%rdi),%ecx
    28b9:	45 31 c0             	xor    %r8d,%r8d
    28bc:	8b 57 60             	mov    0x60(%rdi),%edx
    28bf:	8b 77 58             	mov    0x58(%rdi),%esi
    28c2:	8b 7f 28             	mov    0x28(%rdi),%edi
    28c5:	48 89 e5             	mov    %rsp,%rbp
    28c8:	e8 d3 fe ff ff       	callq  27a0 <do_pwritev>
    28cd:	5d                   	pop    %rbp
    28ce:	c3                   	retq   
    28cf:	90                   	nop

00000000000028d0 <__ia32_sys_pwritev2>:
    28d0:	e8 00 00 00 00       	callq  28d5 <__ia32_sys_pwritev2+0x5>
    28d5:	55                   	push   %rbp
    28d6:	48 89 f8             	mov    %rdi,%rax
    28d9:	8b 4f 68             	mov    0x68(%rdi),%ecx
    28dc:	8b 57 60             	mov    0x60(%rdi),%edx
    28df:	8b 77 58             	mov    0x58(%rdi),%esi
    28e2:	8b 7f 28             	mov    0x28(%rdi),%edi
    28e5:	44 8b 40 20          	mov    0x20(%rax),%r8d
    28e9:	48 89 e5             	mov    %rsp,%rbp
    28ec:	e8 af fe ff ff       	callq  27a0 <do_pwritev>
    28f1:	5d                   	pop    %rbp
    28f2:	c3                   	retq   
    28f3:	0f 1f 00             	nopl   (%rax)
    28f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    28fd:	00 00 00 

0000000000002900 <__x64_sys_pwritev2>:
    2900:	e8 00 00 00 00       	callq  2905 <__x64_sys_pwritev2+0x5>
    2905:	48 89 f8             	mov    %rdi,%rax
    2908:	55                   	push   %rbp
    2909:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    290d:	48 8b 48 38          	mov    0x38(%rax),%rcx
    2911:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    2915:	48 89 e5             	mov    %rsp,%rbp
    2918:	4c 8b 40 40          	mov    0x40(%rax),%r8
    291c:	48 8b 70 68          	mov    0x68(%rax),%rsi
    2920:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
    2924:	74 07                	je     292d <__x64_sys_pwritev2+0x2d>
    2926:	e8 75 fe ff ff       	callq  27a0 <do_pwritev>
    292b:	5d                   	pop    %rbp
    292c:	c3                   	retq   
    292d:	44 89 c1             	mov    %r8d,%ecx
    2930:	e8 0b fd ff ff       	callq  2640 <do_writev>
    2935:	5d                   	pop    %rbp
    2936:	c3                   	retq   
    2937:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    293e:	00 00 

0000000000002940 <compat_writev>:
    2940:	e8 00 00 00 00       	callq  2945 <compat_writev+0x5>
    2945:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
    294a:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    294e:	41 ff 72 f8          	pushq  -0x8(%r10)
    2952:	55                   	push   %rbp
    2953:	48 89 e5             	mov    %rsp,%rbp
    2956:	41 55                	push   %r13
    2958:	41 54                	push   %r12
    295a:	41 52                	push   %r10
    295c:	53                   	push   %rbx
    295d:	45 89 c5             	mov    %r8d,%r13d
    2960:	4c 8d 8d 28 ff ff ff 	lea    -0xd8(%rbp),%r9
    2967:	4c 8d 85 20 ff ff ff 	lea    -0xe0(%rbp),%r8
    296e:	49 89 fc             	mov    %rdi,%r12
    2971:	48 81 ec c0 00 00 00 	sub    $0xc0,%rsp
    2978:	48 89 cb             	mov    %rcx,%rbx
    297b:	bf 01 00 00 00       	mov    $0x1,%edi
    2980:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    2987:	00 00 
    2989:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    298d:	31 c0                	xor    %eax,%eax
    298f:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
    2996:	b9 08 00 00 00       	mov    $0x8,%ecx
    299b:	48 89 85 20 ff ff ff 	mov    %rax,-0xe0(%rbp)
    29a2:	e8 00 00 00 00       	callq  29a7 <compat_writev+0x67>
    29a7:	48 85 c0             	test   %rax,%rax
    29aa:	79 38                	jns    29e4 <compat_writev+0xa4>
    29ac:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    29b3:	00 00 
    29b5:	48 83 82 b8 0b 00 00 	addq   $0x1,0xbb8(%rdx)
    29bc:	01 
    29bd:	48 8b 5d d8          	mov    -0x28(%rbp),%rbx
    29c1:	65 48 33 1c 25 28 00 	xor    %gs:0x28,%rbx
    29c8:	00 00 
    29ca:	0f 85 a2 00 00 00    	jne    2a72 <compat_writev+0x132>
    29d0:	48 81 c4 c0 00 00 00 	add    $0xc0,%rsp
    29d7:	5b                   	pop    %rbx
    29d8:	41 5a                	pop    %r10
    29da:	41 5c                	pop    %r12
    29dc:	41 5d                	pop    %r13
    29de:	5d                   	pop    %rbp
    29df:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
    29e3:	c3                   	retq   
    29e4:	49 8b 54 24 20       	mov    0x20(%r12),%rdx
    29e9:	0f b7 02             	movzwl (%rdx),%eax
    29ec:	66 25 00 f0          	and    $0xf000,%ax
    29f0:	66 3d 00 80          	cmp    $0x8000,%ax
    29f4:	74 57                	je     2a4d <compat_writev+0x10d>
    29f6:	48 8d b5 28 ff ff ff 	lea    -0xd8(%rbp),%rsi
    29fd:	48 89 da             	mov    %rbx,%rdx
    2a00:	44 89 e9             	mov    %r13d,%ecx
    2a03:	4c 89 e7             	mov    %r12,%rdi
    2a06:	e8 45 f9 ff ff       	callq  2350 <do_iter_write>
    2a0b:	49 8b 54 24 20       	mov    0x20(%r12),%rdx
    2a10:	48 89 c3             	mov    %rax,%rbx
    2a13:	0f b7 02             	movzwl (%rdx),%eax
    2a16:	66 25 00 f0          	and    $0xf000,%ax
    2a1a:	66 3d 00 80          	cmp    $0x8000,%ax
    2a1e:	74 42                	je     2a62 <compat_writev+0x122>
    2a20:	48 8b bd 20 ff ff ff 	mov    -0xe0(%rbp),%rdi
    2a27:	e8 00 00 00 00       	callq  2a2c <compat_writev+0xec>
    2a2c:	48 85 db             	test   %rbx,%rbx
    2a2f:	48 89 d8             	mov    %rbx,%rax
    2a32:	0f 8e 74 ff ff ff    	jle    29ac <compat_writev+0x6c>
    2a38:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    2a3f:	00 00 
    2a41:	48 01 9a a8 0b 00 00 	add    %rbx,0xba8(%rdx)
    2a48:	e9 5f ff ff ff       	jmpq   29ac <compat_writev+0x6c>
    2a4d:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
    2a51:	be 01 00 00 00       	mov    $0x1,%esi
    2a56:	ba 01 00 00 00       	mov    $0x1,%edx
    2a5b:	e8 00 00 00 00       	callq  2a60 <compat_writev+0x120>
    2a60:	eb 94                	jmp    29f6 <compat_writev+0xb6>
    2a62:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
    2a66:	be 01 00 00 00       	mov    $0x1,%esi
    2a6b:	e8 00 00 00 00       	callq  2a70 <compat_writev+0x130>
    2a70:	eb ae                	jmp    2a20 <compat_writev+0xe0>
    2a72:	e8 00 00 00 00       	callq  2a77 <compat_writev+0x137>
    2a77:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    2a7e:	00 00 

0000000000002a80 <do_compat_writev>:
    2a80:	e8 00 00 00 00       	callq  2a85 <do_compat_writev+0x5>
    2a85:	55                   	push   %rbp
    2a86:	48 89 e5             	mov    %rsp,%rbp
    2a89:	41 57                	push   %r15
    2a8b:	41 56                	push   %r14
    2a8d:	41 55                	push   %r13
    2a8f:	41 54                	push   %r12
    2a91:	49 89 f6             	mov    %rsi,%r14
    2a94:	53                   	push   %rbx
    2a95:	41 89 d5             	mov    %edx,%r13d
    2a98:	41 89 cf             	mov    %ecx,%r15d
    2a9b:	48 83 ec 18          	sub    $0x18,%rsp
    2a9f:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    2aa6:	00 00 
    2aa8:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2aac:	31 c0                	xor    %eax,%eax
    2aae:	e8 00 00 00 00       	callq  2ab3 <do_compat_writev+0x33>
    2ab3:	48 89 c3             	mov    %rax,%rbx
    2ab6:	48 c7 c0 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rax
    2abd:	49 89 dc             	mov    %rbx,%r12
    2ac0:	49 83 e4 fc          	and    $0xfffffffffffffffc,%r12
    2ac4:	74 36                	je     2afc <do_compat_writev+0x7c>
    2ac6:	49 8b 44 24 68       	mov    0x68(%r12),%rax
    2acb:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
    2acf:	44 89 ea             	mov    %r13d,%edx
    2ad2:	45 89 f8             	mov    %r15d,%r8d
    2ad5:	4c 89 f6             	mov    %r14,%rsi
    2ad8:	4c 89 e7             	mov    %r12,%rdi
    2adb:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    2adf:	e8 5c fe ff ff       	callq  2940 <compat_writev>
    2ae4:	48 85 c0             	test   %rax,%rax
    2ae7:	78 09                	js     2af2 <do_compat_writev+0x72>
    2ae9:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    2aed:	49 89 54 24 68       	mov    %rdx,0x68(%r12)
    2af2:	f6 c3 02             	test   $0x2,%bl
    2af5:	75 35                	jne    2b2c <do_compat_writev+0xac>
    2af7:	83 e3 01             	and    $0x1,%ebx
    2afa:	75 1e                	jne    2b1a <do_compat_writev+0x9a>
    2afc:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    2b00:	65 48 33 34 25 28 00 	xor    %gs:0x28,%rsi
    2b07:	00 00 
    2b09:	75 38                	jne    2b43 <do_compat_writev+0xc3>
    2b0b:	48 83 c4 18          	add    $0x18,%rsp
    2b0f:	5b                   	pop    %rbx
    2b10:	41 5c                	pop    %r12
    2b12:	41 5d                	pop    %r13
    2b14:	41 5e                	pop    %r14
    2b16:	41 5f                	pop    %r15
    2b18:	5d                   	pop    %rbp
    2b19:	c3                   	retq   
    2b1a:	4c 89 e7             	mov    %r12,%rdi
    2b1d:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    2b21:	e8 00 00 00 00       	callq  2b26 <do_compat_writev+0xa6>
    2b26:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2b2a:	eb d0                	jmp    2afc <do_compat_writev+0x7c>
    2b2c:	4c 89 e7             	mov    %r12,%rdi
    2b2f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    2b33:	e8 00 00 00 00       	callq  2b38 <do_compat_writev+0xb8>
    2b38:	83 e3 01             	and    $0x1,%ebx
    2b3b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2b3f:	74 bb                	je     2afc <do_compat_writev+0x7c>
    2b41:	eb d7                	jmp    2b1a <do_compat_writev+0x9a>
    2b43:	e8 00 00 00 00       	callq  2b48 <do_compat_writev+0xc8>
    2b48:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    2b4f:	00 

0000000000002b50 <__ia32_compat_sys_writev>:
    2b50:	e8 00 00 00 00       	callq  2b55 <__ia32_compat_sys_writev+0x5>
    2b55:	55                   	push   %rbp
    2b56:	8b 77 58             	mov    0x58(%rdi),%esi
    2b59:	31 c9                	xor    %ecx,%ecx
    2b5b:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    2b5f:	48 8b 7f 28          	mov    0x28(%rdi),%rdi
    2b63:	48 89 e5             	mov    %rsp,%rbp
    2b66:	e8 15 ff ff ff       	callq  2a80 <do_compat_writev>
    2b6b:	5d                   	pop    %rbp
    2b6c:	c3                   	retq   
    2b6d:	0f 1f 00             	nopl   (%rax)

0000000000002b70 <__x32_compat_sys_writev>:
    2b70:	e8 00 00 00 00       	callq  2b75 <__x32_compat_sys_writev+0x5>
    2b75:	55                   	push   %rbp
    2b76:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    2b7a:	31 c9                	xor    %ecx,%ecx
    2b7c:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    2b80:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    2b84:	48 89 e5             	mov    %rsp,%rbp
    2b87:	e8 f4 fe ff ff       	callq  2a80 <do_compat_writev>
    2b8c:	5d                   	pop    %rbp
    2b8d:	c3                   	retq   
    2b8e:	66 90                	xchg   %ax,%ax

0000000000002b90 <do_compat_pwritev64>:
    2b90:	e8 00 00 00 00       	callq  2b95 <do_compat_pwritev64+0x5>
    2b95:	55                   	push   %rbp
    2b96:	48 89 e5             	mov    %rsp,%rbp
    2b99:	41 57                	push   %r15
    2b9b:	41 56                	push   %r14
    2b9d:	41 55                	push   %r13
    2b9f:	41 54                	push   %r12
    2ba1:	53                   	push   %rbx
    2ba2:	48 83 ec 10          	sub    $0x10,%rsp
    2ba6:	48 85 c9             	test   %rcx,%rcx
    2ba9:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    2bad:	78 64                	js     2c13 <do_compat_pwritev64+0x83>
    2baf:	45 89 c5             	mov    %r8d,%r13d
    2bb2:	49 89 d4             	mov    %rdx,%r12
    2bb5:	48 89 f3             	mov    %rsi,%rbx
    2bb8:	e8 00 00 00 00       	callq  2bbd <do_compat_pwritev64+0x2d>
    2bbd:	49 89 c7             	mov    %rax,%r15
    2bc0:	49 89 c6             	mov    %rax,%r14
    2bc3:	49 83 e7 fc          	and    $0xfffffffffffffffc,%r15
    2bc7:	74 53                	je     2c1c <do_compat_pwritev64+0x8c>
    2bc9:	41 f6 47 44 10       	testb  $0x10,0x44(%r15)
    2bce:	48 c7 c0 e3 ff ff ff 	mov    $0xffffffffffffffe3,%rax
    2bd5:	75 25                	jne    2bfc <do_compat_pwritev64+0x6c>
    2bd7:	41 83 e6 01          	and    $0x1,%r14d
    2bdb:	74 10                	je     2bed <do_compat_pwritev64+0x5d>
    2bdd:	4c 89 ff             	mov    %r15,%rdi
    2be0:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    2be4:	e8 00 00 00 00       	callq  2be9 <do_compat_pwritev64+0x59>
    2be9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2bed:	48 83 c4 10          	add    $0x10,%rsp
    2bf1:	5b                   	pop    %rbx
    2bf2:	41 5c                	pop    %r12
    2bf4:	41 5d                	pop    %r13
    2bf6:	41 5e                	pop    %r14
    2bf8:	41 5f                	pop    %r15
    2bfa:	5d                   	pop    %rbp
    2bfb:	c3                   	retq   
    2bfc:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
    2c00:	45 89 e8             	mov    %r13d,%r8d
    2c03:	4c 89 e2             	mov    %r12,%rdx
    2c06:	48 89 de             	mov    %rbx,%rsi
    2c09:	4c 89 ff             	mov    %r15,%rdi
    2c0c:	e8 2f fd ff ff       	callq  2940 <compat_writev>
    2c11:	eb c4                	jmp    2bd7 <do_compat_pwritev64+0x47>
    2c13:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
    2c1a:	eb d1                	jmp    2bed <do_compat_pwritev64+0x5d>
    2c1c:	48 c7 c0 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rax
    2c23:	eb c8                	jmp    2bed <do_compat_pwritev64+0x5d>
    2c25:	90                   	nop
    2c26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2c2d:	00 00 00 

0000000000002c30 <__ia32_compat_sys_pwritev64>:
    2c30:	e8 00 00 00 00       	callq  2c35 <__ia32_compat_sys_pwritev64+0x5>
    2c35:	55                   	push   %rbp
    2c36:	8b 4f 68             	mov    0x68(%rdi),%ecx
    2c39:	45 31 c0             	xor    %r8d,%r8d
    2c3c:	8b 57 60             	mov    0x60(%rdi),%edx
    2c3f:	8b 77 58             	mov    0x58(%rdi),%esi
    2c42:	8b 7f 28             	mov    0x28(%rdi),%edi
    2c45:	48 89 e5             	mov    %rsp,%rbp
    2c48:	e8 43 ff ff ff       	callq  2b90 <do_compat_pwritev64>
    2c4d:	5d                   	pop    %rbp
    2c4e:	c3                   	retq   
    2c4f:	90                   	nop

0000000000002c50 <__x32_compat_sys_pwritev64>:
    2c50:	e8 00 00 00 00       	callq  2c55 <__x32_compat_sys_pwritev64+0x5>
    2c55:	55                   	push   %rbp
    2c56:	48 8b 4f 38          	mov    0x38(%rdi),%rcx
    2c5a:	45 31 c0             	xor    %r8d,%r8d
    2c5d:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    2c61:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    2c65:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    2c69:	48 89 e5             	mov    %rsp,%rbp
    2c6c:	e8 1f ff ff ff       	callq  2b90 <do_compat_pwritev64>
    2c71:	5d                   	pop    %rbp
    2c72:	c3                   	retq   
    2c73:	0f 1f 00             	nopl   (%rax)
    2c76:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2c7d:	00 00 00 

0000000000002c80 <__ia32_compat_sys_pwritev>:
    2c80:	e8 00 00 00 00       	callq  2c85 <__ia32_compat_sys_pwritev+0x5>
    2c85:	55                   	push   %rbp
    2c86:	8b 4f 68             	mov    0x68(%rdi),%ecx
    2c89:	45 31 c0             	xor    %r8d,%r8d
    2c8c:	48 8b 47 70          	mov    0x70(%rdi),%rax
    2c90:	8b 57 60             	mov    0x60(%rdi),%edx
    2c93:	8b 77 58             	mov    0x58(%rdi),%esi
    2c96:	8b 7f 28             	mov    0x28(%rdi),%edi
    2c99:	48 89 e5             	mov    %rsp,%rbp
    2c9c:	48 c1 e0 20          	shl    $0x20,%rax
    2ca0:	48 09 c1             	or     %rax,%rcx
    2ca3:	e8 e8 fe ff ff       	callq  2b90 <do_compat_pwritev64>
    2ca8:	5d                   	pop    %rbp
    2ca9:	c3                   	retq   
    2caa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000002cb0 <__x32_compat_sys_pwritev>:
    2cb0:	e8 00 00 00 00       	callq  2cb5 <__x32_compat_sys_pwritev+0x5>
    2cb5:	55                   	push   %rbp
    2cb6:	48 8b 4f 48          	mov    0x48(%rdi),%rcx
    2cba:	45 31 c0             	xor    %r8d,%r8d
    2cbd:	8b 47 38             	mov    0x38(%rdi),%eax
    2cc0:	8b 57 60             	mov    0x60(%rdi),%edx
    2cc3:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    2cc7:	8b 7f 70             	mov    0x70(%rdi),%edi
    2cca:	48 89 e5             	mov    %rsp,%rbp
    2ccd:	48 c1 e1 20          	shl    $0x20,%rcx
    2cd1:	48 09 c1             	or     %rax,%rcx
    2cd4:	e8 b7 fe ff ff       	callq  2b90 <do_compat_pwritev64>
    2cd9:	5d                   	pop    %rbp
    2cda:	c3                   	retq   
    2cdb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002ce0 <__ia32_compat_sys_pwritev64v2>:
    2ce0:	e8 00 00 00 00       	callq  2ce5 <__ia32_compat_sys_pwritev64v2+0x5>
    2ce5:	55                   	push   %rbp
    2ce6:	48 89 f8             	mov    %rdi,%rax
    2ce9:	8b 4f 68             	mov    0x68(%rdi),%ecx
    2cec:	8b 57 60             	mov    0x60(%rdi),%edx
    2cef:	8b 77 58             	mov    0x58(%rdi),%esi
    2cf2:	8b 7f 28             	mov    0x28(%rdi),%edi
    2cf5:	44 8b 40 70          	mov    0x70(%rax),%r8d
    2cf9:	48 89 e5             	mov    %rsp,%rbp
    2cfc:	e8 8f fe ff ff       	callq  2b90 <do_compat_pwritev64>
    2d01:	5d                   	pop    %rbp
    2d02:	c3                   	retq   
    2d03:	0f 1f 00             	nopl   (%rax)
    2d06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2d0d:	00 00 00 

0000000000002d10 <__ia32_compat_sys_pwritev2>:
    2d10:	e8 00 00 00 00       	callq  2d15 <__ia32_compat_sys_pwritev2+0x5>
    2d15:	55                   	push   %rbp
    2d16:	48 8b 4f 70          	mov    0x70(%rdi),%rcx
    2d1a:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    2d1e:	48 8b 47 28          	mov    0x28(%rdi),%rax
    2d22:	4c 8b 47 20          	mov    0x20(%rdi),%r8
    2d26:	8b 77 58             	mov    0x58(%rdi),%esi
    2d29:	48 89 e5             	mov    %rsp,%rbp
    2d2c:	8b 7f 68             	mov    0x68(%rdi),%edi
    2d2f:	48 c1 e1 20          	shl    $0x20,%rcx
    2d33:	48 09 f9             	or     %rdi,%rcx
    2d36:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
    2d3a:	74 0b                	je     2d47 <__ia32_compat_sys_pwritev2+0x37>
    2d3c:	89 d2                	mov    %edx,%edx
    2d3e:	89 c7                	mov    %eax,%edi
    2d40:	e8 4b fe ff ff       	callq  2b90 <do_compat_pwritev64>
    2d45:	5d                   	pop    %rbp
    2d46:	c3                   	retq   
    2d47:	44 89 c1             	mov    %r8d,%ecx
    2d4a:	89 c7                	mov    %eax,%edi
    2d4c:	e8 2f fd ff ff       	callq  2a80 <do_compat_writev>
    2d51:	5d                   	pop    %rbp
    2d52:	c3                   	retq   
    2d53:	0f 1f 00             	nopl   (%rax)
    2d56:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2d5d:	00 00 00 

0000000000002d60 <__x32_compat_sys_pwritev64v2>:
    2d60:	e8 00 00 00 00       	callq  2d65 <__x32_compat_sys_pwritev64v2+0x5>
    2d65:	55                   	push   %rbp
    2d66:	48 8b 4f 38          	mov    0x38(%rdi),%rcx
    2d6a:	48 89 f8             	mov    %rdi,%rax
    2d6d:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    2d71:	4c 8b 40 48          	mov    0x48(%rax),%r8
    2d75:	48 89 e5             	mov    %rsp,%rbp
    2d78:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    2d7c:	48 8b 70 68          	mov    0x68(%rax),%rsi
    2d80:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
    2d84:	74 07                	je     2d8d <__x32_compat_sys_pwritev64v2+0x2d>
    2d86:	e8 05 fe ff ff       	callq  2b90 <do_compat_pwritev64>
    2d8b:	5d                   	pop    %rbp
    2d8c:	c3                   	retq   
    2d8d:	44 89 c1             	mov    %r8d,%ecx
    2d90:	e8 eb fc ff ff       	callq  2a80 <do_compat_writev>
    2d95:	5d                   	pop    %rbp
    2d96:	c3                   	retq   
    2d97:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    2d9e:	00 00 

0000000000002da0 <__x32_compat_sys_pwritev2>:
    2da0:	e8 00 00 00 00       	callq  2da5 <__x32_compat_sys_pwritev2+0x5>
    2da5:	55                   	push   %rbp
    2da6:	48 8b 4f 48          	mov    0x48(%rdi),%rcx
    2daa:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    2dae:	48 8b 47 70          	mov    0x70(%rdi),%rax
    2db2:	4c 8b 47 40          	mov    0x40(%rdi),%r8
    2db6:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    2dba:	48 89 e5             	mov    %rsp,%rbp
    2dbd:	8b 7f 38             	mov    0x38(%rdi),%edi
    2dc0:	48 c1 e1 20          	shl    $0x20,%rcx
    2dc4:	48 09 f9             	or     %rdi,%rcx
    2dc7:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
    2dcb:	74 0b                	je     2dd8 <__x32_compat_sys_pwritev2+0x38>
    2dcd:	89 d2                	mov    %edx,%edx
    2dcf:	89 c7                	mov    %eax,%edi
    2dd1:	e8 ba fd ff ff       	callq  2b90 <do_compat_pwritev64>
    2dd6:	5d                   	pop    %rbp
    2dd7:	c3                   	retq   
    2dd8:	44 89 c1             	mov    %r8d,%ecx
    2ddb:	89 c7                	mov    %eax,%edi
    2ddd:	e8 9e fc ff ff       	callq  2a80 <do_compat_writev>
    2de2:	5d                   	pop    %rbp
    2de3:	c3                   	retq   
    2de4:	66 90                	xchg   %ax,%ax
    2de6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2ded:	00 00 00 

0000000000002df0 <do_sendfile>:
    2df0:	e8 00 00 00 00       	callq  2df5 <do_sendfile+0x5>
    2df5:	55                   	push   %rbp
    2df6:	48 89 e5             	mov    %rsp,%rbp
    2df9:	41 57                	push   %r15
    2dfb:	41 56                	push   %r14
    2dfd:	41 55                	push   %r13
    2dff:	41 54                	push   %r12
    2e01:	41 89 fe             	mov    %edi,%r14d
    2e04:	53                   	push   %rbx
    2e05:	89 f7                	mov    %esi,%edi
    2e07:	49 89 d4             	mov    %rdx,%r12
    2e0a:	49 89 cd             	mov    %rcx,%r13
    2e0d:	48 83 ec 40          	sub    $0x40,%rsp
    2e11:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
    2e15:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    2e1c:	00 00 
    2e1e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2e22:	31 c0                	xor    %eax,%eax
    2e24:	e8 00 00 00 00       	callq  2e29 <do_sendfile+0x39>
    2e29:	49 89 c7             	mov    %rax,%r15
    2e2c:	49 83 e7 fc          	and    $0xfffffffffffffffc,%r15
    2e30:	0f 84 fc 02 00 00    	je     3132 <do_sendfile+0x342>
    2e36:	48 89 c3             	mov    %rax,%rbx
    2e39:	41 8b 47 44          	mov    0x44(%r15),%eax
    2e3d:	a8 01                	test   $0x1,%al
    2e3f:	75 41                	jne    2e82 <do_sendfile+0x92>
    2e41:	49 c7 c2 f7 ff ff ff 	mov    $0xfffffffffffffff7,%r10
    2e48:	83 e3 01             	and    $0x1,%ebx
    2e4b:	74 10                	je     2e5d <do_sendfile+0x6d>
    2e4d:	4c 89 ff             	mov    %r15,%rdi
    2e50:	4c 89 55 b8          	mov    %r10,-0x48(%rbp)
    2e54:	e8 00 00 00 00       	callq  2e59 <do_sendfile+0x69>
    2e59:	4c 8b 55 b8          	mov    -0x48(%rbp),%r10
    2e5d:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    2e61:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
    2e68:	00 00 
    2e6a:	4c 89 d0             	mov    %r10,%rax
    2e6d:	0f 85 2b 03 00 00    	jne    319e <do_sendfile+0x3ae>
    2e73:	48 83 c4 40          	add    $0x40,%rsp
    2e77:	5b                   	pop    %rbx
    2e78:	41 5c                	pop    %r12
    2e7a:	41 5d                	pop    %r13
    2e7c:	41 5e                	pop    %r14
    2e7e:	41 5f                	pop    %r15
    2e80:	5d                   	pop    %rbp
    2e81:	c3                   	retq   
    2e82:	4d 85 e4             	test   %r12,%r12
    2e85:	74 71                	je     2ef8 <do_sendfile+0x108>
    2e87:	49 8b 14 24          	mov    (%r12),%rdx
    2e8b:	a8 08                	test   $0x8,%al
    2e8d:	49 c7 c2 e3 ff ff ff 	mov    $0xffffffffffffffe3,%r10
    2e94:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
    2e98:	74 ae                	je     2e48 <do_sendfile+0x58>
    2e9a:	48 8d 55 c0          	lea    -0x40(%rbp),%rdx
    2e9e:	31 ff                	xor    %edi,%edi
    2ea0:	4c 89 e9             	mov    %r13,%rcx
    2ea3:	4c 89 fe             	mov    %r15,%rsi
    2ea6:	e8 00 00 00 00       	callq  2eab <do_sendfile+0xbb>
    2eab:	4c 63 d0             	movslq %eax,%r10
    2eae:	4d 85 d2             	test   %r10,%r10
    2eb1:	78 95                	js     2e48 <do_sendfile+0x58>
    2eb3:	44 89 f7             	mov    %r14d,%edi
    2eb6:	e8 00 00 00 00       	callq  2ebb <do_sendfile+0xcb>
    2ebb:	49 89 c6             	mov    %rax,%r14
    2ebe:	49 89 c3             	mov    %rax,%r11
    2ec1:	49 83 e6 fc          	and    $0xfffffffffffffffc,%r14
    2ec5:	0f 84 76 ff ff ff    	je     2e41 <do_sendfile+0x51>
    2ecb:	41 f6 46 44 02       	testb  $0x2,0x44(%r14)
    2ed0:	49 c7 c2 f7 ff ff ff 	mov    $0xfffffffffffffff7,%r10
    2ed7:	75 29                	jne    2f02 <do_sendfile+0x112>
    2ed9:	41 83 e3 01          	and    $0x1,%r11d
    2edd:	0f 84 65 ff ff ff    	je     2e48 <do_sendfile+0x58>
    2ee3:	4c 89 f7             	mov    %r14,%rdi
    2ee6:	4c 89 55 b8          	mov    %r10,-0x48(%rbp)
    2eea:	e8 00 00 00 00       	callq  2eef <do_sendfile+0xff>
    2eef:	4c 8b 55 b8          	mov    -0x48(%rbp),%r10
    2ef3:	e9 50 ff ff ff       	jmpq   2e48 <do_sendfile+0x58>
    2ef8:	49 8b 47 68          	mov    0x68(%r15),%rax
    2efc:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    2f00:	eb 98                	jmp    2e9a <do_sendfile+0xaa>
    2f02:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    2f06:	49 8b 47 20          	mov    0x20(%r15),%rax
    2f0a:	49 81 fd 00 f0 ff 7f 	cmp    $0x7ffff000,%r13
    2f11:	49 8b 4e 20          	mov    0x20(%r14),%rcx
    2f15:	41 b8 00 f0 ff 7f    	mov    $0x7ffff000,%r8d
    2f1b:	48 8d 55 c8          	lea    -0x38(%rbp),%rdx
    2f1f:	4d 0f 47 e8          	cmova  %r8,%r13
    2f23:	4c 89 f6             	mov    %r14,%rsi
    2f26:	bf 01 00 00 00       	mov    $0x1,%edi
    2f2b:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    2f2f:	49 8b 46 68          	mov    0x68(%r14),%rax
    2f33:	48 89 4d a0          	mov    %rcx,-0x60(%rbp)
    2f37:	4c 89 e9             	mov    %r13,%rcx
    2f3a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    2f3e:	e8 00 00 00 00       	callq  2f43 <do_sendfile+0x153>
    2f43:	4c 63 d0             	movslq %eax,%r10
    2f46:	4c 8b 5d b0          	mov    -0x50(%rbp),%r11
    2f4a:	4d 85 d2             	test   %r10,%r10
    2f4d:	78 8a                	js     2ed9 <do_sendfile+0xe9>
    2f4f:	48 83 7d b8 00       	cmpq   $0x0,-0x48(%rbp)
    2f54:	75 21                	jne    2f77 <do_sendfile+0x187>
    2f56:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    2f5a:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    2f5e:	48 8b 40 28          	mov    0x28(%rax),%rax
    2f62:	48 8b 51 28          	mov    0x28(%rcx),%rdx
    2f66:	48 8b 52 20          	mov    0x20(%rdx),%rdx
    2f6a:	48 39 50 20          	cmp    %rdx,0x20(%rax)
    2f6e:	48 0f 4e 50 20       	cmovle 0x20(%rax),%rdx
    2f73:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    2f77:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2f7b:	4a 8d 14 28          	lea    (%rax,%r13,1),%rdx
    2f7f:	48 3b 55 b8          	cmp    -0x48(%rbp),%rdx
    2f83:	0f 87 fd 01 00 00    	ja     3186 <do_sendfile+0x396>
    2f89:	49 8b 56 20          	mov    0x20(%r14),%rdx
    2f8d:	0f b7 02             	movzwl (%rdx),%eax
    2f90:	66 25 00 f0          	and    $0xf000,%ax
    2f94:	66 3d 00 80          	cmp    $0x8000,%ax
    2f98:	0f 84 a0 01 00 00    	je     313e <do_sendfile+0x34e>
    2f9e:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
    2fa2:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
    2fa6:	45 31 c9             	xor    %r9d,%r9d
    2fa9:	4c 89 f2             	mov    %r14,%rdx
    2fac:	4d 89 e8             	mov    %r13,%r8
    2faf:	4c 89 ff             	mov    %r15,%rdi
    2fb2:	4c 89 5d b0          	mov    %r11,-0x50(%rbp)
    2fb6:	e8 00 00 00 00       	callq  2fbb <do_sendfile+0x1cb>
    2fbb:	49 8b 56 20          	mov    0x20(%r14),%rdx
    2fbf:	49 89 c2             	mov    %rax,%r10
    2fc2:	4c 8b 5d b0          	mov    -0x50(%rbp),%r11
    2fc6:	0f b7 02             	movzwl (%rdx),%eax
    2fc9:	66 25 00 f0          	and    $0xf000,%ax
    2fcd:	66 3d 00 80          	cmp    $0x8000,%ax
    2fd1:	0f 84 87 01 00 00    	je     315e <do_sendfile+0x36e>
    2fd7:	4d 85 d2             	test   %r10,%r10
    2fda:	7f 33                	jg     300f <do_sendfile+0x21f>
    2fdc:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
    2fe0:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    2fe7:	00 00 
    2fe9:	48 83 80 b0 0b 00 00 	addq   $0x1,0xbb0(%rax)
    2ff0:	01 
    2ff1:	48 83 80 b8 0b 00 00 	addq   $0x1,0xbb8(%rax)
    2ff8:	01 
    2ff9:	48 39 55 b8          	cmp    %rdx,-0x48(%rbp)
    2ffd:	0f 8d d6 fe ff ff    	jge    2ed9 <do_sendfile+0xe9>
    3003:	49 c7 c2 b5 ff ff ff 	mov    $0xffffffffffffffb5,%r10
    300a:	e9 ca fe ff ff       	jmpq   2ed9 <do_sendfile+0xe9>
    300f:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    3016:	00 00 
    3018:	4c 01 90 a0 0b 00 00 	add    %r10,0xba0(%rax)
    301f:	4c 01 90 a8 0b 00 00 	add    %r10,0xba8(%rax)
    3026:	41 f6 47 47 04       	testb  $0x4,0x47(%r15)
    302b:	75 72                	jne    309f <do_sendfile+0x2af>
    302d:	4d 8b 6f 20          	mov    0x20(%r15),%r13
    3031:	ba 01 00 00 40       	mov    $0x40000001,%edx
    3036:	49 8b 7f 18          	mov    0x18(%r15),%rdi
    303a:	b9 01 00 00 00       	mov    $0x1,%ecx
    303f:	4c 89 55 a8          	mov    %r10,-0x58(%rbp)
    3043:	4c 89 5d b0          	mov    %r11,-0x50(%rbp)
    3047:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
    304c:	66 25 00 f0          	and    $0xf000,%ax
    3050:	66 3d 00 40          	cmp    $0x4000,%ax
    3054:	b8 01 00 00 00       	mov    $0x1,%eax
    3059:	0f 44 c2             	cmove  %edx,%eax
    305c:	89 c6                	mov    %eax,%esi
    305e:	89 45 9c             	mov    %eax,-0x64(%rbp)
    3061:	49 8d 47 10          	lea    0x10(%r15),%rax
    3065:	48 89 c2             	mov    %rax,%rdx
    3068:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    306c:	e8 00 00 00 00       	callq  3071 <do_sendfile+0x281>
    3071:	85 c0                	test   %eax,%eax
    3073:	4c 8b 5d b0          	mov    -0x50(%rbp),%r11
    3077:	4c 8b 55 a8          	mov    -0x58(%rbp),%r10
    307b:	75 22                	jne    309f <do_sendfile+0x2af>
    307d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
    3081:	8b 75 9c             	mov    -0x64(%rbp),%esi
    3084:	45 31 c9             	xor    %r9d,%r9d
    3087:	45 31 c0             	xor    %r8d,%r8d
    308a:	b9 01 00 00 00       	mov    $0x1,%ecx
    308f:	4c 89 ef             	mov    %r13,%rdi
    3092:	e8 00 00 00 00       	callq  3097 <do_sendfile+0x2a7>
    3097:	4c 8b 55 a8          	mov    -0x58(%rbp),%r10
    309b:	4c 8b 5d b0          	mov    -0x50(%rbp),%r11
    309f:	41 f6 46 47 04       	testb  $0x4,0x47(%r14)
    30a4:	75 72                	jne    3118 <do_sendfile+0x328>
    30a6:	4d 8b 6e 20          	mov    0x20(%r14),%r13
    30aa:	ba 02 00 00 40       	mov    $0x40000002,%edx
    30af:	49 8b 7e 18          	mov    0x18(%r14),%rdi
    30b3:	b9 01 00 00 00       	mov    $0x1,%ecx
    30b8:	4c 89 55 a8          	mov    %r10,-0x58(%rbp)
    30bc:	4c 89 5d b0          	mov    %r11,-0x50(%rbp)
    30c0:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
    30c5:	66 25 00 f0          	and    $0xf000,%ax
    30c9:	66 3d 00 40          	cmp    $0x4000,%ax
    30cd:	b8 02 00 00 00       	mov    $0x2,%eax
    30d2:	0f 44 c2             	cmove  %edx,%eax
    30d5:	89 c6                	mov    %eax,%esi
    30d7:	89 45 9c             	mov    %eax,-0x64(%rbp)
    30da:	49 8d 46 10          	lea    0x10(%r14),%rax
    30de:	48 89 c2             	mov    %rax,%rdx
    30e1:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    30e5:	e8 00 00 00 00       	callq  30ea <do_sendfile+0x2fa>
    30ea:	85 c0                	test   %eax,%eax
    30ec:	4c 8b 5d b0          	mov    -0x50(%rbp),%r11
    30f0:	4c 8b 55 a8          	mov    -0x58(%rbp),%r10
    30f4:	75 22                	jne    3118 <do_sendfile+0x328>
    30f6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
    30fa:	8b 75 9c             	mov    -0x64(%rbp),%esi
    30fd:	45 31 c9             	xor    %r9d,%r9d
    3100:	45 31 c0             	xor    %r8d,%r8d
    3103:	b9 01 00 00 00       	mov    $0x1,%ecx
    3108:	4c 89 ef             	mov    %r13,%rdi
    310b:	e8 00 00 00 00       	callq  3110 <do_sendfile+0x320>
    3110:	4c 8b 55 a8          	mov    -0x58(%rbp),%r10
    3114:	4c 8b 5d b0          	mov    -0x50(%rbp),%r11
    3118:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    311c:	4d 85 e4             	test   %r12,%r12
    311f:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
    3123:	49 89 46 68          	mov    %rax,0x68(%r14)
    3127:	74 54                	je     317d <do_sendfile+0x38d>
    3129:	49 89 14 24          	mov    %rdx,(%r12)
    312d:	e9 ae fe ff ff       	jmpq   2fe0 <do_sendfile+0x1f0>
    3132:	49 c7 c2 f7 ff ff ff 	mov    $0xfffffffffffffff7,%r10
    3139:	e9 1f fd ff ff       	jmpq   2e5d <do_sendfile+0x6d>
    313e:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
    3142:	be 01 00 00 00       	mov    $0x1,%esi
    3147:	ba 01 00 00 00       	mov    $0x1,%edx
    314c:	4c 89 5d b0          	mov    %r11,-0x50(%rbp)
    3150:	e8 00 00 00 00       	callq  3155 <do_sendfile+0x365>
    3155:	4c 8b 5d b0          	mov    -0x50(%rbp),%r11
    3159:	e9 40 fe ff ff       	jmpq   2f9e <do_sendfile+0x1ae>
    315e:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
    3162:	be 01 00 00 00       	mov    $0x1,%esi
    3167:	4c 89 55 a8          	mov    %r10,-0x58(%rbp)
    316b:	e8 00 00 00 00       	callq  3170 <do_sendfile+0x380>
    3170:	4c 8b 55 a8          	mov    -0x58(%rbp),%r10
    3174:	4c 8b 5d b0          	mov    -0x50(%rbp),%r11
    3178:	e9 5a fe ff ff       	jmpq   2fd7 <do_sendfile+0x1e7>
    317d:	49 89 57 68          	mov    %rdx,0x68(%r15)
    3181:	e9 5a fe ff ff       	jmpq   2fe0 <do_sendfile+0x1f0>
    3186:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    318a:	48 39 c8             	cmp    %rcx,%rax
    318d:	0f 8d 70 fe ff ff    	jge    3003 <do_sendfile+0x213>
    3193:	48 29 c1             	sub    %rax,%rcx
    3196:	49 89 cd             	mov    %rcx,%r13
    3199:	e9 eb fd ff ff       	jmpq   2f89 <do_sendfile+0x199>
    319e:	e8 00 00 00 00       	callq  31a3 <do_sendfile+0x3b3>
    31a3:	0f 1f 00             	nopl   (%rax)
    31a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    31ad:	00 00 00 

00000000000031b0 <__ia32_sys_sendfile>:
    31b0:	e8 00 00 00 00       	callq  31b5 <__ia32_sys_sendfile+0x5>
    31b5:	55                   	push   %rbp
    31b6:	48 89 e5             	mov    %rsp,%rbp
    31b9:	41 54                	push   %r12
    31bb:	53                   	push   %rbx
    31bc:	48 83 ec 10          	sub    $0x10,%rsp
    31c0:	44 8b 67 60          	mov    0x60(%rdi),%r12d
    31c4:	8b 4f 68             	mov    0x68(%rdi),%ecx
    31c7:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    31ce:	00 00 
    31d0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    31d4:	31 c0                	xor    %eax,%eax
    31d6:	48 8b 77 58          	mov    0x58(%rdi),%rsi
    31da:	48 8b 7f 28          	mov    0x28(%rdi),%rdi
    31de:	4d 85 e4             	test   %r12,%r12
    31e1:	74 4d                	je     3230 <__ia32_sys_sendfile+0x80>
    31e3:	4c 89 e0             	mov    %r12,%rax
    31e6:	e8 00 00 00 00       	callq  31eb <__ia32_sys_sendfile+0x3b>
    31eb:	85 c0                	test   %eax,%eax
    31ed:	75 50                	jne    323f <__ia32_sys_sendfile+0x8f>
    31ef:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    31f3:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
    31f7:	41 b8 ff ff ff 7f    	mov    $0x7fffffff,%r8d
    31fd:	e8 ee fb ff ff       	callq  2df0 <do_sendfile>
    3202:	4c 89 e1             	mov    %r12,%rcx
    3205:	48 89 c2             	mov    %rax,%rdx
    3208:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    320c:	e8 00 00 00 00       	callq  3211 <__ia32_sys_sendfile+0x61>
    3211:	85 c0                	test   %eax,%eax
    3213:	75 2a                	jne    323f <__ia32_sys_sendfile+0x8f>
    3215:	48 8b 5d e8          	mov    -0x18(%rbp),%rbx
    3219:	65 48 33 1c 25 28 00 	xor    %gs:0x28,%rbx
    3220:	00 00 
    3222:	48 89 d0             	mov    %rdx,%rax
    3225:	75 21                	jne    3248 <__ia32_sys_sendfile+0x98>
    3227:	48 83 c4 10          	add    $0x10,%rsp
    322b:	5b                   	pop    %rbx
    322c:	41 5c                	pop    %r12
    322e:	5d                   	pop    %rbp
    322f:	c3                   	retq   
    3230:	31 d2                	xor    %edx,%edx
    3232:	45 31 c0             	xor    %r8d,%r8d
    3235:	e8 b6 fb ff ff       	callq  2df0 <do_sendfile>
    323a:	48 89 c2             	mov    %rax,%rdx
    323d:	eb d6                	jmp    3215 <__ia32_sys_sendfile+0x65>
    323f:	48 c7 c2 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rdx
    3246:	eb cd                	jmp    3215 <__ia32_sys_sendfile+0x65>
    3248:	e8 00 00 00 00       	callq  324d <__ia32_sys_sendfile+0x9d>
    324d:	0f 1f 00             	nopl   (%rax)

0000000000003250 <__ia32_sys_sendfile64>:
    3250:	e8 00 00 00 00       	callq  3255 <__ia32_sys_sendfile64+0x5>
    3255:	55                   	push   %rbp
    3256:	48 89 e5             	mov    %rsp,%rbp
    3259:	41 56                	push   %r14
    325b:	41 55                	push   %r13
    325d:	41 54                	push   %r12
    325f:	53                   	push   %rbx
    3260:	48 83 ec 10          	sub    $0x10,%rsp
    3264:	44 8b 67 60          	mov    0x60(%rdi),%r12d
    3268:	44 8b 77 68          	mov    0x68(%rdi),%r14d
    326c:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    3273:	00 00 
    3275:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    3279:	31 c0                	xor    %eax,%eax
    327b:	4c 8b 6f 58          	mov    0x58(%rdi),%r13
    327f:	48 8b 5f 28          	mov    0x28(%rdi),%rbx
    3283:	4d 85 e4             	test   %r12,%r12
    3286:	74 5c                	je     32e4 <__ia32_sys_sendfile64+0x94>
    3288:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
    328c:	ba 08 00 00 00       	mov    $0x8,%edx
    3291:	4c 89 e6             	mov    %r12,%rsi
    3294:	e8 00 00 00 00       	callq  3299 <__ia32_sys_sendfile64+0x49>
    3299:	48 85 c0             	test   %rax,%rax
    329c:	75 5d                	jne    32fb <__ia32_sys_sendfile64+0xab>
    329e:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
    32a2:	4c 89 f1             	mov    %r14,%rcx
    32a5:	45 31 c0             	xor    %r8d,%r8d
    32a8:	44 89 ee             	mov    %r13d,%esi
    32ab:	89 df                	mov    %ebx,%edi
    32ad:	e8 3e fb ff ff       	callq  2df0 <do_sendfile>
    32b2:	4c 89 e1             	mov    %r12,%rcx
    32b5:	48 89 c2             	mov    %rax,%rdx
    32b8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    32bc:	e8 00 00 00 00       	callq  32c1 <__ia32_sys_sendfile64+0x71>
    32c1:	85 c0                	test   %eax,%eax
    32c3:	75 36                	jne    32fb <__ia32_sys_sendfile64+0xab>
    32c5:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
    32c9:	65 48 33 34 25 28 00 	xor    %gs:0x28,%rsi
    32d0:	00 00 
    32d2:	48 89 d0             	mov    %rdx,%rax
    32d5:	75 2d                	jne    3304 <__ia32_sys_sendfile64+0xb4>
    32d7:	48 83 c4 10          	add    $0x10,%rsp
    32db:	5b                   	pop    %rbx
    32dc:	41 5c                	pop    %r12
    32de:	41 5d                	pop    %r13
    32e0:	41 5e                	pop    %r14
    32e2:	5d                   	pop    %rbp
    32e3:	c3                   	retq   
    32e4:	31 d2                	xor    %edx,%edx
    32e6:	45 31 c0             	xor    %r8d,%r8d
    32e9:	4c 89 f1             	mov    %r14,%rcx
    32ec:	44 89 ee             	mov    %r13d,%esi
    32ef:	89 df                	mov    %ebx,%edi
    32f1:	e8 fa fa ff ff       	callq  2df0 <do_sendfile>
    32f6:	48 89 c2             	mov    %rax,%rdx
    32f9:	eb ca                	jmp    32c5 <__ia32_sys_sendfile64+0x75>
    32fb:	48 c7 c2 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rdx
    3302:	eb c1                	jmp    32c5 <__ia32_sys_sendfile64+0x75>
    3304:	e8 00 00 00 00       	callq  3309 <__ia32_sys_sendfile64+0xb9>
    3309:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000003310 <__ia32_compat_sys_sendfile>:
    3310:	e8 00 00 00 00       	callq  3315 <__ia32_compat_sys_sendfile+0x5>
    3315:	55                   	push   %rbp
    3316:	48 89 e5             	mov    %rsp,%rbp
    3319:	41 54                	push   %r12
    331b:	53                   	push   %rbx
    331c:	48 83 ec 10          	sub    $0x10,%rsp
    3320:	44 8b 67 60          	mov    0x60(%rdi),%r12d
    3324:	48 8b 4f 68          	mov    0x68(%rdi),%rcx
    3328:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    332f:	00 00 
    3331:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    3335:	31 c0                	xor    %eax,%eax
    3337:	48 8b 77 58          	mov    0x58(%rdi),%rsi
    333b:	48 8b 7f 28          	mov    0x28(%rdi),%rdi
    333f:	4d 85 e4             	test   %r12,%r12
    3342:	74 51                	je     3395 <__ia32_compat_sys_sendfile+0x85>
    3344:	4c 89 e0             	mov    %r12,%rax
    3347:	e8 00 00 00 00       	callq  334c <__ia32_compat_sys_sendfile+0x3c>
    334c:	85 c0                	test   %eax,%eax
    334e:	48 63 d2             	movslq %edx,%rdx
    3351:	75 53                	jne    33a6 <__ia32_compat_sys_sendfile+0x96>
    3353:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    3357:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
    335b:	89 c9                	mov    %ecx,%ecx
    335d:	41 b8 ff ff ff 7f    	mov    $0x7fffffff,%r8d
    3363:	e8 88 fa ff ff       	callq  2df0 <do_sendfile>
    3368:	4c 89 e1             	mov    %r12,%rcx
    336b:	48 89 c2             	mov    %rax,%rdx
    336e:	8b 45 e0             	mov    -0x20(%rbp),%eax
    3371:	e8 00 00 00 00       	callq  3376 <__ia32_compat_sys_sendfile+0x66>
    3376:	85 c0                	test   %eax,%eax
    3378:	75 2c                	jne    33a6 <__ia32_compat_sys_sendfile+0x96>
    337a:	48 8b 5d e8          	mov    -0x18(%rbp),%rbx
    337e:	65 48 33 1c 25 28 00 	xor    %gs:0x28,%rbx
    3385:	00 00 
    3387:	48 89 d0             	mov    %rdx,%rax
    338a:	75 23                	jne    33af <__ia32_compat_sys_sendfile+0x9f>
    338c:	48 83 c4 10          	add    $0x10,%rsp
    3390:	5b                   	pop    %rbx
    3391:	41 5c                	pop    %r12
    3393:	5d                   	pop    %rbp
    3394:	c3                   	retq   
    3395:	31 d2                	xor    %edx,%edx
    3397:	89 c9                	mov    %ecx,%ecx
    3399:	45 31 c0             	xor    %r8d,%r8d
    339c:	e8 4f fa ff ff       	callq  2df0 <do_sendfile>
    33a1:	48 89 c2             	mov    %rax,%rdx
    33a4:	eb d4                	jmp    337a <__ia32_compat_sys_sendfile+0x6a>
    33a6:	48 c7 c2 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rdx
    33ad:	eb cb                	jmp    337a <__ia32_compat_sys_sendfile+0x6a>
    33af:	e8 00 00 00 00       	callq  33b4 <__ia32_compat_sys_sendfile+0xa4>
    33b4:	66 90                	xchg   %ax,%ax
    33b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    33bd:	00 00 00 

00000000000033c0 <__ia32_compat_sys_sendfile64>:
    33c0:	e8 00 00 00 00       	callq  33c5 <__ia32_compat_sys_sendfile64+0x5>
    33c5:	55                   	push   %rbp
    33c6:	48 89 e5             	mov    %rsp,%rbp
    33c9:	41 56                	push   %r14
    33cb:	41 55                	push   %r13
    33cd:	41 54                	push   %r12
    33cf:	53                   	push   %rbx
    33d0:	48 83 ec 10          	sub    $0x10,%rsp
    33d4:	44 8b 67 60          	mov    0x60(%rdi),%r12d
    33d8:	48 8b 5f 68          	mov    0x68(%rdi),%rbx
    33dc:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    33e3:	00 00 
    33e5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    33e9:	31 c0                	xor    %eax,%eax
    33eb:	4c 8b 77 58          	mov    0x58(%rdi),%r14
    33ef:	4c 8b 6f 28          	mov    0x28(%rdi),%r13
    33f3:	4d 85 e4             	test   %r12,%r12
    33f6:	74 5c                	je     3454 <__ia32_compat_sys_sendfile64+0x94>
    33f8:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
    33fc:	ba 08 00 00 00       	mov    $0x8,%edx
    3401:	4c 89 e6             	mov    %r12,%rsi
    3404:	e8 00 00 00 00       	callq  3409 <__ia32_compat_sys_sendfile64+0x49>
    3409:	48 85 c0             	test   %rax,%rax
    340c:	75 5d                	jne    346b <__ia32_compat_sys_sendfile64+0xab>
    340e:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
    3412:	89 d9                	mov    %ebx,%ecx
    3414:	45 31 c0             	xor    %r8d,%r8d
    3417:	44 89 f6             	mov    %r14d,%esi
    341a:	44 89 ef             	mov    %r13d,%edi
    341d:	e8 ce f9 ff ff       	callq  2df0 <do_sendfile>
    3422:	4c 89 e1             	mov    %r12,%rcx
    3425:	48 89 c2             	mov    %rax,%rdx
    3428:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    342c:	e8 00 00 00 00       	callq  3431 <__ia32_compat_sys_sendfile64+0x71>
    3431:	85 c0                	test   %eax,%eax
    3433:	75 36                	jne    346b <__ia32_compat_sys_sendfile64+0xab>
    3435:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
    3439:	65 48 33 34 25 28 00 	xor    %gs:0x28,%rsi
    3440:	00 00 
    3442:	48 89 d0             	mov    %rdx,%rax
    3445:	75 2d                	jne    3474 <__ia32_compat_sys_sendfile64+0xb4>
    3447:	48 83 c4 10          	add    $0x10,%rsp
    344b:	5b                   	pop    %rbx
    344c:	41 5c                	pop    %r12
    344e:	41 5d                	pop    %r13
    3450:	41 5e                	pop    %r14
    3452:	5d                   	pop    %rbp
    3453:	c3                   	retq   
    3454:	31 d2                	xor    %edx,%edx
    3456:	89 d9                	mov    %ebx,%ecx
    3458:	45 31 c0             	xor    %r8d,%r8d
    345b:	44 89 f6             	mov    %r14d,%esi
    345e:	44 89 ef             	mov    %r13d,%edi
    3461:	e8 8a f9 ff ff       	callq  2df0 <do_sendfile>
    3466:	48 89 c2             	mov    %rax,%rdx
    3469:	eb ca                	jmp    3435 <__ia32_compat_sys_sendfile64+0x75>
    346b:	48 c7 c2 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rdx
    3472:	eb c1                	jmp    3435 <__ia32_compat_sys_sendfile64+0x75>
    3474:	e8 00 00 00 00       	callq  3479 <__ia32_compat_sys_sendfile64+0xb9>
    3479:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000003480 <__x32_compat_sys_sendfile>:
    3480:	e8 00 00 00 00       	callq  3485 <__x32_compat_sys_sendfile+0x5>
    3485:	55                   	push   %rbp
    3486:	48 89 e5             	mov    %rsp,%rbp
    3489:	41 54                	push   %r12
    348b:	53                   	push   %rbx
    348c:	48 83 ec 10          	sub    $0x10,%rsp
    3490:	4c 8b 67 60          	mov    0x60(%rdi),%r12
    3494:	48 8b 4f 38          	mov    0x38(%rdi),%rcx
    3498:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    349f:	00 00 
    34a1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    34a5:	31 c0                	xor    %eax,%eax
    34a7:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    34ab:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    34af:	4d 85 e4             	test   %r12,%r12
    34b2:	74 51                	je     3505 <__x32_compat_sys_sendfile+0x85>
    34b4:	4c 89 e0             	mov    %r12,%rax
    34b7:	e8 00 00 00 00       	callq  34bc <__x32_compat_sys_sendfile+0x3c>
    34bc:	85 c0                	test   %eax,%eax
    34be:	48 63 d2             	movslq %edx,%rdx
    34c1:	75 53                	jne    3516 <__x32_compat_sys_sendfile+0x96>
    34c3:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    34c7:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
    34cb:	89 c9                	mov    %ecx,%ecx
    34cd:	41 b8 ff ff ff 7f    	mov    $0x7fffffff,%r8d
    34d3:	e8 18 f9 ff ff       	callq  2df0 <do_sendfile>
    34d8:	4c 89 e1             	mov    %r12,%rcx
    34db:	48 89 c2             	mov    %rax,%rdx
    34de:	8b 45 e0             	mov    -0x20(%rbp),%eax
    34e1:	e8 00 00 00 00       	callq  34e6 <__x32_compat_sys_sendfile+0x66>
    34e6:	85 c0                	test   %eax,%eax
    34e8:	75 2c                	jne    3516 <__x32_compat_sys_sendfile+0x96>
    34ea:	48 8b 5d e8          	mov    -0x18(%rbp),%rbx
    34ee:	65 48 33 1c 25 28 00 	xor    %gs:0x28,%rbx
    34f5:	00 00 
    34f7:	48 89 d0             	mov    %rdx,%rax
    34fa:	75 23                	jne    351f <__x32_compat_sys_sendfile+0x9f>
    34fc:	48 83 c4 10          	add    $0x10,%rsp
    3500:	5b                   	pop    %rbx
    3501:	41 5c                	pop    %r12
    3503:	5d                   	pop    %rbp
    3504:	c3                   	retq   
    3505:	31 d2                	xor    %edx,%edx
    3507:	89 c9                	mov    %ecx,%ecx
    3509:	45 31 c0             	xor    %r8d,%r8d
    350c:	e8 df f8 ff ff       	callq  2df0 <do_sendfile>
    3511:	48 89 c2             	mov    %rax,%rdx
    3514:	eb d4                	jmp    34ea <__x32_compat_sys_sendfile+0x6a>
    3516:	48 c7 c2 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rdx
    351d:	eb cb                	jmp    34ea <__x32_compat_sys_sendfile+0x6a>
    351f:	e8 00 00 00 00       	callq  3524 <__x32_compat_sys_sendfile+0xa4>
    3524:	66 90                	xchg   %ax,%ax
    3526:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    352d:	00 00 00 

0000000000003530 <__x64_sys_sendfile>:
    3530:	e8 00 00 00 00       	callq  3535 <__x64_sys_sendfile+0x5>
    3535:	55                   	push   %rbp
    3536:	48 89 e5             	mov    %rsp,%rbp
    3539:	41 54                	push   %r12
    353b:	53                   	push   %rbx
    353c:	48 83 ec 10          	sub    $0x10,%rsp
    3540:	4c 8b 67 60          	mov    0x60(%rdi),%r12
    3544:	48 8b 4f 38          	mov    0x38(%rdi),%rcx
    3548:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    354f:	00 00 
    3551:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    3555:	31 c0                	xor    %eax,%eax
    3557:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    355b:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    355f:	4d 85 e4             	test   %r12,%r12
    3562:	74 4d                	je     35b1 <__x64_sys_sendfile+0x81>
    3564:	4c 89 e0             	mov    %r12,%rax
    3567:	e8 00 00 00 00       	callq  356c <__x64_sys_sendfile+0x3c>
    356c:	85 c0                	test   %eax,%eax
    356e:	75 50                	jne    35c0 <__x64_sys_sendfile+0x90>
    3570:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    3574:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
    3578:	41 b8 ff ff ff 7f    	mov    $0x7fffffff,%r8d
    357e:	e8 6d f8 ff ff       	callq  2df0 <do_sendfile>
    3583:	4c 89 e1             	mov    %r12,%rcx
    3586:	48 89 c2             	mov    %rax,%rdx
    3589:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    358d:	e8 00 00 00 00       	callq  3592 <__x64_sys_sendfile+0x62>
    3592:	85 c0                	test   %eax,%eax
    3594:	75 2a                	jne    35c0 <__x64_sys_sendfile+0x90>
    3596:	48 8b 5d e8          	mov    -0x18(%rbp),%rbx
    359a:	65 48 33 1c 25 28 00 	xor    %gs:0x28,%rbx
    35a1:	00 00 
    35a3:	48 89 d0             	mov    %rdx,%rax
    35a6:	75 21                	jne    35c9 <__x64_sys_sendfile+0x99>
    35a8:	48 83 c4 10          	add    $0x10,%rsp
    35ac:	5b                   	pop    %rbx
    35ad:	41 5c                	pop    %r12
    35af:	5d                   	pop    %rbp
    35b0:	c3                   	retq   
    35b1:	31 d2                	xor    %edx,%edx
    35b3:	45 31 c0             	xor    %r8d,%r8d
    35b6:	e8 35 f8 ff ff       	callq  2df0 <do_sendfile>
    35bb:	48 89 c2             	mov    %rax,%rdx
    35be:	eb d6                	jmp    3596 <__x64_sys_sendfile+0x66>
    35c0:	48 c7 c2 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rdx
    35c7:	eb cd                	jmp    3596 <__x64_sys_sendfile+0x66>
    35c9:	e8 00 00 00 00       	callq  35ce <__x64_sys_sendfile+0x9e>
    35ce:	66 90                	xchg   %ax,%ax

00000000000035d0 <__x64_sys_sendfile64>:
    35d0:	e8 00 00 00 00       	callq  35d5 <__x64_sys_sendfile64+0x5>
    35d5:	55                   	push   %rbp
    35d6:	48 89 e5             	mov    %rsp,%rbp
    35d9:	41 56                	push   %r14
    35db:	41 55                	push   %r13
    35dd:	41 54                	push   %r12
    35df:	53                   	push   %rbx
    35e0:	48 83 ec 10          	sub    $0x10,%rsp
    35e4:	4c 8b 67 60          	mov    0x60(%rdi),%r12
    35e8:	4c 8b 77 38          	mov    0x38(%rdi),%r14
    35ec:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    35f3:	00 00 
    35f5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    35f9:	31 c0                	xor    %eax,%eax
    35fb:	4c 8b 6f 68          	mov    0x68(%rdi),%r13
    35ff:	48 8b 5f 70          	mov    0x70(%rdi),%rbx
    3603:	4d 85 e4             	test   %r12,%r12
    3606:	74 5c                	je     3664 <__x64_sys_sendfile64+0x94>
    3608:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
    360c:	ba 08 00 00 00       	mov    $0x8,%edx
    3611:	4c 89 e6             	mov    %r12,%rsi
    3614:	e8 00 00 00 00       	callq  3619 <__x64_sys_sendfile64+0x49>
    3619:	48 85 c0             	test   %rax,%rax
    361c:	75 5d                	jne    367b <__x64_sys_sendfile64+0xab>
    361e:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
    3622:	4c 89 f1             	mov    %r14,%rcx
    3625:	45 31 c0             	xor    %r8d,%r8d
    3628:	44 89 ee             	mov    %r13d,%esi
    362b:	89 df                	mov    %ebx,%edi
    362d:	e8 be f7 ff ff       	callq  2df0 <do_sendfile>
    3632:	4c 89 e1             	mov    %r12,%rcx
    3635:	48 89 c2             	mov    %rax,%rdx
    3638:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    363c:	e8 00 00 00 00       	callq  3641 <__x64_sys_sendfile64+0x71>
    3641:	85 c0                	test   %eax,%eax
    3643:	75 36                	jne    367b <__x64_sys_sendfile64+0xab>
    3645:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
    3649:	65 48 33 34 25 28 00 	xor    %gs:0x28,%rsi
    3650:	00 00 
    3652:	48 89 d0             	mov    %rdx,%rax
    3655:	75 2d                	jne    3684 <__x64_sys_sendfile64+0xb4>
    3657:	48 83 c4 10          	add    $0x10,%rsp
    365b:	5b                   	pop    %rbx
    365c:	41 5c                	pop    %r12
    365e:	41 5d                	pop    %r13
    3660:	41 5e                	pop    %r14
    3662:	5d                   	pop    %rbp
    3663:	c3                   	retq   
    3664:	31 d2                	xor    %edx,%edx
    3666:	45 31 c0             	xor    %r8d,%r8d
    3669:	4c 89 f1             	mov    %r14,%rcx
    366c:	44 89 ee             	mov    %r13d,%esi
    366f:	89 df                	mov    %ebx,%edi
    3671:	e8 7a f7 ff ff       	callq  2df0 <do_sendfile>
    3676:	48 89 c2             	mov    %rax,%rdx
    3679:	eb ca                	jmp    3645 <__x64_sys_sendfile64+0x75>
    367b:	48 c7 c2 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rdx
    3682:	eb c1                	jmp    3645 <__x64_sys_sendfile64+0x75>
    3684:	e8 00 00 00 00       	callq  3689 <__x64_sys_sendfile64+0xb9>
    3689:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000003690 <__x32_compat_sys_sendfile64>:
    3690:	e8 00 00 00 00       	callq  3695 <__x32_compat_sys_sendfile64+0x5>
    3695:	55                   	push   %rbp
    3696:	48 89 e5             	mov    %rsp,%rbp
    3699:	41 56                	push   %r14
    369b:	41 55                	push   %r13
    369d:	41 54                	push   %r12
    369f:	53                   	push   %rbx
    36a0:	48 83 ec 10          	sub    $0x10,%rsp
    36a4:	4c 8b 67 60          	mov    0x60(%rdi),%r12
    36a8:	48 8b 5f 38          	mov    0x38(%rdi),%rbx
    36ac:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    36b3:	00 00 
    36b5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    36b9:	31 c0                	xor    %eax,%eax
    36bb:	4c 8b 77 68          	mov    0x68(%rdi),%r14
    36bf:	4c 8b 6f 70          	mov    0x70(%rdi),%r13
    36c3:	4d 85 e4             	test   %r12,%r12
    36c6:	74 5c                	je     3724 <__x32_compat_sys_sendfile64+0x94>
    36c8:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
    36cc:	ba 08 00 00 00       	mov    $0x8,%edx
    36d1:	4c 89 e6             	mov    %r12,%rsi
    36d4:	e8 00 00 00 00       	callq  36d9 <__x32_compat_sys_sendfile64+0x49>
    36d9:	48 85 c0             	test   %rax,%rax
    36dc:	75 5d                	jne    373b <__x32_compat_sys_sendfile64+0xab>
    36de:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
    36e2:	89 d9                	mov    %ebx,%ecx
    36e4:	45 31 c0             	xor    %r8d,%r8d
    36e7:	44 89 f6             	mov    %r14d,%esi
    36ea:	44 89 ef             	mov    %r13d,%edi
    36ed:	e8 fe f6 ff ff       	callq  2df0 <do_sendfile>
    36f2:	4c 89 e1             	mov    %r12,%rcx
    36f5:	48 89 c2             	mov    %rax,%rdx
    36f8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    36fc:	e8 00 00 00 00       	callq  3701 <__x32_compat_sys_sendfile64+0x71>
    3701:	85 c0                	test   %eax,%eax
    3703:	75 36                	jne    373b <__x32_compat_sys_sendfile64+0xab>
    3705:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
    3709:	65 48 33 34 25 28 00 	xor    %gs:0x28,%rsi
    3710:	00 00 
    3712:	48 89 d0             	mov    %rdx,%rax
    3715:	75 2d                	jne    3744 <__x32_compat_sys_sendfile64+0xb4>
    3717:	48 83 c4 10          	add    $0x10,%rsp
    371b:	5b                   	pop    %rbx
    371c:	41 5c                	pop    %r12
    371e:	41 5d                	pop    %r13
    3720:	41 5e                	pop    %r14
    3722:	5d                   	pop    %rbp
    3723:	c3                   	retq   
    3724:	31 d2                	xor    %edx,%edx
    3726:	89 d9                	mov    %ebx,%ecx
    3728:	45 31 c0             	xor    %r8d,%r8d
    372b:	44 89 f6             	mov    %r14d,%esi
    372e:	44 89 ef             	mov    %r13d,%edi
    3731:	e8 ba f6 ff ff       	callq  2df0 <do_sendfile>
    3736:	48 89 c2             	mov    %rax,%rdx
    3739:	eb ca                	jmp    3705 <__x32_compat_sys_sendfile64+0x75>
    373b:	48 c7 c2 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rdx
    3742:	eb c1                	jmp    3705 <__x32_compat_sys_sendfile64+0x75>
    3744:	e8 00 00 00 00       	callq  3749 <__x32_compat_sys_sendfile64+0xb9>
    3749:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000003750 <vfs_copy_file_range>:
    3750:	e8 00 00 00 00       	callq  3755 <vfs_copy_file_range+0x5>
    3755:	55                   	push   %rbp
    3756:	48 89 e5             	mov    %rsp,%rbp
    3759:	41 57                	push   %r15
    375b:	41 56                	push   %r14
    375d:	41 55                	push   %r13
    375f:	41 54                	push   %r12
    3761:	53                   	push   %rbx
    3762:	48 83 ec 38          	sub    $0x38,%rsp
    3766:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
    376a:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    376e:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    3775:	00 00 
    3777:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    377b:	31 c0                	xor    %eax,%eax
    377d:	45 85 c9             	test   %r9d,%r9d
    3780:	4c 89 45 a8          	mov    %r8,-0x58(%rbp)
    3784:	0f 85 d2 02 00 00    	jne    3a5c <vfs_copy_file_range+0x30c>
    378a:	4c 8d 45 a8          	lea    -0x58(%rbp),%r8
    378e:	49 89 fd             	mov    %rdi,%r13
    3791:	49 89 d4             	mov    %rdx,%r12
    3794:	e8 00 00 00 00       	callq  3799 <vfs_copy_file_range+0x49>
    3799:	48 63 d8             	movslq %eax,%rbx
    379c:	48 85 db             	test   %rbx,%rbx
    379f:	75 40                	jne    37e1 <vfs_copy_file_range+0x91>
    37a1:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    37a5:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
    37a9:	31 ff                	xor    %edi,%edi
    37ab:	4c 89 ee             	mov    %r13,%rsi
    37ae:	e8 00 00 00 00       	callq  37b3 <vfs_copy_file_range+0x63>
    37b3:	48 63 d8             	movslq %eax,%rbx
    37b6:	48 85 db             	test   %rbx,%rbx
    37b9:	75 26                	jne    37e1 <vfs_copy_file_range+0x91>
    37bb:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    37bf:	48 8d 55 b0          	lea    -0x50(%rbp),%rdx
    37c3:	4c 89 e6             	mov    %r12,%rsi
    37c6:	bf 01 00 00 00       	mov    $0x1,%edi
    37cb:	e8 00 00 00 00       	callq  37d0 <vfs_copy_file_range+0x80>
    37d0:	48 63 d8             	movslq %eax,%rbx
    37d3:	48 85 db             	test   %rbx,%rbx
    37d6:	75 09                	jne    37e1 <vfs_copy_file_range+0x91>
    37d8:	4c 8b 45 a8          	mov    -0x58(%rbp),%r8
    37dc:	4d 85 c0             	test   %r8,%r8
    37df:	75 25                	jne    3806 <vfs_copy_file_range+0xb6>
    37e1:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    37e5:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
    37ec:	00 00 
    37ee:	48 89 d8             	mov    %rbx,%rax
    37f1:	0f 85 78 02 00 00    	jne    3a6f <vfs_copy_file_range+0x31f>
    37f7:	48 83 c4 38          	add    $0x38,%rsp
    37fb:	5b                   	pop    %rbx
    37fc:	41 5c                	pop    %r12
    37fe:	41 5d                	pop    %r13
    3800:	41 5e                	pop    %r14
    3802:	41 5f                	pop    %r15
    3804:	5d                   	pop    %rbp
    3805:	c3                   	retq   
    3806:	49 8b 54 24 20       	mov    0x20(%r12),%rdx
    380b:	0f b7 02             	movzwl (%rdx),%eax
    380e:	66 25 00 f0          	and    $0xf000,%ax
    3812:	66 3d 00 80          	cmp    $0x8000,%ax
    3816:	0f 84 b2 01 00 00    	je     39ce <vfs_copy_file_range+0x27e>
    381c:	49 8b 45 28          	mov    0x28(%r13),%rax
    3820:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    3824:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
    3828:	48 8b 80 f0 00 00 00 	mov    0xf0(%rax),%rax
    382f:	48 85 c0             	test   %rax,%rax
    3832:	0f 84 0a 01 00 00    	je     3942 <vfs_copy_file_range+0x1f2>
    3838:	49 8b 7d 20          	mov    0x20(%r13),%rdi
    383c:	49 8b 54 24 20       	mov    0x20(%r12),%rdx
    3841:	48 8b 5a 28          	mov    0x28(%rdx),%rbx
    3845:	48 39 5f 28          	cmp    %rbx,0x28(%rdi)
    3849:	0f 85 f3 00 00 00    	jne    3942 <vfs_copy_file_range+0x1f2>
    384f:	49 81 f8 00 f0 ff 7f 	cmp    $0x7ffff000,%r8
    3856:	ba 00 f0 ff 7f       	mov    $0x7ffff000,%edx
    385b:	41 b9 02 00 00 00    	mov    $0x2,%r9d
    3861:	4c 0f 4f c2          	cmovg  %rdx,%r8
    3865:	4c 89 ef             	mov    %r13,%rdi
    3868:	4c 89 e2             	mov    %r12,%rdx
    386b:	e8 00 00 00 00       	callq  3870 <vfs_copy_file_range+0x120>
    3870:	48 85 c0             	test   %rax,%rax
    3873:	48 89 c3             	mov    %rax,%rbx
    3876:	0f 8e ba 00 00 00    	jle    3936 <vfs_copy_file_range+0x1e6>
    387c:	41 f6 45 47 04       	testb  $0x4,0x47(%r13)
    3881:	75 47                	jne    38ca <vfs_copy_file_range+0x17a>
    3883:	4d 8b 7d 20          	mov    0x20(%r13),%r15
    3887:	4d 8d 55 10          	lea    0x10(%r13),%r10
    388b:	41 be 01 00 00 40    	mov    $0x40000001,%r14d
    3891:	49 8b 7d 18          	mov    0x18(%r13),%rdi
    3895:	b9 01 00 00 00       	mov    $0x1,%ecx
    389a:	4c 89 d2             	mov    %r10,%rdx
    389d:	4c 89 55 a0          	mov    %r10,-0x60(%rbp)
    38a1:	41 0f b7 07          	movzwl (%r15),%eax
    38a5:	66 25 00 f0          	and    $0xf000,%ax
    38a9:	66 3d 00 40          	cmp    $0x4000,%ax
    38ad:	b8 01 00 00 00       	mov    $0x1,%eax
    38b2:	44 0f 45 f0          	cmovne %eax,%r14d
    38b6:	44 89 f6             	mov    %r14d,%esi
    38b9:	e8 00 00 00 00       	callq  38be <vfs_copy_file_range+0x16e>
    38be:	85 c0                	test   %eax,%eax
    38c0:	4c 8b 55 a0          	mov    -0x60(%rbp),%r10
    38c4:	0f 84 74 01 00 00    	je     3a3e <vfs_copy_file_range+0x2ee>
    38ca:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    38d1:	00 00 
    38d3:	48 01 98 a0 0b 00 00 	add    %rbx,0xba0(%rax)
    38da:	41 f6 44 24 47 04    	testb  $0x4,0x47(%r12)
    38e0:	75 42                	jne    3924 <vfs_copy_file_range+0x1d4>
    38e2:	4d 8b 74 24 20       	mov    0x20(%r12),%r14
    38e7:	41 bd 02 00 00 40    	mov    $0x40000002,%r13d
    38ed:	4d 8d 7c 24 10       	lea    0x10(%r12),%r15
    38f2:	49 8b 7c 24 18       	mov    0x18(%r12),%rdi
    38f7:	b9 01 00 00 00       	mov    $0x1,%ecx
    38fc:	4c 89 fa             	mov    %r15,%rdx
    38ff:	41 0f b7 06          	movzwl (%r14),%eax
    3903:	66 25 00 f0          	and    $0xf000,%ax
    3907:	66 3d 00 40          	cmp    $0x4000,%ax
    390b:	b8 02 00 00 00       	mov    $0x2,%eax
    3910:	44 0f 45 e8          	cmovne %eax,%r13d
    3914:	44 89 ee             	mov    %r13d,%esi
    3917:	e8 00 00 00 00       	callq  391c <vfs_copy_file_range+0x1cc>
    391c:	85 c0                	test   %eax,%eax
    391e:	0f 84 fc 00 00 00    	je     3a20 <vfs_copy_file_range+0x2d0>
    3924:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    392b:	00 00 
    392d:	48 01 98 a8 0b 00 00 	add    %rbx,0xba8(%rax)
    3934:	eb 56                	jmp    398c <vfs_copy_file_range+0x23c>
    3936:	4c 8b 45 a8          	mov    -0x58(%rbp),%r8
    393a:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    393e:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
    3942:	49 8b 44 24 28       	mov    0x28(%r12),%rax
    3947:	48 8b 80 e8 00 00 00 	mov    0xe8(%rax),%rax
    394e:	48 85 c0             	test   %rax,%rax
    3951:	0f 84 93 00 00 00    	je     39ea <vfs_copy_file_range+0x29a>
    3957:	49 8b 55 28          	mov    0x28(%r13),%rdx
    395b:	48 3b 82 e8 00 00 00 	cmp    0xe8(%rdx),%rax
    3962:	0f 85 82 00 00 00    	jne    39ea <vfs_copy_file_range+0x29a>
    3968:	45 31 c9             	xor    %r9d,%r9d
    396b:	4c 89 e2             	mov    %r12,%rdx
    396e:	4c 89 ef             	mov    %r13,%rdi
    3971:	e8 00 00 00 00       	callq  3976 <vfs_copy_file_range+0x226>
    3976:	48 89 c3             	mov    %rax,%rbx
    3979:	48 83 fb a1          	cmp    $0xffffffffffffffa1,%rbx
    397d:	0f 84 e5 00 00 00    	je     3a68 <vfs_copy_file_range+0x318>
    3983:	48 85 db             	test   %rbx,%rbx
    3986:	0f 8f f0 fe ff ff    	jg     387c <vfs_copy_file_range+0x12c>
    398c:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    3993:	00 00 
    3995:	48 83 80 b0 0b 00 00 	addq   $0x1,0xbb0(%rax)
    399c:	01 
    399d:	48 83 80 b8 0b 00 00 	addq   $0x1,0xbb8(%rax)
    39a4:	01 
    39a5:	49 8b 54 24 20       	mov    0x20(%r12),%rdx
    39aa:	0f b7 02             	movzwl (%rdx),%eax
    39ad:	66 25 00 f0          	and    $0xf000,%ax
    39b1:	66 3d 00 80          	cmp    $0x8000,%ax
    39b5:	0f 85 26 fe ff ff    	jne    37e1 <vfs_copy_file_range+0x91>
    39bb:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
    39bf:	be 01 00 00 00       	mov    $0x1,%esi
    39c4:	e8 00 00 00 00       	callq  39c9 <vfs_copy_file_range+0x279>
    39c9:	e9 13 fe ff ff       	jmpq   37e1 <vfs_copy_file_range+0x91>
    39ce:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
    39d2:	be 01 00 00 00       	mov    $0x1,%esi
    39d7:	ba 01 00 00 00       	mov    $0x1,%edx
    39dc:	e8 00 00 00 00       	callq  39e1 <vfs_copy_file_range+0x291>
    39e1:	4c 8b 45 a8          	mov    -0x58(%rbp),%r8
    39e5:	e9 32 fe ff ff       	jmpq   381c <vfs_copy_file_range+0xcc>
    39ea:	49 81 f8 00 f0 ff 7f 	cmp    $0x7ffff000,%r8
    39f1:	48 89 75 c8          	mov    %rsi,-0x38(%rbp)
    39f5:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    39f9:	b8 00 f0 ff 7f       	mov    $0x7ffff000,%eax
    39fe:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
    3a02:	48 8d 75 c8          	lea    -0x38(%rbp),%rsi
    3a06:	4c 0f 47 c0          	cmova  %rax,%r8
    3a0a:	4c 89 e2             	mov    %r12,%rdx
    3a0d:	45 31 c9             	xor    %r9d,%r9d
    3a10:	4c 89 ef             	mov    %r13,%rdi
    3a13:	e8 00 00 00 00       	callq  3a18 <vfs_copy_file_range+0x2c8>
    3a18:	48 89 c3             	mov    %rax,%rbx
    3a1b:	e9 59 ff ff ff       	jmpq   3979 <vfs_copy_file_range+0x229>
    3a20:	45 31 c9             	xor    %r9d,%r9d
    3a23:	45 31 c0             	xor    %r8d,%r8d
    3a26:	b9 01 00 00 00       	mov    $0x1,%ecx
    3a2b:	4c 89 fa             	mov    %r15,%rdx
    3a2e:	44 89 ee             	mov    %r13d,%esi
    3a31:	4c 89 f7             	mov    %r14,%rdi
    3a34:	e8 00 00 00 00       	callq  3a39 <vfs_copy_file_range+0x2e9>
    3a39:	e9 e6 fe ff ff       	jmpq   3924 <vfs_copy_file_range+0x1d4>
    3a3e:	45 31 c9             	xor    %r9d,%r9d
    3a41:	45 31 c0             	xor    %r8d,%r8d
    3a44:	b9 01 00 00 00       	mov    $0x1,%ecx
    3a49:	4c 89 d2             	mov    %r10,%rdx
    3a4c:	44 89 f6             	mov    %r14d,%esi
    3a4f:	4c 89 ff             	mov    %r15,%rdi
    3a52:	e8 00 00 00 00       	callq  3a57 <vfs_copy_file_range+0x307>
    3a57:	e9 6e fe ff ff       	jmpq   38ca <vfs_copy_file_range+0x17a>
    3a5c:	48 c7 c3 ea ff ff ff 	mov    $0xffffffffffffffea,%rbx
    3a63:	e9 79 fd ff ff       	jmpq   37e1 <vfs_copy_file_range+0x91>
    3a68:	0f 0b                	ud2    
    3a6a:	e9 1d ff ff ff       	jmpq   398c <vfs_copy_file_range+0x23c>
    3a6f:	e8 00 00 00 00       	callq  3a74 <vfs_copy_file_range+0x324>
    3a74:	66 90                	xchg   %ax,%ax
    3a76:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3a7d:	00 00 00 

0000000000003a80 <__ia32_sys_copy_file_range>:
    3a80:	e8 00 00 00 00       	callq  3a85 <__ia32_sys_copy_file_range+0x5>
    3a85:	55                   	push   %rbp
    3a86:	48 89 e5             	mov    %rsp,%rbp
    3a89:	41 57                	push   %r15
    3a8b:	41 56                	push   %r14
    3a8d:	41 55                	push   %r13
    3a8f:	41 54                	push   %r12
    3a91:	53                   	push   %rbx
    3a92:	48 83 ec 38          	sub    $0x38,%rsp
    3a96:	4c 8b 67 60          	mov    0x60(%rdi),%r12
    3a9a:	4c 8b 6f 58          	mov    0x58(%rdi),%r13
    3a9e:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    3aa5:	00 00 
    3aa7:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3aab:	31 c0                	xor    %eax,%eax
    3aad:	48 8b 47 20          	mov    0x20(%rdi),%rax
    3ab1:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    3ab5:	48 8b 47 70          	mov    0x70(%rdi),%rax
    3ab9:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    3abd:	48 8b 47 68          	mov    0x68(%rdi),%rax
    3ac1:	48 8b 7f 28          	mov    0x28(%rdi),%rdi
    3ac5:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    3ac9:	e8 00 00 00 00       	callq  3ace <__ia32_sys_copy_file_range+0x4e>
    3ace:	49 89 c6             	mov    %rax,%r14
    3ad1:	49 83 e6 fc          	and    $0xfffffffffffffffc,%r14
    3ad5:	0f 84 57 01 00 00    	je     3c32 <__ia32_sys_copy_file_range+0x1b2>
    3adb:	44 89 e7             	mov    %r12d,%edi
    3ade:	48 89 c3             	mov    %rax,%rbx
    3ae1:	49 c7 c7 f7 ff ff ff 	mov    $0xfffffffffffffff7,%r15
    3ae8:	e8 00 00 00 00       	callq  3aed <__ia32_sys_copy_file_range+0x6d>
    3aed:	49 89 c4             	mov    %rax,%r12
    3af0:	48 83 e0 fc          	and    $0xfffffffffffffffc,%rax
    3af4:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    3af8:	74 32                	je     3b2c <__ia32_sys_copy_file_range+0xac>
    3afa:	41 83 e5 ff          	and    $0xffffffff,%r13d
    3afe:	74 5e                	je     3b5e <__ia32_sys_copy_file_range+0xde>
    3b00:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
    3b04:	ba 08 00 00 00       	mov    $0x8,%edx
    3b09:	4c 89 ee             	mov    %r13,%rsi
    3b0c:	e8 00 00 00 00       	callq  3b11 <__ia32_sys_copy_file_range+0x91>
    3b11:	48 85 c0             	test   %rax,%rax
    3b14:	74 50                	je     3b66 <__ia32_sys_copy_file_range+0xe6>
    3b16:	49 c7 c7 f2 ff ff ff 	mov    $0xfffffffffffffff2,%r15
    3b1d:	41 83 e4 01          	and    $0x1,%r12d
    3b21:	74 09                	je     3b2c <__ia32_sys_copy_file_range+0xac>
    3b23:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
    3b27:	e8 00 00 00 00       	callq  3b2c <__ia32_sys_copy_file_range+0xac>
    3b2c:	83 e3 01             	and    $0x1,%ebx
    3b2f:	74 08                	je     3b39 <__ia32_sys_copy_file_range+0xb9>
    3b31:	4c 89 f7             	mov    %r14,%rdi
    3b34:	e8 00 00 00 00       	callq  3b39 <__ia32_sys_copy_file_range+0xb9>
    3b39:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    3b3d:	65 48 33 14 25 28 00 	xor    %gs:0x28,%rdx
    3b44:	00 00 
    3b46:	4c 89 f8             	mov    %r15,%rax
    3b49:	0f 85 ef 00 00 00    	jne    3c3e <__ia32_sys_copy_file_range+0x1be>
    3b4f:	48 83 c4 38          	add    $0x38,%rsp
    3b53:	5b                   	pop    %rbx
    3b54:	41 5c                	pop    %r12
    3b56:	41 5d                	pop    %r13
    3b58:	41 5e                	pop    %r14
    3b5a:	41 5f                	pop    %r15
    3b5c:	5d                   	pop    %rbp
    3b5d:	c3                   	retq   
    3b5e:	49 8b 46 68          	mov    0x68(%r14),%rax
    3b62:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    3b66:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    3b6a:	83 e6 ff             	and    $0xffffffff,%esi
    3b6d:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
    3b71:	74 19                	je     3b8c <__ia32_sys_copy_file_range+0x10c>
    3b73:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
    3b77:	ba 08 00 00 00       	mov    $0x8,%edx
    3b7c:	e8 00 00 00 00       	callq  3b81 <__ia32_sys_copy_file_range+0x101>
    3b81:	48 85 c0             	test   %rax,%rax
    3b84:	75 90                	jne    3b16 <__ia32_sys_copy_file_range+0x96>
    3b86:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    3b8a:	eb 0c                	jmp    3b98 <__ia32_sys_copy_file_range+0x118>
    3b8c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    3b90:	48 8b 48 68          	mov    0x68(%rax),%rcx
    3b94:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    3b98:	44 8b 45 a0          	mov    -0x60(%rbp),%r8d
    3b9c:	44 8b 4d a8          	mov    -0x58(%rbp),%r9d
    3ba0:	4c 89 f7             	mov    %r14,%rdi
    3ba3:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
    3ba7:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
    3bab:	e8 00 00 00 00       	callq  3bb0 <__ia32_sys_copy_file_range+0x130>
    3bb0:	48 85 c0             	test   %rax,%rax
    3bb3:	49 89 c7             	mov    %rax,%r15
    3bb6:	0f 8e 61 ff ff ff    	jle    3b1d <__ia32_sys_copy_file_range+0x9d>
    3bbc:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    3bc0:	4c 01 7d c8          	add    %r15,-0x38(%rbp)
    3bc4:	4c 01 f8             	add    %r15,%rax
    3bc7:	4d 85 ed             	test   %r13,%r13
    3bca:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    3bce:	74 44                	je     3c14 <__ia32_sys_copy_file_range+0x194>
    3bd0:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
    3bd4:	4c 89 ef             	mov    %r13,%rdi
    3bd7:	ba 08 00 00 00       	mov    $0x8,%edx
    3bdc:	e8 00 00 00 00       	callq  3be1 <__ia32_sys_copy_file_range+0x161>
    3be1:	48 8b 7d b0          	mov    -0x50(%rbp),%rdi
    3be5:	48 85 c0             	test   %rax,%rax
    3be8:	48 c7 c0 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rax
    3bef:	4c 0f 45 f8          	cmovne %rax,%r15
    3bf3:	48 85 ff             	test   %rdi,%rdi
    3bf6:	74 29                	je     3c21 <__ia32_sys_copy_file_range+0x1a1>
    3bf8:	48 8d 75 c8          	lea    -0x38(%rbp),%rsi
    3bfc:	ba 08 00 00 00       	mov    $0x8,%edx
    3c01:	e8 00 00 00 00       	callq  3c06 <__ia32_sys_copy_file_range+0x186>
    3c06:	48 85 c0             	test   %rax,%rax
    3c09:	0f 84 0e ff ff ff    	je     3b1d <__ia32_sys_copy_file_range+0x9d>
    3c0f:	e9 02 ff ff ff       	jmpq   3b16 <__ia32_sys_copy_file_range+0x96>
    3c14:	48 8b 7d b0          	mov    -0x50(%rbp),%rdi
    3c18:	49 89 46 68          	mov    %rax,0x68(%r14)
    3c1c:	48 85 ff             	test   %rdi,%rdi
    3c1f:	75 d7                	jne    3bf8 <__ia32_sys_copy_file_range+0x178>
    3c21:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3c25:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    3c29:	48 89 41 68          	mov    %rax,0x68(%rcx)
    3c2d:	e9 eb fe ff ff       	jmpq   3b1d <__ia32_sys_copy_file_range+0x9d>
    3c32:	49 c7 c7 f7 ff ff ff 	mov    $0xfffffffffffffff7,%r15
    3c39:	e9 fb fe ff ff       	jmpq   3b39 <__ia32_sys_copy_file_range+0xb9>
    3c3e:	e8 00 00 00 00       	callq  3c43 <__ia32_sys_copy_file_range+0x1c3>
    3c43:	0f 1f 00             	nopl   (%rax)
    3c46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3c4d:	00 00 00 

0000000000003c50 <__x64_sys_copy_file_range>:
    3c50:	e8 00 00 00 00       	callq  3c55 <__x64_sys_copy_file_range+0x5>
    3c55:	55                   	push   %rbp
    3c56:	48 89 e5             	mov    %rsp,%rbp
    3c59:	41 57                	push   %r15
    3c5b:	41 56                	push   %r14
    3c5d:	41 55                	push   %r13
    3c5f:	41 54                	push   %r12
    3c61:	53                   	push   %rbx
    3c62:	48 83 ec 30          	sub    $0x30,%rsp
    3c66:	4c 8b 7f 38          	mov    0x38(%rdi),%r15
    3c6a:	4c 8b 67 60          	mov    0x60(%rdi),%r12
    3c6e:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    3c75:	00 00 
    3c77:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3c7b:	31 c0                	xor    %eax,%eax
    3c7d:	48 8b 47 40          	mov    0x40(%rdi),%rax
    3c81:	4c 8b 6f 68          	mov    0x68(%rdi),%r13
    3c85:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    3c89:	48 8b 47 48          	mov    0x48(%rdi),%rax
    3c8d:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    3c91:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    3c95:	e8 00 00 00 00       	callq  3c9a <__x64_sys_copy_file_range+0x4a>
    3c9a:	49 89 c6             	mov    %rax,%r14
    3c9d:	49 83 e6 fc          	and    $0xfffffffffffffffc,%r14
    3ca1:	0f 84 6c 01 00 00    	je     3e13 <__x64_sys_copy_file_range+0x1c3>
    3ca7:	44 89 e7             	mov    %r12d,%edi
    3caa:	48 89 c3             	mov    %rax,%rbx
    3cad:	e8 00 00 00 00       	callq  3cb2 <__x64_sys_copy_file_range+0x62>
    3cb2:	49 89 c4             	mov    %rax,%r12
    3cb5:	48 83 e0 fc          	and    $0xfffffffffffffffc,%rax
    3cb9:	48 c7 c1 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rcx
    3cc0:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    3cc4:	74 39                	je     3cff <__x64_sys_copy_file_range+0xaf>
    3cc6:	4d 85 ed             	test   %r13,%r13
    3cc9:	74 6e                	je     3d39 <__x64_sys_copy_file_range+0xe9>
    3ccb:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
    3ccf:	ba 08 00 00 00       	mov    $0x8,%edx
    3cd4:	4c 89 ee             	mov    %r13,%rsi
    3cd7:	e8 00 00 00 00       	callq  3cdc <__x64_sys_copy_file_range+0x8c>
    3cdc:	48 85 c0             	test   %rax,%rax
    3cdf:	74 60                	je     3d41 <__x64_sys_copy_file_range+0xf1>
    3ce1:	48 c7 c1 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rcx
    3ce8:	41 83 e4 01          	and    $0x1,%r12d
    3cec:	74 11                	je     3cff <__x64_sys_copy_file_range+0xaf>
    3cee:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
    3cf2:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    3cf6:	e8 00 00 00 00       	callq  3cfb <__x64_sys_copy_file_range+0xab>
    3cfb:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    3cff:	83 e3 01             	and    $0x1,%ebx
    3d02:	74 10                	je     3d14 <__x64_sys_copy_file_range+0xc4>
    3d04:	4c 89 f7             	mov    %r14,%rdi
    3d07:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
    3d0b:	e8 00 00 00 00       	callq  3d10 <__x64_sys_copy_file_range+0xc0>
    3d10:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    3d14:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    3d18:	65 48 33 14 25 28 00 	xor    %gs:0x28,%rdx
    3d1f:	00 00 
    3d21:	48 89 c8             	mov    %rcx,%rax
    3d24:	0f 85 f5 00 00 00    	jne    3e1f <__x64_sys_copy_file_range+0x1cf>
    3d2a:	48 83 c4 30          	add    $0x30,%rsp
    3d2e:	5b                   	pop    %rbx
    3d2f:	41 5c                	pop    %r12
    3d31:	41 5d                	pop    %r13
    3d33:	41 5e                	pop    %r14
    3d35:	41 5f                	pop    %r15
    3d37:	5d                   	pop    %rbp
    3d38:	c3                   	retq   
    3d39:	49 8b 46 68          	mov    0x68(%r14),%rax
    3d3d:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    3d41:	4d 85 ff             	test   %r15,%r15
    3d44:	74 1c                	je     3d62 <__x64_sys_copy_file_range+0x112>
    3d46:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
    3d4a:	ba 08 00 00 00       	mov    $0x8,%edx
    3d4f:	4c 89 fe             	mov    %r15,%rsi
    3d52:	e8 00 00 00 00       	callq  3d57 <__x64_sys_copy_file_range+0x107>
    3d57:	48 85 c0             	test   %rax,%rax
    3d5a:	75 85                	jne    3ce1 <__x64_sys_copy_file_range+0x91>
    3d5c:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    3d60:	eb 0c                	jmp    3d6e <__x64_sys_copy_file_range+0x11e>
    3d62:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    3d66:	48 8b 48 68          	mov    0x68(%rax),%rcx
    3d6a:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    3d6e:	44 8b 4d b0          	mov    -0x50(%rbp),%r9d
    3d72:	4c 8b 45 a8          	mov    -0x58(%rbp),%r8
    3d76:	4c 89 f7             	mov    %r14,%rdi
    3d79:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
    3d7d:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
    3d81:	e8 00 00 00 00       	callq  3d86 <__x64_sys_copy_file_range+0x136>
    3d86:	48 85 c0             	test   %rax,%rax
    3d89:	48 89 c1             	mov    %rax,%rcx
    3d8c:	0f 8e 56 ff ff ff    	jle    3ce8 <__x64_sys_copy_file_range+0x98>
    3d92:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    3d96:	48 01 4d c8          	add    %rcx,-0x38(%rbp)
    3d9a:	48 01 c8             	add    %rcx,%rax
    3d9d:	4d 85 ed             	test   %r13,%r13
    3da0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    3da4:	74 53                	je     3df9 <__x64_sys_copy_file_range+0x1a9>
    3da6:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
    3daa:	ba 08 00 00 00       	mov    $0x8,%edx
    3daf:	4c 89 ef             	mov    %r13,%rdi
    3db2:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    3db6:	e8 00 00 00 00       	callq  3dbb <__x64_sys_copy_file_range+0x16b>
    3dbb:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    3dbf:	48 85 c0             	test   %rax,%rax
    3dc2:	48 c7 c0 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rax
    3dc9:	48 0f 45 c8          	cmovne %rax,%rcx
    3dcd:	4d 85 ff             	test   %r15,%r15
    3dd0:	74 30                	je     3e02 <__x64_sys_copy_file_range+0x1b2>
    3dd2:	48 8d 75 c8          	lea    -0x38(%rbp),%rsi
    3dd6:	ba 08 00 00 00       	mov    $0x8,%edx
    3ddb:	4c 89 ff             	mov    %r15,%rdi
    3dde:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    3de2:	e8 00 00 00 00       	callq  3de7 <__x64_sys_copy_file_range+0x197>
    3de7:	48 85 c0             	test   %rax,%rax
    3dea:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    3dee:	0f 84 f4 fe ff ff    	je     3ce8 <__x64_sys_copy_file_range+0x98>
    3df4:	e9 e8 fe ff ff       	jmpq   3ce1 <__x64_sys_copy_file_range+0x91>
    3df9:	4d 85 ff             	test   %r15,%r15
    3dfc:	49 89 46 68          	mov    %rax,0x68(%r14)
    3e00:	75 d0                	jne    3dd2 <__x64_sys_copy_file_range+0x182>
    3e02:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3e06:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
    3e0a:	48 89 46 68          	mov    %rax,0x68(%rsi)
    3e0e:	e9 d5 fe ff ff       	jmpq   3ce8 <__x64_sys_copy_file_range+0x98>
    3e13:	48 c7 c1 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rcx
    3e1a:	e9 f5 fe ff ff       	jmpq   3d14 <__x64_sys_copy_file_range+0xc4>
    3e1f:	e8 00 00 00 00       	callq  3e24 <__x64_sys_copy_file_range+0x1d4>
    3e24:	66 90                	xchg   %ax,%ax
    3e26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3e2d:	00 00 00 

0000000000003e30 <__vfs_read>:
    3e30:	e8 00 00 00 00       	callq  3e35 <__vfs_read+0x5>
    3e35:	4c 8b 47 28          	mov    0x28(%rdi),%r8
    3e39:	55                   	push   %rbp
    3e3a:	48 89 e5             	mov    %rsp,%rbp
    3e3d:	49 8b 40 10          	mov    0x10(%r8),%rax
    3e41:	48 85 c0             	test   %rax,%rax
    3e44:	74 07                	je     3e4d <__vfs_read+0x1d>
    3e46:	e8 00 00 00 00       	callq  3e4b <__vfs_read+0x1b>
    3e4b:	5d                   	pop    %rbp
    3e4c:	c3                   	retq   
    3e4d:	49 83 78 20 00       	cmpq   $0x0,0x20(%r8)
    3e52:	74 07                	je     3e5b <__vfs_read+0x2b>
    3e54:	e8 d7 cc ff ff       	callq  b30 <new_sync_read>
    3e59:	5d                   	pop    %rbp
    3e5a:	c3                   	retq   
    3e5b:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
    3e62:	5d                   	pop    %rbp
    3e63:	c3                   	retq   
    3e64:	66 90                	xchg   %ax,%ax
    3e66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3e6d:	00 00 00 

0000000000003e70 <vfs_read>:
    3e70:	e8 00 00 00 00       	callq  3e75 <vfs_read+0x5>
    3e75:	55                   	push   %rbp
    3e76:	48 89 e5             	mov    %rsp,%rbp
    3e79:	41 57                	push   %r15
    3e7b:	41 56                	push   %r14
    3e7d:	41 55                	push   %r13
    3e7f:	41 54                	push   %r12
    3e81:	53                   	push   %rbx
    3e82:	8b 47 44             	mov    0x44(%rdi),%eax
    3e85:	a8 01                	test   $0x1,%al
    3e87:	0f 84 03 01 00 00    	je     3f90 <vfs_read+0x120>
    3e8d:	a9 00 00 02 00       	test   $0x20000,%eax
    3e92:	0f 84 04 01 00 00    	je     3f9c <vfs_read+0x12c>
    3e98:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    3e9f:	00 00 
    3ea1:	4c 8b 80 50 13 00 00 	mov    0x1350(%rax),%r8
    3ea8:	48 89 f0             	mov    %rsi,%rax
    3eab:	49 c7 c4 f2 ff ff ff 	mov    $0xfffffffffffffff2,%r12
    3eb2:	48 01 d0             	add    %rdx,%rax
    3eb5:	72 60                	jb     3f17 <vfs_read+0xa7>
    3eb7:	49 39 c0             	cmp    %rax,%r8
    3eba:	72 5b                	jb     3f17 <vfs_read+0xa7>
    3ebc:	49 89 cf             	mov    %rcx,%r15
    3ebf:	48 89 d3             	mov    %rdx,%rbx
    3ec2:	48 89 d1             	mov    %rdx,%rcx
    3ec5:	49 89 f6             	mov    %rsi,%r14
    3ec8:	49 89 fd             	mov    %rdi,%r13
    3ecb:	48 89 fe             	mov    %rdi,%rsi
    3ece:	4c 89 fa             	mov    %r15,%rdx
    3ed1:	31 ff                	xor    %edi,%edi
    3ed3:	e8 00 00 00 00       	callq  3ed8 <vfs_read+0x68>
    3ed8:	4c 63 e0             	movslq %eax,%r12
    3edb:	4d 85 e4             	test   %r12,%r12
    3ede:	75 37                	jne    3f17 <vfs_read+0xa7>
    3ee0:	48 81 fb 00 f0 ff 7f 	cmp    $0x7ffff000,%rbx
    3ee7:	ba 00 f0 ff 7f       	mov    $0x7ffff000,%edx
    3eec:	4c 89 f9             	mov    %r15,%rcx
    3eef:	48 0f 46 d3          	cmovbe %rbx,%rdx
    3ef3:	4c 89 f6             	mov    %r14,%rsi
    3ef6:	4c 89 ef             	mov    %r13,%rdi
    3ef9:	e8 00 00 00 00       	callq  3efe <vfs_read+0x8e>
    3efe:	48 85 c0             	test   %rax,%rax
    3f01:	49 89 c4             	mov    %rax,%r12
    3f04:	7f 1f                	jg     3f25 <vfs_read+0xb5>
    3f06:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    3f0d:	00 00 
    3f0f:	48 83 80 b0 0b 00 00 	addq   $0x1,0xbb0(%rax)
    3f16:	01 
    3f17:	5b                   	pop    %rbx
    3f18:	4c 89 e0             	mov    %r12,%rax
    3f1b:	41 5c                	pop    %r12
    3f1d:	41 5d                	pop    %r13
    3f1f:	41 5e                	pop    %r14
    3f21:	41 5f                	pop    %r15
    3f23:	5d                   	pop    %rbp
    3f24:	c3                   	retq   
    3f25:	41 f6 45 47 04       	testb  $0x4,0x47(%r13)
    3f2a:	75 38                	jne    3f64 <vfs_read+0xf4>
    3f2c:	4d 8b 75 20          	mov    0x20(%r13),%r14
    3f30:	bb 01 00 00 00       	mov    $0x1,%ebx
    3f35:	4d 8d 7d 10          	lea    0x10(%r13),%r15
    3f39:	49 8b 7d 18          	mov    0x18(%r13),%rdi
    3f3d:	b9 01 00 00 00       	mov    $0x1,%ecx
    3f42:	4c 89 fa             	mov    %r15,%rdx
    3f45:	41 0f b7 06          	movzwl (%r14),%eax
    3f49:	66 25 00 f0          	and    $0xf000,%ax
    3f4d:	66 3d 00 40          	cmp    $0x4000,%ax
    3f51:	b8 01 00 00 40       	mov    $0x40000001,%eax
    3f56:	0f 44 d8             	cmove  %eax,%ebx
    3f59:	89 de                	mov    %ebx,%esi
    3f5b:	e8 00 00 00 00       	callq  3f60 <vfs_read+0xf0>
    3f60:	85 c0                	test   %eax,%eax
    3f62:	74 12                	je     3f76 <vfs_read+0x106>
    3f64:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    3f6b:	00 00 
    3f6d:	4c 01 a0 a0 0b 00 00 	add    %r12,0xba0(%rax)
    3f74:	eb 90                	jmp    3f06 <vfs_read+0x96>
    3f76:	45 31 c9             	xor    %r9d,%r9d
    3f79:	45 31 c0             	xor    %r8d,%r8d
    3f7c:	b9 01 00 00 00       	mov    $0x1,%ecx
    3f81:	4c 89 fa             	mov    %r15,%rdx
    3f84:	89 de                	mov    %ebx,%esi
    3f86:	4c 89 f7             	mov    %r14,%rdi
    3f89:	e8 00 00 00 00       	callq  3f8e <vfs_read+0x11e>
    3f8e:	eb d4                	jmp    3f64 <vfs_read+0xf4>
    3f90:	49 c7 c4 f7 ff ff ff 	mov    $0xfffffffffffffff7,%r12
    3f97:	e9 7b ff ff ff       	jmpq   3f17 <vfs_read+0xa7>
    3f9c:	49 c7 c4 ea ff ff ff 	mov    $0xffffffffffffffea,%r12
    3fa3:	e9 6f ff ff ff       	jmpq   3f17 <vfs_read+0xa7>
    3fa8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    3faf:	00 

0000000000003fb0 <kernel_read>:
    3fb0:	e8 00 00 00 00       	callq  3fb5 <kernel_read+0x5>
    3fb5:	55                   	push   %rbp
    3fb6:	48 89 e5             	mov    %rsp,%rbp
    3fb9:	41 54                	push   %r12
    3fbb:	53                   	push   %rbx
    3fbc:	65 48 8b 1c 25 00 00 	mov    %gs:0x0,%rbx
    3fc3:	00 00 
    3fc5:	4c 8b a3 50 13 00 00 	mov    0x1350(%rbx),%r12
    3fcc:	48 c7 83 50 13 00 00 	movq   $0xffffffffffffffff,0x1350(%rbx)
    3fd3:	ff ff ff ff 
    3fd7:	f0 80 4b 03 80       	lock orb $0x80,0x3(%rbx)
    3fdc:	e8 00 00 00 00       	callq  3fe1 <kernel_read+0x31>
    3fe1:	4c 89 a3 50 13 00 00 	mov    %r12,0x1350(%rbx)
    3fe8:	f0 80 4b 03 80       	lock orb $0x80,0x3(%rbx)
    3fed:	5b                   	pop    %rbx
    3fee:	41 5c                	pop    %r12
    3ff0:	5d                   	pop    %rbp
    3ff1:	c3                   	retq   
    3ff2:	0f 1f 40 00          	nopl   0x0(%rax)
    3ff6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3ffd:	00 00 00 

0000000000004000 <vfs_write>:
    4000:	e8 00 00 00 00       	callq  4005 <vfs_write+0x5>
    4005:	55                   	push   %rbp
    4006:	48 89 e5             	mov    %rsp,%rbp
    4009:	41 57                	push   %r15
    400b:	41 56                	push   %r14
    400d:	41 55                	push   %r13
    400f:	41 54                	push   %r12
    4011:	53                   	push   %rbx
    4012:	8b 47 44             	mov    0x44(%rdi),%eax
    4015:	a8 02                	test   $0x2,%al
    4017:	0f 84 6f 01 00 00    	je     418c <vfs_write+0x18c>
    401d:	a9 00 00 04 00       	test   $0x40000,%eax
    4022:	0f 84 70 01 00 00    	je     4198 <vfs_write+0x198>
    4028:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    402f:	00 00 
    4031:	4c 8b 80 50 13 00 00 	mov    0x1350(%rax),%r8
    4038:	48 89 f0             	mov    %rsi,%rax
    403b:	49 c7 c4 f2 ff ff ff 	mov    $0xfffffffffffffff2,%r12
    4042:	48 01 d0             	add    %rdx,%rax
    4045:	0f 82 90 00 00 00    	jb     40db <vfs_write+0xdb>
    404b:	49 39 c0             	cmp    %rax,%r8
    404e:	0f 82 87 00 00 00    	jb     40db <vfs_write+0xdb>
    4054:	49 89 cd             	mov    %rcx,%r13
    4057:	48 89 d3             	mov    %rdx,%rbx
    405a:	48 89 d1             	mov    %rdx,%rcx
    405d:	49 89 f6             	mov    %rsi,%r14
    4060:	49 89 ff             	mov    %rdi,%r15
    4063:	48 89 fe             	mov    %rdi,%rsi
    4066:	4c 89 ea             	mov    %r13,%rdx
    4069:	bf 01 00 00 00       	mov    $0x1,%edi
    406e:	e8 00 00 00 00       	callq  4073 <vfs_write+0x73>
    4073:	4c 63 e0             	movslq %eax,%r12
    4076:	4d 85 e4             	test   %r12,%r12
    4079:	75 60                	jne    40db <vfs_write+0xdb>
    407b:	48 81 fb 00 f0 ff 7f 	cmp    $0x7ffff000,%rbx
    4082:	ba 00 f0 ff 7f       	mov    $0x7ffff000,%edx
    4087:	48 0f 47 da          	cmova  %rdx,%rbx
    408b:	49 8b 57 20          	mov    0x20(%r15),%rdx
    408f:	0f b7 02             	movzwl (%rdx),%eax
    4092:	66 25 00 f0          	and    $0xf000,%ax
    4096:	66 3d 00 80          	cmp    $0x8000,%ax
    409a:	0f 84 ba 00 00 00    	je     415a <vfs_write+0x15a>
    40a0:	4c 89 e9             	mov    %r13,%rcx
    40a3:	48 89 da             	mov    %rbx,%rdx
    40a6:	4c 89 f6             	mov    %r14,%rsi
    40a9:	4c 89 ff             	mov    %r15,%rdi
    40ac:	e8 ef cd ff ff       	callq  ea0 <__vfs_write>
    40b1:	48 85 c0             	test   %rax,%rax
    40b4:	49 89 c4             	mov    %rax,%r12
    40b7:	7f 30                	jg     40e9 <vfs_write+0xe9>
    40b9:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    40c0:	00 00 
    40c2:	48 83 80 b8 0b 00 00 	addq   $0x1,0xbb8(%rax)
    40c9:	01 
    40ca:	49 8b 57 20          	mov    0x20(%r15),%rdx
    40ce:	0f b7 02             	movzwl (%rdx),%eax
    40d1:	66 25 00 f0          	and    $0xf000,%ax
    40d5:	66 3d 00 80          	cmp    $0x8000,%ax
    40d9:	74 63                	je     413e <vfs_write+0x13e>
    40db:	5b                   	pop    %rbx
    40dc:	4c 89 e0             	mov    %r12,%rax
    40df:	41 5c                	pop    %r12
    40e1:	41 5d                	pop    %r13
    40e3:	41 5e                	pop    %r14
    40e5:	41 5f                	pop    %r15
    40e7:	5d                   	pop    %rbp
    40e8:	c3                   	retq   
    40e9:	41 f6 47 47 04       	testb  $0x4,0x47(%r15)
    40ee:	75 39                	jne    4129 <vfs_write+0x129>
    40f0:	4d 8b 6f 20          	mov    0x20(%r15),%r13
    40f4:	bb 02 00 00 00       	mov    $0x2,%ebx
    40f9:	4d 8d 77 10          	lea    0x10(%r15),%r14
    40fd:	49 8b 7f 18          	mov    0x18(%r15),%rdi
    4101:	b9 01 00 00 00       	mov    $0x1,%ecx
    4106:	4c 89 f2             	mov    %r14,%rdx
    4109:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
    410e:	66 25 00 f0          	and    $0xf000,%ax
    4112:	66 3d 00 40          	cmp    $0x4000,%ax
    4116:	b8 02 00 00 40       	mov    $0x40000002,%eax
    411b:	0f 44 d8             	cmove  %eax,%ebx
    411e:	89 de                	mov    %ebx,%esi
    4120:	e8 00 00 00 00       	callq  4125 <vfs_write+0x125>
    4125:	85 c0                	test   %eax,%eax
    4127:	74 49                	je     4172 <vfs_write+0x172>
    4129:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    4130:	00 00 
    4132:	4c 01 a0 a8 0b 00 00 	add    %r12,0xba8(%rax)
    4139:	e9 7b ff ff ff       	jmpq   40b9 <vfs_write+0xb9>
    413e:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
    4142:	be 01 00 00 00       	mov    $0x1,%esi
    4147:	e8 00 00 00 00       	callq  414c <vfs_write+0x14c>
    414c:	4c 89 e0             	mov    %r12,%rax
    414f:	5b                   	pop    %rbx
    4150:	41 5c                	pop    %r12
    4152:	41 5d                	pop    %r13
    4154:	41 5e                	pop    %r14
    4156:	41 5f                	pop    %r15
    4158:	5d                   	pop    %rbp
    4159:	c3                   	retq   
    415a:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
    415e:	be 01 00 00 00       	mov    $0x1,%esi
    4163:	ba 01 00 00 00       	mov    $0x1,%edx
    4168:	e8 00 00 00 00       	callq  416d <vfs_write+0x16d>
    416d:	e9 2e ff ff ff       	jmpq   40a0 <vfs_write+0xa0>
    4172:	45 31 c9             	xor    %r9d,%r9d
    4175:	45 31 c0             	xor    %r8d,%r8d
    4178:	b9 01 00 00 00       	mov    $0x1,%ecx
    417d:	4c 89 f2             	mov    %r14,%rdx
    4180:	89 de                	mov    %ebx,%esi
    4182:	4c 89 ef             	mov    %r13,%rdi
    4185:	e8 00 00 00 00       	callq  418a <vfs_write+0x18a>
    418a:	eb 9d                	jmp    4129 <vfs_write+0x129>
    418c:	49 c7 c4 f7 ff ff ff 	mov    $0xfffffffffffffff7,%r12
    4193:	e9 43 ff ff ff       	jmpq   40db <vfs_write+0xdb>
    4198:	49 c7 c4 ea ff ff ff 	mov    $0xffffffffffffffea,%r12
    419f:	e9 37 ff ff ff       	jmpq   40db <vfs_write+0xdb>
    41a4:	66 90                	xchg   %ax,%ax
    41a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    41ad:	00 00 00 

00000000000041b0 <kernel_write>:
    41b0:	e8 00 00 00 00       	callq  41b5 <kernel_write+0x5>
    41b5:	55                   	push   %rbp
    41b6:	48 89 e5             	mov    %rsp,%rbp
    41b9:	41 54                	push   %r12
    41bb:	53                   	push   %rbx
    41bc:	65 48 8b 1c 25 00 00 	mov    %gs:0x0,%rbx
    41c3:	00 00 
    41c5:	4c 8b a3 50 13 00 00 	mov    0x1350(%rbx),%r12
    41cc:	48 c7 83 50 13 00 00 	movq   $0xffffffffffffffff,0x1350(%rbx)
    41d3:	ff ff ff ff 
    41d7:	f0 80 4b 03 80       	lock orb $0x80,0x3(%rbx)
    41dc:	e8 00 00 00 00       	callq  41e1 <kernel_write+0x31>
    41e1:	4c 89 a3 50 13 00 00 	mov    %r12,0x1350(%rbx)
    41e8:	f0 80 4b 03 80       	lock orb $0x80,0x3(%rbx)
    41ed:	5b                   	pop    %rbx
    41ee:	41 5c                	pop    %r12
    41f0:	5d                   	pop    %rbp
    41f1:	c3                   	retq   
    41f2:	0f 1f 40 00          	nopl   0x0(%rax)
    41f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    41fd:	00 00 00 

0000000000004200 <ksys_read>:
    4200:	e8 00 00 00 00       	callq  4205 <ksys_read+0x5>
    4205:	55                   	push   %rbp
    4206:	48 89 e5             	mov    %rsp,%rbp
    4209:	41 56                	push   %r14
    420b:	41 55                	push   %r13
    420d:	41 54                	push   %r12
    420f:	53                   	push   %rbx
    4210:	49 89 f5             	mov    %rsi,%r13
    4213:	49 89 d6             	mov    %rdx,%r14
    4216:	48 83 ec 18          	sub    $0x18,%rsp
    421a:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    4221:	00 00 
    4223:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    4227:	31 c0                	xor    %eax,%eax
    4229:	e8 00 00 00 00       	callq  422e <ksys_read+0x2e>
    422e:	49 89 c4             	mov    %rax,%r12
    4231:	49 83 e4 fc          	and    $0xfffffffffffffffc,%r12
    4235:	0f 84 91 00 00 00    	je     42cc <ksys_read+0xcc>
    423b:	41 f6 44 24 46 20    	testb  $0x20,0x46(%r12)
    4241:	48 89 c3             	mov    %rax,%rbx
    4244:	74 46                	je     428c <ksys_read+0x8c>
    4246:	31 c9                	xor    %ecx,%ecx
    4248:	4c 89 f2             	mov    %r14,%rdx
    424b:	4c 89 ee             	mov    %r13,%rsi
    424e:	4c 89 e7             	mov    %r12,%rdi
    4251:	e8 00 00 00 00       	callq  4256 <ksys_read+0x56>
    4256:	f6 c3 02             	test   $0x2,%bl
    4259:	75 5f                	jne    42ba <ksys_read+0xba>
    425b:	83 e3 01             	and    $0x1,%ebx
    425e:	74 10                	je     4270 <ksys_read+0x70>
    4260:	4c 89 e7             	mov    %r12,%rdi
    4263:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    4267:	e8 00 00 00 00       	callq  426c <ksys_read+0x6c>
    426c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    4270:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    4274:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
    427b:	00 00 
    427d:	75 56                	jne    42d5 <ksys_read+0xd5>
    427f:	48 83 c4 18          	add    $0x18,%rsp
    4283:	5b                   	pop    %rbx
    4284:	41 5c                	pop    %r12
    4286:	41 5d                	pop    %r13
    4288:	41 5e                	pop    %r14
    428a:	5d                   	pop    %rbp
    428b:	c3                   	retq   
    428c:	49 8b 44 24 68       	mov    0x68(%r12),%rax
    4291:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
    4295:	4c 89 f2             	mov    %r14,%rdx
    4298:	4c 89 ee             	mov    %r13,%rsi
    429b:	4c 89 e7             	mov    %r12,%rdi
    429e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    42a2:	e8 00 00 00 00       	callq  42a7 <ksys_read+0xa7>
    42a7:	48 85 c0             	test   %rax,%rax
    42aa:	78 aa                	js     4256 <ksys_read+0x56>
    42ac:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    42b0:	f6 c3 02             	test   $0x2,%bl
    42b3:	49 89 54 24 68       	mov    %rdx,0x68(%r12)
    42b8:	74 a1                	je     425b <ksys_read+0x5b>
    42ba:	4c 89 e7             	mov    %r12,%rdi
    42bd:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    42c1:	e8 00 00 00 00       	callq  42c6 <ksys_read+0xc6>
    42c6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    42ca:	eb 8f                	jmp    425b <ksys_read+0x5b>
    42cc:	48 c7 c0 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rax
    42d3:	eb 9b                	jmp    4270 <ksys_read+0x70>
    42d5:	e8 00 00 00 00       	callq  42da <ksys_read+0xda>
    42da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000042e0 <__x64_sys_read>:
    42e0:	e8 00 00 00 00       	callq  42e5 <__x64_sys_read+0x5>
    42e5:	55                   	push   %rbp
    42e6:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    42ea:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    42ee:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    42f2:	48 89 e5             	mov    %rsp,%rbp
    42f5:	e8 00 00 00 00       	callq  42fa <__x64_sys_read+0x1a>
    42fa:	5d                   	pop    %rbp
    42fb:	c3                   	retq   
    42fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000004300 <__ia32_sys_read>:
    4300:	e8 00 00 00 00       	callq  4305 <__ia32_sys_read+0x5>
    4305:	55                   	push   %rbp
    4306:	8b 57 60             	mov    0x60(%rdi),%edx
    4309:	8b 77 58             	mov    0x58(%rdi),%esi
    430c:	48 8b 7f 28          	mov    0x28(%rdi),%rdi
    4310:	48 89 e5             	mov    %rsp,%rbp
    4313:	e8 00 00 00 00       	callq  4318 <__ia32_sys_read+0x18>
    4318:	5d                   	pop    %rbp
    4319:	c3                   	retq   
    431a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000004320 <ksys_write>:
    4320:	e8 00 00 00 00       	callq  4325 <ksys_write+0x5>
    4325:	55                   	push   %rbp
    4326:	48 89 e5             	mov    %rsp,%rbp
    4329:	41 56                	push   %r14
    432b:	41 55                	push   %r13
    432d:	41 54                	push   %r12
    432f:	53                   	push   %rbx
    4330:	49 89 f5             	mov    %rsi,%r13
    4333:	49 89 d6             	mov    %rdx,%r14
    4336:	48 83 ec 18          	sub    $0x18,%rsp
    433a:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    4341:	00 00 
    4343:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    4347:	31 c0                	xor    %eax,%eax
    4349:	e8 00 00 00 00       	callq  434e <ksys_write+0x2e>
    434e:	49 89 c4             	mov    %rax,%r12
    4351:	49 83 e4 fc          	and    $0xfffffffffffffffc,%r12
    4355:	0f 84 91 00 00 00    	je     43ec <ksys_write+0xcc>
    435b:	41 f6 44 24 46 20    	testb  $0x20,0x46(%r12)
    4361:	48 89 c3             	mov    %rax,%rbx
    4364:	74 46                	je     43ac <ksys_write+0x8c>
    4366:	31 c9                	xor    %ecx,%ecx
    4368:	4c 89 f2             	mov    %r14,%rdx
    436b:	4c 89 ee             	mov    %r13,%rsi
    436e:	4c 89 e7             	mov    %r12,%rdi
    4371:	e8 00 00 00 00       	callq  4376 <ksys_write+0x56>
    4376:	f6 c3 02             	test   $0x2,%bl
    4379:	75 5f                	jne    43da <ksys_write+0xba>
    437b:	83 e3 01             	and    $0x1,%ebx
    437e:	74 10                	je     4390 <ksys_write+0x70>
    4380:	4c 89 e7             	mov    %r12,%rdi
    4383:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    4387:	e8 00 00 00 00       	callq  438c <ksys_write+0x6c>
    438c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    4390:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    4394:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
    439b:	00 00 
    439d:	75 56                	jne    43f5 <ksys_write+0xd5>
    439f:	48 83 c4 18          	add    $0x18,%rsp
    43a3:	5b                   	pop    %rbx
    43a4:	41 5c                	pop    %r12
    43a6:	41 5d                	pop    %r13
    43a8:	41 5e                	pop    %r14
    43aa:	5d                   	pop    %rbp
    43ab:	c3                   	retq   
    43ac:	49 8b 44 24 68       	mov    0x68(%r12),%rax
    43b1:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
    43b5:	4c 89 f2             	mov    %r14,%rdx
    43b8:	4c 89 ee             	mov    %r13,%rsi
    43bb:	4c 89 e7             	mov    %r12,%rdi
    43be:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    43c2:	e8 00 00 00 00       	callq  43c7 <ksys_write+0xa7>
    43c7:	48 85 c0             	test   %rax,%rax
    43ca:	78 aa                	js     4376 <ksys_write+0x56>
    43cc:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    43d0:	f6 c3 02             	test   $0x2,%bl
    43d3:	49 89 54 24 68       	mov    %rdx,0x68(%r12)
    43d8:	74 a1                	je     437b <ksys_write+0x5b>
    43da:	4c 89 e7             	mov    %r12,%rdi
    43dd:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    43e1:	e8 00 00 00 00       	callq  43e6 <ksys_write+0xc6>
    43e6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    43ea:	eb 8f                	jmp    437b <ksys_write+0x5b>
    43ec:	48 c7 c0 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rax
    43f3:	eb 9b                	jmp    4390 <ksys_write+0x70>
    43f5:	e8 00 00 00 00       	callq  43fa <ksys_write+0xda>
    43fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000004400 <__x64_sys_write>:
    4400:	e8 00 00 00 00       	callq  4405 <__x64_sys_write+0x5>
    4405:	55                   	push   %rbp
    4406:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    440a:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    440e:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    4412:	48 89 e5             	mov    %rsp,%rbp
    4415:	e8 00 00 00 00       	callq  441a <__x64_sys_write+0x1a>
    441a:	5d                   	pop    %rbp
    441b:	c3                   	retq   
    441c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000004420 <__ia32_sys_write>:
    4420:	e8 00 00 00 00       	callq  4425 <__ia32_sys_write+0x5>
    4425:	55                   	push   %rbp
    4426:	8b 57 60             	mov    0x60(%rdi),%edx
    4429:	8b 77 58             	mov    0x58(%rdi),%esi
    442c:	48 8b 7f 28          	mov    0x28(%rdi),%rdi
    4430:	48 89 e5             	mov    %rsp,%rbp
    4433:	e8 00 00 00 00       	callq  4438 <__ia32_sys_write+0x18>
    4438:	5d                   	pop    %rbp
    4439:	c3                   	retq   
    443a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000004440 <ksys_pread64>:
    4440:	e8 00 00 00 00       	callq  4445 <ksys_pread64+0x5>
    4445:	55                   	push   %rbp
    4446:	48 89 e5             	mov    %rsp,%rbp
    4449:	41 56                	push   %r14
    444b:	41 55                	push   %r13
    444d:	41 54                	push   %r12
    444f:	53                   	push   %rbx
    4450:	48 83 ec 10          	sub    $0x10,%rsp
    4454:	48 85 c9             	test   %rcx,%rcx
    4457:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    445b:	78 5b                	js     44b8 <ksys_pread64+0x78>
    445d:	49 89 d5             	mov    %rdx,%r13
    4460:	49 89 f4             	mov    %rsi,%r12
    4463:	e8 00 00 00 00       	callq  4468 <ksys_pread64+0x28>
    4468:	49 89 c6             	mov    %rax,%r14
    446b:	48 89 c3             	mov    %rax,%rbx
    446e:	49 83 e6 fc          	and    $0xfffffffffffffffc,%r14
    4472:	74 4d                	je     44c1 <ksys_pread64+0x81>
    4474:	41 f6 46 44 08       	testb  $0x8,0x44(%r14)
    4479:	48 c7 c0 e3 ff ff ff 	mov    $0xffffffffffffffe3,%rax
    4480:	75 22                	jne    44a4 <ksys_pread64+0x64>
    4482:	83 e3 01             	and    $0x1,%ebx
    4485:	74 10                	je     4497 <ksys_pread64+0x57>
    4487:	4c 89 f7             	mov    %r14,%rdi
    448a:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    448e:	e8 00 00 00 00       	callq  4493 <ksys_pread64+0x53>
    4493:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    4497:	48 83 c4 10          	add    $0x10,%rsp
    449b:	5b                   	pop    %rbx
    449c:	41 5c                	pop    %r12
    449e:	41 5d                	pop    %r13
    44a0:	41 5e                	pop    %r14
    44a2:	5d                   	pop    %rbp
    44a3:	c3                   	retq   
    44a4:	48 8d 4d d8          	lea    -0x28(%rbp),%rcx
    44a8:	4c 89 ea             	mov    %r13,%rdx
    44ab:	4c 89 e6             	mov    %r12,%rsi
    44ae:	4c 89 f7             	mov    %r14,%rdi
    44b1:	e8 00 00 00 00       	callq  44b6 <ksys_pread64+0x76>
    44b6:	eb ca                	jmp    4482 <ksys_pread64+0x42>
    44b8:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
    44bf:	eb d6                	jmp    4497 <ksys_pread64+0x57>
    44c1:	48 c7 c0 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rax
    44c8:	eb cd                	jmp    4497 <ksys_pread64+0x57>
    44ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000044d0 <__x64_sys_pread64>:
    44d0:	e8 00 00 00 00       	callq  44d5 <__x64_sys_pread64+0x5>
    44d5:	55                   	push   %rbp
    44d6:	48 8b 4f 38          	mov    0x38(%rdi),%rcx
    44da:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    44de:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    44e2:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    44e6:	48 89 e5             	mov    %rsp,%rbp
    44e9:	e8 00 00 00 00       	callq  44ee <__x64_sys_pread64+0x1e>
    44ee:	5d                   	pop    %rbp
    44ef:	c3                   	retq   

00000000000044f0 <__ia32_sys_pread64>:
    44f0:	e8 00 00 00 00       	callq  44f5 <__ia32_sys_pread64+0x5>
    44f5:	55                   	push   %rbp
    44f6:	8b 4f 68             	mov    0x68(%rdi),%ecx
    44f9:	8b 57 60             	mov    0x60(%rdi),%edx
    44fc:	8b 77 58             	mov    0x58(%rdi),%esi
    44ff:	48 8b 7f 28          	mov    0x28(%rdi),%rdi
    4503:	48 89 e5             	mov    %rsp,%rbp
    4506:	e8 00 00 00 00       	callq  450b <__ia32_sys_pread64+0x1b>
    450b:	5d                   	pop    %rbp
    450c:	c3                   	retq   
    450d:	0f 1f 00             	nopl   (%rax)

0000000000004510 <ksys_pwrite64>:
    4510:	e8 00 00 00 00       	callq  4515 <ksys_pwrite64+0x5>
    4515:	55                   	push   %rbp
    4516:	48 89 e5             	mov    %rsp,%rbp
    4519:	41 56                	push   %r14
    451b:	41 55                	push   %r13
    451d:	41 54                	push   %r12
    451f:	53                   	push   %rbx
    4520:	48 83 ec 10          	sub    $0x10,%rsp
    4524:	48 85 c9             	test   %rcx,%rcx
    4527:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    452b:	78 5b                	js     4588 <ksys_pwrite64+0x78>
    452d:	49 89 d5             	mov    %rdx,%r13
    4530:	49 89 f4             	mov    %rsi,%r12
    4533:	e8 00 00 00 00       	callq  4538 <ksys_pwrite64+0x28>
    4538:	49 89 c6             	mov    %rax,%r14
    453b:	48 89 c3             	mov    %rax,%rbx
    453e:	49 83 e6 fc          	and    $0xfffffffffffffffc,%r14
    4542:	74 4d                	je     4591 <ksys_pwrite64+0x81>
    4544:	41 f6 46 44 10       	testb  $0x10,0x44(%r14)
    4549:	48 c7 c0 e3 ff ff ff 	mov    $0xffffffffffffffe3,%rax
    4550:	75 22                	jne    4574 <ksys_pwrite64+0x64>
    4552:	83 e3 01             	and    $0x1,%ebx
    4555:	74 10                	je     4567 <ksys_pwrite64+0x57>
    4557:	4c 89 f7             	mov    %r14,%rdi
    455a:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    455e:	e8 00 00 00 00       	callq  4563 <ksys_pwrite64+0x53>
    4563:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    4567:	48 83 c4 10          	add    $0x10,%rsp
    456b:	5b                   	pop    %rbx
    456c:	41 5c                	pop    %r12
    456e:	41 5d                	pop    %r13
    4570:	41 5e                	pop    %r14
    4572:	5d                   	pop    %rbp
    4573:	c3                   	retq   
    4574:	48 8d 4d d8          	lea    -0x28(%rbp),%rcx
    4578:	4c 89 ea             	mov    %r13,%rdx
    457b:	4c 89 e6             	mov    %r12,%rsi
    457e:	4c 89 f7             	mov    %r14,%rdi
    4581:	e8 00 00 00 00       	callq  4586 <ksys_pwrite64+0x76>
    4586:	eb ca                	jmp    4552 <ksys_pwrite64+0x42>
    4588:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
    458f:	eb d6                	jmp    4567 <ksys_pwrite64+0x57>
    4591:	48 c7 c0 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rax
    4598:	eb cd                	jmp    4567 <ksys_pwrite64+0x57>
    459a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000045a0 <__x64_sys_pwrite64>:
    45a0:	e8 00 00 00 00       	callq  45a5 <__x64_sys_pwrite64+0x5>
    45a5:	55                   	push   %rbp
    45a6:	48 8b 4f 38          	mov    0x38(%rdi),%rcx
    45aa:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    45ae:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    45b2:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    45b6:	48 89 e5             	mov    %rsp,%rbp
    45b9:	e8 00 00 00 00       	callq  45be <__x64_sys_pwrite64+0x1e>
    45be:	5d                   	pop    %rbp
    45bf:	c3                   	retq   

00000000000045c0 <__ia32_sys_pwrite64>:
    45c0:	e8 00 00 00 00       	callq  45c5 <__ia32_sys_pwrite64+0x5>
    45c5:	55                   	push   %rbp
    45c6:	8b 4f 68             	mov    0x68(%rdi),%ecx
    45c9:	8b 57 60             	mov    0x60(%rdi),%edx
    45cc:	8b 77 58             	mov    0x58(%rdi),%esi
    45cf:	48 8b 7f 28          	mov    0x28(%rdi),%rdi
    45d3:	48 89 e5             	mov    %rsp,%rbp
    45d6:	e8 00 00 00 00       	callq  45db <__ia32_sys_pwrite64+0x1b>
    45db:	5d                   	pop    %rbp
    45dc:	c3                   	retq   
    45dd:	0f 1f 00             	nopl   (%rax)

00000000000045e0 <rw_copy_check_uvector>:
    45e0:	e8 00 00 00 00       	callq  45e5 <rw_copy_check_uvector+0x5>
    45e5:	55                   	push   %rbp
    45e6:	31 c0                	xor    %eax,%eax
    45e8:	48 85 d2             	test   %rdx,%rdx
    45eb:	48 89 e5             	mov    %rsp,%rbp
    45ee:	41 57                	push   %r15
    45f0:	41 56                	push   %r14
    45f2:	4d 89 cf             	mov    %r9,%r15
    45f5:	41 55                	push   %r13
    45f7:	4d 89 c5             	mov    %r8,%r13
    45fa:	41 54                	push   %r12
    45fc:	53                   	push   %rbx
    45fd:	0f 84 a5 00 00 00    	je     46a8 <rw_copy_check_uvector+0xc8>
    4603:	48 81 fa 00 04 00 00 	cmp    $0x400,%rdx
    460a:	48 89 d3             	mov    %rdx,%rbx
    460d:	0f 87 d5 00 00 00    	ja     46e8 <rw_copy_check_uvector+0x108>
    4613:	48 39 ca             	cmp    %rcx,%rdx
    4616:	41 89 fc             	mov    %edi,%r12d
    4619:	49 89 f6             	mov    %rsi,%r14
    461c:	0f 87 94 00 00 00    	ja     46b6 <rw_copy_check_uvector+0xd6>
    4622:	48 c1 e3 04          	shl    $0x4,%rbx
    4626:	31 d2                	xor    %edx,%edx
    4628:	4c 89 ef             	mov    %r13,%rdi
    462b:	48 89 de             	mov    %rbx,%rsi
    462e:	e8 00 00 00 00       	callq  4633 <rw_copy_check_uvector+0x53>
    4633:	48 89 da             	mov    %rbx,%rdx
    4636:	4c 89 f6             	mov    %r14,%rsi
    4639:	4c 89 ef             	mov    %r13,%rdi
    463c:	e8 00 00 00 00       	callq  4641 <rw_copy_check_uvector+0x61>
    4641:	48 85 c0             	test   %rax,%rax
    4644:	0f 85 b3 00 00 00    	jne    46fd <rw_copy_check_uvector+0x11d>
    464a:	49 8d 4d 08          	lea    0x8(%r13),%rcx
    464e:	4d 8d 54 1d 08       	lea    0x8(%r13,%rbx,1),%r10
    4653:	41 b9 00 f0 ff 7f    	mov    $0x7ffff000,%r9d
    4659:	48 8b 11             	mov    (%rcx),%rdx
    465c:	48 85 d2             	test   %rdx,%rdx
    465f:	48 89 d6             	mov    %rdx,%rsi
    4662:	0f 88 80 00 00 00    	js     46e8 <rw_copy_check_uvector+0x108>
    4668:	45 85 e4             	test   %r12d,%r12d
    466b:	78 1e                	js     468b <rw_copy_check_uvector+0xab>
    466d:	65 48 8b 3c 25 00 00 	mov    %gs:0x0,%rdi
    4674:	00 00 
    4676:	4c 8b 87 50 13 00 00 	mov    0x1350(%rdi),%r8
    467d:	48 89 d7             	mov    %rdx,%rdi
    4680:	48 03 79 f8          	add    -0x8(%rcx),%rdi
    4684:	72 77                	jb     46fd <rw_copy_check_uvector+0x11d>
    4686:	49 39 f8             	cmp    %rdi,%r8
    4689:	72 72                	jb     46fd <rw_copy_check_uvector+0x11d>
    468b:	4c 89 cf             	mov    %r9,%rdi
    468e:	48 29 c7             	sub    %rax,%rdi
    4691:	48 39 fa             	cmp    %rdi,%rdx
    4694:	76 06                	jbe    469c <rw_copy_check_uvector+0xbc>
    4696:	48 89 fe             	mov    %rdi,%rsi
    4699:	48 89 39             	mov    %rdi,(%rcx)
    469c:	48 83 c1 10          	add    $0x10,%rcx
    46a0:	48 01 f0             	add    %rsi,%rax
    46a3:	4c 39 d1             	cmp    %r10,%rcx
    46a6:	75 b1                	jne    4659 <rw_copy_check_uvector+0x79>
    46a8:	5b                   	pop    %rbx
    46a9:	41 5c                	pop    %r12
    46ab:	4d 89 2f             	mov    %r13,(%r15)
    46ae:	41 5d                	pop    %r13
    46b0:	41 5e                	pop    %r14
    46b2:	41 5f                	pop    %r15
    46b4:	5d                   	pop    %rbp
    46b5:	c3                   	retq   
    46b6:	bf 10 00 00 00       	mov    $0x10,%edi
    46bb:	48 89 f8             	mov    %rdi,%rax
    46be:	48 f7 e3             	mul    %rbx
    46c1:	48 89 c7             	mov    %rax,%rdi
    46c4:	70 16                	jo     46dc <rw_copy_check_uvector+0xfc>
    46c6:	be c0 0c 00 00       	mov    $0xcc0,%esi
    46cb:	e8 00 00 00 00       	callq  46d0 <rw_copy_check_uvector+0xf0>
    46d0:	48 85 c0             	test   %rax,%rax
    46d3:	49 89 c5             	mov    %rax,%r13
    46d6:	0f 85 46 ff ff ff    	jne    4622 <rw_copy_check_uvector+0x42>
    46dc:	45 31 ed             	xor    %r13d,%r13d
    46df:	48 c7 c0 f4 ff ff ff 	mov    $0xfffffffffffffff4,%rax
    46e6:	eb c0                	jmp    46a8 <rw_copy_check_uvector+0xc8>
    46e8:	5b                   	pop    %rbx
    46e9:	4d 89 2f             	mov    %r13,(%r15)
    46ec:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
    46f3:	41 5c                	pop    %r12
    46f5:	41 5d                	pop    %r13
    46f7:	41 5e                	pop    %r14
    46f9:	41 5f                	pop    %r15
    46fb:	5d                   	pop    %rbp
    46fc:	c3                   	retq   
    46fd:	5b                   	pop    %rbx
    46fe:	4d 89 2f             	mov    %r13,(%r15)
    4701:	48 c7 c0 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rax
    4708:	41 5c                	pop    %r12
    470a:	41 5d                	pop    %r13
    470c:	41 5e                	pop    %r14
    470e:	41 5f                	pop    %r15
    4710:	5d                   	pop    %rbp
    4711:	c3                   	retq   
    4712:	0f 1f 40 00          	nopl   0x0(%rax)
    4716:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    471d:	00 00 00 

0000000000004720 <compat_rw_copy_check_uvector>:
    4720:	e8 00 00 00 00       	callq  4725 <compat_rw_copy_check_uvector+0x5>
    4725:	31 c0                	xor    %eax,%eax
    4727:	48 85 d2             	test   %rdx,%rdx
    472a:	4d 89 01             	mov    %r8,(%r9)
    472d:	0f 84 f8 00 00 00    	je     482b <compat_rw_copy_check_uvector+0x10b>
    4733:	55                   	push   %rbp
    4734:	48 89 e5             	mov    %rsp,%rbp
    4737:	41 56                	push   %r14
    4739:	41 55                	push   %r13
    473b:	41 54                	push   %r12
    473d:	53                   	push   %rbx
    473e:	49 89 d4             	mov    %rdx,%r12
    4741:	48 83 ec 08          	sub    $0x8,%rsp
    4745:	48 81 fa 00 04 00 00 	cmp    $0x400,%rdx
    474c:	0f 87 12 01 00 00    	ja     4864 <compat_rw_copy_check_uvector+0x144>
    4752:	48 39 ca             	cmp    %rcx,%rdx
    4755:	41 89 fd             	mov    %edi,%r13d
    4758:	48 89 f3             	mov    %rsi,%rbx
    475b:	0f 87 cc 00 00 00    	ja     482d <compat_rw_copy_check_uvector+0x10d>
    4761:	49 c1 e4 03          	shl    $0x3,%r12
    4765:	4d 89 01             	mov    %r8,(%r9)
    4768:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    476f:	00 00 
    4771:	49 01 dc             	add    %rbx,%r12
    4774:	48 8b 80 50 13 00 00 	mov    0x1350(%rax),%rax
    477b:	0f 82 96 00 00 00    	jb     4817 <compat_rw_copy_check_uvector+0xf7>
    4781:	4c 39 e0             	cmp    %r12,%rax
    4784:	0f 82 8d 00 00 00    	jb     4817 <compat_rw_copy_check_uvector+0xf7>
    478a:	31 f6                	xor    %esi,%esi
    478c:	31 ff                	xor    %edi,%edi
    478e:	41 ba 00 f0 ff 7f    	mov    $0x7ffff000,%r10d
    4794:	41 b9 00 f0 ff 7f    	mov    $0x7ffff000,%r9d
    479a:	90                   	nop
    479b:	90                   	nop
    479c:	90                   	nop
    479d:	90                   	nop
    479e:	90                   	nop
    479f:	90                   	nop
    47a0:	89 f9                	mov    %edi,%ecx
    47a2:	44 8b 5b 04          	mov    0x4(%rbx),%r11d
    47a6:	90                   	nop
    47a7:	90                   	nop
    47a8:	90                   	nop
    47a9:	85 c9                	test   %ecx,%ecx
    47ab:	75 6a                	jne    4817 <compat_rw_copy_check_uvector+0xf7>
    47ad:	90                   	nop
    47ae:	90                   	nop
    47af:	90                   	nop
    47b0:	90                   	nop
    47b1:	90                   	nop
    47b2:	90                   	nop
    47b3:	8b 03                	mov    (%rbx),%eax
    47b5:	90                   	nop
    47b6:	90                   	nop
    47b7:	90                   	nop
    47b8:	85 c9                	test   %ecx,%ecx
    47ba:	75 5b                	jne    4817 <compat_rw_copy_check_uvector+0xf7>
    47bc:	45 85 db             	test   %r11d,%r11d
    47bf:	0f 88 9f 00 00 00    	js     4864 <compat_rw_copy_check_uvector+0x144>
    47c5:	45 85 ed             	test   %r13d,%r13d
    47c8:	49 63 cb             	movslq %r11d,%rcx
    47cb:	89 c0                	mov    %eax,%eax
    47cd:	78 16                	js     47e5 <compat_rw_copy_check_uvector+0xc5>
    47cf:	65 4c 8b 34 25 00 00 	mov    %gs:0x0,%r14
    47d6:	00 00 
    47d8:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
    47dc:	49 39 96 50 13 00 00 	cmp    %rdx,0x1350(%r14)
    47e3:	72 32                	jb     4817 <compat_rw_copy_check_uvector+0xf7>
    47e5:	48 63 d6             	movslq %esi,%rdx
    47e8:	4d 89 d6             	mov    %r10,%r14
    47eb:	49 89 00             	mov    %rax,(%r8)
    47ee:	49 29 d6             	sub    %rdx,%r14
    47f1:	44 89 ca             	mov    %r9d,%edx
    47f4:	29 f2                	sub    %esi,%edx
    47f6:	49 39 ce             	cmp    %rcx,%r14
    47f9:	41 0f 43 d3          	cmovae %r11d,%edx
    47fd:	48 83 c3 08          	add    $0x8,%rbx
    4801:	49 83 c0 10          	add    $0x10,%r8
    4805:	89 d0                	mov    %edx,%eax
    4807:	01 d6                	add    %edx,%esi
    4809:	49 89 40 f8          	mov    %rax,-0x8(%r8)
    480d:	4c 39 e3             	cmp    %r12,%rbx
    4810:	75 88                	jne    479a <compat_rw_copy_check_uvector+0x7a>
    4812:	48 63 c6             	movslq %esi,%rax
    4815:	eb 07                	jmp    481e <compat_rw_copy_check_uvector+0xfe>
    4817:	48 c7 c0 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rax
    481e:	48 83 c4 08          	add    $0x8,%rsp
    4822:	5b                   	pop    %rbx
    4823:	41 5c                	pop    %r12
    4825:	41 5d                	pop    %r13
    4827:	41 5e                	pop    %r14
    4829:	5d                   	pop    %rbp
    482a:	c3                   	retq   
    482b:	f3 c3                	repz retq 
    482d:	bf 10 00 00 00       	mov    $0x10,%edi
    4832:	4c 89 4d d8          	mov    %r9,-0x28(%rbp)
    4836:	48 89 f8             	mov    %rdi,%rax
    4839:	49 f7 e4             	mul    %r12
    483c:	48 89 c7             	mov    %rax,%rdi
    483f:	70 1a                	jo     485b <compat_rw_copy_check_uvector+0x13b>
    4841:	be c0 0c 00 00       	mov    $0xcc0,%esi
    4846:	e8 00 00 00 00       	callq  484b <compat_rw_copy_check_uvector+0x12b>
    484b:	48 85 c0             	test   %rax,%rax
    484e:	49 89 c0             	mov    %rax,%r8
    4851:	4c 8b 4d d8          	mov    -0x28(%rbp),%r9
    4855:	0f 85 06 ff ff ff    	jne    4761 <compat_rw_copy_check_uvector+0x41>
    485b:	48 c7 c0 f4 ff ff ff 	mov    $0xfffffffffffffff4,%rax
    4862:	eb ba                	jmp    481e <compat_rw_copy_check_uvector+0xfe>
    4864:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
    486b:	eb b1                	jmp    481e <compat_rw_copy_check_uvector+0xfe>
    486d:	0f 1f 00             	nopl   (%rax)

0000000000004870 <vfs_readv>:
    4870:	e8 00 00 00 00       	callq  4875 <vfs_readv+0x5>
    4875:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
    487a:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    487e:	41 ff 72 f8          	pushq  -0x8(%r10)
    4882:	55                   	push   %rbp
    4883:	48 89 e5             	mov    %rsp,%rbp
    4886:	41 55                	push   %r13
    4888:	41 54                	push   %r12
    488a:	41 52                	push   %r10
    488c:	53                   	push   %rbx
    488d:	45 89 c5             	mov    %r8d,%r13d
    4890:	4c 8d 8d 28 ff ff ff 	lea    -0xd8(%rbp),%r9
    4897:	4c 8d 85 20 ff ff ff 	lea    -0xe0(%rbp),%r8
    489e:	48 89 fb             	mov    %rdi,%rbx
    48a1:	48 81 ec d0 00 00 00 	sub    $0xd0,%rsp
    48a8:	31 ff                	xor    %edi,%edi
    48aa:	49 89 cc             	mov    %rcx,%r12
    48ad:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    48b4:	00 00 
    48b6:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    48ba:	31 c0                	xor    %eax,%eax
    48bc:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
    48c3:	b9 08 00 00 00       	mov    $0x8,%ecx
    48c8:	48 89 85 20 ff ff ff 	mov    %rax,-0xe0(%rbp)
    48cf:	e8 00 00 00 00       	callq  48d4 <vfs_readv+0x64>
    48d4:	48 85 c0             	test   %rax,%rax
    48d7:	78 2f                	js     4908 <vfs_readv+0x98>
    48d9:	48 8d b5 28 ff ff ff 	lea    -0xd8(%rbp),%rsi
    48e0:	44 89 e9             	mov    %r13d,%ecx
    48e3:	4c 89 e2             	mov    %r12,%rdx
    48e6:	48 89 df             	mov    %rbx,%rdi
    48e9:	e8 32 d3 ff ff       	callq  1c20 <do_iter_read>
    48ee:	48 8b bd 20 ff ff ff 	mov    -0xe0(%rbp),%rdi
    48f5:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
    48fc:	e8 00 00 00 00       	callq  4901 <vfs_readv+0x91>
    4901:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
    4908:	48 8b 5d d8          	mov    -0x28(%rbp),%rbx
    490c:	65 48 33 1c 25 28 00 	xor    %gs:0x28,%rbx
    4913:	00 00 
    4915:	75 14                	jne    492b <vfs_readv+0xbb>
    4917:	48 81 c4 d0 00 00 00 	add    $0xd0,%rsp
    491e:	5b                   	pop    %rbx
    491f:	41 5a                	pop    %r10
    4921:	41 5c                	pop    %r12
    4923:	41 5d                	pop    %r13
    4925:	5d                   	pop    %rbp
    4926:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
    492a:	c3                   	retq   
    492b:	e8 00 00 00 00       	callq  4930 <do_readv>

0000000000004930 <do_readv>:
    4930:	e8 00 00 00 00       	callq  4935 <do_readv+0x5>
    4935:	55                   	push   %rbp
    4936:	48 89 e5             	mov    %rsp,%rbp
    4939:	41 57                	push   %r15
    493b:	41 56                	push   %r14
    493d:	41 55                	push   %r13
    493f:	41 54                	push   %r12
    4941:	49 89 f5             	mov    %rsi,%r13
    4944:	53                   	push   %rbx
    4945:	49 89 d6             	mov    %rdx,%r14
    4948:	41 89 cf             	mov    %ecx,%r15d
    494b:	48 83 ec 18          	sub    $0x18,%rsp
    494f:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    4956:	00 00 
    4958:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    495c:	31 c0                	xor    %eax,%eax
    495e:	e8 00 00 00 00       	callq  4963 <do_readv+0x33>
    4963:	49 89 c4             	mov    %rax,%r12
    4966:	49 83 e4 fc          	and    $0xfffffffffffffffc,%r12
    496a:	0f 84 ce 00 00 00    	je     4a3e <do_readv+0x10e>
    4970:	41 f6 44 24 46 20    	testb  $0x20,0x46(%r12)
    4976:	48 89 c3             	mov    %rax,%rbx
    4979:	74 75                	je     49f0 <do_readv+0xc0>
    497b:	45 89 f8             	mov    %r15d,%r8d
    497e:	31 c9                	xor    %ecx,%ecx
    4980:	4c 89 f2             	mov    %r14,%rdx
    4983:	4c 89 ee             	mov    %r13,%rsi
    4986:	4c 89 e7             	mov    %r12,%rdi
    4989:	e8 00 00 00 00       	callq  498e <do_readv+0x5e>
    498e:	f6 c3 02             	test   $0x2,%bl
    4991:	0f 85 92 00 00 00    	jne    4a29 <do_readv+0xf9>
    4997:	83 e3 01             	and    $0x1,%ebx
    499a:	74 10                	je     49ac <do_readv+0x7c>
    499c:	4c 89 e7             	mov    %r12,%rdi
    499f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    49a3:	e8 00 00 00 00       	callq  49a8 <do_readv+0x78>
    49a8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    49ac:	48 85 c0             	test   %rax,%rax
    49af:	7e 10                	jle    49c1 <do_readv+0x91>
    49b1:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    49b8:	00 00 
    49ba:	48 01 82 a0 0b 00 00 	add    %rax,0xba0(%rdx)
    49c1:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    49c8:	00 00 
    49ca:	48 83 82 b0 0b 00 00 	addq   $0x1,0xbb0(%rdx)
    49d1:	01 
    49d2:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    49d6:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
    49dd:	00 00 
    49df:	75 69                	jne    4a4a <do_readv+0x11a>
    49e1:	48 83 c4 18          	add    $0x18,%rsp
    49e5:	5b                   	pop    %rbx
    49e6:	41 5c                	pop    %r12
    49e8:	41 5d                	pop    %r13
    49ea:	41 5e                	pop    %r14
    49ec:	41 5f                	pop    %r15
    49ee:	5d                   	pop    %rbp
    49ef:	c3                   	retq   
    49f0:	49 8b 44 24 68       	mov    0x68(%r12),%rax
    49f5:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
    49f9:	45 89 f8             	mov    %r15d,%r8d
    49fc:	4c 89 f2             	mov    %r14,%rdx
    49ff:	4c 89 ee             	mov    %r13,%rsi
    4a02:	4c 89 e7             	mov    %r12,%rdi
    4a05:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    4a09:	e8 00 00 00 00       	callq  4a0e <do_readv+0xde>
    4a0e:	48 85 c0             	test   %rax,%rax
    4a11:	0f 88 77 ff ff ff    	js     498e <do_readv+0x5e>
    4a17:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    4a1b:	f6 c3 02             	test   $0x2,%bl
    4a1e:	49 89 54 24 68       	mov    %rdx,0x68(%r12)
    4a23:	0f 84 6e ff ff ff    	je     4997 <do_readv+0x67>
    4a29:	4c 89 e7             	mov    %r12,%rdi
    4a2c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    4a30:	e8 00 00 00 00       	callq  4a35 <do_readv+0x105>
    4a35:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    4a39:	e9 59 ff ff ff       	jmpq   4997 <do_readv+0x67>
    4a3e:	48 c7 c0 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rax
    4a45:	e9 77 ff ff ff       	jmpq   49c1 <do_readv+0x91>
    4a4a:	e8 00 00 00 00       	callq  4a4f <do_readv+0x11f>
    4a4f:	90                   	nop

0000000000004a50 <__x64_sys_readv>:
    4a50:	e8 00 00 00 00       	callq  4a55 <__x64_sys_readv+0x5>
    4a55:	55                   	push   %rbp
    4a56:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    4a5a:	31 c9                	xor    %ecx,%ecx
    4a5c:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    4a60:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    4a64:	48 89 e5             	mov    %rsp,%rbp
    4a67:	e8 c4 fe ff ff       	callq  4930 <do_readv>
    4a6c:	5d                   	pop    %rbp
    4a6d:	c3                   	retq   
    4a6e:	66 90                	xchg   %ax,%ax

0000000000004a70 <__ia32_sys_readv>:
    4a70:	e8 00 00 00 00       	callq  4a75 <__ia32_sys_readv+0x5>
    4a75:	55                   	push   %rbp
    4a76:	8b 57 60             	mov    0x60(%rdi),%edx
    4a79:	31 c9                	xor    %ecx,%ecx
    4a7b:	8b 77 58             	mov    0x58(%rdi),%esi
    4a7e:	8b 7f 28             	mov    0x28(%rdi),%edi
    4a81:	48 89 e5             	mov    %rsp,%rbp
    4a84:	e8 a7 fe ff ff       	callq  4930 <do_readv>
    4a89:	5d                   	pop    %rbp
    4a8a:	c3                   	retq   
    4a8b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000004a90 <do_preadv>:
    4a90:	e8 00 00 00 00       	callq  4a95 <do_preadv+0x5>
    4a95:	55                   	push   %rbp
    4a96:	48 89 e5             	mov    %rsp,%rbp
    4a99:	41 57                	push   %r15
    4a9b:	41 56                	push   %r14
    4a9d:	41 55                	push   %r13
    4a9f:	41 54                	push   %r12
    4aa1:	53                   	push   %rbx
    4aa2:	48 83 ec 10          	sub    $0x10,%rsp
    4aa6:	48 85 c9             	test   %rcx,%rcx
    4aa9:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    4aad:	0f 88 96 00 00 00    	js     4b49 <do_preadv+0xb9>
    4ab3:	45 89 c6             	mov    %r8d,%r14d
    4ab6:	49 89 d5             	mov    %rdx,%r13
    4ab9:	49 89 f4             	mov    %rsi,%r12
    4abc:	e8 00 00 00 00       	callq  4ac1 <do_preadv+0x31>
    4ac1:	48 89 c3             	mov    %rax,%rbx
    4ac4:	48 c7 c0 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rax
    4acb:	49 89 df             	mov    %rbx,%r15
    4ace:	49 83 e7 fc          	and    $0xfffffffffffffffc,%r15
    4ad2:	74 25                	je     4af9 <do_preadv+0x69>
    4ad4:	83 e3 01             	and    $0x1,%ebx
    4ad7:	41 f6 47 44 08       	testb  $0x8,0x44(%r15)
    4adc:	75 3b                	jne    4b19 <do_preadv+0x89>
    4ade:	85 db                	test   %ebx,%ebx
    4ae0:	48 c7 c0 e3 ff ff ff 	mov    $0xffffffffffffffe3,%rax
    4ae7:	74 10                	je     4af9 <do_preadv+0x69>
    4ae9:	4c 89 ff             	mov    %r15,%rdi
    4aec:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    4af0:	e8 00 00 00 00       	callq  4af5 <do_preadv+0x65>
    4af5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    4af9:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    4b00:	00 00 
    4b02:	48 83 82 b0 0b 00 00 	addq   $0x1,0xbb0(%rdx)
    4b09:	01 
    4b0a:	48 83 c4 10          	add    $0x10,%rsp
    4b0e:	5b                   	pop    %rbx
    4b0f:	41 5c                	pop    %r12
    4b11:	41 5d                	pop    %r13
    4b13:	41 5e                	pop    %r14
    4b15:	41 5f                	pop    %r15
    4b17:	5d                   	pop    %rbp
    4b18:	c3                   	retq   
    4b19:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
    4b1d:	45 89 f0             	mov    %r14d,%r8d
    4b20:	4c 89 ea             	mov    %r13,%rdx
    4b23:	4c 89 e6             	mov    %r12,%rsi
    4b26:	4c 89 ff             	mov    %r15,%rdi
    4b29:	e8 00 00 00 00       	callq  4b2e <do_preadv+0x9e>
    4b2e:	85 db                	test   %ebx,%ebx
    4b30:	75 20                	jne    4b52 <do_preadv+0xc2>
    4b32:	48 85 c0             	test   %rax,%rax
    4b35:	7e c2                	jle    4af9 <do_preadv+0x69>
    4b37:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
    4b3e:	00 00 
    4b40:	48 01 82 a0 0b 00 00 	add    %rax,0xba0(%rdx)
    4b47:	eb b0                	jmp    4af9 <do_preadv+0x69>
    4b49:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
    4b50:	eb b8                	jmp    4b0a <do_preadv+0x7a>
    4b52:	4c 89 ff             	mov    %r15,%rdi
    4b55:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    4b59:	e8 00 00 00 00       	callq  4b5e <do_preadv+0xce>
    4b5e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    4b62:	eb ce                	jmp    4b32 <do_preadv+0xa2>
    4b64:	66 90                	xchg   %ax,%ax
    4b66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    4b6d:	00 00 00 

0000000000004b70 <__x64_sys_preadv>:
    4b70:	e8 00 00 00 00       	callq  4b75 <__x64_sys_preadv+0x5>
    4b75:	55                   	push   %rbp
    4b76:	48 8b 4f 38          	mov    0x38(%rdi),%rcx
    4b7a:	45 31 c0             	xor    %r8d,%r8d
    4b7d:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    4b81:	48 8b 77 68          	mov    0x68(%rdi),%rsi
    4b85:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    4b89:	48 89 e5             	mov    %rsp,%rbp
    4b8c:	e8 ff fe ff ff       	callq  4a90 <do_preadv>
    4b91:	5d                   	pop    %rbp
    4b92:	c3                   	retq   
    4b93:	0f 1f 00             	nopl   (%rax)
    4b96:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    4b9d:	00 00 00 

0000000000004ba0 <__ia32_sys_preadv>:
    4ba0:	e8 00 00 00 00       	callq  4ba5 <__ia32_sys_preadv+0x5>
    4ba5:	55                   	push   %rbp
    4ba6:	8b 4f 68             	mov    0x68(%rdi),%ecx
    4ba9:	45 31 c0             	xor    %r8d,%r8d
    4bac:	8b 57 60             	mov    0x60(%rdi),%edx
    4baf:	8b 77 58             	mov    0x58(%rdi),%esi
    4bb2:	8b 7f 28             	mov    0x28(%rdi),%edi
    4bb5:	48 89 e5             	mov    %rsp,%rbp
    4bb8:	e8 d3 fe ff ff       	callq  4a90 <do_preadv>
    4bbd:	5d                   	pop    %rbp
    4bbe:	c3                   	retq   
    4bbf:	90                   	nop

0000000000004bc0 <__ia32_sys_preadv2>:
    4bc0:	e8 00 00 00 00       	callq  4bc5 <__ia32_sys_preadv2+0x5>
    4bc5:	55                   	push   %rbp
    4bc6:	48 89 f8             	mov    %rdi,%rax
    4bc9:	8b 4f 68             	mov    0x68(%rdi),%ecx
    4bcc:	8b 57 60             	mov    0x60(%rdi),%edx
    4bcf:	8b 77 58             	mov    0x58(%rdi),%esi
    4bd2:	8b 7f 28             	mov    0x28(%rdi),%edi
    4bd5:	44 8b 40 20          	mov    0x20(%rax),%r8d
    4bd9:	48 89 e5             	mov    %rsp,%rbp
    4bdc:	e8 af fe ff ff       	callq  4a90 <do_preadv>
    4be1:	5d                   	pop    %rbp
    4be2:	c3                   	retq   
    4be3:	0f 1f 00             	nopl   (%rax)
    4be6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    4bed:	00 00 00 

0000000000004bf0 <__x64_sys_preadv2>:
    4bf0:	e8 00 00 00 00       	callq  4bf5 <__x64_sys_preadv2+0x5>
    4bf5:	48 89 f8             	mov    %rdi,%rax
    4bf8:	55                   	push   %rbp
    4bf9:	48 8b 57 60          	mov    0x60(%rdi),%rdx
    4bfd:	48 8b 48 38          	mov    0x38(%rax),%rcx
    4c01:	48 8b 7f 70          	mov    0x70(%rdi),%rdi
    4c05:	48 89 e5             	mov    %rsp,%rbp
    4c08:	4c 8b 40 40          	mov    0x40(%rax),%r8
    4c0c:	48 8b 70 68          	mov    0x68(%rax),%rsi
    4c10:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
    4c14:	74 07                	je     4c1d <__x64_sys_preadv2+0x2d>
    4c16:	e8 75 fe ff ff       	callq  4a90 <do_preadv>
    4c1b:	5d                   	pop    %rbp
    4c1c:	c3                   	retq   
    4c1d:	44 89 c1             	mov    %r8d,%ecx
    4c20:	e8 0b fd ff ff       	callq  4930 <do_readv>
    4c25:	5d                   	pop    %rbp
    4c26:	c3                   	retq   

Disassembly of section .altinstr_replacement:

0000000000000000 <.altinstr_replacement>:
   0:	0f 01 cb             	stac   
   3:	0f ae e8             	lfence 
   6:	0f 01 ca             	clac   
   9:	0f 01 cb             	stac   
   c:	0f ae e8             	lfence 
   f:	0f 01 ca             	clac   

Disassembly of section .fixup:

0000000000000000 <.fixup>:
   0:	b9 f2 ff ff ff       	mov    $0xfffffff2,%ecx
   5:	45 31 db             	xor    %r11d,%r11d
   8:	e9 00 00 00 00       	jmpq   d <.fixup+0xd>
   d:	b9 f2 ff ff ff       	mov    $0xfffffff2,%ecx
  12:	31 c0                	xor    %eax,%eax
  14:	e9 00 00 00 00       	jmpq   19 <__addressable_do_clone_file_range2124+0x1>
