//Okay let's get this planning onto the road.

//SET UP//
//Set up code such as setting the Canvas Size, the Background colours, and so on.
float[] x;
float[] y;

int total = 15;

void setup(){
  size(600, 400);
  frameRate(30);
  
  x = new float[total];
  y = new float[total];
  
  for (int i = 0; i < total; i++) {
    x[i] = random(width);
    y[i] = random(10, 50);
  }
  noStroke();
}

void draw(){
  background(#65BFFA);
  
//STARTING PLATFORM//
//Code where I'd put the Starter platform.
rectMode(CORNERS);
fill(#8B5330);
rect(5, 250, 60, 265);
fill(#73AA6A);
rect(5, 250, 60, 255);
//Code where I put the Finish Platform
fill(#8B5330);
rect(540, 250, 595, 265);
fill(#73AA6A);
rect(540, 250, 595, 255);

fill(255);
for(int i = 0; i < total; i++) {
  ellipse(x[i], y[i], 30, 20);
  ellipse(x[i] - 10, y[i], 20, 15);
  ellipse(x[i] + 10, y[i], 20, 15);
}
}


//FINISH LINE PLATFORM//
//Code for the Platform that the Finish Line/Flag would be on, along with the Finish line/flag itself.

//PLAYER CODE//
//Code to detail the players ability to jump and move. Good chance some will be here with the Class Tab.

//CLOUD ARRAY CODE//
//Decided to add a Cloud Array for detail purposes.

//PLATFORM ARRAY CODE//
//Code for leftover Platform Array stuff from the main page.

//LEFTOVER CODE//
//Anything more that needs to be added for it to work, that I'm not thinking of.
