import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
	  self.validarDescarga(unaCosa)
	  cosas.remove(unaCosa)
	}

	method estaDescargado() {
	  return cosas == #{}
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
}

