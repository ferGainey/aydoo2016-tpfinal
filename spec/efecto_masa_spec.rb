require 'rspec' 
require_relative '../model/efecto_masa'
require_relative '../model/objeto_espacial'

describe 'EfectoMasa' do

  it 'el EfectoMasa aumenta la masa de un objeto en relacion al porcentaje positivo indicado de otro objeto' do
    vida_esperada = 100    
    masa_esperada = 2500
    objeto_generador_de_choque = ObjetoEspacial.new(100, 2000)
    objeto_recibidor_de_choque = ObjetoEspacial.new(80, 1000)
    efecto_masa = EfectoMasa.new(objeto_recibidor_de_choque, "50%")
    efecto_masa.aplicar_efecto(objeto_generador_de_choque)
    expect(objeto_generador_de_choque.vida).to eq vida_esperada
    expect(objeto_generador_de_choque.masa).to eq masa_esperada
  end 

  it 'el EfectoMasa disminuye la masa de un objeto en relacion al porcentaje negativo indicado de otro objeto' do
    vida_esperada = 100    
    masa_esperada = 1500
    objeto_generador_de_choque = ObjetoEspacial.new(100, 2000)
    objeto_recibidor_de_choque = ObjetoEspacial.new(80, 1000)
    efecto_masa = EfectoMasa.new(objeto_recibidor_de_choque, "-50%")
    efecto_masa.aplicar_efecto(objeto_generador_de_choque)
    expect(objeto_generador_de_choque.vida).to eq vida_esperada
    expect(objeto_generador_de_choque.masa).to eq masa_esperada
  end 

end