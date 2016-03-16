

class Point   {
 float x, y,  // X and Y center 
       xVel, yVel;  // X and Y velocity
 Point( float x, float y, float xVel, float yVel )  {
  this.x = x;
  this.y = y;
  this.xVel = xVel;
  this.yVel = yVel;
 } 
 void draw()  {  // Draws the point
  strokeWeight( 10 );
  stroke( 255, 0, 0 );
  point( x, y ); 
  strokeWeight( 1 );
 }
 void move()  {  // Adds the velocity to the position, moving the point
  this.x += xVel;
  this.y += yVel ;
 }
 void checkWalls()  {  // Checks for collisions with the walls
  if ( this.y > height )
    this.yVel = -1 * abs( this.yVel );
  if ( this.y < 0 )
     this.yVel = abs( this.yVel );
  if ( this.x > width )
       this.xVel = -1 * abs( this.xVel );
  if ( this.x < 0 ) 
       this.xVel = abs( this.xVel );
 }
}
