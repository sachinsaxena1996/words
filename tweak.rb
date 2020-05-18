class TextTwist
  def twist(word)
    arr = word
    has_min_6 = false
    (1..word.size).each.with_object([]) do |n,a|     
      a << possible_words(arr, word.length)
      a << possible_words(arr, word.length - 1)
      a << possible_words(arr, word.length - 2)
      a << possible_words(arr, word.length - 3 )
    end    
  end

  def possible_words(arr, length)
    a = []
    arr.permutation(length).each do |comb|
        w = comb.join
        a << w if system("look #{w} > /dev/null 2>&1") && w.length >2
    end
    a
  end
end

possible_words = TextTwist.new.twist(['f', 'i', 'l', 't', 'e', 'r'])

if possible_words.flatten.any? {|word| word.length == 6}
  p possible_words
else
  puts "no word with 6 chars"
end