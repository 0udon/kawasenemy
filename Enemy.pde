abstract class Enemy {
  int health;
  PVector position;
  abstract void init(int health, PVector position);
  abstract void update();
  abstract void draw(PGraphics g);
}

class Zombie extends Enemy {
  void init(int health, PVector position) {
    this.health = health;
    this.position = position;
  }
  
  void update() {
    position.x = (position.x + 1) % width;
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
  
  void update() {
    position.y = (position.y + 1) % width;
  }
  
  void draw(PGraphics g) {
  g.fill(0, 0, 255, 200);
  g.rect(position.x, position.y, 10, 10);
  }
}
