require "test/unit"
require 'rubygems'
require "tree_diff"

class TestTreeDiff < Test::Unit::TestCase
  def setup
    @html = <<-eohtml
    <html>
      <body>
        <table>
          <td>
          <td>
        </table>
      </body>
    </html>
    eohtml
    @ndoc = Nokogiri::HTML(@html)
    @hdoc = Hpricot(@html)
    @narf = HTMLTree::XMLParser.new
    @narf.feed(@html)
  end

  def test_unify_nokogiri
    assert TreeDiff::Unify.new('nokogiri').accept(@ndoc.root)
  end

  def test_unify_hpricot
    assert TreeDiff::Unify.new('hpricot').accept(@hdoc.root)
  end

  def test_unify_narf
    assert TreeDiff::Unify.new('narf').accept(@narf.root)
  end
end
