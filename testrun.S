
test_run.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <bpf_modify_return_test>:
       0:	e8 00 00 00 00       	callq  5 <bpf_modify_return_test+0x5>
       5:	8b 06                	mov    (%rsi),%eax
       7:	55                   	push   %rbp
       8:	48 89 e5             	mov    %rsp,%rbp
       b:	83 c0 01             	add    $0x1,%eax
       e:	89 06                	mov    %eax,(%rsi)
      10:	01 f8                	add    %edi,%eax
      12:	5d                   	pop    %rbp
      13:	c3                   	retq   
      14:	66 90                	xchg   %ax,%ax
      16:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
      1d:	00 00 00 

0000000000000020 <perf_trace_bpf_test_finish>:
      20:	55                   	push   %rbp
      21:	48 89 e5             	mov    %rsp,%rbp
      24:	41 55                	push   %r13
      26:	41 54                	push   %r12
      28:	53                   	push   %rbx
      29:	49 89 fc             	mov    %rdi,%r12
      2c:	49 89 f5             	mov    %rsi,%r13
      2f:	48 83 ec 18          	sub    $0x18,%rsp
      33:	48 8b 5f 78          	mov    0x78(%rdi),%rbx
      37:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
      3e:	00 00 
      40:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
      44:	31 c0                	xor    %eax,%eax
      46:	65 48 03 1d 00 00 00 	add    %gs:0x0(%rip),%rbx        # 4e <perf_trace_bpf_test_finish+0x2e>
      4d:	00 
      4e:	48 8b 87 80 00 00 00 	mov    0x80(%rdi),%rax
      55:	48 85 c0             	test   %rax,%rax
      58:	75 22                	jne    7c <perf_trace_bpf_test_finish+0x5c>
      5a:	48 8b 03             	mov    (%rbx),%rax
      5d:	48 85 c0             	test   %rax,%rax
      60:	75 1a                	jne    7c <perf_trace_bpf_test_finish+0x5c>
      62:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
      66:	65 48 33 04 25 28 00 	xor    %gs:0x28,%rax
      6d:	00 00 
      6f:	75 78                	jne    e9 <perf_trace_bpf_test_finish+0xc9>
      71:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
      75:	5b                   	pop    %rbx
      76:	41 5c                	pop    %r12
      78:	41 5d                	pop    %r13
      7a:	5d                   	pop    %rbp
      7b:	c3                   	retq   
      7c:	48 8d 55 d4          	lea    -0x2c(%rbp),%rdx
      80:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
      84:	bf 0c 00 00 00       	mov    $0xc,%edi
      89:	e8 00 00 00 00       	callq  8e <perf_trace_bpf_test_finish+0x6e>
      8e:	48 85 c0             	test   %rax,%rax
      91:	74 cf                	je     62 <perf_trace_bpf_test_finish+0x42>
      93:	48 8b 55 08          	mov    0x8(%rbp),%rdx
      97:	4c 8b 4d d8          	mov    -0x28(%rbp),%r9
      9b:	48 89 c7             	mov    %rax,%rdi
      9e:	41 b8 01 00 00 00    	mov    $0x1,%r8d
      a4:	4c 89 e1             	mov    %r12,%rcx
      a7:	be 0c 00 00 00       	mov    $0xc,%esi
      ac:	49 89 91 80 00 00 00 	mov    %rdx,0x80(%r9)
      b3:	49 89 a9 98 00 00 00 	mov    %rbp,0x98(%r9)
      ba:	49 c7 81 88 00 00 00 	movq   $0x10,0x88(%r9)
      c1:	10 00 00 00 
      c5:	49 c7 81 90 00 00 00 	movq   $0x0,0x90(%r9)
      cc:	00 00 00 00 
      d0:	41 8b 55 00          	mov    0x0(%r13),%edx
      d4:	89 50 08             	mov    %edx,0x8(%rax)
      d7:	8b 55 d4             	mov    -0x2c(%rbp),%edx
      da:	6a 00                	pushq  $0x0
      dc:	53                   	push   %rbx
      dd:	e8 00 00 00 00       	callq  e2 <perf_trace_bpf_test_finish+0xc2>
      e2:	58                   	pop    %rax
      e3:	5a                   	pop    %rdx
      e4:	e9 79 ff ff ff       	jmpq   62 <perf_trace_bpf_test_finish+0x42>
      e9:	e8 00 00 00 00       	callq  ee <perf_trace_bpf_test_finish+0xce>
      ee:	66 90                	xchg   %ax,%ax

00000000000000f0 <trace_event_raw_event_bpf_test_finish>:
      f0:	55                   	push   %rbp
      f1:	48 89 e5             	mov    %rsp,%rbp
      f4:	41 55                	push   %r13
      f6:	41 54                	push   %r12
      f8:	53                   	push   %rbx
      f9:	49 89 fc             	mov    %rdi,%r12
      fc:	49 89 f5             	mov    %rsi,%r13
      ff:	48 83 ec 40          	sub    $0x40,%rsp
     103:	48 8b 5f 48          	mov    0x48(%rdi),%rbx
     107:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     10e:	00 00 
     110:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     114:	31 c0                	xor    %eax,%eax
     116:	f6 c7 01             	test   $0x1,%bh
     119:	75 0f                	jne    12a <trace_event_raw_event_bpf_test_finish+0x3a>
     11b:	f6 c3 80             	test   $0x80,%bl
     11e:	75 4c                	jne    16c <trace_event_raw_event_bpf_test_finish+0x7c>
     120:	f6 c3 40             	test   $0x40,%bl
     123:	75 1b                	jne    140 <trace_event_raw_event_bpf_test_finish+0x50>
     125:	80 e7 02             	and    $0x2,%bh
     128:	75 52                	jne    17c <trace_event_raw_event_bpf_test_finish+0x8c>
     12a:	48 8d 7d a8          	lea    -0x58(%rbp),%rdi
     12e:	ba 0c 00 00 00       	mov    $0xc,%edx
     133:	4c 89 e6             	mov    %r12,%rsi
     136:	e8 00 00 00 00       	callq  13b <trace_event_raw_event_bpf_test_finish+0x4b>
     13b:	48 85 c0             	test   %rax,%rax
     13e:	75 1a                	jne    15a <trace_event_raw_event_bpf_test_finish+0x6a>
     140:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     144:	65 48 33 04 25 28 00 	xor    %gs:0x28,%rax
     14b:	00 00 
     14d:	75 3b                	jne    18a <trace_event_raw_event_bpf_test_finish+0x9a>
     14f:	48 83 c4 40          	add    $0x40,%rsp
     153:	5b                   	pop    %rbx
     154:	41 5c                	pop    %r12
     156:	41 5d                	pop    %r13
     158:	5d                   	pop    %rbp
     159:	c3                   	retq   
     15a:	41 8b 55 00          	mov    0x0(%r13),%edx
     15e:	48 8d 7d a8          	lea    -0x58(%rbp),%rdi
     162:	89 50 08             	mov    %edx,0x8(%rax)
     165:	e8 00 00 00 00       	callq  16a <trace_event_raw_event_bpf_test_finish+0x7a>
     16a:	eb d4                	jmp    140 <trace_event_raw_event_bpf_test_finish+0x50>
     16c:	31 d2                	xor    %edx,%edx
     16e:	31 f6                	xor    %esi,%esi
     170:	e8 00 00 00 00       	callq  175 <trace_event_raw_event_bpf_test_finish+0x85>
     175:	f6 c3 40             	test   $0x40,%bl
     178:	74 ab                	je     125 <trace_event_raw_event_bpf_test_finish+0x35>
     17a:	eb c4                	jmp    140 <trace_event_raw_event_bpf_test_finish+0x50>
     17c:	4c 89 e7             	mov    %r12,%rdi
     17f:	e8 00 00 00 00       	callq  184 <trace_event_raw_event_bpf_test_finish+0x94>
     184:	84 c0                	test   %al,%al
     186:	75 b8                	jne    140 <trace_event_raw_event_bpf_test_finish+0x50>
     188:	eb a0                	jmp    12a <trace_event_raw_event_bpf_test_finish+0x3a>
     18a:	e8 00 00 00 00       	callq  18f <trace_event_raw_event_bpf_test_finish+0x9f>
     18f:	90                   	nop

