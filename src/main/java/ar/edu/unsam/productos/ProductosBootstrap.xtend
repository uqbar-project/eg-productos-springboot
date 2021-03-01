package ar.edu.unsam.productos

import ar.edu.unsam.productos.dao.FabricantesRepository
import ar.edu.unsam.productos.dao.ProductosRepository
import ar.edu.unsam.productos.domain.Fabricante
import ar.edu.unsam.productos.domain.Producto
import java.time.LocalDate
import java.util.List
import org.springframework.beans.factory.InitializingBean
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

/**
 * 
 * Para explorar otras opciones
 * https://stackoverflow.com/questions/38040572/spring-boot-loading-initial-data
 */
@Service
class ProductosBootstrap implements InitializingBean {

	@Autowired
	FabricantesRepository fabricanteRepository
	
	@Autowired
	ProductosRepository productosRepository
		
	def Fabricante crearFabricante(int i) {
		fabricanteRepository.save(new Fabricante => [
			nombre = "Fabricante " + i
		])
	}
	
	def crearProducto(int i, List<Fabricante> fabricantes) {
		val producto = new Producto => [
			nombre = "Producto " + i
			fechaIngreso = LocalDate.now.minusWeeks(i)
			proveedores = if (i % 2 == 0) fabricantes.subList(0, 10).toSet else fabricantes.subList(11, 15).toSet
		]
		productosRepository.save(producto)
	}
	
	override afterPropertiesSet() throws Exception {
		println("************************************************************************")
		println("Running initialization")
		println("************************************************************************")
		if (fabricanteRepository.count > 0) return;
		
		val fabricantes = newArrayList;
		(1..25).forEach [ i |
			fabricantes.add(crearFabricante(i))
		]
		
		(1..5000).forEach [ i |
			crearProducto(i, fabricantes)			
		]
	}

}