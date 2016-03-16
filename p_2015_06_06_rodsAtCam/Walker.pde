
class Walker  {
 float x, y, z, r;  // Position and radius
 PVector direction;  // Direction 
 Walker()  {
  this.x = 0;
  this.y = 0;
  this.z = 0;
  this.r = random( 10, 20 );
  direction = new PVector( random(-0.5,0.5), random(-0.5,0.5), random(-5,5) );
 } 
 
 void draw()  {  // Draws walker
  pushMatrix();
  translate( this.x, this.y, this.z );
  ellipse( 0, 0, this.r, this.r ); 
  popMatrix();
 }
 void move()  {  // Moves walker
   this.x += direction.x;
   this.y += direction.y;
   this.z += direction.z;
 }
}
