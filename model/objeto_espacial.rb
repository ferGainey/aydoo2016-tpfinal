require_relative '../model/vida_negativa_exception'

class ObjetoEspacial

  attr_accessor :vida, :masa

  def initialize(vida_inicial, masa_inicial)
    if vida_inicial > 0
      @vida = vida_inicial
    else 
      raise VidaNegativaException, "La vida inicial tiene que ser mayor a 0"
    end 
    @masa = masa_inicial
  end

end
