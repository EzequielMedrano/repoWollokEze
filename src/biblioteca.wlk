// venta o alquiler
//

class Empleado {
    const registro = [] // aca van las operaciones cerradas , osea no las reservas
    var property criterio 
    var property reservas = []
    //var property reservaOCompletado

   // var property empleado 
    method cualFueELMejorEmpleado()  = criterio.criterioParaMejorEmpleado(registro)
    method empleadoVaATenerProblemasConOtro(inmueble)= self.cerraronOperacionesEnLaMismaZona(registro,inmueble) && self.concretoUnaOperacionReservadaPorOtro(reservas,registro)

}

class Inmuebles{
   const property tamanio = 0
   const property cantidadDeAmbientes =  0
   var property tipoDeOperacion = venta 
   var property precio
   var property zona 
//   var property plusPorZona 

   method comisionPorOperacionConcretada() = tipoDeOperacion.comision(precio)
  

}
class Alquileres {
  var cantidadDeMeses = 0 
  method comision(precio) = (cantidadDeMeses *  precio) / 50000
} 

class venta {
  var property porcentajeParaElAgente = 0
  method comision(precio) =  (precio * porcentajeParaElAgente) / 100
}


object totalPorComisiones{
  method criterioParaMejorEmpleado(registro,reservas) = registro.sum({reg=>comision(reg)})
}
object cantidadDeOperacionesCerradas{
  method criterioParaMejorEmpleado(registro,reservas) =  registro.size()
}
// object cantidadDeReservas {// este ultimo objeto no me convence
//    method criterioParaMejorEmpleado(registro,reservas) =  reservas.size()
// }// este ultimo objeto no me convence

class Reserva{
  var estaReservada = false
  method criterioParaMejorEmpleado(registro,reservas) =  reservas.size()
  
  //Es importante no repetir código y
  // dejar la puerta abierta a la aparición de nuevos criterios.
}

// Se pide también saber si un empleado va a tener 
// problemas con otro. Esto se da cuando ambos han cerrado operaciones
//  en la misma zona y alguno de lo dos concretó alguna vez una operación
//   que había reservado el otro.
