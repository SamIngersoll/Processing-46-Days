

class Square  {
 float x, y, r;
 float alpha;  // Color 
 Square( float x, float y, float r ) {
   this.x = x;
   this.y = y;
   this.r = r;
   alpha = 255;
 }
 void draw()  {  // Draw
  noStroke();
  fill( alpha, 0, 0 );
  rect( this.x, this.y, this.r, this.r );
  incrementAlpha();
 }
 void checkPoint( Point P )  {  // Checks if the point has hit the square
  if ( p.x < this.x + this.r 
       && p.x > this.x - this.r
       && p.y < this.y + this.r
       && p.y > this.y - this.r )
       alpha = 0;
 }
 void incrementAlpha()  {  // Changes the alpha value, returning the square to its previous color
  if ( this.alpha < 255 )
   this.alpha += alphaIncrementVal;
 }
}
