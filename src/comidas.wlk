import wollok.game.*
import pepita.*
object manzana {
	method image() = "manzana.png"
	
	method energia() = 80
	method position(){return game.at(5,6)}
	method teEncontro(alguien){
		alguien.agarrarComida(self)
	}
}

object alpiste {
	method image() = "alpiste.png"
	method position(){return game.at(5,5)}
	method energia() = 5
	method teEncontro(alguien){
		alguien.agarrarComida(self)
	}
}
class Comida{
	var property energia
	var property image="imagen"
	var position
	method position(x,y){
		position= game.at(x,y)
	}
	method teEncontro(alguien){
		alguien.agarrarComida(self)
	}
	
}

