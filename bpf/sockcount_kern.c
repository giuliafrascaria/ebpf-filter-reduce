#include <uapi/linux/bpf.h>
#include <linux/in.h>
#include <linux/types.h>
#include <linux/string.h>
#include <linux/if_ether.h>
#include <linux/if_packet.h>
#include <linux/ip.h>
#include <linux/tcp.h>
#include <linux/udp.h>
#include <linux/version.h>
#include "bpf_helpers.h"



#ifndef offsetof
#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
#endif


//communicate with user space
struct bpf_map_def SEC("maps") my_map = {
  .type = BPF_MAP_TYPE_ARRAY,
  .key_size = sizeof(__u32),
  .value_size = sizeof(long),
  .max_entries = 256,
};

//creates a socket filter prog type, when object file is passed to bpf_load.c
SEC("socket")
int bpf_prog1(struct __sk_buff * skb)
{
  //load the right offset in the file
  int proto = load_byte(skb, ETH_HLEN + offsetof(struct iphdr, protocol));
  long initval = 0;
  long * count;

  //discard the packet if not outgoing
  if (skb->pkt_type != PACKET_OUTGOING)
    return 0;


  bpf_map_update_elem(&my_map, &proto, &initval, BPF_NOEXIST);

  count = bpf_map_lookup_elem(&my_map, &proto);

  if (count)
  {
    //it should exist because I initialized all values in the line before

    //long newcount = (*count) + 1;
    //bpf_map_update_elem(&my_map, &proto, &newcount, BPF_EXIST);

    //as per the kernel sample
    __sync_fetch_and_add(count, 1);
  }

	return 0;
}


char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;
