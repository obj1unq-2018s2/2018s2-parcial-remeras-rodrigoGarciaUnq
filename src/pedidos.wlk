import sucursales.*
import remeras.*

class Pedidos{
	
	const property modeloRemera
	const property cantidadDeRemeras
	const property sucursal
	
	method precioBaseDelPedido() = modeloRemera.costoRemera() * cantidadDeRemeras
	
	method tieneDescuentoDisponible() = cantidadDeRemeras >= sucursal.unidadesMinimasParaDescuento()
	
	method precioFinal() {
		if (self.tieneDescuentoDisponible()) 
			{return self.precioBaseDelPedido() * (modeloRemera.porcentajeDescuento() /100)}
		else 
			{return self.precioBaseDelPedido() }
	}
	
	
}