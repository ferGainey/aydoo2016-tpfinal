require_relative '../model/destruccion_negativa_exception'

class EfectoDestructivo

  attr_reader :danio_a_provocar

  def initialize(danio_a_provocar)
  	if danio_a_provocar > 0
  	  @danio_a_provocar = danio_a_provocar
  	else
  	  raise DestruccionNegativaException, "No se pueda aplicar un danio negativo"
  	end
  end

  def aplicar_efecto(objeto_espacial)
    objeto_espacial.vida -= @danio_a_provocar
  end
  
end