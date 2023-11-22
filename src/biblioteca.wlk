 class Empleados{
  
  const property habilidades = []
  var property saludVariable = 0 
  method  saludCritica () =  0 

  method incapacitado()= saludVariable < self.saludCritica()
  method puedeUsarLaHabilidad(persona)= !incapacitado && habilidades.contains(persona.habilidad)// considerar el caso de los jefes
  method cumplirUnaMision(persona,mision) = persona.habilidades() == mision.habilidadesRequeridas() // chequear esto para equipos
  method sobreviveAUnaMision()
 }

 class Mision{
	const property habilidadesRequeridas = []
 }

 class Espias inherits  Empleados{
   
    method aprenderNuevasHabilidades(mision) {
      self.habilidades.add(mision.habilidad)
	} 
	 
	method override saludCritica() = 15

 }
 class Oficinitas inherits  Empleados{

	method override saludCritica() = 40 - cantidadDeEstrellasObtenidads() *  5
	method sobreviveAUnaMision()
 }

 class DangerZone{
  const property misiones = []

 }