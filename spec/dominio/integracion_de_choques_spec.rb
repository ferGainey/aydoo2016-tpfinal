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

end