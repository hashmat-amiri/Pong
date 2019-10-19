public class Paddle  {
  
  private int paddleY;
  private int paddleX;
  private int paddleSizeX = 100;
  private int paddleSizeY = 10;  
  private int movePaddleX = 10;
  
  Paddle(int xPosition,int yPosition){
    this.paddleX = xPosition;
    this.paddleY = yPosition;
  }
 
  private void CreatePaddle () {
    rect(paddleX, paddleY, paddleSizeX, paddleSizeY);
  }

  private void MovePaddle() {
    if (right) {
      paddleX += movePaddleX;
    } else if (left) {
      paddleX -= movePaddleX;
    }
  }

  private void RestrictPaddle() {
    if (paddleX + 100  > width ) {
      paddleX = paddleX - movePaddleX;
    } else if (paddleX < 0) {
      paddleX = paddleX + movePaddleX;
    }
  }

  private void BallTouchPaddle(){
    if (ball.ballY + 10 > paddleY - 5 && ball.ballY - 10 < paddleY + 5 && ball.ballX + 10 > paddleX && ball.ballX - 10 < paddleX + 100 ){
      ball.moveBallY = -ball.moveBallY;
    }
  }
  
  void draw() {
    CreatePaddle(); 
    MovePaddle();
    RestrictPaddle();
    BallTouchPaddle();
  }
}
