vowels_alph = {}
vowels = "a,e,i,o,u,y"
("a".."z").each_with_index do |alph,index|
  if vowels.include?(alph)
    vowels_alph[alph] = index
  end
end
puts vowels_alph
