module TreeDiff
  class Node < Struct.new(:name, :edge, :children, :source)
    def == other
      name == other.name && edge == other.edge
    end
    alias :eql? :==
  
    def hash
      "#{name}#{edge}".hash
    end
  
    def merge other
      raise unless other.name == name
      diff   = (children - other.children) + (other.children - children)
  
      left_same   = (children & other.children)
  
      merged = left_same.map do |node|
        node.merge(other.children.find { |n| n == node })
      end
  
      Node.new(name, edge, diff + merged, source + other.source)
    end

    def accept visitor
      visitor.visit(self)
    end
  end
end
