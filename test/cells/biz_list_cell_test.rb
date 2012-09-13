require 'test_helper'

class BizListCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
