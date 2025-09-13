//  Clase Bala 
// Hereda variables de la clase GameObject
class Bala extends GameObject {
  private float velocidad;
  
  Bala(PVector posicion, PVector tamanio, float velocidad) {
    super(posicion, tamanio);
    this.velocidad = velocidad;
  }
  
  void actualizar() {
    posicion.y -= velocidad;
  }
  // dibuja la bala
  
  void dibujar() {
    fill(255, 255, 0);
    ellipse(posicion.x, posicion.y, tamanio.x, tamanio.y);
  }
}
