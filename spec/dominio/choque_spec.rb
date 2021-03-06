require 'rspec' 
require 'spec_helper'
require_relative '../../model/dominio/choque'
require_relative '../../model/dominio/nave'
require_relative '../../model/dominio/asteroide'
require_relative '../../model/efectos/efecto_destructivo_por_unidad'
require_relative '../../model/excepciones/objeto_generico_exception'

describe 'Choque' do

  it 'se puede cambiar el efecto asignado para un choque' do  
    procesador_de_choques = Choque.new
    nave = Nave.new(procesador_de_choques)
    nave.set_masa(200)
    asteroide = Asteroide.new(procesador_de_choques)
    asteroide.set_masa(400)
    nuevo_efecto = EfectoDestructivoPorUnidad.new("100")
    procesador_de_choques.cambiar_efecto(nave, asteroide, nuevo_efecto)
    nave.chocar(asteroide)
    vida_esperada = 0
    masa_esperada = 200
    expect(nave.vida).to eq vida_esperada
    expect(nave.masa).to eq masa_esperada
  end
  
  it 'si el objeto generador de choque es generico, entonces lanza excepcion' do
    procesador_de_choques = Choque.new
    objeto_generico = ObjetoEspacial.new(procesador_de_choques)
    asteroide = Asteroide.new(procesador_de_choques)
    expect{procesador_de_choques.procesar_choque(objeto_generico, asteroide)}.to raise_exception(ObjetoGenericoException)
  end

  it 'si el receptor de choque es generico, entonces lanza excepcion' do
    procesador_de_choques = Choque.new
    objeto_generico = ObjetoEspacial.new(procesador_de_choques)
    asteroide = Asteroide.new(procesador_de_choques)
    expect{procesador_de_choques.procesar_choque(asteroide, objeto_generico)}.to raise_exception(ObjetoGenericoException)
  end

  it 'si el receptor y generador de choque son genericos, entonces lanza excepcion' do
    procesador_de_choques = Choque.new
    objeto_generico_generador_de_choque = ObjetoEspacial.new(procesador_de_choques)
    objeto_generico_receptor_de_choque = ObjetoEspacial.new(procesador_de_choques)
    expect{procesador_de_choques.procesar_choque(objeto_generico_generador_de_choque, objeto_generico_receptor_de_choque)}.to raise_exception(ObjetoGenericoException)
  end

end