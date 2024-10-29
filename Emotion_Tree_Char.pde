class Char {
  color ballColor;
  int x, y, size, speed;

  Char(int tempX, int tempY, int ballSize) {
    x = tempX;
    y = tempY;
    size = ballSize / 2; // Smaller size for higher density
    speed = (int)random(3, 10); // Vary speed for smoother movement
    ballColor = morandiColors[(int)random(morandiColors.length)];
  }


  void show() {
      noStroke();
      for (int i = 0; i < 20; i++) { // Increase tail length
        float transparency = map(i, 0, 19, 255, 10); // Gradual fade from solid to transparent
        fill(ballColor, transparency); // Apply calculated transparency
        ellipse(x, y - i * speed / 1.5, size - i * 0.5, size - i * 0.5); // Slightly smaller circles for smoother trail
      }
      ellipse(x, y, size, size); // Main circle
    }


  void changeColor() {
    speed = (int)random(3, 10); // Cast to int for speed
    ballColor = morandiColors[(int)random(morandiColors.length)]; // Cast to int for color selection

  }
}
