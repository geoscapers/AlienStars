ArrayList<Float> starXs = new ArrayList<Float>();
ArrayList<Float> starYs = new ArrayList<Float>();
ArrayList<Float> starSizes = new ArrayList<Float>();
ArrayList<Float> starHues = new ArrayList<Float>();

int starCount = 1000;

void setupStars() {
  
  for(int i = 0; i < starCount; i++) {
    starXs.add(random(0, width));
    starYs.add(random(0, height));
    starSizes.add(random(0, 100) / 100f);
    starHues.add(random(0, 100));
    
  }
  
}


void drawStars () {
  for(int i = 0; i < starCount; i++) {
    float x = starXs.get(i);
    float y = starYs.get(i);
    float size = starSizes.get(i);
    float hue = starHues.get(i);
    drawStar(x, y, size, hue);
    
    x += size * 5;
    
    if (x > width + 10) {
      x -= width + 20;
      size = random(0, 100) / 100f;
    }
    
    starSizes.set(i, size);
    starXs.set(i, x);
    
  }
  
}

void drawStar(float x, float y, float size, float hue) {
  
  colorMode(HSB, 100, 100, 100);
  
  color starColor = color(hue, 50, 100 * size);
  noStroke();
  fill(starColor);
  ellipse(x, y, 5 * size, 5 * size);
  
  colorMode(RGB, 255, 255, 255);
  
}
