class Room

  attr_reader :guests, :playlist, :max_capacity

  def initialize
    @guests = []
    @playlist = []
    @max_capacity = 4
    @entry_fee = 20
  end

  def add_guest(guest)
    if @guests.length >= @max_capacity
      puts "No more room for guests!"
    else
      guest.money -= @entry_fee
      @guests.push(guest)
    end
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