require 'test_helper'

class TopicPool8CellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
