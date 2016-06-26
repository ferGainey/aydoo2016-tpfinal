require 'rspec' 
require_relative '../model/bomba'
require_relative '../model/nave'
require_relative '../model/misil'
require_relative '../model/estrella'
require_relative '../model/asteroide'
require_relative '../model/choque'

describe 'Bomba' do

  it 'una Bomba es un ObjetoEspacial, por lo que se crea con una cierta vida y masa' do
    vida_esperada = 100    
    masa_esperada = 20
    procesador_de_choque = Choque.new
    bomba = Bomba.new(masa_esperada, procesador_de_choque)
    expect(bomba.vida).to eq vida_esperada
    expect(bomba.masa).to eq masa_esperada
  end

  it 'si una bomba choca con una nave sufre un efecto destructivo de 100 unidades, y la nave de 50' do
    vida_esperada_nave = 50 
    masa_esperada_nave = 400
    vida_esperada_bomba = 0
    masa_esperada_bomba = 800    
    procesador_de_choque = Choque.new
    bomba_generadora_de_choque = Bomba.new(800, procesador_de_choque)
    nave = Nave.new(400, procesador_de_choque)
    bomba_generadora_de_choque.chocar(nave)
    expect(bomba_generadora_de_choque.vida).to eq vida_esperada_bomba
    expect(bomba_generadora_de_choque.masa).to eq masa_esperada_bomba
    expect(nave.vida).to eq vida_esperada_nave
    expect(nave.masa).to eq masa_esperada_nave
  end

  it 'si una bomba choca un misil sufre un efecto destructivo del 50 porciento, y el misil efecto nulo' do
    vida_esperada_misil = 100 
    masa_esperada_misil = 500
    vida_esperada_bomba = 50
    masa_esperada_bomba = 450    
    procesador_de_choque = Choque.new
    misil = Misil.new(500, procesador_de_choque)
    bomba_generador_de_choque = Bomba.new(450, procesador_de_choque)
    bomba_generador_de_choque.chocar(misil)
    expect(misil.vida).to eq vida_esperada_misil
    expect(misil.masa).to eq masa_esperada_misil
    expect(bomba_generador_de_choque.vida).to eq vida_esperada_bomba
    expect(bomba_generador_de_choque.masa).to eq masa_esperada_bomba
  end

  it 'si una bomba choca una bomba ambas sufren un efecto destructivo de 100 unidades' do
    vida_esperada_bomba_generadora_de_choque = 0 
    masa_esperada_bomba_generadora_de_choque = 450
    vida_esperada_bomba_receptora_de_choque = 0
    masa_esperada_bomba_receptora_de_choque = 500    
    procesador_de_choque = Choque.new
    bomba_receptora_de_choque = Bomba.new(500, procesador_de_choque)
    bomba_generadora_de_choque = Bomba.new(450, procesador_de_choque)
    bomba_generadora_de_choque.chocar(bomba_receptora_de_choque)
    expect(bomba_receptora_de_choque.vida).to eq vida_esperada_bomba_receptora_de_choque
    expect(bomba_receptora_de_choque.masa).to eq masa_esperada_bomba_receptora_de_choque
    expect(bomba_generadora_de_choque.vida).to eq vida_esperada_bomba_generadora_de_choque
    expect(bomba_generadora_de_choque.masa).to eq masa_esperada_bomba_generadora_de_choque
  end

  it 'si una bomba choca un asteroide sufre un efecto destructivo del 100 porciento, mientras que es asteroide sufre efecto nulo' do
    vida_esperada_bomba_generadora_de_choque = 0 
    masa_esperada_bomba_generadora_de_choque = 350
    vida_esperada_asteroide = 100
    masa_esperada_asteriode = 700    
    procesador_de_choque = Choque.new
    asteroide = Asteroide.new(700, procesador_de_choque)
    bomba_generadora_de_choque = Bomba.new(350, procesador_de_choque)
    bomba_generadora_de_choque.chocar(asteroide)
    expect(asteroide.vida).to eq vida_esperada_asteroide
    expect(asteroide.masa).to eq masa_esperada_asteriode
    expect(bomba_generadora_de_choque.vida).to eq vida_esperada_bomba_generadora_de_choque
    expect(bomba_generadora_de_choque.masa).to eq masa_esperada_bomba_generadora_de_choque
  end

end