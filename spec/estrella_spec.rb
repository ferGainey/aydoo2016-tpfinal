require 'rspec' 
require_relative '../model/estrella'

describe 'Estrella' do

  it 'una Estrella es un ObjetoEspacial, por lo que se crea con una cierta vida y masa' do
    vida_esperada = 900    
    masa_esperada = 10000
    estrella = Estrella.new(vida_esperada, masa_esperada)
    expect(estrella.vida).to eq vida_esperada
    expect(estrella.masa).to eq masa_esperada
  end

end