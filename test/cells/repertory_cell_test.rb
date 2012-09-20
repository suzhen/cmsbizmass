require 'test_helper'

class RepertoryCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
