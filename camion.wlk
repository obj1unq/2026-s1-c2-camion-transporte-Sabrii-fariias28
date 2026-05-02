import cosas.*

object camion {
	const cosas = #{}
		
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
	  self.validarDescarga(unaCosa)
	  cosas.remove(unaCosa)
	}

	method estaDescargado() {
	  return cosas.isEmpty()
	}

	method cosasCargadas() {
	  return cosas
	}

	method yaEstaCargado(unaCosa) {
	  return cosas.contains(unaCosa)
	}
	method validarCarga(unaCosa) {
 		if (self.yaEstaCargado(unaCosa)) {
    	  self.error("No se puede cargar porque ya está en el camión")
       }
    }

	method validarDescarga(unaCosa) {
	  if(not self.yaEstaCargado(unaCosa)){
		self.error("No se puede descargar porque no esta cargado en el camión")
	  }
	}

	method laCargaEsPar() {
	  return cosas.sum({cosa => cosa.peso()}) % 2 == 0
	}

	method algunoPesa(peso) {
	  return cosas.any({cosa => cosa.peso() == peso})
	}

	method tara() {
	  return 1000
	}

	method pesoTotal() {
	  return self.tara() + cosas.sum({cosa => cosa.peso()})
	}

	method estaExcedido() {
	  return self.pesoTotal() > 2500
	}

	method cargaConPeligrosidad(nivel) {
	  return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
	}

	method cosasQueSuperanPeligrosidad(nivel) {
	  return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel}) 
	}
	
	method cosasMasPeligrosasQue(cosa) {
	  return self.cosasQueSuperanPeligrosidad(cosa.nivelPeligrosidad())
	}

	method puedeCircularEnRuta(nivelRuta) {
	  return  !self.estaExcedido() && self.cosasQueSuperanPeligrosidad(nivelRuta).isEmpty()
	}

	method algunaCosaPesaEntre(min,max) {
	  return cosas.any({ cosa => cosa.peso() >= min && cosa.peso() <= max })
	}
	
	method cosaMasPesada() {
	  return if (cosas.isEmpty()) self.error("No se puede calcular porque el camión esta vacío") else cosas.max({cosa => cosa.peso()})
    }

	method pesosDeLasCosas() {
	  return cosas.map({cosa => cosa.peso()})
	}

	method totalDeBultos() {
	  return cosas.sum({cosa => cosa.bulto()})
	}

	method accidente() {
	  cosas.forEach({cosa => cosa.efecto()})
	}
}

