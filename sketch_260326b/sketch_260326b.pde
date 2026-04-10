Player player; //Class for the Player

// TEST PLATFORM SET UP //
float x = 50; //Platform Placement
float y = 280; //Platform Placement.
float w = 50; //Platform Width
float h = 10; //Platform Height

float groundY = 350; //Placement of the Ground, 

void setup() {
  size(600, 400); //Set Canvas Size
  player = new Player(200, groundY); //Player Placement!
}

void draw() {
  background(200); //Set background colour to just a light grey.
  
  // GROUND & PLATFORM SHAPE SET UP //
  //Ground.
  fill(100); //Set Floor colour to a dark grey.
  rect(0, groundY, width, 300); //Set ground Parameters.
  
  // Test Platforms
  fill(150); //Set Test Platform colour to a slightly less dark grey.
  rect(x, y, w, h); //Platform 1 Parameters, being the same at the very top under 'Test Platform Set up'
  rect(200, 250, w, h); //Platform 2 Parameters, realized I could make multiple but placed differently, lol.
  
  player.update(); //update player display.
  player.checkGround(groundY); //Check if the player is on the ground.
  player.checkPlatform(x, y, w, h); //Check if the player is on Test Platform 1
  player.checkPlatform(200, 250, w, h); //Check if the player is on Test Platform 2
  player.display(); //Display the player.
}

void keyPressed() { //Check if a key has been pressed. Being the Space Key
  player.jump();
}
