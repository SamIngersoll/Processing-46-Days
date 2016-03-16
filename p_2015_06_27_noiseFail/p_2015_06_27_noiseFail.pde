int num_ = 100;
PT[] pts = new PT[ num_ ];
float counter;

void setup()  {
  size( 800, 800 );
  background( 255, 255, 0 );
  noStroke();
  fill( 20, 255, 100 );
  rect( width/10, height/10, width*.8, height*.8 );
  for ( int i=0 ; i<pts.length ; i++ )  {
    pts[i] = new PT( random(width), random(height) );
  }
}
void draw()  {
  for ( int i=0 ; i<pts.length ; i++ )  {
    pts[i].update();
    pts[i].draw();
  }
  counter += 0.1;
}
