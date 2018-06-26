// Akash Yadav
// @Hudson Lane, Delhi
// 26th June 18

// http://natureofcode.com

// Genetic Algorithm, Evolving Shakespeare

// A class to describe a psuedo-DNA, i.e. genotype
//   Here, a virtual organism's DNA is an array of character.
//   Functionality:
//      -- convert DNA into a string
//      -- calculate DNA's "fitness"
//      -- mate DNA with another set of DNA
//      -- mutate DNA


class DNA {

	// The genetic sequence
	PImage genes;
	
	float fitness;
	
	// Constructor (makes a random DNA)
	DNA(PImage roleModel) {

		//rolemodel is needed just for dimention
		genes = createImage(roleModel.width, roleModel.height, RGB);

		genes.loadPixels();

		for(int i = 0; i < genes.pixels.length; i++){
			float clr = (int)random(256)%256;
			genes.pixels[i] = color(clr, clr, clr);
		}

		genes.updatePixels();
	}
	
	// Returns genes image 
	PImage getImage() {
		return genes;
	}
	
	// Fitness function (returns floating point % of "correct" characters)
	void fitness (PImage target) {

		 int score = 0;

		 genes.loadPixels();
		 target.loadPixels();

		 for (int i = 0; i < genes.pixels.length; i++)
				if (genes.pixels[i] == target.pixels[i])
					score++;

		 fitness = (float)score / (float)target.pixels.length;

		 genes.updatePixels();
		 target.updatePixels();
	}
	
	// Crossover
	DNA crossover(DNA partner) {
		// A new child
		DNA child = new DNA(this.genes);
		
		int midpoint = int(random(genes.pixels.length)); // Pick a midpoint
		
		this.genes.loadPixels();
		child.genes.loadPixels();
		partner.genes.loadPixels();

		// Half from one, half from the other
		for (int i = 0; i < genes.pixels.length; i++) {
			if (i > midpoint) child.genes.pixels[i] = this.genes.pixels[i];
			else              child.genes.pixels[i] = partner.genes.pixels[i];
		}

		this.genes.updatePixels();
		child.genes.updatePixels();
		partner.genes.updatePixels();
		return child;
	}
	
	// Based on a mutation probability, picks a new random character
	void mutate(float mutationRate) {

		this.genes.loadPixels();
		
		for (int i = 0; i < genes.pixels.length; i++)
			if (random(1) < mutationRate){
				float clr = (int)random(256)%256;
				genes.pixels[i] = color(clr, clr, clr);
			} 
		
		this.genes.updatePixels();
	}

}