0000000000000190 <trace_raw_output_bpf_test_finish>:
     190:	55                   	push   %rbp
     191:	48 89 d6             	mov    %rdx,%rsi
     194:	48 89 e5             	mov    %rsp,%rbp
     197:	41 54                	push   %r12
     199:	53                   	push   %rbx
     19a:	48 89 fb             	mov    %rdi,%rbx
     19d:	4c 8b a7 c8 20 00 00 	mov    0x20c8(%rdi),%r12
     1a4:	e8 00 00 00 00       	callq  1a9 <trace_raw_output_bpf_test_finish+0x19>
     1a9:	83 f8 01             	cmp    $0x1,%eax
     1ac:	74 05                	je     1b3 <trace_raw_output_bpf_test_finish+0x23>
     1ae:	5b                   	pop    %rbx
     1af:	41 5c                	pop    %r12
     1b1:	5d                   	pop    %rbp
     1b2:	c3                   	retq   
     1b3:	41 8b 54 24 08       	mov    0x8(%r12),%edx
     1b8:	48 81 c3 a0 10 00 00 	add    $0x10a0,%rbx
     1bf:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
     1c6:	48 89 df             	mov    %rbx,%rdi
     1c9:	e8 00 00 00 00       	callq  1ce <trace_raw_output_bpf_test_finish+0x3e>
     1ce:	48 89 df             	mov    %rbx,%rdi
     1d1:	e8 00 00 00 00       	callq  1d6 <trace_raw_output_bpf_test_finish+0x46>
     1d6:	5b                   	pop    %rbx
     1d7:	41 5c                	pop    %r12
     1d9:	5d                   	pop    %rbp
     1da:	c3                   	retq   
     1db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000001e0 <__bpf_trace_bpf_test_finish>:
     1e0:	55                   	push   %rbp
     1e1:	48 89 e5             	mov    %rsp,%rbp
     1e4:	e8 00 00 00 00       	callq  1e9 <__bpf_trace_bpf_test_finish+0x9>
     1e9:	5d                   	pop    %rbp
     1ea:	c3                   	retq   
     1eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000001f0 <bpf_test_run>:
     1f0:	e8 00 00 00 00       	callq  1f5 <bpf_test_run+0x5>
     1f5:	55                   	push   %rbp
     1f6:	48 89 e5             	mov    %rsp,%rbp
     1f9:	41 57                	push   %r15
     1fb:	41 56                	push   %r14
     1fd:	41 55                	push   %r13
     1ff:	41 54                	push   %r12
     201:	49 89 f6             	mov    %rsi,%r14
     204:	53                   	push   %rbx
     205:	31 f6                	xor    %esi,%esi
     207:	49 89 fc             	mov    %rdi,%r12
     20a:	41 89 d7             	mov    %edx,%r15d
     20d:	48 83 ec 60          	sub    $0x60,%rsp
     211:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
     215:	4c 89 45 80          	mov    %r8,-0x80(%rbp)
     219:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     220:	00 00 
     222:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     226:	31 c0                	xor    %eax,%eax
     228:	44 88 4d bf          	mov    %r9b,-0x41(%rbp)
     22c:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
     233:	00 
     234:	e8 00 00 00 00       	callq  239 <bpf_test_run+0x49>
     239:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
     23f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     243:	0f 87 f4 01 00 00    	ja     43d <bpf_test_run+0x24d>
     249:	be 01 00 00 00       	mov    $0x1,%esi
     24e:	4c 89 e7             	mov    %r12,%rdi
     251:	e8 00 00 00 00       	callq  256 <bpf_test_run+0x66>
     256:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
     25c:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
     260:	0f 87 fb 01 00 00    	ja     461 <bpf_test_run+0x271>
     266:	45 85 ff             	test   %r15d,%r15d
     269:	0f 84 af 00 00 00    	je     31e <bpf_test_run+0x12e>
     26f:	e8 00 00 00 00       	callq  274 <bpf_test_run+0x84>
     274:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
     278:	44 89 f8             	mov    %r15d,%eax
     27b:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
     282:	49 8d 44 24 38       	lea    0x38(%r12),%rax
     287:	44 89 7d b8          	mov    %r15d,-0x48(%rbp)
     28b:	31 db                	xor    %ebx,%ebx
     28d:	48 c7 45 a0 00 00 00 	movq   $0x0,-0x60(%rbp)
     294:	00 
     295:	49 c7 c5 00 00 00 00 	mov    $0x0,%r13
     29c:	49 89 c7             	mov    %rax,%r15
     29f:	eb 49                	jmp    2ea <bpf_test_run+0xfa>
     2a1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
     2a6:	49 8b 54 24 30       	mov    0x30(%r12),%rdx
     2ab:	4c 89 fe             	mov    %r15,%rsi
     2ae:	4c 89 f7             	mov    %r14,%rdi
     2b1:	e8 00 00 00 00       	callq  2b6 <bpf_test_run+0xc6>
     2b6:	89 c1                	mov    %eax,%ecx
     2b8:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     2bc:	89 08                	mov    %ecx,(%rax)
     2be:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
     2c5:	00 00 
     2c7:	48 8b 10             	mov    (%rax),%rdx
     2ca:	83 e2 04             	and    $0x4,%edx
     2cd:	0f 85 d6 00 00 00    	jne    3a9 <bpf_test_run+0x1b9>
     2d3:	48 8b 00             	mov    (%rax),%rax
     2d6:	a8 08                	test   $0x8,%al
     2d8:	0f 85 2a 01 00 00    	jne    408 <bpf_test_run+0x218>
     2de:	83 c3 01             	add    $0x1,%ebx
     2e1:	3b 5d b8             	cmp    -0x48(%rbp),%ebx
     2e4:	0f 83 4c 01 00 00    	jae    436 <bpf_test_run+0x246>
     2ea:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     2ee:	65 49 89 45 00       	mov    %rax,%gs:0x0(%r13)
     2f3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     2f7:	65 48 89 05 00 00 00 	mov    %rax,%gs:0x0(%rip)        # 2ff <bpf_test_run+0x10f>
     2fe:	00 
     2ff:	80 7d bf 00          	cmpb   $0x0,-0x41(%rbp)
     303:	75 9c                	jne    2a1 <bpf_test_run+0xb1>
     305:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
     30a:	49 8b 44 24 30       	mov    0x30(%r12),%rax
     30f:	4c 89 fe             	mov    %r15,%rsi
     312:	4c 89 f7             	mov    %r14,%rdi
     315:	e8 00 00 00 00       	callq  31a <bpf_test_run+0x12a>
     31a:	89 c1                	mov    %eax,%ecx
     31c:	eb 9a                	jmp    2b8 <bpf_test_run+0xc8>
     31e:	41 bf 01 00 00 00    	mov    $0x1,%r15d
     324:	e8 00 00 00 00       	callq  329 <bpf_test_run+0x139>
     329:	48 c7 85 78 ff ff ff 	movq   $0x1,-0x88(%rbp)
     330:	01 00 00 00 
     334:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
     338:	e9 45 ff ff ff       	jmpq   282 <bpf_test_run+0x92>
     33d:	e8 00 00 00 00       	callq  342 <bpf_test_run+0x152>
     342:	4c 89 fe             	mov    %r15,%rsi
     345:	48 89 45 98          	mov    %rax,-0x68(%rbp)
     349:	4c 89 f7             	mov    %r14,%rdi
     34c:	49 8b 44 24 30       	mov    0x30(%r12),%rax
     351:	e8 00 00 00 00       	callq  356 <bpf_test_run+0x166>
     356:	89 45 8c             	mov    %eax,-0x74(%rbp)
     359:	49 8b 44 24 20       	mov    0x20(%r12),%rax
     35e:	48 8b 90 f8 01 00 00 	mov    0x1f8(%rax),%rdx
     365:	65 48 03 15 00 00 00 	add    %gs:0x0(%rip),%rdx        # 36d <bpf_test_run+0x17d>
     36c:	00 
     36d:	48 83 02 01          	addq   $0x1,(%rdx)
     371:	48 89 55 90          	mov    %rdx,-0x70(%rbp)
     375:	e8 00 00 00 00       	callq  37a <bpf_test_run+0x18a>
     37a:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
     37e:	48 2b 45 98          	sub    -0x68(%rbp),%rax
     382:	48 01 42 08          	add    %rax,0x8(%rdx)
     386:	8b 4d 8c             	mov    -0x74(%rbp),%ecx
     389:	e9 2a ff ff ff       	jmpq   2b8 <bpf_test_run+0xc8>
     38e:	e8 00 00 00 00       	callq  393 <bpf_test_run+0x1a3>
     393:	49 8b 54 24 30       	mov    0x30(%r12),%rdx
     398:	4c 89 fe             	mov    %r15,%rsi
     39b:	4c 89 f7             	mov    %r14,%rdi
     39e:	48 89 45 98          	mov    %rax,-0x68(%rbp)
     3a2:	e8 00 00 00 00       	callq  3a7 <bpf_test_run+0x1b7>
     3a7:	eb ad                	jmp    356 <bpf_test_run+0x166>
     3a9:	bb fc ff ff ff       	mov    $0xfffffffc,%ebx
     3ae:	e8 00 00 00 00       	callq  3b3 <bpf_test_run+0x1c3>
     3b3:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
     3b7:	48 03 45 a0          	add    -0x60(%rbp),%rax
     3bb:	31 d2                	xor    %edx,%edx
     3bd:	48 8b 75 80          	mov    -0x80(%rbp),%rsi
     3c1:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
     3c5:	48 f7 b5 78 ff ff ff 	divq   -0x88(%rbp)
     3cc:	ba ff ff ff ff       	mov    $0xffffffff,%edx
     3d1:	48 39 d0             	cmp    %rdx,%rax
     3d4:	48 0f 47 c2          	cmova  %rdx,%rax
     3d8:	89 06                	mov    %eax,(%rsi)
     3da:	e8 00 00 00 00       	callq  3df <bpf_test_run+0x1ef>
     3df:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
     3e3:	e8 00 00 00 00       	callq  3e8 <bpf_test_run+0x1f8>
     3e8:	89 d8                	mov    %ebx,%eax
     3ea:	48 8b 5d d0          	mov    -0x30(%rbp),%rbx
     3ee:	65 48 33 1c 25 28 00 	xor    %gs:0x28,%rbx
     3f5:	00 00 
     3f7:	75 6f                	jne    468 <bpf_test_run+0x278>
     3f9:	48 83 c4 60          	add    $0x60,%rsp
     3fd:	5b                   	pop    %rbx
     3fe:	41 5c                	pop    %r12
     400:	41 5d                	pop    %r13
     402:	41 5e                	pop    %r14
     404:	41 5f                	pop    %r15
     406:	5d                   	pop    %rbp
     407:	c3                   	retq   
     408:	e8 00 00 00 00       	callq  40d <bpf_test_run+0x21d>
     40d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
     411:	48 2b 55 a8          	sub    -0x58(%rbp),%rdx
     415:	48 01 d0             	add    %rdx,%rax
     418:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
     41c:	e8 00 00 00 00       	callq  421 <bpf_test_run+0x231>
     421:	e8 00 00 00 00       	callq  426 <bpf_test_run+0x236>
     426:	83 c3 01             	add    $0x1,%ebx
     429:	3b 5d b8             	cmp    -0x48(%rbp),%ebx
     42c:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
     430:	0f 82 b4 fe ff ff    	jb     2ea <bpf_test_run+0xfa>
     436:	31 db                	xor    %ebx,%ebx
     438:	e9 71 ff ff ff       	jmpq   3ae <bpf_test_run+0x1be>
     43d:	31 c0                	xor    %eax,%eax
     43f:	48 c7 44 c5 c0 00 00 	movq   $0x0,-0x40(%rbp,%rax,8)
     446:	00 00 
     448:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
     44c:	bb f4 ff ff ff       	mov    $0xfffffff4,%ebx
     451:	e8 00 00 00 00       	callq  456 <bpf_test_run+0x266>
     456:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
     45a:	e8 00 00 00 00       	callq  45f <bpf_test_run+0x26f>
     45f:	eb 87                	jmp    3e8 <bpf_test_run+0x1f8>
     461:	b8 01 00 00 00       	mov    $0x1,%eax
     466:	eb d7                	jmp    43f <bpf_test_run+0x24f>
     468:	e8 00 00 00 00       	callq  46d <bpf_test_run+0x27d>
     46d:	0f 1f 00             	nopl   (%rax)

0000000000000470 <bpf_ctx_finish.isra.14>:
     470:	e8 00 00 00 00       	callq  475 <bpf_ctx_finish.isra.14+0x5>
     475:	55                   	push   %rbp
     476:	48 89 e5             	mov    %rsp,%rbp
     479:	41 57                	push   %r15
     47b:	41 56                	push   %r14
     47d:	41 55                	push   %r13
     47f:	41 54                	push   %r12
     481:	53                   	push   %rbx
     482:	48 83 ec 08          	sub    $0x8,%rsp
     486:	48 85 c9             	test   %rcx,%rcx
     489:	44 89 45 d4          	mov    %r8d,-0x2c(%rbp)
     48d:	74 6f                	je     4fe <bpf_ctx_finish.isra.14+0x8e>
     48f:	48 85 f6             	test   %rsi,%rsi
     492:	74 6a                	je     4fe <bpf_ctx_finish.isra.14+0x8e>
     494:	44 8b 65 d4          	mov    -0x2c(%rbp),%r12d
     498:	41 bf f2 ff ff ff    	mov    $0xfffffff2,%r15d
     49e:	41 39 fc             	cmp    %edi,%r12d
     4a1:	76 09                	jbe    4ac <bpf_ctx_finish.isra.14+0x3c>
     4a3:	41 89 fc             	mov    %edi,%r12d
     4a6:	41 bf e4 ff ff ff    	mov    $0xffffffe4,%r15d
     4ac:	49 81 fc ff ff ff 7f 	cmp    $0x7fffffff,%r12
     4b3:	77 5e                	ja     513 <bpf_ctx_finish.isra.14+0xa3>
     4b5:	48 89 cb             	mov    %rcx,%rbx
     4b8:	48 89 cf             	mov    %rcx,%rdi
     4bb:	49 89 f5             	mov    %rsi,%r13
     4be:	49 89 d6             	mov    %rdx,%r14
     4c1:	4c 89 e6             	mov    %r12,%rsi
     4c4:	ba 01 00 00 00       	mov    $0x1,%edx
     4c9:	e8 00 00 00 00       	callq  4ce <bpf_ctx_finish.isra.14+0x5e>
     4ce:	4c 89 e2             	mov    %r12,%rdx
     4d1:	48 89 de             	mov    %rbx,%rsi
     4d4:	4c 89 ef             	mov    %r13,%rdi
     4d7:	e8 00 00 00 00       	callq  4dc <bpf_ctx_finish.isra.14+0x6c>
     4dc:	48 85 c0             	test   %rax,%rax
     4df:	75 20                	jne    501 <bpf_ctx_finish.isra.14+0x91>
     4e1:	49 8d 7e 2c          	lea    0x2c(%r14),%rdi
     4e5:	48 8d 75 d4          	lea    -0x2c(%rbp),%rsi
     4e9:	ba 04 00 00 00       	mov    $0x4,%edx
     4ee:	e8 00 00 00 00       	callq  4f3 <bpf_ctx_finish.isra.14+0x83>
     4f3:	48 85 c0             	test   %rax,%rax
     4f6:	75 09                	jne    501 <bpf_ctx_finish.isra.14+0x91>
     4f8:	41 83 ff e4          	cmp    $0xffffffe4,%r15d
     4fc:	74 03                	je     501 <bpf_ctx_finish.isra.14+0x91>
     4fe:	45 31 ff             	xor    %r15d,%r15d
     501:	48 83 c4 08          	add    $0x8,%rsp
     505:	44 89 f8             	mov    %r15d,%eax
     508:	5b                   	pop    %rbx
     509:	41 5c                	pop    %r12
     50b:	41 5d                	pop    %r13
     50d:	41 5e                	pop    %r14
     50f:	41 5f                	pop    %r15
     511:	5d                   	pop    %rbp
     512:	c3                   	retq   
     513:	0f 0b                	ud2    
     515:	eb ea                	jmp    501 <bpf_ctx_finish.isra.14+0x91>
     517:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     51e:	00 00 

