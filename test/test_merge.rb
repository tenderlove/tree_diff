require "test/unit"
require 'rubygems'
require "tree_diff"

class TestMerge < Test::Unit::TestCase
  def setup
    @html = <<-eohtml
    <html>
      <body>
        <table>
          <td>
        </table>
      </body>
    </html>
    eohtml
    @ndoc = TreeDiff::Unify.new('nokogiri').accept(Nokogiri::HTML(@html).root)
    @hdoc = TreeDiff::Unify.new('hpricot').accept(Hpricot(@html).root)
    @narf = HTMLTree::XMLParser.new
    @narf.feed(@html)
    @narf = TreeDiff::Unify.new('narf').accept(@narf.root)
  end

  def test_two_way_merge
    merged = @ndoc.merge(@narf)

    source_counter = Class.new(Struct.new(:sources)) {
      def visit node
        self.sources += node.source
        node.children.each { |c| c.accept(self) }
      end
    }.new([])

    merged.accept(source_counter)
    assert source_counter.sources.include?('nokogiri')
    assert source_counter.sources.include?('narf')
  end

  def test_three_way_merge
    merged = @ndoc.merge(@narf).merge(@hdoc)

    source_counter = Class.new(Struct.new(:sources)) {
      def visit node
        self.sources += node.source
        node.children.each { |c| c.accept(self) }
      end
    }.new([])

    merged.accept(source_counter)
    assert source_counter.sources.include?('nokogiri')
    assert source_counter.sources.include?('narf')
    assert source_counter.sources.include?('hpricot')
  end
end
