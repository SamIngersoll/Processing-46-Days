
class Pin  {
  PVector p_;
  float r;
  Pin( float x, float y, float r )  {
    this.p_ = new PVector( x, y );
    this.r = r;
  }
  void draw()  {
   fill( 200 );
   ellipse( p_.x, p_.y, r, r ); 
  }
}
