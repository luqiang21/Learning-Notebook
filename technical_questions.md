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

## AVL tree vs. Red-Black tree
- In practice, AVL Trees are typically faster with find operations (because they are forced to be more balanced, so traversing down the tree without modifying it is faster) and Red-Black Trees are typically faster with insertion and removal operations (because they are not required to be as balanced, so they perform less operations to maintain balance after modification).

## Full binary tree vs. complete binary tree
- A full binary tree (sometimes proper binary tree or 2-tree) is a tree in which every node other than the leaves has two children.
- A complete binary tree is a binary tree in which every level, except possibly the last, is completely filled, and all nodes are as far left as possible.


# Others
## Protocol Buffers
- > Protocol buffers are a flexible, efficient, automated mechanism for serializing structured data – think XML, but smaller, faster, and simpler. You define how you want your data to be structured once, then you can use special generated source code to easily write and read your structured data to and from a variety of data streams and using a variety of languages. You can even update your data structure without breaking deployed programs that are compiled against the "old" format.
- Example
	```
	message Person {
	required string name = 1;
	required int32 id = 2;
	optional string email = 3;

	enum PhoneType {
	MOBILE = 0;
	HOME = 1;
	WORK = 2;
	}

	message PhoneNumber {
	required string number = 1;
	optional PhoneType type = 2 [default = HOME];
	}

	repeated PhoneNumber phone = 4;
	}
  ```
- Remember the " = 1", " = 2" markers on each element identify the unique "tag" that field uses in the binary encoding. Tag numbers 1-15 require one less byte to encode than higher numbers, so as an optimization you can decide to use those tags for the commonly used or repeated elements, leaving tags 16 and higher for less-commonly used optional elements. Each element in a repeated field requires re-encoding the tag number, so repeated fields are particularly good candidates for this optimization.
- 'required': a value for the field must be provided, otherwise the message will be considered "uninitialized"
- 'optional': the field may or may not be set.
- 'repeated': the field may be repeated any number of times (including zero). This
is the most popular choice.
