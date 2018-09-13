### Object oriented languages
Modern object-oriented (OO) languages provide 3 capabilities:
- encapsulation
- inheritance
- polymorphism

# Basic Interview Questions

#### Definitions of class and object
- A class is a user defined data type declared with keyword class that has data and functions. Members whose access is governed by three specifiers: private, protected and public.
- An object is an instance of a class. It is also a variable of class type.

#### what is polymorphism?
- Polymorphism means having multiple forms of one thing.
    - overloading (compile time)
        - It provides multiple definitions of the same function by changing signature i.e changing number of parameters, change datatype of parameters, return type doesn’t play any role.
    - overriding (runtime)
        - In inheritance, polymorphism is done, by method overriding, when both super and sub class have member function with same declaration bu different definition.



#### what is data encapsulation?
- Encapsulation is an Object Oriented Programming concept that binds together the data and functions that manipulate the data, and that keeps both safe from outside interference and misuse. Data encapsulation led to the important OOP concept of **data hiding**.
- Benefits of encapsulation:
    - Control the way data is accessed or modified
    - Code is more flexible and easy to change with new requirements
    - Change one part of code without affecting other part of code.

#### what is data abstraction?
- Data abstraction provides only essential information to the outside world (users) and hiding their background details (implementation details).

#### What makes a class an abstract class?
- A class is made abstract by declaring at least one of its functions as pure virtual function.


#### what is inheritance?
- Inheritance allows us to define a class in terms of another class, which makes it easier to create and maintain an application. This also provides an opportunity to reuse the code functionality and fast implementation time.

#### What are the 5 types of inheritance in C++?
- single inheritance
- multiple inheritance
    - many to one
- hierarchical inheritance
    - one to many
- multilevel inheritance
- hybrid (virtual) inheritance
    - combination of Hierarchical and Muti-level Inheritance.

#### inline function
- If a function is inline, the compiler places a copy of the code of that function at each point where the function is called at compile time.
- Advantage
    - Less overhead and faster program execution as there is no transfer of control from the main program to the function definition whenever function call is encountered.
- Disadvantage:
    - program needs more memory space as function definitions are copied at multiple places in the program wherever the function call is encountered.

#### What is the order in which the destructors and the constructors are called in C++?
- The order is:
      1. Base constructor
      1. Derived constructor
      1. Derived destructor
      1. Base destructor

#### What is a virtual function?
- Virtual function is a function in the base class with keyword virtual declared, and the goal is to let the user know that this function is meant to be overridden (or redefined) by the derived class.

#### Static Keyword
- Static is a keyword in C++ used to give special characteristics to an element. Static elements are allocated storage only once in a program lifetime in static storage area. And they have a scope till the program lifetime. Static Keyword can be used with following:

    1. Static variable in functions
        - Static variables when used inside function are initialized only once, and then they hold there value even through function calls. These static variables are stored on static storage area , not in stack.
        - If you don't initialize a static variable, they are by default initialized to zero.
    1. Static Class Objects
        - Objects declared static are allocated storage in static storage area, and have scope till the end of program.
    1. Static member Variable in class
        - Static data members of class are those members which are shared by all the objects. Static data member has a single piece of storage, and is not available as separate copy with each object, like other non-static data members.
        - Static member variables (data members) are not initialied using constructor, because these are not dependent on object initialization.
        - Also, it must be initialized explicitly, always outside the class. If not initialized, Linker will give error.
        ```cpp
        class X
        {
         static int i;
         public:
         X(){};
        };

        int X::i=1;
        ```
    1. Static Methods in class
        - These functions work for the class as whole rather than for a particular object of a class.
        - These functions cannot access ordinary data members and member functions, but only static data members and static member functions. It doesn't have any "this" keyword which is the reason it cannot access ordinary members.



##### What is a static variable?

- A static variable will retain its value between function calls.

##### What is a static member variable?

- A static member variable means that the variable is shared between all instances of the class.

    - **Advantage**
        - That means, instead of each instance having a copy of the variable, all instances share this variable. It is often preferred to save space especially when the variable is an object of a class. Likewise for static functions and classes. There is only one copy of the variable. The idea is that creating and cleaning up the instances can be a computationally expensive process, if it can be made static, it is a good idea to speed up execution of the program.
    - **Disadvantage**
        - On the flip side, it can also be expensive to use a static variable. If using a static variable requires the CPU to fetch the variable from slower memory, rather than having it in the cache or stack. Each fetch from slower memory slows down execution time.

