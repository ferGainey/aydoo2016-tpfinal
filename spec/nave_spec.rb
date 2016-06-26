require 'rspec' 
require_relative '../model/nave'
require_relative '../model/misil'
require_relative '../model/bomba'
require_relative '../model/asteroide'
require_relative '../model/estrella'
require_relative '../model/choque'

describe 'Nave' do

  it 'una Nave es un ObjetoEspacial, por lo que se crea con una cierta vida y masa' do  
    vida_esperada = 100
    masa_esperada = 800
    procesador_de_choque = Choque.new
    nave = Nave.new(masa_esperada, procesador_de_choque)
    expect(nave.vida).to eq vida_esperada
    expect(nave.masa).to eq masa_esperada
  end

  it 'si una Nave choca con otra Nave sufre un efecto destructivo de 100 unidades las dos naves' do
    vida_esperada = 0 
    masa_objeto_generador_de_choque_esperada = 400
    masa_objeto_receptor_de_choque_esperada = 900   
    procesador_de_choque = Choque.new
    nave_generadora_de_choque = Nave.new(400, procesador_de_choque)
    nave_receptora_de_choque = Nave.new(900, procesador_de_choque)
    nave_generadora_de_choque.chocar(nave_receptora_de_choque)
    expect(nave_generadora_de_choque.vida).to eq vida_esperada
    expect(nave_generadora_de_choque.masa).to eq masa_objeto_generador_de_choque_esperada
    expect(nave_receptora_de_choque.vida).to eq vida_esperada
    expect(nave_receptora_de_choque.masa).to eq masa_objeto_receptor_de_choque_esperada
  end

  it 'si una Nave tiene' do
    vida_esperada = 0 
    masa_objeto_generador_de_choque_esperada = 400
    masa_objeto_receptor_de_choque_esperada = 900   
    procesador_de_choque = Choque.new
    nave_generadora_de_choque = Nave.new(400, procesador_de_choque)
    nave_generadora_de_choque.set_vida(30)
    nave_receptora_de_choque = Nave.new(900, procesador_de_choque)
    nave_generadora_de_choque.chocar(nave_receptora_de_choque)
    #la nave_generadora_del_choque va a tener -70, pero como en los ejemplos dados cuando habia
    #un numero negativo pasaba a 0. Entonces aca va a pasar lo mismo
    expect(nave_generadora_de_choque.vida).to eq vida_esperada
    expect(nave_generadora_de_choque.masa).to eq masa_objeto_generador_de_choque_esperada
  end

  it 'si una Nave choca con un misil sufre un efecto destructivo de 80 unidades, y el misil 100' do
    vida_esperada_nave = 20 
    masa_esperada_nave = 400
    vida_esperada_misil = 0
    masa_esperada_misil = 900    
    procesador_de_choque = Choque.new
    nave_generadora_de_choque = Nave.new(400, procesador_de_choque)
    misil = Misil.new(900, procesador_de_choque)
    nave_generadora_de_choque.chocar(misil)
    expect(nave_generadora_de_choque.vida).to eq vida_esperada_nave
    expect(nave_generadora_de_choque.masa).to eq masa_esperada_nave
    expect(misil.vida).to eq vida_esperada_misil
    expect(misil.masa).to eq masa_esperada_misil
  end

  it 'si una Nave choca con una bomba sufre un efecto destructivo de 50 unidades, y la bomba de 100' do
    vida_esperada_nave = 50 
    masa_esperada_nave = 400
    vida_esperada_bomba = 0
    masa_esperada_bomba = 800    
    procesador_de_choque = Choque.new
    nave_generadora_de_choque = Nave.new(400, procesador_de_choque)
    bomba = Bomba.new(800, procesador_de_choque)
    nave_generadora_de_choque.chocar(bomba)
    expect(nave_generadora_de_choque.vida).to eq vida_esperada_nave
    expect(nave_generadora_de_choque.masa).to eq masa_esperada_nave
    expect(bomba.vida).to eq vida_esperada_bomba
    expect(bomba.masa).to eq masa_esperada_bomba
  end

  it 'si una Nave choca con un asteroide disminuye su masa un 50 porciento en relacion al asteroide, y el asteroide lo hace un 10 porciento en relacion a la nave' do
    vida_esperada_nave = 100 
    masa_esperada_nave = 200
    vida_esperada_asteroide = 100
    masa_esperada_asteroide = 820    
    procesador_de_choque = Choque.new
    nave_generadora_de_choque = Nave.new(600, procesador_de_choque)
    asteroide = Asteroide.new(800, procesador_de_choque)
    nave_generadora_de_choque.chocar(asteroide)
    expect(nave_generadora_de_choque.vida).to eq vida_esperada_nave
    expect(nave_generadora_de_choque.masa).to eq masa_esperada_nave
    expect(asteroide.vida).to eq vida_esperada_asteroide
    expect(asteroide.masa).to eq masa_esperada_asteroide
  end

  it 'si una Nave choca con una estrella aumenta su vida en una cantidad igual a la vida de la estrella, y la estrella sufre un danio destructivo del 100 porciento' do
    vida_esperada_nave = 200 
    masa_esperada_nave = 400
    vida_esperada_estrella = 0
    masa_esperada_estrella = 800    
    procesador_de_choque = Choque.new
    nave_generadora_de_choque = Nave.new(400, procesador_de_choque)
    estrella = Estrella.new(800, procesador_de_choque)
    nave_generadora_de_choque.chocar(estrella)
    expect(nave_generadora_de_choque.vida).to eq vida_esperada_nave
    expect(nave_generadora_de_choque.masa).to eq masa_esperada_nave
    expect(estrella.vida).to eq vida_esperada_estrella
    expect(estrella.masa).to eq masa_esperada_estrella
  end

end