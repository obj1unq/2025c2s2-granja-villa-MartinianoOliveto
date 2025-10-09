import wollok.game.*
import personaje.*
// se dice que se conocen los cultivos sembrados, pense guardar cad tipo en un array y se puede preguntar (si se quiere); si hay algun tipo de cultivo en la granja 
class Maiz {
	var property position = game.origin()
	var property estado = cornBaby
	
	method image() {
		return estado.image() // la imagen va a depender del estado 
	}
	method crecer(){
		estado = estado.siguiente()
	}
	method esAptoCosecha(){
		return estado == cornAdult // resolverlo de otra forma 
	}
	method valor(){
		return 150 
	}
	
}
class Trigo{
	var property position = game.origin() 
	var property estado = trigo0 

	method image(){
		return estado.image()
	}
	method crecer(){
		estado = estado.siguiente()
	}
	method esAptoCosecha(){
		return self.estaEnEstado(trigo2) || self.estaEnEstado(trigo3)
	}
	method estaEnEstado(_estado){
		return estado == _estado 
	}
	method valor(){
		if(self.estaEnEstado(trigo2)){
			return 200
		}else{
			return 300 
		}
	}
}
class Tomaco{
	
	var property position = game.origin()
	var property estado = tomacoBaby

	method image(){
		return estado.image()
	}
	method crecer(){
		estado = estado.siguiente()
		self.moverseArriba()
	}
	
	method moverseArriba(){
		if(position.y() != game.height()){
			self.position(self.position().up(1))
		}
		else{
			self.position(self.position().down(9))// al llegar al borde desaparece 
			//game.addVisual(self)
		}
	}
	method esAptoCosecha(){
		return true 
	}
	method valor(){
		return 80 
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

	method siguiente(){
		return tomaco 
	}
}
object tomaco{
	var property image = "tomaco.png"

	method siguiente(){
		return self 
	}
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