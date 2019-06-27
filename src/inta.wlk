object inta {
	var parcelas = []
	
	method agregarParcela(parcela) {
		parcelas.add(parcela)
	}
	
	method promedioPlantasPorParcela() {
		return parcelas.map {parcela => parcela.plantas().size()}.sum() / parcelas.size() 
	}
	
	method masAutosustentable() {
		//PRECONDICION: hay una parcela con mas de 4 plantas en el INTA
		
		return parcelas.filter{parcela=> parcela.plantas().size() > 4}.max { parcela => parcela.cantBienAsociadas() }
		
//		return self.returnMasAutosustentable(parcelas.filter{parcela=> parcela.plantas().size() > 4})
	}	
	
	method returnMasAutosustentable(lsParcelas) {
		return lsParcelas.max { parcela => parcela.cantBienAsociadas() }
	}
}
