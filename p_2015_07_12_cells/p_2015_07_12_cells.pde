//int numPts = (int)random(40);
int numPts = 10;
PT[] pts = new PT[numPts];
ArrayList<TRI> TRIs = new ArrayList<TRI>();

void setup()  {
  size( 800, 800, P3D );
  background( 255 );
  strokeWeight( 1 );
  noFill();
  for ( int i=0 ; i<pts.length ; i++ )  {
    pts[i] = new PT( random(width), random(height) ); 
  }
}
void draw()  {
  background(255);
  triangulate();
  
  for ( int i=0 ; i<pts.length ; i++ )  {
    strokeWeight( 4 );
    pts[i].move();
//    pts[i].draw(); 
    strokeWeight( 1 );
  }
  saveFrame( "textParticles_###.png" ); 
}

void triangulate()  {
 TRI tester;
 for( int i=0 ; i<pts.length ; i++ )  { outerloop:
  for( int j=0 ; j<pts.length ; j++ )  {
   for( int k=0 ; k<pts.length ; k++ )  {
    if ( i!=j && i!=k && j!=k ) {
      tester = new TRI( pts[i], pts[j], pts[k] );
      if ( tester.test() )  {
        tester.drawCell(); 
//        tester.draw();
        TRIs.add(tester);
      }
    }
   } 
  }
 } 
}

void mousePressed()  {
 setup(); 
}