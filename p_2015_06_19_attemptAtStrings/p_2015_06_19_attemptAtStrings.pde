// SAM INGERSOLL //
// Use the arrow keys to change the direction fo the wind


Rope r;  // Rope object
ArrayList<Knot> knots;  // Knots in rope object
ArrayList<Integer> anchored;  // Which knots are anchored
int numKnots = 15;  // Number of knots
PVector gravity;  // Gravity vector
PVector wind;  // Wind vector

void setup()  {
  size( 800, 800 );
  stroke( 255, 255, 255 );
  gravity = new PVector( 0, .16 );
  wind = new PVector( 0, 0 );
  knots = new ArrayList<Knot>();
  anchored = new ArrayList<Integer>();
  float change = random(-15,15);
  for( int i = 0 ; i < numKnots ; i++ )  {  // Creates knots
   if ( i == 0 )  {
    knots.add( new Knot( width/2+change*i, 10*i, 10, true ) ); 
   } else {
    knots.add( new Knot( width/2+change*i, 10*i, 10, false ) ); 
   }
  }
  r = new Rope( knots );  // New rope from knots
}
void draw()  {
  background( 0,0,0 );
  r.draw();  // Draw the rope
  r.move();  // Move the rope
  wind.mult(0);  // Reset wind
}
void keyPressed()  {  // Change wind based on keys
 if ( keyCode == UP )
   wind.add( new PVector( random(-0.01, 0.01), -0.1 ) ); 
 if ( keyCode == DOWN )
   wind.add( new PVector( random(-0.01, 0.01), 0.1 ) ); 
 if ( keyCode == RIGHT )
   wind.add( new PVector( 0.1, 0 ) ); 
 if ( keyCode == LEFT )
   wind.add( new PVector( -0.1, 0 ) ); 
}

void mousePressed()  {  // Restart the scene if the mouse is pressed
 setup(); 
}