ArrayList<Body> bodies;
int numBodies = 6000;

void setup()  {
  size( 800, 800 );
  background( 255 );
  ellipseMode( CENTER );
  fill( 0 );
  strokeWeight( 10 );
  bodies = new ArrayList<Body>();
  for ( int i = 0 ; i < numBodies ; i++ )  {
   bodies.add( new Body( random(height), random(width) ) ); 
  }
}

void draw()  {
  background( 255 );
  for ( int i = 0 ; i < bodies.size() ; i++ )  {
   bodies.get( i ).draw(); 
   bodies.get( i ).attract( bodies );
   bodies.get( i ).move(); 
  }
}
