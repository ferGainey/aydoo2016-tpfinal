require_relative '../model/objeto_espacial'

class Bomba < ObjetoEspacial

  def chocar(objeto_espacial)
  	self.procesador_de_choque.procesar_choque(self, objeto_espacial)
  	self.verificar_estado
  	objeto_espacial.procesador_de_choque.procesar_choque(objeto_espacial, self)
  	objeto_espacial.verificar_estado
  end
  
end