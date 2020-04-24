//the input code got too confusing for the rest of the sort to be in the same file
/*relevant variables from ArraySortVisualiser
  Array inputArray;
  ArrayEntry min;
  ArrayEntry max;
  ArrayEntry range;
  Array frequencyArray;
*/
void sortSetup() {
  //yay recycling global variables
  inputArray = new Array (pigeonHoleInputArray);
  min = new ArrayEntry("min", pigeonHoleInputArray[0]);
  max = new ArrayEntry("max", pigeonHoleInputArray[0]);
}
void drawArrow(int x, int y, int length, String direction) {
  strokeWeight(4);
  stroke(255);
  line(x, y, x, y+length);
  if (direction.toLowerCase().equals("up")) {
    triangle(x-5*Math.max((length/100), 1), y, x+5*Math.max((length/100), 1), y, x, y-10*Math.max((length/100), 1)); //tried to scale the arrow tip appropriately
  }
  if (direction.toLowerCase().equals("down")) {
    triangle(x-5*Math.max((length/100), 1), y+length, x+5*Math.max((length/100), 1), y+length, x, y+length+10*Math.max((length/100), 1));
  }
}

int curIndex = 0;
int startIndex = 0; //start index of the current segment of the array we are displaying
void findMaxMin() {
  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("Pigeonhole Sort", 800, 130);
  textSize(25);
  fill(255);
  textAlign(LEFT);
  text("Press any key to continue", 50, 50);
  textAlign(RIGHT);
  text("Press any key to continue", 1550, 50);
  if (keyPressed || mousePressed) {
    curIndex++;
  }
  
  textSize(25);
  text("input", 800, 170); //i really should've made a name variable for the Array class...
  inputArray.displayWhole(800-55*(inputArray.array.size()/2), 200);
  inputArray.displayNextFive(startIndex, 250, 400);
  min.display(100, 750);
  max.display(310, 750);
  
  if (curIndex<inputArray.array.size()) { //i could just make a length variable for inputArray...
    if (curIndex>=inputArray.prevDisplayNextFiveStartIndex+5) { //at this point i stop trying to make my code look organized
      startIndex+=5;
    }
    drawArrow(350+210*(curIndex-startIndex), 650, 50, "up");
    int temp = inputArray.array.get(curIndex).value;
    if (temp < min.value) {
      min.value = temp;
    }
    if (temp > max.value) {
      max.value = temp;
    }
  }
  else {
    sortState = 2;
    inputArray.prevDisplayNextFiveStartIndex = -1; //making sure that none of the squares are red now
  }
}

int rangeState = 0; //another state variable lol
void findRange() {
  //yay more repeated code
  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("Pigeonhole Sort", 800, 130);
  textSize(25);
  fill(255);
  textAlign(LEFT);
  text("Press any key to continue", 50, 50);
  textAlign(RIGHT);
  text("Press any key to continue", 1550, 50);
  if (keyPressed || mousePressed) {
    rangeState++;
  }
  min.display(595, 250);
  max.display(805, 250);
  drawArrow(800, 500, 150, "down");
  if (rangeState == 1) {
    range = new ArrayEntry("range", max.value-min.value+1);
    range.display(700, 720);
  }
  if (rangeState == 2) {
    sortState++;
  }
}
