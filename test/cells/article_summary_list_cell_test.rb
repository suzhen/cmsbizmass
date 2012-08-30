require 'test_helper'

class ArticleSummaryListCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
