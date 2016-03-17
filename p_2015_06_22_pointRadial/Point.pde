

class Point  {
 PVector position;
 boolean special;
 color str;
 Point( float x, float y, float z )  {
  special = false;
  position = new PVector( x, y, z );
  str = color( 255, 255, 255 );
 } 
}