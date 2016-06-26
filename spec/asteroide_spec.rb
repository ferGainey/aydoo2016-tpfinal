require 'rspec' 
require_relative '../model/bomba'
require_relative '../model/nave'
require_relative '../model/misil'
require_relative '../model/estrella'
require_relative '../model/asteroide'
require_relative '../model/choque'

describe 'Asteroide' do

  it 'un Asteroide es un ObjetoEspacial, por lo que se crea con una cierta vida y masa' do
    vida_esperada = 100    
    masa_esperada = 2000
    procesador_de_choque = Choque.new
    asteroide = Asteroide.new(masa_esperada, procesador_de_choque)
    expect(asteroide.vida).to eq vida_esperada
    expect(asteroide.masa).to eq masa_esperada
  end

  it 'si un asteroide choca con una nave aumenta su masa un 10 porciento en relacion a la nave, y la nave disminuye un 50 porciento en relacion al asteroide ' do
    vida_esperada_nave = 100 
    masa_esperada_nave = 200
    vida_esperada_asteroide = 100
    masa_esperada_asteroide = 860    
    procesador_de_choque = Choque.new
    nave = Nave.new(600, procesador_de_choque)
    asteroide_generador_de_choque = Asteroide.new(800, procesador_de_choque)
    asteroide_generador_de_choque.chocar(nave)
    expect(nave.vida).to eq vida_esperada_nave
    expect(nave.masa).to eq masa_esperada_nave
    expect(asteroide_generador_de_choque.vida).to eq vida_esperada_asteroide
    expect(asteroide_generador_de_choque.masa).to eq masa_esperada_asteroide
  end

  it 'si un asteroide choca un misil ambos sufren efecto nulo' do
    vida_esperada_misil = 100 
    masa_esperada_misil = 400
    vida_esperada_asteroide = 100
    masa_esperada_asteroide = 700    
    procesador_de_choque = Choque.new
    asteroide_generador_de_choque = Asteroide.new(700, procesador_de_choque)
    misil = Misil.new(400, procesador_de_choque)
    asteroide_generador_de_choque.chocar(misil)
    expect(asteroide_generador_de_choque.vida).to eq vida_esperada_asteroide
    expect(asteroide_generador_de_choque.masa).to eq masa_esperada_asteroide
    expect(misil.vida).to eq vida_esperada_misil
    expect(misil.masa).to eq masa_esperada_misil
  end

  it 'si un asteroide choca con una bomba sufre efecto nulo, mientras la bomba sufre un efecto destructivo del 100 porciento' do
    vida_esperada_bomba = 0 
    masa_esperada_bomba = 350
    vida_esperada_asteroide = 100
    masa_esperada_asteriode = 700    
    procesador_de_choque = Choque.new
    asteroide_generador_de_choque = Asteroide.new(700, procesador_de_choque)
    bomba = Bomba.new(350, procesador_de_choque)
    asteroide_generador_de_choque.chocar(bomba)
    expect(asteroide_generador_de_choque.vida).to eq vida_esperada_asteroide
    expect(asteroide_generador_de_choque.masa).to eq masa_esperada_asteriode
    expect(bomba.vida).to eq vida_esperada_bomba
    expect(bomba.masa).to eq masa_esperada_bomba
  end

  it 'si un asteroide choca con otro asteroide ambos sufren efecto nulo' do
    vida_esperada_asteroide_generador_de_choque = 100 
    masa_esperada_asteriode_generador_de_choque = 450
    vida_esperada_asteroide_receptor_de_choque = 100
    masa_esperada_asteriode_receptor_de_choque = 750    
    procesador_de_choque = Choque.new
    asteroide_generador_de_choque = Asteroide.new(450, procesador_de_choque)
    asteroide_receptor_de_choque = Asteroide.new(750, procesador_de_choque)
    asteroide_generador_de_choque.chocar(asteroide_receptor_de_choque)
    expect(asteroide_generador_de_choque.vida).to eq vida_esperada_asteroide_generador_de_choque
    expect(asteroide_generador_de_choque.masa).to eq masa_esperada_asteriode_generador_de_choque
    expect(asteroide_receptor_de_choque.vida).to eq vida_esperada_asteroide_receptor_de_choque
    expect(asteroide_receptor_de_choque.masa).to eq masa_esperada_asteriode_receptor_de_choque
  end

  it 'si un asteroide choca con una estrella sufre efecto nulo, mientras que la estrella un efecto destructivo del 100 porciento' do
    vida_esperada_asteroide_generador_de_choque = 100 
    masa_esperada_asteriode_generador_de_choque = 550
    vida_esperada_estrella = 0
    masa_esperada_estrella = 250    
    procesador_de_choque = Choque.new
    asteroide_generador_de_choque = Asteroide.new(550, procesador_de_choque)
    estrella = Estrella.new(250, procesador_de_choque)
    asteroide_generador_de_choque.chocar(estrella)
    expect(asteroide_generador_de_choque.vida).to eq vida_esperada_asteroide_generador_de_choque
    expect(asteroide_generador_de_choque.masa).to eq masa_esperada_asteriode_generador_de_choque
    expect(estrella.vida).to eq vida_esperada_estrella
    expect(estrella.masa).to eq masa_esperada_estrella
  end

end