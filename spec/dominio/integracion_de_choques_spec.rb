require 'rspec' 
require 'spec_helper'
require_relative '../../model/dominio/bomba'
require_relative '../../model/dominio/nave'
require_relative '../../model/dominio/misil'
require_relative '../../model/dominio/estrella'
require_relative '../../model/dominio/asteroide'
require_relative '../../model/dominio/choque'

describe 'IntegracionDeChoques' do

  it 'debe efectuarse de manera correcta el choque entre una nave de (vida=100, masa=100) y un asteroide de (vida=50, masa=100)' do  
    procesador_de_choque = Choque.new
    nave = Nave.new(procesador_de_choque)
    asteroide = Asteroide.new(procesador_de_choque)
    asteroide.set_vida(50)
    nave.chocar(asteroide)
    vida_esperada_de_nave = 100
    masa_esperada_de_nave = 50
    vida_esperada_de_asteroide = 50
    masa_esperada_de_asteroide = 110
    expect(nave.vida).to eq vida_esperada_de_nave
    expect(nave.masa).to eq masa_esperada_de_nave
    expect(asteroide.vida).to eq vida_esperada_de_asteroide
    expect(asteroide.masa).to eq masa_esperada_de_asteroide
  end

  it 'debe efectuarse de manera correcta el choque entre una Estrella (vida=50, masa=10) y un Misil (vida=10, masa=30)' do  
    procesador_de_choque = Choque.new
    estrella = Estrella.new(procesador_de_choque)
    misil = Misil.new(procesador_de_choque)
    estrella.set_vida(50)
    estrella.set_masa(10)
    misil.set_vida(10)
    misil.set_masa(30)
    estrella.chocar(misil)
    vida_esperada_de_estrella = 50
    masa_esperada_de_estrella = 10
    vida_esperada_de_misil = 10
    masa_esperada_de_misil = 30
    expect(estrella.vida).to eq vida_esperada_de_estrella
    expect(estrella.masa).to eq masa_esperada_de_estrella
    expect(misil.vida).to eq vida_esperada_de_misil
    expect(misil.masa).to eq masa_esperada_de_misil
  end

  it 'debe efectuarse de manera correcta el choque de una Bomba (vida=200, masa=90) con otra Bomba (vida=20, masa=45)' do  
    procesador_de_choque = Choque.new
    bomba_generadora_de_choque = Bomba.new(procesador_de_choque)
    bomba_receptora_de_choque = Bomba.new(procesador_de_choque)
    bomba_generadora_de_choque.set_vida(200)
    bomba_generadora_de_choque.set_masa(90)
    bomba_receptora_de_choque.set_vida(20)
    bomba_receptora_de_choque.set_masa(45)
    bomba_generadora_de_choque.chocar(bomba_receptora_de_choque)
    vida_esperada_de_bomba_generadora_de_choque = 100
    masa_esperada_de_bomba_generadora_de_choque = 90
    vida_esperada_de_bomba_receptora_de_choque = 0
    masa_esperada_de_bomba_receptora_de_choque = 45
    expect(bomba_generadora_de_choque.vida).to eq vida_esperada_de_bomba_generadora_de_choque
    expect(bomba_generadora_de_choque.masa).to eq masa_esperada_de_bomba_generadora_de_choque
    expect(bomba_receptora_de_choque.vida).to eq vida_esperada_de_bomba_receptora_de_choque
    expect(bomba_receptora_de_choque.masa).to eq masa_esperada_de_bomba_receptora_de_choque
  end

  it 'debe efectuarse de manera correcta el choque de una Bomba (vida=200, masa=100) con un Asteriode (vida=30, masa=100)' do  
    procesador_de_choque = Choque.new
    bomba = Bomba.new(procesador_de_choque)
    asteroide = Asteroide.new(procesador_de_choque)
    bomba.set_vida(200)
    asteroide.set_vida(30)
    bomba.chocar(asteroide)
    vida_esperada_de_bomba = 0
    masa_esperada_de_bomba = 100
    vida_esperada_de_asteroide = 30
    masa_esperada_de_asteroide = 100
    expect(bomba.vida).to eq vida_esperada_de_bomba
    expect(bomba.masa).to eq masa_esperada_de_bomba
    expect(asteroide.vida).to eq vida_esperada_de_asteroide
    expect(asteroide.masa).to eq masa_esperada_de_asteroide
  end

  it 'debe efectuarse de manera correcta el choque de una Nave (vida=100, masa=100) con una Estrella (vida=50, masa=50)' do  
    procesador_de_choque = Choque.new
    nave = Nave.new(procesador_de_choque)
    estrella = Estrella.new(procesador_de_choque)
    estrella.set_vida(50)
    estrella.set_masa(50)
    nave.chocar(estrella)
    vida_esperada_de_nave = 150
    masa_esperada_de_nave = 100
    vida_esperada_de_estrella = 0
    masa_esperada_de_estrella = 50
    expect(nave.vida).to eq vida_esperada_de_nave
    expect(nave.masa).to eq masa_esperada_de_nave
    expect(estrella.vida).to eq vida_esperada_de_estrella
    expect(estrella.masa).to eq masa_esperada_de_estrella
  end

end