
class TRI  {
 PT[] points = new PT[3];
 PT[] centers = new PT[3];
 PShape tri;
 PShape cell;
 TRI( PT a, PT b, PT c )  {
  points[0] = a;
  points[1] = b;
  points[2] = c;
  tri = createShape();
  tri.beginShape(TRIANGLE);
  tri.vertex( a.p_.x, a.p_.y );
  tri.vertex( b.p_.x, b.p_.y );
  tri.vertex( c.p_.x, c.p_.y );
  tri.endShape();
 } 
 boolean test()  {
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
  centers[0]=c1;
  centers[1]=c2;
  centers[2]=new PT( lerp( points[2].p_.x, points[0].p_.x, .5 ), lerp( points[2].p_.y, points[0].p_.y, .5 ) );
  cell = createShape();
  cell.beginShape();
  cell.fill(255);
  cell.vertex( centers[0].p_.x, centers[0].p_.y );
  cell.bezierVertex(
                    points[1].p_.x, points[1].p_.y,
                    points[1].p_.x, points[1].p_.y,
                    centers[1].p_.x, centers[1].p_.y);
  cell.vertex( centers[1].p_.x, centers[1].p_.y );
  cell.bezierVertex(
                    points[2].p_.x, points[2].p_.y,
                    points[2].p_.x, points[2].p_.y,
                    centers[2].p_.x, centers[2].p_.y);
  cell.vertex( centers[2].p_.x, centers[2].p_.y );
  cell.bezierVertex(
                    points[0].p_.x, points[0].p_.y,
                    points[0].p_.x, points[0].p_.y,
                    centers[0].p_.x, centers[0].p_.y);
  cell.endShape();
  return true;
 }
 void draw()  {
  shape( tri );
 }
 void drawCell()  {
   shape(cell);
 }
}

