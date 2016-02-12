# Reopen the Array class and defined sum, square and square!
class Array
  def sum
    total = 0
    if length == 0
      total
    else
      each { |x| total += x }
      total
    end
  end
  
  def square
    if length == 0
      []
    else
      map { |x| x * x }
    end
  end
  
  def square!
    if length == 0
      []
    else
      map! { |x| x * x }
    end
  end
  
end