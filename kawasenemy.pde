PFont myFont;
static int N = 10;
Enemy[] enemies;
Player player;

void setup(){
  size(800, 800);
  myFont = createFont("Arial", 64);
  textAlign(CENTER, CENTER);
  textFont(myFont, 32);
  textSize(20);
  
  enemies = new Enemy[N];
  player = new Player();
  
  for(int k = 0; k < enemies.length; k++){
    int select = (int)random(2);
    
    if(select == 0) {  
      enemies[k] = new Zombie();
    }else if(select == 1) {
      enemies[k] = new Slime();
    }
    
    int posx = (int)random(800);
    int posy = (int)random(800);
    PVector pos = new PVector(posx, posy);
    enemies[k].init(10, pos);
  }
}

void draw(){
  background(255);
  for(int k = 0; k < enemies.length; k++){
    enemies[k].update(player);
  }
  player.update();
  
  for(int k = 0; k < enemies.length; k++){
    enemies[k].draw(g);
  }
  player.draw(g);
  
  fill(0, 0, 0);
  text("HP: " + player.health, width - 50, 20);
}
