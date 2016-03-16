
class PT  {
 PVector p_;
 float theta, phi;
 PT( float theta, float phi )  {
   this.theta = theta;
   this.phi = 40*phi;
//   p_ = new PVector( x, y, z );
 }
 void draw()  {
   pushMatrix();
//   translate( bR_*cos( theta ), 0, bR_*sin( theta ) );
   rotateX( cos( theta ) );
   rotateY( sin( theta ) );
   rotateZ( sin( theta ) );
   translate( lR_*cos( phi ), 0, lR_*sin( phi ) );
   point( 0, 0, 0 );
   popMatrix();
 }
 void rotate()  {
   this.phi-=0.005;
   this.theta += 0.01;
 }
}
