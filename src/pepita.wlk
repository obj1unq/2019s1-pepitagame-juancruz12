import ciudades.*
import wollok.game.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 

	var property position = game.at(3,3)
	method image() {
		if (energia>100){
	            return "pepita.png"
	            }
        else{return "pepita-gorda-raw.png"}
        }
	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad and energia> self.energiaParaVolar(self.distance(unaCiudad.position()))) { 
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		}
		if(ciudad==unaCiudad){
			game.say(self, "ya estoy aca")
		}
		else{game.say(self, "dame comida y voy")}
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
		self.position(nuevaPosicion)
	}
	
}
