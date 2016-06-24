require 'rspec' 
require_relative '../model/objeto_espacial'

describe 'ObjetoEspacial' do

  it 'un ObjetoEspacial se crea con una cierta vida y masa' do
    vida_esperada = 100    
    masa_esperada = 1000
    objeto_espacial = ObjetoEspacial.new(vida_esperada, masa_esperada)
    expect(objeto_espacial.vida).to eq vida_esperada
    expect(objeto_espacial.masa).to eq masa_esperada
  end

  it 'debe lanzar una excepcion si se ingresa una vida inicial no mayor a 0' do
    expect{ObjetoEspacial.new(-10, 400)}.to raise_exception(VidaNegativaException)
  end

end
