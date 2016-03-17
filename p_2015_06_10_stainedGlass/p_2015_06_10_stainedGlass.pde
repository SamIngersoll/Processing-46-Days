// SAM INGERSOLL //

ArrayList<Point> points = new ArrayList<Point>();  // List of points
int pointCount = 20;  // Number of points
int[] radius = { 600, 1000, 400, 350, 100, 200, 300, 50 };  // List of radii of circles
int[] pointsPer = { 10, 10, 10, 10, 10, 10, 10, 10 };  // List of points per circle
float[] speeds =  {0.05, 0.035, 0.005, 0.002, 0.05, 0.01, 0.03, 0.01, 0.04 }; // List of speeds for circles
// Lengths of the last 3 arrays must be the same.
int counter = 0;

void setup()  {
  size( 800, 800 );
  background( 255 );
  for ( int j = 0 ; j < radius.length ; j++ )  {  // Iterates over each circle
    for ( int i = 0 ; i < pointsPer[j] ; i++ )  {  // Iterates over each point
      points.add( new Point( radius[j], 2*PI/pointsPer[j]*i ) );  // Initializes every point somewhere on its circle
    }
  }
}

void draw()  {
  background( 255 );
  int count = 0;
  for ( int j = 0 ; j < radius.length ; j++ )  {   // Iterates over each circle
    for ( int i = 0 ; i < pointsPer[j] ; i++ )  {  // Iterates over each point
      points.get(count).spin( speeds[j] );  // Moves each point with its circles own speed
      if ( count < points.size()-11 )  {  // If we are not dealing with the last 11 points
       if ( j % 2 == 0 )  // And we are dealing with an even point we use this color
         fill( 255, 255*noise(counter+10000), 255*noise(counter), 255*noise(counter+1000000) );
       else if ( j % 3 == 0 )  // Or a point divisible by 3 we use this color
         fill( 255*noise(counter+1000000), 255*noise(counter), 255, 255*noise(counter+10000) );
       else  // Otherwise we use this color
         fill( 255*noise(counter+10000), 255, 255*noise(counter+1000000), 255*noise(counter) );
       
       //strokeWeight(0.5);
       noStroke();
       beginShape();
       vertex( points.get(count).x, points.get(count).y);
       vertex( points.get(count+10).x, points.get(count+10).y);  
       vertex(width/2, height/2 );
       endShape();
      }
    count++;
    }
  }
}