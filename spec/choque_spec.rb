require 'rspec' 
require_relative '../model/choque'
require_relative '../model/nave'
require_relative '../model/asteroide'
require_relative '../model/efecto_destructivo_por_unidad'

describe 'Choque' do

  it 'se puede cambiar el efecto asignado para un choque' do  
    procesador_de_choques = Choque.new
    nave = Nave.new(200, procesador_de_choques)
    asteroide = Asteroide.new(400, procesador_de_choques)
    nuevo_efecto = EfectoDestructivoPorUnidad.new("100")
    procesador_de_choques.cambiar_efecto(nave, asteroide, nuevo_efecto)
    nave.chocar(asteroide)
    vida_esperada = 0
    masa_esperada = 200
    expect(nave.vida).to eq vida_esperada
    expect(nave.masa).to eq masa_esperada
  end

end