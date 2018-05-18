### Object oriented languages
Modern object-oriented (OO) languages provide 3 capabilities:
- encapsulation
- inheritance
- polymorphism

## Basic Interview Questions

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
    - combination of Hierarchical and Mutilevel Inheritance.

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

## Essential Interview Problems
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

### library function setw():
- setw() is declared inside #include<iomanip>
- setw() will set field width.
- setw() sets the number of characters to be used as the field width for the **next** insertion operation.

### Vector
- std::vector::begin
    - Returns an iterator pointing to the first element in the vector.
- std::vector::end
    - An iterator to the element past the end of the sequence.


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
