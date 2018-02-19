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
    if ((greenval < 100) && (greenval_shrink == false)) {
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


// ------------------- OLD CODE ------------------- \\
      // before object-oriented programming \\
  /* 
  !!!LAND!!!
  // set color
  noStroke();
  fill(150 - land_g, 150, 150 - 0.6 * land_g); // green ish

  if ((land_g < 100) && (decreasing == false)) {
    land_g += 1;
  } else if (land_g > 1) {
    decreasing = true;
    land_g -= 1;
  } else { // green == 1
    decreasing = false;
  }

  // draw shape

  float ht_diff = 50;
  float ht_i = 200;

  if ((sky_r > sky_rf) && (sky_b > sky_bf) && (sky_g > sky_gf)) { // wait until sky has finished changing colors
    land_height = 200;
    frame_count_end = frame_count;
  } else {
    float landsize_speed = 0.5 * (frame_count - frame_count_end);
    if (landsize_speed % (ht_diff * 2) < ht_diff) {
      increasing_size = false;
      land_height = ht_i - (landsize_speed % ht_diff);
    } else {
      increasing_size = true;
      land_height = (ht_i - ht_diff) + (landsize_speed % ht_diff);
    }
  }
  ellipse(200, 440, 1200, land_height); // x, y, width, height (150 to 200)
*/