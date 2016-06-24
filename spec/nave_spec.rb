require 'rspec' 
require_relative '../model/nave'

describe 'Nave' do

  it 'una Nave es un ObjetoEspacial, por lo que se crea con una cierta vida y masa' do
    vida_esperada = 300    
    masa_esperada = 800
    nave = Nave.new(vida_esperada, masa_esperada)
    expect(nave.vida).to eq vida_esperada
    expect(nave.masa).to eq masa_esperada
  end

end