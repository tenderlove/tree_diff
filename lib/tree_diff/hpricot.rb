require 'hpricot'

class Hpricot::Elem
  def accept visitor
    visitor.visit(self)
  end
end
