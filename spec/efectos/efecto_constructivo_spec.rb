require 'rspec' 
require 'spec_helper'
require_relative '../../model/efectos/efecto_constructivo'
require_relative '../../model/dominio/objeto_espacial'
require_relative '../../model/dominio/choque'

describe 'EfectoConstructivo' do

  it 'el EfectoConstructivo le suma al objeto que provoca el choque las unidades de vida del objeto al que choca' do
    vida_esperada = 200    
    masa_esperada = 100
    procesador_de_choque = Choque.new
    objeto_provocador_de_choque = ObjetoEspacial.new(procesador_de_choque)
    objeto_receptor_de_choque = ObjetoEspacial.new(procesador_de_choque)
    efecto_constructivo = EfectoConstructivo.new
    efecto_constructivo.aplicar_efecto(objeto_provocador_de_choque, objeto_receptor_de_choque)
    expect(objeto_provocador_de_choque.vida).to eq vida_esperada
    expect(objeto_provocador_de_choque.masa).to eq masa_esperada
  end

end