# Runs a block of code and then tells you how long it took to run
def measure(n=1)
  total = 0
  n.times do
    before = Time.now
    yield
    after = Time.now
    total += (after - before)
  end
  total / n.to_f
end