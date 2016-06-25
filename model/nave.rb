require_relative '../model/objeto_espacial'

class Nave < ObjetoEspacial

  def chocar(objeto_espacial)
  	self.procesador_de_choque.procesar_choque(self, objeto_espacial)
  end

end