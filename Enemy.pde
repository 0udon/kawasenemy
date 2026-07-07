abstract class Enemy {
  int maxLife;
  int currentLife;
  PVector position;
  float radius;
  PVector velocity;

  abstract void init(int health, PVector position);
  abstract void draw(PGraphics g);
  abstract void update(Player player);

  void processCollision(Player player) {
    float distance = dist(position.x, position.y, player.position.x, player.position.y);
    if (player.isDamageAcceptable()) {
      if (distance < radius + player.radius) {
        player.damage();
        player.startDamageCoolTime();
      }
    }
  }
  
  void bound(){
      if(position.x >= width / 2 || position.x <= -width / 2){
        velocity.x = velocity.x * -1;
        position.add(velocity);
      }
      if(position.y >= height / 2 || position.y <= -height / 2){
        velocity.y = velocity.y * -1;
        position.add(velocity);
    } 
  }
}


class Zombie extends Enemy {
  Zombie() {
    position = new PVector(0, 0);
    radius = 32;
    velocity = new PVector(0, 0);
  }
  
  void init(int maxLife, PVector position) {
    this.maxLife = maxLife;
    this.currentLife = this.maxLife;
    this.position = position;
    this.velocity = new PVector(random(-1, 1), random(-1, 1));
  }
  
  void update(Player player) {
    position.add(velocity);
    processCollision(player);
    bound();
  }
  
  void draw(PGraphics g) {
  g.fill(0, 255, 0, 200);
  g.rect(position.x, position.y, 10, 10);
  g.circle(position.x, position.y, radius * 2.0);
  
  }
}




class Slime extends Enemy { 
  Slime() {
    position = new PVector(0, 0);
    radius = 16; 
  }
  
  void init(int maxLife, PVector position) {
    this.maxLife = maxLife;
    this.currentLife = this.maxLife;
    this.position = position;
    this.velocity = new PVector(random(-1, 1), random(-1, 1));
  }
  
  void update(Player player) {
    position.add(velocity);
    processCollision(player);
    bound();
  }
  
  void draw(PGraphics g) {
  g.fill(0, 0, 255, 200);
  g.rect(position.x, position.y, 10, 10);
  g.circle(position.x, position.y, radius * 2.0);
  }
}
