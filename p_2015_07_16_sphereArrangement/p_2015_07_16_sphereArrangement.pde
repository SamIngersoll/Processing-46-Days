import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
float counter = 0;
float offset = 20;
int ballsL = 10;
int ballsW = 10;
Ball[][] balls = new Ball[ballsL][ballsW];
void setup() {
  size( 800, 800, P3D );
  noStroke();
  cam = new PeasyCam( this, (ballsL-1)*offset/2, (ballsW-1)*offset/2, 0, 300 );
//  cam.rotateX( PI/1.88 );
  cam.rotateZ( PI/4 );
  sphereDetail( 6 );
  for ( int i=0; i<balls.length; i++ ) {
    for ( int j=0; j<balls[0].length; j++ ) {
      balls[i][j] = new Ball( offset*i, offset*j, offset*noise(offset*i, offset*j ) );
    }
  }
}
void draw() {
  background( 255 );
  counter+=0.01;
  for ( int i=0; i<balls.length; i++ ) {
    for ( int j=0; j<balls[0].length; j++ ) {
      balls[i][j].move();
      balls[i][j].draw();
    }
  }
}

