
class PT  {
 PVector p_, v_, a_;
 PT( float x, float y )  {
  p_ = new PVector( x, y );
 } 
 void draw()  {
  point( p_.x, p_.y ); 
 }
 void move()  {
   this.p_.x += random(-30,30);
   this.p_.y += random(-30,30);
 }
}
