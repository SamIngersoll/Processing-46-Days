// SAM INGERSOLL //

import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;  // Declares camera
Pulse p;  // Declares pulse
Walker w;  // Declares walker

void setup() {
  size( 800, 800, P3D );
  background( 0 );
  ellipseMode( CENTER );
  cam = new PeasyCam( this, 500 ); 
  p = new Pulse();
  fill( 200, 200, 200 );
//  stroke( 0, 0, 0, 20 );
  noStroke();
}

void draw() {
  directionalLight(51, 102, 126, -1, 0, 0);
  p.draw();
  p.move();
}