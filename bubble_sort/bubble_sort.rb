def bubble_sort(numbers)
  numbers.length.downto(1) do
    for i in (0...numbers.length-1) do
      numbers[i], numbers[i+1] = numbers[i+1], numbers[i] if   numbers[i] > numbers[i+1]
    end
  end
  numbers
end

def bubble_sort_by(numbers)
  numbers.length.downto(1) do
    for i in (0...numbers.length-1) do
      numbers[i], numbers[i+1] = numbers[i+1], numbers[i] if   yield(numbers[i],numbers[i+1]) > 0
    end
  end
  numbers
end
