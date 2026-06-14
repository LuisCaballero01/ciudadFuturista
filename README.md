# Ciudad Futurista

En una megaciudad altamente tecnificada, diferentes tipos de drones autónomos sobrevuelan las zonas cumpliendo distintas misiones. Los más comunes son los drones comerciales y de seguridad. Sin embargo, también existen otros tipos de drones menos conocidos, y se espera que en el futuro puedan surgir nuevos modelos.

Nuestro objetivo es modelar un sistema capaz de manejar tanto los drones actuales como cualquier tipo de dron que pueda ser añadido en el futuro. De cada dron nos interesa su autonomía, su nivel de procesamiento y su misión dentro de la ciudad.

Actualmente, las misiones disponibles para los drones son: transporte, exploración y vigilancia. Cada dron tiene una misión asignada, pero pueden cambiar de misión si se lo reprograma. Los drones en misión de vigilancia llevan varios sensores. De cada sensor nos interesa conocer su capacidad, su durabilidad, y si cuenta con mejoras tecnológicas y dichos valores nunca cambian luego de que un sensor es creado.

Los drones se agrupan en escuadrones para llevar a cabo operaciones coordinadas sobre una zona. La ciudad futurista define un valor común y configurable (definido inicialmente con el valor 10\) que determina la cantidad máxima de drones que puede tener un escuadrón. De cada zona se conoce su tamaño total y la cantidad de operaciones que ha recibido. Un escuadrón puede operar sobre una zona determinada si lleva al menos 1 dron avanzado y si la capacidad operativa del escuadrón supera en un 50% al tamaño total de la de la zona. 

### **Requerimientos:**

1. Obtener la eficiencia operativa de un dron, la cual se calcula como su autonomía multiplicada por 10 más un extra que depende de su misión:  
   * Transporte: Obtiene siempre un extra de 100\.  
   * Exploración: No recibe ningún extra.  
   * Vigilancia: El extra depende de la eficiencia de los sensores que lleve. Si el sensor no tiene mejoras tecnológicas, su eficiencia es igual a su capacidad; si tiene mejoras, este valor se duplica.  
2. En el caso de los drones comerciales, debido a su diseño optimizado para largas jornadas, su eficiencia operativa aumenta en un 10%.  
3. Determinar si un dron es avanzado. Es avanzado si es avanzado según el tipo de dron, o bien  es avanzado en su misión asignada.  
   * Un dron de seguridad es considerado avanzado si su nivel de procesamiento supera los 50\. Los drones comerciales nunca son avanzados.  
   * Un dron es avanzado en su misión dependiendo de la exigencia de la misma:  
     * Transporte: Es avanzado si su autonomía supera los 50\.  
     * Vigilancia: Es avanzado si todos sus sensores son duraderos. Un sensor es duradero si la durabilidad del sensor en mayor al doble de su capacidad.  
     * Exploración: Es avanzado si la eficiencia operativa del dron es un número par.  
4. Agregar un dron al escuadrón realizando la comprobaciones correspondientes y en caso de no poder agregarlo lanzar el siguiente error “Supera la cantidad máxima definida por la ciudad”  
5. Operar una zona por el escuadrón: Si el escuadrón puede operar la zona entonces sucede lo siguiente  
   * la zona registra que recibió una operacion  
   * Cada dron que compone el escuadrón disminuye su autonomía en un 5%.  
6. Realizar la mayor cantidad de test posibles que garanticen el correcto funcionamiento de los puntos anteriores.
