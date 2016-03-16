
class Walker  {
 float x, y, z, r;
 PVector direction;
 Walker()  {
  this.x = 0;
  this.y = 0;
  this.z = 0;
  this.r = random( 10, 20 );
  float bound = 1;
  direction = new PVector( random(-bound, bound), random(-bound, bound), random(-bound, bound) );
  } 
  Walker( float x, float y, float z, PVector direction)  {
  this.x = x;
  this.y = y;
  this.z = z;
  this.r = random( 10, 20 );
  float bound = 0.1;
  this.direction = direction;
 } 
 
 void draw()  {
  pushMatrix();
  translate( this.x, this.y, this.z );
  sphere( this.r ); 
  popMatrix();
 }
 void move()  {
   this.x += direction.x;
   this.y += direction.y;
   this.z += direction.z;

 }
 void divide()  {
   float bound = random(0.00005);
   float x_ = random(-bound, bound);
   float y_ = random(-bound, bound);
   float z_ = random(-bound, bound);
   this.direction = direction.cross( new PVector( this.direction.x+x_, this.direction.y+y_, this.direction.z+z_ ) );
   this.direction.normalize();
 }
}
