// A ripple is made up of a number of particles, it radiates out from its origin and bounces off walls.
// Ripples leave cool trails.

class Ripple {
  float x, y;  // X and y value for origin of ripple
  int size;    // How many particles in the ripple
  ArrayList<Particle> particles;  // List of currently active particles
  boolean kill = false;  // Whether or not the ripple should be removed from the list  
  // If 'p' key has been pressed
  Ripple( float x, float y, int size ) {  // Values that must be passed to create the ripple
    this.x = x;
    this.y = y;
    this.size = size;
    this.particles = new ArrayList<Particle>();
    for ( int i = 0; i < this.size; i++ ) {   // Iterates from zero to the number of particles to be in the ripple
      this.particles.add( new Particle( x, y,           // Creates a new particle at the origin of the ripple
      cos( 2*PI/this.size * i + particleOffsetAngle ),  // the particles have velocities pointing radially outward  
      sin( 2*PI/this.size * i + particleOffsetAngle ) ) ); 
    }
  }
  void move() {  // Tells each particle in the ripple to move itself
    for ( int i = 0; i < this.particles.size (); i++ ) {
      this.particles.get( i ).move();
    }
  }
  void draw() {  // Tells each particle in the ripple to display itself and then increase its size
    for ( int i = 0; i < this.particles.size (); i++ ) {
      this.particles.get( i ).draw();
      this.particles.get( i ).incrementSize();
      }
  }
  void checkWalls() {  // Tells each particle in the ripple to check whether it has bumped into a wall
    for ( int i = 0; i < this.particles.size (); i++ ) {
      this.particles.get( i ).checkWalls();
    }
  }
  void checkDeath() {  // Tells each particle in teh ripple to check whether it has died
    for ( int i = 0; i < this.particles.size (); i++ ) {
      this.particles.get( i ).checkDeath();
    }
  }
  void clean() {  // Removes the particles that have died from the ripple
    for ( int i = 0; i < this.particles.size (); i++ ) {
      if ( this.particles.get(i).death == true ) {
        this.particles.get( i ).draw();
        this.particles.remove( i );
      }
    }
  }
}

