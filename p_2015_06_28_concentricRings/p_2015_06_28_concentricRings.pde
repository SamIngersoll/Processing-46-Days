import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

Spinner[] spinners = new Spinner[ 50 ];
PeasyCam cam;

void setup()  {
  size( 800, 800, P3D );
  noFill();
  for ( int i=0 ; i<spinners.length ; i++ )  {  // Populate array of spinners
    spinners[i] = new Spinner();
  }
  cam = new PeasyCam( this, 300 );  // Create camera
}

void draw()  {
  background( 255, 255, 255 );
  for ( int i=0 ; i<spinners.length ; i++ )  {  // Draw and update each spinner
    spinners[i].draw();
  }
  saveFrame( "concentricRings_gif_###.png" );
}