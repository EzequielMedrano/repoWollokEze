object estudioso{
	method estudiaPara(parcial,alumno){
		return true
	}
}
object vago{
	// method estudiaPara(parcial,alumno){
	// 	return alumno.notas().last() < 6 //estoy tomando demasiada informacion, poco coehsivo, ESTA MAL HACER SAPITO(osea .().().)
	// }
	method estudiaPara(parcial,alumno){ // por lo que veo no le importa si en un metodo no le doy utilidad a un metodo
		return alumno.desaproboElUltimoParcial(alumno) 
	}
}
object hijosDelRigor{
	// method estudiaPara(parcial,alumno){
	// 	return parcial.cantidadPreguntas() > 5 // podria delegar esta decision en un metodo. NO LES GUSTA QUE TOME DECISIONES, SINO QUE SOLO DEVUELVA SE SE CUMPLE O NO EL METHOD QUE HACE ESO 
	// }
	method estudiaPara(parcial,alumno){
		return parcial.esDificil()
	}


}

class Alumno {
	const notas = []
	var property tipoAlumno = estudioso

	method rendir(nota){
	 notas.add(nota)
	}
	// method estudiaPara(parcial){// ESTA SOLUCION ES CON EL IF
	// 	if(tipoAlumno=="E")// es mejor trabajar con objetos , si trabajo con strings me estoy comprando un problema al pedo
	// 	return true
	// }
	// if(tipoAlumno == "V"){
	// 	return notas.last() < 6
	// }
	// if(tipoAlumno == "H"){
	// 	return parcial.cantidadPreguntas() > 5
	// }
	method desaproboElUltimoParcial(alumno){
		return notas().last() < 6
	}
	method estudiaPara(parcial){
		//return estudioso.estudiaPara(parcial,self) // de esta forma siempre va a ser estudioso 
	  return tipoAlumno.estudiaPara(parcial,self) 
	  // no declaro  ninguna clase el method  estudiaPara de aridad 2 , sin embargo es el algo que si se definio en
	  // method definidos en otros objetos 
	}
}
class Parcial{
	const property cantidadPreguntas
	method esDificil(){
		cantidadPreguntas() > 5
	}
}