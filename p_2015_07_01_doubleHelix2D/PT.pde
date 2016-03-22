
class PT  {
 float x, y, z, theta, r;
 PT(  float r, float theta, float y)  {
  this.theta = theta;
  this.r = r;
  this.y = y;
  this.x = r*cos(theta);
  this.z = r*sin(theta);
 } 
 void draw()  {
   point( this.x, this.y, this.z );
 }
 void rotate()  {  // Rotates by increment
  this.y+= incrementY;
  this.theta+=incrementTheta;
  float x_ = this.r*cos(this.theta);
  float z_ = this.r*sin(this.theta);
  line( this.x, this.y-incrementY, this.z,
        x_, this.y, z_ );
  this.x = x_;
  this.z = z_;
 }
}