0000000000000520 <bpf_test_init.isra.17>:
     520:	e8 00 00 00 00       	callq  525 <bpf_test_init.isra.17+0x5>
     525:	55                   	push   %rbp
     526:	83 fe 0d             	cmp    $0xd,%esi
     529:	48 89 e5             	mov    %rsp,%rbp
     52c:	41 56                	push   %r14
     52e:	41 55                	push   %r13
     530:	41 54                	push   %r12
     532:	53                   	push   %rbx
     533:	48 c7 c3 ea ff ff ff 	mov    $0xffffffffffffffea,%rbx
     53a:	76 19                	jbe    555 <bpf_test_init.isra.17+0x35>
     53c:	41 89 c8             	mov    %ecx,%r8d
     53f:	b8 00 10 00 00       	mov    $0x1000,%eax
     544:	41 89 d6             	mov    %edx,%r14d
     547:	4c 29 c0             	sub    %r8,%rax
     54a:	41 89 f5             	mov    %esi,%r13d
     54d:	4c 29 f0             	sub    %r14,%rax
     550:	49 39 c5             	cmp    %rax,%r13
     553:	76 0c                	jbe    561 <bpf_test_init.isra.17+0x41>
     555:	48 89 d8             	mov    %rbx,%rax
     558:	5b                   	pop    %rbx
     559:	41 5c                	pop    %r12
     55b:	41 5d                	pop    %r13
     55d:	41 5e                	pop    %r14
     55f:	5d                   	pop    %rbp
     560:	c3                   	retq   
     561:	01 ca                	add    %ecx,%edx
     563:	49 89 fc             	mov    %rdi,%r12
     566:	8d 3c 32             	lea    (%rdx,%rsi,1),%edi
     569:	be c0 0d 10 00       	mov    $0x100dc0,%esi
     56e:	e8 00 00 00 00       	callq  573 <bpf_test_init.isra.17+0x53>
     573:	48 85 c0             	test   %rax,%rax
     576:	48 89 c3             	mov    %rax,%rbx
     579:	74 34                	je     5af <bpf_test_init.isra.17+0x8f>
     57b:	49 01 c6             	add    %rax,%r14
     57e:	31 d2                	xor    %edx,%edx
     580:	4c 89 ee             	mov    %r13,%rsi
     583:	4c 89 f7             	mov    %r14,%rdi
     586:	e8 00 00 00 00       	callq  58b <bpf_test_init.isra.17+0x6b>
     58b:	4c 89 ea             	mov    %r13,%rdx
     58e:	4c 89 e6             	mov    %r12,%rsi
     591:	4c 89 f7             	mov    %r14,%rdi
     594:	e8 00 00 00 00       	callq  599 <bpf_test_init.isra.17+0x79>
     599:	48 85 c0             	test   %rax,%rax
     59c:	74 b7                	je     555 <bpf_test_init.isra.17+0x35>
     59e:	48 89 df             	mov    %rbx,%rdi
     5a1:	48 c7 c3 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rbx
     5a8:	e8 00 00 00 00       	callq  5ad <bpf_test_init.isra.17+0x8d>
     5ad:	eb a6                	jmp    555 <bpf_test_init.isra.17+0x35>
     5af:	48 c7 c3 f4 ff ff ff 	mov    $0xfffffffffffffff4,%rbx
     5b6:	eb 9d                	jmp    555 <bpf_test_init.isra.17+0x35>
     5b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     5bf:	00 

00000000000005c0 <bpf_test_finish.isra.16>:
     5c0:	e8 00 00 00 00       	callq  5c5 <bpf_test_finish.isra.16+0x5>
     5c5:	55                   	push   %rbp
     5c6:	48 89 e5             	mov    %rsp,%rbp
     5c9:	41 56                	push   %r14
     5cb:	41 55                	push   %r13
     5cd:	41 54                	push   %r12
     5cf:	53                   	push   %rbx
     5d0:	49 89 f4             	mov    %rsi,%r12
     5d3:	49 89 d5             	mov    %rdx,%r13
     5d6:	49 89 ce             	mov    %rcx,%r14
     5d9:	48 83 ec 18          	sub    $0x18,%rsp
     5dd:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
     5e1:	44 89 4d c8          	mov    %r9d,-0x38(%rbp)
     5e5:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     5ec:	00 00 
     5ee:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     5f2:	31 c0                	xor    %eax,%eax
     5f4:	41 39 f8             	cmp    %edi,%r8d
     5f7:	c7 45 d4 f2 ff ff ff 	movl   $0xfffffff2,-0x2c(%rbp)
     5fe:	76 08                	jbe    608 <bpf_test_finish.isra.16+0x48>
     600:	85 ff                	test   %edi,%edi
     602:	0f 85 fc 00 00 00    	jne    704 <bpf_test_finish.isra.16+0x144>
     608:	4d 85 e4             	test   %r12,%r12
     60b:	74 33                	je     640 <bpf_test_finish.isra.16+0x80>
     60d:	44 89 c3             	mov    %r8d,%ebx
     610:	48 81 fb ff ff ff 7f 	cmp    $0x7fffffff,%rbx
     617:	0f 87 f6 00 00 00    	ja     713 <bpf_test_finish.isra.16+0x153>
     61d:	ba 01 00 00 00       	mov    $0x1,%edx
     622:	48 89 de             	mov    %rbx,%rsi
     625:	4c 89 f7             	mov    %r14,%rdi
     628:	e8 00 00 00 00       	callq  62d <bpf_test_finish.isra.16+0x6d>
     62d:	48 89 da             	mov    %rbx,%rdx
     630:	4c 89 f6             	mov    %r14,%rsi
     633:	4c 89 e7             	mov    %r12,%rdi
     636:	e8 00 00 00 00       	callq  63b <bpf_test_finish.isra.16+0x7b>
     63b:	48 85 c0             	test   %rax,%rax
     63e:	75 17                	jne    657 <bpf_test_finish.isra.16+0x97>
     640:	49 8d 7d 0c          	lea    0xc(%r13),%rdi
     644:	48 8d 75 cc          	lea    -0x34(%rbp),%rsi
     648:	ba 04 00 00 00       	mov    $0x4,%edx
     64d:	e8 00 00 00 00       	callq  652 <bpf_test_finish.isra.16+0x92>
     652:	48 85 c0             	test   %rax,%rax
     655:	74 65                	je     6bc <bpf_test_finish.isra.16+0xfc>
     657:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
     65c:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
     660:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
     667:	00 00 
     669:	8b 45 d4             	mov    -0x2c(%rbp),%eax
     66c:	0f 85 a8 00 00 00    	jne    71a <bpf_test_finish.isra.16+0x15a>
     672:	48 83 c4 18          	add    $0x18,%rsp
     676:	5b                   	pop    %rbx
     677:	41 5c                	pop    %r12
     679:	41 5d                	pop    %r13
     67b:	41 5e                	pop    %r14
     67d:	5d                   	pop    %rbp
     67e:	c3                   	retq   
     67f:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 686 <bpf_test_finish.isra.16+0xc6>
     686:	89 c0                	mov    %eax,%eax
     688:	48 0f a3 05 00 00 00 	bt     %rax,0x0(%rip)        # 690 <bpf_test_finish.isra.16+0xd0>
     68f:	00 
     690:	73 ca                	jae    65c <bpf_test_finish.isra.16+0x9c>
     692:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 699 <bpf_test_finish.isra.16+0xd9>
     699:	48 85 db             	test   %rbx,%rbx
     69c:	74 1c                	je     6ba <bpf_test_finish.isra.16+0xfa>
     69e:	48 8b 03             	mov    (%rbx),%rax
     6a1:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
     6a5:	48 83 c3 18          	add    $0x18,%rbx
     6a9:	48 8d 75 d4          	lea    -0x2c(%rbp),%rsi
     6ad:	e8 00 00 00 00       	callq  6b2 <bpf_test_finish.isra.16+0xf2>
     6b2:	48 8b 03             	mov    (%rbx),%rax
     6b5:	48 85 c0             	test   %rax,%rax
     6b8:	75 e7                	jne    6a1 <bpf_test_finish.isra.16+0xe1>
     6ba:	eb a0                	jmp    65c <bpf_test_finish.isra.16+0x9c>
     6bc:	49 8d 7d 04          	lea    0x4(%r13),%rdi
     6c0:	48 8d 75 c8          	lea    -0x38(%rbp),%rsi
     6c4:	ba 04 00 00 00       	mov    $0x4,%edx
     6c9:	e8 00 00 00 00       	callq  6ce <bpf_test_finish.isra.16+0x10e>
     6ce:	48 85 c0             	test   %rax,%rax
     6d1:	75 84                	jne    657 <bpf_test_finish.isra.16+0x97>
     6d3:	49 8d 7d 24          	lea    0x24(%r13),%rdi
     6d7:	48 8d 75 10          	lea    0x10(%rbp),%rsi
     6db:	ba 04 00 00 00       	mov    $0x4,%edx
     6e0:	e8 00 00 00 00       	callq  6e5 <bpf_test_finish.isra.16+0x125>
     6e5:	48 85 c0             	test   %rax,%rax
     6e8:	0f 85 69 ff ff ff    	jne    657 <bpf_test_finish.isra.16+0x97>
     6ee:	83 7d d4 e4          	cmpl   $0xffffffe4,-0x2c(%rbp)
     6f2:	0f 84 5f ff ff ff    	je     657 <bpf_test_finish.isra.16+0x97>
     6f8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
     6ff:	e9 53 ff ff ff       	jmpq   657 <bpf_test_finish.isra.16+0x97>
     704:	c7 45 d4 e4 ff ff ff 	movl   $0xffffffe4,-0x2c(%rbp)
     70b:	41 89 f8             	mov    %edi,%r8d
     70e:	e9 f5 fe ff ff       	jmpq   608 <bpf_test_finish.isra.16+0x48>
     713:	0f 0b                	ud2    
     715:	e9 3d ff ff ff       	jmpq   657 <bpf_test_finish.isra.16+0x97>
     71a:	e8 00 00 00 00       	callq  71f <bpf_test_finish.isra.16+0x15f>
     71f:	90                   	nop

