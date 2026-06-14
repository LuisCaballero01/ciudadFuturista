class Dron{
    var autonomia
    var nivelProcesamiento
    var mision
    
    method disminuirAutonomiaEn(cant){
        autonomia -= cant
    }
    
    method esAvanzado() = self.condicionAdicional() && mision.esAvanzadoElDron(self)
    method condicionAdicional()
    
    method reprogramar(unaMision){
        mision = unaMision
    }
    method capacidadOperativa() = (autonomia*10) + mision.capacidadQueOtorgaPara(self)
}
class DronComercial inherits Dron{
    override method capacidadOperativa() = super() * 1.1
    override method condicionAdicional() = false
}
class DronSeguridad inherits Dron{
    override method condicionAdicional() = nivelProcesamiento>50
}
object transporte{
    method esAvanzadoElDron(unDron) = unDron.autonomia()>50
    method capacidadQueOtorgaPara(unDron) = 100
}
object exploracion{
    method esAvanzadoElDron(unDron) = unDron.capacidadOperativa().even()
    method capacidadQueOtorgaPara(unDron) = 0
}
object vigilancia{
    const sensores = []
    
    method esAvanzadoElDron(unDron) = sensores.all({s => s.esDuradero()})
    
    method capacidadQueOtorgaPara(unDron) = sensor.eficiencia()
}
class Sensor{
    const capacidad
    const durabilidad
    const tieneMejoras
    
    method eficiencia() = if (tieneMejoras) capacidad*2 else capacidad
    method esDuradero() = durabilidad>capacidad*2
}

class Escuadron{
    const drones = []
    
    method agregarDron(unDron){
        if (drones.size() <= ciudadFuturista.limitePorEscuadron())
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
    
    method puedeOperarEn(unaZona) = drones.any({d => d.esAvanzado()}) && self.puedeCubrirLaZona(unaZona)
    method puedeCubrirLaZona(unaZona) = capacidadOperativa > unaZona.tamaño()*1.5
}
object ciudadFuturista{
    var property limitePorEscuadron = 10
}
class Zona{
    const property tamaño
    var cantOperacionesRecibidas
    
    method registrarOperacion(){
        cantOperacionesRecibidas+=1
    }
}