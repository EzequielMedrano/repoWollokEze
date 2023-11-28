class Personas {

   var property monedas = 20
   const property edad
   var property persona
   method recursos() = monedas
   method destacada() = edad.between(18,65) || self.recursos > 30
   

  method sumoMonedas(_monedas) {
    monedas = monedas +  _monedas
   }
   method quitoMonedas(_monedas){
    monedas = monedas - _monedas
   }
   method cumplirAnios(){
    edad = edad + 1
   }
}
 class  Construcciones{
  var property tipoDeConstruccion
  method obtengoValor()= tipoDeConstruccion.valor()
 }

class Murallas{
  const longitud
  method valor() = 10 * longitud
}

class Museo{
  const superficieCubierta
  const indiceDeImportancia 
  method valor() = superficieCubierta * indiceDeImportancia.between(1,5)
}

class Planetas {
  const property personasHabitando = []
  const property construcciones = []


  method valioso () = construcciones.sum({construccion=>
  construccion.obtengoValor()
  })

  method delegacionDiplomatica(){
    return personasHabitando.filter({persona=>
    persona.destacada() || self.habitanteConMasRecursos(persona)
    })
    
  }
  method habitanteConMasRecursos(persona) = persona.recursos() > self.personaConMasRecursos(persona)


  method personaConMasRecursos()= personasHabitando.max({persona=>
   persona.recursos()
  }) 

}

class Productor inherits Personas {
  const property tecnicas = [cultivo]
  var property accion
  const property tiempo

  override method recursos()= self.monedas() * self.cantidadDeTecnicas()
  override method destacada() = super() || self.cantidadDeTecnicas() > 5
 
 method cantidadDeTecnicas () = tecnicas.size()

 method accionar() = accion.tipoDeAccion(tecnicas,self)

}

// class realizacionDeUnaAccion{
//   method tipoDeAccion(tecnicas,productor){
//     if(self.conoceLaTecnica(tecnicas,productor)){
//       self.ganarMonedas(productor)
//     }
//     else{
//       self.pierdoUnaUnidad(productor)
//     }
//   }
//   method conoceLaTecnica(tecnicas,productor){
//     self.tecnicas().contains(productor.tecnicas)
//   }
//   method ganarMonedas(tiempo,productor) {
//     productor.moneda = productor.moneda + (productor.tiempo() * 3)
//   }
//   method pierdoUnaUnidad(productor){
//    productor.moneda = productor.moneda - 1
//   }
// }

// class aprenderUnaTecnica {
//   const  tecnicaNueva
//   method tipoDeAccion(tecnicas,productor){
//     productor.tecnicas.add(tecnicaNueva)
//   }
// }
// class realizarUltimaTecnica {

//   method tipoDeAccion(tecnicas,persona){
//      if(self.viveEnElMismoPlaneta()){
//         self.realizoLaUltimaTecnica(tecnicas,persona)   
//      }
//   }
//   method realizoLaUltimaTecnica(tecnicas,persona){
//     const realizo = new realizacionDeUnaAccion{}
//     realizo.tipoDeAccion(tecnicas.last(),persona)
//   }

// }