0000000000000720 <bpf_ctx_init>:
     720:	e8 00 00 00 00       	callq  725 <bpf_ctx_init+0x5>
     725:	55                   	push   %rbp
     726:	48 89 e5             	mov    %rsp,%rbp
     729:	41 57                	push   %r15
     72b:	41 56                	push   %r14
     72d:	41 55                	push   %r13
     72f:	41 54                	push   %r12
     731:	53                   	push   %rbx
     732:	48 83 ec 08          	sub    $0x8,%rsp
     736:	4c 8b 6f 30          	mov    0x30(%rdi),%r13
     73a:	44 8b 77 28          	mov    0x28(%rdi),%r14d
     73e:	4c 89 e8             	mov    %r13,%rax
     741:	48 0b 47 38          	or     0x38(%rdi),%rax
     745:	0f 84 96 00 00 00    	je     7e1 <bpf_ctx_init+0xc1>
     74b:	41 89 f7             	mov    %esi,%r15d
     74e:	be c0 0d 10 00       	mov    $0x100dc0,%esi
     753:	4c 89 ff             	mov    %r15,%rdi
     756:	4c 89 fb             	mov    %r15,%rbx
     759:	e8 00 00 00 00       	callq  75e <bpf_ctx_init+0x3e>
     75e:	48 85 c0             	test   %rax,%rax
     761:	49 89 c4             	mov    %rax,%r12
     764:	74 61                	je     7c7 <bpf_ctx_init+0xa7>
     766:	4d 85 ed             	test   %r13,%r13
     769:	75 12                	jne    77d <bpf_ctx_init+0x5d>
     76b:	48 83 c4 08          	add    $0x8,%rsp
     76f:	4c 89 e0             	mov    %r12,%rax
     772:	5b                   	pop    %rbx
     773:	41 5c                	pop    %r12
     775:	41 5d                	pop    %r13
     777:	41 5e                	pop    %r14
     779:	41 5f                	pop    %r15
     77b:	5d                   	pop    %rbp
     77c:	c3                   	retq   
     77d:	44 89 f2             	mov    %r14d,%edx
     780:	4c 89 fe             	mov    %r15,%rsi
     783:	4c 89 ef             	mov    %r13,%rdi
     786:	e8 00 00 00 00       	callq  78b <bpf_ctx_init+0x6b>
     78b:	85 c0                	test   %eax,%eax
     78d:	75 41                	jne    7d0 <bpf_ctx_init+0xb0>
     78f:	45 39 fe             	cmp    %r15d,%r14d
     792:	4c 89 e7             	mov    %r12,%rdi
     795:	49 0f 46 de          	cmovbe %r14,%rbx
     799:	31 d2                	xor    %edx,%edx
     79b:	48 89 de             	mov    %rbx,%rsi
     79e:	e8 00 00 00 00       	callq  7a3 <bpf_ctx_init+0x83>
     7a3:	48 89 da             	mov    %rbx,%rdx
     7a6:	4c 89 ee             	mov    %r13,%rsi
     7a9:	4c 89 e7             	mov    %r12,%rdi
     7ac:	e8 00 00 00 00       	callq  7b1 <bpf_ctx_init+0x91>
     7b1:	48 85 c0             	test   %rax,%rax
     7b4:	74 b5                	je     76b <bpf_ctx_init+0x4b>
     7b6:	4c 89 e7             	mov    %r12,%rdi
     7b9:	49 c7 c4 f2 ff ff ff 	mov    $0xfffffffffffffff2,%r12
     7c0:	e8 00 00 00 00       	callq  7c5 <bpf_ctx_init+0xa5>
     7c5:	eb a4                	jmp    76b <bpf_ctx_init+0x4b>
     7c7:	49 c7 c4 f4 ff ff ff 	mov    $0xfffffffffffffff4,%r12
     7ce:	eb 9b                	jmp    76b <bpf_ctx_init+0x4b>
     7d0:	4c 89 e7             	mov    %r12,%rdi
     7d3:	89 45 d4             	mov    %eax,-0x2c(%rbp)
     7d6:	e8 00 00 00 00       	callq  7db <bpf_ctx_init+0xbb>
     7db:	4c 63 65 d4          	movslq -0x2c(%rbp),%r12
     7df:	eb 8a                	jmp    76b <bpf_ctx_init+0x4b>
     7e1:	45 31 e4             	xor    %r12d,%r12d
     7e4:	eb 85                	jmp    76b <bpf_ctx_init+0x4b>
     7e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     7ed:	00 00 00 

00000000000007f0 <bpf_fentry_test1>:
     7f0:	e8 00 00 00 00       	callq  7f5 <bpf_fentry_test1+0x5>
     7f5:	55                   	push   %rbp
     7f6:	8d 47 01             	lea    0x1(%rdi),%eax
     7f9:	48 89 e5             	mov    %rsp,%rbp
     7fc:	5d                   	pop    %rbp
     7fd:	c3                   	retq   
     7fe:	66 90                	xchg   %ax,%ax

0000000000000800 <bpf_fentry_test2>:
     800:	e8 00 00 00 00       	callq  805 <bpf_fentry_test2+0x5>
     805:	55                   	push   %rbp
     806:	8d 04 37             	lea    (%rdi,%rsi,1),%eax
     809:	48 89 e5             	mov    %rsp,%rbp
     80c:	5d                   	pop    %rbp
     80d:	c3                   	retq   
     80e:	66 90                	xchg   %ax,%ax

0000000000000810 <bpf_fentry_test3>:
     810:	e8 00 00 00 00       	callq  815 <bpf_fentry_test3+0x5>
     815:	55                   	push   %rbp
     816:	40 0f be c7          	movsbl %dil,%eax
     81a:	01 f0                	add    %esi,%eax
     81c:	48 89 e5             	mov    %rsp,%rbp
     81f:	01 d0                	add    %edx,%eax
     821:	5d                   	pop    %rbp
     822:	c3                   	retq   
     823:	0f 1f 00             	nopl   (%rax)
     826:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     82d:	00 00 00 

0000000000000830 <bpf_fentry_test4>:
     830:	e8 00 00 00 00       	callq  835 <bpf_fentry_test4+0x5>
     835:	55                   	push   %rbp
     836:	01 ca                	add    %ecx,%edx
     838:	40 0f be c6          	movsbl %sil,%eax
     83c:	01 d0                	add    %edx,%eax
     83e:	48 89 e5             	mov    %rsp,%rbp
     841:	01 f8                	add    %edi,%eax
     843:	5d                   	pop    %rbp
     844:	c3                   	retq   
     845:	90                   	nop
     846:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     84d:	00 00 00 

0000000000000850 <bpf_fentry_test5>:
     850:	e8 00 00 00 00       	callq  855 <bpf_fentry_test5+0x5>
     855:	44 01 c1             	add    %r8d,%ecx
     858:	0f bf c2             	movswl %dx,%eax
     85b:	55                   	push   %rbp
     85c:	01 c8                	add    %ecx,%eax
     85e:	01 f8                	add    %edi,%eax
     860:	48 89 e5             	mov    %rsp,%rbp
     863:	01 f0                	add    %esi,%eax
     865:	5d                   	pop    %rbp
     866:	c3                   	retq   
     867:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     86e:	00 00 

0000000000000870 <bpf_fentry_test6>:
     870:	e8 00 00 00 00       	callq  875 <bpf_fentry_test6+0x5>
     875:	44 01 c1             	add    %r8d,%ecx
     878:	0f bf c2             	movswl %dx,%eax
     87b:	55                   	push   %rbp
     87c:	44 01 c9             	add    %r9d,%ecx
     87f:	01 c8                	add    %ecx,%eax
     881:	48 89 e5             	mov    %rsp,%rbp
     884:	01 f8                	add    %edi,%eax
     886:	01 f0                	add    %esi,%eax
     888:	5d                   	pop    %rbp
     889:	c3                   	retq   
     88a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000890 <bpf_prog_test_run_tracing>:
     890:	e8 00 00 00 00       	callq  895 <bpf_prog_test_run_tracing+0x5>
     895:	55                   	push   %rbp
     896:	48 89 e5             	mov    %rsp,%rbp
     899:	53                   	push   %rbx
     89a:	48 83 ec 18          	sub    $0x18,%rsp
     89e:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%rbp)
     8a5:	c7 45 e8 f2 ff ff ff 	movl   $0xfffffff2,-0x18(%rbp)
     8ac:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     8b3:	00 00 
     8b5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     8b9:	31 c0                	xor    %eax,%eax
     8bb:	8b 47 08             	mov    0x8(%rdi),%eax
     8be:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
     8c5:	83 f8 18             	cmp    $0x18,%eax
     8c8:	72 51                	jb     91b <bpf_prog_test_run_tracing+0x8b>
     8ca:	83 f8 19             	cmp    $0x19,%eax
     8cd:	48 89 d3             	mov    %rdx,%rbx
     8d0:	0f 86 a4 00 00 00    	jbe    97a <bpf_prog_test_run_tracing+0xea>
     8d6:	83 f8 1a             	cmp    $0x1a,%eax
     8d9:	75 40                	jne    91b <bpf_prog_test_run_tracing+0x8b>
     8db:	48 8d 75 e4          	lea    -0x1c(%rbp),%rsi
     8df:	bf 01 00 00 00       	mov    $0x1,%edi
     8e4:	e8 00 00 00 00       	callq  8e9 <bpf_prog_test_run_tracing+0x59>
     8e9:	31 d2                	xor    %edx,%edx
     8eb:	83 7d e4 02          	cmpl   $0x2,-0x1c(%rbp)
     8ef:	0f 95 c2             	setne  %dl
     8f2:	c1 e2 10             	shl    $0x10,%edx
     8f5:	0f b7 c0             	movzwl %ax,%eax
     8f8:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
     8fc:	09 c2                	or     %eax,%edx
     8fe:	48 8d 75 ec          	lea    -0x14(%rbp),%rsi
     902:	89 55 ec             	mov    %edx,-0x14(%rbp)
     905:	ba 04 00 00 00       	mov    $0x4,%edx
     90a:	e8 00 00 00 00       	callq  90f <bpf_prog_test_run_tracing+0x7f>
     90f:	48 85 c0             	test   %rax,%rax
     912:	75 07                	jne    91b <bpf_prog_test_run_tracing+0x8b>
     914:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
     91b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
     920:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
     924:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
     92b:	00 00 
     92d:	8b 45 e8             	mov    -0x18(%rbp),%eax
     930:	0f 85 09 01 00 00    	jne    a3f <bpf_prog_test_run_tracing+0x1af>
     936:	48 83 c4 18          	add    $0x18,%rsp
     93a:	5b                   	pop    %rbx
     93b:	5d                   	pop    %rbp
     93c:	c3                   	retq   
     93d:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 944 <bpf_prog_test_run_tracing+0xb4>
     944:	89 c0                	mov    %eax,%eax
     946:	48 0f a3 05 00 00 00 	bt     %rax,0x0(%rip)        # 94e <bpf_prog_test_run_tracing+0xbe>
     94d:	00 
     94e:	73 d0                	jae    920 <bpf_prog_test_run_tracing+0x90>
     950:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 957 <bpf_prog_test_run_tracing+0xc7>
     957:	48 85 db             	test   %rbx,%rbx
     95a:	74 1c                	je     978 <bpf_prog_test_run_tracing+0xe8>
     95c:	48 8b 03             	mov    (%rbx),%rax
     95f:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
     963:	48 83 c3 18          	add    $0x18,%rbx
     967:	48 8d 75 e8          	lea    -0x18(%rbp),%rsi
     96b:	e8 00 00 00 00       	callq  970 <bpf_prog_test_run_tracing+0xe0>
     970:	48 8b 03             	mov    (%rbx),%rax
     973:	48 85 c0             	test   %rax,%rax
     976:	75 e7                	jne    95f <bpf_prog_test_run_tracing+0xcf>
     978:	eb a6                	jmp    920 <bpf_prog_test_run_tracing+0x90>
     97a:	bf 01 00 00 00       	mov    $0x1,%edi
     97f:	e8 00 00 00 00       	callq  984 <bpf_prog_test_run_tracing+0xf4>
     984:	83 f8 02             	cmp    $0x2,%eax
     987:	75 92                	jne    91b <bpf_prog_test_run_tracing+0x8b>
     989:	be 03 00 00 00       	mov    $0x3,%esi
     98e:	bf 02 00 00 00       	mov    $0x2,%edi
     993:	e8 00 00 00 00       	callq  998 <bpf_prog_test_run_tracing+0x108>
     998:	83 f8 05             	cmp    $0x5,%eax
     99b:	0f 85 7a ff ff ff    	jne    91b <bpf_prog_test_run_tracing+0x8b>
     9a1:	ba 06 00 00 00       	mov    $0x6,%edx
     9a6:	be 05 00 00 00       	mov    $0x5,%esi
     9ab:	bf 04 00 00 00       	mov    $0x4,%edi
     9b0:	e8 00 00 00 00       	callq  9b5 <bpf_prog_test_run_tracing+0x125>
     9b5:	83 f8 0f             	cmp    $0xf,%eax
     9b8:	0f 85 5d ff ff ff    	jne    91b <bpf_prog_test_run_tracing+0x8b>
     9be:	b9 0a 00 00 00       	mov    $0xa,%ecx
     9c3:	ba 09 00 00 00       	mov    $0x9,%edx
     9c8:	be 08 00 00 00       	mov    $0x8,%esi
     9cd:	bf 07 00 00 00       	mov    $0x7,%edi
     9d2:	e8 00 00 00 00       	callq  9d7 <bpf_prog_test_run_tracing+0x147>
     9d7:	83 f8 22             	cmp    $0x22,%eax
     9da:	0f 85 3b ff ff ff    	jne    91b <bpf_prog_test_run_tracing+0x8b>
     9e0:	41 b8 0f 00 00 00    	mov    $0xf,%r8d
     9e6:	b9 0e 00 00 00       	mov    $0xe,%ecx
     9eb:	ba 0d 00 00 00       	mov    $0xd,%edx
     9f0:	be 0c 00 00 00       	mov    $0xc,%esi
     9f5:	bf 0b 00 00 00       	mov    $0xb,%edi
     9fa:	e8 00 00 00 00       	callq  9ff <bpf_prog_test_run_tracing+0x16f>
     9ff:	83 f8 41             	cmp    $0x41,%eax
     a02:	0f 85 13 ff ff ff    	jne    91b <bpf_prog_test_run_tracing+0x8b>
     a08:	41 b9 15 00 00 00    	mov    $0x15,%r9d
     a0e:	41 b8 14 00 00 00    	mov    $0x14,%r8d
     a14:	b9 13 00 00 00       	mov    $0x13,%ecx
     a19:	ba 12 00 00 00       	mov    $0x12,%edx
     a1e:	be 11 00 00 00       	mov    $0x11,%esi
     a23:	bf 10 00 00 00       	mov    $0x10,%edi
     a28:	e8 00 00 00 00       	callq  a2d <bpf_prog_test_run_tracing+0x19d>
     a2d:	83 f8 6f             	cmp    $0x6f,%eax
     a30:	0f 85 e5 fe ff ff    	jne    91b <bpf_prog_test_run_tracing+0x8b>
     a36:	31 c0                	xor    %eax,%eax
     a38:	31 d2                	xor    %edx,%edx
     a3a:	e9 b3 fe ff ff       	jmpq   8f2 <bpf_prog_test_run_tracing+0x62>
     a3f:	e8 00 00 00 00       	callq  a44 <bpf_prog_test_run_tracing+0x1b4>
     a44:	66 90                	xchg   %ax,%ax
     a46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     a4d:	00 00 00 

