import wollok.game.*
object manzana {
	method image() = "manzana.png"
	
	method energia() = 80
	method position() = game.at(5,1)
}

object alpiste {
	method image() = "alpiste.png"
	method position()= game.at(5,5)
	method energia() = 5
}