#### #ifdef and #ifndef
- Text inside an ifdef/endif or ifndef/endif pair will be left in or removed by the pre-processor depending on the condition. ifdef means "if the following is defined" while ifndef means "if the following is not defined".

    So:  
    ```
    #define one 0
    #ifdef one
        printf("one is defined ");
    #endif
    #ifndef one
        printf("one is not defined ");
    #endif
    ```
    is equivalent to:

    `printf("one is defined ");   `  

    since one is defined so the ifdef is true and the ifndef is false. It doesn't matter what it's defined as.  

#### Why are #ifndef and #define used in C++ header files?
- Those are called #include guards.

  Once the header is included, it checks if a unique value (in this case HEADERFILE_H_) is defined. Then if it's not defined, it defines it and continues to the rest of the page.

  When the code is included again, the first ifndef fails, resulting in a blank file.

  That prevents double declaration of any identifiers such as types, enums and static variables.

#### Why do we use setters and getters?
- Mutators (setters) are used to set values of private data members. One of the main goals of a mutator is to check correctness of the value to be set to data member.

#### compile and run
- include libraries
- preprocessor, compilation (.o), link (.exe or no suffix)

- static libaries - actually compiled into your program
    - windows: XYZ.lib
    - UNIX/Linux/Mac: libXYZ.a
- Dynamic libraries: program find code at run time
    - windows: XYZ.dll
    - UNIX/Linux/Mac: libXYZ.so
    - Mac: XYZ.dylib

### const
- to be filled


#### Difference between constexpr(C++11) variables and const
- The primary difference between const and constexpr variables is that the initialization of a const variable can be deferred until run time whereas a constexpr variable must be initialized at compile time. All constexpr variables are const.

    ```cpp
    constexpr float x = 42.0;  
    constexpr float y{108};  
    constexpr float z = exp(5, 3);  
    constexpr int i; // Error! Not initialized  
    int j = 0;  
    constexpr int k = j + 1; //Error! j not a constant expression  
    ```

#### what happens to an uninitialized array?
- If you have the declaration
`int factors[100]; /* note this is not initialized */`
- there are two situations:
    - When declared as a global (file scope) variable, the entire array will be initialised to zeros before your program starts.
    - When declared as a local (function scope) variable, the array is not initialised and will contain unpredictable numbers.

#### Difference between deque and list
- Deque manages its elements with a dynamic array, provides random access, and has almost the same interface as a vector.
- List manages its elements as a doubly linked list and does not provide random access.
- Deque provides Fast insertions and deletions at both the end and the beginning. Inserting and deleting elements in the middle is relatively slow because all elements up to either of both ends may be moved to make room or to fill a gap.
- In List, inserting and removing elements is fast at each position, including both ends.
- Deque: Any insertion or deletion of elements other than at the beginning or end invalidates all pointers, references, and iterators that refer to elements of the deque.
- List: Inserting and deleting elements does not invalidate pointers, references, and iterators to other elements.

Name |Insert/erase at the beginning  |     in middle    |    at the end
-------- | ------ | ------- | -------
Deque:     |  Amortized constant    |              Linear      |     Amortized constant
List:      |  Constant                |            Constant       |  Constant


#### Difference between `delete` and `delete []`
- `delete` calls one destructor whereas `delete[]` needs to look up the size of
the array and call that many destructors.
- primitive types like int don't have destructors, so if you are wrongly calling
`delete` on a pointer to `new []` arrays, you will not get errors.

#### Function pointer
- function pointer example:
        ```
        #include <iostream>
        using namespace std;

        void test() {
            cout << "test" << endl;
        }
        void test(int value) {
            cout << "test with value: " << value << endl;
        }

        int main() {
            test();
            void (*pTest)() = test;
            pTest();

            test(3);
            void (*pTest1)(int) = test;
            pTest1(3);
        }
        ```
- A callback is any executable code that is passed as an argument to other code, which is expected to call back (execute) the argument at a given time. In simple language, If a reference of a function is passed to another function as an argument to call it, then it will be called as a Callback function.
- Callback example
        ```
        #include <iostream>
        #include <vector>
        using namespace std;

        bool match(string test) {
            return test.size() == 3;
        }

        int countStrings(vector<string> &texts, bool (*match)(string test)) {
            int tally;

            for(auto test: texts) {
                if(match(test)) {
                    tally ++;
                }
            }
            return tally;
        }

        int main() {
            vector<string> texts = {"one", "two", "three", "four"};
            cout << countStrings(texts, match) << endl;
            return 0;
        }

        ```
