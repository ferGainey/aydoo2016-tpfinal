require 'rspec' 
require_relative '../model/asteroide'

describe 'Asteroide' do

  it 'un Asteroide es un ObjetoEspacial, por lo que se crea con una cierta vida y masa' do
    vida_esperada = 500    
    masa_esperada = 2000
    asteroide = Asteroide.new(vida_esperada, masa_esperada)
    expect(asteroide.vida).to eq vida_esperada
    expect(asteroide.masa).to eq masa_esperada
  end

end