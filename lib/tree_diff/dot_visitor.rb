module TreeDiff
  class DotVisitor
    COLORS = {
      1 => 'blue',
      2 => 'red',
      3 => 'green',
    }

    def initialize root
      @root  = root
      @nodes = []
      @edges = []
    end

    def accept target
      target.accept(self)
    end

    def visit node
      i = 0
      color = @root.source == node.source ? 'white' : COLORS[node.source.length]

      @nodes << String.new(<<-eonode)
        "#{node.object_id}" [
          label = "<f0> (#{node.name})"
          color = #{color}
        ];
      eonode
      node.children.each { |child|
        @edges << String.new(<<-eoedge)
          "#{node.object_id}" -> "#{child.object_id}":f0 [
            id = #{@edges.length}
          ];
        eoedge
      }
      node.children.each { |c| c.accept(self) }
    end

    def to_s
      String.new(<<-eograph)
        digraph g {
          node [
            fontsize = "16"
            shape = "record"
            style = filled
          ];
          #{@nodes.join + @edges.join}
        }
      eograph
    end
  end
end
