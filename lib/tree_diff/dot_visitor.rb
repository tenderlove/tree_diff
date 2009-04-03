module TreeDiff
  class DotVisitor
    COLORS = {
      'nokogiri' => 'blue',
      'hpricot'  => 'red',
      'narf'     => 'green',
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
      if @root.source == node.source
        @nodes << String.new(<<-eonode)
          "#{node.object_id}" [
            label = "<f0> (#{node.name})"
          ];
        eonode
      else
        i = 0
        @nodes << String.new(<<-eonode)
          "#{node.object_id}" [
            label = "{<f0> (#{node.name}) | #{node.source.map { |src|
              "<f#{i}> #{src}"
            }.join(" | ")}}"
            color = #{COLORS[node.source.first]}
          ];
        eonode
      end
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
