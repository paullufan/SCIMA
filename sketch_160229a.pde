/* 
 example 4: Creating an array of objects using a class
 based on http://www.openprocessing.org/sketch/48960
 */
 
int XSPEED = 4;
int YSPEED = 7;
int CIRCLESIZE = 15;
 
// create an empty array for 100 MovingCircle objects
MovingCircle[] myCircleArray = new MovingCircle[5];
 
void setup() {
  size(400, 400);
  smooth();
 
  // and actually create the objects and populate the
  // array with them
  for (int i=0; i < myCircleArray.length; i++) {
    myCircleArray[i] = new MovingCircle(random(0, width-40), random(0, height-20), random(0,255), random(0, 255), random(0, 255));
  }
}
 
void draw() {
 
  background(0);
 
  // iterate through every moving circle
  for (int i=0; i < myCircleArray.length; i++) {
 
    myCircleArray[i].update();
    myCircleArray[i].checkCollisions();
    myCircleArray[i].drawCircle();
  }
}
 
 
// this is the definition for our custom MovingCircle class,
// start with the name of the class
 
class MovingCircle {
 
  // any variable declared here will be properties of
  // objects of this type 
  float x;
  float y;
  float xSpeed;
  float ySpeed; 
  float red, green, blue;
 
  // Now the functions that are part of this object
 
  // this special function declaration has the same name
  // as the class (MovingCircle) and it has no return type. This
  // is known as the constructor and it's run when an 
  // object of this type is created.
 
  MovingCircle(float xpos, float ypos, float temc, float temg, float temb) {
    x = xpos;
    y = ypos;  
    xSpeed = XSPEED;
    ySpeed = YSPEED;
    red = temc;
    green = temg;
    blue = temb;
  }
 
  // Now come the functions (methods) of the object that 
  // can be called. These functions describe what the 
  // object can do:
 
  // update adds the speed to the position, making
  // our circle move around.
  void update() {
    x += xSpeed;
    y += ySpeed;
  }
 
  // this function checks to see if our circle has gone off
  // the edge of the screen, and if so reverses the speed   
  void checkCollisions() {     
    float r = CIRCLESIZE/2;
 
    if ( (x<r) || (x>width-r)){
      xSpeed = -xSpeed;
    } 
 
    if( (y<r) || (y>height-r)) {
      ySpeed = -ySpeed; 
      red = random(0,255);
      green = random(0, 255);
      blue = random(0,255);
    }  
  }
 
  // This function finally draws the circle
  void drawCircle() {     
    fill(red,green,blue);
    rect(x, y, 40, 20);
  }
} // End of the MovingCircle class