require('minitest/autorun')
require('minitest/rg')
require_relative('../bar.rb')

class TestBar < MiniTest::Test

  def setup
    @bar = Bar.new()
  end

  def test_tab_starts_at_zero
    assert_equal(0, @bar.tab)
  end

  def test_drinks
    expected = [
      {
        name: "Beer",
        price: 5
      },
      {
        name: "Wine",
        price: 15
      },
      {
        name: "Pan-galactic Gargle Blaster",
        price: 150
      }
    ]
    actual = @bar.drinks
    assert_equal(expected, actual)
  end

end