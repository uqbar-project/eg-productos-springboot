package ar.edu.unsam.productos.serializer

import ar.edu.unsam.productos.domain.Producto
import java.time.format.DateTimeFormatter
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ProductoDTO {
	String nombre
	String fechaIngreso
	Set<String> proveedores
	
	static def fromProducto(Producto producto) {
		new ProductoDTO() => [
			nombre = producto.nombre
			fechaIngreso = DateTimeFormatter.ofPattern("dd/MM/yyy").format(producto.fechaIngreso)
			proveedores = producto.nombresDeProveedores
		]
	}
}