#### Heap and stack in memory
- The stack is the memory set aside as scratch space for a thread of execution. When a function is called, a block is reserved on the top of the stack for local variables and some bookkeeping data. When that function returns, the block becomes unused and can be used the next time a function is called.
    - The advantage of using the stack to store variables, is that memory is managed for you. You don't have to allocate memory by hand, or free it once you don't need it any more.
    -  The stack is always reserved in a LIFO (last in first out) order; the most recently reserved block is always the next block to be freed. This makes it really simple to keep track of the stack; freeing a block from the stack is nothing more than adjusting one pointer.
    - A “stack pointer” register tracks the top of the stack; it is adjusted each time a value is “pushed” onto the stack. The set of values pushed for one function call is termed a “stack frame”; A stack frame consists at minimum of a return address.
    - The stack frame only exists during the execution time of a function, and so do the objects on the stack frame. That has the advantage that we do not need to worry about memory leaks caused by stack-allocated objects — but the objects are also not available anymore once we return from the function.
- Heap is the segment where dynamic memory allocation usually takes place. The heap is a region of your computer's memory that is not managed automatically for you, and is not as tightly managed by the CPU. It is a more free-floating region of memory (and is larger). To allocate memory on the heap, you must use malloc() or calloc(), which are built-in C functions.
    - In languages that are not garbage-collected, objects on the heap lead to memory leaks if they are not freed.
    - The heap is memory set aside for dynamic allocation. Unlike the stack, there's no enforced pattern to the allocation and deallocation of blocks from the heap; you can allocate a block at any time and free it at any time. This makes it much more complex to keep track of which parts of the heap are allocated or free at any given time; there are many custom heap allocators available to tune heap performance for different usage patterns.
- Each thread gets a stack, while there's typically only one heap for the application (although it isn't uncommon to have multiple heaps for different types of allocation).
- What are their scopes?
    - The stack is attached to a thread, so when the thread exits the stack is reclaimed. The heap is typically allocated at application startup by the runtime, and is reclaimed when the application (technically process) exits.
- What determines the size of each of them?
    - The size of the stack is set when a thread is created. The size of the heap is set on application startup, but can grow as space is needed (the allocator requests more memory from the operating system).

#### Socket programming
- Socket programming is a way of connecting two nodes on a network to communicate with each other. One socket(node) listens on a particular port at an IP, while other socket reaches out to the other to form a connection. Server forms the listener socket while client reaches out to the server.
<p align="center">
  <img src="images/Socket-Programming.jpg">
</p>

- Stages for server
    - Socket creation:
        - `int sockfd = socket(domain, type, protocol)`
        - sockfd: socket descriptor, an integer (like a file-handle)
        - domain: integer, communication domain e.g., AF_INET (IPv4 protocol) , AF_INET6 (IPv6 protocol)
        - type: communication type
        SOCK_STREAM: TCP(reliable, connection oriented)
        SOCK_DGRAM: UDP(unreliable, connectionless)
        - protocol: Protocol value for Internet Protocol(IP), which is 0. This is the same number which appears on protocol field in the IP header of a packet.(man protocols for more details)
    - Setsockopt:
        - `int setsockopt(int sockfd, int level, int optname,  
                           const void *optval, socklen_t optlen);`
        - This helps in manipulating options for the socket referred by the file descriptor sockfd. This is completely optional, but it helps in reuse of address and port. Prevents error such as: “address already in use”.
    - Bind:
        - `int bind(int sockfd, const struct sockaddr *addr,
                                  socklen_t addrlen);`
        - After creation of the socket, bind function binds the socket to the address and port number specified in addr(custom data structure).
    - Listen:
        - `int listen(int sockfd, int backlog);`
        - It puts the server socket in a passive mode, where it waits for the client to approach the server to make a connection. The backlog, defines the maximum length to which the queue of pending connections for sockfd may grow. If a connection request arrives when the queue is full, the client may receive an error with an indication of ECONNREFUSED.
    - Accept:
        - `int new_socket= accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen);`
        - It extracts the first connection request on the queue of pending connections for the listening socket, sockfd, creates a new connected socket, and returns a new file descriptor referring to that socket. At this point, connection is established between client and server, and they are ready to transfer data.

- Stages for Client
    - Socket connection: Exactly same as that of server’s socket creation
    - Connect:
        - `int connect(int sockfd, const struct sockaddr *addr,  
                                     socklen_t addrlen);`
        - The connect() system call connects the socket referred to by the file descriptor sockfd to the address specified by addr. Server’s address and port is specified in addr.

