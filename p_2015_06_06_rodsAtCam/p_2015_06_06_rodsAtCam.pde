// SAM INGERSOLL //

import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;  // Declares the PeasyCam
Pulse p;  // Declares the pulse

void setup()  {
  size( 800, 800, P3D );
  background( 255 );
  ellipseMode( CENTER );
  cam = new PeasyCam( this, 500 );  // Creates the PeasyCam
  p = new Pulse();  // Creates the pulse
}

void draw()  {
  p.draw();  // Draws pulse
  p.move();  // Moves the pulse
}