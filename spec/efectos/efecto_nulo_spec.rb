require 'rspec' 
require 'spec_helper'
require_relative '../../model/efectos/efecto_nulo'
require_relative '../../model/dominio/objeto_espacial'
require_relative '../../model/dominio/choque'

describe 'EfectoNulo' do

  it 'el EfectoNulo no genera ningun cambio en el ObjetoEspacial recibido' do
    vida_esperada = 100    
    masa_esperada = 100
    procesador_de_choque = Choque.new
    objeto_espacial_generador_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_espacial_receptor_de_choque = ObjetoEspacial.new(procesador_de_choque)
    efecto_nulo = EfectoNulo.new
    efecto_nulo.aplicar_efecto(objeto_espacial_generador_de_choque, objeto_espacial_receptor_de_choque)
    expect(objeto_espacial_generador_de_choque.vida).to eq vida_esperada
    expect(objeto_espacial_generador_de_choque.masa).to eq masa_esperada
  end

end