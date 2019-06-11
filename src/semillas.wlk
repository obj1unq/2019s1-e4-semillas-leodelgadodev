class Semilla {
	const property anio//anio en que se consiguio la semilla de su planta de origen (su obtencion)
	const property altura //en metros
	var suParcela = []

	method tolerancia() = 0 //inicializacion //horas de sol que tolera
	
	method esFuerte() = self.tolerancia() > 10
	
	method daNuevasSemillas() = self.esFuerte() or self.condicionAlternativa() 
	
	method condicionAlternativa() = true //inicializacion
	
	method espacioOcupado() = 0 //inicializacion //medido en m2 y depende de la especie
	
	method parcelaIdeal() = true
	
	method serPlantadaEn(unaParcela) {
		suParcela.add(unaParcela)
	}
	
	method bienAsociada() {
		if (suParcela.head().tipo() == "ecologica") {
			return self.parcelaIdeal() and not suParcela.head().tieneComplicaciones()
		} else {
			return self.esFuerte() and suParcela.head().plantas().size() <= 2
		}
	}
	
	method removerParcela(unaParcela) {
		suParcela.remove(unaParcela)
	}
}

class Menta inherits Semilla {
	
	
	override method tolerancia() = 6
	
	override method condicionAlternativa() = self.altura() > 0.4 
	
	override method espacioOcupado() = self.altura() * 3
	
	override method parcelaIdeal() = suParcela.head().superficie() > 6
}

class Soja inherits Semilla {
	
	override method tolerancia() {
		if (self.altura() < 0.5) {return 6} 
		else if (self.altura() > 1) {return 9}
		else return 7
	}
	
	override method condicionAlternativa() {
		return self.altura() > 1 and self.esDeObtencionReciente()
	}
	
	method esDeObtencionReciente() {
		return self.anio() > 2007
	}
	
	override method espacioOcupado() = self.altura() / 2
	
	override method parcelaIdeal() = self.tolerancia() == suParcela.head().horasDeSol()
	
}

class Quinoa inherits Semilla {
	
	var tolerancia
	
	override method tolerancia() = tolerancia
	
	override method espacioOcupado() = 0.5
	
	override method condicionAlternativa() = self.anio() < 2005
	
	override method parcelaIdeal() {
		return suParcela.first().plantas().all { planta => planta.altura() < 1.5 }
	}
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false
	override method parcelaIdeal() = suParcela.head().maxCapacidad() == 1
}

class Hierbabuena inherits Menta {
	override method espacioOcupado() = self.altura() * 6
}



