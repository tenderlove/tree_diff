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
  end

  def test_to_dot
    assert @ndoc.to_dot
  end
end
