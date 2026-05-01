object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
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
	var tranformacion = "auto"
  method peso() {
	return 800
  }

  method nivelPeligrosidad() {
	if(tranformacion == "auto"){
		return 15
	} else{
		return 30
	}
  }

  method transformacion(_tranformacion) {
	tranformacion = _tranformacion
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
  var tieneMisil = self.conMisiles()
  method peso() {
	if(self.conMisiles()){
		return 300
	} else{
		return 200
	}
  }

  method conMisiles() {
	return true
  }

  method sinMisiles() {
	return false
  }

  method nivelPeligrosidad() {
	if(tieneMisil){
		return 100
	} else {
		return 0
	}
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
  method peso(peso) {
	pesoResiduos = peso
  }
  method peso() {
	return pesoResiduos
  }

  method nivelPeligrosidad() {
	return 200
  }
}
