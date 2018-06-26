# Genetic-Image-Evolution

The genetic algorithm is a method for solving both constrained and unconstrained optimization problems 
that is based on natural selection, the process that drives Darwinian biological evolution. 
They mimic evolution process in a constrained environment. 

This work is based on The Infinite Monkey Theorem which states that a monkey hitting keys at random on a typewriter keyboard for an infinite amount of time will almost surely type a given text, such as the complete works of William Shakespeare. Here we start from random images and see if we can evolve to the given image.
The way of implementation is derived from works of Daniel Shiffman's book 'The Nature of Code'.

Initially this algorithm makes a population of randomly generated images.
This population evolves, reproduce and mutate to reach the given target image. 
Due to complexity of color-vectors and tremondous time required for evolvution of big images, all the images used are of dimention 10X10 and are grey-scaled.

Fitness of an image is calculated using a Fitness Function which simply gives precentage pixels whose grey value matches with the original image.

Selection of next generation is done by an Selection Algorithm which takes help of a Mating Pool. One child is created by randomly selecting two images from the Mating Pool.
The number of entries in mating pool which each image gets if directly proportional to it fitness.
In simple words, higher the fitness, higher entries in mating pool and thus higher chance of passing genes to next generation of images.
This is process is synonyms to the phrase "Survival of the fittest".

Mutation also plays an important part in the evolution process.
A threshold is selected as a mutation rate. While traversing pixel array of the image, a random no. is generated between 0 - 100. If that no. is <= mutation rate then grey-value of that pixel is changed to some random value.
Thus higher the mutation rate, higher no. of pixels are likely to change.
It is important to choose mutation rate carefully. If it is too low, population can't evolve. If it is too high, the mutation won't let population evolve. 


# References
https://en.wikipedia.org/wiki/Infinite_monkey_theorem

https://natureofcode.com/
