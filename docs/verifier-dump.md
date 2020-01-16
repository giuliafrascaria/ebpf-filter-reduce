welcome
loading bpf extension ./buffermap_kern.o
loaded bpf kernel module
file descriptor user: 3
buffer on user side = 0x557964e594b0
buffer on user side = 0x557964e594b0, file value 31
read map value ffffffb0
giogge@ubuntu18:~/thesis/ebpf-experiments/415/src/compiled$ sudo ./buffermap f
welcome
loading bpf extension ./buffermap_kern.o
loaded bpf kernel module
file descriptor user: 3
buffer on user side = 0x55e2a8c054b0
buffer on user side = 0x55e2a8c054b0, file value 31
read map value ffffffb0
giogge@ubuntu18:~/thesis/ebpf-experiments/415/src/compiled$ cd ..
giogge@ubuntu18:~/thesis/ebpf-experiments/415/src$ ./newmake.sh 
making ...hellotrace
making ...tracex1
making ...cpustat
making ...open_tp
making ...passfd
making ...readbuff
making ...buffermap
giogge@ubuntu18:~/thesis/ebpf-experiments/415/src$ cd compiled/
giogge@ubuntu18:~/thesis/ebpf-experiments/415/src/compiled$ sudo ./buffermap f
welcome
loading bpf extension ./buffermap_kern.o
bpf_load_program() err=13
0: (b7) r7 = 0
1: (63) *(u32 *)(r10 -4) = r7
2: (bf) r2 = r10
3: (07) r2 += -4
4: (18) r1 = 0xffff92f83928d600
6: (85) call bpf_map_lookup_elem#1
7: (bf) r6 = r0
8: (55) if r6 != 0x0 goto pc+20
 R0=inv0 R6=inv0 R7=inv0 R10=fp0
9: (73) *(u8 *)(r10 -12) = r7
10: (b7) r1 = 175137133
11: (63) *(u32 *)(r10 -16) = r1
12: (18) r1 = 0x206d6f7266206575
14: (7b) *(u64 *)(r10 -24) = r1
15: (18) r1 = 0x6c61762072656666
17: (7b) *(u64 *)(r10 -32) = r1
18: (18) r1 = 0x756220676e696461
20: (7b) *(u64 *)(r10 -40) = r1
21: (18) r1 = 0x657220726f727265
23: (7b) *(u64 *)(r10 -48) = r1
24: (bf) r1 = r10
25: (07) r1 += -48
26: (b7) r2 = 37
27: (85) call bpf_trace_printk#6
28: (05) goto pc+32
61: (b7) r0 = 0
62: (95) exit

from 8 to 29: R0=map_value(id=0,off=0,ks=4,vs=8,imm=0) R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
29: (18) r1 = 0xa78252070616d20
31: (7b) *(u64 *)(r10 -32) = r1
32: (18) r1 = 0x6d6f726620726566
34: (7b) *(u64 *)(r10 -40) = r1
35: (18) r1 = 0x6675622064616572
37: (7b) *(u64 *)(r10 -48) = r1
38: (73) *(u8 *)(r10 -24) = r7
39: (79) r3 = *(u64 *)(r6 +0)
 R0=map_value(id=0,off=0,ks=4,vs=8,imm=0) R1=inv7382915055406376306 R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
40: (bf) r1 = r10
41: (07) r1 += -48
42: (b7) r2 = 25
43: (85) call bpf_trace_printk#6
44: (bf) r2 = r10
45: (07) r2 += -4
46: (18) r1 = 0xffff92f83928d600
48: (85) call bpf_map_delete_elem#3
49: (7b) *(u64 *)(r10 -56) = r7
50: (79) r1 = *(u64 *)(r6 +0)
 R0=inv(id=0) R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
51: (71) r1 = *(u8 *)(r1 +0)
R1 invalid mem access 'inv'
ERROR: loading BPF program (errno 13):
0: (b7) r7 = 0
1: (63) *(u32 *)(r10 -4) = r7
2: (bf) r2 = r10
3: (07) r2 += -4
4: (18) r1 = 0xffff92f83928d600
6: (85) call bpf_map_lookup_elem#1
7: (bf) r6 = r0
8: (55) if r6 != 0x0 goto pc+20
 R0=inv0 R6=inv0 R7=inv0 R10=fp0
9: (73) *(u8 *)(r10 -12) = r7
10: (b7) r1 = 175137133
11: (63) *(u32 *)(r10 -16) = r1
12: (18) r1 = 0x206d6f7266206575
14: (7b) *(u64 *)(r10 -24) = r1
15: (18) r1 = 0x6c61762072656666
17: (7b) *(u64 *)(r10 -32) = r1
18: (18) r1 = 0x756220676e696461
20: (7b) *(u64 *)(r10 -40) = r1
21: (18) r1 = 0x657220726f727265
23: (7b) *(u64 *)(r10 -48) = r1
24: (bf) r1 = r10
25: (07) r1 += -48
26: (b7) r2 = 37
27: (85) call bpf_trace_printk#6
28: (05) goto pc+32
61: (b7) r0 = 0
62: (95) exit

from 8 to 29: R0=map_value(id=0,off=0,ks=4,vs=8,imm=0) R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
29: (18) r1 = 0xa78252070616d20
31: (7b) *(u64 *)(r10 -32) = r1
32: (18) r1 = 0x6d6f726620726566
34: (7b) *(u64 *)(r10 -40) = r1
35: (18) r1 = 0x6675622064616572
37: (7b) *(u64 *)(r10 -48) = r1
38: (73) *(u8 *)(r10 -24) = r7
39: (79) r3 = *(u64 *)(r6 +0)
 R0=map_value(id=0,off=0,ks=4,vs=8,imm=0) R1=inv7382915055406376306 R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
