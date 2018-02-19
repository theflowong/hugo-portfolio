// animation of trippy trees
// inspired by the breathing life of the Arb and the fall leaves
// by Flo Wong
// October 2016

// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------ LAND ------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\

class Land {
  
  // ---------- DATA ---------- \\
  
  float greenval; // green value
  boolean greenval_shrink;

  float size;
  float size_i;
  float size_diff; // how tall it pulsates
  int size_grow; // 1: grow, 0: shrink
  float size_speed;
  
  float frame_count_end;

  // ---------- CONSTRUCTOR ---------- \\

  Land() {
    
    greenval = 0;
    greenval_shrink = false;

    size = 250;
    size_i = 200;
    size_diff = 50;
    size_grow = 0;
    size_speed = 0.5;

    
    frame_count_end = 0;
  }
  
  // ---------- FUNCTIONS ---------- \\
  
  // ----- pulsate color ----- \\
  void pulsateColor() {
    if ((greenval < 100) && (!greenval_shrink)) {
      greenval += 1;
    } else if (greenval > 1) {
      greenval_shrink = true;
      greenval -= 1;
    } else { // green == 1
      greenval_shrink = false;
    }
  }
  
  // ----- pulsate size ----- \\
  void pulsateSize() { // (wait until sky has finished changing colors to call this function)
    // increment size
    if (size_grow == 1) {
      size += size_speed;
    } else if (size_grow == 0) {
      size -= size_speed;
    }
    
    // check limits to change increment
    if (size > (size_i + size_diff)) {
      size_grow = 0;
    } else if (size < size_i) {
      size_grow = 1;
    }
  }

  // ----- draw the ellipse ----- \\
  void display() {
    noStroke();
    fill(150 - greenval, 150, 150 - 0.6 * greenval); // green ish
    ellipse(200, 440, 1200, size); // x, y, width, height (150 to 200)
  }
}


// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------ LEAF ------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\

// by Flo Wong

class Leaf {
  
  // ---------- DATA ---------- \\
  
  // pulsating leaves: size
  float size_i;
  float size_f;
  float size;
  int sizeGrow;
  float sizeSpeed;

  // orange leaves color
  float r;
  float g;
    float g_i;
    float g_f;
  float b;
  int colorGrow;
  float color_speed;
    float b_speed;
    float g_speed;
  
  // ---------- CONSTRUCTOR ---------- \\
  
  Leaf(float leaf_r, float leaf_g, float leaf_b) {
    
    // size
    size_i = 5;
    size_f = 15;
    size = random(size_i, size_f);
    sizeGrow = 0;
    sizeSpeed = 0.1;
    
    // color
    r = leaf_r;
    g = leaf_g;
      g_i = leaf_g;
      g_f = 200;
    b = leaf_b;
    colorGrow = 1;
    color_speed = 0.01;
      g_speed = color_speed*(g_f - g_i);
  }
  
  
  // ---------- FUNCTIONS ---------- \\
      
  void pulsateColor() {
    // COPIED FROM MOON
    // increment g and b values
    if (colorGrow == 1) {
      g += g_speed;
    } else if (colorGrow == 0) {
      g -= g_speed;
    }
    
    // check limits to change increment
    if (g > g_f) {
      colorGrow = 0;
    } else if (g < g_i) {
      colorGrow = 1;
    }
    
  }
  
  void pulsateSize() {
    // increment size values
    if (sizeGrow == 1) {
      size += sizeSpeed;
    } else if (sizeGrow == 0) {
      size -= sizeSpeed;
    }
    
    // check limits to change increment
    if (size > size_f) {
      sizeGrow = 0;
    } else if (size < size_i) {
      sizeGrow = 1;
    }
     
  }
      
