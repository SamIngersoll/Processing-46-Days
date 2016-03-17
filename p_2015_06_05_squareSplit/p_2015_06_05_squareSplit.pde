//  SAM INGERSOLL  //

ArrayList squares = new ArrayList<Square>();  // List of squares
Square s;  // Current square
Point p;  // Bouncing ball
int squaresLength = 40;  // Length square
int squaresWidth = 40;  // Width square
float alphaIncrementVal = 0.5;  // How fast the color of the squares returns

void setup()  {
  size( 800, 800 );
  background( 255 );
  rectMode( CENTER );
  p = new Point( random(width), random(height), random(2,3), random(2,3) );  // Creates the ball
  for ( int j = 0 ; j < squaresLength ; j++ )  {  // Iterates over squares
    for ( int i = 0 ; i < squaresWidth ; i++ ) {  // Iterates over squares
      squares.add( new Square( (j+1)*width/squaresLength,  // Creates the squares
                  (i+1)*height/squaresWidth, random(5, 70) ) );
    }
  }
}
int counter;  // Creates a counter
void draw()  {
  counter = 0;  // Resets the counter
  background( 255 );
  for ( int j = 0 ; j < squaresLength ; j++ )  {  // Iterates over squares
    for ( int i = 0 ; i < squaresWidth ; i++ )  {  // Iterates over squares
      s = (Square)squares.get(counter);  // Gets the current square
      s.checkPoint( p );  // Checks whether it was hit by the point
      s.draw();  // Draws the squares
      counter++;  // Increments the counter
    }
  }
  p.move();  // Moves the ball
  p.checkWalls();  // Checks if we need to collide with the walls
  p.draw();  // Draws the ball
}