40: (bf) r1 = r10
41: (07) r1 += -48
42: (b7) r2 = 25
43: (85) call bpf_trace_printk#6
44: (bf) r2 = r10
45: (07) r2 += -4
46: (18) r1 = 0xffff92f83928d600
48: (85) call bpf_map_delete_elem#3
49: (7b) *(u64 *)(r10 -56) = r7
50: (79) r1 = *(u64 *)(r6 +0)
 R0=inv(id=0) R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
51: (71) r1 = *(u8 *)(r1 +0)
R1 invalid mem access 'inv'
giogge@ubuntu18:~/thesis/ebpf-experiments/415/src/compiled$ sudo ./buffermap f
welcome
loading bpf extension ./buffermap_kern.o
bpf_load_program() err=13
0: (b7) r7 = 0
1: (63) *(u32 *)(r10 -4) = r7
2: (bf) r2 = r10
3: (07) r2 += -4
4: (18) r1 = 0xffff92f83928d600
6: (85) call bpf_map_lookup_elem#1
7: (bf) r6 = r0
8: (55) if r6 != 0x0 goto pc+20
 R0=inv0 R6=inv0 R7=inv0 R10=fp0
9: (73) *(u8 *)(r10 -12) = r7
10: (b7) r1 = 175137133
11: (63) *(u32 *)(r10 -16) = r1
12: (18) r1 = 0x206d6f7266206575
14: (7b) *(u64 *)(r10 -24) = r1
15: (18) r1 = 0x6c61762072656666
17: (7b) *(u64 *)(r10 -32) = r1
18: (18) r1 = 0x756220676e696461
20: (7b) *(u64 *)(r10 -40) = r1
21: (18) r1 = 0x657220726f727265
23: (7b) *(u64 *)(r10 -48) = r1
24: (bf) r1 = r10
25: (07) r1 += -48
26: (b7) r2 = 37
27: (85) call bpf_trace_printk#6
28: (05) goto pc+32
61: (b7) r0 = 0
62: (95) exit

from 8 to 29: R0=map_value(id=0,off=0,ks=4,vs=8,imm=0) R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
29: (18) r1 = 0xa78252070616d20
31: (7b) *(u64 *)(r10 -32) = r1
32: (18) r1 = 0x6d6f726620726566
34: (7b) *(u64 *)(r10 -40) = r1
35: (18) r1 = 0x6675622064616572
37: (7b) *(u64 *)(r10 -48) = r1
38: (73) *(u8 *)(r10 -24) = r7
39: (79) r3 = *(u64 *)(r6 +0)
 R0=map_value(id=0,off=0,ks=4,vs=8,imm=0) R1=inv7382915055406376306 R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
40: (bf) r1 = r10
41: (07) r1 += -48
42: (b7) r2 = 25
43: (85) call bpf_trace_printk#6
44: (bf) r2 = r10
45: (07) r2 += -4
46: (18) r1 = 0xffff92f83928d600
48: (85) call bpf_map_delete_elem#3
49: (7b) *(u64 *)(r10 -56) = r7
50: (79) r1 = *(u64 *)(r6 +0)
 R0=inv(id=0) R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
51: (71) r1 = *(u8 *)(r1 +0)
R1 invalid mem access 'inv'
ERROR: loading BPF program (errno 13):
0: (b7) r7 = 0
1: (63) *(u32 *)(r10 -4) = r7
2: (bf) r2 = r10
3: (07) r2 += -4
4: (18) r1 = 0xffff92f83928d600
6: (85) call bpf_map_lookup_elem#1
7: (bf) r6 = r0
8: (55) if r6 != 0x0 goto pc+20
 R0=inv0 R6=inv0 R7=inv0 R10=fp0
9: (73) *(u8 *)(r10 -12) = r7
10: (b7) r1 = 175137133
11: (63) *(u32 *)(r10 -16) = r1
12: (18) r1 = 0x206d6f7266206575
14: (7b) *(u64 *)(r10 -24) = r1
15: (18) r1 = 0x6c61762072656666
17: (7b) *(u64 *)(r10 -32) = r1
18: (18) r1 = 0x756220676e696461
20: (7b) *(u64 *)(r10 -40) = r1
21: (18) r1 = 0x657220726f727265
23: (7b) *(u64 *)(r10 -48) = r1
24: (bf) r1 = r10
25: (07) r1 += -48
26: (b7) r2 = 37
27: (85) call bpf_trace_printk#6
28: (05) goto pc+32
61: (b7) r0 = 0
62: (95) exit

from 8 to 29: R0=map_value(id=0,off=0,ks=4,vs=8,imm=0) R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
29: (18) r1 = 0xa78252070616d20
31: (7b) *(u64 *)(r10 -32) = r1
32: (18) r1 = 0x6d6f726620726566
34: (7b) *(u64 *)(r10 -40) = r1
35: (18) r1 = 0x6675622064616572
37: (7b) *(u64 *)(r10 -48) = r1
38: (73) *(u8 *)(r10 -24) = r7
39: (79) r3 = *(u64 *)(r6 +0)
 R0=map_value(id=0,off=0,ks=4,vs=8,imm=0) R1=inv7382915055406376306 R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
40: (bf) r1 = r10
41: (07) r1 += -48
42: (b7) r2 = 25
43: (85) call bpf_trace_printk#6
44: (bf) r2 = r10
45: (07) r2 += -4
46: (18) r1 = 0xffff92f83928d600
48: (85) call bpf_map_delete_elem#3
49: (7b) *(u64 *)(r10 -56) = r7
50: (79) r1 = *(u64 *)(r6 +0)
 R0=inv(id=0) R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
51: (71) r1 = *(u8 *)(r1 +0)
R1 invalid mem access 'inv'
