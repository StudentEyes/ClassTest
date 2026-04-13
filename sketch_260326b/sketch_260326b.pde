Player player; //Class for the Player
boolean gameOver = false; //The Game Over Screen! It's currently not on at the moment.
boolean gameWon = false; //The ending screen for if you make it to the end!

// PLATFORM SET UP //
int totalPlatforms = 8;
Platform[] platforms;

// CLOUD ARRAY SET UP //
float[] cx; //I set both of these as cx and cy respectfully so that they'd be able to work seperately from the platforms.
float[] cy;
int total = 15; //Number of clouds supposed to appear.

// VOID SETUP //
void setup() {
  size(600, 400); //Set Canvas Size
  frameRate(60); //Set Frame rate
  noStroke(); //Set it so that there's no lines in the shapes. Only the fill.

  player = new Player(25, 200); //Player Placement!
  makePlatforms(); // Code for Function to randomly place more Platforms
  
 //Clouds
  cx = new float[total]; //Clouds x axis
  cy = new float[total]; //Clouds y axis

 //Random Clouds
  for (int i = 0; i < total; i++){
    cx[i] = random(width);
    cy[i] = random(10, 50);
  }

 
}

  // PLATFORM DETAILS //
  // This was incredibly annoying to figure out oh my god I had to go through so much trial and error.
  
void makePlatforms() {
   platforms = new Platform[totalPlatforms];

  platforms[0] = new Platform(0, 310, 80, 10);
  platforms[1] = new Platform(550, 250, 80, 10);

  for (int pi = 2; pi < totalPlatforms; pi++) {
    float x = random(width - 80);
    float y = random(150, 350);
    float w = 60;
    float h = 10;

    platforms[pi] = new Platform(x, y, w, h);
  }
}
  
// VOID DRAW SET UP //
void draw() {

  rectMode(CORNER);
  fill(150);
  rect(560, 570, 60, 10);
  
  if (!gameOver && !gameWon) { //If not in the Game over or Game Won screen
    background(#84C4F7); //Set background Colour to a Light Blue

     fill(255);//Set Cloud Colour to White
  for(int i = 0; i < total; i++){
    ellipse(cx[i], cy[i], 30, 20);
    ellipse(cx[i] - 10, cy[i], 20, 15);
    ellipse(cx[i] + 10, cy[i], 20, 15);
  }

    player.update(); //Update Player Location.
  player.onPlatform = false; //To remind code for when the player isn't touching the platform.

    rectMode(CORNER); //Set shape mode to Corner

    for (int pi = 0; pi < platforms.length; pi++) {
      platforms[pi].display();

      player.checkPlatform(
        platforms[pi].x,
        platforms[pi].y,
        platforms[pi].w,
        platforms[pi].h
      );
    }

    player.display(); //Display the Player.

    if (player.position.y > 400) { //Has the Player fallen past 400?
      gameOver = true; //If they have, the Game Over Screen pops up
    }

// GAME WON SECTION //
    Platform finish = platforms[1];

// If the player enters the Hitbox of the Finish Line Platform
    if (
      player.position.x > finish.x &&
      player.position.x < finish.x + finish.w &&
      player.position.y + player.r >= finish.y &&
      player.position.y - player.r <= finish.y + finish.h
    ) {
      gameWon = true; //The Game Won screen will pop up with the Platform is hit!
    }

// GAME WON SCREEN DETAILS //
  } 
  else if (gameWon) {
    background(#ADD9EA); //Set background to pale blue

    fill(255); //Set text colour to white
    textAlign(CENTER); //Make the text centered.
    textSize(42); //Set Font Size
    text("LEVEL WON! RESTART? [R]", width/2, height/2); //Set Text sentence
 
  } 
  else if (gameOver) {
    background(#021139);

    fill(255); //Make text white
    textAlign(CENTER); //Make the text Centered.
    textSize(42); //Set Font Size
    text("YOU FELL. RESTART? [R]", width/2, height/2); //Set Text to mimic a Game Over screen,
  }
}

//Restart Game Function Details
void restartGame() { 
  player = new Player(25, 200); //When restarting, set new player.
  makePlatforms(); //When Restarting, generate new platforms.
  gameOver = false; //When Restarting, set GameOver to False.
  gameWon = false; //When Restarting, set GameWon to False.
}

void keyPressed() {
  if ((key == 'r' || key == 'R') && (gameOver || gameWon)) { //When either 'r' or 'R' are pressed on either the Game Over or Game Won screen, restart the game.
    restartGame();
  } 
  else if (key == ' ') { //Set Space Key as the jumping button.
    player.jump();
  }
}
