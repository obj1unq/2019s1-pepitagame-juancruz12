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
		game.removeVisual(comida)
		
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
	method teEncontro(alguien){
		return null
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
			self.comida(_comida)
		}
	}
	
	method tirarComidaQueTiene(){
		if (comida!=[ ]){
			var comidaATirar = comida
			game.addVisualIn(comidaATirar,game.at(1.randomUpTo(10),1.randomUpTo(10)))
			game.whenCollideDo(comidaATirar, {roque => roque.agarrarComida(comidaATirar) })
			
		}
	}
	method alimentarAve(pajaro){
		if(comida!=[ ]){
		pepita.come(comida)
		game.addVisualIn(comida,game.at(1.randomUpTo(10),1.randomUpTo(10)))
		game.whenCollideDo(comida, {roque => roque.agarrarComida(comida) })
		comida=[ ]
		}
	}
	method tirarManzana(){
		const manzanaNueva=new Comida()
		manzanaNueva.energia(80)
		manzanaNueva.image("manzana.png")
		manzanaNueva.position(5,7)
		game.addVisual(manzanaNueva)
		game.whenCollideDo(manzanaNueva,{pepita=>pepita.come(manzanaNueva)})
		
	}
	
	method tirarAlpiste(){
		game.addVisual(alpiste)
		game.whenCollideDo(alpiste,{pepita=>pepita.come(alpiste)})
	
	}
}



