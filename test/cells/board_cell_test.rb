require 'test_helper'

class BoardCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
