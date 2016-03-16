
class PT  {
 PVector p_, v_, a_;
 float co_;
 PT( float x, float y )  {
  p_ = new PVector( x, y );
  v_ = new PVector();
  a_ = new PVector();
  co_ = random( 1 );
 } 
 void draw()  {
  stroke( 255, 100, 200 );
  strokeWeight( map(noise(p_.x, p_.y), 0, 1, 0, 5 ) );
  point( p_.x, p_.y ) ;
 }
 void update()  {
//  a_ = new PVector( noise(p_.x+counter), noise(p_.y+counter) );
  a_  = (new PVector( 20*(noise(p_.x+counter)-co_), 20*(noise(p_.y+counter)-co_) ));
//  a_.normalize();
//  a_.mult(20);
  v_.add( a_ );
  p_.add( v_ );
    v_.normalize();
 }
}
