// Akash Yadav
// @Hudson Lane, New Delhi
// Candy Dream

class Population{

  float mutationRate;           // Mutation rate
  DNA[] population;             // Array to hold the current population
  ArrayList<DNA> matingPool;    // ArrayList which we will use for our "mating pool"
  PImage target;                // Target image
  int generations;              // Number of generations
  boolean finished;             // Are we finished evolving?
  int perfectScore;
  
  Population(PImage p, int num, float mut) {

    target = p;
    mutationRate = mut;
    population = new DNA[num];

    for (int i = 0; i < population.length; i++)
      population[i] = new DNA(target);

    calcFitness();
    matingPool = new ArrayList<DNA>();
    finished = false;
    generations = 0;

    perfectScore = 1;
  }

  // Fill our fitness array with a value for every member of the population
  void calcFitness() {
    for (int i = 0; i < population.length; i++)
      population[i].fitness(target);
  }

  // Generate a mating pool
  void naturalSelection() {

    // Clear the ArrayList
    matingPool = new ArrayList<DNA>();

    float maxFitness = 0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].fitness > maxFitness)
        maxFitness = population[i].fitness;
    }

    for (int i = 0; i < population.length; i++) { 
      int n;
      float fitness = 0;
      
      if(maxFitness != 0){
        fitness = map(population[i].fitness, 0, maxFitness, 0, 1);
        n = int(fitness * 1000);  // Arbitrary multiplier, we can also use monte carlo method
      } else
        n = 1;
        
      for (int j = 1; j <= n; j++) 
        matingPool.add(population[i]);
    }
  }

  // Create a new generation
  void generate() {
    // Refill the population with children from the mating pool
    for (int i = 0; i < population.length; i++) {
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
      DNA partnerA = matingPool.get(a);
      DNA partnerB = matingPool.get(b);
      DNA child = partnerA.crossover(partnerB);
      child.mutate(mutationRate);
      population[i] = child;
    }
    generations++;
  }

  // Compute the current "most fit" member of the population
  PImage getBest() {
    float worldrecord = 0.0;
    int index = 0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].fitness > worldrecord) {
        index = i;
        worldrecord = population[i].fitness;
      }
    }

    if (worldrecord == perfectScore ) 
      finished = true;

    return population[index].getImage();
  }

  boolean isFinished() {
    return finished;
  }

  int getGenerations() {
    return generations;
  }

  // Compute average fitness for the population
  float getAverageFitness() {
    float total = 0;
    for (int i = 0; i < population.length; i++)
      total += population[i].fitness;
    return total / (population.length);
  }

}
