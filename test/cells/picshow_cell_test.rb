require 'test_helper'

class PicshowCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
