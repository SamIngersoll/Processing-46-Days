class Point
{
  float x, y, z;
  Point( float x, float y, float z )
  {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  void display()
  {
    strokeWeight( 4 );
    point( x, y, z );
  }
  void connect( Point grain )
  {
    strokeWeight( 1 );
    line( this.x, this.y, this.z, grain.x, grain.y, grain.z );
  }
}
