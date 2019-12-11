## ftrace

with ftrace I can collect information about what is happening in the kernel. I need to obtain a trace of the read path in order to find a good hook for the bopf code

I can use the command line tool trace-cmd to do that, using function-graph to record the read calls

```
sudo trace-cmd record -p function_graph -F ./415read
sudo trace-cmd report > outputfile

```


https://lwn.net/Articles/365835/
https://lwn.net/Articles/366796/
https://lwn.net/Articles/370423/
https://lwn.net/Articles/410200/
https://lwn.net/Articles/608497/
https://www.kernel.org/doc/Documentation/trace/ftrace.txt
https://elinux.org/Ftrace
https://blog.selectel.com/kernel-tracing-ftrace/
https://jvns.ca/blog/2017/03/19/getting-started-with-ftrace/
