require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')

class TestRoom < MiniTest::Test

def setup
  @room1 = Room.new()
  @guest1 = Guest.new("Ross")
  @guest2 = Guest.new("David")
end

  def test_room_starts_without_guests
    assert_equal([], @room1.guests)
  end

  def test_room_playlist_starts_empty
    assert_equal([], @room1.playlist)
  end

  def test_add_guest_to_room
    @room1.add_guest(@guest1)
    assert_equal([@guest1], @room1.guests)
  end

  def test_remove_guest_from_room
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.remove_guest("Ross")
    assert_equal([@guest2], @room1.guests)
  end

end