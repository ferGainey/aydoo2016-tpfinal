class EfectoConstructivo

  def initialize(objeto_recibidor_de_choque)
    @objeto_recibidor_de_choque = objeto_recibidor_de_choque
  end

  def aplicar_efecto(objeto_espacial)
    objeto_espacial.vida += @objeto_recibidor_de_choque.vida  
  end
				
end