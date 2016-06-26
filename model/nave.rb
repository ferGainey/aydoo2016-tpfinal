require_relative '../model/objeto_espacial'

class Nave < ObjetoEspacial

  def chocar(objeto_espacial)
  	self.procesador_de_choque.procesar_choque(self, objeto_espacial)
  	objeto_espacial.procesador_de_choque.procesar_choque(objeto_espacial, self)
  end

end