// Program by Rupert Russell
// MIT Licence
// 23 June 2018
// Artwork avaiable on redbubble at: https://www.redbubble.com/people/rupertrussell/works/32360099-omg-cat-bounces-off-car-v001

// This program takes a set number of small tiles (100 x 100) pixels in size
// and uses them to make random 10 x 10 grids.

PImage imgB;  //  Create  variable to hold the "Black"  100 x 100 pixel tile
PImage imgW;  //  Create  variable to hold the "White"  100 x 100 pixel tile

// The small tiles are in 2 equal sets black and white
// the small black tiles are named in sequence eg b0.png to b24.png
// the small white tiles are named in sequence eg w0.png to w24.png
// make sure you have equal numbers of black and white tiles
int numberOfSmallTiles = 4;


int numOfColumns = 3; // Width:  see note on canvas size( ) below
int numOfRows = 3; // Height

int countdown = 0;
int countup = 0;

void setup() {
  // make the size of the canvas equal to 1000 x numOfColumns  , 1000 * numOfRows
  size(3000, 3000); // width x height of finished 10 x 10 grid x 2 x 2

  background(0);    // black brackground
  noLoop();         // don't repeat the draw section
}

void draw() {

  for (int y = 0; y < numOfRows; y ++) {
    countdown = numOfColumns - y;
    println("Row Number = " + y);
    if (y%2==0) {  // is the  row an even or odd number?
      startRowWhite(y, numOfColumns);
    } else {
      startRowBlack(y, numOfColumns);
    }

    countup++;
  }
  println("Saving");
  save(numOfColumns + "x" + numOfRows + ".png");  // save

  exit();
}

void startRowWhite(int row, int numOfColumns) {
  // draw a row of "numOfColumns" alternating White and Black 1000 x 1000 blocks
  // Start with a white block of 1000 x 1000
  // repeat until you reach numOfColumns

  for (int columnNumber = 0; columnNumber < numOfColumns; columnNumber ++) {
    println("columnNumber = " + columnNumber);
    if (columnNumber%2==0) {

      whiteTiles(columnNumber * 1000, row * 1000);
    } else {
      blackTiles(columnNumber * 1000, row * 1000);
    }
  }
}

void startRowBlack(int row, int numOfColumns) {
  // draw a row of "numOfColumns" alternating Black and White 1000 x 1000 blocks
  // Start with a Black block of 1000 x 1000
  // repeat until you reach numOfColumns

  for (int columnNumber = 0; columnNumber < numOfColumns; columnNumber ++) {
    println("columnNumber = " + columnNumber);
    if (columnNumber%2==0) {
      blackTiles(columnNumber * 1000, row * 1000);
    } else {
      whiteTiles(columnNumber * 1000, row * 1000);
    }
  }
}

void whiteTiles(float x, float y) {
  pushMatrix();
  translate(x, y);

  // 10 x 10 Gird of random white tiles
  for (int k = 0; k < 3; k++) { 
    for (int i = 0; i < 10; i = i + 1) {
      for (int j = 0; j < 10; j = j + 1) {
        imgW = loadImage("w" + floor(random(numberOfSmallTiles)) + ".png");  // load a random 100 x 100 pixel tile
        image(imgW, i * 100, j * 100);
      }
    }
  }
  popMatrix();
}


void blackTiles(float x, float y) {
  pushMatrix();
  translate(x, y);

  // 10 x 10 Gird of random white tiles
  for (int k = 0; k < 3; k++) { 
    for (int i = 0; i < 10; i = i + 1) {
      for (int j = 0; j < 10; j = j + 1) {
        imgB = loadImage("b"+ floor(random(numberOfSmallTiles)) + ".png");  // load a random 100 x 100 pixel tile
        image(imgB, i * 100, j * 100);
      }
    }
  }
  popMatrix();
}
