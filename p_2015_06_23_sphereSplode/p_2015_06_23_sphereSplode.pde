import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
int detail_H  = 10;
int detail_R = 10;
float rad_ = 100;
float theta;
float forceDissapationCoefficient = 0.2;
PVector force;
color STROKE = color( 255, 0, 0 );
ArrayList<TRI> TRIs;
PImage bg;

void setup()  {
  size( 800, 800, P3D );
  bg = loadImage( "bg.png" );
  cam = new PeasyCam( this, 400 );
  TRIs = new ArrayList<TRI>();
  float yStep = rad_/detail_H;
  theta = TWO_PI/detail_R;
  force = new PVector( 0, 0, 0 );
  for ( int i=0 ; i<detail_H ; i++ )  {
    float c_R = sqrt( sq(rad_)-sq(yStep*i) );
    float n_R = sqrt( sq(rad_)-sq(yStep*(i+1)) );
    for ( int j=0 ; j<detail_R ; j++ )  {
     TRIs.add( new TRI( new PT( c_R*cos(theta*j), yStep*i, c_R*sin(theta*j) ), 
                        new PT( c_R*cos(theta*(j+1)), yStep*i, c_R*sin(theta*(j+1))), 
                        new PT( n_R*cos(theta*j), yStep*(i+1), n_R*sin(theta*j) ) ) );
     TRIs.add( new TRI( new PT( c_R*cos(theta*j), -yStep*i, c_R*sin(theta*j) ), 
                        new PT( c_R*cos(theta*(j+1)), -yStep*i, c_R*sin(theta*(j+1) ) ), 
                        new PT( n_R*cos(theta*j), -yStep*(i+1), n_R*sin(theta*j) ) ) );
     TRIs.add( new TRI( new PT( c_R*cos(theta*(j+1)), yStep*i, c_R*sin(theta*(j+1)) ), 
                        new PT( n_R*cos(theta*(j+1)), yStep*(i+1), n_R*sin(theta*(j+1))), 
                        new PT( n_R*cos(theta*j), yStep*(i+1), n_R*sin(theta*j) ) ) );
     TRIs.add( new TRI( new PT( c_R*cos(theta*(j+1)), -yStep*i, c_R*sin(theta*(j+1)) ), 
                        new PT( n_R*cos(theta*(j+1)), -yStep*(i+1), n_R*sin(theta*(j+1))), 
                        new PT( n_R*cos(theta*j), -yStep*(i+1), n_R*sin(theta*j) ) ) );                   
    }
  }
}
void draw()  {
  background(bg);
  for ( int i=0 ; i<TRIs.size() ; i++ )  {
    TRIs.get( i ).draw();
  }
  cam.rotateY(0.05);
  updatePolys();
}

void updatePolys()  {
  for ( int i=0 ; i<TRIs.size() ; i++ )  {
    TRIs.get(i).increaseMagnitude( random(.90, 1.1));
  }
}
