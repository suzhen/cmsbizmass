require 'test_helper'

class VideoViewCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
