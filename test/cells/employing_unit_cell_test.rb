require 'test_helper'

class EmployingUnitCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
