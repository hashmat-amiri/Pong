import java.util.Random;

Ball ball;
Paddle paddle;
GameOver gameOver;
Brick brick;
boolean isGameOver;
boolean right, left;
int score;
int scoreSize;
int size;
Brick[][] bricks = new Brick[6][6];
Random randNumber = new Random();
// Figure out, why you don't need to remove the 2D array elements before creating new ones.


void setup() {
  size(650, 600);
  ball = new Ball(width/2 - 50, height/2);
  paddle = new Paddle(width/2 - 50, 550);
  gameOver = new GameOver();
  brick = new Brick(12, 12);
  buildBricks(bricks);
}

void draw() {
  background(0);
  ball.draw();
  paddle.draw(); 
  textSize(20);
  text(score, 500, 500);
  brickTouchesBall(); 
  gameOver.score(score, size);
  
  if(mousePressed) {
    if(gameOver.restartGame() || gameOver.score(score, size)){
    ball = new Ball(width/2 - 50, height/2);
    ball.ballX +=  ball.moveBallX;
    ball.ballY +=  ball.moveBallY;
    score = 0;
    buildBricks(bricks);
    isGameOver = false;
    }
  }
}

void brickTouchesBall(){
  for(Brick[] elem: bricks){
    for(Brick brick: elem){
      brick.draw();
      if(brick.touches(ball.ballX, ball.ballY)){
      ball.moveBallY = ball.moveBallY * -1;
      score++;
      }
    }
  }
}

 void buildBricks(Brick[][] myBricks){
   int getLength = 0;
   for(int x = 0; x < myBricks.length; x++){
       for(int y = 0; y < myBricks[x].length; y++){
         myBricks[x][y] = new Brick(x*110,y*30);
         getLength++;
       }
   } 
   size = getLength;
 }
 
 static ArrayList<Brick> copyOfBricks(ArrayList<Brick> brick){  //Why can't I use these copies to build a new wall ????
   return (ArrayList<Brick>) brick.clone();
 }
 
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT){
      right = true;
    } else if (keyCode == LEFT)  {
      left = true;
    }
  }
}

void keyReleased(){
  if (key == CODED) {
    if (keyCode == RIGHT) {
      right = false;
    } else if (keyCode == LEFT) {
      left = false;
    }
  }
}
