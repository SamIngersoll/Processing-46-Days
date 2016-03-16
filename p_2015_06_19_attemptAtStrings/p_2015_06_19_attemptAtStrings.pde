Rope r;
Rope r1;
ArrayList<Knot> knots;
ArrayList<Integer> anchored;
int numKnots = 15;
PVector gravity;
PVector wind;

void setup()  {
  size( 800, 800 );
  stroke( 255, 255, 255 );
  gravity = new PVector( 0, .16 );
  wind = new PVector( 0, 0 );
  knots = new ArrayList<Knot>();
  anchored = new ArrayList<Integer>();
  float change = random(-15,15);
  for( int i = 0 ; i < numKnots ; i++ )  {
   if ( i == 0 )  {
    knots.add( new Knot( width/2+change*i, 10*i, 10, true ) ); 
   } else {
    knots.add( new Knot( width/2+change*i, 10*i, 10, false ) ); 
   }
  }
  r = new Rope( knots );
}
void draw()  {
  background( 0,0,0 );
  r.draw();
  r.move();
  wind.mult(0);
}
void keyPressed()  {
 if ( keyCode == UP )
   wind.add( new PVector( random(-0.01, 0.01), -0.1 ) ); 
 if ( keyCode == DOWN )
   wind.add( new PVector( random(-0.01, 0.01), 0.1 ) ); 
 if ( keyCode == RIGHT )
   wind.add( new PVector( 0.1, 0 ) ); 
 if ( keyCode == LEFT )
   wind.add( new PVector( -0.1, 0 ) ); 
}

void mousePressed()  {
 setup(); 
}
