class Room

  attr_reader :guests, :playlist

  def initialize
    @guests = []
    @playlist = []
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

end