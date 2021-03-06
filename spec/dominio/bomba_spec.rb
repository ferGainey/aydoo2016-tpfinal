require 'rspec' 
require 'spec_helper'
require_relative '../../model/dominio/bomba'
require_relative '../../model/dominio/nave'
require_relative '../../model/dominio/misil'
require_relative '../../model/dominio/estrella'
require_relative '../../model/dominio/asteroide'
require_relative '../../model/dominio/choque'

describe 'Bomba' do

  it 'una Bomba es un ObjetoEspacial, por lo que se crea con una cierta vida y masa' do
    vida_esperada = 100    
    masa_esperada = 100
    procesador_de_choque = Choque.new
    bomba = Bomba.new(procesador_de_choque)
    expect(bomba.vida).to eq vida_esperada
    expect(bomba.masa).to eq masa_esperada
  end

  it 'si una bomba choca con una nave sufre un efecto destructivo de 100 unidades, y la nave de 50' do
    vida_esperada_nave = 50 
    masa_esperada_nave = 100
    vida_esperada_bomba = 0
    masa_esperada_bomba = 100    
    procesador_de_choque = Choque.new
    bomba_generadora_de_choque = Bomba.new(procesador_de_choque)
    nave = Nave.new(procesador_de_choque)
    bomba_generadora_de_choque.chocar(nave)
    expect(bomba_generadora_de_choque.vida).to eq vida_esperada_bomba
    expect(bomba_generadora_de_choque.masa).to eq masa_esperada_bomba
    expect(nave.vida).to eq vida_esperada_nave
    expect(nave.masa).to eq masa_esperada_nave
  end

  it 'si una bomba choca un misil sufre un efecto destructivo del 50 porciento, y el misil efecto nulo' do
    vida_esperada_misil = 100 
    masa_esperada_misil = 100
    vida_esperada_bomba = 50
    masa_esperada_bomba = 100    
    procesador_de_choque = Choque.new
    misil = Misil.new(procesador_de_choque)
    bomba_generador_de_choque = Bomba.new(procesador_de_choque)
    bomba_generador_de_choque.chocar(misil)
    expect(misil.vida).to eq vida_esperada_misil
    expect(misil.masa).to eq masa_esperada_misil
    expect(bomba_generador_de_choque.vida).to eq vida_esperada_bomba
    expect(bomba_generador_de_choque.masa).to eq masa_esperada_bomba
  end

  it 'si una bomba choca una bomba ambas sufren un efecto destructivo de 100 unidades' do
    vida_esperada_bomba_generadora_de_choque = 0 
    masa_esperada_bomba_generadora_de_choque = 100
    vida_esperada_bomba_receptora_de_choque = 0
    masa_esperada_bomba_receptora_de_choque = 100    
    procesador_de_choque = Choque.new
    bomba_receptora_de_choque = Bomba.new(procesador_de_choque)
    bomba_generadora_de_choque = Bomba.new(procesador_de_choque)
    bomba_generadora_de_choque.chocar(bomba_receptora_de_choque)
    expect(bomba_receptora_de_choque.vida).to eq vida_esperada_bomba_receptora_de_choque
    expect(bomba_receptora_de_choque.masa).to eq masa_esperada_bomba_receptora_de_choque
    expect(bomba_generadora_de_choque.vida).to eq vida_esperada_bomba_generadora_de_choque
    expect(bomba_generadora_de_choque.masa).to eq masa_esperada_bomba_generadora_de_choque
  end

  it 'si una bomba choca un asteroide sufre un efecto destructivo del 100 porciento, mientras que es asteroide sufre efecto nulo' do
    vida_esperada_bomba_generadora_de_choque = 0 
    masa_esperada_bomba_generadora_de_choque = 100
    vida_esperada_asteroide = 100
    masa_esperada_asteriode = 100    
    procesador_de_choque = Choque.new
    asteroide = Asteroide.new(procesador_de_choque)
    bomba_generadora_de_choque = Bomba.new(procesador_de_choque)
    bomba_generadora_de_choque.chocar(asteroide)
    expect(asteroide.vida).to eq vida_esperada_asteroide
    expect(asteroide.masa).to eq masa_esperada_asteriode
    expect(bomba_generadora_de_choque.vida).to eq vida_esperada_bomba_generadora_de_choque
    expect(bomba_generadora_de_choque.masa).to eq masa_esperada_bomba_generadora_de_choque
  end

  it 'si una bomba choca una estrella sufre un efecto destructivo de 100 unidades, mientras que la estrella sufre un efecto destructivo del 100 porciento' do
    vida_esperada_bomba_generadora_de_choque = 0 
    masa_esperada_bomba_generadora_de_choque = 100
    vida_esperada_estrella = 0
    masa_esperada_estrella = 100    
    procesador_de_choque = Choque.new
    estrella = Estrella.new(procesador_de_choque)
    bomba_generadora_de_choque = Bomba.new(procesador_de_choque)
    bomba_generadora_de_choque.chocar(estrella)
    expect(estrella.vida).to eq vida_esperada_estrella
    expect(estrella.masa).to eq masa_esperada_estrella
    expect(bomba_generadora_de_choque.vida).to eq vida_esperada_bomba_generadora_de_choque
    expect(bomba_generadora_de_choque.masa).to eq masa_esperada_bomba_generadora_de_choque
  end


end