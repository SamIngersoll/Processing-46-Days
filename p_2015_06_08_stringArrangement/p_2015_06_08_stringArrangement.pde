// SAM INGERSOLL //
  // Press any key to save the current frame

ArrayList<Point> points = new ArrayList<Point>();     // Total list of points
ArrayList<Circle> circles = new ArrayList<Circle>();  // List of circles
int[] radii = {50, 100, 150, 200, 400, 800 };         // List of radii of the circles **(must have same length as below)**
int[] dotsPerCircle = {20, 10, 300, 50, 200, 200};    // List of dots for each of the circles **(must have same length as above)**

void setup()  {
  size( 1200, 800 );
  background( 255 );

  for ( int i = 0 ; i < radii.length ; i++ )  {            // Iterates over radii array to create circles
    for ( int j = 0 ; j < dotsPerCircle[i] ; j++ )  {      // Iterates over dotsPerCircle for each circle 
        points.add( j, new Point( width/2 + radii[i] * cos( 2*PI/dotsPerCircle[i] * j ),  //  fills global points array
                             height/2 + radii[i] * sin( 2*PI/dotsPerCircle[i] * j ) ) );  //  Points are assigned positions radially around center
    }
    circles.add( new Circle( points, dotsPerCircle[i] ) );  // Creates new circle with global points array  
  }
}

void draw()  {
  background( 255 );
  // Iterates over circles
  for ( int i = 0 ; i < radii.length ; i++ )  {  
      circles.get(i).draw();  // Tells each circle to draw itself
      
  }
}

void keyPressed()  {  // Press any key to save the current frame as a .png
 saveFrame( "stringArrangement_###.png"); 
}
