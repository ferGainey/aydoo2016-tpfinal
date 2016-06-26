require 'rspec' 
require_relative '../model/misil'
require_relative '../model/choque'

describe 'Misil' do

  it 'un Misil es un ObjetoEspacial, por lo que se crea con una cierta vida y masa' do    
    vida_esperada = 100
    masa_esperada = 800
    procesador_choque = Choque.new
    misil = Misil.new(masa_esperada, procesador_choque)
    expect(misil.vida).to eq vida_esperada
    expect(misil.masa).to eq masa_esperada
  end

  it 'si un misil choca una nave sufre un efecto destructivo de 100 unidades, y la nave de 80' do
    vida_esperada_nave = 20 
    masa_esperada_nave = 400
    vida_esperada_misil = 0
    masa_esperada_misil = 900    
    procesador_de_choque = Choque.new
    nave = Nave.new(400, procesador_de_choque)
    misil_generador_de_choque = Misil.new(900, procesador_de_choque)
    nave.chocar(misil_generador_de_choque)
    expect(nave.vida).to eq vida_esperada_nave
    expect(nave.masa).to eq masa_esperada_nave
    expect(misil_generador_de_choque.vida).to eq vida_esperada_misil
    expect(misil_generador_de_choque.masa).to eq masa_esperada_misil
  end

    it 'si un Misil choca con otro Misil sufren un efecto destructivo de 100 unidades los dos misiles' do
    vida_esperada = 0 
    masa_objeto_generador_de_choque_esperada = 400
    masa_objeto_receptor_de_choque_esperada = 900   
    procesador_de_choque = Choque.new
    misil_generador_de_choque = Misil.new(400, procesador_de_choque)
    misil_receptor_de_choque = Misil.new(900, procesador_de_choque)
    misil_generador_de_choque.chocar(misil_receptor_de_choque)
    expect(misil_generador_de_choque.vida).to eq vida_esperada
    expect(misil_generador_de_choque.masa).to eq masa_objeto_generador_de_choque_esperada
    expect(misil_receptor_de_choque.vida).to eq vida_esperada
    expect(misil_receptor_de_choque.masa).to eq masa_objeto_receptor_de_choque_esperada
  end
end