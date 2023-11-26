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
  method estaVivo() =salud > 0
  method finalizarMision(mision){
    if(self.estaVivo()){
      self.completarMision(mision)
    }
  }
  method completarMision(mision){
    tipoEmpleado.completarMision(mision,self)  
  }
  method aprenderHabilidad(habilidad){
    habilidades.add(habilidad)
  }
}

object espias {
    method saludCritica() = 15
    method completarMision(mision,empleado){
      mision.enseniarHabilidades()
    }
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
  const peligrosidad
  method serCumplidadPor(asignado) {
    if ( not self.poseeTodasLasHabilidades(asignado)){
      self.error{"La mision no se puede cumplir"}
    }
    asignado.sufrirDanio(peligrosidad)
    asignado.completarMision(self,empleado)
  }
  method poseeTodasLasHabilidades(asignado) = habilidadesRequeridas.all({
    habilidad => asignado.poseeLa(hablidad)
  })
  method enseniarHabilidades(empleado) {
    self.habilidadesQueNoPosee(empleado)
      .foreach({hab=>hab.aprenderHabilidad(hab)}) // el forach lo uso para un post
  }

 method habilidadesQueNoPosee(empleado){
  habilidadesRequeridas.filter({
    hab=> not empleado.poseeLa(hab)
   })
  }
}


