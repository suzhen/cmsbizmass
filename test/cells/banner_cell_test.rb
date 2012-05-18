require 'test_helper'

class BannerCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
