float x = width/2;
float y = height/2;

float speed = 5;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup() {
  size(500,500);
}
void draw() {
  
    if ( (rightPressed) && (x < width) ) {
      x+= speed;
    }
    if (leftPressed && (x > 0)) {
      x -= speed;
    }
    if (upPressed && (y > 0)) {
      y -= speed;
    }
    if (downPressed && (y < height)) {
      y+= speed;
    }
  
  background(0);
  ellipse(x,y, 10, 10);
}

void keyPressed(KeyEvent e) {
  if (key == CODED) {
    
    if (keyCode == RIGHT) {
      rightPressed = true;
    }
    if (keyCode == LEFT) {
      leftPressed = true;
    }
    if (keyCode == UP) {
      upPressed = true;
    }
    if (keyCode == DOWN) {
      downPressed = true;
    }
  }
}

void keyReleased(KeyEvent e) {
  if (key == CODED) {
    
    if (keyCode == RIGHT) {
      rightPressed = false;
    }
    if (keyCode == LEFT) {
      leftPressed = false;
    }
    if (keyCode == UP) {
      upPressed = false;
    }
    if (keyCode == DOWN) {
      downPressed = false;
    }
  }
}