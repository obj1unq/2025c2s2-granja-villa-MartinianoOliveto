import personaje.*
import wollok.game.*
import cultivos.*

class Aspersor{
    var property position = game.origin()
    var property image = "aspersor.png"

    method regarEnTodasLasDirecciones(){
        self.regarHaciaSiPuede(self.position().x() + 1) //derecha 
        self.regarHaciaSiPuede(self.position().x() - 1) //izquierda
        self.regarHaciaSiPuede(self.position().y() + 1) //arriba
        self.regarHaciaSiPuede(self.position().y() - 1) //abajo
    }
    method regarHaciaSiPuede(coordenada){
        if(personaje.hayCultivoEn(coordenada)){
            const cultivo = personaje.cultivosPlantados.find({cultivo => cultivo.position() == coordenada})
            //cultivo.crecer()
            game.onTick(1000, "aspersor riega", {cultivo.crecer()})
        }
    }
}

