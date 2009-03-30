require 'web/htmltools/xmltree'

class REXML::Element
  def accept visitor
    visitor.visit(self)
  end

  def text?
    children.length == 0 && has_text?
  end
end
