void verificarColisiones() {
  for (int i = enemigos.size()-1; i >= 0; i--) {
    Enemigo e = enemigos.get(i);
    for (int j = player.balas.size()-1; j >= 0; j--) {
      Bala b = player.balas.get(j);
      if (colision(b, e)) {
        explosiones.add(new Explosion(new PVector(e.posicion.x, e.posicion.y)));
        player.balas.remove(j);   // primero eliminar la bala
        enemigos.remove(i);       // luego eliminar el enemigo
        enemigosEliminados++;
        if (enemigosEliminados >= metaVictoria) {
          estado = 2; // pasar a victoria
        }
        break; // salimos del bucle de balas
      }
    }
  }
}

boolean colision(GameObject a, GameObject b) {
  return !(a.posicion.x + a.tamanio.x < b.posicion.x ||
           a.posicion.x > b.posicion.x + b.tamanio.x ||
           a.posicion.y + a.tamanio.y < b.posicion.y ||
           a.posicion.y > b.posicion.y + b.tamanio.y);
}
