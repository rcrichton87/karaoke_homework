require_relative('./bar.rb')

class Room

  attr_reader :guests, :playlist, :max_capacity, :bar

  def initialize
    @guests = []
    @playlist = []
    @max_capacity = 4
    @entry_fee = 20.00
    @bar = Bar.new
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

  def guest_total_money
    total_money = 0
    @guests.each do |guest|
      total_money += guest.money
    end
    return total_money
  end

  def order_drinks(search_name)
    found_drink = @bar.drinks.find do |drink|
      drink[:name] == search_name
    end
    @bar.increase_tab(found_drink[:price])
    if @bar.tab > guest_total_money
      puts "You can't afford that!"
      @bar.decrease_tab(found_drink[:price])
    else
      puts "Bought a #{found_drink[:name]} for #{found_drink[:price]}"
    end
  end

end