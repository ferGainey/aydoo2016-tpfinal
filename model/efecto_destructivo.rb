class EfectoDestructivo

  attr_accessor :danio_a_provocar

  def initialize(danio_a_provocar)
  	@danio_a_provocar = danio_a_provocar
  end

  def aplicar_efecto(objeto_espacial)
    objeto_espacial.vida -= @danio_a_provocar
  end
  
end