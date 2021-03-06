require 'rspec' 
require 'spec_helper'
require_relative '../../model/efectos/efecto_masa'
require_relative '../../model/dominio/objeto_espacial'
require_relative '../../model/dominio/choque'

describe 'EfectoMasa' do

  it 'el EfectoMasa aumenta la masa de un objeto en relacion al porcentaje positivo indicado de otro objeto' do
    vida_esperada = 100    
    masa_esperada = 2500
    procesador_de_choque = Choque.new
    objeto_generador_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_generador_de_choque.set_masa(2000)
    objeto_receptor_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_receptor_de_choque.set_masa(1000)
    efecto_masa = EfectoMasa.new("50%")
    efecto_masa.aplicar_efecto(objeto_generador_de_choque, objeto_receptor_de_choque)
    expect(objeto_generador_de_choque.vida).to eq vida_esperada
    expect(objeto_generador_de_choque.masa).to eq masa_esperada
  end 

  it 'el EfectoMasa disminuye la masa de un objeto en relacion al porcentaje negativo indicado de otro objeto' do
    vida_esperada = 100    
    masa_esperada = 1500
    procesador_de_choque = Choque.new
    objeto_generador_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_generador_de_choque.set_masa(2000)
    objeto_receptor_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_receptor_de_choque.set_masa(1000)
    efecto_masa = EfectoMasa.new("-50%")
    efecto_masa.aplicar_efecto(objeto_generador_de_choque, objeto_receptor_de_choque)
    expect(objeto_generador_de_choque.vida).to eq vida_esperada
    expect(objeto_generador_de_choque.masa).to eq masa_esperada
  end 

end