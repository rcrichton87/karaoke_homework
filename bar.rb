class Bar

  attr_reader :drinks
  attr_accessor :tab

  def initialize
    @tab = 0.00
    @drinks = [
      {
        name: "Beer",
        price: 5.00
      },
      {
        name: "Wine",
        price: 15.00
      },
      {
        name: "Pan-galactic Gargle Blaster",
        price: 200.00
      }
    ]
  end


  def increase_tab(amount)
    @tab += amount
  end

  

end