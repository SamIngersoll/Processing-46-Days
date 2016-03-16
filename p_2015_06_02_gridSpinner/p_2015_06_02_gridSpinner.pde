// Sam Ingersoll //
  // Press any key to save the current frame

int lengthOfEdges = 10;  // Number of points in arms  
int l = 30;  // Period & length control
float[][][] pts = new float[lengthOfEdges][l][3];  // Array of points
float c = 0;  // Counter starts at zero

void setup()  {
  float theta;  // Current angle
  size( 800,  800 );
  background( 255 );
  // Fills points array
  for ( int b = 0 ; b < pts.length ; b++ )  {  // Iterates over lengthOfEdges
    for ( int i = 0 ; i < pts[0].length ; i++ )  {  // Iterates over l
      theta = i*2*PI/(l-1);        // Changes theta around in a circle
      pts[b][i][0] = cos(theta);   // Sets x value of current point
      pts[b][i][1] = sin(theta);   // Sets y value of current point
      pts[b][i][2] = 0;
    }
  }
}

void draw()  {
    background(255);
    spin( pts );  // Moves and draws all of the points
}

void keyPressed()  {  // Saves current frame when any key is pressed
 saveFrame( "gridSpinner_###.png"); 
}

// Takes array of points, spins them and draws them
void spin( float[][][] pts )  { 
  float theta;  // Current angle
  for ( int b = 0 ; b < pts.length ; b++ )  {  // Iterates over lengthOfEdges
    for ( int i = 0 ; i < pts[0].length ; i++ )  {  // Iterates over l
      addRadius( pts );  // Increments the angle
      theta = i+c*2*PI/(l-1);
      pts[b][i][0] = pts[b][i][2]*cos(theta)*b;  // Changes the x value of the current point
      pts[b][i][1] = pts[b][i][2]*sin(theta)*b;  // Changes the y value of the current point
//      pts[b][i][0] = 40*cos(theta)*b;  // Use this and not the previous two line for a different effect
//      pts[b][i][1] = 40*sin(theta)*b;
      strokeWeight( 3 );
      point( pts[b][i][0] + width/2, pts[b][i][1] + height/2 );  // Draws the active point
      strokeWeight(0.1);
      if ( i < pts[0].length - 1 )  { // If we are not dealing with the last point in one of the lines
        line( pts[b][i][0] + width/2, pts[b][i][1] + height/2,   // Draws the current line
        pts[b][i+1][0] + width/2, pts[b][i+1][1] + height/2 );
      }
      if ( b < pts.length - 1 )  {  // If we are not dealing with the last point
        line( pts[b][i][0] + width/2, pts[b][i][1] + height/2,   // Draws another line
        pts[b+1][i][0] + width/2, pts[b+1][i][1] + height/2 );
      }
    }
  }
  c+=0.05;  // Increments angle
}

void addRadius( float[][][] pts )  {
  for ( int b = 0 ; b < pts.length ; b++ )  {  // Iterates over lengthOfEdges
    for ( int i = 0 ; i < pts[0].length ; i++ )  {  // Iterates over l
      pts[b][i][2] += sin(i+c*2*PI/(l-1))/200;  // Try this with different trig functions for different effect, 
                                                //  This controls how the pattern moves
     
    }
  }
}
