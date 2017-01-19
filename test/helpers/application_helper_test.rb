require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'card path helper' do
    assert_equal 'cards_jpg/123.jpg', card_path(123)
    assert_equal 'cards_jpg/1099', card_path(1099)
    assert_equal 'cards_png/1403.png', card_path(1403)
    assert_equal '1759.gif', card_path(1759)
  end
end