require 'test_helper'

class HouseListCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
