require 'test_helper'

class TopicPool9CellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
