require('minitest/autorun')
require('minitest/rg')
require_relative('../runner.rb')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')

class TestRunner < MiniTest::Test

  def setup
    @room1 = Room.new()
    @song1 = Song.new("Bohemian Rhapsody")
    @song2 = Song.new("Livin' on a Prayer")
    @song3 = Song.new("Rebel Yell")
    @song4 = Song.new("London Calling")
    @song5 = Song.new("Common People")
    @guest1 = Guest.new("Ross", @song4)
    @guest2 = Guest.new("David", @song5)
    @guest3 = Guest.new("Cara", @song2)
    @guest4 = Guest.new("Paul", @song1)
    @guest5 = Guest.new("Mike", @song3)
    
  end

end