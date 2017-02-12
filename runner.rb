require_relative('./guest.rb')
require_relative('./song.rb')
require_relative('./room.rb')
require_relative('./bar.rb')

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
  
  def check_buy_drinks
    finished_buying_drinks = false
    while finished_buying_drinks == false
      puts "Your current tab is #{@room.bar.tab}, your group has #{@room.guest_total_money}."
      puts "Do you want to buy drinks? y/n"
      input = gets.chomp.downcase
      if input == "n"
        return
      elsif input == "y"
        puts "Select the number of a drink to order:"
        @room.bar.drinks.each_with_index do |drink, index|
          puts "#{index + 1}. #{drink[:name]} - #{drink[:price]}"
        end
        input_number = gets.chomp.to_i
        input_index = input_number - 1
        drink = @room.bar.drinks[input_index]
        @room.order_drinks(drink[:name])
      else
        puts "Please input 'y' for yes or 'n' for no."
      end
    end
  end

  def check_guests_leaving
    finished_checking_guests_leaving = false
    while finished_checking_guests_leaving == false
      puts "Is anyone checking out from the room? y/n"
      input = gets.chomp.downcase
      if input == "n"
        return
      elsif input == "y"
        puts "Select the number of the person leaving:"
        @room.guests.each_with_index do |guest, index|
          puts "#{index + 1}. #{guest.name}"
        end
        input_number = gets.chomp.to_i
        input_index = input_number - 1
        guest = @room.guests[input_index]
        tab = @room.bar.tab.to_f
        leaving_guests_share = tab / @room.guests.length
        @room.bar.tab.decrease_tab
        puts "Thanks for visiting #{guest.name}! Your share of the tab is #{leaving_guests_share}, the remaining tab is #{@room.bar.tab}!"
        @room.remove_guest(guest)
      else
        puts "Please input 'y' for yes or 'n' for no."
      end
    end
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
      check_buy_drinks
      check_guests_leaving
    end
  end

  def all_leave
    final_tab = @room.bar.tab.round(2)
    each_guest_pays = final_tab / @room.guests.length
    puts "Thanks for visiting, your tab is #{final_tab}, each person pays #{each_guest_pays.round(2)}!"
  end

end
  


karaoke_bar = Runner.new()
karaoke_bar.get_guests
karaoke_bar.get_songs
karaoke_bar.check_buy_drinks
karaoke_bar.go_through_playlist
karaoke_bar.all_leave
