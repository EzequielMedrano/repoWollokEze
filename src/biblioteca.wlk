/*

╔╦╗╔═╗  ╔═╗╔╗  ╦╔═╗╔═╗╔╦╗╔═╗╔═╗       ╔╗ ╦╔╗ ╦  ╦╔═╗╔╦╗╔═╗╔═╗╔═╗
 ║ ╠═╝  ║ ║╠╩╗ ║║╣ ║   ║ ║ ║╚═╗  ───  ╠╩╗║╠╩╗║  ║║ ║ ║ ║╣ ║  ╠═╣
 ╩ ╩    ╚═╝╚═╝╚╝╚═╝╚═╝ ╩ ╚═╝╚═╝       ╚═╝╩╚═╝╩═╝╩╚═╝ ╩ ╚═╝╚═╝╩ ╩
      _.--._  _.--._
,-=.-":;:;:;\':;:;:;"-._
\\\:;:;:;:;:;\:;:;:;:;:;\
 \\\:;:;:;:;:;\:;:;:;:;:;\
  \\\:;:;:;:;:;\:;:;:;:;:;\
   \\\:;:;:;:;:;\:;::;:;:;:\
    \\\;:;::;:;:;\:;:;:;::;:\
     \\\;;:;:_:--:\:_:--:_;:;\
      \\\_.-"      :      "-._\
       \`_..--""--.;.--""--.._=>
        "
┌──────────────────────────┐
│                          │
│      INTEGRANTE 1        │
│                          │
└──────────────────────────┘
*/

object fahrenheit {
	const autor = "Ray Bradburys"
	const valoracionVersionTexto = 3500
	const valoracionVersionIlustrada = 8000
	var version = "texto"

	method actualizoVersion(tipoDeVersion){
		version = tipoDeVersion
		return version
	}

	// Metodos comunes
	method autor() = autor
	method valoracion(){
		return if (version == "texto") valoracionVersionTexto else valoracionVersionIlustrada
	}
	method precio(){
	  const precioBase = 5000
	  const precioExtra = 1000
	  return if (version == "texto") precioBase else precioBase + precioExtra
	}
	// ---------------
}

/*
┌──────────────────────────┐
│                          │
│      INTEGRANTE 2        │
│                          │
└──────────────────────────┘
*/

object cuidadoConElPerro{
	const autor = "Liliana Cinetto"
	const valoracionBase = 5000
	var precioBase = 2900

	method precioExtra() = if(precioBase.even()) 500 else 600

	method ajustarPrecioBase(nuevoPrecio){
		precioBase = nuevoPrecio
	}

	// Metodos comunes
	method autor() = autor
	method valoracion() = valoracionBase + (self.precio() / 2)
	method precio() = precioBase + self.precioExtra()
	// ---------------
}

/*
┌──────────────────────────┐
│                          │
│      INTEGRANTE 3        │
│                          │
└──────────────────────────┘
*/
object patronesDeDisenio {
	const autor = "Erich Gamma"
	var likes = 300

	method sumarLikes(cantidad){
		likes = likes + cantidad
	}
	method valorImaginario() = (likes + 8) * 1.5

	// Metodos comunes
	method autor() = autor
	method valoracion() = 4000 + self.valorImaginario() * 2
	method precio() = if (self.valorImaginario().even()) 5000 else 6000
	// ---------------

}

// Personas
/*
┌──────────────────────────┐
│                          │
│      INTEGRANTE 1        │
│                          │
└──────────────────────────┘
*/

object cristina	{
	const precioBase = 5501 // no es 5500, porque dice que le gustan los que valen mas de
	//5500

	method leGustaElLibro(libro) = libro.autor() == "Liliana Cinetto"
	||  libro.precio() > precioBase
}


/*
┌──────────────────────────┐
│                          │
│      INTEGRANTE 2        │
│                          │
└──────────────────────────┘
*/

object roberto{
	method leGustaElLibro(libro) = ["Erich Gamma","Jorge Bucay"].contains(libro.autor())
}

/*
┌──────────────────────────┐
│                          │
│      INTEGRANTE 3        │
│                          │
└──────────────────────────┘
*/

object patricia{
	var buenHumor = true;
	method ponerseDeBuenHumor(){
		buenHumor = true;
	}
	method ponerseDeMalHumor(){
		buenHumor = false;
	}
	method buenHumor() = buenHumor
	method leGustaElLibro(libro) = self.buenHumor() or libro.precio() > 4000
}

