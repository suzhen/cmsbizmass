require 'test_helper'

class HouseCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
