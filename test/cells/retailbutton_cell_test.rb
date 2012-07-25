require 'test_helper'

class RetailbuttonCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
