import wollok.game.*
import personaje.*
// se dice que se conocen los cultivos sembrados, pense guardar cad tipo en un array y se puede preguntar (si se quiere); si hay algun tipo de cultivo en la granja 
class Maiz {
	const maizPlantado = []

	method position() {
		return personaje.position()
	}
	method image() {
		return "corn_baby.png"
	}
	method plantar(){
		if(self.puedePlantar()){
			const maiz = new Maiz() 
			game.addVisual(maiz)
			maizPlantado.add(maiz)
		}else{
			self.noPuedePlantar()
		}
	}
	method hayMaiz(){
		return maizPlantado.any({maiz => maiz.position() == personaje.position()})
	}
	method puedePlantar(){
		return not Trigo.hayTrigo() && not Maiz.hayMaiz() && not Tomaco.hayTomaco()
	}
	method noPuedePlantar(){
		self.error("Ya hay algo plantado aca")
	}
}
class Trigo{
	const trigoPlantado = []

	method position(){
		return personaje.position()
	}
	method image(){
		return "wheat_0.png"
	}
	method plantar(){
		if(self.puedePlantar()){
			const trigo = new Trigo()
			game.addVisual(trigo)
			trigoPlantado.add(trigo)
		}else{
			self.noPuedePlantar()
		}
	}
	method hayTrigo(){
		return trigoPlantado.any({trigo => trigo.position() == personaje.position()})
	}
	method puedePlantar(){
		return not Trigo.hayTrigo() && not Maiz.hayMaiz() && not Tomaco.hayTomaco()
	}
	method noPuedePlantar(){
		self.error("Ya hay algo plantado aca")
	}
}
class Tomaco{
	const tomacoPlantado = []

	method position(){
		return personaje.position()
	}
	method image(){
		return "tomaco.png"
	}
	method plantar(){
		if(self.puedePlantar()){
			const tomaco = new Tomaco()
			game.addVisual(tomaco)
			tomacoPlantado.add(tomaco)
		}else{
			self.noPuedePlantar()
		}
	}
	method hayTomaco(){
		return tomacoPlantado.any({tomaco => tomaco.position() == personaje.position()})
	}
	method puedePlantar(){
		return not Trigo.hayTrigo() && not Maiz.hayMaiz() && not Tomaco.hayTomaco()
	}
	method noPuedePlantar(){
		self.error("Ya hay algo plantado aca")
	}
}
