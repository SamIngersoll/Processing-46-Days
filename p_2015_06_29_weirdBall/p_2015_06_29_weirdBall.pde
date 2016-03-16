import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
int numPoints = 5000;
float lR_ = 200;
float bR_ = 400;
ArrayList<PT> points;

void setup()  {
  size( 800, 800, P3D );
  background( 255 );
  strokeWeight(3);
  cam = new PeasyCam( this, 420 );
  points = new ArrayList<PT>();
  float theta = TWO_PI/numPoints;
  for ( int i=0 ; i<numPoints ; i++ )  {
    points.add( new PT( theta*i, theta*i ) );
  }
}
void draw()  {
  background( 255 );
  for ( int i=0 ; i<points.size() ; i++ )  {
    points.get(i).draw();
    points.get(i).rotate();
  }
}

void keyPressed()  {
 if ( key == 's' )  {
  saveFrame( "weirdBall_###.png" );
 } 
}
