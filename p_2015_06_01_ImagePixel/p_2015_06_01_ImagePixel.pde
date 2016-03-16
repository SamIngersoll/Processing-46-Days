// Sam Ingersoll //
  // Press any key to save the current frame
  // You will have to place your own image in the sketch folder and change
  // the loadimage path to that image.
PImage img;

void setup()  {                      
  img = loadImage("IMG_2177.jpeg");  // Loads the image by name from the sketch folder
  size( 854, 1280 );     // Sets the size of the screen to the size of the picture
  background( img );                 // draws the image as the background
  noStroke();
  rectMode( CENTER );
}
void draw()  {

  for ( int i = 0 ; i < img.width ; i+=3 )  {       // Iterates over each pixel in the width of the picture
    for ( int j = 0 ; j < img.height ; j+=3 )  {    // Iterates over each pixel in the height of the picture
      fill( img.get( i, j ) );                        // Sets the fill to the color current pixel
      rect( i, j, random(mouseX - i), random(20));    // Draws rectangle around current pixel with random height, 
                                                      //  width also random but dependent on mouseX position
    }
  }
}

void keyPressed()  {  // Saves current frame when any key is pressed
 saveFrame( "imagePixel_###" ); 
}