require 'test_helper'

class RightframeCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
