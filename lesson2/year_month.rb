puts 'Введите число дня'
day = gets.to_i
puts 'Введите месяц'
month = gets.to_i
puts 'Введите год'
year = gets.to_i

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
months[1] = 29 if year % 400 !=0 || year % 4 && year % 100 ==0

summa = months.first(month - 1)
i = 0
summa.each do |item|
  i+=item
end
i+=day
puts "#{i}"
#Осман с этой задачей горе пополам справился.Но самое интересное он сработал
#и при повторном запуске он не выдает нужный рез-т.Как думаешь почему?
