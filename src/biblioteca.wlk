class tarea {

method costo() = self.costoDeComplejidad()+ self.costoImpositivo() + self.costoPorOverhead()
// que es un strategy?   cuando neceisto que sea dinamico , sino uso herencia
// la composicion entre componentes es atravez de un atributo

}

class complejidad (){ // esto es un template method
	method costoComplejidad(tarea){ 
		const costoTiempo = tarea.tiempo() * 25
		return costoTiempo + self.costoAdicional(costoTiempo,tarea)
		
	}
	method costoAdicional(costoTiempo,tarea)// metodo abstracto
}

object minima inherits complejidad { // es un object porque no tienen atributos propios, osea no tiene estado.
	method override costoAdicional(costoTiempo,tarea)= 0
}

object media inherits complejidad {
	method override costoAdicional(costoTiempo,tarea)= costoTiempo * 25
}

object maxima inherits complejidad{

	method override costoAdicional(costoTiempo,tarea) = tarea.tiempo() * 25 * 1.07 + self.costoPorTiempoExtra(tiempo)
	
	method costoPorTiempoExtra(tarea)= 10 * (tarea.tiempo()-10).max(0)

}

// para que exista un template method , debe existir un metodo abstracto , 


