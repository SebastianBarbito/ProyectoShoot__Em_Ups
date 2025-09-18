//  Clase Player
// la Clase player hereda variables de GameObject
class Player extends GameObject {
  private float velocidad;
  private ArrayList<Bala> balas;
  private PImage sprite;
  
  Player(PVector posicion, PVector tamanio, float velocidad) {
    super(posicion, tamanio);
    this.velocidad = velocidad;
    this.balas = new ArrayList<Bala>();
    this.sprite = loadImage("spritePersonaje.png");
    
  }
  // crea un metodo para que el jugador se pueda mover con las teclas asignadas
  void mover() {
    if (keyPressed) {
      if (keyCode == LEFT ) posicion.x -= velocidad;
      if (keyCode == RIGHT) posicion.x += velocidad;
      if (key == ' ') disparar();
    }
  }
  // crea un metodo para que llame y dibuje una bala 
  void disparar() {
    if (frameCount % 10 == 0) { // Control de frecuencia de disparo
      PVector posBala = new PVector(posicion.x + tamanio.x/2, posicion.y);
      balas.add(new Bala(posBala, new PVector(10, 10), 5));
    }
  }
  // permite actualizar la posicion de la bala para que se dibuje en el lugar correcto
  void actualizar() {
    mover();
    for (int i = balas.size()-1; i >= 0; i--) {
      Bala b = balas.get(i);
      b.actualizar();
      if (b.posicion.y < 0) {
        balas.remove(i);
      }
    }
    // Evitar que salga de la pantalla
  posicion.x = constrain(posicion.x, 0, width - tamanio.x);
  posicion.y = constrain(posicion.y, 0, height - tamanio.y);

  }
  
  //metodo para llamar y dibujar la clase bala
 void dibujar() {
    if (sprite != null) {
      image(sprite, posicion.x, posicion.y, tamanio.x, tamanio.y);
    } else {
      fill(0, 0, 255);
      rect(posicion.x, posicion.y, tamanio.x, tamanio.y);
    }
    for (Bala b : balas) {
      b.dibujar();
    }
  }

}