0000000000000a50 <bpf_prog_test_run_skb>:
     a50:	e8 00 00 00 00       	callq  a55 <bpf_prog_test_run_skb+0x5>
     a55:	55                   	push   %rbp
     a56:	b9 40 01 00 00       	mov    $0x140,%ecx
     a5b:	48 89 e5             	mov    %rsp,%rbp
     a5e:	41 57                	push   %r15
     a60:	41 56                	push   %r14
     a62:	41 55                	push   %r13
     a64:	41 54                	push   %r12
     a66:	49 89 f4             	mov    %rsi,%r12
     a69:	53                   	push   %rbx
     a6a:	48 83 ec 38          	sub    $0x38,%rsp
     a6e:	44 8b 7e 08          	mov    0x8(%rsi),%r15d
     a72:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
     a76:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     a7d:	00 00 
     a7f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     a83:	31 c0                	xor    %eax,%eax
     a85:	48 8b 7e 10          	mov    0x10(%rsi),%rdi
     a89:	8b 46 20             	mov    0x20(%rsi),%eax
     a8c:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
     a90:	44 89 fe             	mov    %r15d,%esi
     a93:	ba 40 00 00 00       	mov    $0x40,%edx
     a98:	89 45 b0             	mov    %eax,-0x50(%rbp)
     a9b:	e8 80 fa ff ff       	callq  520 <bpf_test_init.isra.17>
     aa0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
     aa6:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     aaa:	0f 87 0c 04 00 00    	ja     ebc <bpf_prog_test_run_skb+0x46c>
     ab0:	be b8 00 00 00       	mov    $0xb8,%esi
     ab5:	4c 89 e7             	mov    %r12,%rdi
     ab8:	e8 63 fc ff ff       	callq  720 <bpf_ctx_init>
     abd:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
     ac3:	48 89 c3             	mov    %rax,%rbx
     ac6:	0f 87 f5 03 00 00    	ja     ec1 <bpf_prog_test_run_skb+0x471>
     acc:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     ad0:	8b 40 04             	mov    0x4(%rax),%eax
     ad3:	83 f8 03             	cmp    $0x3,%eax
     ad6:	0f 82 ca 03 00 00    	jb     ea6 <bpf_prog_test_run_skb+0x456>
     adc:	83 f8 04             	cmp    $0x4,%eax
     adf:	0f 86 b4 03 00 00    	jbe    e99 <bpf_prog_test_run_skb+0x449>
     ae5:	83 e8 0a             	sub    $0xa,%eax
     ae8:	83 f8 02             	cmp    $0x2,%eax
     aeb:	0f 87 b5 03 00 00    	ja     ea6 <bpf_prog_test_run_skb+0x456>
     af1:	c6 45 b6 01          	movb   $0x1,-0x4a(%rbp)
     af5:	c6 45 b7 00          	movb   $0x0,-0x49(%rbp)
     af9:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # b00 <bpf_prog_test_run_skb+0xb0>
     b00:	ba e0 02 00 00       	mov    $0x2e0,%edx
     b05:	be c0 0d 10 00       	mov    $0x100dc0,%esi
     b0a:	e8 00 00 00 00       	callq  b0f <bpf_prog_test_run_skb+0xbf>
     b0f:	48 85 c0             	test   %rax,%rax
     b12:	49 89 c6             	mov    %rax,%r14
     b15:	0f 84 19 04 00 00    	je     f34 <bpf_prog_test_run_skb+0x4e4>
     b1b:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
     b22:	00 00 
     b24:	48 8b 82 90 0a 00 00 	mov    0xa90(%rdx),%rax
     b2b:	31 ff                	xor    %edi,%edi
     b2d:	4c 89 f6             	mov    %r14,%rsi
     b30:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
     b34:	48 8b 40 28          	mov    0x28(%rax),%rax
     b38:	49 89 46 30          	mov    %rax,0x30(%r14)
     b3c:	e8 00 00 00 00       	callq  b41 <bpf_prog_test_run_skb+0xf1>
     b41:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
     b45:	31 f6                	xor    %esi,%esi
     b47:	e8 00 00 00 00       	callq  b4c <bpf_prog_test_run_skb+0xfc>
     b4c:	48 85 c0             	test   %rax,%rax
     b4f:	49 89 c5             	mov    %rax,%r13
     b52:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
     b56:	0f 84 f3 03 00 00    	je     f4f <bpf_prog_test_run_skb+0x4ff>
     b5c:	48 83 80 c0 00 00 00 	addq   $0x40,0xc0(%rax)
     b63:	40 
     b64:	4c 89 70 18          	mov    %r14,0x18(%rax)
     b68:	41 8d 4f 40          	lea    0x40(%r15),%ecx
     b6c:	41 8b 75 6c          	mov    0x6c(%r13),%esi
     b70:	8b 80 b0 00 00 00    	mov    0xb0(%rax),%eax
     b76:	85 f6                	test   %esi,%esi
     b78:	0f 85 5a 03 00 00    	jne    ed8 <bpf_prog_test_run_skb+0x488>
     b7e:	01 c8                	add    %ecx,%eax
     b80:	45 01 7d 68          	add    %r15d,0x68(%r13)
     b84:	4c 89 ef             	mov    %r13,%rdi
     b87:	41 89 85 b0 00 00 00 	mov    %eax,0xb0(%r13)
     b8e:	48 8b 82 90 0a 00 00 	mov    0xa90(%rdx),%rax
     b95:	48 8b 40 28          	mov    0x28(%rax),%rax
     b99:	48 8b b0 48 01 00 00 	mov    0x148(%rax),%rsi
     ba0:	e8 00 00 00 00       	callq  ba5 <bpf_prog_test_run_skb+0x155>
     ba5:	66 41 89 85 a8 00 00 	mov    %ax,0xa8(%r13)
     bac:	00 
     bad:	49 8b 85 c0 00 00 00 	mov    0xc0(%r13),%rax
     bb4:	49 8b 95 b8 00 00 00 	mov    0xb8(%r13),%rdx
     bbb:	48 89 c1             	mov    %rax,%rcx
     bbe:	48 29 d1             	sub    %rdx,%rcx
     bc1:	80 7d b7 00          	cmpb   $0x0,-0x49(%rbp)
     bc5:	66 41 89 8d ac 00 00 	mov    %cx,0xac(%r13)
     bcc:	00 
     bcd:	74 10                	je     bdf <bpf_prog_test_run_skb+0x18f>
     bcf:	41 83 45 68 0e       	addl   $0xe,0x68(%r13)
     bd4:	48 83 e8 0e          	sub    $0xe,%rax
     bd8:	49 89 85 c0 00 00 00 	mov    %rax,0xc0(%r13)
     bdf:	80 7d b6 00          	cmpb   $0x0,-0x4a(%rbp)
     be3:	74 2c                	je     c11 <bpf_prog_test_run_skb+0x1c1>
     be5:	41 8b 8d b4 00 00 00 	mov    0xb4(%r13),%ecx
     bec:	49 8b 85 c0 00 00 00 	mov    0xc0(%r13),%rax
     bf3:	48 89 c6             	mov    %rax,%rsi
     bf6:	0f b6 54 0a 01       	movzbl 0x1(%rdx,%rcx,1),%edx
     bfb:	48 29 d6             	sub    %rdx,%rsi
     bfe:	41 8b 55 68          	mov    0x68(%r13),%edx
     c02:	41 2b 55 6c          	sub    0x6c(%r13),%edx
     c06:	49 89 75 48          	mov    %rsi,0x48(%r13)
     c0a:	48 01 d0             	add    %rdx,%rax
     c0d:	49 89 45 50          	mov    %rax,0x50(%r13)
     c11:	48 85 db             	test   %rbx,%rbx
     c14:	0f 84 37 01 00 00    	je     d51 <bpf_prog_test_run_skb+0x301>
     c1a:	31 f6                	xor    %esi,%esi
     c1c:	ba 08 00 00 00       	mov    $0x8,%edx
     c21:	48 89 df             	mov    %rbx,%rdi
     c24:	e8 00 00 00 00       	callq  c29 <bpf_prog_test_run_skb+0x1d9>
     c29:	48 85 c0             	test   %rax,%rax
     c2c:	0f 85 9c 02 00 00    	jne    ece <bpf_prog_test_run_skb+0x47e>
     c32:	48 8d 7b 0c          	lea    0xc(%rbx),%rdi
     c36:	31 f6                	xor    %esi,%esi
     c38:	ba 14 00 00 00       	mov    $0x14,%edx
     c3d:	e8 00 00 00 00       	callq  c42 <bpf_prog_test_run_skb+0x1f2>
     c42:	48 85 c0             	test   %rax,%rax
     c45:	0f 85 83 02 00 00    	jne    ece <bpf_prog_test_run_skb+0x47e>
     c4b:	48 8d 7b 24          	lea    0x24(%rbx),%rdi
     c4f:	31 f6                	xor    %esi,%esi
     c51:	ba 0c 00 00 00       	mov    $0xc,%edx
     c56:	e8 00 00 00 00       	callq  c5b <bpf_prog_test_run_skb+0x20b>
     c5b:	48 85 c0             	test   %rax,%rax
     c5e:	0f 85 6a 02 00 00    	jne    ece <bpf_prog_test_run_skb+0x47e>
     c64:	48 8d 7b 44          	lea    0x44(%rbx),%rdi
     c68:	31 f6                	xor    %esi,%esi
     c6a:	ba 54 00 00 00       	mov    $0x54,%edx
     c6f:	e8 00 00 00 00       	callq  c74 <bpf_prog_test_run_skb+0x224>
     c74:	48 85 c0             	test   %rax,%rax
     c77:	0f 85 51 02 00 00    	jne    ece <bpf_prog_test_run_skb+0x47e>
     c7d:	48 8d bb a8 00 00 00 	lea    0xa8(%rbx),%rdi
     c84:	31 f6                	xor    %esi,%esi
     c86:	ba 08 00 00 00       	mov    $0x8,%edx
     c8b:	e8 00 00 00 00       	callq  c90 <bpf_prog_test_run_skb+0x240>
     c90:	48 85 c0             	test   %rax,%rax
     c93:	0f 85 35 02 00 00    	jne    ece <bpf_prog_test_run_skb+0x47e>
     c99:	48 8d bb b4 00 00 00 	lea    0xb4(%rbx),%rdi
     ca0:	31 f6                	xor    %esi,%esi
     ca2:	ba 04 00 00 00       	mov    $0x4,%edx
     ca7:	e8 00 00 00 00       	callq  cac <bpf_prog_test_run_skb+0x25c>
     cac:	48 85 c0             	test   %rax,%rax
     caf:	0f 85 19 02 00 00    	jne    ece <bpf_prog_test_run_skb+0x47e>
     cb5:	8b 43 08             	mov    0x8(%rbx),%eax
     cb8:	41 89 85 9c 00 00 00 	mov    %eax,0x9c(%r13)
     cbf:	8b 43 20             	mov    0x20(%rbx),%eax
     cc2:	41 89 85 84 00 00 00 	mov    %eax,0x84(%r13)
     cc9:	48 8b 83 98 00 00 00 	mov    0x98(%rbx),%rax
     cd0:	49 89 45 20          	mov    %rax,0x20(%r13)
     cd4:	48 8b 4b 30          	mov    0x30(%rbx),%rcx
     cd8:	49 89 4d 30          	mov    %rcx,0x30(%r13)
     cdc:	48 8b 4b 38          	mov    0x38(%rbx),%rcx
     ce0:	49 89 4d 38          	mov    %rcx,0x38(%r13)
     ce4:	8b 53 40             	mov    0x40(%rbx),%edx
     ce7:	41 89 55 40          	mov    %edx,0x40(%r13)
     ceb:	8b 83 a0 00 00 00    	mov    0xa0(%rbx),%eax
     cf1:	41 8b 55 68          	mov    0x68(%r13),%edx
     cf5:	85 c0                	test   %eax,%eax
     cf7:	0f 84 b6 01 00 00    	je     eb3 <bpf_prog_test_run_skb+0x463>
     cfd:	39 d0                	cmp    %edx,%eax
     cff:	0f 82 c9 01 00 00    	jb     ece <bpf_prog_test_run_skb+0x47e>
     d05:	3d 00 00 01 00       	cmp    $0x10000,%eax
     d0a:	0f 87 be 01 00 00    	ja     ece <bpf_prog_test_run_skb+0x47e>
     d10:	41 89 45 28          	mov    %eax,0x28(%r13)
     d14:	8b 83 a4 00 00 00    	mov    0xa4(%rbx),%eax
     d1a:	3d ff ff 00 00       	cmp    $0xffff,%eax
     d1f:	0f 87 a9 01 00 00    	ja     ece <bpf_prog_test_run_skb+0x47e>
     d25:	41 8b 95 b4 00 00 00 	mov    0xb4(%r13),%edx
     d2c:	49 8b 8d b8 00 00 00 	mov    0xb8(%r13),%rcx
     d33:	66 89 44 11 06       	mov    %ax,0x6(%rcx,%rdx,1)
     d38:	41 8b 85 b4 00 00 00 	mov    0xb4(%r13),%eax
     d3f:	49 8b 95 b8 00 00 00 	mov    0xb8(%r13),%rdx
     d46:	8b 8b b0 00 00 00    	mov    0xb0(%rbx),%ecx
     d4c:	66 89 4c 02 04       	mov    %cx,0x4(%rdx,%rax,1)
     d51:	8b 55 b0             	mov    -0x50(%rbp),%edx
     d54:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
     d58:	4c 8d 45 cc          	lea    -0x34(%rbp),%r8
     d5c:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
     d60:	45 31 c9             	xor    %r9d,%r9d
     d63:	4c 89 ee             	mov    %r13,%rsi
     d66:	e8 85 f4 ff ff       	callq  1f0 <bpf_test_run>
     d6b:	85 c0                	test   %eax,%eax
     d6d:	0f 85 de 00 00 00    	jne    e51 <bpf_prog_test_run_skb+0x401>
     d73:	80 7d b7 00          	cmpb   $0x0,-0x49(%rbp)
     d77:	75 3f                	jne    db8 <bpf_prog_test_run_skb+0x368>
     d79:	49 8b 85 c0 00 00 00 	mov    0xc0(%r13),%rax
     d80:	48 89 c2             	mov    %rax,%rdx
     d83:	49 2b 95 b8 00 00 00 	sub    0xb8(%r13),%rdx
     d8a:	83 fa 0d             	cmp    $0xd,%edx
     d8d:	0f 86 68 01 00 00    	jbe    efb <bpf_prog_test_run_skb+0x4ab>
     d93:	48 8d 50 f2          	lea    -0xe(%rax),%rdx
     d97:	31 c9                	xor    %ecx,%ecx
     d99:	41 83 45 68 0e       	addl   $0xe,0x68(%r13)
     d9e:	49 89 95 c0 00 00 00 	mov    %rdx,0xc0(%r13)
     da5:	48 c7 40 f2 00 00 00 	movq   $0x0,-0xe(%rax)
     dac:	00 
     dad:	c7 40 fa 00 00 00 00 	movl   $0x0,-0x6(%rax)
     db4:	66 89 48 fe          	mov    %cx,-0x2(%rax)
     db8:	48 85 db             	test   %rbx,%rbx
     dbb:	74 59                	je     e16 <bpf_prog_test_run_skb+0x3c6>
     dbd:	41 8b 85 9c 00 00 00 	mov    0x9c(%r13),%eax
     dc4:	89 43 08             	mov    %eax,0x8(%rbx)
     dc7:	41 8b 85 84 00 00 00 	mov    0x84(%r13),%eax
     dce:	89 43 20             	mov    %eax,0x20(%rbx)
     dd1:	49 8b 45 20          	mov    0x20(%r13),%rax
     dd5:	48 89 83 98 00 00 00 	mov    %rax,0x98(%rbx)
     ddc:	49 8b 4d 30          	mov    0x30(%r13),%rcx
     de0:	48 89 4b 30          	mov    %rcx,0x30(%rbx)
     de4:	49 8b 4d 38          	mov    0x38(%r13),%rcx
     de8:	48 89 4b 38          	mov    %rcx,0x38(%rbx)
     dec:	41 8b 55 40          	mov    0x40(%r13),%edx
     df0:	89 53 40             	mov    %edx,0x40(%rbx)
     df3:	41 8b 45 28          	mov    0x28(%r13),%eax
     df7:	89 83 a0 00 00 00    	mov    %eax,0xa0(%rbx)
     dfd:	41 8b 85 b4 00 00 00 	mov    0xb4(%r13),%eax
     e04:	49 8b 95 b8 00 00 00 	mov    0xb8(%r13),%rdx
     e0b:	0f b7 44 02 06       	movzwl 0x6(%rdx,%rax,1),%eax
     e10:	89 83 a4 00 00 00    	mov    %eax,0xa4(%rbx)
     e16:	41 8b 45 6c          	mov    0x6c(%r13),%eax
     e1a:	45 8b 45 68          	mov    0x68(%r13),%r8d
     e1e:	85 c0                	test   %eax,%eax
     e20:	0f 85 04 01 00 00    	jne    f2a <bpf_prog_test_run_skb+0x4da>
     e26:	8b 45 cc             	mov    -0x34(%rbp),%eax
     e29:	49 8b 8d c0 00 00 00 	mov    0xc0(%r13),%rcx
     e30:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     e34:	49 8b 74 24 18       	mov    0x18(%r12),%rsi
     e39:	41 8b 7c 24 0c       	mov    0xc(%r12),%edi
     e3e:	44 8b 4d c8          	mov    -0x38(%rbp),%r9d
     e42:	50                   	push   %rax
     e43:	e8 78 f7 ff ff       	callq  5c0 <bpf_test_finish.isra.16>
     e48:	85 c0                	test   %eax,%eax
     e4a:	5a                   	pop    %rdx
     e4b:	0f 84 89 00 00 00    	je     eda <bpf_prog_test_run_skb+0x48a>
     e51:	4c 89 ef             	mov    %r13,%rdi
     e54:	89 45 c0             	mov    %eax,-0x40(%rbp)
     e57:	e8 00 00 00 00       	callq  e5c <bpf_prog_test_run_skb+0x40c>
     e5c:	4c 89 f7             	mov    %r14,%rdi
     e5f:	e8 00 00 00 00       	callq  e64 <bpf_prog_test_run_skb+0x414>
     e64:	4c 89 f7             	mov    %r14,%rdi
     e67:	e8 00 00 00 00       	callq  e6c <bpf_prog_test_run_skb+0x41c>
     e6c:	48 89 df             	mov    %rbx,%rdi
     e6f:	e8 00 00 00 00       	callq  e74 <bpf_prog_test_run_skb+0x424>
     e74:	8b 45 c0             	mov    -0x40(%rbp),%eax
     e77:	48 8b 5d d0          	mov    -0x30(%rbp),%rbx
     e7b:	65 48 33 1c 25 28 00 	xor    %gs:0x28,%rbx
     e82:	00 00 
     e84:	0f 85 e8 00 00 00    	jne    f72 <bpf_prog_test_run_skb+0x522>
     e8a:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
     e8e:	5b                   	pop    %rbx
     e8f:	41 5c                	pop    %r12
     e91:	41 5d                	pop    %r13
     e93:	41 5e                	pop    %r14
     e95:	41 5f                	pop    %r15
     e97:	5d                   	pop    %rbp
     e98:	c3                   	retq   
     e99:	c6 45 b6 01          	movb   $0x1,-0x4a(%rbp)
     e9d:	c6 45 b7 01          	movb   $0x1,-0x49(%rbp)
     ea1:	e9 53 fc ff ff       	jmpq   af9 <bpf_prog_test_run_skb+0xa9>
     ea6:	c6 45 b6 00          	movb   $0x0,-0x4a(%rbp)
     eaa:	c6 45 b7 00          	movb   $0x0,-0x49(%rbp)
     eae:	e9 46 fc ff ff       	jmpq   af9 <bpf_prog_test_run_skb+0xa9>
     eb3:	41 89 55 28          	mov    %edx,0x28(%r13)
     eb7:	e9 58 fe ff ff       	jmpq   d14 <bpf_prog_test_run_skb+0x2c4>
     ebc:	8b 45 b8             	mov    -0x48(%rbp),%eax
     ebf:	eb b6                	jmp    e77 <bpf_prog_test_run_skb+0x427>
     ec1:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
     ec5:	e8 00 00 00 00       	callq  eca <bpf_prog_test_run_skb+0x47a>
     eca:	89 d8                	mov    %ebx,%eax
     ecc:	eb a9                	jmp    e77 <bpf_prog_test_run_skb+0x427>
     ece:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     ed3:	e9 79 ff ff ff       	jmpq   e51 <bpf_prog_test_run_skb+0x401>
     ed8:	0f 0b                	ud2    
     eda:	49 8b 74 24 38       	mov    0x38(%r12),%rsi
     edf:	41 8b 7c 24 2c       	mov    0x2c(%r12),%edi
     ee4:	41 b8 b8 00 00 00    	mov    $0xb8,%r8d
     eea:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     eee:	48 89 d9             	mov    %rbx,%rcx
     ef1:	e8 7a f5 ff ff       	callq  470 <bpf_ctx_finish.isra.14>
     ef6:	e9 56 ff ff ff       	jmpq   e51 <bpf_prog_test_run_skb+0x401>
     efb:	31 d2                	xor    %edx,%edx
     efd:	b9 c0 0c 10 00       	mov    $0x100cc0,%ecx
     f02:	be 10 00 00 00       	mov    $0x10,%esi
     f07:	4c 89 ef             	mov    %r13,%rdi
     f0a:	e8 00 00 00 00       	callq  f0f <bpf_prog_test_run_skb+0x4bf>
     f0f:	89 c2                	mov    %eax,%edx
     f11:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
     f16:	85 d2                	test   %edx,%edx
     f18:	0f 85 33 ff ff ff    	jne    e51 <bpf_prog_test_run_skb+0x401>
     f1e:	49 8b 85 c0 00 00 00 	mov    0xc0(%r13),%rax
     f25:	e9 69 fe ff ff       	jmpq   d93 <bpf_prog_test_run_skb+0x343>
     f2a:	0f 0b                	ud2    
     f2c:	41 29 c0             	sub    %eax,%r8d
     f2f:	e9 f2 fe ff ff       	jmpq   e26 <bpf_prog_test_run_skb+0x3d6>
     f34:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
     f38:	e8 00 00 00 00       	callq  f3d <bpf_prog_test_run_skb+0x4ed>
     f3d:	48 89 df             	mov    %rbx,%rdi
     f40:	e8 00 00 00 00       	callq  f45 <bpf_prog_test_run_skb+0x4f5>
     f45:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
     f4a:	e9 28 ff ff ff       	jmpq   e77 <bpf_prog_test_run_skb+0x427>
     f4f:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
     f53:	e8 00 00 00 00       	callq  f58 <bpf_prog_test_run_skb+0x508>
     f58:	48 89 df             	mov    %rbx,%rdi
     f5b:	e8 00 00 00 00       	callq  f60 <bpf_prog_test_run_skb+0x510>
     f60:	4c 89 f7             	mov    %r14,%rdi
     f63:	e8 00 00 00 00       	callq  f68 <bpf_prog_test_run_skb+0x518>
     f68:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
     f6d:	e9 05 ff ff ff       	jmpq   e77 <bpf_prog_test_run_skb+0x427>
     f72:	e8 00 00 00 00       	callq  f77 <bpf_prog_test_run_skb+0x527>
     f77:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     f7e:	00 00 

