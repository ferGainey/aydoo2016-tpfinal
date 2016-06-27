require_relative '../model/nave'
require_relative '../model/misil'
require_relative '../model/bomba'
require_relative '../model/asteroide'
require_relative '../model/estrella'
require_relative '../model/efecto_destructivo_por_unidad'
require_relative '../model/efecto_masa'
require_relative '../model/efecto_constructivo'
require_relative '../model/efecto_destructivo_por_porcentaje'
require_relative '../model/efecto_nulo'
require_relative '../model/objeto_generico_exception'
require_relative '../model/objeto_espacial'

class Choque

  attr_accessor :indice, :cuadro_de_choques

  #la inicializacion tiene muchas lineas, pero no hay ninguna logica compleja dentro, solo se cargan los datos de los choques recibidos por defecto
  def initialize
    #cargo los objetos espaciales
    nave = Nave.new(self)
    misil = Misil.new(self)
    bomba = Bomba.new(self)
    asteroide = Asteroide.new(self)
    estrella = Estrella.new(self)
    #armo el indice
    indice_actual = []
    #0=nave, 1=misil, 2=bomba, 3=asteroide, 4=estrella
    indice_actual << nave
    indice_actual << misil
    indice_actual << bomba
    indice_actual << asteroide
    indice_actual << estrella
    @indice = indice_actual
    
    #armo la fila de los tipos de choque. Para saber a quien pertenece una columna, mirar el indice
    choques_de_nave = []
    choques_de_misil = []
    choques_de_bomba = []
    choques_de_asteroide = []
    choques_de_estrella = []
    
    #cargo los efectos de la fila de nave
    efecto_nave_nave = EfectoDestructivoPorUnidad.new("100")
    efecto_nave_misil = EfectoDestructivoPorUnidad.new("80")
    efecto_nave_bomba = EfectoDestructivoPorUnidad.new("50")
    efecto_nave_asteroide = EfectoMasa.new("-50")
    efecto_nave_estrella = EfectoConstructivo.new

    #agregos los efectos a la fila de nave
    choques_de_nave << efecto_nave_nave
    choques_de_nave << efecto_nave_misil
    choques_de_nave << efecto_nave_bomba
    choques_de_nave << efecto_nave_asteroide
    choques_de_nave << efecto_nave_estrella
   
    #cargo los efectos de la fila del misil
    efecto_misil_nave = EfectoDestructivoPorUnidad.new("100")
    efecto_misil_misil = EfectoDestructivoPorUnidad.new("100")
    efecto_misil_bomba = EfectoNulo.new
    efecto_misil_asteroide = EfectoNulo.new
    efecto_misil_estrella = EfectoNulo.new
    #agrego los efectos a la fila del misil
    choques_de_misil << efecto_misil_nave
    choques_de_misil << efecto_misil_misil
    choques_de_misil << efecto_misil_bomba
    choques_de_misil << efecto_misil_asteroide
    choques_de_misil << efecto_misil_estrella

    #cargo los efectos de la fila de la bomba
    efecto_bomba_nave = EfectoDestructivoPorUnidad.new("100")
    efecto_bomba_misil = EfectoDestructivoPorPorcentaje.new("50")
    efecto_bomba_bomba = EfectoDestructivoPorUnidad.new("100")
    efecto_bomba_asteroide = EfectoDestructivoPorPorcentaje.new("100")
    efecto_bomba_estrella = EfectoDestructivoPorUnidad.new("100")
    #agrego los efectos a la fila de la bomba
    choques_de_bomba << efecto_bomba_nave
    choques_de_bomba << efecto_bomba_misil
    choques_de_bomba << efecto_bomba_bomba
    choques_de_bomba << efecto_bomba_asteroide
    choques_de_bomba << efecto_bomba_estrella
   
    #cargo los efectos de la fila del asteroide
    efecto_asteroide_nave = EfectoMasa.new("10")
    efecto_asteroide_misil = EfectoNulo.new
    efecto_asteroide_bomba = EfectoNulo.new
    efecto_asteroide_asteroide = EfectoNulo.new
    efecto_asteroide_estrella = EfectoNulo.new
    #agrego los efectos a la fila del asteroide
    choques_de_asteroide << efecto_asteroide_nave
    choques_de_asteroide << efecto_asteroide_misil
    choques_de_asteroide << efecto_asteroide_bomba
    choques_de_asteroide << efecto_asteroide_asteroide
    choques_de_asteroide << efecto_asteroide_estrella

    #cargo los efectos de la fila de la estrella
    efecto_estrella_nave = EfectoDestructivoPorPorcentaje.new("100")
    efecto_estrella_misil = EfectoNulo.new
    efecto_estrella_bomba = EfectoDestructivoPorPorcentaje.new("100")
    efecto_estrella_asteroide = EfectoDestructivoPorPorcentaje.new("100")
    efecto_estrella_estrella = EfectoDestructivoPorPorcentaje.new("100")
    #cargo los efectos a la fila de la estrella
    choques_de_estrella << efecto_estrella_nave
    choques_de_estrella << efecto_estrella_misil
    choques_de_estrella << efecto_estrella_bomba
    choques_de_estrella << efecto_estrella_asteroide
    choques_de_estrella << efecto_estrella_estrella

    #cargo los efectos del choque en sus respectivas filas y columnas
    cuadro_de_choques_inicial = []
    cuadro_de_choques_inicial << choques_de_nave
    cuadro_de_choques_inicial << choques_de_misil
    cuadro_de_choques_inicial << choques_de_bomba
    cuadro_de_choques_inicial << choques_de_asteroide
    cuadro_de_choques_inicial << choques_de_estrella

    @cuadro_de_choques = cuadro_de_choques_inicial
  end

  def procesar_choque(objeto_espacial_generador_de_choque, objeto_espacial_receptor_de_choque)
    if (objeto_espacial_generador_de_choque.class == ObjetoEspacial) || (objeto_espacial_receptor_de_choque.class == ObjetoEspacial)
      raise ObjetoGenericoException.new("Los objetos genericos no pueden interactuar")
    else
      posicion_del_vector_del_efecto = buscar_posicion_del_vector_del_efecto(objeto_espacial_generador_de_choque)
      posicion_del_efecto = buscar_posicion_del_efecto(objeto_espacial_receptor_de_choque)
      efecto_a_ejecutar_sobre_generador_de_choque = @cuadro_de_choques[posicion_del_vector_del_efecto][posicion_del_efecto]
      efecto_a_ejecutar_sobre_generador_de_choque.aplicar_efecto(objeto_espacial_generador_de_choque, objeto_espacial_receptor_de_choque)
    end
  end
  
  def cambiar_efecto(objeto_generador_de_choque, objeto_receptor_de_choque, nuevo_efecto)
    posicion_del_vector_del_efecto = buscar_posicion_del_vector_del_efecto(objeto_generador_de_choque)
    posicion_del_efecto = buscar_posicion_del_efecto(objeto_receptor_de_choque)
    @cuadro_de_choques[posicion_del_vector_del_efecto][posicion_del_efecto] = nuevo_efecto
  end


