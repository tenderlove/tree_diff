module TreeDiff
  class DotVisitor
    def initialize
      @nodes = []
      @edges = []
    end

    def accept target
      target.accept(self)
    end

    def visit node
      i = 0
      @nodes << String.new(<<-eonode)
        "#{node.object_id}" [
          label = "{<f0> (#{node.name}) | #{node.source.map { |source|
            "<f#{i += 1}> #{source}"
          }.join(' | ')}}"
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
          ];
          #{@nodes.join + @edges.join}
        }
      eograph
    end
  end
end
