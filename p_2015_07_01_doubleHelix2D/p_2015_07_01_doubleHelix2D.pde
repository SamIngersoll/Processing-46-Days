import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

float incrementY = 2;  // Y increment for growth
float incrementTheta = TWO_PI/100;  // Theta increment for growth
float radius = 100;  // Radius of helix
PT p1, p2;  // One point for each helix
float counter = 0;  // To determine color and rotation

PeasyCam cam;  // Camera
void setup()  {
  size( 800, 800, P3D );
  background( 255 );
  cam = new PeasyCam( this, 800 );
  p1 = new PT( radius, PI, -height/1.5 );
  p2 = new PT( radius, 0, -height/1.5 );
}
void draw()  {
  strokeWeight( 10 );
  if ( counter % 10 > 6 )  // Change the colors based on what counter is
    stroke( 255, 0, 0 );
  if ( counter % 10 < 6 && counter % 10 > 3 )
    stroke( 0, 255, 0 );
  if ( counter % 10 < 3 )
    stroke( 0, 0, 255 );
  p1.draw();  // Draw each point
  p2.draw();
  p1.rotate();  // Rotate each point
  p2.rotate();
  counter+=1;  // Increment counter
  strokeWeight( 1 );
  if ( counter%10==0 )  {  // Every 10, draw a line connecting the points
    line( p1.x, p1.y, p1.z,
          p2.x, p2.y, p2.z ); 
  } 
}

void keyPressed()  {
 if ( key == 's' )  {
  saveFrame( "doubleHelix_###.png" );
 } 
}