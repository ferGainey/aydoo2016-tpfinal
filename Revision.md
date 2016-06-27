#Revisión TP Final


##Revisor: Gonzalo Escobar
##Revisado: Fernando Gainey

Cantidad de Test:  51
Cobertura: 100%

Las clases se corresponden con el Dominio,  buen modelado de excepciones.
Hay comentarios en el código por situaciones que generan Smells.
No se mezclan palabras de distintos idiomas.


*Observación 1:  Las clases están sueltas en una única carpeta. Se pueden agrupar según criterios para su mayor comprensión.

Respuesta: Aceptado, se crearán carpetas para agrupar las clases en distintas carpetas.

*Observación 2:  La clase Choque genera Olor ya que posee 188 líneas y dificulta su seguimiento.

Respuesta: Aceptado, se van a generar métodos privados para facilitar el seguimiento del initialize, que es donde están la mayor parte de las líneas. Además se borrarán los métodos comentados que estaban para demostrar de que la extensibilidad a choques con nuevos tipo de objetos era simple. La clase Choque va a seguir siendo grande en comparación a otras, pero no hay ninguna lógica compleja. Ese tamaño se debe en su gran mayoría a la inicialización de los valores por defecto de los choques.

*Observación 3:  Los objetos heredados de Objeto espacial no tienen lógica ni responsabilidad, solamente son heredan todo el comportamiento de ObjetoEspacial.

Respuesta: Es una observación correcta, pero se tomó esta decisión por motivos que en el Readme está explicados en detalle.

*Observación 4:  En la clase ObjetoEspacial.rb se crean tres métodos para verificar el estado (verificar_estado, tiene_vida? Y tiene_masa?).  Se podría simplificar la lógica en un único método para simplificar el código.  A criterio del desarrollador.

Respuesta: Rechazado, el tiene_vida? y tiene_masa? son métodos privados que pertenecen al verificar_estado. Fueron agregados para simplificar el seguimiento del verificar_estado.

*Observación 5 (menor ya que es de desarrollo): utilizar el .rspec para poder visualizar por consola los test y agregar la medición de cobertura.



