import cosas.*
object camion {
    const property cosasDentro = []
    method cargar(unaCosa) {
        cosasDentro.add(unaCosa)
    }
    method descargar(unaCosa) {
        cosasDentro.remove(unaCosa)
    }

    method sonImpares() {
        return cosas.all({c => c.peso().odd()})
    }

    method peso() {
        return cosasDentro.sum({c => c.peso()}) + 1000
    }

    method existeEntre(valor1, valor2) {
        return cosasDentro.any({x => x.peso().between(valor1, valor2)})
    } 
    method masPesada() {
        return cosasDentro.max({x => x.peso()})
    }

    method cosaQuePesa(unValor) {
        return cosasDentro.any({c => c.peso() == unValor}) 
    }

    method nivelPeligrosidad(unNivel) {
        return cosasDentro.find({c => c.peligrosidad() == unNivel})
    }

    method superanNivel(unNivel) {
        return cosasDentro.filter({c => c.peligrosidad() > unNivel})
    }

    method estaExcedido() {
        return self.peso() > 2500
    }

    method puedeCircular(nivelPeligro) {
        return not self.estaExcedido() and self.todasSonMenosPeligrosas(nivelPeligro)
    }

    method todasSonMenosPeligrosas(unNivel) {
        return cosasDentro.all({c => c.peligrosidad() < unNivel})
    }

}