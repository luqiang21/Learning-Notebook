# Threads
- Threads are sometimes called "lightweight processes" because they run in parallel
like forked processes, but all of them run within the same single process. While
processes are commonly used to start independent programs, threads are commonly
used for tasks such as non-blocking input calls and long-running tasks in a GUI.
    - [] what is non-blocking input calls?
- Since threads run in a single process, every thread shares the same global memory
space of the process. This provides a natural and easy way for threads to communicate
--- by fetching and setting data in global memory.
    - To the Python programmer, this means that both global scope (module-level)
    variables and program-wide interpreter components are shared among all threads
    in a program; if one thread assigns a global variable, its new value will be
    seen by other threads.
## Disadvantages
- Threads are designed to run a call to a function in parallel with the rest of
the program. It is not a direct way to start a program.
- One should be careful to synchronize a variety of operations. Even operations
such as printing are a potential conflict since there is only one sys.stdout per
process, which is shared by all threads.
- Python's implementation of threads means that only one thread is ever running
in the Python virtual machine at any point in time. Python threads are true operating
system threads, but all threads must acquire a single shared lock when they are ready
to run, and each thread may be swapped out after running for a set number of virtual
machine instructions.
    - Because of this structure, Python threads cannot today be distributed across
    multiple CPUs on a multi-CPU computer.
    - To leverage more than one CPU, you'll simply need to use process forking, not
    threads.
