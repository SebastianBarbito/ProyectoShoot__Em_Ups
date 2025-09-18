//Sketch Principal
Player player;
ArrayList<Enemigo> enemigos;
ArrayList<Explosion> explosiones;
PImage imgInicio;
PImage imgVictoria;
PImage imgJuego;

void setup() {
  size(600, 600);
  player = new Player(new PVector(width/2, height-50), new PVector(81, 80), 5);
  enemigos = new ArrayList<Enemigo>();
  explosiones = new ArrayList<Explosion>();
  imgInicio = loadImage("Inicio.png");
  imgVictoria = loadImage("Victoria.png");
  imgJuego = loadImage("CampoDeBatalla.png");
}

void draw() {
  background(200);
  
  if (estado == 0) {
    pantallaInicio();
  } else if (estado == 1) {
    pantallaJuego();
  } else if (estado == 2) {
    pantallaVictoria();
  }
}
void keyPressed() {
  // Si estamos en la pantalla de inicio y apretamos ENTER
  if (estado == 0 && keyCode == ENTER) {
    estado = 1; // pasar al juego
  }

  // Si estamos en la pantalla de victoria y apretamos ENTER
  else if (estado == 2 && keyCode == ENTER) {
    reiniciarJuego();
    estado = 1; // volver a jugar
  }
}

  
 
