require 'rspec' 
require_relative '../model/asteroide'
require_relative '../model/choque'

describe 'Asteroide' do

  it 'un Asteroide es un ObjetoEspacial, por lo que se crea con una cierta vida y masa' do
    vida_esperada = 100    
    masa_esperada = 2000
    procesador_de_choque = Choque.new
    asteroide = Asteroide.new(masa_esperada, procesador_de_choque)
    expect(asteroide.vida).to eq vida_esperada
    expect(asteroide.masa).to eq masa_esperada
  end

end