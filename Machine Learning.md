# Optimization
## Newton method
- is a method for finding successively better approximations to the roots (or zeroes) of a real-valued function.
    > The method starts with a function $f$ defined over the real numbers $x$, the function's derivative $f′$, and an initial guess $x_0$ for a root of the function $f$. If the function satisfies the assumptions made in the derivation of the formula and the initial guess is close, then a better approximation $x_1$ is  
    $$x_1 = x_0 - \frac{f(x_0)}{f'(x_0)}$$
    > Geometrically, $(x_1, 0)$ is the intersection of the x-axis and the tangent of the graph of $f$ at $(x_0, f(x_0))$.  
    > The process is repeated as  
    $$x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}$$
    > until a sufficiently accurate value is reached.

- Why don't we use Newton method in deep learning?  

    > Gradient descent maximizes a function using knowledge of its derivative. Newton's method, a root finding algorithm, maximizes a function using knowledge of its second derivative. That can be faster when the second derivative is known and easy to compute (the Newton-Raphson algorithm is used in logistic regression). However, the analytic expression for the second derivative is often complicated or intractable, requiring a lot of computation. Numerical methods for computing the second derivative also require a lot of computation -- if N values are required to compute the first derivative, N^2 are required for the second derivative.

    - [ ] why are we saying newton method use second derivative to maximize? (the equation is only 1st derivative)
# Supervised Learning

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

# Reinforcement Learning
- The Deep Mind Paper I explained partially here: https://www.freecodecamp.org/news/explained-simply-how-deepmind-taught-ai-to-play-video-games-9eb5f38c89ee/
- Markov Decision Process (MDP)
- Value function
- Action-Value function
- Advantage function
- In model-based RL, we use the model and cost function to find an optimal trajectory of states and actions (optimal control).
- Exploration vs Exploitation
    - Exploration 
        - epsilon-greedy: We pick the action with highest Q value but yet we allow a small chance of selecting other random actions
## Temporal-Difference Methods
- Whereas Monte Carlo (MC) prediction methods must wait until the end of an episode to update the value function estimate, temporal-difference (TD) methods update the value function after every time step.
### TD Control
- Sarsa(0) (or Sarsa) is an on-policy TD control method. It is guaranteed to converge to the optimal action-value function q_*, as long as the step-size parameter \alpha is sufficiently small and \epsilon is chosen to satisfy the Greedy in the Limit with Infinite Exploration (GLIE) conditions.
- Sarsamax (or Q-Learning) is an off-policy TD control method. It is guaranteed to converge to the optimal action value function q_*, under the same conditions that guarantee convergence of the Sarsa control algorithm.
- Expected Sarsa is an on-policy TD control method. It is guaranteed to converge to the optimal action value function q_*, under the same conditions that guarantee convergence of Sarsa and Sarsamax.
#### The differences between these algorithms are summarized below:
- Sarsa and Expected Sarsa are both on-policy TD control algorithms. In this case, the same (\epsilon-greedy) policy that is evaluated and improved is also used to select actions.
- Sarsamax is an off-policy method, where the (greedy) policy that is evaluated and improved is different from the (\epsilon-greedy) policy that is used to select actions.
- On-policy TD control methods (like Expected Sarsa and Sarsa) have better online performance than off-policy TD control methods (like Sarsamax).
- Expected Sarsa generally achieves better performance than Sarsa.

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
