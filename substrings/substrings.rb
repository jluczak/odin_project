def substrings(string, dictionary)
  dictionary
    .reduce(Hash.new(0)) { |a, b| a[b] += string.downcase.scan(/#{b}/).size; a }
    .map{|a,b| b>0 ? [a, b] : dictionary.delete([a, b])}
    .compact!.sort.to_h
end

substrings("Howdy partner, sit down! How's it going?", dictionary)
