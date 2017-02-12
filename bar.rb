class Bar

  attr_reader :drinks
  attr_accessor :tab

  def initialize
    @tab = 0.0
    @drinks = [
      {
        name: "Beer",
        price: 5.0
      },
      {
        name: "Wine",
        price: 15.0
      },
      {
        name: "Pan-galactic Gargle Blaster",
        price: 200.0
      }
    ]
  end


  def increase_tab(amount)
    @tab += amount
  end

  def decrease_tab(amount)
    @tab -= amount
  end  

end