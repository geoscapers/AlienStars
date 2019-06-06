ArrayList<Float> starXs = new ArrayList<Float>();
ArrayList<Float> starYs = new ArrayList<Float>();
ArrayList<Float> starSizes = new ArrayList<Float>();

int starCount = 100;

void setupStars() {
  
  for(int i = 0; i < starCount; i++) {
    starXs.add(random(0, width));
    starYs.add(random(0, height));
    
  }
  
}


void drawStars () {
  for(int i = 0; i < starCount; i++) {
    drawStar(starXs.get(i), starYs.get(i));
  }
  
}

void drawStar(float x, float y) {
  
  color starColor = color(250, 200, 220);
  noStroke();
  fill(starColor);
  ellipse(x, y, random(1, 5), random(1, 5));
  
}
