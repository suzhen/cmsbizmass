require 'test_helper'

class MagazinesCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