0000000000000f80 <bpf_prog_test_run_xdp>:
     f80:	e8 00 00 00 00       	callq  f85 <bpf_prog_test_run_xdp+0x5>
     f85:	55                   	push   %rbp
     f86:	b9 06 00 00 00       	mov    $0x6,%ecx
     f8b:	48 89 e5             	mov    %rsp,%rbp
     f8e:	41 57                	push   %r15
     f90:	41 56                	push   %r14
     f92:	41 55                	push   %r13
     f94:	41 54                	push   %r12
     f96:	4c 8d 65 a0          	lea    -0x60(%rbp),%r12
     f9a:	53                   	push   %rbx
     f9b:	49 89 fe             	mov    %rdi,%r14
     f9e:	4c 89 e7             	mov    %r12,%rdi
     fa1:	48 83 ec 60          	sub    $0x60,%rsp
     fa5:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
     fa9:	44 8b 6e 08          	mov    0x8(%rsi),%r13d
     fad:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     fb4:	00 00 
     fb6:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     fba:	31 c0                	xor    %eax,%eax
     fbc:	8b 46 20             	mov    0x20(%rsi),%eax
     fbf:	89 45 94             	mov    %eax,-0x6c(%rbp)
     fc2:	31 c0                	xor    %eax,%eax
     fc4:	48 83 7e 30 00       	cmpq   $0x0,0x30(%rsi)
     fc9:	f3 48 ab             	rep stos %rax,%es:(%rdi)
     fcc:	0f 85 21 01 00 00    	jne    10f3 <bpf_prog_test_run_xdp+0x173>
     fd2:	48 83 7e 38 00       	cmpq   $0x0,0x38(%rsi)
     fd7:	49 89 f7             	mov    %rsi,%r15
     fda:	0f 85 13 01 00 00    	jne    10f3 <bpf_prog_test_run_xdp+0x173>
     fe0:	48 8b 7e 10          	mov    0x10(%rsi),%rdi
     fe4:	ba 00 01 00 00       	mov    $0x100,%edx
     fe9:	44 89 ee             	mov    %r13d,%esi
     fec:	e8 2f f5 ff ff       	callq  520 <bpf_test_init.isra.17>
     ff1:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
     ff7:	48 89 c3             	mov    %rax,%rbx
     ffa:	0f 87 94 00 00 00    	ja     1094 <bpf_prog_test_run_xdp+0x114>
    1000:	4c 8d 98 00 01 00 00 	lea    0x100(%rax),%r11
    1007:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    100b:	44 89 e8             	mov    %r13d,%eax
    100e:	31 ff                	xor    %edi,%edi
    1010:	4c 89 f6             	mov    %r14,%rsi
    1013:	4c 01 d8             	add    %r11,%rax
    1016:	4c 89 5d a0          	mov    %r11,-0x60(%rbp)
    101a:	4c 89 5d b0          	mov    %r11,-0x50(%rbp)
    101e:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
    1025:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    1029:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    1030:	00 00 
    1032:	48 8b 80 90 0a 00 00 	mov    0xa90(%rax),%rax
    1039:	4c 89 5d 80          	mov    %r11,-0x80(%rbp)
    103d:	48 8b 40 28          	mov    0x28(%rax),%rax
    1041:	48 8b 80 48 01 00 00 	mov    0x148(%rax),%rax
    1048:	48 8b 80 e0 02 00 00 	mov    0x2e0(%rax),%rax
    104f:	48 83 e8 80          	sub    $0xffffffffffffff80,%rax
    1053:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    1057:	e8 00 00 00 00       	callq  105c <bpf_prog_test_run_xdp+0xdc>
    105c:	8b 55 94             	mov    -0x6c(%rbp),%edx
    105f:	4c 8d 45 9c          	lea    -0x64(%rbp),%r8
    1063:	48 8d 4d 98          	lea    -0x68(%rbp),%rcx
    1067:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    106d:	4c 89 e6             	mov    %r12,%rsi
    1070:	4c 89 f7             	mov    %r14,%rdi
    1073:	e8 78 f1 ff ff       	callq  1f0 <bpf_test_run>
    1078:	85 c0                	test   %eax,%eax
    107a:	74 36                	je     10b2 <bpf_prog_test_run_xdp+0x132>
    107c:	31 f6                	xor    %esi,%esi
    107e:	4c 89 f7             	mov    %r14,%rdi
    1081:	89 45 94             	mov    %eax,-0x6c(%rbp)
    1084:	e8 00 00 00 00       	callq  1089 <bpf_prog_test_run_xdp+0x109>
    1089:	48 89 df             	mov    %rbx,%rdi
    108c:	e8 00 00 00 00       	callq  1091 <bpf_prog_test_run_xdp+0x111>
    1091:	8b 45 94             	mov    -0x6c(%rbp),%eax
    1094:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    1098:	65 48 33 14 25 28 00 	xor    %gs:0x28,%rdx
    109f:	00 00 
    10a1:	75 57                	jne    10fa <bpf_prog_test_run_xdp+0x17a>
    10a3:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
    10a7:	5b                   	pop    %rbx
    10a8:	41 5c                	pop    %r12
    10aa:	41 5d                	pop    %r13
    10ac:	41 5e                	pop    %r14
    10ae:	41 5f                	pop    %r15
    10b0:	5d                   	pop    %rbp
    10b1:	c3                   	retq   
    10b2:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    10b6:	4c 8b 5d 80          	mov    -0x80(%rbp),%r11
    10ba:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    10be:	49 39 cb             	cmp    %rcx,%r11
    10c1:	74 25                	je     10e8 <bpf_prog_test_run_xdp+0x168>
    10c3:	41 89 c5             	mov    %eax,%r13d
    10c6:	41 29 cd             	sub    %ecx,%r13d
    10c9:	8b 45 9c             	mov    -0x64(%rbp),%eax
    10cc:	49 8b 77 18          	mov    0x18(%r15),%rsi
    10d0:	45 89 e8             	mov    %r13d,%r8d
    10d3:	41 8b 7f 0c          	mov    0xc(%r15),%edi
    10d7:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
    10db:	44 8b 4d 98          	mov    -0x68(%rbp),%r9d
    10df:	50                   	push   %rax
    10e0:	e8 db f4 ff ff       	callq  5c0 <bpf_test_finish.isra.16>
    10e5:	5a                   	pop    %rdx
    10e6:	eb 94                	jmp    107c <bpf_prog_test_run_xdp+0xfc>
    10e8:	48 39 85 78 ff ff ff 	cmp    %rax,-0x88(%rbp)
    10ef:	75 d2                	jne    10c3 <bpf_prog_test_run_xdp+0x143>
    10f1:	eb d6                	jmp    10c9 <bpf_prog_test_run_xdp+0x149>
    10f3:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    10f8:	eb 9a                	jmp    1094 <bpf_prog_test_run_xdp+0x114>
    10fa:	e8 00 00 00 00       	callq  10ff <bpf_prog_test_run_xdp+0x17f>
    10ff:	90                   	nop

