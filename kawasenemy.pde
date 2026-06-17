PFont myFont;
final static int N_ENEMIES = 10;
Enemy[] enemies;
Player player;

void setup() {
  size(800, 800);
  
  myFont = createFont("Arial", 64);
  textAlign(CENTER, CENTER);
  textFont(myFont, 32);
  textSize(20);
  
  enemies = new Enemy[N_ENEMIES];
  player = new Player();
  
  for (int k = 0; k < enemies.length; k++) {
    int enemyID = (int)random(2);
    int xpos = (int)random(800);
    int ypos = (int)random(800);
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
}

void draw() {
  background(240);
  rectMode(CENTER);
  
  for (int k = 0; k < enemies.length; k++) {
    enemies[k].update(player);
  }
  player.update();
  
  for (int k = 0; k < enemies.length; k++) {
    enemies[k].draw(g);
  }
  player.draw(g);
  
  fill(0, 0, 0);
  text("HP: " + player.currentLife, width - 50, 20);
  
  drawDirButton();
}

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
 
void drawDirButton() {
  PVector buttonOrigin = new PVector(width / 8.0, height / 8.0);
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