=begin
 este metodo anda, pero lo dejo comentado, porque para probarlo se necesitaria que exista un nuevo objeto espacial, y agregarlo
 hice la prueba haciendo eso, y funciono de manera correcta
 no lo borro, porque quiero mostrar que no presentaria ninguna dificultad poder extender este disenio a nuevos objetos espaciales
  #si se agrega un nuevo efecto todas sus interacciones seran con EfectoNulo por defecto, pero se pueden cambiar
  def agregar_un_nuevo_objeto_espacial(nuevo_objeto_espacial)
    @indice << nuevo_objeto_espacial
    agregar_efecto_nulo_a_la_columna_perteneciente_al_nuevo_objeto
    nueva_fila_perteneciente_al_nuevo_objeto = crear_una_fila_de_efecto_nulo
    @cuadro_de_choques << nueva_fila_perteneciente_al_nuevo_objeto
  end
=end
  private
  def buscar_posicion_del_vector_del_efecto(objeto_espacial_generador_de_choque)
    posicion_del_vector_del_efecto = nil
    for num in 0...@indice.size
      if @indice[num].class == objeto_espacial_generador_de_choque.class
        posicion_del_vector_del_efecto = num
        num = @indice.size
      end
    end
    return posicion_del_vector_del_efecto
  end

  def buscar_posicion_del_efecto(objeto_espacial_receptor_de_choque)
    posicion_del_efecto = nil
    for num in 0...@indice.size
      if @indice[num].class == objeto_espacial_receptor_de_choque.class
        posicion_del_efecto = num
        num = @indice.size
      end
    end
    return posicion_del_efecto
  end
=begin
#metodos pertenecientes a: agregar_un_nuevo_objeto_espacial(nuevo_objeto_espacial)
  def agregar_efecto_nulo_a_la_columna_perteneciente_al_nuevo_objeto
    for num in 0...@cuadro_de_choques.size
      @cuadro_de_choques[num] << EfectoNulo.new
    end
  end

  def crear_una_fila_de_efecto_nulo
    nueva_fila_perteneciente_al_nuevo_objeto = []
    for num in 0...@indice.size
      nueva_fila_perteneciente_al_nuevo_objeto << EfectoNulo.new
    end 
    return nueva_fila_perteneciente_al_nuevo_objeto 	
  end
=end
end