require 'test_helper'

class InvestmentProjectCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
