require_relative '../dominio/nave'
require_relative '../dominio/misil'
require_relative '../dominio/bomba'
require_relative '../dominio/asteroide'
require_relative '../dominio/estrella'
require_relative '../dominio/objeto_espacial'
require_relative '../efectos/efecto_destructivo_por_unidad'
require_relative '../efectos/efecto_masa'
require_relative '../efectos/efecto_constructivo'
require_relative '../efectos/efecto_destructivo_por_porcentaje'
require_relative '../efectos/efecto_nulo'
require_relative '../excepciones/objeto_generico_exception'

class Choque

  attr_accessor :indice, :cuadro_de_choques

  #la inicializacion tiene muchas lineas, pero no hay ninguna logica compleja dentro, solo se cargan los datos de los choques recibidos por defecto
  def initialize
    #armo el indice
    indice_actual = []
    #0=Nave, 1=Misil, 2=Bomba, 3=Asteroide, 4=Estrella
    indice_actual << Nave
    indice_actual << Misil
    indice_actual << Bomba
    indice_actual << Asteroide
    indice_actual << Estrella
    @indice = indice_actual
    
    #armo la fila de los tipos de choque. Para saber a quien pertenece una columna, mirar el indice
    choques_de_nave = []
    choques_de_misil = []
    choques_de_bomba = []
    choques_de_asteroide = []
    choques_de_estrella = []
    
    cargo_los_efectos_a_la_fila_de_la_nave(choques_de_nave)
    cargo_los_efectos_a_la_fila_del_misil(choques_de_misil)
    cargo_los_efectos_a_la_fila_de_la_bomba(choques_de_bomba)
    cargo_los_efectos_a_la_fila_del_asteroide(choques_de_asteroide)
    cargo_los_efectos_a_la_fila_de_la_estrella(choques_de_estrella)
   
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


  private
  def buscar_posicion_del_vector_del_efecto(objeto_espacial_generador_de_choque)
    posicion_del_vector_del_efecto = nil
    for num in 0...@indice.size
      if @indice[num] == objeto_espacial_generador_de_choque.class
        posicion_del_vector_del_efecto = num
        num = @indice.size
      end
    end
    return posicion_del_vector_del_efecto
  end

  def buscar_posicion_del_efecto(objeto_espacial_receptor_de_choque)
    posicion_del_efecto = nil
    for num in 0...@indice.size
      if @indice[num] == objeto_espacial_receptor_de_choque.class
        posicion_del_efecto = num
        num = @indice.size
      end
    end
    return posicion_del_efecto
  end

  def cargo_los_efectos_a_la_fila_de_la_nave(choques_de_la_nave)
  	    #cargo los efectos de la fila de nave
    efecto_nave_nave = EfectoDestructivoPorUnidad.new("100")
    efecto_nave_misil = EfectoDestructivoPorUnidad.new("80")
    efecto_nave_bomba = EfectoDestructivoPorUnidad.new("50")
    efecto_nave_asteroide = EfectoMasa.new("-50")
    efecto_nave_estrella = EfectoConstructivo.new

    #agregos los efectos a la fila de nave
    choques_de_la_nave << efecto_nave_nave
    choques_de_la_nave << efecto_nave_misil
    choques_de_la_nave << efecto_nave_bomba
    choques_de_la_nave << efecto_nave_asteroide
    choques_de_la_nave << efecto_nave_estrella
  end

  def cargo_los_efectos_a_la_fila_del_misil(choques_del_misil)
    #cargo los efectos de la fila del misil
    efecto_misil_nave = EfectoDestructivoPorUnidad.new("100")
    efecto_misil_misil = EfectoDestructivoPorUnidad.new("100")
    efecto_misil_bomba = EfectoNulo.new
    efecto_misil_asteroide = EfectoNulo.new
    efecto_misil_estrella = EfectoNulo.new
    #agrego los efectos a la fila del misil
    choques_del_misil << efecto_misil_nave
    choques_del_misil << efecto_misil_misil
    choques_del_misil << efecto_misil_bomba
    choques_del_misil << efecto_misil_asteroide
    choques_del_misil << efecto_misil_estrella
  end

  def cargo_los_efectos_a_la_fila_de_la_bomba(choques_de_la_bomba)
    #cargo los efectos de la fila de la bomba
    efecto_bomba_nave = EfectoDestructivoPorUnidad.new("100")
    efecto_bomba_misil = EfectoDestructivoPorPorcentaje.new("50")
    efecto_bomba_bomba = EfectoDestructivoPorUnidad.new("100")
    efecto_bomba_asteroide = EfectoDestructivoPorPorcentaje.new("100")
    efecto_bomba_estrella = EfectoDestructivoPorUnidad.new("100")
    #agrego los efectos a la fila de la bomba
    choques_de_la_bomba << efecto_bomba_nave
    choques_de_la_bomba << efecto_bomba_misil
    choques_de_la_bomba << efecto_bomba_bomba
    choques_de_la_bomba << efecto_bomba_asteroide
    choques_de_la_bomba << efecto_bomba_estrella
  end

  def cargo_los_efectos_a_la_fila_del_asteroide(choques_del_asteroide)
    #cargo los efectos de la fila del asteroide
    efecto_asteroide_nave = EfectoMasa.new("10")
    efecto_asteroide_misil = EfectoNulo.new
    efecto_asteroide_bomba = EfectoNulo.new
    efecto_asteroide_asteroide = EfectoNulo.new
    efecto_asteroide_estrella = EfectoNulo.new
    #agrego los efectos a la fila del asteroide
    choques_del_asteroide << efecto_asteroide_nave
    choques_del_asteroide << efecto_asteroide_misil
    choques_del_asteroide << efecto_asteroide_bomba
    choques_del_asteroide << efecto_asteroide_asteroide
    choques_del_asteroide << efecto_asteroide_estrella
  end

  def cargo_los_efectos_a_la_fila_de_la_estrella(choques_de_la_estrella)
    #cargo los efectos de la fila de la estrella
    efecto_estrella_nave = EfectoDestructivoPorPorcentaje.new("100")
    efecto_estrella_misil = EfectoNulo.new
    efecto_estrella_bomba = EfectoDestructivoPorPorcentaje.new("100")
    efecto_estrella_asteroide = EfectoDestructivoPorPorcentaje.new("100")
    efecto_estrella_estrella = EfectoDestructivoPorPorcentaje.new("100")
    #cargo los efectos a la fila de la estrella
    choques_de_la_estrella << efecto_estrella_nave
    choques_de_la_estrella << efecto_estrella_misil
    choques_de_la_estrella << efecto_estrella_bomba
    choques_de_la_estrella << efecto_estrella_asteroide
    choques_de_la_estrella << efecto_estrella_estrella
  end


end