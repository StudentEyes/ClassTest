Player player; //Class for the Player

// TEST PLATFORM SET UP //
float x = 50; //Platform Placement
float y = 280; //Platform Placement.
float w = 50; //Platform Width
float h = 10; //Platform Height

// Changed the Base spawn collision with something like the Platforms.


// CLOUD ARRAY SET UP //
float[] cx; //I set both of these as cx and cy respectfully so that they'd be able to work seperately from the platforms.
float[] cy;

int total = 15; //Number of clouds supposed to appear.

void setup() {
  size(600, 400); //Set Canvas Size
  player = new Player(25, 200); //Player Placement!
  frameRate(60);
  noStroke();
  
  cx = new float[total];
  cy = new float[total];
  
  for (int i = 0; i < total; i++){
    cx[i] = random(width);
    cy[i] = random(10, 50);
  }
}

void draw() {
  background(#84C4F7); //Set background colour to just a light grey.
  
  // CLOUDS & PLATFORM SHAPE SET UP //
 
  
  // Test Platforms
  fill(150); //Set Test Platform colour to a slightly less dark grey.
  rect(x, y, w, h); //Platform 1 Parameters, being the same at the very top under 'Test Platform Set up'
  rect(550, 250, w, h); //Ending Platform Parameters, realized I could make multiple but placed differently, lol.
  rect(0, 310, w, h); //Spawning Platform Parameters.
  
  // Clouds
  fill(255); //Cloud Colour
  for(int i = 0; i < total; i++){
    ellipse(cx[i], cy[i], 30, 20);
    ellipse(cx[i] - 10, cy[i], 20, 15);
    ellipse(cx[i] + 10, cy[i], 20, 15);
  }
  player.update(); //update player display.
  player.checkPlatform(x, y, w, h); //Check if the player is on Test Platform 1
  player.checkPlatform(550, 250, w, h); //Check if the player is on Test Platform 2
  player.checkPlatform(0, 310, w, h);
  player.display(); //Display the player.
}

void keyPressed() { //Check if a key has been pressed. Being the Space Key
  player.jump();
}
