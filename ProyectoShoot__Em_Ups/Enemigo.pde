// Clase Enemigo
class Enemigo extends GameObject {
  private float velocidad;
  
  Enemigo(PVector posicion, PVector tamanio, float velocidad) {
    super(posicion, tamanio);
    this.velocidad = velocidad;
  }
  
  void actualizar() {
    posicion.y += velocidad;
  }
  
 // metodo que dibuja al enemigo
  void dibujar() {
    fill(#CE150F);
    rect(posicion.x, posicion.y, tamanio.x, tamanio.y);
  }
}
