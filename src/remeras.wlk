class RemeraBasica{
	
	const property talle
	const property color
	
	method precioBaseTallesChicos() = 80
	method precioBaseTallesGrandes() = 100
	
	method coloresBasicos() = ["negro","gris","blanco"]
	
	
	
	method adicionalColor(costo) = costo * 0.10
	
	method costoSegunTalle() {
		if (self.esTalleChico()){return self.precioBaseTallesChicos()}
		else {return self.precioBaseTallesGrandes()}
	}
	
	method costoRemera(){
		const precioTemporal = self.costoSegunTalle() 
		if (self.esColorBasico()) {return self.costoSegunTalle()}
		else{return self.costoSegunTalle() + self.adicionalColor(precioTemporal) }
	}
	
	method esTalleChico() = talle <= 40
	
	method esColorBasico() = self.coloresBasicos().contains(color)
	
	method porcentajeDescuento() = 10
	
}

class RemerasBordadas inherits RemeraBasica{
	
	const property cantidadDeColores 
	
	override method talle() = super()
	
	override method color() = super()
	
	method adicionalDeBordado() = (cantidadDeColores * 10).max(20)
	
	override method costoRemera() = super() + self.adicionalDeBordado()
	
	override method porcentajeDescuento() = 2
	
}

class RemerasSublimadas inherits RemeraBasica{
	
	const property ancho 
	const property alto
	const property dibujoConDerechosDeAutor
	
	override method talle() = super()
	
	override method color() = super()
			
	method superficieSublimado() = ancho * alto
	
	method precioPorCm() = 0.5
	
	method precioPorDerechoAutor() = 100
	
	method costoSupSublimado() = self.superficieSublimado() * self.precioPorCm()
	
	method adicionalDeSublimado(){
		if (dibujoConDerechosDeAutor) {return self.costoSupSublimado() + self.precioPorDerechoAutor() }
		else {return self.costoSupSublimado()}
	}
	
	override method costoRemera() = super() + self.adicionalDeSublimado()
	
	override method porcentajeDescuento(){
		if (dibujoConDerechosDeAutor) {return 20}
		else{return super()}
	}

}