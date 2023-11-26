 //Los distintos empleados que necesitamos representar son o bien espías u oficinistas, los cuales reaccionan de maneras diversas:
 //Además algunos empleados son jefes de otros empleados

 // method saludCritica() // esto puedo manejarlo desde el tipo de empleado , en vez de hacer un metodo abstracto , nose puntualmente en que mejora pero bueno.
 // con esto puedo eliminar la herencia puesta en espias

 class Empleados{
  
  const property habilidades = []
  var property salud = 0 
  var property tipoEmpleado = espias
  var property dañoRecibido = 0
  method incapacitado(){
  	return salud < tipoEmpleado.saludCritica()
  	}

  method puedeUsarUna(habilidad){
  	return !(self.incapacitado()) && self.poseeLa(habilidad)
  }
  method poseeLa(habilidad) = habilidades.contains(habilidad)
  
  method recibirDanio(cantidad){ salud = salud - cantidad}
}

object espias {
    method saludCritica() = 15
}

class oficinistas { // aca es clase porque oficinista tiene estado , osea tiene atributos propios
   const cantidadEstrellas = 0
   method saludCritica() = 40 - (5 * cantidadEstrellas)
}

class Jefe inherits  Empleados{
	var property subordinados
	override method puedeUsarUna(habilidad) = super(habilidad) || self.algunoDeLosSubordinadosPuedeUsarLa(habilidad)

	method algunoDeLosSubordinadosPuedeUsarLa(habilidad) = subordinados().any{subordinado =>subordinado.puedeUsarUna(habilidad)}
}

class Mision{
	var property habilidadesRequeridas = []
	// method poseeTodasLasHabilidades(empleado) = habilidadesRequeridas.foreach({ // foreach aca no va .
	//  habilidad => empleado.poseeLa(hablidad)
	// })
	
	// method poseeTodasLasHabilidades(empleado) = any({
	// 	 self.poseeTodasLasHabilidades(empleado)
	// })
  method poseeTodasLasHabilidades(empleado) {
    if ( not selfposeeTodasLasHabilidades(empleado)){
      self.error{"La mision no se puede cumplir"}
    }
  }
  method poseeTodasLasHabilidades(asignado) = habilidadesRequeridas.all({
    habilidad => asignado.poseeLa(hablidad)
  })


}


