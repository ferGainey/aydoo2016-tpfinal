require_relative '../model/destruccion_negativa_exception'

class EfectoDestructivoPorPorcentaje

  attr_reader :danio_a_provocar_en_porcentaje

  #se asume que el numero que se recibe es un porcentaje
  #se puede ingresar como un string o sin nada el danio_a_provocar
  def initialize(danio_a_provocar_en_porcentaje)
	danio_recibido = danio_a_provocar_en_porcentaje
	if danio_recibido.to_f > 0
	  @danio_a_provocar_en_porcentaje = danio_a_provocar_en_porcentaje
	else
	  raise DestruccionNegativaException, "No se pueda aplicar un danio negativo"
	end
  end

  def aplicar_efecto(objeto_espacial)
    objeto_espacial.vida -= objeto_espacial.vida * ((@danio_a_provocar_en_porcentaje.to_f)/100)
  end
				
end