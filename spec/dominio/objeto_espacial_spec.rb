require 'rspec' 
require 'spec_helper'
require_relative '../../model/dominio/objeto_espacial'
require_relative '../../model/efectos/efecto_masa'
require_relative '../../model/efectos/efecto_destructivo_por_unidad'
require_relative '../../model/dominio/choque'
require_relative '../../model/excepciones/objeto_muerto_exception'

describe 'ObjetoEspacial' do

  it 'un ObjetoEspacial se crea con una cierta vida y masa' do
    vida_esperada = 100    
    masa_esperada = 1000
    procesador_de_choque = Choque.new
    objeto_espacial = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial.set_masa(masa_esperada)
    expect(objeto_espacial.vida).to eq vida_esperada
    expect(objeto_espacial.masa).to eq masa_esperada
  end

  it 'debe lanzar una excepcion si se ingresa una vida inicial no mayor a 0' do
    procesador_de_choque = Choque.new
    objeto_espacial = ObjetoEspacial.new(procesador_de_choque)
    expect{objeto_espacial.set_vida(0)}.to raise_exception(VidaNoPositivaException)
    expect{objeto_espacial.set_vida(-45)}.to raise_exception(VidaNoPositivaException)
  end

  it 'debe lanzar una excepcion si se ingresa una masa inicial no mayor a 0' do
    procesador_de_choque = Choque.new
    expect{ObjetoEspacial.new(procesador_de_choque).set_masa(0)}.to raise_exception(MasaNoPositivaException)
    expect{ObjetoEspacial.new(procesador_de_choque).set_masa(-50)}.to raise_exception(MasaNoPositivaException)
  end

  it 'si la vida es mayor a 0 entonces esta vivo' do
    procesador_de_choque = Choque.new
    objeto_espacial = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial.verificar_estado
    expect(objeto_espacial.vivo).to eq true
  end

  it 'si un objeto espacial tiene vida menor a 0 entonces no esta vivo, y su valor se iguala a 0' do
    vida_esperada = 0 
    masa_objeto_generador_de_choque_esperada = 100
    masa_objeto_receptor_de_choque_esperada = 100   
    procesador_de_choque = Choque.new
    objeto_espacial_generador_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial_generador_de_choque.set_vida(30)
    objeto_espacial_receptor_de_choque = ObjetoEspacial.new(procesador_de_choque)
    efecto_destructivo_por_unidad = EfectoDestructivoPorUnidad.new(170)
    efecto_destructivo_por_unidad.aplicar_efecto(objeto_espacial_generador_de_choque, objeto_espacial_receptor_de_choque)
    #el objeto espacial generador_del_choque va a tener -70, pero como en los ejemplos dados cuando habia
    #un numero negativo pasaba a 0. Entonces aca va a pasar lo mismo
    objeto_espacial_generador_de_choque.verificar_estado
    expect(objeto_espacial_generador_de_choque.vida).to eq vida_esperada
    expect(objeto_espacial_generador_de_choque.masa).to eq masa_objeto_generador_de_choque_esperada
    expect(objeto_espacial_generador_de_choque.vivo).to eq false
  end

  it 'si un objeto espacial tiene vida igual a 0 entonces no esta vivo' do
    vida_esperada = 0 
    masa_objeto_generador_de_choque_esperada = 100
    masa_objeto_receptor_de_choque_esperada = 100   
    procesador_de_choque = Choque.new
    objeto_espacial_generador_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial_generador_de_choque.set_vida(30)
    objeto_espacial_receptor_de_choque = ObjetoEspacial.new(procesador_de_choque)
    efecto_destructivo_por_unidad = EfectoDestructivoPorUnidad.new(100)
    efecto_destructivo_por_unidad.aplicar_efecto(objeto_espacial_generador_de_choque, objeto_espacial_receptor_de_choque)
    #el objeto espacial generador_del_choque va a tener 0
    objeto_espacial_generador_de_choque.verificar_estado
    expect(objeto_espacial_generador_de_choque.vida).to eq vida_esperada
    expect(objeto_espacial_generador_de_choque.masa).to eq masa_objeto_generador_de_choque_esperada
    expect(objeto_espacial_generador_de_choque.vivo).to eq false
  end


  it 'si un objeto espacial tiene masa menor a 0, su masa pasa a ser 0, y no esta vivo' do
    vida_esperada = 100
    masa_objeto_generador_de_choque_esperada = 0  
    procesador_de_choque = Choque.new
    objeto_espacial_generador_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial_generador_de_choque.set_masa(100)
    objeto_espacial_receptor_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial_receptor_de_choque.set_masa(900)
    efecto_masa = EfectoMasa.new(-50)
    efecto_masa.aplicar_efecto(objeto_espacial_generador_de_choque, objeto_espacial_receptor_de_choque)
    #el objeto espacial que genera el choque va a tener -350 de masa, pero como la masa no puede ser negativa, entonces pasa a 0
    objeto_espacial_generador_de_choque.verificar_estado
    expect(objeto_espacial_generador_de_choque.vida).to eq vida_esperada
    expect(objeto_espacial_generador_de_choque.masa).to eq masa_objeto_generador_de_choque_esperada
    expect(objeto_espacial_generador_de_choque.vivo).to eq false
  end

  it 'si un objeto espacial tiene masa igual a 0 no esta vivo' do
    vida_esperada = 100
    masa_objeto_generador_de_choque_esperada = 0  
    procesador_de_choque = Choque.new
    objeto_espacial_generador_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial_receptor_de_choque = ObjetoEspacial.new(procesador_de_choque)
    efecto_masa = EfectoMasa.new(-100)
    efecto_masa.aplicar_efecto(objeto_espacial_generador_de_choque, objeto_espacial_receptor_de_choque)
    objeto_espacial_generador_de_choque.verificar_estado
    #el objeto espacial que genera el choque va a tener 0 de masa
    expect(objeto_espacial_generador_de_choque.vida).to eq vida_esperada
    expect(objeto_espacial_generador_de_choque.masa).to eq masa_objeto_generador_de_choque_esperada
    expect(objeto_espacial_generador_de_choque.vivo).to eq false
  end

  it 'si el objeto espacial que quiere chocar esta muerto, entonces no puede interactuar y lanza excepcion' do 
    procesador_de_choque = Choque.new
    objeto_espacial_generador_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial_generador_de_choque.set_vida(30)
    objeto_espacial_receptor_de_choque = ObjetoEspacial.new(procesador_de_choque)
    efecto_destructivo_por_unidad = EfectoDestructivoPorUnidad.new(1000)
    efecto_destructivo_por_unidad.aplicar_efecto(objeto_espacial_generador_de_choque, objeto_espacial_receptor_de_choque)
    objeto_espacial_generador_de_choque.verificar_estado
    expect{objeto_espacial_generador_de_choque.chocar(objeto_espacial_receptor_de_choque)}.to raise_exception(ObjetoMuertoException)
  end

  it 'si un objeto espacial quiere chocar a un objeto muerto, no se va a hacer la interaccion, y se lanza una excepcion' do 
    procesador_de_choque = Choque.new
    objeto_espacial_generador_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial_receptor_de_choque = ObjetoEspacial.new(procesador_de_choque)
    efecto_destructivo_por_unidad = EfectoDestructivoPorUnidad.new(1000)
    efecto_destructivo_por_unidad.aplicar_efecto(objeto_espacial_receptor_de_choque, objeto_espacial_generador_de_choque)
    objeto_espacial_receptor_de_choque.verificar_estado
    expect{objeto_espacial_generador_de_choque.chocar(objeto_espacial_receptor_de_choque)}.to raise_exception(ObjetoMuertoException)
  end

  it 'si un objeto espacial muerto quiere chocar a otro objeto espacial muerto, no se va a hacer la interaccion, y se lanza una excepcion' do 
    procesador_de_choque = Choque.new
    objeto_espacial_generador_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial_receptor_de_choque = ObjetoEspacial.new(procesador_de_choque)
    efecto_destructivo_por_unidad = EfectoDestructivoPorUnidad.new(1000)
    efecto_destructivo_por_unidad.aplicar_efecto(objeto_espacial_receptor_de_choque, objeto_espacial_generador_de_choque)
    efecto_destructivo_por_unidad.aplicar_efecto(objeto_espacial_generador_de_choque, objeto_espacial_receptor_de_choque)
    objeto_espacial_generador_de_choque.verificar_estado
    objeto_espacial_receptor_de_choque.verificar_estado
    expect{objeto_espacial_generador_de_choque.chocar(objeto_espacial_receptor_de_choque)}.to raise_exception(ObjetoMuertoException)
  end

end
