//  Sam Ingersoll  //
// Press any key to save the current frame

int tigerSize = 20;  // Number of objects at any point
ArrayList<Tiger> tigers = new ArrayList<Tiger>();  // List of objects
ArrayList<Point> points = new ArrayList<Point>();  // List of points
int counter = 0;  // Timer

void setup() {
  size( 1400, 800 );
  background( 0 );
  noFill();
  strokeWeight( 1 );
  for ( int i = 0 ; i < tigerSize ; i++ )  {  // Creates objects
    tigers.add( new Tiger() );
  }
}

void draw() {
  background( 0 );
  counter++;  // Updates counter
  for ( int i = 0 ; i < points.size() ; i++ )  {  // Iterates over points
    points.get(i).draw();  // Draws the points
    if ( i < points.size() -1 )  // If we are not on the last point
      points.get(i).connect( points.get(i+1) );  // Connect to the next point
    points.get(i).move( (int)random( -.49, 3.49 ) );   // Moves each point
  }
  for ( int i = 0 ; i < tigers.size() ; i++ )  {  // Iterates over objects
    tigers.get(i).connect();  // Connects the objects
    tigers.get(i).draw();  // Draws the objects
    tigers.get(i).checkEdges();  // Checks the edges of the box
    tigers.get(i).checkRadius(i);  // Checks if the object needs to get recycled
  }
//  if ( counter % 100 == 0 )
//    background( 0 );
}

void mousePressed()  {  // Creates a new object at the point of the mouse press
   tigers.add( new Tiger( mouseX, mouseY ) ); 
}

void blow( color skinColor, float x, float y )  {  // Explodes the object
  float theta = 0;  // Iterates theta around the circle
  float randomX = random( -3, 3 );  // Velocity in the x direction
  float randomY = random( -3, 3 );  // Velocity in the y direction
  for( int i = 0 ; i < 50 ; i++ )  {  // Creates 50 new points
    theta += 2*PI/40;  // Iterates around the circle
    points.add( new Point( skinColor, theta, x, y,   // Creates the new points
                           randomX, randomY ) );
  }
}

void keyPressed()  {  // Saves the current frame
 saveFrame( "squareConnectors_###.png" );
}
