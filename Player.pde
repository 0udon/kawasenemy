class Player {
  int maxLife;
  int currentLife;
  PVector position;
  float speed;
  float radius;
  int damageMaxCoolTimeFrame = 60;
  int damageCoolTimeFrame;
  
  Player() {
    maxLife = 10;
    currentLife = maxLife;
    position = new PVector(0, 0);  // 画面中央
    speed = 5;
    radius = 16;
  }
  
  void update() {
    PVector inputDir = processInput();
    position.add(inputDir.mult(speed));
    position.x = (int)position.x % width;
    position.y = (int)position.y % height;
    
    damageCoolTimeFrame = max(damageCoolTimeFrame - 1, 0);
  }
  
  void draw(PGraphics g) {
    g.fill(255, 0, 0, 200);
    g.rect(position.x, position.y, 10, 10);
    g.circle(position.x, position.y, radius * 2.0);
    g.text(String.format("Cooltime: %d", damageCoolTimeFrame), position.x, position.y -radius * 1.2);
  }
  
  PVector processInput() {
    PVector inputDir = new PVector(0, 0);
      if (upPressed) {
        inputDir.add(new PVector(0, -1));
      }
      if (downPressed) {
        inputDir.add(new PVector(0, 1));
      }
      if (leftPressed) {
        inputDir.add(new PVector(-1, 0));
      }
      if (rightPressed) {
        inputDir.add(new PVector(1, 0));
      }
      return inputDir.normalize();
    }
  

  
  void damage() {
    currentLife = max(currentLife - 1, 0);
  }
  
  boolean isDamageAcceptable() {
    return damageCoolTimeFrame == 0;
  }
  
  void startDamageCoolTime() {
    damageCoolTimeFrame = damageMaxCoolTimeFrame;
  }
}
