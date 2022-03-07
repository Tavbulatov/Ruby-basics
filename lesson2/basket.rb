
basket = {}
loop do
  puts 'Название товара'
  product = gets.chomp
  break if product == 'стоп'
  puts 'Цена товара'
  price = gets.to_f
  puts 'Кол-во выбранного товара'
  quantity = gets.to_f
  basket[product] = { price: price, quantity: quantity }
end
total = 0
basket.each do |product, invoice|
  product_total = invoice[:price] * invoice[:quantity]
  total += product_total
  puts "Накладная по выбранному товару:\tПродукт: #{product}\tЦена:#{invoice[:price]}\tКол-во:#{invoice[:quantity]} \tСумма: #{total} "
end

puts "Сумма всего составляет: #{total}"
