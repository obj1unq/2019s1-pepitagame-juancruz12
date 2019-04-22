import ciudades.*
import wollok.game.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 
    var amiga=""
	var property position = game.at(3,3)
	method image() { if(self.energia()<100){return "pepita.png"} else{return "pepita-gorda-raw.png"}}

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad and self.puedeVolarHacia(unaCiudad) ) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		}
		if(self.ciudad()==unaCiudad){return"ya estoy aca "}
		else{return "dame comida y despues vemos"}
	}
	method puedeVolarHacia(unaCiudad){
		return self.energiaParaVolar(position.distance(unaCiudad))<=self.energia()
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
		self.position(nuevaPosicion)
	}	
	method nuevaAmiga(ave){
		if(amiga != ave){
		game.say(self, "hola"+ave.nombre()+"!")
	    amiga=ave
	  }
	}
	method volaYCome(comida){
		self.move(comida.position())
		self.come(comida)
		
        	
	}
}
object pepona{
	method image() = "pepona.png"
	method position()= game.at(2,8)
	method nombre()="pepona"
	
}
object pipa{
	method image() = "pepitaCanchera.png"
	method position()= game.at(5,8)
}

object roque{
	method image()= "jugador.png"
}



