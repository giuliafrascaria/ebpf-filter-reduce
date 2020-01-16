## the BPF verifier
the goal of this document is to explain practical limitations of the bpf verifier

the most common load error that I met so far in bpf load is error 13, that corresponds to a verifier error.

### copy of data to map

I had an issue with the verifier where it would fail if I didn't create a local copy of the thing I was trying to copy to map, before actually copying it

### access to user data

The bpf verifier failed trying to access a char on the user buffer (upon read exit). probably will habve to use a helper function in the kernel (bpf_probe_read looks like a good one e.g. https://elixir.bootlin.com/linux/v4.15/source/samples/bpf/tracex5_kern.c#L49)

this is the dump, the offending line is exactly the one trying to dereference the pointer to read the user buffer

57: (71) r3 = *(u8 *)(r1 +0)
R1 invalid mem access 'inv'
ERROR: loading BPF program (errno 13):

```
sudo ./buffermap f
welcome
loading bpf extension ./buffermap_kern.o
bpf_load_program() err=13
0: (b7) r7 = 0
1: (7b) *(u64 *)(r10 -8) = r7
2: (bf) r2 = r10
3: (07) r2 += -8
4: (18) r1 = 0xffff92f80f82f700
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
28: (05) goto pc+49
78: (b7) r0 = 0
79: (95) exit

from 8 to 29: R0=map_value(id=0,off=0,ks=4,vs=8,imm=0) R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
29: (b7) r1 = 2677
30: (6b) *(u16 *)(r10 -12) = r1
31: (b7) r1 = 1814372468
32: (63) *(u32 *)(r10 -16) = r1
33: (18) r1 = 0x6978652064616572
35: (7b) *(u64 *)(r10 -24) = r1
36: (18) r1 = 0x206e6f2070616d20
38: (7b) *(u64 *)(r10 -32) = r1
39: (18) r1 = 0x6d6f726620726566
41: (7b) *(u64 *)(r10 -40) = r1
42: (18) r1 = 0x6675622064616572
44: (7b) *(u64 *)(r10 -48) = r1
45: (73) *(u8 *)(r10 -10) = r7
46: (79) r3 = *(u64 *)(r6 +0)
 R0=map_value(id=0,off=0,ks=4,vs=8,imm=0) R1=inv7382915055406376306 R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
47: (bf) r1 = r10
48: (07) r1 += -48
49: (b7) r2 = 39
50: (85) call bpf_trace_printk#6
51: (bf) r2 = r10
52: (07) r2 += -8
53: (18) r1 = 0xffff92f80f82f700
55: (85) call bpf_map_delete_elem#3
56: (79) r1 = *(u64 *)(r6 +0)
 R0=inv(id=0) R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
57: (71) r3 = *(u8 *)(r1 +0)
R1 invalid mem access 'inv'
ERROR: loading BPF program (errno 13):
0: (b7) r7 = 0
1: (7b) *(u64 *)(r10 -8) = r7
2: (bf) r2 = r10
3: (07) r2 += -8
4: (18) r1 = 0xffff92f80f82f700
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
28: (05) goto pc+49
78: (b7) r0 = 0
79: (95) exit

from 8 to 29: R0=map_value(id=0,off=0,ks=4,vs=8,imm=0) R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
29: (b7) r1 = 2677
30: (6b) *(u16 *)(r10 -12) = r1
31: (b7) r1 = 1814372468
32: (63) *(u32 *)(r10 -16) = r1
33: (18) r1 = 0x6978652064616572
35: (7b) *(u64 *)(r10 -24) = r1
36: (18) r1 = 0x206e6f2070616d20
38: (7b) *(u64 *)(r10 -32) = r1
39: (18) r1 = 0x6d6f726620726566
41: (7b) *(u64 *)(r10 -40) = r1
42: (18) r1 = 0x6675622064616572
44: (7b) *(u64 *)(r10 -48) = r1
45: (73) *(u8 *)(r10 -10) = r7
46: (79) r3 = *(u64 *)(r6 +0)
 R0=map_value(id=0,off=0,ks=4,vs=8,imm=0) R1=inv7382915055406376306 R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
47: (bf) r1 = r10
48: (07) r1 += -48
49: (b7) r2 = 39
50: (85) call bpf_trace_printk#6
51: (bf) r2 = r10
52: (07) r2 += -8
53: (18) r1 = 0xffff92f80f82f700
55: (85) call bpf_map_delete_elem#3
56: (79) r1 = *(u64 *)(r6 +0)
 R0=inv(id=0) R6=map_value(id=0,off=0,ks=4,vs=8,imm=0) R7=inv0 R10=fp0
57: (71) r3 = *(u8 *)(r1 +0)
R1 invalid mem access 'inv'
```