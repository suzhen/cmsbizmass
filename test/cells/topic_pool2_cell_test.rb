require 'test_helper'

class TopicPool2CellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
