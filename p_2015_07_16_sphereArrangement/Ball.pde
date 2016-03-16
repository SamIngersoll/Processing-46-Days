

class Ball    {
 float glow;
 PVector p_;
 Ball( float x, float y, float z )  {
  p_ = new PVector( x, y, z );
 } 
 void draw()  {
  pushMatrix();
  fill( 100, map( p_.z, -20, 20, 255, 0 ), map( p_.z, -20, 20, 0, 255 ) );
  translate( p_.x, p_.y, p_.z );
  sphere( 5 );
  popMatrix(); 
  stroke( 100, map( p_.z, -20, 20, 255, 0 ), map( p_.z, -20, 20, 0, 255 ) );
//  stroke( 255, 255, 0 );
  line( p_.x, p_.y, p_.z, p_.x, p_.y, 0 );
  noStroke();
 }
 void move()  {
   this.p_.z += 1-2*noise( p_.x+counter, p_.y );
 }
}
