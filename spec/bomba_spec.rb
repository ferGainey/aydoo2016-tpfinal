require 'rspec' 
require_relative '../model/bomba'
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

end