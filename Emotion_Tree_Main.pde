PFont foreignFont;
ArrayList<Stream> streams;
int textSize = 15; // Smaller size for higher density
int windowWidth;
boolean recording = false;

color[] morandiColors = {
  color(197, 179, 88),  // muted yellow
  color(181, 146, 129), // soft brown
  color(141, 163, 153), // cool green-gray
  color(170, 152, 169), // muted lavender
  color(221, 210, 201)  // soft beige
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
