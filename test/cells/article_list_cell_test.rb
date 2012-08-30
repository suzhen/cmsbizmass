require 'test_helper'

class ArticleListCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
