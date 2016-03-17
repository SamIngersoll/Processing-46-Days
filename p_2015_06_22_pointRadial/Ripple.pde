
void ripple()  {  // Iterate through points and find distance from origin, points within thickess get turned black
  for ( int i=0 ; i<W ; i++ )  {
    for ( int j=0 ; j<H ; j++ )  {
      if ( abs(PVector.dist( points[i][j].position, origin ) ) > distCounter || 
           abs(PVector.dist( points[i][j].position, origin ) ) < rippleThickness )  {
        points[i][j].str = color( PVector.dist(points[i][j].position, p.position )/colCo,
                PVector.dist(points[i][j].position, p.position )/colCo,
                PVector.dist(points[i][j].position, p.position )/colCo );
      }  else  {
                points[i][j].str = color( 255-PVector.dist(points[i][j].position, p.position )/colCo,
                255-PVector.dist(points[i][j].position, p.position )/colCo,
                255-PVector.dist(points[i][j].position, p.position )/colCo );
      }
    }
  }
  distCounter += 4;
  rippleThickness +=2;
}