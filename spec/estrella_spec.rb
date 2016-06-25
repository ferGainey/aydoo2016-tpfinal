require 'rspec' 
require_relative '../model/estrella'
require_relative '../model/choque'

describe 'Estrella' do

  it 'una Estrella es un ObjetoEspacial, por lo que se crea con una cierta vida y masa' do  
    vida_esperada = 100
    masa_esperada = 10000
    procesador_choque = Choque.new
    estrella = Estrella.new(masa_esperada, procesador_choque)
    expect(estrella.vida).to eq vida_esperada
    expect(estrella.masa).to eq masa_esperada
  end

end