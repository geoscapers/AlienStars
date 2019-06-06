/**
 * Bounce. 
 * 
 * When the shape hits the edge of the window, it reverses its direction. 
 */
 
int rad = 60;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

//--------------------------------
// alien code 
float alienPosX, alienPosY, alienSpeedX, alienSpeedY;
//--------------------------------

void setup() 
{
  size(640, 360);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
  
  //-------------------------------------
  // alien code
  float alienPosX = width/2;
  float alienPosY = random(0, height);
  float alienSpeedX = random(-5, 10);
  float alienSpeedY = random(-5, 20);
  
  
  //-------------------------------------
 
}

void draw() 
{
  background(102);
  
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  // Draw the shape
  ellipse(xpos, ypos, rad, rad);
  
  //---------------------------------------
  //alien code
  alienSpeedX += random(-1, 1);
  alienSpeedY += random(-1, 1);
  if (alienSpeedX > 20) alienSpeedX = 20;
  if (alienSpeedX < -20) alienSpeedX = -20; 
  if (alienSpeedY > 10) alienSpeedY = 10;
  if (alienSpeedY < -10) alienSpeedY = -10;
  alienPosX += alienSpeedX;
  alienPosY += alienSpeedY;
  if (alienPosY < 0){ 
    float amountOut = abs(alienPosY)/height;
    alienSpeedY += 5*amountOut; 
  }
  if (alienPosX < 0){ 
    float amountOut = abs(alienPosX)/width;
    alienSpeedX += 5*amountOut; 
  }
  if (alienPosY > height-height/4){ 
    float amountOut = (alienPosY-(height-height/4))/height;
    alienSpeedY -= 5*amountOut; 
  }
  if (alienPosX > width){ 
    float amountOut = (alienPosX-width)/width;
    alienSpeedX -= 5*amountOut; 
  }
  drawAlien(alienPosX, alienPosY);
  
    
  
  //---------------------------------------
}

void drawAlien(float xpos, float ypos)
{
  int size = 50;
  fill(color(0,0,0));
  ellipse(xpos, ypos, size, size/2);
  ellipse(xpos, ypos, size*2, size/4);
  fill(color(255,255,0));
  for (int i = -3; i < 4; i++){
    ellipse(xpos+((size)/3*i),ypos+sin(millis()/1000.0+i), size/10, size/10);
  }
  
}  
