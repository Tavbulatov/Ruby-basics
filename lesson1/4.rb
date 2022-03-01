puts'Ввод a'
a=gets.to_i
puts'Ввод b'
b=gets.to_i
puts 'Ввод c'
c=gets.to_i

d=b**2-4*a*c
d1=Math.sqrt(d)
x1=(-b+d1)/2*a
x2=(-b-d1)/2*a

if d>0
 puts"D=#{d},x1=#{x1},x2=#{x2}"
elsif d==0
    puts"D=#{d},x1=#{x1}"
elsif d<0
    puts"D=#{d},Корней нет"
end


