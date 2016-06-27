require 'rspec' 
require 'spec_helper'
require_relative '../../model/dominio/bomba'
require_relative '../../model/dominio/nave'
require_relative '../../model/dominio/misil'
require_relative '../../model/dominio/estrella'
require_relative '../../model/dominio/asteroide'
require_relative '../../model/dominio/choque'

describe 'Misil' do

  it 'un Misil es un ObjetoEspacial, por lo que se crea con una cierta vida y masa' do    
    vida_esperada = 100
    masa_esperada = 100
    procesador_choque = Choque.new
    misil = Misil.new(procesador_choque)
    expect(misil.vida).to eq vida_esperada
    expect(misil.masa).to eq masa_esperada
  end

  it 'si un misil choca una nave sufre un efecto destructivo de 100 unidades, y la nave de 80' do
    vida_esperada_nave = 20 
    masa_esperada_nave = 100
    vida_esperada_misil = 0
    masa_esperada_misil = 100    
    procesador_de_choque = Choque.new
    nave = Nave.new(procesador_de_choque)
    misil_generador_de_choque = Misil.new(procesador_de_choque)
    misil_generador_de_choque.chocar(nave)
    expect(nave.vida).to eq vida_esperada_nave
    expect(nave.masa).to eq masa_esperada_nave
    expect(misil_generador_de_choque.vida).to eq vida_esperada_misil
    expect(misil_generador_de_choque.masa).to eq masa_esperada_misil
  end

  it 'si un Misil choca con otro Misil sufren un efecto destructivo de 100 unidades los dos misiles' do
    vida_esperada = 0 
    masa_objeto_generador_de_choque_esperada = 100
    masa_objeto_receptor_de_choque_esperada = 100   
    procesador_de_choque = Choque.new
    misil_generador_de_choque = Misil.new(procesador_de_choque)
    misil_receptor_de_choque = Misil.new(procesador_de_choque)
    misil_generador_de_choque.chocar(misil_receptor_de_choque)
    expect(misil_generador_de_choque.vida).to eq vida_esperada
    expect(misil_generador_de_choque.masa).to eq masa_objeto_generador_de_choque_esperada
    expect(misil_receptor_de_choque.vida).to eq vida_esperada
    expect(misil_receptor_de_choque.masa).to eq masa_objeto_receptor_de_choque_esperada
  end

  it 'si un misil choca una bomba sufre efecto nulo, y la bomba un efecto destructivo del 50 porciento' do
    vida_esperada_misil = 100 
    masa_esperada_misil = 100
    vida_esperada_bomba = 50
    masa_esperada_bomba = 100    
    procesador_de_choque = Choque.new
    bomba = Bomba.new(procesador_de_choque)
    misil_generador_de_choque = Misil.new(procesador_de_choque)
    misil_generador_de_choque.chocar(bomba)
    expect(bomba.vida).to eq vida_esperada_bomba
    expect(bomba.masa).to eq masa_esperada_bomba
    expect(misil_generador_de_choque.vida).to eq vida_esperada_misil
    expect(misil_generador_de_choque.masa).to eq masa_esperada_misil
  end

  it 'si un misil choca un asteroide ambos sufren efecto nulo' do
    vida_esperada_misil = 100 
    masa_esperada_misil = 100
    vida_esperada_asteroide = 100
    masa_esperada_asteroide = 100    
    procesador_de_choque = Choque.new
    asteroide = Asteroide.new(procesador_de_choque)
    misil_generador_de_choque = Misil.new(procesador_de_choque)
    misil_generador_de_choque.chocar(asteroide)
    expect(asteroide.vida).to eq vida_esperada_asteroide
    expect(asteroide.masa).to eq masa_esperada_asteroide
    expect(misil_generador_de_choque.vida).to eq vida_esperada_misil
    expect(misil_generador_de_choque.masa).to eq masa_esperada_misil
  end

  it 'si un misil choca una estrella ambos sufren efecto nulo' do
    vida_esperada_misil = 100 
    masa_esperada_misil = 100
    vida_esperada_estrella = 100
    masa_esperada_estrella = 100    
    procesador_de_choque = Choque.new
    estrella = Estrella.new(procesador_de_choque)
    misil_generador_de_choque = Misil.new(procesador_de_choque)
    misil_generador_de_choque.chocar(estrella)
    expect(estrella.vida).to eq vida_esperada_estrella
    expect(estrella.masa).to eq masa_esperada_estrella
    expect(misil_generador_de_choque.vida).to eq vida_esperada_misil
    expect(misil_generador_de_choque.masa).to eq masa_esperada_misil
  end
  
end