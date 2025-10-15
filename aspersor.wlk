import personaje.*
import wollok.game.*
import cultivos.*

class Aspersor{
    var property position = game.origin()
    var property image = "aspersor.png"

    method regarEnTodasLasDirecciones(){
        self.regarHacia(game.at(self.position().x() + 1, self.position().y())) //derecha 
        self.regarHacia(game.at(self.position().x() - 1, self.position().y())) //izquierda
        self.regarHacia(game.at(self.position().x(), self.position().y() + 1)) //arriba
        self.regarHacia((game.at(self.position().x() + 1, self.position().y() - 1))) //abajo
        self.regarHacia(game.at(self.position().x() + 1, self.position().y() + 1))//diagonal derecha 
        self.regarHacia(game.at(self.position().x() - 1, self.position().y() + 1))//diagonal izquierda 
        self.regarHacia(game.at(self.position().x() + 1, self.position().y() - 1))//diagonal derecha abajo  
        self.regarHacia(self.position().x() - 1 && self.position().y() - 1)//diagonal izquierda abajo 
    }
    method regarHacia(coordenada){
        if(personaje.hayCultivoEn(coordenada)){
        const cultivo = personaje.cultivosPlantados.find({cultivo => cultivo.position() == coordenada})
        cultivo.crecer()
        }
    }
}

