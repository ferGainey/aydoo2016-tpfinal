require 'rspec' 
require_relative '../model/nave'
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

  it 'si una Nave choca con otra Nave sufre un efecto destructivo de 100 unidades' do
    vida_esperada = 0    
    masa_esperada = 400
    procesador_de_choque = Choque.new
    nave_generadora_de_choque = Nave.new(400,procesador_de_choque)
    nave_recibidora_de_choque = Nave.new(900,procesador_de_choque)
    nave_generadora_de_choque.chocar(nave_recibidora_de_choque)
    expect(nave_generadora_de_choque.vida).to eq vida_esperada
    expect(nave_generadora_de_choque.masa).to eq masa_esperada
  end

end