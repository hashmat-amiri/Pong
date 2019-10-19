public class Ball{
  
  int ballX;
  int ballY;
  int ballSizeX = 15;
  int ballSizeY = 15; 
  int moveBallX;
  int moveBallY = 12;
 
 Ball(int x, int y){
   ballX = x;
   ballY = y;
   
   moveBallX = randNumber.nextInt(8);
   moveBallX++; 
  }
   
  void CreateBall(){  
    ellipse(ballX, ballY, ballSizeX, ballSizeY);
  }
  
  void BallMove() {
    ballX = ballX + moveBallX;
    ballY = ballY + moveBallY;
    
    if(ballX + 10 >= width || ballX - 10 <= 0)  {
      moveBallX = moveBallX * -1;
    } else if(ballY - 10 <= 0 ) {
      moveBallY = moveBallY * -1;
    } 
  }
 
 void showText(){
    if(gameOver.gameOver(ballY)) {
     texts();
     moveBallY = 0;
     moveBallX = 0;
    }
   }
   
   void texts(){
     textAlign(CENTER);
     textSize(20);
     text("Game Over", width/2 , height/2); 
     textSize(30);
     fill(102, 255, 51);
     text("Click to Play Again", width/2 , height/2 - 50 );
     fill(255);
    }
     
  void draw(){
      CreateBall();
      BallMove();
      showText();
    }
}
