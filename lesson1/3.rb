puts 'Введите сторону А'
a = gets.to_f**2
puts 'Введите сторону В'
b = gets.to_f**2
puts 'ВВедите сторону С'
c = gets.to_f**2

if a == b && b == c
  puts 'треугольник равнобедренный и равносторонний, но не прямоугольный'
else

  if a > b && a >c
    hypotenuse = a
    side_1 = b
    side_2 = c
  elsif b > a && b > c
    hypotenuse = b
    side_1 = c
    side_2 = a
  elsif c > b && c > a
    hypotenuse = c
    side_1 = b
    side_2 = a
  end

  if hypotenuse == (side_1 + side_2)
    puts 'Треугольник прямоугольный'
  else
    (hypotenuse == side_1) || (side_1 == side_2) || (side_2 == hypotenuse)
    puts 'Треугольник равнобедренный'
  end
end
