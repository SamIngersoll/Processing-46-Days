float r = 300;
PVector p;
int numLines = 200;
float x = 0;
float counter = 0;
void setup()  {
 size( 800, 800 );
 background( 255 ); 
 p = new PVector( 0, 0 );
}
void draw()  {
 background( 255 );
 translate( width/2, height/2 );
 for ( int i=0 ; i<numLines ; i++ )  {
   strokeWeight( 4*noise( counter+(i*.05) ) );
   x = -(r) + i*(r/numLines*2);
   line( x, -sqrt( sq(r)-sq(x)), x, sqrt( sq(r)-sq(x)));
 }
 counter+=.05;
}
