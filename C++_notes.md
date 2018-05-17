### Object oriented languages
Modern object-oriented (OO) languages provide 3 capabilities:
- encapsulation
- inheritance
- polymorphism

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
