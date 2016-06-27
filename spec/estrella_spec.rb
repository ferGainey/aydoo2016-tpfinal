require 'rspec' 
require_relative '../model/estrella'
require_relative '../model/choque'

describe 'Estrella' do

  it 'una Estrella es un ObjetoEspacial, por lo que se crea con una cierta vida y masa' do  
    vida_esperada = 100
    masa_esperada = 100
    procesador_choque = Choque.new
    estrella = Estrella.new(procesador_choque)
    expect(estrella.vida).to eq vida_esperada
    expect(estrella.masa).to eq masa_esperada
  end

  it 'si una estrella choca con una Nave sufre un danio destructivo del 100 porciento, mientras la Nave aumenta su vida en una cantidad igual a la vida de la estrella' do
    vida_esperada_nave = 200 
    masa_esperada_nave = 100
    vida_esperada_estrella = 0
    masa_esperada_estrella = 100    
    procesador_de_choque = Choque.new
    nave = Nave.new(procesador_de_choque)
    estrella_generadora_de_choque = Estrella.new(procesador_de_choque)
    estrella_generadora_de_choque.chocar(nave)
    expect(nave.vida).to eq vida_esperada_nave
    expect(nave.masa).to eq masa_esperada_nave
    expect(estrella_generadora_de_choque.vida).to eq vida_esperada_estrella
    expect(estrella_generadora_de_choque.masa).to eq masa_esperada_estrella
  end

  it 'si una estrella choca un misil ambos sufren efecto nulo' do
    vida_esperada_misil = 100 
    masa_esperada_misil = 100
    vida_esperada_estrella = 100
    masa_esperada_estrella = 100    
    procesador_de_choque = Choque.new
    estrella_generadora_de_choque = Estrella.new(procesador_de_choque)
    misil = Misil.new(procesador_de_choque)
    estrella_generadora_de_choque.chocar(misil)
    expect(estrella_generadora_de_choque.vida).to eq vida_esperada_estrella
    expect(estrella_generadora_de_choque.masa).to eq masa_esperada_estrella
    expect(misil.vida).to eq vida_esperada_misil
    expect(misil.masa).to eq masa_esperada_misil
  end

  it 'si una estrella choca una bomba sufre un efecto destructivo del 100 porciento, mientras que la bomba sufre un efecto destructivo de 100 unidades' do
    vida_esperada_bomba = 0 
    masa_esperada_bomba = 100
    vida_esperada_estrella = 0
    masa_esperada_estrella = 100    
    procesador_de_choque = Choque.new
    estrella_generadora_de_choque = Estrella.new(procesador_de_choque)
    bomba = Bomba.new(procesador_de_choque)
    estrella_generadora_de_choque.chocar(bomba)
    expect(estrella_generadora_de_choque.vida).to eq vida_esperada_estrella
    expect(estrella_generadora_de_choque.masa).to eq masa_esperada_estrella
    expect(bomba.vida).to eq vida_esperada_bomba
    expect(bomba.masa).to eq masa_esperada_bomba
  end

  it 'si una estrella choca con un asteroide sufre un efecto destructivo del 100 porciento, mientras que el asteroide sufre efecto nulo' do
    vida_esperada_asteroide = 100 
    masa_esperada_asteriode = 100
    vida_esperada_estrella = 0
    masa_esperada_estrella = 100    
    procesador_de_choque = Choque.new
    asteroide = Asteroide.new(procesador_de_choque)
    estrella_generadora_de_choque = Estrella.new(procesador_de_choque)
    estrella_generadora_de_choque.chocar(asteroide)
    expect(asteroide.vida).to eq vida_esperada_asteroide
    expect(asteroide.masa).to eq masa_esperada_asteriode
    expect(estrella_generadora_de_choque.vida).to eq vida_esperada_estrella
    expect(estrella_generadora_de_choque.masa).to eq masa_esperada_estrella
  end

  it 'si una estrella choca una estrella ambas sufren efecto destructivo del 100 porciento' do
    vida_esperada_estrella_generadora_de_choque = 0
    masa_esperada_estrella_generadora_de_choque = 100
    vida_esperada_estrella_receptora_de_choque = 0
    masa_esperada_estrella_receptora_de_choque = 100    
    procesador_de_choque = Choque.new
    estrella_receptora_de_choque = Estrella.new(procesador_de_choque)
    estrella_generadora_de_choque = Estrella.new(procesador_de_choque)
    estrella_generadora_de_choque.chocar(estrella_receptora_de_choque)
    expect(estrella_receptora_de_choque.vida).to eq vida_esperada_estrella_receptora_de_choque
    expect(estrella_receptora_de_choque.masa).to eq masa_esperada_estrella_receptora_de_choque
    expect(estrella_generadora_de_choque.vida).to eq vida_esperada_estrella_generadora_de_choque
    expect(estrella_generadora_de_choque.masa).to eq masa_esperada_estrella_generadora_de_choque
  end

end