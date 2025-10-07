import wollok.game.*
import personaje.*
// se dice que se conocen los cultivos sembrados, pense guardar cad tipo en un array y se puede preguntar (si se quiere); si hay algun tipo de cultivo en la granja 
class Maiz {
	//const maizPlantado = []
	var property position = game.origin()
	//var property estado = la primera fase del cultivo
	//podria hacer un array con los estados, y de ahi ir cambiandolos?

	method image() {
		return "corn_baby.png" // la imagen va a depender del estado 
	}
	method plantar(){
		const maiz = new Maiz(position = personaje.position()) 
		game.addVisual(maiz)
	}
	method noPuedePlantar(){
		self.error("Ya hay algo plantado aca") 
	}
	//REGAR 
}
class Trigo{
	//const trigoPlantado = []
	var property position = game.origin() 

	method image(){
		return "wheat_0.png"
	}
	method plantar(){
		const trigo = new Trigo(position = personaje.position())
		game.addVisual(trigo)
	}

	method noPuedePlantar(){
		self.error("Ya hay algo plantado aca")
	}
}
class Tomaco{
	//const tomacoPlantado = []
	var property position = game.origin()

	method image(){
		return "tomaco.png"
	}
	method plantar(){
		const tomaco = new Tomaco(position = personaje.position())
		game.addVisual(tomaco)
	}
	method noPuedePlantar(){
		self.error("Ya hay algo plantado aca")
	}
}
/*el metodo puedePlantar(), le pregunta a una clase, no a una instancia, por eso falla*/

object trigo0{
	var property image = "wheat_0.png"
}
object trigo1{
	var property image = "wheat_1.png" 
}
object trigo2{
	var property image = "wheat_2.png" 
}
object trigo3{
	var property image = "wheat_3.png"
}
object tomacoBaby{
	var property image = "tomaco_baby.png" 
}
object tomaco{
	var property image = "tomaco.png"
}
object cornBaby{
	var property image = "corn_baby.png"
}
object cornAdult{
	var property image = "corn_adult.png"
}