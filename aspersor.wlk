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
        self.regarHaciaSiPuede(self.position().x() + 1 && self.position().y() + 1)//diagonal derecha 
        self.regarHaciaSiPuede(self.position().x() - 1 && self.position().y() + 1)//diagonal izquierda 
        self.regarHaciaSiPuede(self.position().x() + 1 && self.position().y() - 1)//diagonal derecha abajo  
        self.regarHaciaSiPuede(self.position().x() - 1 && self.position().y() - 1)//diagonal izquierda abajo 
    }
    method regarHaciaSiPuede(coordenada){
        if(personaje.hayCultivoEn(coordenada)){
            const cultivo = personaje.cultivosPlantados.find({cultivo => cultivo.position() == coordenada})
            cultivo.crecer()
        }
    }
}

