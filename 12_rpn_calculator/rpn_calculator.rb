# Reverse Polish Notation Calculator class
class RPNCalculator
  attr_accessor :stack, :value, :operators
  
  def initialize
    self.stack = []
    self.value = 0
    self.operators = [:+, :-, :*, :/]
  end
  
  def push(item)
    self.stack.push(item)
  end
  
  def plus
    operation(:+)
  end
  
  def minus
    operation(:-)
  end
  
  def times
    operation(:*)
  end
   
  def divide
    operation(:/)
  end
  
  def tokens(str)
    token_arr = str.split(" ")
    token_arr.map! do |x|
      if operators.include?(x.to_sym)
        x.to_sym
      else
        x.to_i
      end
    end
    token_arr
  end
  
  def evaluate(str)
    token_arr = tokens(str)
    
    token_arr.each do |x|
      if !operators.include?(x)
        push(x)
      else
        operation(x)
      end
    end
    self.value
  end
  
  private
    def operation(operator)
      if stack.empty?
        raise "calculator is empty"
      end
      
      a = stack.pop
      b = stack.pop
      case
        when operator == :+
          self.value = a + b
        when operator == :-
          self.value = b - a
        when operator == :*
          self.value = a * b
        when operator == :/
          self.value = b.to_f / a
      end
      push(value)
    end
end

