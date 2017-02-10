require_relative('./guest.rb')
require_relative('./song.rb')
require_relative('./room.rb')

require('pry')

class Runner

attr_reader :song_library, :room

  def initialize
    song1 = Song.new("Bohemian Rhapsody")
    song2 = Song.new("Livin' on a Prayer")
    song3 = Song.new("Rebel Yell")
    song4 = Song.new("London Calling")
    song5 = Song.new("Common People")
    @song_library = [song1, song2, song3, song4, song5]
    @room = Room.new()
  end
  
  def get_guests
    finished_adding_guests = false
    while finished_adding_guests == false
      puts "Enter the guest's name, 'done' to finish:"
      guest_name = gets.chomp.capitalize
      if guest_name == "Done"
        finished_adding_guests = true
      else
        puts "Select the number of your favourite song:"
        song_library.each_with_index do |song, index|
          puts "#{index + 1} - #{song.title}"
        end
        song_number = gets.chomp.to_i
        song_index = song_number - 1
        new_guest = Guest.new(guest_name, @song_library[song_index])
        @room.add_guest(new_guest)
      end
    end
  end

  def get_songs
    finished_adding_songs = false
    while finished_adding_songs == false
      puts "Select the number of a song to add it to the playlist, or anything else to finish:"
      @song_library.each_with_index do |song, index|
        puts "#{index + 1} - #{song.title}"
      end
      song_number = gets.chomp.to_i
      song_index = song_number - 1
      if song_number == 0
        finished_adding_songs = true
      elsif song_library[song_index] != nil      
        @room.add_song(@song_library[song_index])
      else
        puts "Not found, please enter another number"
      end
    end
  end

  def go_through_playlist
    while room.playlist.length > 0
      current_song = room.playlist.shift
      puts "Now playing #{current_song.title}"
      guests_who_like_song = room.guests.find_all do |guest|
        guest.favourite_song?(current_song)
      end
      guests_who_like_song.each do |guest|
        puts "#{guest.name}: Woohoo!"
      end
      sleep(1)
    end
  end
end
  

karaoke_bar = Runner.new()
karaoke_bar.get_guests
karaoke_bar.get_songs
karaoke_bar.go_through_playlist