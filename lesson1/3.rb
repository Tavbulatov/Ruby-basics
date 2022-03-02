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
  gipotenuza = a
  storona_1 = b
  storona_2 = c
elsif b > a && b > c
  gipotenuza = b
  storona_1 = c
  storona_2 = a
elsif c > b && c > a
  gipotenuza = c
  storona_1 = b
  storona_2 = a
end

if gipotenuza == (storona_1 + storona_2)
  puts 'Треугольник прямоугольный'
else
(gipotenuza == storona_1) || (storona_1 == storona_2) || (storona_2 == gipotenuza)
  puts 'Треугольник равнобедренный'
end
end
