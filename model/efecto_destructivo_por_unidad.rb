require_relative '../model/destruccion_negativa_exception'

class EfectoDestructivoPorUnidad

  attr_reader :danio_a_provocar_en_unidades

  #se puede ingresar como un string o sin nada el danio_a_provocar
  def initialize(danio_a_provocar_en_unidades)
    danio_recibido = danio_a_provocar_en_unidades
    if danio_recibido.to_f > 0
	  @danio_a_provocar_en_unidades = danio_a_provocar_en_unidades
	else
	  raise DestruccionNegativaException, "No se pueda aplicar un danio negativo"
	end
  end

  def aplicar_efecto(objeto_espacial)
	objeto_espacial.vida -= @danio_a_provocar_en_unidades.to_f
  end
				  
end