  // ---------- Draw Leaf ---------- \\
  void display(int x, int y) {
    
    //fill(r, g+random(80), b, 30);
    //ellipse(x+3, y+1, size+16, size+16);

    fill(r, g-80, b, 30);
    ellipse(x+3, y+1-0.2*size, size*2, size*2);

    fill(r, g+80, b, 40);
    ellipse(x-3, y-size, size+8, size+8);

    fill(r, g-70, b, 70);
    ellipse(x+3, y-(2)+1.5*size, size+6, size+6);

    fill(r, g+40, b, 100);
    ellipse(x-2+size, y-(1), size+4, size+4);

    fill(r, g-30, b, 150);
    ellipse(x+6-size, y+3, size*1, size*1);
    
    fill(r, g, b, 250);
    ellipse(x, y, size, size);
    
    
    
    // leaves below
    
    fill(r, g-80, b, 30);
    ellipse(x+3, y+20+6*size, size*2, size*2);

    fill(r, g+80, b, 40);
    ellipse(x-3, 2*y+2*size, size+8, size+8);

    fill(r, g-70, b, 70);
    ellipse(x+3, 1.5*y+1.5*size, size+6, size+6);

    fill(r, g+40, b, 100);
    ellipse(x-2+size, y-(1), size+4, size+4);

    fill(r, g-30, b, 150);
    ellipse(x+6-size, 1.2*y+3, size*1, size*1);
    
    fill(r, g, b, 250);
    ellipse(x-0.5*size, y+130, size, size);
    
    /* PREVIOUS weird horizontal leaves
    
    //fill(r, g, b, 250);
    //ellipse(x+33, y+2, size+28, size+106);

    fill(r, g+random(-20,20), b, 20);
    ellipse(x+3, y+3, size+28, size*3+18-30);
    
    fill(r, g+random(80), b, 30);
    ellipse(x+3, y+1, size+16, size*3+18-30);

    fill(r, g-80, b, 30);
    ellipse(x+3, y+1, size*0.7+16, size*3+18-40);

    fill(r, g+80, b, 40);
    ellipse(x-3, y+1, size*2+18, size+16);

    fill(r, g-70, b, 70);
    ellipse(x+3, y-(2), size*2.5+16, size*2+12-12);

    fill(r, g+40, b, 100);
    ellipse(x-2, y-(1), size+8, size*3+4-15);

    fill(r, g-0, b, 150);
    ellipse(x+6, y+3, size*1.5+3, size+1);

    fill(r, g, b, 200);
    ellipse(x, y, size, size);
    
    */
  }
}


// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------ MOON ------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\

// by Flo Wong

class Moon {
  
  // ---------- DATA ---------- \\

  // location
  float x;
  float y;
  float xf;
  float yf;
  float xy_speed;
  
  // sizing: shrinking
  float size;
  float sizef;
  float shrink_speed;
  int finishedShrinking;
  
  // sizing: pulsing
  float size_grow;
  float size_diff;
  float size_speed;
  
  // color
  float r;
  float g;
    float g_i;
    float g_f;
  float b;
    float b_i;
    float b_f;
  int color_grow;
  float color_speed;
    float b_speed;
    float g_speed;
  
  // ---------- CONSTRUCTOR ---------- \\

  Moon() {
    
    x = 250;
    y = 500;
    xf = 50;
    yf = 50;
    xy_speed = 0.005;

    // shrinking
    size = 180;
    sizef = 40;
    shrink_speed = -0.2; // -0.2
    finishedShrinking = 0;
    
    // pulsing
    size_grow = 1;
    size_diff = 10;
    size_speed = 0.2;
    
    // hue = 50
    r = 255;
    g = 255;
      g_i = 245;
      g_f = 255;
    b = 255;
      b_i = 203;
      b_f = 255;
    color_grow = 0;
    color_speed = 0.01;
      b_speed = color_speed*(b_f - b_i);
      g_speed = color_speed*(g_f - g_i);
  }
  
  // ---------- FUNCTIONS ---------- \\
  
  // ----- move from x,y to xf,yf ----- \\
  void move() {
    // check to see if x,y are at final xf,yf
    if (x > xf) {
      x += xy_speed*(xf-x);
    }
    if (y > yf) {
      y += xy_speed*(yf-y);
    }
  }
  
  // ----- shrink from size to sizef ----- \\
  void shrink() {
    if (size == sizef || size < sizef) {
      finishedShrinking = 1;
    }
    else if (finishedShrinking == 0) {
      if (size > sizef) {
        size += shrink_speed;
      }
    }
  }
  
  // ----- pulsate size ----- \\
  void pulsateSize() {
    if (finishedShrinking == 1) {
      // increment size
      if (size_grow == 1) {
        size += size_speed;
      } else if (size_grow == 0) {
        size -= size_speed;
      }
      
      // check limits to change increment
      if (size > (sizef + size_diff)) {
        size_grow = 0;
      } else if (size < (sizef - size_diff)) {
        size_grow = 1;
      }
    }
  }
  

  
  // ----- pulsate color ----- \\
  
