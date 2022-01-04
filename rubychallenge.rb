def generar_orden(letra, abecedario)
  p = abecedario.index(letra)
  (abecedario[p]..abecedario[25]).to_a + (abecedario[0]...abecedario[p]).to_a
end

def generar_valor_asc(orden)
  asc = {}
  contadorasc = 1
  orden.each do |char|
    asc[char] = contadorasc
    contadorasc += 1
  end
  return asc
end

def generar_valor_desc(orden)
  desc = {}
  contadordesc = 26
  orden.each do |char|
    desc[char] = contadordesc
    contadordesc -= 1
  end
  return desc
end

abecedario = ('A'..'Z').to_a
puts('Ingrese una palabra en mayúsculas, sin números ni caracteres especiales')
palabra = gets
palabra = palabra.split('')
mayor = 0

abecedario.each do |letra|
  contarasc = 0
  contardesc = 0
  nuevo_orden = generar_orden(letra, abecedario)
  asc = generar_valor_asc(nuevo_orden)
  desc = generar_valor_desc(nuevo_orden)

  palabra.each do |char|
    contarasc += asc[char].to_i
    contardesc += desc[char].to_i
  end
  if contarasc > mayor && contarasc > contardesc
    mayor = contarasc
  elsif contardesc > mayor && contardesc > contarasc
    mayor = contardesc
  end
end

puts('El mayor valor posible de la palabra es:')
puts(mayor)
