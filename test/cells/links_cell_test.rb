require 'test_helper'

class LinksCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
