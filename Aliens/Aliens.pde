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
boolean beamMeUp = false;
int beamOniter = 50;
int beamOffIter = 200;
int iter = 0;
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
  alienPosX = width/2;
  alienPosY = random(0, height);
  alienSpeedX = random(-5, 10);
  alienSpeedY = random(-5, 20);

  
  
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
  fill(color(250, 255, 150));
  ellipse(xpos, ypos, rad, rad);
  
  //---------------------------------------
  iter ++;
  //alien code
  alienSpeedX += random(-1, 1);
  alienSpeedY += random(-1, 1);
  if (alienSpeedX > 20) alienSpeedX = 20;
  if (alienSpeedX < -20) alienSpeedX = -20; 
  if (alienSpeedY > 10) alienSpeedY = 10;
  if (alienSpeedY < -10) alienSpeedY = -10;
  if (beamMeUp){
    alienPosX += alienSpeedX/10;
    alienPosY += alienSpeedY/10;
    drawAlien(alienPosX, alienPosY, true);
    if (iter >= beamOniter){
      iter = 0;
      beamMeUp = false;
      beamOniter += random(-20,20);
      if (beamOniter < 30 || beamOniter > 150) beamOniter = 50;
    }  
  }
  else{
    alienPosX += alienSpeedX;
    alienPosY += alienSpeedY;
    drawAlien(alienPosX, alienPosY, false);
    if (iter >= beamOffIter){
      iter = 0;
      beamMeUp = true; 
      beamOffIter += random(-50,50);
      if (beamOffIter < 60 || beamOffIter > 450) beamOffIter = 150;
    }
  }
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
     
  //---------------------------------------
}

void drawAlien(float xpos, float ypos, boolean beam)
{
  int size = 50;
  if(beam){
    fill(color(255,255,100+random(-30, 30)));
    triangle(xpos, ypos, xpos-size/5, height, xpos+size/5, height);
    fill(color(0,0,0));
    float osuus = ((float)beamOniter-iter)/beamOniter;
    float matka = height-ypos;
    ellipse(xpos, ypos+osuus*matka, size/15, size/15);
  }  
  
  fill(color(0,0,0));
  ellipse(xpos, ypos, size, size/2);
  ellipse(xpos, ypos, size*2, size/4);
  
  for (int i = -3; i < 4; i++) {
    fill(color(230+20*sin(millis()/100.0-i),230+20*sin(millis()/500.0+i),0));
    ellipse(xpos+((size)/3*i),ypos+size/20*sin(millis()/100.0+i), size/10, size/10);
  }

  
}  
