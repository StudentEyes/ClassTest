
// This is the tab that holds both the PVector class along with the Collision for the Platforms and Ground.
class Player { //Player Class, in hindsight I should probably rename this to 'Jumping' to match with the tab, but whatever lol
//PVECTOR SET UP//
  PVector position; //Player Position
  PVector velocity; //Player Velocity
  PVector acceleration; //Player Acceleration

  float r = 10; // Radius of Player Ball
  boolean onPlatform; //

//Gravity mechanic I took inspiration from an example shown in class!
  Player(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0.5); // Acceleration for the actual gravity.
  }

  void update() {
    
    // PLAYER MOVEMENT //
    if (keyPressed) {
      if (keyCode == LEFT) {
        velocity.x = -3; //Velocity of player when 'LEFT' key is pressed.
      } 
      else if (keyCode == RIGHT) {
        velocity.x = 3; //Velocity of player when 'RIGHT' key is pressed.
      }
    } else {
      velocity.x = 0; //When not moving, Base Velocity is set to 0.
    }

    // General motion section.
    velocity.add(acceleration); //Add Acceleration to Velocity.
    position.add(velocity); //Add Velocity to Position.
  }
  

  
 void checkPlatform(float px, float py, float pw, float ph) {

   //I added 'p' in front of them to stand for 'Platform', since they're associated with them.
    float left = px; //Check the left of the platform
    float right = px + pw; //Check the right of the platform
    float top = py; //Check the top of the platform
    float bottom = py + ph; //Check the bottom of the platform

    // PLATFORM COLLISION //
    
    //Platform Top Collision
    if (
      velocity.y > 0 &&
      position.x + r > left && position.x - r < right &&
      position.y + r >= top &&
      position.y + r <= top + velocity.y + 1
    ) {
      position.y = top - r;
      velocity.y = 0;
      onPlatform = true;
    }

    //Platform Bottom Collision
    else if (
      velocity.y < 0 &&
      position.x > left && position.x < right &&
      position.y - r < bottom && position.y - r > bottom - 10
    ) {
      position.y = bottom + r;
      velocity.y = 0;
    }

    //Platform Left side Collision
    else if (
      velocity.x > 0 &&
      position.y > top && position.y < bottom &&
      position.x + r > left && position.x + r < left + 10
    ) {
      position.x = left - r;
      velocity.x = 0;
    }

    //Platform Right side Collision
    else if (
      velocity.x < 0 &&
      position.y > top && position.y < bottom &&
      position.x - r < right && position.x - r > right - 10
    ) {
      position.x = right + r;
      velocity.x = 0;
    }
  }

//Jumping Code
  void jump() {
    if (key == ' ' && onPlatform) { //Set the key for jumping as space. Wanted to do the Up Arrow but I forgot what key that would be for.
      velocity.y = -10; //Have the Velocity be negative to be able to go up.
    }
  }

//Appearance of the Player/Ball.
  void display() {
    fill(#5983C9); //Set Player Ball to a Dark Blue
    ellipse(position.x, position.y, r*2, r*2); //Set Player Shape and Size
  }
}
