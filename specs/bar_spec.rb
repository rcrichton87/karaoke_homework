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
        price: 5.00
      },
      {
        name: "Wine",
        price: 15.00
      },
      {
        name: "Pan-galactic Gargle Blaster",
        price: 200.00
      }
    ]
    actual = @bar.drinks
    assert_equal(expected, actual)
  end

  def test_increase_tab
    @bar.increase_tab(15.00)
    expected = 15.00
    actual = @bar.tab
    assert_equal(expected, actual)
  end

  def test_decrease_tab
    @bar.increase_tab(15.00)
    @bar.decrease_tab(10.00)
    expected = 5.00
    actual = @bar.tab
    assert_equal(expected, actual)
  end



end