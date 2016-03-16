
// Points make up circles

class Point  {
  float x, y;  // X and y position of point
  Point( float x, float y )  {
    this.x = x;
    this.y = y;
  }
  void draw()  {
    noFill();
    stroke( 255, 0, 0 ); 
    strokeWeight( 2 );
   point( x, y );   // Draws the pont at the x, y coordinates
   ellipseMode( CENTER );
   strokeWeight( 0.001 );
//   ellipse( x, y, random(25), random( 25 ) );
  }
  void move()  {  // Moves the points randomly a very small amount
   x+=random(-1,1);
   y+=random(-1,1);
  }
}
