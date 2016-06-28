#Revisión 1 TP Final


##Revisor: Gonzalo Escobar
##Revisado: Fernando Gainey

Cantidad de Test:  51
Cobertura: 100%

Las clases se corresponden con el Dominio,  buen modelado de excepciones.
Hay comentarios en el código por situaciones que generan Smells.
No se mezclan palabras de distintos idiomas.


*Observación 1: Las clases están sueltas en una única carpeta. Se pueden agrupar según criterios para su mayor comprensión.

Respuesta: Aceptado, se crearán carpetas para agrupar las clases en distintas carpetas.

*Observación 2: La clase Choque genera Olor ya que posee 188 líneas y dificulta su seguimiento.

Respuesta: Aceptado, se van a generar métodos privados para facilitar el seguimiento del initialize, que es donde están la mayor parte de las líneas. Además se borrarán los métodos comentados que estaban para demostrar de que la extensibilidad a choques con nuevos tipo de objetos era simple. La clase Choque va a seguir siendo grande en comparación a otras, pero no hay ninguna lógica compleja. Ese tamaño se debe en su gran mayoría a la inicialización de los valores por defecto de los choques.

*Observación 3: Los objetos heredados de Objeto espacial no tienen lógica ni responsabilidad, solamente son heredan todo el comportamiento de ObjetoEspacial.

Respuesta: Es una observación correcta, pero se tomó esta decisión por motivos que en el Readme está explicados en detalle.

*Observación 4: En la clase ObjetoEspacial.rb se crean tres métodos para verificar el estado (verificar_estado, tiene_vida? Y tiene_masa?).  Se podría simplificar la lógica en un único método para simplificar el código.  A criterio del desarrollador.

Respuesta: Rechazado, el tiene_vida? y tiene_masa? son métodos privados que pertenecen al verificar_estado. Fueron agregados para simplificar el seguimiento del verificar_estado.

*Observación 5 (menor ya que es de desarrollo): utilizar el .rspec para poder visualizar por consola los test y agregar la medición de cobertura.

Respuesta: Aceptado, se agregó lo de la medición de cobertura.

---

#Revisión 2: TP Final
Con el repositorio en el estado del lunes 27 a las 24hs

##Revisor: Gonzalo Escobar
##Revisado: Fernando Gainey

Cantidad de Test:56

Cobertura: 100%

Los gráficos están claros y completos.

El patrón utilizado parece ser el apropiado para la resolución del problema.

*Observación 1: En la clase choque no veo que se pueda agregar un elemento sin modificar código existente. Si bien la modificación es mínima porque solamente se agregan en la clase dos líneas de código choque, se podría garantizar completamente el principio Abierto-Cerrado agregando un método que permita agregar un elemento en runtime.

Respuesta: Rechazado. Se puede agregar un método sin ningún inconveniente para eso. Pero no está puesto de momento, ya que para probarlo de manera completa debería existir un nuevo tipo de ObjetoEspacial. Igualmente para comprobar si se podía hacer, hice la prueba, pero no la commitee, porque estaba introduciendo un nuevo tipo de ObjetoEspacial que no estaba en el dominio para probarlo. A continuación dejo copiado lo que hay que agregar al código para tener esa funcionalidad. No hay que modificar nada de código existente. Y como se puede ver, su complejidad es baja.

-  comentario: si se agrega un nuevo objeto todas sus interacciones seran EfectoNulo por defecto, pero se pueden cambiar
-  def agregar_un_nuevo_objeto_espacial(nuevo_objeto_espacial)
-    @indice << nuevo_objeto_espacial
-    agregar_efecto_nulo_a_la_columna_perteneciente_al_nuevo_objeto
-    nueva_fila_perteneciente_al_nuevo_objeto = crear_una_fila_de_efecto_nulo
-    @cuadro_de_choques << nueva_fila_perteneciente_al_nuevo_objeto
-  end

-  def agregar_efecto_nulo_a_la_columna_perteneciente_al_nuevo_objeto
-    for num in 0...@cuadro_de_choques.size
-      @cuadro_de_choques[num] << EfectoNulo.new
-    end

-  def crear_una_fila_de_efecto_nulo
-    nueva_fila_perteneciente_al_nuevo_objeto = []
-    for num in 0...@indice.size
-      nueva_fila_perteneciente_al_nuevo_objeto << EfectoNulo.new
-    end 
-    return nueva_fila_perteneciente_al_nuevo_objeto 
-  end



