//  SAM INGERSOLL //

Colosseum c;  // Declare object

void setup()  {
  size(800,800,P3D);  // 3D Renderer
  background( 255 );
  c = new Colosseum( width/2, height/2, 0, 100, 10, 10, 30 );  // Initialize object
}

void draw()  {
  background( 255 );
  camera( 200, mouseY-height/2, 0, 0,0,0,0,1,0 );  // Changes camera position
  c.draw();  // Draws object
}