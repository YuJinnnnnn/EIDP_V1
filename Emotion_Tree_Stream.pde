class Stream {
  ArrayList<Char> balls;
  int numBalls, rndPos, ballSize, spacing;

  Stream(int tempX, int textSize) {
    balls = new ArrayList<Char>();
    numBalls = round(random(20, 40)); // Higher number for density
    ballSize = textSize;
    spacing = (int)(ballSize / 1.5); // Explicitly cast to int

    rndPos = round(random(0, height - textSize));
    for (int y = 0; y < numBalls * spacing; y += spacing) {
      balls.add(new Char(tempX, y + rndPos, ballSize));
    }
  }

  void update() {
    for (Char ball : balls) {
      ball.y += ball.speed; // Movement speed
      if (random(1) < 0.01) {
        ball.changeColor(); // Occasional color shift
      }
      ball.show();
    }

    // Reset position when out of view
    if (balls.get(0).y > height) {
      for (int i = 0; i < balls.size(); i++) {
        balls.get(i).y = ((balls.size() - 1) - i) * -ballSize;
      }
    }
  }
}
