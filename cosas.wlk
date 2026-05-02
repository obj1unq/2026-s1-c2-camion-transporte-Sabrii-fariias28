object knightRider {
	method peso() { 
		return 500 
    }
	method nivelPeligrosidad() {
		 return 10  
	}

	method bulto() {
	  return 1
	}

	method efecto() {}
}

object arenaGranel {
	var pesoArena = 0

	method peso() {
	  return pesoArena
	}

	method cambiarPeso(_pesoArena) {
	  pesoArena = _pesoArena
	}

	method nivelPeligrosidad() {
	  return 1
	}

	method bulto() {
	  return 1
	}

	method efecto() {
	  pesoArena = pesoArena + 20
	}
}

object bumblebee {
  var modo = "auto"
  method peso() {
	return 800
  }

  method nivelPeligrosidad() {
	return if(modo == "auto") 15 else 30

  }

  method modo(_modo) {
	modo = _modo
  }
	
  method bulto() {
	return 2
  }

  method modo() {
	return modo
  }

  method efecto() {
	modo = if( modo == "auto") "robot" else "auto"
  }
}

object paqueteLadrillos {
  var cantidadLadrillos = 0

  method cantidadLadrillos(cantidad) {
	cantidadLadrillos = cantidad
  }
  method peso() {
 	return 2 * cantidadLadrillos
  }
  
  method nivelPeligrosidad() {
	  return 2
  }

  method bulto() {
	return if (cantidadLadrillos <= 100) {
   		 1
    } else if (cantidadLadrillos <= 300) {
   		 2
    } else {
    	3
    }
  }

  method efecto() {
	if(cantidadLadrillos < 12) cantidadLadrillos = 0 else cantidadLadrillos = cantidadLadrillos - 12
  }

  method cantidadLadrillos() {
	return cantidadLadrillos 
  }
}

object bateria {
  var tieneMisil = true

  method peso() {
	return if(self.tieneMisil()) 300 else 200
  }

  method nivelPeligrosidad() {
	return if(self.tieneMisil()) 100 else 0
  }

  method cambiarEstado(misil) {
	tieneMisil = misil
  }

  method tieneMisil() {
	return tieneMisil
  }

  method bulto() {
	return if(self.tieneMisil()) 2 else 1
  }

  method efecto() {
	self.cambiarEstado(false)
  }

}

object residuos {
  var pesoResiduos = 0

  method cambiarPeso(peso) {
	pesoResiduos = peso
  }
  method peso() {
	return pesoResiduos
  }

  method nivelPeligrosidad() {
	return 200
  }

  method bulto() {
	  return 1
  }

  method efecto() {
	pesoResiduos = pesoResiduos + 15
  }
}

object contenedorPortuario {
  const cosas = []

  method peso() {
	return 100 + cosas.sum({cosa => cosa.peso()})
  }

  method nivelPeligrosidad() {
	return if(cosas.isEmpty()) 0 else self.cosaMasPesada().nivelPeligrosidad()
  }

  method cargar(unaCosa) {
	cosas.add(unaCosa)
  }

  method descargar(unaCosa) {
	cosas.remove(unaCosa)
  }

  method cosasQueTiene() {
	return cosas
  }

  method cosaMasPesada() {
	return cosas.max({cosa => cosa.peso()})
  }

  method bulto() {
	return 1 + cosas.sum({cosa => cosa.bulto()})
  }

  method efecto() {
	cosas.forEach({cosa => cosa.efecto()})
  }
}

object embalaje {
  var cosaQueEmbuelve = knightRider

  method peso() {
	return cosaQueEmbuelve.peso()
  }
  
  method nivelPeligrosidad() {
	return (cosaQueEmbuelve.nivelPeligrosidad())/2
  }

  method envolver(cosa) {
	cosaQueEmbuelve = cosa
  }

  method bulto() {
	return 2
  }

  method efecto() {}
}