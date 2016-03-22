import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

Circle[] circles = new Circle[20];
PeasyCam cam;

void setup()  {
  size( 800, 800, P3D );
  background( 255 );
  cam = new PeasyCam( this, 800 );
  for ( int i=0 ; i<circles.length/2 ; i++ )  {
   circles[i] = new Circle( 0, -400+40*i, 0, 100, true ); 
  }
  for ( int i=circles.length/2 ; i<circles.length ; i++ )  {
   circles[i] = new Circle( 0, 500-40*i, 0, 100, false ); 
  }
}
void draw()  {
  background( 255 );
  noStroke();
  fill( 255, 0, 0, 20);
  for ( int i=0 ; i<circles.length ; i++ )  {
   circles[i].draw();
   circles[i].move(); 
  }
  saveFrame( "redLenses_gif_###.png" ); 
}

void keyPressed()  {
  if ( key == 's' )  {
    saveFrame( "redLenses_###.png" );  
  } 
}