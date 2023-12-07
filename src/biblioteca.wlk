class UserException inherits Exception {

}
object validacionPrevia{
	
	method estudiaAlgoQueNoLeGusta()
		= new UserException(message = "Debe estudiar una carrera que le guste")
		
	method yaSeHabiaRecibido()
		= new UserException(message = "Ya se habia recibido de esta carrera")
		
	method inconformeConElSueldo()
		= new UserException(message = "Debe estar conforme con el sueldo")
    method noPuedeAdoptarUnHijo()
     = new UserException(message = "Para adoptar , no debe tener hijos")

}
class Persona{
	//suenios = []
	const property edad = 0
	var property carrerasQueQuierenEstudiar = []
	var property plataQueQuiereGanar = 0
	const property lugaresQueQuiereViajar = []
	const property carrerasHechas = []
	var property hijos = 0
	const property suenios = []
	var property tipoDePersona 
	
	method cumpleSuSuenioMasPreciado()= tipoDePersona.cumpleSuenioPreciado(self)
	
	method cumplirUnSuenio(suenio){
		if(!self.trataDeRecibirse(suenio))
		throw validacionPrevia.estudiaAlgoQueNoLeGusta()
		if(self.yaSeHabiaRecibido(suenio))
		throw validacionPrevia.yaSeHabiaRecibido()
		if(self.conformeConElSueldo(suenio))
		throw validacionPrevia.inconformeConElSueldo()
		if(self.puedeTenerHijos())
		throw validacionPrevia.noPuedeAdoptarUnHijo()
		suenio.cumpleElSuenio()
	}
	method trataDeRecibirse(suenio) =  carrerasQueQuierenEstudiar.contains(suenio)
	method yaSeHabiaRecibido(suenio)= carrerasHechas.contains(suenio)
	method conformeConElSueldo(suenio)= suenio.pago() > plataQueQuiereGanar
	method puedeTenerHijos()= hijos == 0
	
	method suenioMultiple(){
		suenios.all({suenio=>self.cumplirUnSuenio(suenio)})
	}// refactorizar esto
	
}

object realista{
	method cumpleSuenioPreciado(persona) {
		
	}
}
object alocados{
	method cumpleSuenioPreciado(persona){
		persona.suenios().any({suenio=>persona.cumplirUnSuenio(suenio)})
	}// falta delegar
}
object obsesivos{
	method cumpleSuenioPreciado(persona){
	persona.cumplirUnSuenio(self.primerSuenioDeLaLista(persona))
	}
	method primerSuenioDeLaLista(persona)= persona.suenios().first()
}
class Suenio{
	const property sueniosCumplidos = []
	const property sueniosPendientes = []
	const property pago = 0
	const property nivelDeFelicidad
	method cumpleElSuenio(){
		sueniosCumplidos.add(self)
		sueniosPendientes.remove(self)
	}
}





