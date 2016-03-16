import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

float incrementY = 2;
float incrementTheta = TWO_PI/100;
float radius = 100;
PT p1, p2;
float counter = 0;

PeasyCam cam;
void setup()  {
  size( 800, 800, P3D );
  background( 255 );
  cam = new PeasyCam( this, 800 );
  p1 = new PT( radius, PI, -height/1.5 );
  p2 = new PT( radius, 0, -height/1.5 );
}
void draw()  {
  strokeWeight( 10 );
  if ( counter % 10 > 6 )
    stroke( 255, 0, 0 );
  if ( counter % 10 < 6 && counter % 10 > 3 )
    stroke( 0, 255, 0 );
  if ( counter % 10 < 3 )
    stroke( 0, 0, 255 );
  p1.draw();
  p2.draw();
  p1.rotate();
  p2.rotate();
  counter+=1;
  strokeWeight( 1 );
  if ( counter%10==0 )  {
    line( p1.x, p1.y, p1.z,
          p2.x, p2.y, p2.z ); 
  } 
}

void keyPressed()  {
 if ( key == 's' )  {
  saveFrame( "doubleHelix_###.png" );
 } 
}
