import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

// Vectors make paths from origin. They go up and make a structure of sorts.
// For tomorrow do string relaxation or something. meshes merging together;
// Double helix mesh 
Pusher p;
Pusher[] pushers = new Pusher[200];
PeasyCam cam;

void setup()  {
  size( 800, 800, P3D );
  background( 255 );
  cam = new PeasyCam( this, 800 );
  for ( int i=0 ; i<pushers.length ; i++ )  {
   pushers[i] = new Pusher( 0,0,0 ); 
  }
}

void draw()  {
//  background( 255 );
  for ( int i=0 ; i<pushers.length ; i++ )  {
    pushers[i].update();
    pushers[i].draw();
    if ( i>1 )  {
     strokeWeight( 0 );
     fill( 255, 0, 0, 0 );
     beginShape();
     vertex( pushers[i].p_.x, pushers[i].p_.y, pushers[i].p_.z );
     vertex( pushers[i-1].p_.x, pushers[i-1].p_.y, pushers[i-1].p_.z );
     vertex( pushers[i-2].p_.x, pushers[i-2].p_.y, pushers[i-2].p_.z );
     endShape();
    }
  }
}

void mousePressed()  {
  for ( int i=0 ; i<pushers.length ; i++ )  {
   pushers[i] = new Pusher( mouseX-width/2, mouseY-height/2,0 ); 
  }
}

void keyPressed()  {
 if ( key == 's' )  {
  saveFrame( "rainbowParticles_###.png" );
 } 
}
