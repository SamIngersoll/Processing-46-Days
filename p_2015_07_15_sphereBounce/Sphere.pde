
class Sphere  {
 PVector p_, v_;
 int sphereDet;
 float r;
 Sphere( float x, float y, float z, int d, float r )  {
  this.p_ = new PVector( x, y, z );
  this.v_ = new PVector( random(-2,2), random(-2,2), 0 );
  this.sphereDet = d;
  this.r = r;
 } 
 void draw()  {
  pushMatrix();
  sphereDetail( sphereDet );
  fill( 0, map( this.p_.z, 0, offset*30, 0, 255 ), map( this.p_.z, 0, offset*30, 255, 0 ) );
  translate( p_.x, p_.y, p_.z );
  sphere( r );
  popMatrix();
 }
 void move()  {
//  sphereDet = (int)(15*noise( p_.x, p_.y ));
  this.p_.add(v_);
 }
 void collide()  {
  if ( this.p_.x > width )  {
   this.v_.x = -1*abs(this.v_.x);
  } 
  if ( this.p_.x < 0 )  {
   this.v_.x = abs(this.v_.x);
  }
  if ( this.p_.y > height )  {
   this.v_.y = -1*abs(this.v_.y);
  } 
  if ( this.p_.y < 0 )  {
   this.v_.y = abs(this.v_.y);
  }
 }
}
