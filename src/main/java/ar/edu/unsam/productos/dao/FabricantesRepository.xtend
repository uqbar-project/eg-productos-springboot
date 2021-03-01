package ar.edu.unsam.productos.dao

import ar.edu.unsam.productos.domain.Fabricante
import org.springframework.data.repository.CrudRepository

interface FabricantesRepository extends CrudRepository<Fabricante, Long> {}
