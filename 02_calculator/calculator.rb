# Add to numbers
def add(num1, num2)
  num1 + num2
end

# Substract two numbers
def subtract(num1, num2)
  num1 - num2
end

# Sum an array
def sum(arr)
  total = 0
  arr.each { |x| total += x }
  total
end

# Multiply several numbers
def multiply(a, *b)
  total = a
  b.each { |x| total *= x }
  total
end

# Raise one number to the power of another
def power(num1, num2)
  num1 ** num2
end

# Factorial of a given number
def factorial(n)
  return 1 if n == 0
  n * factorial(n - 1)
end

