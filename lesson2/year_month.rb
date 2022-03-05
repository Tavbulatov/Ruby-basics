puts 'Введите число дня'
day = gets.to_i
puts 'Введите месяц'
month = gets.to_i
puts 'Введите год'
year = gets.to_i

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
months[1] = 29 if year % 4 == 0 && year % 100 != 0 || year % 400 == 0

total = months.first(month - 1).sum
total+=day
puts total
