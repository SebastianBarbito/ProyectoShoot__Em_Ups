void pantallaInicio() {
  background(50, 100, 200);
  if (imgInicio != null) {
    image(imgInicio, 0, 0, width, height);
  }
}

void pantallaJuego() {
  background(50, 100,200);
if (imgJuego !=null) {
  image (imgJuego, 0, 0, width, height);
}
  // Actualizar y dibujar jugador
  player.actualizar();
  player.dibujar();

  // Generar enemigos cada 60 frames
  if (frameCount % 60 == 0) {
  enemigos.add(new Enemigo(new PVector(random(width-90), 0), new PVector(90, 90), 2));
}

  // Actualizar y dibujar enemigos
  for (int i = enemigos.size()-1; i >= 0; i--) {
    Enemigo e = enemigos.get(i);
    e.actualizar();
    e.dibujar();
  }

  // Verificar colisiones
  verificarColisiones();
  for (int i = explosiones.size()-1; i >= 0; i--) {
  Explosion ex = explosiones.get(i);
  if (ex.actualizar()) {
    explosiones.remove(i); // eliminar cuando termina
  } else {
    ex.dibujar();
  }
}

  // Mostrar progreso
  fill(0, 255,0);
  textAlign(LEFT, TOP);
  textSize(16);
  text("Eliminados: " + enemigosEliminados + "/" + metaVictoria, 10, 10);
}

void pantallaVictoria() {
  background(0, 150, 0);
  if (imgVictoria != null) {
    image(imgVictoria, 0, 0, width, height);
  }
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("¡Victoria!", width/2, height/2 - 40);
  textSize(20);
  text("Presiona ENTER para reiniciar", width/2, height/2 + 20);
}

// REINICIAR JUEGO
void reiniciarJuego() {
  player = new Player(new PVector(width/2, height-50), new PVector(81, 80), 5);
  enemigos.clear();
  enemigosEliminados = 0;
}
