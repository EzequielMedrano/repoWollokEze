class Persona {
 var property tiempoQueVaATomarElTrabajo = 0 
 method obtengoNombre(_nombre){nombre = _nombre}
 //var property tiempoDeUnTrabajoCorto = 30 //esto creo que no es correspondiente a la persona como tal
// method trabajoCorto()= tiempoQueTrabaja < 30

}

class Tarea{
	const property lugar //interior o exterior

	const property puntosDeRecompensa = 0

	const property  personasInvolucradas1 = []

    method trabajoCorto()= tiempoQueTrabaja < 30

	method trabajoAdicional(tarea,persona)

	method quienHizoLaTarea(persona) = persona.nombre 

	method personasInvolucradas2(persona)

}

object Pam inherits Tarea{

    override method trabajoAdicional(tarea) = tarea.quienHizoLaTarea()=="Jim"

}

object Jim inherits Persona{

    override method trabajoAdicional(tarea) = tarea.lugar = "Exterior"

}
object Dwight  inherits Persona{

  override method trabajoAdicional(tarea) = tarea.puntosDeRecompensa > 100

}

object Resto inherits Persona{

	override method trabajoAdicional(tarea)= tarea.personasInvolucradas > 3 // de aca se que personasinvolucradas va a ser una lista

}

