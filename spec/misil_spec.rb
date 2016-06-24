require 'rspec' 
require_relative '../model/misil'

describe 'Misil' do

  it 'una Misil es un ObjetoEspacial, por lo que se crea con una cierta vida y masa' do
    vida_esperada = 300    
    masa_esperada = 800
    misil = Misil.new(vida_esperada, masa_esperada)
    expect(misil.vida).to eq vida_esperada
    expect(misil.masa).to eq masa_esperada
  end

end