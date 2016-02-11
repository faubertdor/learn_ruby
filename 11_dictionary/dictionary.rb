# Dictionary class with hash
class Dictionary
  attr_accessor :entries
  attr_writer   :keywords
  
  def initialize(value={})
    self.entries = value
    self.keywords = []
  end
  
  def add(value)
    case
      when value.is_a?(String)
        self.entries[value] = nil
        self.keywords << value
      when value.is_a?(Hash) 
        value.each do |k, v|
        self.entries[k] = v
        self.keywords << k
      end
    end
  end
  
  def include?(keyword)
    keywords.include?(keyword)
  end
  
  def find(keyword)
    case
      when !include?(keyword)
        match = []
        matches_def = {}
      
        keywords.each { |key| match << key if key.start_with?(keyword) }
        match.each { |key| matches_def[key] = entries[key] }
        matches_def
      when include?(keyword)
        { keyword => entries[keyword] }
      else
        {}
    end
  end
  
  def keywords
    @keywords.length == 1 ? @keywords : @keywords.sort!
  end
  
  def printable
    self.keywords.sort!
    output = ""
    keywords.each do |key|
      output << "[#{key}] \"#{entries[key]}\""
      output << (keywords.last == key ? "" : "\n")
    end
    output
  end

end