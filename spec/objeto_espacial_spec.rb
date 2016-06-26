require 'rspec' 
require_relative '../model/objeto_espacial'
require_relative '../model/choque'

describe 'ObjetoEspacial' do

  it 'un ObjetoEspacial se crea con una cierta vida y masa' do
    vida_esperada = 100    
    masa_esperada = 1000
    procesador_de_choque = Choque.new
    objeto_espacial = ObjetoEspacial.new(masa_esperada, procesador_de_choque)
    expect(objeto_espacial.vida).to eq vida_esperada
    expect(objeto_espacial.masa).to eq masa_esperada
  end

  it 'debe lanzar una excepcion si se ingresa una vida inicial no mayor a 0' do
    procesador_de_choque = Choque.new
    objeto_espacial = ObjetoEspacial.new(75, procesador_de_choque)
    expect{objeto_espacial.set_vida(0)}.to raise_exception(VidaNoPositivaException)
    expect{objeto_espacial.set_vida(-45)}.to raise_exception(VidaNoPositivaException)
  end

  it 'debe lanzar una excepcion si se ingresa una masa inicial no mayor a 0' do
    procesador_de_choque = Choque.new
    expect{ObjetoEspacial.new(0, procesador_de_choque)}.to raise_exception(MasaNoPositivaException)
    expect{ObjetoEspacial.new(-50, procesador_de_choque)}.to raise_exception(MasaNoPositivaException)
  end

    it 'si la vida es mayor a 0 entonces esta vivo' do
    procesador_de_choque = Choque.new
    objeto_espacial = ObjetoEspacial.new(200, procesador_de_choque)
    expect(objeto_espacial.esta_vivo?).to eq true
  end

end
