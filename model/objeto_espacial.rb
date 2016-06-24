require_relative '../model/vida_no_positiva_exception'
require_relative '../model/masa_no_positiva_exception'

class ObjetoEspacial

  attr_accessor :vida, :masa

  def initialize(vida_inicial, masa_inicial)
    if vida_inicial > 0
      @vida = vida_inicial
    else 
      raise VidaNoPositivaException, "La vida inicial tiene que ser mayor a 0"
    end 
    if masa_inicial > 0
      @masa = masa_inicial
    else
      raise MasaNoPositivaException, "La masa inicial tiene que ser mayor a 0"
    end
  end

end
