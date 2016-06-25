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

end