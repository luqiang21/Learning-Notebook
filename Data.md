# Pandas

To reduce memory, one can do:
1. Convert those categorical fields into category using `df[col].astype('category')`
2. Downcast numerical fields to lower types using `pd.to_numeric(df[col], downcast='float')`

To check dataframe's memory usage, one can use `df.info(memory_usage='deep')`  
For general memory usage, one can use:

```
import os, psutil

def usage():
  process = psutil.Process(os.getpid())
  print(process.memory_info()[0] / float(2 ** 20))

usage()
```
