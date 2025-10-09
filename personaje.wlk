import wollok.game.*
import cultivos.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const cultivosPlantados = []
	const cultivosCosechados = []

	method plantarMaiz(){
		if(! self.hayCultivoEn(position)){
		const maiz = new Maiz(position = self.position()) 
		cultivosPlantados.add(maiz)
		game.addVisual(maiz)
		}else{
			self.noPuedePlantar()
		}
	}
	method plantarTrigo(){
		if(! self.hayCultivoEn(position)){
		const trigo = new Trigo(position = self.position())
		cultivosPlantados.add(trigo)
		game.addVisual(trigo)
		}else{
			self.noPuedePlantar()
		}
	}
	method plantarTomaco(){
		if(! self.hayCultivoEn(position)){
		const tomaco = new Tomaco(position = self.position())
		cultivosPlantados.add(tomaco)
		game.addVisual(tomaco)
		}else{
			self.noPuedePlantar()
		}
	}
	method regar(){
		if(self.hayCultivoEn(position)){
			const cultivo = cultivosPlantados.find({cultivo => cultivo.position() == position})
			cultivo.crecer()
		}else{
			self.noHayCultivoParaRegar()
		}
	}
	method cosechar(){
		if(self.hayCultivoEn(position)){
			const cultivo = cultivosPlantados.find({cultivo => cultivo.position() == position})
			//cultivo.cosechar()	
			self.verificarSiSePuedeCosechar(cultivo)
		}else{
			self.noHayCultivoParaCosechar()
		}
	}
	method verificarSiSePuedeCosechar(cultivo){
		if(cultivo.esAptoCosecha()){
			cultivosCosechados.add(cultivo)
			cultivosPlantados.remove(cultivo)
			game.removeVisual(cultivo)
		}
	}

	method hayCultivoEn(coordenada){
		return cultivosPlantados.any({cultivo => cultivo.position() == coordenada})
	}
	method noHayCultivoParaRegar(){
		self.error("No hay cultivo para regar aca")
	}
	method noPuedePlantar(){
		self.error("Ya hay algo plantado aca") 
	}
	method noHayCultivoParaCosechar(){
		self.error("No hay cultivo para cosechar aca")
	}

}
