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
    for (int i = 0; i < 10; i++) { // Longer tail effect
      fill(ballColor, 255 - i * 20); // Gradual fading
      ellipse(x, y - i * speed / 1.5, size - i, size - i);
    }
    ellipse(x, y, size, size); // Main circle
  }

  void changeColor() {
    speed = (int)random(3, 10); // Cast to int for speed
    ballColor = morandiColors[(int)random(morandiColors.length)]; // Cast to int for color selection

  }
}
