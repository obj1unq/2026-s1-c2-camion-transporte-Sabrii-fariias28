object knightRider {
	method peso() { 
		return 500 
    }
	method nivelPeligrosidad() {
		 return 10  
	}
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
}

object paqueteLadrillos {
  var ladrillos = 0
  method cantidadLadrillos(cantidad) {
	ladrillos = cantidad
  }
  method peso() {
 	return 2 * ladrillos
  }
  
  method nivelPeligrosidad() {
	  return 2
  }
}

object bateria {
  var tieneMisil = true
  method peso() {
	return if(self.tieneMisil()) 300 else 200
  }

  method conMisiles() {
	return true
  }

  method sinMisiles() {
	return false
  }

  method nivelPeligrosidad() {
	return if(tieneMisil) 100 else 0
  }

  method cambiarEstado(misil) {
	tieneMisil = misil
  }

  method tieneMisil() {
	return tieneMisil
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
}