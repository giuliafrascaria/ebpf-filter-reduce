### meeting notes 8/1/2020

- todo: create external helper function 
- insider paper
- test boundaries of bpf (modify, stop, )
- alternate path on map, returning the sum of the integers on map
- databricks

### meeting notes 16/1/2020

- meeting: how to identify user context from bpf -> task struct?? file * in vfs read or deadbeef/whatever signature
- how does code call helper function or is it a context switch
- assume I'm only 1 reader of file for now
- figure out bpf error codes


### meeting 23/1/2020
- how to communicate bween kernel and bpf code
- test whitelisted function as bpf helper
- if-else branch on bpf vs copyout
- bpf read buffer
- check if I can move to 5.4
- google LSM 