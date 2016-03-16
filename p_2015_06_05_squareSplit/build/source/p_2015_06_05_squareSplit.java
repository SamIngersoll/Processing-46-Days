import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class p_2015_06_05_squareSplit extends PApplet {

ArrayList squares = new ArrayList<Square>();
Square s;

public void setup()  {
  size( 800, 800 );
  background( 255 );
  rectMode( CENTER );
  println( "whatsup");
  // for ( int i = 0 ; i < 10 ; i++ ) {
  //   squares.add( new Square( i*width/10, height/2, random(50) );
  // }
}

public void draw()  {
  // for ( int i = 0 ; i < squares.size() ; i++ )  {
  //   s = (Square)squares.get(i);
  //   s.draw();
  // }
}
class Square  {
 float x, y, r;
 Square()  {
   this.x = random( width );
   this.y = random( height );
   this.r = random( 10, 200 );
 }
 Square( float x, float y, float r ) {
   this.x = x;
   this.y = y;
   this.r = r;
 }
 public void draw()  {
  noStroke();
  fill( 255, 0, 0 );
  rect( this.x, this.y, this.r, this.r );
 }
 public void split()  {

 }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "p_2015_06_05_squareSplit" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
