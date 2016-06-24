require 'rspec' 
require_relative '../model/efecto_nulo'
require_relative '../model/objeto_espacial'

describe 'EfectoNulo' do

  it 'el EfectoNulo no genera ningun cambio en el ObjetoEspacial recibido' do
    vida_esperada = 100    
    masa_esperada = 1000
    objeto_espacial = ObjetoEspacial.new(vida_esperada, masa_esperada)
    efecto_nulo = EfectoNulo.new
    efecto_nulo.aplicar_efecto(objeto_espacial)
    expect(objeto_espacial.vida).to eq vida_esperada
    expect(objeto_espacial.masa).to eq masa_esperada
  end

end