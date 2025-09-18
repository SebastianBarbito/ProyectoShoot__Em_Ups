class Explosion {
  private PVector posicion;
  private PImage spriteSheet;
  private PImage[] frames;
  private int frameActual;
  private int duracion; // ciclos que dura cada cuadro
  private int contador;

  Explosion(PVector posicion) {
    this.posicion = posicion;

    // Cargar sprite sheet 
    spriteSheet = loadImage("explosionFinal.png");

    int columnas = 5;   // 5 cuadros en fila
    int ancho = 70;
    int alto = 80;

    frames = new PImage[columnas];
    for (int i = 0; i < columnas; i++) {
      frames[i] = spriteSheet.get(i * ancho, 0, ancho, alto);
    }

    frameActual = 0;
    duracion = 5;
    contador = 0;
  }

  boolean actualizar() {
    contador++;
    if (contador >= duracion) {
      contador = 0;
      frameActual++;
    }
    return (frameActual >= frames.length);
  }

  void dibujar() {
    if (frameActual < frames.length) {
      image(frames[frameActual], posicion.x, posicion.y, 70, 80);
      imageMode(CORNER); // volver a modo normal
    }
  }
}
