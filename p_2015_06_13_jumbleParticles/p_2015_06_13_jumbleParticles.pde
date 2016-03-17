// Sam Ingersoll //
  // Press '1' to change color to white
  // Press '2' to change color to black 
  // Press 'r' to change color to red
  // Press 'g' to change color to green
  // Press 'b' to change color to blue
//
  // Press 'c' to clear current screen
  // Press 'y' for NO trails
  // Press 'n' for trails
//  
  // Press SPACEBAR to pause
  // Press SHIFT to resume
  // Press 's' to save the current frame

ArrayList<Particle> particles;
int numParticles = 2000;
float g = 1;
int sideWays = 0;
color stroke = color( 0, 0 , 0 );
color BGcolor = color( 255, 255, 255 );
boolean drawBG = false;

void setup()  {
  size( 800, 800 );
  background( BGcolor );
  particles = new ArrayList<Particle>();
  for ( int i = 0 ; i < numParticles ; i++ )  {
   particles.add( new Particle() ); 
  }
  noStroke();

}

void draw()  {
  if ( drawBG )
    background( BGcolor );
  for ( int i = 0 ; i < numParticles ; i++ )  {
   fill( stroke );
   particles.get( i ).move(); 
   particles.get( i ).draw(); 
  }
}

void mousePressed()  {
  if ( sideWays == 4 )
    sideWays = 0;
  else
    sideWays++;
}
void keyPressed()  {
 if ( key == '1' )
  stroke = color( 255, 255, 255 );
 if ( key == '2')
  stroke = color( 0, 0, 0 ); 
 if ( key == 'g' )
  stroke = color( 0, 255, 0 );
 if ( key == 'b' )
  stroke = color( 0, 0, 255 );
 if ( key == 'r' )
   stroke = color( 255, 0, 0 );
 if ( key == 'c' )
   background( BGcolor );
 if ( key == 'n' )
   drawBG = false;
 if ( key == 'y' )
   drawBG = true;
 if ( key == ' ' )
   noLoop();
 if ( keyCode == SHIFT )
   loop();
 if ( key == 's' )
   saveFrame( "jumbleParticles_###.png" );
}