  // Akash Yadav
  // @Hudson Lane, New Delhi
  // Candy Dream

  class DNA {

    // The genetic sequence
    PImage genes;

    float fitness;

    // Constructor (makes a random DNA)
    DNA(PImage roleModel) {

      genes = createImage(roleModel.width, roleModel.height, RGB);

      loadPixels();

      for (int x = 0; x < (int)genes.width; x++){
        for (int y = 0; y < (int)genes.height; y++ ) {
          int loc = x + y * genes.width;
          genes.pixels[loc] = color(brightness((int)random(255)));
        }
      }

      updatePixels();
    }

    // Converts character array to a String
    PImage getImage() {
      return genes;
    }

    // Fitness function (returns floating point % of "correct" pixels)
    void fitness (PImage target) {
      int score = 0;
      
      for (int x = 0; x < (int)genes.width; x++){
        for (int y = 0; y < (int)genes.height; y++ ) {
          int loc = x + y * genes.width;

          if(brightness(genes.pixels[loc]) == brightness(target.pixels[loc]))
            score++;
        }
      }

      fitness = (float)score / (float)(target.pixels.length);
    }

    // Crossover
    DNA crossover(DNA partner) {
      // A new child
      DNA child = new DNA(genes);
      
      for(int i = 0; i < (int)this.genes.pixels.length; i++){
      
        if(i < (int)this.genes.pixels.length/2)
          child.genes.pixels[i] = this.genes.pixels[i];
        else
          child.genes.pixels[i] = partner.genes.pixels[i]; 
      }

      //for (int x = 0; x < (int)genes.width; x++){
      //  for (int y = 0; y < (int)genes.height; y++ ) {

      //    int loc = x + y * genes.width;
          
      //    if((int)random(10000000)%2 == 0)
      //      child.genes.pixels[loc] = this.genes.pixels[loc];
      //    else
      //      child.genes.pixels[loc] = partner.genes.pixels[loc];
      //  }
      //}

      return child;
    }

    // Based on a mutation probability, picks a new random character
    void mutate(float mutationRate) {

      for (int x = 0; x < (int)genes.width; x++){
        for (int y = 0; y < (int)genes.height; y++ ) {

          int loc = x + y * genes.width;

          if (random(1) < mutationRate) 
            genes.pixels[loc] = color(brightness((int)random(255)));
        }
      }
    }
    
  }//DNA class ended