  void pulsateColor() {
    // increment g and b values
    if (color_grow == 1) {
      g += g_speed;
      b += b_speed;
    } else if (color_grow == 0) {
      g -= g_speed;
      b -= b_speed;
    }
    
    // check limits to change increment
    if (g > g_f) {
      color_grow = 0;
    } else if (g < g_i) {
      color_grow = 1;
    }
  }
  
  // ----- draw the ellipse ----- \\
  void display() {
    noStroke();
    
    // draw moon
    fill(r,g,b);
    ellipse(x, y, size, size);
    
    // draw moon spots
    fill(222, 201, 177, 120);
    ellipse(x + size/4,    y + size/19,  size/4,   size/1.5);
    ellipse(x + size/8,    y + size/6,   size/2,   size/4);
    ellipse(x - size/3,    y + size/5,   size/6,   size/4);
    ellipse(x - size/7,    y-size/4,     size/3,   size/5);
  }
  
}


// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------ SKY ------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\

// by Flo Wong

class Sky {
  
  // ---------- DATA ---------- \\
  float sky_ri;
  float sky_bi;
  float sky_gi;
  
  float sky_r;
  float sky_b;
  float sky_g;
  
  float sky_rf;
  float sky_bf;
  float sky_gf;
  
  float speed;
  
  float large_stars;
  
  // ---------- CONSTRUCTOR ---------- \\
  Sky() {
    sky_ri = 224;
    sky_bi = 246;
    sky_gi = 255;
    
    sky_r = sky_ri;
    sky_b = sky_bi;
    sky_g = sky_gi;
    
    sky_rf = 48;
    sky_bf = 43;
    sky_gf = 72;
    
    speed = 0.01;
    
    large_stars = 0;
  }
  
  // ---------- FUNCTIONS ---------- \\
  
  // ----- test for dark sky finish ----- \\
  boolean isDark() {
    return ((sky_r < sky_rf) && (sky_b < sky_bf) && (sky_g < sky_gf));
  }
  
  // ----- transition to dark night sky ----- \\
  void transition() {
    if ((sky_r > sky_rf) || (sky_b > sky_bf) || (sky_g > sky_gf)) {
      sky_r -= ((sky_ri - sky_rf) * speed);// 244 to 50 48
      sky_b -= ((sky_bi - sky_bf) * speed); // 246 to 50 43
      sky_g -= ((sky_gi - sky_gf) * speed); // 255 to 80 72
    }
  }
  
  // ----- draw sky ----- \\
  void display() {
    // Create an alpha blended background
    fill(sky_r, sky_b, sky_g, 10);
    rect(0,0,width,height);
  
    // --------------- STARS --------------- \\
  
    stroke(random(200, 255), random(180, 255), random(220, 255)); // color
    float starweight = random(1, 4);
    if (starweight == 4) {
      large_stars += 1;
      if (large_stars % 6 != 0) {
        starweight = random(1, 2);
      }
    }
    strokeWeight(starweight);
    // draw one star every 20 frames
    if (frameCount % 20 == 0) {
      point(random(500), random(500));
    }
  
  }
}


// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------ STEM ------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\

// by Flo Wong

class Stem {
  
  // ---------- DATA ---------- \\
  
  // color for stem (pulsate R value)
  float rgb;
  float r;
    float r_f;
    float r_i;
  float g;
    float g_f;
    float g_i;
  float b;
    float b_f;
    float b_i;
  int colorGrow;
  
  float colorSpeed;
    float r_speed;
    float g_speed;
    float b_speed;
  
  // color for stem shadow (pulsate opacity)
  float shad_op;
  int shadow_grow;
  float shadow_speed; // or 0.005?
    
  // ---------- CONSTRUCTOR ---------- \\
  
  Stem() {
    
    // color for stem
    rgb = random(0,1);
    
    // from 208, 212, 232 to 211, 191, 173
    r_f = 208; //132
    r_i = 113; //95
    r = r_i + rgb*(r_f - r_i);
    
    g_f = 212;
    g_i = 109;
    g = g_i + rgb*(g_f - g_i);
    
    b_f = 232;
    b_i = 105;
    b = b_i + rgb*(b_f - b_i);
    
    colorGrow = 1;
    colorSpeed = 0.01;
      r_speed = colorSpeed*(r_f - r_i);
      g_speed = colorSpeed*(g_f - g_i);
      b_speed = colorSpeed*(b_f - b_i);
    
    // color for shadow
    shad_op = 30;
    shadow_grow = 1;
    shadow_speed = 1; // or 0.005?
  }
  
  
  // ---------- FUNCTIONS ---------- \\
      
