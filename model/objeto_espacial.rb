require_relative '../model/vida_no_positiva_exception'
require_relative '../model/masa_no_positiva_exception'
require_relative '../model/objeto_muerto_exception'

class ObjetoEspacial

  attr_accessor :vida, :masa, :procesador_de_choque
  attr_reader :vivo

  def initialize(procesador_de_choque)
    @vida = 100
    @masa = 100
    @procesador_de_choque = procesador_de_choque
    @vivo = true
  end

  def chocar(objeto_espacial)
    if self.vivo
      objeto_receptor_de_choque = objeto_espacial.clone
      objeto_espacial.procesador_de_choque.procesar_choque(objeto_espacial, self)
      self.procesador_de_choque.procesar_choque(self, objeto_receptor_de_choque)
      objeto_espacial.verificar_estado
      self.verificar_estado
    else
      raise ObjetoMuertoException.new("Un objeto muerto no puede interactuar")
    end
  end


  def set_vida(vida)
    if vida > 0
      @vida = vida
    else 
      raise VidaNoPositivaException.new("La vida inicial tiene que ser mayor a 0")
    end 
  end

  def set_masa(masa)
    if masa > 0
      @masa = masa
    else
      raise MasaNoPositivaException.new("La masa tiene que ser mayor a 0")
    end
  end

  def verificar_estado
    if (!tiene_vida?)
      @vivo = false
    end
    if (!tiene_masa?)
      @vivo = false
    end
  end
  
  private
  def tiene_vida?
    if @vida > 0
      return true
    else
      @vida = 0
      return false
    end
  end

  def tiene_masa?
    if @masa > 0
      return true
    else
      @masa = 0
      return false
    end
  end

end
