int maxDepth =6; 
void setup() {
  size(800,600);
  background(0);
}
void draw() {
  background(0);
  translate(mouseX,mouseY);
  float baseSize = map(mouseX, 0, width, 50, 150); 
  float angle = map(mouseY, 0, height, PI / 6, PI / 2); 
  
  drawFractal(0, 0, baseSize, maxDepth,angle);
}

void drawFractal(float x,float y,float size,int depth, float angle) {
  if (depth == 0) return;
  
  float newSize = size *0.6; 
  float hueValue = map(depth, 0,maxDepth, 0, 255); 
  colorMode(HSB,255);
  fill(hueValue, 200,255, 150);
  stroke(hueValue,255, 255);
  if (depth%2==0) {
    ellipse(x, y, size, size); // Circles
  } else {
    rectMode(CENTER);
    rect(x, y, size, size); // Squares
  }
  float x1 = x + cos(angle) * newSize;
  float y1 = y - sin(angle) * newSize;
  float x2 = x - cos(angle) * newSize;
  float y2 = y - sin(angle) * newSize;
  line(x, y, x1, y1);
  line(x, y, x2, y2);

  drawFractal(x1, y1, newSize, depth - 1, angle);
  drawFractal(x2, y2, newSize, depth - 1, angle);
}
