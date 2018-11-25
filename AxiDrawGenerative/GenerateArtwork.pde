
void makeShapes(float startX, float startY, int shapeCount) {
  int shapeNumber = 0;
  while(shapeNumber < shapeCount) 
  {
    //makeRectangle(startX,startY);
    //makeTriangle(startX, startY, 30);
    //makeCircle(startX+random(-20,20), startY+random(-20,20),50);
    makeCircle(startX, startY, 50);
    shapeNumber++;
  }
}

void makeRectangles(float startX, float startY, int rectangleCount) {
  int rectangleNumber = 0;
  while(rectangleNumber < rectangleCount) 
  {
    makeRectangle(startX+random(-20,20), startY+random(-20,20));
    rectangleNumber++;
  }
}

void makeShapeGrid(int rowCount, int columnCount, int numShapes) {
  float firstX = mouseX;
  float firstY = mouseY; 
  float xPos = firstX;
  float yPos = firstY;
  
  int spacerSize = 90;
  
  int rowNumber = 0;
  int columnNumber = 0;
  
  while(columnNumber < columnCount) 
  {
    while(rowNumber < rowCount) 
    {
      raisePen();
      makeShapes(xPos, yPos, numShapes);
      yPos = firstY + (rowNumber+1)*spacerSize;
      rowNumber++;
    }
    yPos = firstY;
    xPos = firstX + (columnNumber+1)*spacerSize;
    columnNumber++;
    rowNumber = 0;
  }
  

}

// helper functions
void dropPen() {
   ToDoList = (PVector[]) append(ToDoList, new PVector(-31, 0)); //Command 31 (lower pen)
}

void raisePen() {
   ToDoList = (PVector[]) append(ToDoList, new PVector(-30, 0)); //Command 30 (raise pen)
}

void generateArtwork()
{
  float xStart = mouseX;
  float yStart = mouseY;
  float xPos = xStart;
  float yPos = yStart;
  
  raisePen();

  ToDoList = (PVector[]) append(ToDoList, new PVector(xPos, yPos)); // move to first point
  
  dropPen();
 
  makeShapeGrid(4,4,7);
 
}
