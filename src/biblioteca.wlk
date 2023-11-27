class Cocineros{

    var property tipoDeCocinero //= Pastelero
    //var property cantidadDeCaloriasPreferida = 0
   
    method calificacionDelCocinero(plato) = tipoDeCocinero.calificacion(plato)

    method cambiarDeEspecialidad(_tipoDeCocinero){
        tipoDeCocinero = _tipoDeCocinero
    }
    method cocinando() {
     return tipoDeCocinero.creaUnPlato(self)
    }
    
}
class Plato{// clase abstracta
  var property tipoDePlato
  const property duenio
  method cantidadDeAzucar() // es un lugar donde guardo metodos
  // si hago const plato1 = new PLato() no me va a dejar 
  //pero si hago const plato2 = new Entradas() si me va  dejar conocer las 
  //calorias
  //por eso es una clase abstracta
 // const property calorias = 0
  method calorias() =  (3 * self.cantidadDeAzucar()) + 100
}

class Entradas inherits Plato{
 override method cantidadDeAzucar()=0
 method  esBonita() = true
}// puedo retornar una instancia de una clase.//chequear si puedo o no
 // retornar un objeto// creo que si 

class Principales inherits Plato{
  const azucar
  const property esBonito
  override method cantidadDeAzucar()=azucar
}
class Postres inherits Plato{
  const cantidadDeColores
  override method cantidadDeAzucar()=120
  method esBonita()= cantidadDeColores > 3
}





class Pastelero{
   const nivelDeseadoDeDulzor
   method calificacion(plato) = ((5 * plato.cantidadDeAzucar()) / nivelDeseadoDeDulzor).min(10)
   method cantidadDeColoresDelPlato(plato) = plato.colores()
   method creaUnPlato(plato,cocinero) {
    return self.cantidadDeColoresDelPlato(plato) / 50
   } 
   method creaUnPlato(cocinero){
    return new Postres{ cantidadDeColores = nivelDeseadoDeDulzor / 50 ,duenio = cocinero}
   }
}

class chef{
  const limiteCantidadCalorias
  method creaUnPlato(cocinero){
    return new Principales{esBonito = true ,azucar = limiteCantidadCalorias,duenio = cocinero}
  }
  method nollegaAlaCalificacionPerfecta(plato) = 0
  method llegaALaCalificacionPerfecta(plato) = plato.bonito() && plato.calorias() <= limiteCantidadCalorias
  method calificacion(plato) = if(self.llegaALaCalificacionPerfecta(plato)) 10 else self.nollegaAlaCalificacionPerfecta()
}

class Souschef inherits chef{//object
 override method creaUnPlato(cocinero){
  return new Entradas{duenio = cocinero}
 }
 override method nollegaAlaCalificacionPerfecta(plato) = (plato.calorias()/100).min(6)
}

class Torneo{
   const property puntuacion
   const property catadores = []//lista de catadores
   const property platos = []
   method participaDeUnTorneo(cocinero) {
    platos.add(cocinero.cocinando())
   }
   method platoGanador(){// encuentro al mejor plato puntuado
    return platos.max({plato=>self.puntajeTotalDeUnPlato(unPlato)})
   }
	method puntajeTotalDeUnPlato(unPlato) {
		return catadores.sum({unCatador => unCatador.calificacionDelCocinero(unPlato)})
	}
  method encontrarAlCocinero(){
    if(platos().isEmpty() == 0){
      throw new UserException(message = "No se puede encontrar un ganador, ya que no hay participantes!") 
    }
    return self.platoGanador().duenio()
  }
}




