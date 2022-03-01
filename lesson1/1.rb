puts'Ваше имя?'
name=gets.chomp.capitalize
puts'Ваш рост?'
growth=gets.to_i
result=(growth-110)*1.15
puts'-------------------------------------------------------------------'
 puts"#{name} результат ваших антропометрических данных равно:#{result}"

 if  result <70
    puts'Ваш вес уже оптимальный!'
 end