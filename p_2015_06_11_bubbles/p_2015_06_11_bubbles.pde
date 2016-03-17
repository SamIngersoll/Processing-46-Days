//  SAM INGERSOLL  //

ArrayList<Particle> particles = new ArrayList<Particle>();  // List of points
int numParticles = 500;  // Number of particles
int counter = 0;

void setup()  {
 size( 800, 800 );
 noiseDetail(2);
 background( 255 ); 
 for ( int i = 0 ; i < numParticles ; i++  )  {  // Iterates over number of particles, initializes particles
   particles.add( new Particle() ); 
 }
}
void draw()  {
  for ( int i = 0 ; i < particles.size() ; i++ )  {  // Iterates over particles
    fill( 255 );
   particles.get(i).draw();  // Draws particles
   particles.get(i).move();   // Moves particles
   strokeWeight( 4*noise(counter) );  // Adjusts strokeweight with noise
   counter++;
  }
//  fill( 0 );
  //textSize( 100 );  // Writes text
  //text( "bubbles", width/2-150, height/2 );
}
void keyPressed()  {  // Saves current frame
 saveFrame( "bubbles_###.png"); 
}