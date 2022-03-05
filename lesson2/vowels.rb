vowels_alph = {}
vowels = "aeiouy"
("a".."z").each.with_index(1) do |alph, index|
  if vowels.include?(alph)
    vowels_alph[alph] = index
  end
end
puts vowels_alph
