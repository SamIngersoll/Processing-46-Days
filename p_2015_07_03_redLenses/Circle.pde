
class Circle  {
 float x, y, z, r;
 boolean up;
 Circle( float x, float y, float z, float r, boolean up )  {
  this.x = x;
  this.y = y;
  this.z = z;
  this.r = r;
  this.up = up;
 } 
 void draw()  {
  pushMatrix();
  translate( x, y, z );
  ellipse( 0, 0, r, r ); 
  popMatrix();
 }
 void move()  {
  if ( up )  {
   y+=1;
   if ( y > 0 )
     r--; 
   if ( y < 0 )
     r++;
  }  else  {
     y-=1;
   if ( y > 0 )
     r++; 
   if ( y < 0 )
     r--;
  }
  if ( y > 100 )  {
   up = false; 
  }  
  else if ( y < -100 )  {
    up = true;
  }
 }
}
