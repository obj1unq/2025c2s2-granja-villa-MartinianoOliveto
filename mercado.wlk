import wollok.game.*
import personaje.*

class Mercado{
    var property dinero = 5000
    var property position = game.origin()
    var property mercaderia = []
    var property image = "market.png"

    method pagarA(personaje){
        dinero = dinero -personaje.oroAcumulado()
    }
    method puedePagar(personaje){
        return dinero >= personaje.valorDeCosecha()
    }
}

const mercadoNorte = new Mercado(position = game.at(9,9))
const mercadoSur = new Mercado(position = game.at(5,0), dinero = 0)