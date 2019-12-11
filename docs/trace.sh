#!/bin/sh
echo $$ > /debug/tracing/set_ftrace_pid
# can set other filtering here
echo function > /debug/tracing/current_tracer
exec $*
