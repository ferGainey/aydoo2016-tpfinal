require 'rspec' 
require_relative '../model/efecto_destructivo_por_unidad'
require_relative '../model/efecto_destructivo_por_porcentaje'
require_relative '../model/objeto_espacial'
require_relative '../model/choque'

describe 'EfectoDestructivo' do

  it 'el EfectoDestructivoPorUnidad le resta las unidades indicadas al ObjetoEspacial recibido' do
    vida_esperada = 80    
    masa_esperada = 1000
    procesador_de_choque = Choque.new
    objeto_espacial = ObjetoEspacial.new(masa_esperada, procesador_de_choque)
    efecto_destructivo = EfectoDestructivoPorUnidad.new("20")
    efecto_destructivo.aplicar_efecto(objeto_espacial)
    expect(objeto_espacial.vida).to eq vida_esperada
    expect(objeto_espacial.masa).to eq masa_esperada
  end

  it 'debe lanzar una excepcion si se inicializa con danio negativo, en porcentaje' do
    expect{EfectoDestructivoPorPorcentaje.new(-30)}.to raise_exception(DestruccionNegativaException)
  end

  it 'debe lanzar una excepcion si se inicializa con danio negativo, en unidades' do
    expect{EfectoDestructivoPorUnidad.new(-70)}.to raise_exception(DestruccionNegativaException)
  end

  it 'el EfectoDestructivoPorPorcentaje resta el porcentaje de unidades indicado' do
    vida_esperada = 120    
    masa_esperada = 1000
    procesador_de_choque = Choque.new
    objeto_espacial = ObjetoEspacial.new(masa_esperada, procesador_de_choque)
    objeto_espacial.set_vida(200)
    efecto_destructivo = EfectoDestructivoPorPorcentaje.new("40")
    efecto_destructivo.aplicar_efecto(objeto_espacial)
    expect(objeto_espacial.vida).to eq vida_esperada
    expect(objeto_espacial.masa).to eq masa_esperada
  end 

end