  void pulsateColor() { // pulsate R value    
    // check R value of roots
    if (r > r_f) {
      colorGrow = 0;
    } else if (r < r_i) {
      colorGrow = 1;
    }
    // check if the r value of roots need to grow or shrink
    if (colorGrow == 1) {
      r += r_speed;
      g += g_speed;
      b += b_speed;
    } else if (colorGrow == 0) {
      r -= r_speed;
      g -= g_speed;
      b -= b_speed;
    }
  }
  
  void pulsateShadowColor() {
    // check intensity of shadow
     if (shad_op > 100) {
     shadow_grow = 0;
     } else if (shad_op < 40) {
     shadow_grow = 1;
     }
     // check if the shadows need to grow or shrink
     if (shadow_grow == 1) {
     shad_op += shadow_speed;
     } else if (shadow_grow == 0) {
     shad_op -= shadow_speed;
     }
  }
  
  void display(int x, int y) {
    fill(r, g, b);
    quad(x, y, x-4, y+200, x, y+200-10, x+4, y+200);
  }
  
  void displayShadow(int x, int y) {
    fill(50, 50, 50, shad_op);
    // for trunk shading // INVESTIGATE & FIX SOMEHOW
    quad(x, y+200, x-4, y+200, x, y+200-10, x+4, y+200);

    // for the actual shadow
    quad(12000, 9000, x-4, y+200, x, y+200-10, x+4, y+200);
  }
}
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------ TREE ------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
class Tree {
  
  // ---------- DATA ---------- \\
  Stem stem;
  Leaf leaf;
  
  // location (for tip of stem; leaf point)
  int x;
  int y;
  
  // colors for leaf 
  float leaf_r;
  float leaf_g;
  float leaf_b;
  
  // ---------- CONSTRUCTOR ---------- \\
  
  Tree(int tree_x, int tree_y) {
    
    // leaf color values for shades of orange
    leaf_r = random(240, 255);
    leaf_g = random(70, 235);
    leaf_b = random(50, 52);
    
    stem = new Stem();
    leaf = new Leaf(leaf_r, leaf_g, leaf_b);
    
    x = tree_x;
    y = tree_y;
  }
  
  
  // ---------- FUNCTIONS ---------- \\
  void pulsate() {
    stem.pulsateColor();
    stem.pulsateShadowColor();
    leaf.pulsateColor();
    leaf.pulsateSize();
  }
      
  // ---------- Draw Stem & Leaf ---------- \\
  void display() {
    stem.displayShadow(x, y);
    stem.display(x, y);
    leaf.display(x, y);
    
  }
}



// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------ MAIN ------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\
// ------------------------------------------------------------ \\




// --------------- INITIALIZE VARIABLES --------------- \\

Sky sky;
Moon moon;
Land land;
ArrayList<Tree> trees;
int trees_count = 50;

// --------------- SETUP --------------- \\

void setup() {
  size(500, 500);
  ellipseMode(CENTER);
  frameRate(30);
  smooth();
  
  // ---------- Sky ----------- \\
  sky = new Sky();
  
  
  // ---------- Land ---------- \\
  land = new Land();
  
  
  // ---------- Moon ---------- \\
  moon = new Moon();
  
  
  // ---------- Trees ---------- \\
  trees = new ArrayList<Tree>();
  
  // establish random location coordinates for trees
  for (int i = 0; i < trees_count; i+=1) {
    int tree_x = int(random(0, 500));
    int tree_y = int(random(170, 300));
    // maybe use some sort of parabola function for tree_y: 150 to (200 to 300) to 400
    trees.add(new Tree(tree_x, tree_y));
  }
}

void draw() {
  
  // --------------- SKY --------------- \\
  sky.transition();
  sky.display();
  
  // --------------- MOON --------------- \\
  moon.move();
  moon.shrink();
  moon.pulsateSize();
  moon.pulsateColor();
  moon.display();

  // --------------- GREEN LAND PASTURE --------------- \\
  land.pulsateColor();
  land.pulsateSize();
  land.display();

  // --------------- TREES --------------- \\
  
  // traverse through trees
  for (int i = 0; i < trees_count; i+=1) {
    Tree tree = trees.get(i);

    tree.pulsate();
    
    tree.display();
  }
  
}