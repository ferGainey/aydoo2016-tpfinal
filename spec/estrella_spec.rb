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

  it 'si una estrella choca con una Nave sufre un danio destructivo del 100 porciento, mientras la Nave aumenta su vida en una cantidad igual a la vida de la estrella' do
    vida_esperada_nave = 200 
    masa_esperada_nave = 400
    vida_esperada_estrella = 0
    masa_esperada_estrella = 800    
    procesador_de_choque = Choque.new
    nave = Nave.new(400, procesador_de_choque)
    estrella_generadora_de_choque = Estrella.new(800, procesador_de_choque)
    estrella_generadora_de_choque.chocar(nave)
    expect(nave.vida).to eq vida_esperada_nave
    expect(nave.masa).to eq masa_esperada_nave
    expect(estrella_generadora_de_choque.vida).to eq vida_esperada_estrella
    expect(estrella_generadora_de_choque.masa).to eq masa_esperada_estrella
  end

end