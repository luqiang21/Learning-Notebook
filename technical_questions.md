# C++

- what are the 3 foundations of C++?
	- Object oriented
	- Inheritance
	- Polymorphism

- what is SVM? explain in high level
- Given a interested subset from a bunch of data, how to know the important features for this subset.
- When to use scale?
	- Scale means that you're transforming your data so that it fits within a specific scale, like 0-100 or 0-1. You want to scale data when you're using methods based on measures of how far apart data points, like support vector machines, or SVM or k-nearest neighbors, or KNN.
- When to use normalization?
	- Scaling just changes the range of your data. Normalization is a more radical transformation. The point of normalization is to change your observations so that they can be described as a normal distribution.
	- In general, you'll only want to normalize your data if you're going to be using a machine learning or statistics technique that assumes your data is normally distributed.

# Algorithms
## why BFS has complexity of O(|V| + |E|)
I hope this is helpful to anybody having trouble understanding computational time complexity for Breadth First Search a.k.a BFS.

```
Queue graphTraversal.add(firstVertex);

// This while loop will run V times, where V is total number of vertices in graph.
while(graphTraversal.isEmpty == false)

    currentVertex = graphTraversal.getVertex();

    // This while loop will run Eaj times, where Eaj is number of adjacent edges to current vertex.
    while(currentVertex.hasAdjacentVertices)
        graphTraversal.add(adjacentVertex);

    graphTraversal.remove(currentVertex);
```

Time complexity is as follows:

V * (O(1) + Eaj + O(1))
V + V * Eaj + V
2V + E(total number of edges in graph)
V + E
