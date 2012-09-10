require 'test_helper'

class MemberListCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
