require 'rspec' 
require_relative '../model/efecto_constructivo'
require_relative '../model/objeto_espacial'

describe 'EfectoConstructivo' do

  it 'el EfectoConstructivo le suma al objeto que provoca el choque las unidades de vida del objeto al que choca' do
    vida_esperada = 280    
    masa_esperada = 500
    objeto_provocador_de_choque = ObjetoEspacial.new(200, 500)
    objeto_recibidor_de_choque = ObjetoEspacial.new(80, 250)
    efecto_constructivo = EfectoConstructivo.new(objeto_recibidor_de_choque)
    efecto_constructivo.aplicar_efecto(objeto_provocador_de_choque)
    expect(objeto_provocador_de_choque.vida).to eq vida_esperada
    expect(objeto_provocador_de_choque.masa).to eq masa_esperada
  end

end