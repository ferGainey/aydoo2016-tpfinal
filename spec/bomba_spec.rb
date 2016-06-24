require 'rspec' 
require_relative '../model/bomba'

describe 'Bomba' do

  it 'una Bomba es un ObjetoEspacial, por lo que se crea con una cierta vida y masa' do
    vida_esperada = 40    
    masa_esperada = 20
    bomba = Bomba.new(vida_esperada, masa_esperada)
    expect(bomba.vida).to eq vida_esperada
    expect(bomba.masa).to eq masa_esperada
  end

end