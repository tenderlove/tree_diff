require 'hpricot'

class Hpricot::Elem
  def accept visitor
    visitor.visit(self)
  end

  alias :old_text? :text?
  def text?
    return true if old_text?
    return true if %w{ script }.include?(name)
    return false
  end
end
