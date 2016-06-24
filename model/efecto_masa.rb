class EfectoMasa

	#el porcentaje puede ser ingresado entre "" o sin ellos
	#el simbolo % no es obligatorio, pero si se usa hay que ponerlo entre ""
	def initialize(objeto_recibidor_de_choque, porcentaje_de_masa)
	  @objeto_recibidor_de_choque = objeto_recibidor_de_choque
	  @porcentaje_de_masa = porcentaje_de_masa
	end

	#si el porcentaje es positivo aumenta la masa, si es negativo disminuye la masa
	def aplicar_efecto(objeto_espacial)
	  porcentaje_de_masa_actual = @porcentaje_de_masa
	  if(porcentaje_de_masa_actual.to_s.include? "%")
	  	porcentaje_de_masa_actual.gsub!(/%/, "")
	  end
	  objeto_espacial.masa = objeto_espacial.masa + ((porcentaje_de_masa_actual.to_f/100) * @objeto_recibidor_de_choque.masa)  
	end
				  
end