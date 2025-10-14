import wollok.game.*
import cultivos.*
import aspersor.*
import mercado.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const cultivosPlantados = []
	const cultivosCosechados = []
	const aspersores = []
	var property oroAcumulado = 0 

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
	method vender(){
		cultivosCosechados.forEach({cultivo => oroAcumulado = oroAcumulado + cultivo.valor()})
		cultivosCosechados.clear()
	}

	method ponerAspersor(){
		if(!self.hayCultivoEn(self.position()) && !self.hayAspersorEn(self.position())){
			const aspersor = new Aspersor(position = self.position())
			aspersores.add(aspersor)
			game.addVisual(aspersor)
		}else{
			self.noPuedeColocarAspersor()
		}
	}

	method venderEnMercado(mercado){
		if(mercado.puedePagar(self)){
			cultivosCosechados.forEach({cultivo => mercado.mercaderia().add(cultivo)})
			self.vender()
			mercado.pagarA(self)

		}else{
			self.noPuedeVenderAlMercado()
		}
	}

	method valorDeCosecha(){
        return self.preciosDeCultivos().sum()
    }
    method preciosDeCultivos(){
        return cultivosCosechados.map({cultivo => cultivo.valor()})
    }


	method hayCultivoEn(coordenada){
		return cultivosPlantados.any({cultivo => cultivo.position() == coordenada})
	}
	method cantCultivos(){
		return cultivosCosechados.size()
	}
	method hayAspersorEn(coordenada){
		return aspersores.any({aspersor => aspersor.position() == coordenada})
	}


	//ERRORES 
	method noHayCultivoParaRegar(){
		self.error("No hay cultivo para regar aca")
	}
	method noPuedePlantar(){
		self.error("Ya hay algo plantado aca") 
	}
	method noHayCultivoParaCosechar(){
		self.error("No hay cultivo para cosechar aca")
	}
	method noPuedeColocarAspersor(){
		self.error("No puedo poner un aspersor aca")
	}
	method noPuedeVenderAlMercado(){
		self.error("El mercado no tiene dinero suficiente")
	}

}
