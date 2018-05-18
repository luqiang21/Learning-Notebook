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
