require 'nokogiri'

class Nokogiri::XML::Node
  def accept visitor
    visitor.visit(self)
  end

  alias :old_text? :text?
  def text?
    return true if old_text?
    return true if %w{ comment script }.include?(name)
    return true if name == '#cdata-section'
    false
  end
end
