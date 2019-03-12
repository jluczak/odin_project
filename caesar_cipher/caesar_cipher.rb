ALPHABET_BIG = ("A".."Z").to_a
ALPHABET_SMALL = ("a".."z").to_a

def caesar_cipher(string, number)
  string.split("").map{|letter|
    index_small = ALPHABET_SMALL.index(letter)
    index_big = ALPHABET_BIG.index(letter)
    while index_small.to_i+number>25 ||
          index_big.to_i+number>25
      number-=26
    end
    if index_big
      ALPHABET_BIG[index_big+number]
    elsif index_small
      ALPHABET_SMALL[index_small+number]
    else
      letter
    end
    }.join()
end


caesar_cipher("What a string!", -5)
