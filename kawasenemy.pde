PFont myFont;
final static int N_ENEMIES = 10;
Enemy[] enemies;
Player player;

int gameFrameCount;
int endFrame;

enum PlayerState{
  Dead,
  Alive,
}

PlayerState playerState;


void setup() {
  size(800, 800);
  
  myFont = createFont("Arial", 64);
  textAlign(CENTER, CENTER);
  textFont(myFont, 32);
  textSize(20);
  
  initGame();
}

void draw() {
  background(240);
  rectMode(CENTER);
  translate(400, 400);
  
  switch (playerState) {
    case Alive:
    
      for (int k = 0; k < enemies.length; k++) {
        enemies[k].update(player);
      }
      player.update();
      
      for (int k = 0; k < enemies.length; k++) {
        enemies[k].draw(g);
      }
      player.draw(g);
      
      fill(0, 0, 0);
      text("HP: " + player.currentLife, width / 2 * 0.5 , -height / 2 * 0.95);
      
      drawDirButton();
   
      countTime();
      changePlayerState();
      break;
    case Dead:
      showResult();
      break;
  }
}

void countTime(){
  String time = nf((float)gameFrameCount / 60.0,3, 3);
  // 時間のカウントを右上に表示
  fill(0, 0, 0);
  text("Time: "+ time  ,width / 2 * 0.8 , -height / 2 * 0.95);
  gameFrameCount += 1;
}

void showResult(){ 
  fill(0, 0, 0);
  String time = nf((float)endFrame / 60.0, 3, 3);
  text(time + "秒生き残りました．"  , 0, 0);
}

void initializeGameLater(){
  delay(2000);
  initGame();
}

void initGame(){
  enemies = new Enemy[N_ENEMIES];
  player = new Player();
  
  for (int k = 0; k < enemies.length; k++) {
    int enemyID = (int)random(2);
    int xpos = (int)random(-400, 400);
    int ypos = (int)random(-400, 400);
    PVector pos = new PVector(xpos, ypos);
    
    if (enemyID == 0) {  
      int life = 10;
      enemies[k] = new Zombie();
      enemies[k].init(life, pos);

    } else if (enemyID == 1) {
      int life = 5;
      enemies[k] = new Slime();
          enemies[k].init(life, pos);
    }    
  }
   playerState = PlayerState.Alive;
};


void changePlayerState(){
  if (player.currentLife == 0){
    
    playerState = PlayerState.Dead;
    endFrame = gameFrameCount;
    thread("initializeGameLater");
  }
}


boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
 
void drawDirButton() {
  PVector buttonOrigin = new PVector(- width / 2.5, - height / 2.5);
  boolean[] buttonStates = new boolean[] {upPressed, downPressed, leftPressed, rightPressed};
  PVector[] dirs = new PVector[] {
    new PVector(0, -32),
    new PVector(0, 32),
    new PVector(-32, 0),
    new PVector(32, 0),
  };
  
  for (int k = 0; k < 4; k++) {
    PVector buttonPos = buttonOrigin.copy().add(dirs[k]);
    if (buttonStates[k]) {
      fill(32);
    } else {
      fill(248);
    }
    circle(buttonPos.x, buttonPos.y, 16);
  }
}

void keyPressed() {
  if (keyCode == UP) {
    upPressed = true;
  }
  if (keyCode == DOWN) {
    downPressed = true;
  }
  if (keyCode == LEFT) {
    leftPressed = true; 
  }
  if (keyCode == RIGHT) {
    rightPressed = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    upPressed = false;
  }
  if (keyCode == DOWN) {
    downPressed = false;
  }
  if (keyCode == LEFT) {
    leftPressed = false; 
  }
  if (keyCode == RIGHT) {
    rightPressed = false;
  }
}
