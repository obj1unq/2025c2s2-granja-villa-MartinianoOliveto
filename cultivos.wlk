import wollok.game.*
import personaje.*
// se dice que se conocen los cultivos sembrados, pense guardar cad tipo en un array y se puede preguntar (si se quiere); si hay algun tipo de cultivo en la granja 
class Maiz {
	//const maizPlantado = []
	var property position = game.origin()
	var property estado = cornBaby
	
	method image() {
		return estado.image() // la imagen va a depender del estado 
	}
	method crecer(){
		estado = estado.siguiente()
	}
}
class Trigo{
	//const trigoPlantado = []
	var property position = game.origin() 
	var property estado = trigo0 

	method image(){
		return "wheat_0.png"
	}
	method crecer(){
		estado = estado.siguiente()
	}
}
class Tomaco{
	//const tomacoPlantado = []
	var property position = game.origin()

	method image(){
		return "tomaco.png"
	}
	method crecer(){

	}
}


object trigo0{
	var property image = "wheat_0.png"

	method siguiente(){
		return trigo1
	}
}
object trigo1{
	var property image = "wheat_1.png" 

	method siguiente(){
		return trigo2 
	}
}
object trigo2{
	var property image = "wheat_2.png" 

	method siguiente(){
		return trigo3 
	}
}
object trigo3{
	var property image = "wheat_3.png"

	method siguiente(){
		return trigo0
	}
}
object tomacoBaby{
	var property image = "tomaco_baby.png" 
}
object tomaco{
	var property image = "tomaco.png"
}
object cornBaby{
	var property image = "corn_baby.png"

	method siguiente(){
		return cornAdult
	}
}
object cornAdult{
	var property image = "corn_adult.png"

	method siguiente(){
		return self 
	}
}