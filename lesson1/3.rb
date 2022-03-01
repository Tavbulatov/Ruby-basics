puts'Введите длину гипотенузы'
  c=gets.to_f
puts'Введите длину катета'
  a=gets.to_f
puts'ВВедите длину другого катета'
  b=gets.to_f
  c**=2
  p=a**2+b**2
  puts c
  puts p
  if c==p
    puts'Треугольник равносторонний'
  else
    puts'Треугольник прямоугольный'
  end



