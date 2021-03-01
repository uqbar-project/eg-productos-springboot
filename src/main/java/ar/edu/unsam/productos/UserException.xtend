package ar.edu.unsam.productos

import java.lang.RuntimeException

class UserException extends RuntimeException {
	
	new(String message) { super(message) }
}