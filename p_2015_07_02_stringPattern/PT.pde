
class PT  {
 PVector p_, v_, a_;
 float x, y, z, theta, r;
 PT(  float r, float theta, float y)  {
  this.theta = theta;
  this.r = r;
  this.y = y;
  this.x = r*cos(theta);
  this.z = r*sin(theta);
  this.p_ = new PVector( 20, y, z );
  this.v_ = new PVector(random(-30,30),random(-30,30),random(-30,30));
  this.a_ = new PVector(0,0,0);
 } 
 void draw()  {
   stroke( map(dist( 0,0,0,p_.x, p_.y, p_.z ), 0, 1000, 0, 255 ), 0, 0 );
   point( this.p_.x, this.p_.y, this.p_.z );
 }
 void rotate()  {
//  this.y+= incrementY;
//  this.theta+=incrementTheta;
//  float x_ = this.r*cos(this.theta);
//  float z_ = this.r*sin(this.theta);
//  line( this.x, this.y-incrementY, this.z,
//        x_, this.y, z_ );
//  this.x = x_;
//  this.z = z_;
  this.a_ = PVector.mult(p_, -1);
  PVector add = new PVector( 0, 10, 0 );
  a_.add(add);
  a_.normalize();
  
  this.v_.add(a_);
  this.p_.add(v_);
 }
}
