# Temperature class that can be constructed with an options hash
class Temperature
  attr_accessor :temp
  
  def initialize(value={})
    self.temp = {}
    self.temp[:c] = value[:c] if !value[:c].nil?
    self.temp[:f] = value[:f] if !value[:f].nil?
  end
  
  def in_celsius
    temp[:c].nil? ? Temperature.ftoc(temp[:f]) : temp[:c]
  end
  
  def in_fahrenheit
    temp[:f].nil? ? Temperature.ctof(temp[:c]) : temp[:f]
  end
  
  def self.from_celsius(value)
    new(c: value)
  end
  
  def self.from_fahrenheit(value)
    new(f: value)
  end
  
  private
  # Conversions Fahrenheit to Celsius
  def self.ftoc(fahrenheit)
    (5.0/9) * (fahrenheit - 32)
  end

  # Conversion Celsius to Fahrenheit
  def self.ctof(celsius)
    (9.0/5) * celsius + 32
  end
end

# Subclasses Celsius and Fahrenheit
class Celsius < Temperature
  def initialize(value)
    self.temp = {}
    self.temp[:c] = value
  end
end

class Fahrenheit < Temperature
  def initialize(value)
    self.temp = {}
    self.temp[:f] = value
  end
end