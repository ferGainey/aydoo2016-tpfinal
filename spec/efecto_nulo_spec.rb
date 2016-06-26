require 'rspec' 
require_relative '../model/efecto_nulo'
require_relative '../model/objeto_espacial'
require_relative '../model/choque'

describe 'EfectoNulo' do

  it 'el EfectoNulo no genera ningun cambio en el ObjetoEspacial recibido' do
    vida_esperada = 100    
    masa_esperada = 1000
    procesador_de_choque = Choque.new
    objeto_espacial_generador_de_choque = ObjetoEspacial.new(masa_esperada, procesador_de_choque)
    objeto_espacial_receptor_de_choque = ObjetoEspacial.new(100, procesador_de_choque)
    efecto_nulo = EfectoNulo.new
    efecto_nulo.aplicar_efecto(objeto_espacial_generador_de_choque, objeto_espacial_receptor_de_choque)
    expect(objeto_espacial_generador_de_choque.vida).to eq vida_esperada
    expect(objeto_espacial_generador_de_choque.masa).to eq masa_esperada
  end

end