
class Spinner  {
 float radius, strokeWeight,
       rotx_, roty_, rotz_, 
       rotx, roty, rotz;
 PVector p_;
 color stroke;
 Spinner()  {
  strokeWeight = random(0, 0.5);
  rotx = random( TWO_PI );
  roty = random( TWO_PI );
  rotz = random( TWO_PI );
  rotx_ = random( PI/200 );
  roty_ = random( PI/200 );
  rotz_ = random( PI/200 );
  radius = random( 100, 500 );
  p_ = new PVector( width/2, 0, height/2 );
  stroke = color( 255, map(radius,100,500,255,0) , map(radius,100,500,0,255) );
 }
 void draw()  {
  stroke( stroke );
  strokeWeight( strokeWeight );
  pushMatrix();
  rotateX( rotz );
  rotateY( roty );
  rotateZ( rotz );
  translate( 0, 0, 0 );
  ellipse( 0, 0, radius, radius );
  popMatrix();
  rotx += rotx_;
  roty += roty_;
  rotz += rotz_;
 } 
}
