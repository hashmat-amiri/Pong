public class GameOver{

  public void setGameOver(boolean newGameOver){
    isGameOver = (newGameOver) ? true : false;
  }
  
  public boolean getGameOver(){
    return isGameOver;
  }
  
  public boolean gameOver(float ballY){ 
    if(ballY + 10 >= height) {
      setGameOver(true);
      return true;
    }
    return false;
  }
  
  public boolean restartGame(){
    if(getGameOver())
        return true;
   return false;
  }
  
  public boolean score(int heighScore, int arraySize){
     if(heighScore >= arraySize){
       setGameOver(false);
       textAlign(CENTER);
       text("Mission Completed", width/2, height/2 + 50);
       textSize(30);
       fill(102, 255, 51);
       text("Next Level", width/2, height/2);
       fill(255);
       ball.moveBallX = 0;
       ball.moveBallY = 0;
       return true;
     } 
    return false;
  }
  
}
