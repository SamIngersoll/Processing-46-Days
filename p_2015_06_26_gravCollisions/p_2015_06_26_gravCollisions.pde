Attractor a;
ArrayList<PT> pts = new ArrayList<PT>();
PImage bg;

void setup()  {
 size( 800, 800, P3D ); 
 noStroke();
 bg = loadImage( "bg.png" );  // Loads background
 for ( int i=0 ; i<10 ; i++ )  {  // Populates list with points
  pts.add( new PT( random(width), random(height) ) ); 
 }
 a = new Attractor( width/2, height/2 );
}
void draw()  {
  background( bg );
  a.update();
  a.draw();
  for ( int i=0 ; i<pts.size() ; i++ )  {  // Iterates through points and updates them
   pts.get(i).draw(); 
   PVector force = a.force( pts.get(i) );
   pts.get(i).applyForce(force);
   pts.get(i).update();
   pts.get(i).checkCollision(a);
   for ( int j=0 ; j<pts.size() ; j++ )  {
     if ( i != j )  // Checks for collisions
     pts.get(i).checkCollision(pts.get(j) );
   }
  }
}