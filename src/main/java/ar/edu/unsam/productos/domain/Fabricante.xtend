package ar.edu.unsam.productos.domain

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors

@Entity
@Accessors
class Fabricante {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long id
	
	@Column(length=150)
	String nombre
	
}
