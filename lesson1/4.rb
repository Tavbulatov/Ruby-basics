puts 'Ввод a'
a = gets.to_i
puts 'Ввод b'
b = gets.to_i
puts 'Ввод c'
c = gets.to_i
d = b**2 - 4 * a * c
if d > 0
d1 = Math.sqrt(d)
x1 = (-b + d1)/2 * a
x2 = (-b - d1)/2 * a
  puts "D = #{d},x1 = #{x1},x2 = #{x2}"
elsif d == 0
x1 = -b/(2 * a)
  puts "D = #{d},x1 = #{x1}"
elsif d < 0
  puts 'Корней нет'
end
