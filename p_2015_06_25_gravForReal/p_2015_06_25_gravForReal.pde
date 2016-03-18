Attractor a;
ArrayList<PT> pts = new ArrayList<PT>();

void setup()  {
 size( 800, 800, P3D ); 
 for ( int i=0 ; i<100 ; i++ )  {
  pts.add( new PT( random(width), random(height) ) ); 
 }
 a = new Attractor( width/2, height/2 );
}
void draw()  {
  background( 255 );
  a.update();
  a.draw();
  for ( int i=0 ; i<pts.size() ; i++ )  {
   pts.get(i).draw(); 
   PVector force = a.force( pts.get(i) );
   pts.get(i).applyForce(force);
   pts.get(i).update();
  }
  //saveFrame( "gravForReal_gif_###.png" );
}