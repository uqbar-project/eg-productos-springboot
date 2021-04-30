package ar.edu.unsam.productos.dao

import ar.edu.unsam.productos.domain.Producto
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.repository.PagingAndSortingRepository

interface ProductosRepository extends PagingAndSortingRepository<Producto, Long> {

//	@EntityGraph(attributePaths=#[
//		"proveedores" 
//	])
	override Page<Producto> findAll(Pageable pageable)

}
