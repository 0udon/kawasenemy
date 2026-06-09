abstract class Enemy {
  int health;
  PVector position;
  float radius = 5;
  float damageTime;
  float elapsedTime;
  float coolTime = 300; // ms
  boolean isDamageAcceptable = true;

  abstract void init(int health, PVector position);
  abstract void draw(PGraphics g);
  abstract void update(Player player);
}


class Zombie extends Enemy {
  void init(int health, PVector position) {
    this.health = health;
    this.position = position;
  }
  
  void update(Player player) {
    position.x = (position.x + 1) % width;
    
    float distance = dist(position.x, position.y, player.position.x, player.position.y);
    if(distance < player.radius + radius) {
        player.damage();
    }else if(!isDamageAcceptable){
      elapsedTime = millis() - player.damageTime;
        if(elapsedTime > coolTime){
          isDamageAcceptable = true;
        }
    }
  }
  
  void draw(PGraphics g) {
  g.fill(0, 255, 0, 200);
  g.rect(position.x, position.y, 10, 10);
  }
}




class Slime extends Enemy {  
  void init(int health, PVector position) {
    this.health = health;
    this.position = position;
  }
  
  void update(Player player) {
    position.y = (position.y + 1) % width;
    float distance = dist(position.x, position.y, player.position.x, player.position.y);
    if(distance < player.radius + radius) {
        player.damage();
    }else if(!isDamageAcceptable){
      elapsedTime = millis() - player.damageTime;
        if(elapsedTime > coolTime){
          isDamageAcceptable = true;
        }
    }
  }
  
  void draw(PGraphics g) {
  g.fill(0, 0, 255, 200);
  g.rect(position.x, position.y, 10, 10);
  }
}
