// Akash Yadav
// @Hudson Lane, New Delhi
// Candy Dream

class DNA {

	// genes of this DNA have an image and its fitness
	PImage genes;
	int fitness; //no of pixels which match with the target

	// Constructor (makes a random DNA)
	DNA(PImage roleModel) {

		//make an image with dimenstions of roleModel
		genes = createImage(roleModel.width, roleModel.height, RGB);

		loadPixels();
		this.genes.loadPixels();

		//fill the pixels matrix of genes image with random values
		for(int i = 0; i < (int)genes.pixels.length; i++)
			this.genes.pixels[i] = color(random(255));

		this.genes.updatePixels();
		updatePixels();
	}

	// return Image of this DNA
	PImage getImage() {
		return this.genes;
	}

	// Fitness function (counts no. of pixels which match with the target)
	void fitness (PImage target) {

		int matches = 0;
		
		//traverse through pixels array of both images and
		//increase matches if the pixels have equal brightness
		for (int i = 0; i < (int)this.genes.pixels.length; i++){

			float expected = brightness(this.genes.pixels[i]);
			float actual = brightness(target.pixels[i]);

			if(expected == actual)
				matches++;
		}
	}

	// Crossover
	DNA crossover(DNA partner) {
		// A new child
		DNA child = new DNA(genes);
		
		//take half genes from one parent and half from other parent
		for(int i = 0; i < (int)this.genes.pixels.length; i++){
			if(i < (int)this.genes.pixels.length/2)
				child.genes.pixels[i] = this.genes.pixels[i];
			else
				child.genes.pixels[i] = partner.genes.pixels[i]; 
		}

		return child;
	}

	// Based on a mutation probability, picks a new random character
	void mutate(float mutationRate) {
		for (int i = 0; i < (int)this.genes.pixels.length; i++)
			if (random(1) < mutationRate) 
				genes.pixels[i] = color(random(256));
	}
	
}//DNA class ended
