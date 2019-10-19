public class Brick {
  
  int brickX;
  int brickY;;
  boolean isVisible = true;

  Brick(int newX, int newY){
    brickX = newX;
    brickY = newY;
  }
  
 public boolean touches(float ballX, float ballY){
    if(!isVisible)
    return false;
    
    if(ballY > brickY && ballY < brickY + 30){
     if(ballX < brickX + 110 && ballX > brickX){
       println("Brick has been touched") ;
      isVisible = false;
      return true;
     }
    }
    return false;
  }
  
  void draw() {
    if(isVisible){
      strokeWeight(1);
      stroke(255);
      rect(brickX, brickY, 100, 20);
    }
  }
}
