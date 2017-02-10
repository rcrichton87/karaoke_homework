class Guest

  attr_reader :name, :favourite_song
  attr_accessor :money

  def initialize(name, favourite_song)
    @name = name
    @favourite_song = favourite_song
    @money = 200
  end

end