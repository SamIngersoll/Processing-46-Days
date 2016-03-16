

class Point  {  
 float x, y, velX, velY;  // Position and velocity in x and y directions
 ArrayList<Integer> connectedTo;  // List of points this point is connected to
 Point(int i)  {
  this.x = random( width );  // Random x position
  this.y = random( height );   // Random y position
  this.velX = random( -1, 1 );  // Random x velocity
  this.velY = random( -1, 1 );  // Random y velocity
  this.connectedTo = new ArrayList<Integer>();
 }
 Point( float x, float y )  {
  this.x = x;
  this.y = y; 
 }
 void draw()  {  // Draws the point
  strokeWeight( 6 );
  stroke( 255, 0, 0 );
  fill( 0 );
  point( x, y );
 }
 void move()  {  // Moves the point
  this.x += velX;
  this.y += velY; 
 }
 void checkWalls()    {  // Checks if the point has collided with a wall
  if ( this.x > width )
   this.velX *= -1;
  if ( this.x < 0 )
   this.velX *= -1;
  if ( this.y > height )
   this.velY *= -1;
  if ( this.y < 0 )
   this.velY *= -1; 
 }
  
}