0000000000001100 <bpf_prog_test_run_flow_dissector>:
    1100:	e8 00 00 00 00       	callq  1105 <bpf_prog_test_run_flow_dissector+0x5>
    1105:	55                   	push   %rbp
    1106:	48 89 e5             	mov    %rsp,%rbp
    1109:	41 57                	push   %r15
    110b:	41 56                	push   %r14
    110d:	41 55                	push   %r13
    110f:	41 54                	push   %r12
    1111:	53                   	push   %rbx
    1112:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    1119:	48 89 bd 60 ff ff ff 	mov    %rdi,-0xa0(%rbp)
    1120:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
    1127:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    112e:	00 00 
    1130:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1134:	31 c0                	xor    %eax,%eax
    1136:	83 7f 04 16          	cmpl   $0x16,0x4(%rdi)
    113a:	44 8b 6e 08          	mov    0x8(%rsi),%r13d
    113e:	48 c7 85 78 ff ff ff 	movq   $0x0,-0x88(%rbp)
    1145:	00 00 00 00 
    1149:	48 c7 45 80 00 00 00 	movq   $0x0,-0x80(%rbp)
    1150:	00 
    1151:	48 c7 45 88 00 00 00 	movq   $0x0,-0x78(%rbp)
    1158:	00 
    1159:	48 c7 45 90 00 00 00 	movq   $0x0,-0x70(%rbp)
    1160:	00 
    1161:	8b 5e 20             	mov    0x20(%rsi),%ebx
    1164:	0f 85 78 02 00 00    	jne    13e2 <bpf_prog_test_run_flow_dissector+0x2e2>
    116a:	41 83 fd 0d          	cmp    $0xd,%r13d
    116e:	0f 86 6e 02 00 00    	jbe    13e2 <bpf_prog_test_run_flow_dissector+0x2e2>
    1174:	48 8b 7e 10          	mov    0x10(%rsi),%rdi
    1178:	31 c9                	xor    %ecx,%ecx
    117a:	31 d2                	xor    %edx,%edx
    117c:	49 89 f6             	mov    %rsi,%r14
    117f:	44 89 ee             	mov    %r13d,%esi
    1182:	e8 99 f3 ff ff       	callq  520 <bpf_test_init.isra.17>
    1187:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
    118d:	49 89 c4             	mov    %rax,%r12
    1190:	0f 87 32 02 00 00    	ja     13c8 <bpf_prog_test_run_flow_dissector+0x2c8>
    1196:	85 db                	test   %ebx,%ebx
    1198:	b8 01 00 00 00       	mov    $0x1,%eax
    119d:	be 38 00 00 00       	mov    $0x38,%esi
    11a2:	4c 89 f7             	mov    %r14,%rdi
    11a5:	48 0f 44 d8          	cmove  %rax,%rbx
    11a9:	e8 72 f5 ff ff       	callq  720 <bpf_ctx_init>
    11ae:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
    11b4:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
    11bb:	0f 87 0e 02 00 00    	ja     13cf <bpf_prog_test_run_flow_dissector+0x2cf>
    11c1:	48 8b bd 68 ff ff ff 	mov    -0x98(%rbp),%rdi
    11c8:	48 85 ff             	test   %rdi,%rdi
    11cb:	0f 84 e8 01 00 00    	je     13b9 <bpf_prog_test_run_flow_dissector+0x2b9>
    11d1:	31 f6                	xor    %esi,%esi
    11d3:	ba 30 00 00 00       	mov    $0x30,%edx
    11d8:	e8 00 00 00 00       	callq  11dd <bpf_prog_test_run_flow_dissector+0xdd>
    11dd:	48 85 c0             	test   %rax,%rax
    11e0:	0f 85 06 02 00 00    	jne    13ec <bpf_prog_test_run_flow_dissector+0x2ec>
    11e6:	4c 8b bd 68 ff ff ff 	mov    -0x98(%rbp),%r15
    11ed:	31 f6                	xor    %esi,%esi
    11ef:	ba 04 00 00 00       	mov    $0x4,%edx
    11f4:	49 8d 7f 34          	lea    0x34(%r15),%rdi
    11f8:	e8 00 00 00 00       	callq  11fd <bpf_prog_test_run_flow_dissector+0xfd>
    11fd:	48 85 c0             	test   %rax,%rax
    1200:	0f 85 e6 01 00 00    	jne    13ec <bpf_prog_test_run_flow_dissector+0x2ec>
    1206:	41 8b 47 30          	mov    0x30(%r15),%eax
    120a:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
    1210:	48 8d 45 98          	lea    -0x68(%rbp),%rax
    1214:	4c 89 65 88          	mov    %r12,-0x78(%rbp)
    1218:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
    121f:	44 89 e8             	mov    %r13d,%eax
    1222:	4c 01 e0             	add    %r12,%rax
    1225:	48 89 45 90          	mov    %rax,-0x70(%rbp)
    1229:	45 31 ff             	xor    %r15d,%r15d
    122c:	e8 00 00 00 00       	callq  1231 <bpf_prog_test_run_flow_dissector+0x131>
    1231:	4c 89 b5 40 ff ff ff 	mov    %r14,-0xc0(%rbp)
    1238:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)
    123f:	45 89 fe             	mov    %r15d,%r14d
    1242:	48 c7 85 48 ff ff ff 	movq   $0x0,-0xb8(%rbp)
    1249:	00 00 00 00 
    124d:	4c 8b bd 60 ff ff ff 	mov    -0xa0(%rbp),%r15
    1254:	eb 18                	jmp    126e <bpf_prog_test_run_flow_dissector+0x16e>
    1256:	48 8b 00             	mov    (%rax),%rax
    1259:	a8 08                	test   $0x8,%al
    125b:	0f 85 82 00 00 00    	jne    12e3 <bpf_prog_test_run_flow_dissector+0x1e3>
    1261:	41 83 c6 01          	add    $0x1,%r14d
    1265:	44 39 f3             	cmp    %r14d,%ebx
    1268:	0f 84 bf 00 00 00    	je     132d <bpf_prog_test_run_flow_dissector+0x22d>
    126e:	41 0f b7 54 24 0c    	movzwl 0xc(%r12),%edx
    1274:	44 8b 8d 74 ff ff ff 	mov    -0x8c(%rbp),%r9d
    127b:	48 8d b5 78 ff ff ff 	lea    -0x88(%rbp),%rsi
    1282:	45 89 e8             	mov    %r13d,%r8d
    1285:	b9 0e 00 00 00       	mov    $0xe,%ecx
    128a:	4c 89 ff             	mov    %r15,%rdi
    128d:	e8 00 00 00 00       	callq  1292 <bpf_prog_test_run_flow_dissector+0x192>
    1292:	41 89 c1             	mov    %eax,%r9d
    1295:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
    129c:	00 00 
    129e:	48 8b 10             	mov    (%rax),%rdx
    12a1:	83 e2 04             	and    $0x4,%edx
    12a4:	74 b0                	je     1256 <bpf_prog_test_run_flow_dissector+0x156>
    12a6:	bb fc ff ff ff       	mov    $0xfffffffc,%ebx
    12ab:	48 8b bd 68 ff ff ff 	mov    -0x98(%rbp),%rdi
    12b2:	e8 00 00 00 00       	callq  12b7 <bpf_prog_test_run_flow_dissector+0x1b7>
    12b7:	4c 89 e7             	mov    %r12,%rdi
    12ba:	e8 00 00 00 00       	callq  12bf <bpf_prog_test_run_flow_dissector+0x1bf>
    12bf:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    12c3:	65 48 33 0c 25 28 00 	xor    %gs:0x28,%rcx
    12ca:	00 00 
    12cc:	89 d8                	mov    %ebx,%eax
    12ce:	0f 85 22 01 00 00    	jne    13f6 <bpf_prog_test_run_flow_dissector+0x2f6>
    12d4:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
    12d8:	5b                   	pop    %rbx
    12d9:	41 5c                	pop    %r12
    12db:	41 5d                	pop    %r13
    12dd:	41 5e                	pop    %r14
    12df:	41 5f                	pop    %r15
    12e1:	5d                   	pop    %rbp
    12e2:	c3                   	retq   
    12e3:	44 88 8d 60 ff ff ff 	mov    %r9b,-0xa0(%rbp)
    12ea:	e8 00 00 00 00       	callq  12ef <bpf_prog_test_run_flow_dissector+0x1ef>
    12ef:	48 8b 95 48 ff ff ff 	mov    -0xb8(%rbp),%rdx
    12f6:	48 2b 95 50 ff ff ff 	sub    -0xb0(%rbp),%rdx
    12fd:	48 01 d0             	add    %rdx,%rax
    1300:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
    1307:	e8 00 00 00 00       	callq  130c <bpf_prog_test_run_flow_dissector+0x20c>
    130c:	41 83 c6 01          	add    $0x1,%r14d
    1310:	e8 00 00 00 00       	callq  1315 <bpf_prog_test_run_flow_dissector+0x215>
    1315:	44 39 f3             	cmp    %r14d,%ebx
    1318:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)
    131f:	44 0f b6 8d 60 ff ff 	movzbl -0xa0(%rbp),%r9d
    1326:	ff 
    1327:	0f 85 41 ff ff ff    	jne    126e <bpf_prog_test_run_flow_dissector+0x16e>
    132d:	44 88 8d 74 ff ff ff 	mov    %r9b,-0x8c(%rbp)
    1334:	4c 8b b5 40 ff ff ff 	mov    -0xc0(%rbp),%r14
    133b:	e8 00 00 00 00       	callq  1340 <bpf_prog_test_run_flow_dissector+0x240>
    1340:	48 2b 85 50 ff ff ff 	sub    -0xb0(%rbp),%rax
    1347:	48 03 85 48 ff ff ff 	add    -0xb8(%rbp),%rax
    134e:	31 d2                	xor    %edx,%edx
    1350:	44 0f b6 8d 74 ff ff 	movzbl -0x8c(%rbp),%r9d
    1357:	ff 
    1358:	49 8b 76 18          	mov    0x18(%r14),%rsi
    135c:	48 f7 f3             	div    %rbx
    135f:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    1364:	41 8b 7e 0c          	mov    0xc(%r14),%edi
    1368:	48 8d 4d 98          	lea    -0x68(%rbp),%rcx
    136c:	41 b8 38 00 00 00    	mov    $0x38,%r8d
    1372:	48 39 d0             	cmp    %rdx,%rax
    1375:	48 0f 47 c2          	cmova  %rdx,%rax
    1379:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
    1380:	50                   	push   %rax
    1381:	e8 3a f2 ff ff       	callq  5c0 <bpf_test_finish.isra.16>
    1386:	89 c3                	mov    %eax,%ebx
    1388:	85 db                	test   %ebx,%ebx
    138a:	58                   	pop    %rax
    138b:	0f 85 1a ff ff ff    	jne    12ab <bpf_prog_test_run_flow_dissector+0x1ab>
    1391:	49 8b 76 38          	mov    0x38(%r14),%rsi
    1395:	41 8b 7e 2c          	mov    0x2c(%r14),%edi
    1399:	41 b8 38 00 00 00    	mov    $0x38,%r8d
    139f:	48 8b 8d 68 ff ff ff 	mov    -0x98(%rbp),%rcx
    13a6:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
    13ad:	e8 be f0 ff ff       	callq  470 <bpf_ctx_finish.isra.14>
    13b2:	89 c3                	mov    %eax,%ebx
    13b4:	e9 f2 fe ff ff       	jmpq   12ab <bpf_prog_test_run_flow_dissector+0x1ab>
    13b9:	c7 85 74 ff ff ff 00 	movl   $0x0,-0x8c(%rbp)
    13c0:	00 00 00 
    13c3:	e9 48 fe ff ff       	jmpq   1210 <bpf_prog_test_run_flow_dissector+0x110>
    13c8:	89 c3                	mov    %eax,%ebx
    13ca:	e9 f0 fe ff ff       	jmpq   12bf <bpf_prog_test_run_flow_dissector+0x1bf>
    13cf:	4c 89 e7             	mov    %r12,%rdi
    13d2:	e8 00 00 00 00       	callq  13d7 <bpf_prog_test_run_flow_dissector+0x2d7>
    13d7:	8b 9d 68 ff ff ff    	mov    -0x98(%rbp),%ebx
    13dd:	e9 dd fe ff ff       	jmpq   12bf <bpf_prog_test_run_flow_dissector+0x1bf>
    13e2:	bb ea ff ff ff       	mov    $0xffffffea,%ebx
    13e7:	e9 d3 fe ff ff       	jmpq   12bf <bpf_prog_test_run_flow_dissector+0x1bf>
    13ec:	bb ea ff ff ff       	mov    $0xffffffea,%ebx
    13f1:	e9 b5 fe ff ff       	jmpq   12ab <bpf_prog_test_run_flow_dissector+0x1ab>
    13f6:	e8 00 00 00 00       	callq  13fb <bpf_prog_test_run_flow_dissector+0x2fb>
