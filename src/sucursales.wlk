import pedidos.*

class Sucursal{
	
	const property unidadesMinimasParaDescuento
	
	const property ubicacionDeSucursal
	
	const property pedidos = [] //info duplicada.
	
	method totalFacturadoEnPedidos(){
		pedidos.sum{pedido=>pedido.precioFinal()}
	}
	

}