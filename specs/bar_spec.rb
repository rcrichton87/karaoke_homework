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

end