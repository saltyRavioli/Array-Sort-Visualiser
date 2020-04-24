//ok so originally this file was only to test stuff but then i conveniently ended up writing the if structure for controlling the stages of the sort, so i guess this isn't a test file anymore
boolean hasSortSetupRun = false; //flag to make sure setup functions only run once
boolean hasSortSetup2Run = false;
void sort() {
  if (sortState == 0) {
    getInput();
  }
  else if (sortState == 1) {
    if (!hasSortSetupRun) {
      sortSetup();
      hasSortSetupRun = true;
    }
    findMaxMin();
  }
  else if (sortState == 2) {
    findRange();
  }
  else if (sortState == 3) {
    if (!hasSortSetup2Run) {
      sortSetup2();
      hasSortSetup2Run = true;
    }
    findFrequency();
  }
  else if (sortState == 4) {
    printSorted();
  }
  else if (sortState == 5) {
    textSize(35);
    text("The input array is:", 800, 200);
    inputArray.displayWhole(800-55*(inputArray.array.size()/2), 300);
    textSize(35);
    text("Your sorted array is:", 800, 500);
    sortedArray.displayWhole(800-55*(inputArray.array.size()/2), 600);
    textSize(50);
    fill(255);
    textAlign(CENTER);
    text("Press any key to continue", 800, 900);
    
    
    if (keyPressed||mousePressed) {
      programState = 0;
      //all my state variables are coming to get me
      sortState = 0;
      inputState = 0;
      rangeState = 0;
      //actually everything i didn't reset after i'm done with it is coming to get me
      input = "";
      numberOfNumbers = 0;
      numbersInputted = 0;
      numbersInputtedSoFar = ""; 
      curNumber = "";
      curIndex = 0;
      startIndex = 0; 
      sortedArray = new Array (new int [0]);
      hasSortSetupRun = false;
      hasSortSetup2Run = false;
      //ok now that should be it i think
    }
  }
}
