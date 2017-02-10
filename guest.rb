class Guest

  attr_reader :name, :favourite_song
  attr_accessor :money

  def initialize(name, favourite_song)
    @name = name
    @favourite_song = favourite_song
    @money = 200
  end

  def favourite_song?(current_song)    
    if current_song == @favourite_song 
      return "#{@name}: Woohoo!"
    else
      return nil
    end
  end

end