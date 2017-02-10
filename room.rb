class Room

  attr_reader :guests, :playlist

  def initialize
    @guests = []
    @playlist = []
  end

  def add_guest(guest)
    @guests.push(guest)
  end

end