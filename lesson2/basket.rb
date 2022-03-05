
basket = {}
loop do
puts 'Название товара'
product = gets.chomp
puts 'Цена товара'
price = gets.to_f
puts 'Кол-во купленного товара'
number = gets.to_f
  break if product == 'stop'
basket[product] = {price: price, number: number }

end
basket.each do |key,val|
  summa = val[:price] * val[:number]
  puts "#{key} -- #{val}"
  puts "Итоговая сумма: #{summa}"
end
