module Enumerable
  def my_each
    if block_given?
      for i in self
        yield(i)
      end
      self
    else
      self.to_enum(:my_each)
    end
  end

  def my_each_with_index
    if block_given?
      for i in (0...self.length)
        yield(self[i],i)
      end
      self
    else
      self.to_enum(:my_each_with_index)
    end
  end

  def my_select
    result = []
    if block_given?
      self.my_each_with_index{|value| result << value if yield(value)}
      result
    else
      self.to_enum(:my_select)
    end
  end

  def my_all?
    result = []
    if block_given?
      self.my_each_with_index{|value| result << value if yield(value)}
      result.size < self.size ? false : true
    else
      self.my_each {|value| return false unless value == true}
      return true
    end
  end

  def my_any?
    result = []
    if block_given?
      self.my_each_with_index{|value| result << value if yield(value)}
      result.size > 0 ? true : false
    else
      self.my_each {|value| return true if value}
      return false
    end
  end

  def my_none?
    result = []
    if block_given?
      self.my_each_with_index{|value| result << value if not yield(value)}
      result.size < self.size ? false : true
    else
      self.my_each {|value| return false unless value == false}
      return true
    end
  end

  def my_count
    result = []
    if block_given?
      self.my_each_with_index{|value| result << value if yield(value)}
      result.size
    else
      return self.size
    end
  end

  def my_map(argument=nil)
    result = []
    if argument
      self.my_each_with_index{|value| result << argument.call(value)}
      result
    end
    if block_given?
      self.my_each_with_index{|value| result << yield(value)}
      result
    else
      self.to_enum(:my_map)
    end
  end

  def my_inject(value = 0)
    changed_value = value
    self.my_each{|x| changed_value = yield(changed_value, x)}
    changed_value
  end

  def multiply_els(array)
    array.my_inject(1){|sum, n| sum * n}
  end
end
