# Reverses the string return by the default block
def reverser
  yield.split(" ")
       .map { |x| x.reverse }
       .join(" ")
end

# Adds n to the value returned by the default block
def adder(n=1)
  yield + n
end

# Repeats the default block n times
def repeater(n=1)
  n.times do
    yield
  end
end