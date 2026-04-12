class Platform { //Platform Class

// Float 
  float x; 
  float y;
  float w;
  float h;

// Platform Details //
  Platform(float startX, float startY, float width, float height) { 
    x = startX; 
    y = startY; 
    w = width;
    h = height;
  }

  void display() {
    fill(#835639); //Set Platform Colour to a grey.
    rect(x, y, w, h); //Platform Shape
    fill(#5A9363); //Set Grass half of Platform to green
    rect(x, y, w, 2); //Grass shape
  }
}
