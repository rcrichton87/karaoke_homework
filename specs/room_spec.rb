require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')

class TestRoom < MiniTest::Test

def setup
  @room1 = Room.new()
end

  def test_room_starts_without_guests
    room_guests = @room1.guests
    assert_equal(0, room_guests.length)
  end

end