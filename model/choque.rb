require_relative '../model/nave'
require_relative '../model/efecto_destructivo_por_unidad'

class Choque

  attr_accessor :indice, :cuadro_de_choques

  def initialize
    #cargo los objetos espaciales
    nave = Nave.new(100,self)
    #armo el indice
    indice_actual = []
    #0=nave,
    indice_actual << nave
    @indice = indice_actual
    #armo la fila de los tipos de choque, para saber a quien pertenece una columna, mirar el indice
    choques_de_nave = []
    efecto_nave_nave = EfectoDestructivoPorUnidad.new("100")
    choques_de_nave << efecto_nave_nave
    #cargo los efectos del choque en sus respectivas filas y columnas
    cuadro_de_choques_inicial = []
    cuadro_de_choques_inicial << choques_de_nave
    @cuadro_de_choques = cuadro_de_choques_inicial
  end

  def procesar_choque(objeto_espacial_generador_de_choque, objeto_espacial_receptor_de_choque)
    
    posicion_del_vector_del_efecto = nil
    for num in 0...@indice.size
      if @indice[num].class == objeto_espacial_generador_de_choque.class
        posicion_del_vector_del_efecto = num
        num = @indice.size
      end
    end

    posicion_del_efecto = nil
    for num in 0...@indice.size
      if @indice[num].class == objeto_espacial_receptor_de_choque.class
        posicion_del_efecto = num
        num = @indice.size
      end
    end

    efecto_a_ejecutar_sobre_generador_de_choque = @cuadro_de_choques[posicion_del_vector_del_efecto][posicion_del_efecto]
    efecto_a_ejecutar_sobre_generador_de_choque.aplicar_efecto(objeto_espacial_generador_de_choque)
    
    efecto_a_ejecutar_sobre_receptor_de_choque = @cuadro_de_choques[posicion_del_efecto][posicion_del_vector_del_efecto]
    efecto_a_ejecutar_sobre_receptor_de_choque.aplicar_efecto(objeto_espacial_receptor_de_choque)
    
  end

end