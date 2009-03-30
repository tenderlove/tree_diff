require 'nokogiri'

class Nokogiri::XML::Node
  def accept visitor
    visitor.visit(self)
  end
end
