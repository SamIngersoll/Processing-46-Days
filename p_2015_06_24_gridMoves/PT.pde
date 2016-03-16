
class PT  {
  PVector p_;
  PT( float x, float y )  {
    p_ = new PVector( x, y );
  }
  void draw()  {
   point( p_.x, p_.y );  
  }
  void move( float x_, float y_ )  {
   this.p_.x+=x_;
   this.p_.y+=y_;
  
  }
}

