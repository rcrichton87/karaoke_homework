class Room

  attr_reader :guests, :playlist, :max_capacity

  def initialize
    @guests = []
    @playlist = []
    @max_capacity = 4
  end

  def add_guest(guest)
    @guests.push(guest)
  end

  def remove_guest(name_to_remove)
    @guests.each do |guest|
      if guest.name == name_to_remove
        @guests.delete(guest)
      end
    end
  end

  def add_song(song)
    @playlist.push(song)
  end

end