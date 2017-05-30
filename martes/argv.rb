#ARGV
def sentnce_to_pig
  p sentence = ARGV
  mensaje = []
  mensaje_final = ""

  for item in 0..(sentence.length - 1)
    word = sentence[item].split("")
    count = []
    final = []
    if "aeiou".include? (word[0])
      final = "#{word.join("")}way"
    else
      consonant = word.each { |item| count << item if "aeiou".include? (item) }
      final << word[word.index(count[0])..(word.length - 1)] + ["ay"] + word[0..(word.index(count[0]) - 1)]
      final = final.join("")
    end
    mensaje << final
  end
  for item in 0..mensaje.length - 1
    mensaje_final << mensaje[item] + " "
  end
  mensaje_final.split(" ")
end

p sentnce_to_pig

