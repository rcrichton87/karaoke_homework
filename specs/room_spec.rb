require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestRoom < MiniTest::Test

def setup
  @room1 = Room.new()
  @guest1 = Guest.new("Ross", @song4)
  @guest2 = Guest.new("David", @song5)
  @guest3 = Guest.new("Cara", @song2)
  @guest4 = Guest.new("Paul", @song1)
  @guest5 = Guest.new("Mike", @song3)
  @song1 = Song.new("Bohemian Rhapsody")
  @song2 = Song.new("Livin' on a Prayer")
  @song3 = Song.new("Rebel Yell")
  @song4 = Song.new("London Calling")
  @song5 = Song.new("Common People")
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

  def test_add_song_to_playlist
    @room1.add_song(@song1)
    assert_equal([@song1], @room1.playlist)
  end

  def test_room_max_capacity
    assert_equal(4, @room1.max_capacity)
  end

  def test_adding_to_room_at_max_capacity
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.add_guest(@guest3)
    @room1.add_guest(@guest4)
    @room1.add_guest(@guest5)
    expected = [@guest1, @guest2, @guest3, @guest4]
    actual = @room1.guests
    assert_equal(expected, actual)
  end

  def test_charge_entry_fee
    @room1.add_guest(@guest1)
    assert_equal(180, @guest1.money)
  end

  def test_guest_total_money
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    expected = 360
    actual = @room1.guest_total_money
  end

end