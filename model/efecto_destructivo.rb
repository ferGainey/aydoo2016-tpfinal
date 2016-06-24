require_relative '../model/destruccion_negativa_exception'

class EfectoDestructivo

	attr_reader :danio_a_provocar

	def initialize(danio_a_provocar)
		danio_recibido = danio_a_provocar.to_s.gsub(/%/, "")
		if danio_recibido.to_f > 0
		  @danio_a_provocar = danio_a_provocar
		else
			raise DestruccionNegativaException, "No se pueda aplicar un danio negativo"
		end
	end

	def aplicar_efecto(objeto_espacial)
		if @danio_a_provocar.to_s.include? "%"
			objeto_espacial.vida = objeto_espacial.vida * ((@danio_a_provocar.to_s.gsub(/%/, "").to_f)/100)
		else
			objeto_espacial.vida -= @danio_a_provocar.to_f
		end
	end
				  
end