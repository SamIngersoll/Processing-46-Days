

class Point  {
 float x, y, z;
 Point( float x, float y, float z )  {
  this.x = x;
  this.y = y;
  this.z = z;
 }
 void draw()  {
//  for ( int i = 0 ; i < 10 ; i++ )  {
//    strokeWeight( (i+2)*5 );
//    stroke( 0, 0, 0, (10-i)*255/10);
    point( this.x, this.y, this.z );
//  }
 }
}
