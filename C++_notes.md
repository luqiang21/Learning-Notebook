### library function setw():
- setw() is declared inside #include<iomanip>
- setw() will set field width.
- setw() sets the number of characters to be used as the field width for the **next** insertion operation.


### Arrays as parameters
C++ does not allow arrays to be passed to functions, but, as we have seen, it does allow pointers to be passed. There are three methods for passing an array by reference to a function:

- void functionName(variableType *arrayName)
- void functionName(variableType arrayName[length of array])
- void functionName(variableType arrayName[])
