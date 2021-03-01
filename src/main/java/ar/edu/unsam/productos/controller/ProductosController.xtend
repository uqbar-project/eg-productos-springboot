package ar.edu.unsam.productos.controller

import ar.edu.unsam.productos.dao.ProductosRepository
import ar.edu.unsam.productos.serializer.ProductoDTO
import io.swagger.annotations.ApiOperation
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RestController

@RestController
@CrossOrigin(origins = "*", methods= #[RequestMethod.GET])
class ProductosController {
	
	@Autowired
	ProductosRepository productosRepository

	@GetMapping(value = "/productosRecientes")
	@ApiOperation("Trae la información de los últimos productos cargados.")
	def buscarPeliculas() {
		productosRepository
			.findAll(PageRequest.of(0, 1000, Sort.Direction.ASC, "fechaIngreso"))
			.map [ ProductoDTO.fromProducto(it) ]
	}

}