require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestGuest < MiniTest::Test

  def setup
    @song1 = Song.new("Bohemian Rhapsody")
    @guest1 = Guest.new("Ross", @song1)
  end

  def test_guest_has_name
    assert_equal("Ross", @guest1.name)
  end

  def test_guest_has_favourite_song
    assert_equal(@song1, @guest1.favourite_song)
  end

  def test_guest_has_money
    assert_equal(200, @guest1.money)
  end

end