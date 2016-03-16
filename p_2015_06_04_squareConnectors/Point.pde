
class Point  {  // Point class, for exploding objects
 float x, y;  // X and Y position of points
 float radius = random( 5 );  // Size of point
 color skinColor;  // Color of point
 float alpha, theta;  // Where the point is
 float velocityX, velocityY;  // Velocity of the point
 Point( color skinColor, float theta, float x, float y,
        float velocityX, float velocityY ) {
   this.skinColor = skinColor;
   this.theta = theta;
   this.x = x + random( -50, 50 );
   this.y = y + random( -50, 50 );
   this.alpha = 255;
   this.velocityX = velocityX;
   this.velocityY = velocityY;
   
 }
 void draw()  {  // Draws the point
  fill( skinColor );  // Changes the fill
  rect( x, y, radius, radius );  //Draws the point
  noFill();
 }
 void move( int i )   {  // Moves the point
  this.x += velocityX;
  this.y += velocityY;
  if  ( i == 0 )
    this.x += random(5)*radius;
  if  ( i == 1 )
    this.x -= random(5)*radius;
  if  ( i == 2 )
    this.y += random(5)*radius;
  if  ( i == 3 )
    this.y -= random(5)*radius;
  this.skinColor = color( red(skinColor), green(skinColor), 
                          blue(skinColor), alpha);
  this.alpha -= random( 10 );
  if ( this.alpha < 0 )  {
    try { points.remove( i ); }
    catch ( IndexOutOfBoundsException e ){}
    
  }
 }
 void connect( Point point )  {  // Connects the points
  strokeWeight( 0.1 );
  stroke( this.skinColor );
  line( this.x, this.y, point.x, point.y ); 
 }
}
