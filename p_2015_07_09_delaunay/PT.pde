
class PT  {
 PVector p_, v_, a_;
 PT( float x, float y )  {
  p_ = new PVector( x, y );
 } 
 void draw()  {
  point( p_.x, p_.y ); 
 }
}
