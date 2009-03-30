require 'web/htmltools/xmltree'

class REXML::Element
  def accept visitor
    visitor.visit(self)
  end

  def text?
    children.length == 0 && has_text?
  end
end

class REXML::Comment
  def text?; true; end
end

class REXML::Text
  def text?; true; end
end
