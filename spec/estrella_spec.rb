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

  it 'si una estrella choca un misil ambos sufren efecto nulo' do
    vida_esperada_misil = 100 
    masa_esperada_misil = 400
    vida_esperada_estrella = 100
    masa_esperada_estrella = 700    
    procesador_de_choque = Choque.new
    estrella_generadora_de_choque = Estrella.new(700, procesador_de_choque)
    misil = Misil.new(400, procesador_de_choque)
    estrella_generadora_de_choque.chocar(misil)
    expect(estrella_generadora_de_choque.vida).to eq vida_esperada_estrella
    expect(estrella_generadora_de_choque.masa).to eq masa_esperada_estrella
    expect(misil.vida).to eq vida_esperada_misil
    expect(misil.masa).to eq masa_esperada_misil
  end

  it 'si una estrella choca una bomba sufre un efecto destructivo del 100 porciento, mientras que la bomba sufre un efecto destructivo de 100 unidades' do
    vida_esperada_bomba = 0 
    masa_esperada_bomba = 450
    vida_esperada_estrella = 0
    masa_esperada_estrella = 700    
    procesador_de_choque = Choque.new
    estrella_generadora_de_choque = Estrella.new(700, procesador_de_choque)
    bomba = Bomba.new(450, procesador_de_choque)
    estrella_generadora_de_choque.chocar(bomba)
    expect(estrella_generadora_de_choque.vida).to eq vida_esperada_estrella
    expect(estrella_generadora_de_choque.masa).to eq masa_esperada_estrella
    expect(bomba.vida).to eq vida_esperada_bomba
    expect(bomba.masa).to eq masa_esperada_bomba
  end

end