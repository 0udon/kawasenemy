class Player {
  int health;
  PVector position;
  float speed;
  float radius;
  float coolTime = 500; // ms
  float damageTime;
  float elapsedTime;
  boolean isDamageAcceptable = true;

  Player() {
    health = 20;
    position = new PVector(width / 2, height / 2);  // 画面中央
    speed = 5;
    radius = 5;
  }
  
  void update() {
    if(keyPressed) {
      if(keyCode == UP) {
        position.y = (position.y - speed + height) % height;
      } 
      if(keyCode == DOWN) {
        position.y = (position.y + speed) % height;
      }
      if(keyCode == RIGHT) {
        position.x = (position.x + speed) % width;
      }
      if(keyCode == LEFT) {
        position.x = (position.x - speed + width) % width;
      }
    }
  }
  
  void draw(PGraphics g) {
    g.fill(255, 0, 0, 200);
    g.rect(position.x, position.y, 10, 10);
  }
  
  void damage() {
    if(isDamageAcceptable) {

      if(health > 0) {
        damageTime = millis();
        health -= 1;
        isDamageAcceptable = false;
      }else if(health == 0) {
        health = 0;
      } 
    }else if(!isDamageAcceptable) {
      elapsedTime = millis() - player.damageTime;
      if(elapsedTime > coolTime){
        isDamageAcceptable = true;
      }  
    }    
  }
}
