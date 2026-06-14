object ciudadFuturista{
    var property limitePorEscuadron = 10
}
class Dron{
    var autonomia
    var nivelProcesamiento
    var mision
    
    method esAvanzado() = self.condicionAdicional() || mision.esAvanzadoElDron(self)
    method capacidadOperativa() = (autonomia*10) + mision.capacidadQueOtorga()
    method condicionAdicional()
    
    
    method disminuirAutonomiaEn(cant){
        autonomia -= cant
    }
    method reprogramar(unaMision){
        mision = unaMision
    }
}
class DronComercial inherits Dron{
    override method capacidadOperativa() = super() * 1.1
    override method condicionAdicional() = false
}
class DronSeguridad inherits Dron{
    override method condicionAdicional() = nivelProcesamiento>50
}
class Escuadron{
    const drones = []
    
    method agregarDron(unDron){
        if (drones.size() < ciudadFuturista.limitePorEscuadron())
            drones.add(unDron)
        else
            self.error("Supera la cantidad maxima definida por la ciudad")
    }
    method operarSobre(unaZona){
        if (self.puedeOperarEn(unaZona))
            unaZona.registrarOperacion()
            self.disminuirAutonomiaDeEscuadron()
    }
    method disminuirAutonomiaDeEscuadron(){
        drones.forEach({d => d.disminuirAutonomiaEn(d.autonomia()*0.05)})
    }

    method capacidadOperativaDeEscuadron() = drones.sum({d => d.capacidadOperativa()})
    method puedeOperarEn(unaZona) = drones.any({d => d.esAvanzado()}) && self.puedeCubrirLaZona(unaZona)
    method puedeCubrirLaZona(unaZona) = self.capacidadOperativaDeEscuadron() > unaZona.tamaño()*1.5
}
class Zona{
    const property tamaño
    var cantOperacionesRecibidas
    
    method registrarOperacion(){
        cantOperacionesRecibidas+=1
    }
}