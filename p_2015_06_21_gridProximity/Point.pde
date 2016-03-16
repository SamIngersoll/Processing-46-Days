

class Point  {
 PVector position;
 boolean special;
// color str;
 Point( float x, float y, float z )  {
  special = false;
  position = new PVector( x, y, z );
//  str = stroke;
 } 
 void draw()  {
  point( position.x, position.y, position.z); 
  if ( special )  {
    
  }
 }
}
