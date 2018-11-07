import pedidos.*
import sucursales.*

class RegistroDePedidos{
	
	var property pedidosRegistrados = []
	const property sucursalesReguladas =[]
	
	method registrarPedido(pedido){
		pedidosRegistrados.add(pedido)
	}
	
	method totalFacturado() = pedidosRegistrados.sum{ pedido=>pedido.precioFinal() }
	
	method totalFacturadoEnSucursal(sucursal) = self.pedidosDeSucursal(sucursal).sum{ pedido=>pedido.precioFinal() }
	
	method pedidosDeSucursal(sucursal) = pedidosRegistrados.filter{pedido => pedido.sucursal() == sucursal}
	
	method pedidosDeRemerasColor(color)= pedidosRegistrados.filter{pedido => pedido.modeloRemera().color() == color }
	
	method pedidoMasCaro() = pedidosRegistrados.max{pedido => pedido.precioFinal()}
	
	method tallesDeCadaPedido() = pedidosRegistrados.map{pedido=>pedido.modeloDeRemera().talle()}.asSet () 
	
	method talleSinPedidos() = new Range(32,48).difference(self.tallesDeCadaPedido())
	
	method sucursalQueMasFacturo() = sucursalesReguladas.max{sucursal=>sucursal.totalFacturadoEnPedidos()}
	
	method sucursalesConPedidosDeTodosLosTalles() = pedidosRegistrados.map{}
	
}