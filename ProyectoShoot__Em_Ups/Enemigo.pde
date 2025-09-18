// Clase Enemigo
class Enemigo extends GameObject {
  private float velocidad;
  private PImage sprite;
  Enemigo(PVector posicion, PVector tamanio, float velocidad) {
    super(posicion, tamanio);
    this.velocidad = velocidad;
    this.sprite = loadImage("SpriteEnemigo.png");
  }
  
  void actualizar() {
    posicion.y += velocidad;
  }
  
 // metodo que dibuja al enemigo
  void dibujar() {
    if (sprite != null) {
      image(sprite, posicion.x, posicion.y, tamanio.x, tamanio.y);
    } else {
      fill(255, 0, 0);
      rect(posicion.x, posicion.y, tamanio.x, tamanio.y);
    }
  }
}
