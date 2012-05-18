require 'test_helper'

class MenuCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
