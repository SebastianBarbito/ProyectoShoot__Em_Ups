// Clase base GameObject 
class GameObject {
  protected PVector posicion;
  protected PVector tamanio;
  
  GameObject(PVector posicion, PVector tamanio) {
    this.posicion = posicion;
    this.tamanio = tamanio;
  }
  
  void actualizar() {
  }
  
  void dibujar() {
    rect(posicion.x, posicion.y, tamanio.x, tamanio.y);
  }
}
