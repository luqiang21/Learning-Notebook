### library function setw():
- setw() is declared inside #include<iomanip>
- setw() will set field width.
- setw() sets the number of characters to be used as the field width for the **next** insertion operation.


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
