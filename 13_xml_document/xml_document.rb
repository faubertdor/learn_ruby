# XML document builder class
SPACE = "" # Used for identation
class XmlDocument
  attr_accessor :indent, :indent_counter
  
  def initialize(value=false)
    self.indent = value
    self.indent_counter = 0
  end
  
  def hello(attr={}, &block)
    build("hello", attr, &block)
  end
  
  def goodbye(attr={}, &block)
    build("goodbye", attr, &block)
  end
  
  def ok_fine(attr={}, &block)
    build("ok_fine", attr, &block)
  end
  
  def come_back(attr={}, &block)
    build("come_back", attr, &block)
  end
  
  def send(tag_name, attr={})
    build(tag_name, attr)
  end
  
  private
    
    # Create a tag without closing  
    def create_tag(tag_name, attr={})
      if attr.empty?
        "<#{tag_name}"
      else
        tag = "<#{tag_name}"
        attr.each do |k, v|
          tag << " #{k}=\'#{v}\'"
        end
        tag
      end
    end
    
    # If indentation is true used below to apply correctly
    def apply_indentation(for_tag)
      SPACE.rjust(indent_counter) + for_tag + "\n"
    end
    
    # It's a beginng tag so expect closing tag
    def begin_tag(tag_name, attr={})
      tag = create_tag(tag_name, attr) + ">"
      if indent
        tag = apply_indentation(tag)
        self.indent_counter += 2
      end
      tag
    end
    
    # There was a beginning tag please close now
    def end_tag(tag_name, attr={})
      tag = create_tag(tag_name, attr)
      tag.slice!("<")
      tag = "</#{tag}>"
      if indent
        self.indent_counter -= 2
        tag = apply_indentation(tag)
      end
      tag
    end
    
    # Do not expect closing tag 
    def self_closing_tag(tag_name, attr={})
      tag = create_tag(tag_name, attr) + "/>"
      if indent
        tag = apply_indentation(tag)
      end
      tag
    end
    
    # Nest a block inside a beginning and closing tag
    def build(tag_name, attr={}, &block)
      if block_given?
        begin_tag(tag_name, attr) + block.call + end_tag(tag_name, attr)
      else
        self_closing_tag(tag_name, attr)
      end
    end
      
end