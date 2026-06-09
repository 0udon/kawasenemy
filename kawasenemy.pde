static int N = 10;
Enemy[] enemies;

void setup(){
  size(800, 800);
  enemies = new Enemy[N];
  
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
    enemies[k].update();
    enemies[k].draw(g);
  }
}
