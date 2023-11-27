class Cocineros{

    var property tipoDeCocinero = Plato
    const property catar  = 0
   
    method calificacionDelCocinero(plato) = tipoDeCocinero.calificacion(plato)

    method cambiarDeEspecialidad(_tipoDeCocinero){
       return tipoDeCocinero = _tipoDeCocinero
    }
    method cocinando(plato) {
     return tipoDeCocinero.creaUnPlato(plato)
    }
}
class Plato{
  var azucar = 0
  var bonito = false
  var colores =  0
  method azucar(_azucar) {
    azucar = _azucar
  } 
  method bonito (_bonito){
    bonito = _bonito
  } 
  method colores(_colores) {
    colores = _colores
  }
 // const property calorias = 0

  method calorias() =  (3 * self.azucar) + 100
  
}

class Pastelero{
   const nivelDeseadoDeDulzor = 0
   method calificacion(plato) = 10.min((5 * plato.azucar()) / nivelDeseadoDeDulzor)

}

class chef{
  const limiteCantidadCalorias = 0
  method calificacionPorNoLlegarAlaCalificacionPerfecta(plato) = 0
  method llegaALaCalificacionPerfecta(plato) = plato.bonito() && plato.calorias() <= limiteCantidadCalorias
  method calificacion(plato) = if(self.llegaALaCalificacionPerfecta(plato)) 10 else self.calificacionPorNoLlegarAlaCalificacionPerfecta()
}

object souschef inherits chef{

 override method calificacionPorNoLlegarAlaCalificacionPerfecta(plato) = 6.min(plato.calorias()/100)

}
object entradas inherits Plato{
  override method bonito {
    return true
  }  
}
object principal inherits Plato{
   
}
object postre inherits Plato{
   method sonBonitos()=
}


