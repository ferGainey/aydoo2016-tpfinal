class EfectoConstructivo

  def aplicar_efecto(objeto_espacial, objeto_receptor_de_choque)
    objeto_espacial.vida += objeto_receptor_de_choque.vida  
  end
				
end