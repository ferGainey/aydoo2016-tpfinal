require_relative '../model/destruccion_negativa_exception'

class EfectoDestructivoPorUnidad

  attr_reader :danio_a_provocar_en_unidades

  #se puede ingresar como un string o sin nada el danio_a_provocar
  def initialize(danio_a_provocar_en_unidades)
    danio_recibido = danio_a_provocar_en_unidades
    if danio_recibido.to_f > 0
	    @danio_a_provocar_en_unidades = danio_a_provocar_en_unidades
	  else
	    raise DestruccionNegativaException.new("No se pueda aplicar un danio negativo")
	  end
  end

  #el segundo argumento no es necesario, pero lo uso para no repetir codigo en la clase choque
  #no es la solucion que mas me gusta para este problema, pero de momento no se me ocurrio otra
  #se puso en la balanza la repeticion del codigo o esto. Y elegi esta solucion
  def aplicar_efecto(objeto_espacial_generador_de_choque, objeto_espacial_receptor_de_choque)
	  objeto_espacial_generador_de_choque.vida -= @danio_a_provocar_en_unidades.to_f
  end
				  
end