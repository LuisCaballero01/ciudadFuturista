object transporte{
    method capacidadQueOtorga() = 100
    method esAvanzadoElDron(unDron) = unDron.autonomia()>50
}
object exploracion{
    method capacidadQueOtorga() = 0
    method esAvanzadoElDron(unDron) = unDron.capacidadOperativa().even()
}
object vigilancia{
    const sensores = []
    
// Es confusa la consigna, para capacidad habla en singular, pero para saber si es avanzado habla de una colección.
    method capacidadQueOtorga() = sensores.sum({s => s.eficiencia()})
    method esAvanzadoElDron(unDron) = sensores.all({s => s.esDuradero()})
}
class Sensor{
    const capacidad
    const durabilidad
    const tieneMejoras
    
    method eficiencia() = if (tieneMejoras) capacidad*2 else capacidad
    method esDuradero() = durabilidad>capacidad*2
}