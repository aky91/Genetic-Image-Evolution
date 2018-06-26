// Akash Yadav
// @Hudson Lane, Delhi
// 26th June 18

// Genetic Algorithm, Evolving Images

// Demonstration of using a genetic algorithm to perform a search

// setup()
//  # Step 1: The Population 
//    # Create an empty population (an array or ArrayList)
//    # Fill it with DNA encoded objects (pick random values to start)

// draw()
//  # Step 1: Selection 
//    # Create an empty mating pool (an empty ArrayList)
//    # For every member of the population, evaluate its fitness based on some criteria / function, 
//      and add it to the mating pool in a manner consistant with its fitness, i.e. the more fit it 
//      is the more times it appears in the mating pool, in order to be more likely picked for reproduction.

//  # Step 2: Reproduction Create a new empty population
//    # Fill the new population by executing the following steps:
//       1. Pick two "parent" objects from the mating pool.
//       2. Crossover -- create a "child" object by mating these two parents.
//       3. Mutation -- mutate the child's DNA based on a given probability.
//       4. Add the child object to the new population.
//    # Replace the old population with the new population
//  
//   # Rinse and repeat

PFont f;
PImage target;
PImage show;
int popmax;
float mutationRate;
Population population;

void setup() {

	size(800, 600);
	f = createFont("Courier", 32, true);

	target = loadImage("mix.png");
  show = createImage(target.width, target.height, RGB);

	rgb2grey(target);

	popmax = 2000;
	mutationRate = 0.001;

	// Create a populationation with a target phrase, mutation rate, and populationation max
	population = new Population(target, mutationRate, popmax);
}

void draw() {

	// Generate mating pool
	population.naturalSelection();
	//Create next generation
	population.generate();
	// Calculate fitness
	population.calcFitness();
	
  displayInfo();

	// If we found the target phrase, stop
	if (population.finished()) {
    textSize(30);
    text("Time taken : " + millis()/1000.0 + " seconds", 20, show.height + 260);
		noLoop();
	}
}


void displayInfo() {

	background(255);
  
	// Display current status of populationation
	PImage answer = population.getBest();
	textFont(f);
	textAlign(LEFT);
	fill(0);
	
	
	textSize(24);
	text("Best image:  fitness : " + population.allTimeBest() + " , " + population.getBestFitness(),20,30);
	textSize(40);

  copyImg(target);
  show.resize(0,100);
	image(show, 20, 100);

  copyImg(answer);
  show.resize(0,100);
  image(show, 20 + 150, 100);

	textSize(18);
	text("total generations:     " + population.getGenerations(), 20, show.height + 160);
	text("average fitness:       " + nf(population.getAverageFitness(), 0, 2), 20, show.height +180);
	text("total population:      " + popmax, 20, show.height +200);
	text("mutation rate:         " + (mutationRate * 100) + "%", 20, show.height +220);
}

void rgb2grey(PImage img){
	
	img.loadPixels();

	for(int i = 0; i < img.pixels.length; i++){
	
		color c = img.pixels[i];
		
		float r = red(c);
		float g = green(c);
		float b = blue(c);

		color c2 = color(0.299 * r + 0.587 * g + 0.114 * b);
			
		img.pixels[i] = c2;
	  }

  img.loadPixels();
}

void copyImg(PImage answer){
  
  show = createImage(answer.width, answer.height, RGB);
  
  answer.loadPixels();
  show.loadPixels();
  
  for(int i = 0; i < answer.pixels.length; i++)
    show.pixels[i] = answer.pixels[i];
  
  show.updatePixels();
  answer.updatePixels();
}
