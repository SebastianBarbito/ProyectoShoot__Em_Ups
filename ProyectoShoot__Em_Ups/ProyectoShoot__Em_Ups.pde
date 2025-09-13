
//Sketch Principal
Player player;
ArrayList<Enemigo> enemigos;

void setup() {
  size(600, 600);
  player = new Player(new PVector(width/2, height-50), new PVector(40, 20), 5);
  enemigos = new ArrayList<Enemigo>();
}

void draw() {
  background(200);
  
  // Actualizar y dibujar jugador
  player.actualizar();
  player.dibujar();
  
  // Generar enemigos cada cierto tiempo
  if (frameCount % 60 == 0 && enemigos.size() < 5) {
  enemigos.add(new Enemigo(new PVector(random(width - 40), 0), new PVector(40, 20), 2));
}
  
  // Actualizar y dibujar enemigos
  for (int i = enemigos.size()-1; i >= 0; i--) {
    Enemigo e = enemigos.get(i);
    e.actualizar();
    e.dibujar();
    if (e.posicion.y > height) {
      enemigos.remove(i);
    }
  }
}
