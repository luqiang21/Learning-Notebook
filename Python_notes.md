# Concepts
## POSIX
- The Portable Operating System Interface (POSIX) is a family of standards specified by the IEEE Computer Society for maintaining compatibility between operating systems. POSIX defines the application programming interface (API), along with command line shells and utility interfaces, for software compatibility with variants of Unix and other operating systems.

## Socket
- Sockets are inherently bidirectional in nature, and socket object methods map
directly to socket calls in the C library. We usually call the perpetually running
listener program a server and the connecting program a client.
- `sockobj.listen(5)`
    - Starts listening for incoming client connections and allows for a backlog of
    up to 5 pending requests.
- `connection, address = socketobj.accept()`
    - Waits for the next client connection request to occur; when it does, the accept
    call returns a brand new socket object over which data can be transferred from
    and to the connected client. Connections are accepted on `sockobj`, but communication
    with a client happens on `connection`, the new socket. This call actually returns
    a two-item tuple---address is the connecting client's Internet address. We can
    call accept more than one time, to service multiple client connections, that's
    why each call returns a new, distinct socket for talking to a particular client.
### Handling Multiple Clients
- If multiple clients try to connect to the server, and it takes a long time to process
a given client's request, the server will fail. More accurately, if the cost of
handling a given request prevents the server from returning to the code that checks
for new clients in a timely manner, it won't be able to keep up with all the requests,
and some clients will eventually be denied connections.
- Three ways to handle clients in parallel:
    - Forking servers
        - service each client's request in a new forking process
        - not portable, only Unix platforms
    - Threading servers
        - service each client's request in a thread
        - simpler and portable
        - unlike forking process, don't need to do cleaning, child threads die silently on exit
    - Multiplexing servers


## Threads
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
### Disadvantages
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

## GIL (Global Interpreter Lock)
- Python currently uses a global interpreter lock (GIL) mechanism, which guarantees
that at most, one thread is running code within the Python interpreter at any given
point in time. In addition, to make sure that each thread gets a chance to run,
the interpreter automatically switches its attention between threads at regular
intervals (by releasing and acquiring the lock after a number of bytecode instructions)
as well as at the start of long-running operations (e.g. on file input/output requests).
This scheme avoids problems that could arise if multiple threads were to update
Python system data at the same time.
