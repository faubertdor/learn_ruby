# Timer class to format time to string 00:00:00
class Timer
  attr_accessor :seconds
  
  def initialize
    self.seconds = 0
  end
  
  # Helper method
  def padded(n=0)
    n < 10 ? '0' + n.to_s : n.to_s
  end
  
  # Format a number of seconds in to a time string
  def time_string
    m = seconds / 60
    self.seconds %= 60
    h = m / 60
    m %= 60
    "#{padded(h)}:#{padded(m)}:#{padded(seconds)}"
  end
  
end