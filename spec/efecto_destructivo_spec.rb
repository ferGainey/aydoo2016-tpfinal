require 'rspec' 
require_relative '../model/efecto_destructivo'
require_relative '../model/objeto_espacial'

describe 'EfectoDestructivo' do

  it 'el EfectoDestructivo le resta las unidades indicadas al ObjetoEspacial recibido' do
    vida_inicial = 100
    vida_esperada = 80    
    masa_esperada = 1000
    objeto_espacial = ObjetoEspacial.new(vida_inicial, masa_esperada)
    efecto_destructivo = EfectoDestructivo.new(20)
    efecto_destructivo.aplicar_efecto(objeto_espacial)
    expect(objeto_espacial.vida).to eq vida_esperada
    expect(objeto_espacial.masa).to eq masa_esperada
  end

end