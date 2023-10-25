
class UserException inherits Exception { }

class Micro {
 
	var property volumenDeMicro = 0
	var property pasajerosSentados = 0
	var property capacidadParaIrSentado = 0
	var property capacidadParaIrParado = 0
	var property pasajerosParados = 0
	var property personasEnElMicro = []

	var property cantidadLimite = 0


		method hayLugarEnElMicro() = cantidadLimite > self.cantidadDePasajeros()
		
		method lugaresLibres(){// no importa si son asientos libres o van parados
		return cantidadLimite - self.cantidadDePasajeros()
		}
		method cantidadDePasajeros(){
			return pasajerosSentados+pasajerosParados
		}
		method puedeViajar(persona){
			if(persona.cumpleLaCondicionDel(self)&& self.hayLugarEnElMicro() ){
				personasEnElMicro.add(persona)
			}
			else{
				throw new UserException(message = "revise de nuevo si la persona cumple con las condiciones para subir al micro")
			}
		}
 
}


class Apurado{
	method cumpleLaCondicionDel(micro)= true
}
class Claustrofobicos{
	const volumenEsperado = 120
	method cumpleLaCondicionDel(micro)=  micro.volumenDeMicro() > volumenEsperado
}

class Fiacas{
	method cumpleLaCondicionDel(micro)= micro.pasajerosSentados() < micro.capacidadParaIrSentado()
}

class Moderados{
	var property cantidadEsperadadDeAsientosLibres = 0
	method cumpleLaCondicionDel(micro) = cantidadEsperadadDeAsientosLibres < micro.lugaresLibres()
}
class Obsecuentes {
	var jefe = 0
	method cumpleLaCondicionDel(micro) = jefe.cumpleLaCondicionDel(micro)
}