object knightRider {
    method peso() = 500
    method peligrosidad() = 10  
    method bulto() = 1
    method consecuencia() {}
}

object bumblebee {
    var estado = auto
    method peso() = 800
    method peligrosidad() = estado.peligrosidad()
    method transformar(unEstado) {
        estado = unEstado
}
    method bulto() = 2
    method consecuencia() {
        self.transformar(robot)
    }
}

object auto {
    method peligrosidad() = 15
}

object robot {
    method peligrosidad() = 30
}


object paqueteDeLadrillos {
    var property cantidad = 0
    method peso() {
        return 2 * cantidad
    }
    method peligrosidad() = 2
    method bulto() {
        if (cantidad.between(0, 100)) return 1
        if (cantidad.between(101, 300)) return 2
        return 3
    }
    method consecuencia() {
        cantidad += 12
    }
    
}

object arena {
    var property peso = 0
    method peligrosidad() = 1  
    method bulto() = 1
    method consecuencia() {
        peso -= 10
    }
}

object bateria {
    var estaConLosMisiles = true
    method cambiarEstado() {
        estaConLosMisiles = not estaConLosMisiles
    }
    method peso() {
        return if (estaConLosMisiles) {
            return 300
        } else {
            return 200
        }
    }
    method peligrosidad() {
        return if (estaConLosMisiles) {
            return 100
        } else {
            return 0
        }
    }
    method bulto() {
        if (estaConLosMisiles) return 2
        return 1
    }
    method consecuencia() {
        estaConLosMisiles = true
    }
}

object contenedorPortuario {
    const property cantCosasAdentro = []
    method agregarCosas(cosa) {
        cantCosasAdentro.add(cosa)
    }
    method quitarCosas(cosa) {
        cantCosasAdentro.remove(cosa)
    }
    method peso() {
        return 100 + cantCosasAdentro.sum({c => c.peso()})
    } 
    method peligrosidad() {
        if (cantCosasAdentro.isEmpty()) return 0
        return cantCosasAdentro.max({x => x.peligrosidad()}).peligrosidad()
        }
    method bulto() {
        return 1 + cantCosasAdentro.sum({c => c.bulto()})
    }
    method consecuencia() {
        cantCosasAdentro.all({c => c.consecuencia()})
    }
    }

object residuosRadioactivos {
    var property peso = 0
    method peligrosidad() = 200  
    method bulto() = 1
    method consecuencia() {
        peso += 15
    }
}

object embalaje {
    var property cosaEnvuelta = cosaNulleable
    method peso() {
        return cosaEnvuelta.peso()
    } 
    method peligrosidad() {
        return cosaEnvuelta.peligrosidad() / 2
    }
    method bulto() = 2
    method consecuencia() {}
}

object cosaNulleable {
    method peso() = 0
    method peligrosidad() = 0
}

