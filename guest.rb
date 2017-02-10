class Guest

  attr_reader :name, :favourite_song

  def initialize(name, favourite_song)
    @name = name
    @favourite_song = favourite_song
  end

end