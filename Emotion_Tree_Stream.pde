class Stream {
  ArrayList<Char> balls;
  int numBalls, rndPos, ballSize, spacing;

  Stream(int tempX, int textSize) {
    balls = new ArrayList<Char>();
    numBalls = round(random(20, 40)); // Higher density for stars
    ballSize = textSize;
    spacing = (int)(ballSize / 1.5); // Spacing with explicit casting to int

    rndPos = round(random(0, height - textSize));
    for (int y = 0; y < numBalls * spacing; y += spacing) {
      balls.add(new Char(tempX, y + rndPos, ballSize));
    }
  }

  void update() {
    for (Char ball : balls) {
      // Vertical acceleration with a slight wobble effect
      ball.y += ball.speed + sin(frameCount * 0.1) * 0.5;
      ball.x += random(-0.5, 0.5); // Horizontal "wobble"

      // Occasionally change color
      if (random(1) < 0.01) {
        ball.changeColor();
      }
      ball.show();
    }

    // Reset position when stars go out of view
    if (balls.get(0).y > height) {
      for (int i = 0; i < balls.size(); i++) {
        balls.get(i).y = ((balls.size() - 1) - i) * -ballSize;
        balls.get(i).x += random(-10, 10); // Random horizontal offset on reset
      }
    }
  }
}
