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

end