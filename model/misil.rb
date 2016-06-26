require_relative '../model/objeto_espacial'

class Misil < ObjetoEspacial

  def chocar(objeto_espacial)
    objeto_receptor_de_choque = objeto_espacial.clone
  	objeto_espacial.procesador_de_choque.procesar_choque(objeto_espacial, self)
  	self.procesador_de_choque.procesar_choque(self, objeto_receptor_de_choque)
  	objeto_espacial.verificar_estado
  	self.verificar_estado
  end

end