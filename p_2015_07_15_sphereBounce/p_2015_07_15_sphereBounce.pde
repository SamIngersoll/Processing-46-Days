import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
int numSpheres = 100;
int offset = 30;
Sphere[] spheres = new Sphere[numSpheres];

void setup()  {
  size( 800, 800, P3D );
//  cam = new PeasyCam( this, 400 );
  for ( int i=0 ; i<spheres.length ; i++ )  {
   spheres[i] = new Sphere( random( width ), random( height ), offset*i,
                           (int)random( 10 ), random( 100 ) );
  }
}
void draw()  {
  background(0);
  for ( int i=0 ; i<spheres.length ; i++ )  {
   spheres[i].collide(); 
   spheres[i].move();
   spheres[i].draw();
  }
}
