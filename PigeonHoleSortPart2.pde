/*relevant variables from ArraySortVisualiser
  Array inputArray;
  ArrayEntry min;
  ArrayEntry max;
  ArrayEntry range;
  Array frequencyArray;
*/
void sortSetup2() {
  ArrayEntry [] frequency = new ArrayEntry [range.value];
  for (int x=min.value; x<=max.value; x++) {
    frequency[x-min.value] = new ArrayEntry (x, 0);
  }
  frequencyArray = new Array (frequency);
  
  //recycling the curIndex and startIndex from PigeonholeSort
  curIndex = 0;
  startIndex = inputArray.array.get(0).value-min.value; //start out at the value of the first index in the input array (ok nvm this doesn't work)
}

boolean added = false; //yay another flag (this one makes sure that every number is only added once)
void findFrequency() {
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
    added = false;
  }
  
  textSize(25);
  text("input", 800, 170);
  inputArray.displayWhole(800-55*(inputArray.array.size()/2), 200);
  min.displaySmall(1300, 100, false);
  max.displaySmall(1360, 100, false);
  range.displaySmall(1420, 100, false);
  textAlign(CENTER);
  textSize(25);
  text("frequency", 800, 820);
  frequencyArray.displayWhole(25, 930);
  frequencyArray.displayNextFive(startIndex, 250, 450);
  
  if (curIndex<inputArray.array.size()) {
    //self depricating comments somehow increase my motivation
    drawArrow(825-55*(inputArray.array.size()/2)+55*(curIndex), 270, 50, "up");
    int curValue = inputArray.array.get(curIndex).value;
    startIndex = ((curValue-min.value)/5) * 5; //well that worked
    if (!added) {
      frequencyArray.array.get(curValue-min.value).value++; 
      added = true;
    }
  }
  else {
    sortState = 4;
    //reset again
    curIndex = 0;
    startIndex = 0;
    added = false;
  }
}

Array sortedArray = new Array (new int [0]);
void printSorted() {
  sortedArray.prevDisplayNextFiveStartIndex = -1; //to make sure none of sortedArray is red
  
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
    added = false;
  }
  textAlign(CENTER);
  text("frequency", 800, 250);
  frequencyArray.displayWhole(25, 360);
  frequencyArray.displayNextFive(startIndex, 250, 500);
  textSize(25);
  text("sorted", 800, 800);
  sortedArray.displayWhole(25, 850);
  
  if (curIndex<frequencyArray.array.size()) { //woo last one
    //why is this taking me so long
    startIndex = ((curIndex)/5) * 5; //integer arithmetic is wack
    drawArrow(350+210*(curIndex-startIndex), 650, 50, "up");
    if (!added) {
      for (int x=0; x<frequencyArray.array.get(curIndex).value; x++) {
        sortedArray.array.add(new ArrayEntry(sortedArray.array.size(), Integer.parseInt(frequencyArray.array.get(curIndex).index)));
        //could i have made an ArrayEntry object to shorten the code here? yes. but at this point i don't care anymore
      }
      added = true;
    }
  }
  else {
    sortState = 5;
  }
}
