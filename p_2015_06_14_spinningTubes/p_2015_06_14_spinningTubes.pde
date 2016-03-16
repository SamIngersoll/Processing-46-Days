
ArrayList<Point> points = new ArrayList<Point>();
Point p = new Point(width/2,height/2,-800);
int numCircles = 20;
int separation = 100;
int pointsPer = 10;
float[] radii; //= new float[numCircles];
color[] colors; //= new int[radii.length];
float counter = 0;

void setup()  {
  size( 1000, 800, P3D );
  background( 255 );
  strokeWeight( 5 );
  float offset = random( -1000, 1000 );
  radii = new float[numCircles];
  colors = new int[radii.length];
  for ( int c = 0 ; c < radii.length ; c++ )  {
    radii[c] = 1000*noise( c+offset );
  }
  for ( int j = 0 ; j < radii.length ; j++ )  {
    for ( int i = 0 ; i < pointsPer ; i++ )  {
     points.add( new Point( radii[j]*cos(2*PI/pointsPer*i)+width/2, -20*radii.length+separation*j, radii[j]*sin(2*PI/pointsPer*i)-height ) );
    }
  }
  for ( int c = 0 ; c < colors.length ; c++ )  {
    colors[c] = color( random(255), random(255), random(255) );
  }
}

void draw()  {
  background( 255 );
  stroke( 0 );
  strokeWeight( 3 );
  drawPoints();
  spin();
  if ( mouseY != 0 )
    counter += 1/(map(mouseY, 0, 800, 10, 20 ) );
  else
    counter++;
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0) + mouseX, width/2.0, height/2.0, 0, 0, 1, 0);
}

void spin()  {
  for ( int j = 0 ; j < radii.length ; j++ )  {
    for ( int i = 0 ; i < pointsPer ; i++ )  {
      points.get(i+pointsPer*j).x = radii[j]*cos(2*PI/pointsPer*i+counter)+width/2;
      points.get(i+pointsPer*j).y += random(-1, 1);
      points.get(i+pointsPer*j).z = radii[j]*sin(2*PI/pointsPer*i+counter)-height;
    }
  }
}
void drawPoints()  {
  for ( int j = 0 ; j < radii.length ; j++ )  {
    for ( int i = 0 ; i < pointsPer ; i++ )  {
      points.get( i+pointsPer*j ).draw();
        beginShape();
        if ( i < pointsPer - 1 && j < radii.length - 1 )  {
         fill( colors[j] );
         vertex( points.get( i+pointsPer*j ).x, points.get( i+pointsPer*j ).y, points.get( i+pointsPer*j ).z );
         vertex( points.get( i+pointsPer*j+1 ).x, points.get( i+pointsPer*j+1 ).y, points.get( i+pointsPer*j+1 ).z );
         vertex( points.get( i+pointsPer*(j+1)+1 ).x, points.get( i+pointsPer*(j+1)+1 ).y, points.get( i+pointsPer*(j+1)+1 ).z);
         vertex( points.get( i+pointsPer*(j+1) ).x, points.get( i+pointsPer*(j+1) ).y, points.get( i+pointsPer*(j+1) ).z );

        } else if ( j < radii.length - 1 )  {
         vertex( points.get( pointsPer*j ).x, points.get( pointsPer*j ).y, points.get( pointsPer*j ).z );
         vertex( points.get( i+pointsPer*j ).x, points.get( i+pointsPer*j ).y, points.get( i+pointsPer*j ).z );
         vertex( points.get( i+pointsPer*(j+1) ).x, points.get( i+pointsPer*(j+1) ).y, points.get( i+pointsPer*(j+1) ).z );
         vertex( points.get( pointsPer*(j+1) ).x, points.get( pointsPer*(j+1) ).y, points.get( pointsPer*(j+1) ).z);
        }
        endShape(); 
    }
  }
}

void mousePressed()  {
 numCircles = (int)random( 3, 40 );
 setup(); 
}