- Other notes about socket:
    > When the connect completes, the socket s can be used to send in a request for
    the text of the page. The same socket will read the reply, and then be destroyed.
    That’s right, destroyed. Client sockets are normally only used for one exchange
    (or a small set of sequential exchanges).

    > `send` and `recv` operate on the network buffers. They do not necessarily handle all
    the bytes you hand them (or expect from them), because their major focus is handling
    the network buffers. In general, they return when the associated network buffers
    have been filled (send) or emptied (recv). They then tell you how many bytes they
    handled. It is your responsibility to call them again until your message has been
    completely dealt with.

    > A protocol like HTTP uses a socket for only one transfer. The client sends a
    request, then reads a reply. That’s it. The socket is discarded. This means that
    a client can detect the end of the reply by receiving 0 bytes.

    > But if you plan to reuse your socket for further transfers, you need to realize
    that there is no EOT on a socket. I repeat: if a socket send or recv returns after
    handling 0 bytes, the connection has been broken.

#### typedef versus #define
- `typedef` is used to give data type a new name.
- `#define` is a C directive which is used to #define alias.
- `typedef` is different from `#define` among the following aspects:
    - from [geeksforgeeks](https://www.geeksforgeeks.org/typedef-versus-define-c/)  

    > - typedef is limited to giving symbolic names to types only, where as #define can be used to define alias for values as well, e.g., you can define 1 as ONE, 3.14 as PI, etc.
    > - typedef interpretation is performed by the compiler where #define statements are performed by preprocessor.
    > - #define should not be terminated with semicolon, but typedef should be terminated with semicolon.
    > - #define will just copy-paste the definition values at the point of use, while typedef is actual definition of a new type.
    > - typedef follows the scope rule which means if a new type is defined in a scope (inside a function), then the new type name will only be visible till the scope is there. In case of #define, when preprocessor encounters #define, it replaces all the occurrences, after that (No scope rule is followed).

- example:

    ```
    #include <stdio.h>
    typedef char* ptr;
    #define PTR char*
    int main() {
        ptr a, b, c;
        PTR x, y, z;
        std::cout << "sizeof a: " << sizeof(a) << std::endl;
        std::cout << "sizeof b: " << sizeof(b) << std::endl;
        std::cout << "sizeof c: " << sizeof(c) << std::endl;
        std::cout << "sizeof x: " << sizeof(x) << std::endl;
        std::cout << "sizeof y: " << sizeof(y) << std::endl;
        std::cout << "sizeof z: " << sizeof(z) << std::endl;
    }
    ```
- output: (note the size difference between x and y, z) 

    ```
    sizeof a: 8
    sizeof b: 8
    sizeof c: 8
    sizeof x: 8
    sizeof y: 1
    sizeof z: 1
    ```



# Essential Interview Problems
1. what will be the output of `cout << 25u - 50;` ?
    - In C++, if the types of two operands differ from one another, then the operand with the “lower type” will be promoted to the type of the “higher type” operand, using the following type hierarchy (listed here from highest type to lowest type): long double, double, float, unsigned long int, long int, unsigned int, int (lowest).

2. Consider the two code snippets below for printing a vector. Is there any advantage of one vs. the other? Explain.

    Option 1:
    ```cpp
    vector vec;
    /* ... .. ... */
    for (auto itr = vec.begin(); itr != vec.end(); itr++) {
    	itr->print();
    }
    ```
    Option 2:
    ```cpp
    vector vec;
    /* ... .. ... */
    for (auto itr = vec.begin(); itr != vec.end(); ++itr) {
    	itr->print();
    }
    ```
    - Although both options will accomplish precisely the same thing, the second option is better from a performance standpoint. This is because the post-increment operator (i.e., itr++) is more expensive than pre-increment operator (i.e., ++itr). The underlying implementation of the post-increment operator makes a copy of the element before incrementing it and then returns the copy.
    - That said, many compilers will automatically optimize the first option by converting it into the second.

3. Write a C++ function to swap two integers without using a temp variable.
    ```
    //Write a C++ function to swap two integers without
    //using a temp variable.

    //Hint: think about pointers

    #include<iostream>
    using namespace std;

    void swap(int *xp, int *yp)
    {
         if(xp == yp)
             return;
         *xp = *xp + *yp;
         cout<<"\n1. During swap x = "<<*xp<<" y = "<<*yp;
         *yp = *xp - *yp;
         cout<<"\n2. During swap x = "<<*xp<<" y = "<<*yp;
         *xp = *xp - *yp;
         cout<<"\n3. During swap x = "<<*xp<<" y = "<<*yp;
    }
    void swap(int &x, int &y)
    {
         if(x == y)
             return;
         x = x + y;
         cout<<"\n1. During swap x = "<<x<<" y = "<<y;
         y = x - y;
         cout<<"\n2. During swap x = "<<x<<" y = "<<y;
         x = x - y;
         cout<<"\n3. During swap x = "<<x<<" y = "<<y;
    }
    int main()
    {
         int x = 10;
         int y = 33;
         cout<<"\nBefore swap x = "<<x<<" y = "<<y;
         swap(&x,&y);
         cout<<"\nAfter swap x = "<<x<<" y = "<<y;
         return 0;
    }
    ```

4. How to determine if one object's class is a subclass of another?

    - There are actually two ways to achieve this:
    ```cpp
    // 1. may not be correct
    Base* p = new Base();
    Base* pB = static_cast<Base*>(p); // Checks if B is related to A in an inheritance
         // ^^^^^^^^^^^^^^^^^^^    hierarchy. Fails to compile if not.
    // 2. dynamic cast
    #include <iostream>
    #include <typeinfo>

    using namespace std;

    class Base {
    public:
        virtual ~Base() // make this a polymorphic class
    };

    class Derived: public Base {
    public:
        virtual ~Derived() {}
    };

    int main(){
        Derived d;

        // Query the type relationship
        if (dynamic_cast<Base*>(&d)){
            cout << "Derived is a subclass of Base" << endl;
        }
        else{
            cout << "Derived is NOT a subclass of Base" << endl;
        }
    }
    ```

5. What is the problem with the following code?
    ```
    class A
    {
    public:
    A() {}
    ~A(){}
    };

    class B: public A
    {
    public:
    B():A(){}
    ~B(){}
    };

    int main(void)
    {
      A* a = new B();
      delete a;
    }
    ```
    The behavior is undefined because A’s destructor is not virtual. From the spec:

    > ( C++11 §5.3.5/3 ) if the static type of the object to be deleted is different from its dynamic type, the static type shall be a base class of the dynamic type of the object to be deleted and the static type shall have a virtual destructor or the behavior is undefined.


### library function setw():
- setw() is declared inside #include<iomanip>
- setw() will set field width.
- setw() sets the number of characters to be used as the field width for the **next** insertion operation.

## STL
### Vector
- std::vector::begin
    - Returns an iterator pointing to the first element in the vector.
- std::vector::end
    - An iterator to the element past the end of the sequence.
- As is the case with Python, elements are zero-indexed and can be accessed with a syntax such as vector_name[2]. However, unlike Python, C++ does not check the validity of an index at run-time; it simply trusts the programmer (with potential disaster if the programmer is wrong). A safer (yet slower) way to access an element in C++ is with the syntax vector_name.at(2); this version performs an explicit run-time check of the given index, throwing an out of range exception when warranted.

### set
- Python’s sets are implemented using an approach known as hashing. This approach provides constant-time operations in general, but the elements of the set are not well-ordered. In contrast, the C++ set class represents an ordered set, implemented using a balanced binary search tree. For this reason, the element-type for a set must define a total ordering, by default based on an implementation of operator<.

### map
- As is the case with sets, C++ uses balanced binary trees to implement maps, and the key type must define a total ordering, typically with operator<.

### Arrays as parameters
C++ does not allow arrays to be passed to functions, but, as we have seen, it does allow pointers to be passed. There are three methods for passing an array by reference to a function:

- void functionName(variableType *arrayName)
- void functionName(variableType arrayName[length of array])
- void functionName(variableType arrayName[])

### Functions having void as the argument
In C:
- void foo() means "a function foo taking an unspecified number of arguments of unspecified type"
- void foo(void) means "a function foo taking no arguments"

In C++:
- void foo() means "a function foo taking no arguments"
- void foo(void) means "a function foo taking no arguments"
By writing foo(void), therefore, we achieve the same interpretation across both languages and make our headers multilingual

### Templates
The syntax for templates for functions:

The function declaration:
```
template <typename T>  //tell the compiler we are using a template

//T represents the variable type. Since we want it to be for any type, we
//use T
T  functionName (T parameter1,T parameter2, ...);
```

The function definition:
```
template <typename T>
T functionName (T  parameter1,T  parameter2,...)
{
    function statements;
}
```

multiple templates (pay attention to the return type)
```cpp
template <typename T, typename U>
T getBigger(T input1, U input2);


int main()
{
    int a = 5;
    float b = 6.334;
    int bigger;
    cout<<"Between "<<a<<" and "<<b<<" "<<getBigger(a,b)<<" is bigger.\n";

    cout<<"Between "<<a<<" and "<<b<<" "<<getBigger(b,a)<<" is bigger.\n";    
    return 0;
}

template <typename T, typename U>
T getBigger(T input1, U input2)
{
    if(input1 > input2)
        return input1;
    return input2;
}
```


### write a matrix class
