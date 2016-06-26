require_relative '../model/vida_no_positiva_exception'
require_relative '../model/masa_no_positiva_exception'

class ObjetoEspacial

  attr_accessor :vida, :masa, :procesador_de_choque
  attr_reader :vivo

  def initialize(masa_inicial, procesador_de_choque)
    @vida = 100
    if masa_inicial > 0
      @masa = masa_inicial
    else
      raise MasaNoPositivaException, "La masa inicial tiene que ser mayor a 0"
    end
      @procesador_de_choque = procesador_de_choque
      @vivo = true
  end

  def set_vida(vida)
    if vida > 0
      @vida = vida
    else 
      raise VidaNoPositivaException, "La vida inicial tiene que ser mayor a 0"
    end 
  end

  def verificar_estado
    if @vida > 0
      @vivo = true
    else
      @vida = 0
      @vivo = false
    end
  end

end
