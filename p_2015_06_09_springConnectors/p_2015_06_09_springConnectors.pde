//  SAM INGERSOLL  //

ArrayList<Point> points = new ArrayList<Point>();  // List of points
ArrayList<Connector> connectors = new ArrayList<Connector>();  // List of connectors
int numPoints = 1000;  // Number of points
int minDistanceForConnection = 40;  // Smallest distance required for connection

void setup()  {
  size( 800, 800 );
  background( 255 );
  for ( int i = 0 ; i < numPoints ; i++ )  {  // Iterates. Initializing points
    points.add( new Point(i) );
  }
}

void draw()  {
  background( 255 );
  for ( int i = 0 ; i < numPoints ; i++ )  {  // Iterates over points
    points.get(i).checkWalls();
    points.get(i).move();
    points.get(i).draw();
  }
  for ( int k = 0 ; k < numPoints ; k++ )  {  // Iterates over points
    for ( int j = 0 ; j < numPoints ; j++ )  {  // Iterates over all other points
      float dist = abs( dist( points.get(k).x, points.get(k).y, points.get(j).x, points.get(j).y ) );
      if ( dist < minDistanceForConnection && k != j && !points.get(k).connectedTo.contains(j) )  {  // Checks to make sure the point is close enough to connect
        connectors.add( new Connector( k, j ) );  // Connects point
      }
    }
  }
  for ( int i = 0 ; i < connectors.size() ; i++ )  {  // Iterates over connectors
      connectors.get(i).draw();  // Draws connector
  }
  connectors.clear();  // Destroys the connectors
  saveFrame( "springConnectors_gif_###.png" );
}