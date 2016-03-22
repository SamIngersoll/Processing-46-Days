import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

float incrementY = 2;  // Increments y value
float incrementTheta = TWO_PI/100;  // Increments theta
float radius = 100;  // Radius
PT p1, p2;
float counter = 0;  // Counter

PeasyCam cam;
void setup()  {
  size( 800, 800, P3D );
  background( 255 );
  cam = new PeasyCam( this, 1600 );
  p1 = new PT( radius, PI, -height/1.5 );
  p2 = new PT( radius, 0, -height/1.5 );
}
void draw()  {
  strokeWeight( 1 );
  for ( int i=0 ; i<20 ; i++ )  {
    p1.draw();
    p2.draw();
    p1.rotate();
    p2.rotate();
  }
  counter+=1;
  strokeWeight( 0.2 );
    line( p1.p_.x, p1.p_.y, p1.p_.z,  // Connects points
          p2.p_.x, p2.p_.y, p2.p_.z ); 
}

void keyPressed()  {
 if ( key == 's' )  {
  saveFrame( "doubleHelix_###.png" );
 } 
}