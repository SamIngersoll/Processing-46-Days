// SAM INGERSOLL //

ArrayList<Body> bodies;  // List of circles
int numBodies = 6000;  // Number of circles

void setup()  {
  size( 800, 800 );
  background( 255 );
  ellipseMode( CENTER );
  fill( 0 );
  strokeWeight( 10 );
  bodies = new ArrayList<Body>();
  for ( int i = 0 ; i < numBodies ; i++ )  {  // Creates a circle for each circle
   bodies.add( new Body( random(height), random(width) ) ); 
  }
}

void draw()  {
  background( 255 );
  for ( int i = 0 ; i < bodies.size() ; i++ )  {  // Iterate through the bodies and update them
   bodies.get( i ).draw(); 
   bodies.get( i ).attract( bodies );
   bodies.get( i ).move(); 
  }
}