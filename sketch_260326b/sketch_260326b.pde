Player player; //Class for the Player

// PLATFORM SET UP //
int totalPlatforms = 10;
Platform[] platforms;


// CLOUD ARRAY SET UP //
float[] cx; //I set both of these as cx and cy respectfully so that they'd be able to work seperately from the platforms.
float[] cy;
int total = 15; //Number of clouds supposed to appear.

// VOID SETUP //
void setup() {
  size(600, 400); //Set Canvas Size
  frameRate(60);
  noStroke();
  
  player = new Player(25, 200); //Player Placement!
  
  //Clouds
  cx = new float[total]; //Clouds x axis
  cy = new float[total]; //Clouds y axis
  
  
  //Random Clouds
  for (int i = 0; i < total; i++){
    cx[i] = random(width);
    cy[i] = random(10, 50);
  }
  
  // PLATFORM DETAILS //
  // This was incredibly annoying to figure out oh my god I had to go through so much trial and error.
  
  platforms = new Platform[totalPlatforms];
  
  //Spawn Platform Detail
  platforms[0] = new Platform(0, 310, 80, 10); // Spawn Platform details to separate it from the Array and avoid being random.
  
  //Finishing Line Platform Detail
  platforms[1] = new Platform(550, 250, 80, 10); // Finishing Line Platform details to separate it from the Array and avoid being random.
  
  //Random Platforms
   for (int pi = 2; pi < totalPlatforms; pi++){
      float x = random(width - 80); //Platform Randomness across the x axis
      float y = random(150, 350); //Platform Randomness across the y axis
      float w = 60; //Platform Width. I was going to initially make this random, but I felt that that'd be too much.
      float h = 10; //Platform Height. Keeping it at 10 to keep it platform-like.
      
       platforms[pi] = new Platform(x, y, w, h); //
}
}

void draw() {
  background(#84C4F7); //Set background colour to just a light grey.
  
   fill(255);//Set Cloud Colour to White
  for(int i = 0; i < total; i++){
    ellipse(cx[i], cy[i], 30, 20);
    ellipse(cx[i] - 10, cy[i], 20, 15);
    ellipse(cx[i] + 10, cy[i], 20, 15);
  }
  
player.update(); //Update Player Location.
  
  player.onPlatform = false; //To remind code for when the player isn't touching the platform.
  
  rectMode(CORNER); //Set Shape mode to Corner
  
   for (int pi = 0; pi < platforms.length; pi++) {
    platforms[pi].display();

    player.checkPlatform( 
      platforms[pi].x,
      platforms[pi].y,
      platforms[pi].w,
      platforms[pi].h
    );
  }

 
  player.display(); //Display the player.
}

void keyPressed() { //Check if a key has been pressed. Being the Space Key
  player.jump();
}
