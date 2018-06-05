# Genetic-Image-Evolution
The genetic algorithm is a method for solving both constrained and unconstrained optimization problems 
that is based on natural selection, the process that drives biological evolution. 

Initially this algorithm generated a population of randomly generated images.
This population evolves and mutate to reach as close as possible to the given image.

Selection of next generation is done by an Selection Algorithm which I like to call
"Thanos Selection". It simply chooses better half of the population for mating pool.

The mating pool is an arraylist which have better images from the population.
This mimics the selection process.

Advantages of GAs
GAs have various advantages which have made them immensely popular. These include −

1. Does not require any derivative information (which may not be available for many real-world problems).

2. Is faster and more efficient as compared to the traditional methods.

3. Has very good parallel capabilities.

4. Optimizes both continuous and discrete functions and also multi-objective problems.

5. Provides a list of “good” solutions and not just a single solution.

6. Always gets an answer to the problem, which gets better over the time.

7. Useful when the search space is very large and there are a large number of parameters involved.
