
class Attractor  {
 PVector p_;
 float g, m;
 Attractor( float x, float y )  {
  p_ = new PVector( x, y );
  g = 0.4;
  m = 20;
 } 
 void draw()  {
  strokeWeight( 8 );
  point( this.p_.x, this.p_.y ); 
 }
 void update()  {
  this.p_.x = mouseX;
  this.p_.y = mouseY;
 }
 PVector force( PT pt )  {  // Calculates forces
   PVector force = PVector.sub( p_, pt.p_ );
   float distance = force.mag();
   distance = constrain(distance,5.0,25.0);
   force.normalize();
   float strength = (g * m * pt.m) / (distance * distance);
   force.mult(strength);
   return force;
 }
}