class UserException inherits Exception { }
class Jugadores{ //21hs
  const property color = ""
  const property tripulante = false
  var property tipoDeTarea = arreglarElTableroElectrico
  var property herramientas = []
  const property mochila = [] // ítems varios que los jugadores usan
  // para resolver las tareas que se les asignan, pero son
  //de un solo uso, así que al ser usados se remueven de su mochila.

  var property nivelDeSospecha = 40
  const property tareasPendientes = []

 method esSospechoso()= nivelDeSospecha > 50
 method buscarUnItem(item) {
   mochila.add(item) // aca busca el item no lo usa, por eso lo agrega 
   // y no lo remueve de la mochila
 }

 method tarea() = if(tripulante) tipoDeTarea.realizaLaTarea(herramientas) else 
 throw new UserException(message = "Para hacer la tarea debe ser un tripulante")
 
}

object arreglarElTableroElectrico inherits Jugadores{
	method realizaLaTarea() {
		self.tieneLaHerramienta(herramientas)
        self.aumentaElNivelDeSospecha()
	}
	method tieneLaHerramienta(herramientas){
    mochila.contains(herramientas)
    }
    method aumentaElNivelDeSospecha(){
    nivelDeSospecha += 10
   }
   
}

object sacarLaBasura inherits Jugadores{
  method realizaLaTarea(){
     self.tieneLaHerramienta(herramientas)
     self.disminuyeElNivelDeSospecha()
     self.eliminaHerramienta(herramientas)
   }
  method eliminaHerramienta(herramientas){
  	mochila.remove(herramientas)
  }
  
   method tieneLaHerramienta(herramientas){ // este metodo deberia estar en la clase padre
    mochila.contains(herramientas)
    }
   method disminuyeElNivelDeSospecha(){
   nivelDeSospecha = nivelDeSospecha - 4
 }
}

object ventilarLaNave{
	method realizaLaTarea(nave){
     nave.aumentaNivelDeOxigeno()
 }
}

class Nave{
  
  const property tripulantes = []
  const property impostores = []
  var property nivelDeOxigeno = 0
  method lasTareasDeTodosFueronCompletadas(persona){
    if(not self.ExistenTareasPorHacer(persona)){
       throw new UserException(message = "Gananor Los Tripulantes")
    }
  }
 
  method aumentaNivelDeOxigeno() {
  	nivelDeOxigeno = nivelDeOxigeno + 5
  }
   method ExistenTareasPorHacer(persona) = persona.tareasPendientes().size()>0
}







