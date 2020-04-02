## 2/4/2020 report

problems I'm working on right now:
- bpf_override_return
- bpf_tail_call
- bpf_dmesg_print (my new helper function)

### bpf_override_return
I had to study the copyout function and how it is used in copy_page_to_iter_iovec.

The copyout does not seem to have an error semantic, it returns the number of bytes left to copy so I can only successfully override with a 0, avoiding it to loop indefinitely. 

this means that I cannot return the AVG, MIN, MAX value through that function, nor the size of the new reduced buffer unless I find a way to modify the value of the buffer len parameter (I have some ideas)

Now the problem:

a call to bpf_override_return in this way silently highjacks execution avoiding the whole buffer copy. This is very good but the caller function does not realize it because the return value is what was expected.

It would be all great, if the execution branches weren't tagged with macros that are signals for branch prediction and speculative execution.

the branch I follow is tagged as likely(), and my override of the result does not cause the code to notice a difference.

So I noticed that sometimes the copyout code, so the buffer copy, is executed anyway even though technically that's impossible because I always override the return and avoid the copy from happening. I think that's probably speculative execution cause the code doesn't look like it's multithreaded, but I will investigate that

### bpf_tail_call

Last week the tail call was not yet working. I now fixed it but the problem is that the reason it was failing was the call to bpf_override_return. I didn't find any explanation online as to why this happens and the problem is that the tail call does not return to caller, so the only way to do it is to call the override before the tail call. 
This is possible, I just need to think about the best way to pass on the computed at this point.

The bigger problem is that the tail call can only take the kprobe context as a parameter, so I cannot preprocess the buffer in the hook and only call the tail call for AVG, MAX and MIN operations. I will see is I can create a new helper that also takes different parameters

If not, I'll see is the MAX MIN and AVG functions can be passed in some other way

### bpf_dmesg_print

Last week the verifier was failing this function. 

I took inspiration by the way in which bpf_strtol manages the strings to understand the issue. Now the helper function passes the verifier but prints rubbish in dmesg, I think it must be a matter of tweaking some constants so this should be fixed soon