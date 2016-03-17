// SAM INGERSOLL //
// Move the mouse left and right to zoom
// Move the mouse up and down to change the speed of rotation

ArrayList<Point> points = new ArrayList<Point>();  // List that contains the points
int numCircles = 20;  // Number of layers in the tube
int separation = 100;  // Size of each tube layer
int pointsPer = 10;  // Points along the radius of the tube
float[] radii; // List that contains the radius of each layer
color[] colors; // Array that contains colors for each layer
float counter = 0;

void setup()  {
  size( 1000, 800, P3D );
  background( 255 );
  strokeWeight( 5 );
  float offset = random( -1000, 1000 );
  radii = new float[numCircles];  // Initialize radii array with length equal to number of layers
  colors = new int[radii.length];  // Initialize colors array with same length as radii array
  for ( int c = 0 ; c < radii.length ; c++ )  {
    radii[c] = 1000*noise( c+offset );  // Create a radius for each layer randomly
  }
  for ( int j = 0 ; j < radii.length ; j++ )  {
    for ( int i = 0 ; i < pointsPer ; i++ )  {  // Iterate over each position in a layer for each layer and initialize a point at that position
     points.add( new Point( radii[j]*cos(2*PI/pointsPer*i)+width/2, -20*radii.length+separation*j, radii[j]*sin(2*PI/pointsPer*i)-height ) );
    }
  }
  for ( int c = 0 ; c < colors.length ; c++ )  {  // Populate the color array with random colors
    colors[c] = color( random(255), random(255), random(255) );
  }
}

void draw()  {
  background( 255 );
  stroke( 0 );
  strokeWeight( 3 );
  drawPoints();  // Draws the tube
  spin();  // Rotates the tube
  counter += 1/(map(mouseY, 0, 800, 10, 20 ) );  // Add to the counter which is used for rotating the tube
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0) + mouseX, width/2.0, height/2.0, 0, 0, 1, 0);
}

void spin()  {  // Rotate the tube
  for ( int j = 0 ; j < radii.length ; j++ )  {  // Iterates over each layer
    for ( int i = 0 ; i < pointsPer ; i++ )  {  // Iterates over each item in a layer
      points.get(i+pointsPer*j).x = radii[j]*cos(2*PI/pointsPer*i+counter)+width/2;  // change x value based on counter
      points.get(i+pointsPer*j).y += random(-1, 1);  // Change y value by a small random value
      points.get(i+pointsPer*j).z = radii[j]*sin(2*PI/pointsPer*i+counter)-height;  // Change z value based on counter
    }
  }
}
void drawPoints()  {  // Draws the tube mesh
  for ( int j = 0 ; j < radii.length ; j++ )  {  // Iterates over each layer
    for ( int i = 0 ; i < pointsPer ; i++ )  {  // Iterates over each item in a layer
        beginShape();  // Start drawing a polygon
        if ( i < pointsPer - 1 && j < radii.length - 1 )  {  
          // The last point in the circle connects to the first point, so we check that we are not the lst point. 
          // The last layer only connects to the layer above it, so we check that we are not the last layer
         fill( colors[j] );
         vertex( points.get( i+pointsPer*j ).x, points.get( i+pointsPer*j ).y, points.get( i+pointsPer*j ).z );
         vertex( points.get( i+pointsPer*j+1 ).x, points.get( i+pointsPer*j+1 ).y, points.get( i+pointsPer*j+1 ).z );
         vertex( points.get( i+pointsPer*(j+1)+1 ).x, points.get( i+pointsPer*(j+1)+1 ).y, points.get( i+pointsPer*(j+1)+1 ).z);
         vertex( points.get( i+pointsPer*(j+1) ).x, points.get( i+pointsPer*(j+1) ).y, points.get( i+pointsPer*(j+1) ).z );
        } else if ( j < radii.length - 1 )  {
          // If we are on that last point in the circle and not on the last layer, we connect to the first one
         vertex( points.get( pointsPer*j ).x, points.get( pointsPer*j ).y, points.get( pointsPer*j ).z );
         vertex( points.get( i+pointsPer*j ).x, points.get( i+pointsPer*j ).y, points.get( i+pointsPer*j ).z );
         vertex( points.get( i+pointsPer*(j+1) ).x, points.get( i+pointsPer*(j+1) ).y, points.get( i+pointsPer*(j+1) ).z );
         vertex( points.get( pointsPer*(j+1) ).x, points.get( pointsPer*(j+1) ).y, points.get( pointsPer*(j+1) ).z);
        }
        endShape();  // We close our shape
    }
  }
}

void mousePressed()  {  // If the mouse is pressed, clear everything and start again
 numCircles = (int)random( 3, 40 );
 setup(); 
}