/*
	███████╗███╗   ██╗████████╗██████╗ ███████╗ ██████╗  █████╗     ██████╗
	██╔════╝████╗  ██║╚══██╔══╝██╔══██╗██╔════╝██╔════╝ ██╔══██╗    ╚════██╗
	█████╗  ██╔██╗ ██║   ██║   ██████╔╝█████╗  ██║  ███╗███████║     █████╔╝
	██╔══╝  ██║╚██╗██║   ██║   ██╔══██╗██╔══╝  ██║   ██║██╔══██║    ██╔═══╝
	███████╗██║ ╚████║   ██║   ██║  ██║███████╗╚██████╔╝██║  ██║    ███████╗
	╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝    ╚══════╝

┌──────────────────────────┐
│                          │
│      INTEGRANTE 1        │
│                          │
└──────────────────────────┘
*/
class UserException inherits Exception { }

class Libro{
	const precioBase = 3000
	const paginas = 0
	var valoracionBase = 3000 /* Se declara var porque dice que puede variar con el tiempo */
	const property autor = ""
	const property reviews = []
	const precioExtra = new Range(start = 1000, end = 2000).anyOne() // Numero pseudo-random entre 1000 y 2000

	method precio() =
		precioBase + (if (paginas * 5 > 1000) 1000 else (paginas * 5)) + precioExtra

	method hacerReview(_puntaje,_comentario){
		if(_puntaje < 0){
			throw new UserException(message = "El puntaje del review no puede ser negativo")
		}
		if(_comentario.trim().length() < 5){
			throw new UserException(message = "El comentario del review debe tener al menos 5 carácteres")
		}
		reviews.add(new Review(puntaje = _puntaje,comentario = _comentario))
	}

	method valoracion() = valoracionBase + if (paginas > 150) 4000 else 3000

	method reviewsGrosas(){
		return reviews.filter({ review => review.puntaje() > 9 })
	}

	method promedioReviews(){
		return reviews.sum({ review => review.puntaje()}) / reviews.size()
	}
}

class Review{
 	const property puntaje = 0
 	const property comentario = ""

 	method mostrar() = "Puntaje: " + puntaje + "\nComentario: " + comentario
}

/*
┌──────────────────────────┐
│                          │
│      INTEGRANTE 2        │
│                          │
└──────────────────────────┘
*/

class Persona {
	var property dinero = 1000
	var property limiteValoracion = 0 // Debe inicializarse para cada persona, variable segun consigna
	var property compras = []
	const precioLimite = 8000

	method leGustaLibro(libro) {
		return libro.precio() <= dinero && libro.valoracion() > limiteValoracion
	}

	method agregarCompra(compra) {
		if (self.puedeComprar(compra)) {
			compras.add(compra)
			dinero = dinero - compra.precioTotal()
		} else {
			throw new UserException(message = "No es posible realizar la compra.")
		}
	}

	method tieneComprasCaras() {
		return compras.any({ compra => compra.precioTotal() > precioLimite })
	}

	method comprasDelMesActual() {
    const hoy = new Date()
		return compras.filter({ compra => compra.mesCompra() == hoy.month() })
	}

 	method puedeComprar(compra) = compra.libros().all({ libro => self.leGustaLibro(libro) }) &&
    dinero > compra.precioTotal()
}


/*
┌──────────────────────────┐
│                          │
│       INTEGRANTE 3       │
│                          │
└──────────────────────────┘
*/

class Compra {
	const property libros = []
	const property listaCupones = []
	const property fechaCompra = new Date()

	method agregarLibro(libro) {
		libros.add(libro)
	}

	method agregarCupon(cupon) {
		listaCupones.add(cupon)
	}

	method precioTotal(cupon) = libros.sum({ libro => libro.precio() })
		* (if (listaCupones.contains(cupon)) 0.9 else 1)
		* (if (self.diaCompra() == "friday"  ) 0.8 else 1)

	method precioTotal() = self.precioTotal("")


	method mesCompra() = fechaCompra.month()
	method diaCompra() = fechaCompra.dayOfWeek().toString()

	method bienValorados() = libros.filter({ libro => libro.valoracion() > 4000 })
	method nombresAutores() = libros.map({ libro => libro.autor() })
}

/////////////////////////////////////////

class LibroInicial inherits Persona{
  return leGustaElLibro(self)
}

object LibroDrama inherits LibroInicial {
 
  method esAptoParaUnaPersona (libro){
	return libro.valoracion > 4000 && tieneUnaCantidadParDeCompras()
  }
  method tieneUnaCantidadParDeCompras(persona){
		return Main.(persona.compras())
  }
} 

object libroCiencia inherits LibroInicial{
	const property editorial = ""
  method esAptoParaUnaPersona(self){
	return editorial == ("Pearson")
  }
}
 object novelasCaras inherits LibroInicial{
		method esAptoParaUnaPersona(persona){
			return persona.dinero() > persona.precioLimite()
		}
 }

 object lasAventurasDePatoruzu inherits Libro({autor="Dante Quinterno",paginas=35})

