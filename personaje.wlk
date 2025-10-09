import wollok.game.*
import cultivos.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const cultivosPlantados = []

	method plantarMaiz(){
		const maiz = new Maiz(position = self.position()) 
		cultivosPlantados.add(maiz)
		game.addVisual(maiz)
	}
	method plantarTrigo(){
		const trigo = new Trigo(position = self.position())
		cultivosPlantados.add(trigo)
		game.addVisual(trigo)
	}
	method plantarTomaco(){
		const tomaco = new Tomaco(position = self.position())
		cultivosPlantados.add(tomaco)
		game.addVisual(tomaco)
	}




	method regar(){
		if(self.hayCultivoEn(position)){
			const cultivo =cultivosPlantados.find({cultivo => cultivo.position() == position})
			cultivo.crecer()
		}else{
			self.noHayCultivo()
		}
	}

	method hayCultivoEn(coordenada){
		return cultivosPlantados.any({cultivo => cultivo.position() == coordenada})
	}
	method noHayCultivo(){
		self.error("No hay ningun cultivo para regar")
	}
	method noPuedePlantar(){
		self.error("Ya hay algo plantado aca") 
	}

}
