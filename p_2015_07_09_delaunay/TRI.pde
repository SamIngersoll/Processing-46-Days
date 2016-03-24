
class TRI  {
 PT[] points = new PT[3];
 PShape tri;
 TRI( PT a, PT b, PT c )  {
  points[0] = a;
  points[1] = b;
  points[2] = c;
  tri = createShape(  );
  tri.beginShape(TRIANGLE);
  tri.vertex( a.p_.x, a.p_.y );
  tri.vertex( b.p_.x, b.p_.y );
  tri.vertex( c.p_.x, c.p_.y );
  tri.endShape();
 } 
 boolean test()  {  // If the circle formed by the three points contains no other points, it passes
   PT c1 = new PT( lerp( points[0].p_.x, points[1].p_.x, .5 ), lerp( points[0].p_.y, points[1].p_.y, .5 ) );
   PT c2 = new PT( lerp( points[2].p_.x, points[1].p_.x, .5 ), lerp( points[2].p_.y, points[1].p_.y, .5 ) );
   float s1 = -1/((points[1].p_.y-points[0].p_.y)/(points[1].p_.x-points[0].p_.x)); 
   float s2 = -1/((points[1].p_.y-points[2].p_.y)/(points[1].p_.x-points[2].p_.x));
   float cx = ( s1*c1.p_.x - s2*c2.p_.x - c1.p_.y + c2.p_.y )/(s1-s2);
   float cy = s1*cx+((c1.p_.y)-(s1*c1.p_.x));
   PVector cen = new PVector( cx, cy );
   for ( int i=0 ; i<pts.length ;i++ )  {
     if ( abs(PVector.dist( pts[i].p_, cen )) < abs(PVector.dist( cen, points[0].p_ ) ) )  {
      return false;
   }
  }
 return true;
 }
 void draw()  {  // Draws the triangle
  shape( tri );
 }
}