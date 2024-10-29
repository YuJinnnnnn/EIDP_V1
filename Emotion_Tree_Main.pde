PFont foreignFont;
ArrayList<Stream> streams;
int textSize = 15; // Smaller size for higher density
int windowWidth;
boolean recording = false;

color[] morandiColors = {
  color(255, 223, 0),    // Yellow - Joy
  color(0, 105, 180),    // Blue - Sadness
  color(255, 0, 0),      // Red - Anger
  color(128, 0, 128),    // Purple - Fear
  color(0, 128, 0),      // Green - Disgust
  color(255, 140, 0),    // Orange - Anxiety
  color(0, 255, 255),    // Cyan - Envy
  color(75, 0, 130),     // Indigo - Ennui
  color(255, 182, 193),  // Pink - Embarrassment
  color(0, 0, 0)         // Black - Undefined
};


void setup() {
  size(1280, 720, P2D);
  background(0);
  
  foreignFont = createFont("Arial Unicode MS", textSize); 
  textFont(foreignFont);
  textAlign(LEFT, TOP);
  
  streams = new ArrayList<Stream>();
  for (int x = 0; x < width; x += textSize) {
    streams.add(new Stream(x, textSize));
  }
  
  windowWidth = width;
}

void draw() {
  background(0, 20); // Slightly transparent for trailing effect

  if (windowWidth == width) {
    // Update all streams
    for (Stream s : streams) {
      s.update();
    }
  } else {
    // Clear and reset streams if window size changes
    streams.clear();
    for (int x = 0; x < width; x += textSize) {
      streams.add(new Stream(x, textSize));
    }
    windowWidth = width;
  }
  
  if (recording) {
    saveFrame("video/####.png");
    println("Recording");
  } 

  println("Framerate: " + frameRate);
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    recording = !recording;
  }
}
