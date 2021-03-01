package ar.edu.unsam.productos.domain

import com.fasterxml.jackson.annotation.JsonIgnore
import java.time.LocalDate
import java.util.Set
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.persistence.ManyToMany
import org.eclipse.xtend.lib.annotations.Accessors

@Entity
@Accessors
class Producto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long id
	
	@Column(length=150)
	String nombre

	@Column
	LocalDate fechaIngreso
	
	@JsonIgnore
	// Configuración correcta: LAZY
	// @ManyToMany(fetch = FetchType.LAZY)
	// Configuración para que no tire el session not found, trae el inconveniente de n + 1 queries
	@ManyToMany(fetch = FetchType.EAGER)
	Set<Fabricante> proveedores
	
	def Set<String> getNombresDeProveedores() {
		proveedores.map [ prov | prov.nombre ].toSet
	}
}