int numPoints = 1000;
PT[] points = new PT[numPoints];

void setup()  {
 size(800,800);
 background(255); 
 strokeWeight( 5 );
 for( int i=-numPoints/2 ; i<numPoints/2 ; i++ )  {
    points[i+numPoints/2] = new PT(i/1.5, i);
  }
}
void draw()  {
  background( 255 );
  translate( width/2, height/2 );
  for ( int i=0 ; i<points.length ; i++ )  {
   points[i].theta+=0.01;
   points[i].draw(); 
  }
   //saveFrame( "textParticles_###.png" );
}