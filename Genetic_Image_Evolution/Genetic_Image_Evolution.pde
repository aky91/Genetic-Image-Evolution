// Akash Yadav
// @Hudson Lane, New Delhi
// Candy Dream

// Demonstration of Genetic Algorithm
// Population will try to make an image as
// close as possible to the given image

PImage target;
int popmax;
float mutationRate;
Population population;

void setup(){

  size(600, 600);

  target = loadImage("pattern.jpg");
  popmax = 200;
  mutationRate = 0.001;

  population = new Population(target, popmax, mutationRate);

}

void draw(){

  population.naturalSelection();

  population.generate();

  population.calcFitness();

  displayInfo();

  if(population.isFinished())
    noLoop();
}

void displayInfo(){

  background(255);

  PImage answer = population.getBest();

  textAlign(LEFT);
  fill(0);

  textSize(24);
  text("Best image:", 20, 30);
  image(answer, 20, 40);

  textSize(18);
  text("total generations: " + population.getGenerations(), 20, 40 + target.height + 40);
  text("average fitness:   " + nf(population.getAverageFitness()*100) + "%", 20, 40 + target.height + 80);
  text("total population:  " + popmax, 20, 40 + target.height + 120);
  text("mutation rate:     " + int(mutationRate * 100) + "%", 20, 40 + target.height + 160);

}
