# Genetic Image Evolution

The genetic algorithm is a method for solving both constrained and unconstrained optimization problems that is based on natural selection, the process that drives Darwinian biological evolution. 
They mimic the evolution process in a constrained environment. 

This work is based on The Infinite Monkey Theorem which states that a monkey hitting keys at random on a typewriter keyboard for an infinite amount of time will almost surely type a given text, such as the complete works of William Shakespeare. Here we start from random images and see if we can evolve to the given image.
The method of implementation was derived from the works of Daniel Shiffman's book 'The Nature of Code'.

Initially, this algorithm makes a population of randomly generated images.
This population evolves, reproduces and mutates to reach the given target image. 
Due to complexity of color-vectors and tremendous time required for evolution of big images, all the images used are of dimension 10x10 and are grey-scaled.

Fitness of an image is calculated using a Fitness Function which simply gives precentage pixels whose grey value matches with the original image.

Selection of next generation is done by an Selection Algorithm which takes help of a Mating Pool. One child is created by randomly selecting two images from the Mating Pool.
The number of entries in the mating pool which each image gets is directly proportional to its fitness.
In simple words, higher the fitness, higher the entries in the mating pool and thus higher the chances of passing genes to next generation of images.
This is process is synonymous to the phrase "Survival of the Fittest".

Mutation also plays an important role in the evolution process.
A threshold is selected as the mutation rate. While traversing pixel array of the image, a random number is generated between 0 - 100. If that number is <= mutation rate then grey-value of that pixel is changed to some random value.
Thus higher the mutation rate, higher the number of pixels that are likely to change.
It is important to choose the mutation rate carefully. If it is too low, the population can't evolve. If it is too high, the mutation won't let the population evolve. 


# References
https://en.wikipedia.org/wiki/Infinite_monkey_theorem

https://natureofcode.com/
