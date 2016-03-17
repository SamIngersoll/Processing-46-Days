int tigerSize = 10;  // Number of objects
ArrayList<Tiger> tigers = new ArrayList<Tiger>();  // List of objects

void setup() {
  size( 1400, 800 );
  background( 0 );
  noFill();
  strokeWeight( 1 );
  for ( int i = 0 ; i < tigerSize ; i++ )  {  // Populates the arraylist with objects
    tigers.add( new Tiger() );
  }
}

void draw() {
  background( 0 );
  for ( int i = 0 ; i < tigers.size() ; i++ )  {  // Iterates through objects
    tigers.get(i).draw();  // Draws objects
    tigers.get(i).connect();  // Connects objects
    tigers.get(i).checkEdges();  // Checks the walls
    tigers.get(i).checkRadius(i);  // Removes objects with size 0
  }
}

void mousePressed()  {
   tigers.add( new Tiger( mouseX, mouseY ) );  // Adds an object at the point of the click
}