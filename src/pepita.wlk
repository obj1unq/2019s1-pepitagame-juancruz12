import ciudades.*
import wollok.game.*
import comidas.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 

	var property position = game.at(3,3)
	method image(){
		if(self.energia()>100){
			return "pepita-gorda-raw.png"
		}
		else{return "pepita.png"}
	}

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad and self.energia()>self.energiaParaVolar(position.distance(unaCiudad.position()))) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		}
		else{if(ciudad == unaCiudad){
			game.say(self,"ya estoy aca")
		}
		else{game.say(self,"dame comida y voy")}
		}
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
		self.position(nuevaPosicion)
	}	
	method volaYCome(comida){
		self.move(comida.position())
		self.come(comida)
		game.removeVisual(comida)
	}

}
object roque{
	var property position = game.at(3,4)
	var property comida=[ ] 
	method image() {return "jugador.png"}
	
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
	method agarrarComida(_comida){
		if(self.comida()!=_comida){
			game.removeVisual(_comida)
			self.tirarComidaQueTiene()
			return self.comida(_comida)
		}
	}
	method tirarComidaQueTiene(){
		if (comida!=[ ]){
			game.addVisualIn(comida,game.at(1.randomUpTo(10),1.randomUpTo(10)))
		}
	}
}



