def stock_picker(array)
current_outcome = nil
i = 1
  while i < array.length
  j = 0
    while j < array.length-1 && i > j
        outcome = array[i]-array[j]
          if !current_outcome || current_outcome < outcome
            current_outcome = outcome
            indexes = [j,i]
          end
      j+=1
    end
    i+=1
  end
  indexes
end

stock_picker([3,17,6,9,15,8,6,1,10])
