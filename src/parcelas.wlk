class Parcela {
	const ancho
	const largo
	const property horasDeSol
	const property plantas =  []
	const property tipo
	
	method superficie() = ancho * largo
	
	method maxCapacidad() {
		if (ancho > largo) {return self.superficie() / 5}
		else return (self.superficie() / 3) + largo
	}
	
	method tieneComplicaciones() {
		return plantas.any { planta => planta.tolerancia() < horasDeSol }
	}
	
	method plantar(aPlanta) {
		
		if ((aPlanta.tolerancia() < horasDeSol - 2) or (plantas.size() == self.maxCapacidad())) {
			error.throwWithMessage("No puedo plantar esta planta plantarosa ):")
		} else {
		plantas.add(aPlanta)
		aPlanta.serPlantadaEn(self)
		}
	}
	
	method retirar(aPlanta) {
		plantas.remove(aPlanta)
		aPlanta.removerParcela(self)
	}
	
	
	method cantBienAsociadas() {
		return plantas.count{ planta => planta.bienAsociada() }
	}
}

