require 'test_helper'

class TopicPool5CellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
