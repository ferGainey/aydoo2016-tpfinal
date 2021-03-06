require 'rspec' 
require 'spec_helper'
require_relative '../../model/efectos/efecto_destructivo_por_unidad'
require_relative '../../model/efectos/efecto_destructivo_por_porcentaje'
require_relative '../../model/dominio/objeto_espacial'
require_relative '../../model/dominio/choque'

describe 'EfectoDestructivo' do

  it 'el EfectoDestructivoPorUnidad le resta las unidades indicadas al ObjetoEspacial recibido' do
    vida_esperada = 80    
    masa_esperada = 1000
    procesador_de_choque = Choque.new
    objeto_espacial_generador_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial_generador_de_choque.set_masa(masa_esperada)
    objeto_espacial_receptor_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial_receptor_de_choque.set_masa(masa_esperada)
    efecto_destructivo = EfectoDestructivoPorUnidad.new("20")
    efecto_destructivo.aplicar_efecto(objeto_espacial_generador_de_choque, objeto_espacial_receptor_de_choque)
    expect(objeto_espacial_generador_de_choque.vida).to eq vida_esperada
    expect(objeto_espacial_generador_de_choque.masa).to eq masa_esperada
  end

  it 'debe lanzar una excepcion si se inicializa con danio negativo, en porcentaje' do
    expect{EfectoDestructivoPorPorcentaje.new(-30)}.to raise_exception(DestruccionNegativaException)
  end

  it 'debe lanzar una excepcion si se inicializa con danio negativo, en unidades' do
    expect{EfectoDestructivoPorUnidad.new(-70)}.to raise_exception(DestruccionNegativaException)
  end

  it 'el EfectoDestructivoPorPorcentaje resta el porcentaje de unidades indicado' do
    vida_esperada = 120    
    masa_esperada = 1000
    procesador_de_choque = Choque.new
    objeto_espacial_generador_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial_generador_de_choque.set_masa(masa_esperada)
    objeto_espacial_receptor_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial_receptor_de_choque.set_masa(masa_esperada)
    objeto_espacial_generador_de_choque.set_vida(200)
    efecto_destructivo = EfectoDestructivoPorPorcentaje.new("40")
    efecto_destructivo.aplicar_efecto(objeto_espacial_generador_de_choque, objeto_espacial_receptor_de_choque)
    expect(objeto_espacial_generador_de_choque.vida).to eq vida_esperada
    expect(objeto_espacial_generador_de_choque.masa).to eq masa_esperada
  end 

end