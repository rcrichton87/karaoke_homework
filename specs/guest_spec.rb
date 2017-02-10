require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestGuest < MiniTest::Test

  def setup
    @song1 = Song.new("Bohemian Rhapsody")
    @guest1 = Guest.new("Ross", @song1)
    @song2 = Song.new("Livin' on a Prayer")
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

  def test_favourite_song?
    expected = true
    actual = @guest1.favourite_song?(@song1)
    assert_equal(expected, actual)
  end

  def test_favourite_song__not_present
    expected = false
    actual = @guest1.favourite_song?(@song2)
    assert_equal(expected, actual)
  end

end