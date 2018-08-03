# Unsupervised Learning
## How to speed up Kmeans for a large dataset?
- use [BFR method](https://www.quora.com/What-are-some-efficient-ways-to-perform-K-means-on-large-data):
    - [implementation](https://github.com/laiola/bfr)
    - Assumes that clusters are normally distributed around a centroid in a Euclidean space
        - Standard deviations in different dimensions may vary
            - Clusters are axis-aligned ellipses
            - For every point we can quantify the likelihood that it belongs to a particular cluster
    - Process:
        - Points are read one main-memory-full at a time
        - Most points from previous memory loads are summarized by simple statistics
        - To begin, from the initial load we select the initial k centroids by some sensible approach, e.g.:
            - Take k random points
            - Take a sample; pick a random point, and then k–1 more points,each as far from the previously selected points as possible (works better than taking the k random points)
    - 3 sets of points to track
        - discard set: points close enough to a centroid to be summarized
        - compression set: groups of points that are close to each other but not close to any existing centroids, these points are summarized but not assigned to any existing cluster.
        - retained set: isolated points waiting to be assigned to compression set


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
