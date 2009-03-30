module TreeDiff
  class Unify
    def initialize source
      @source = source
    end
  
    def accept target
      target.accept(self)
    end
  
    def visit node
      children = (node.children || []).find_all { |c|
        !c.text? && c.respond_to?(:accept)
      }
  
      edge = node.parent.children.find_all { |c|
        !c.text? && c.respond_to?(:accept)
      }.index(node)
  
      Node.new(
        node.name,
        edge,
        children.map { |child| child.accept(self) },
        [@source]
      )
    end
  end
end
