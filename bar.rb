class Bar

  attr_reader :drinks
  attr_accessor :tab

  def initialize
    @tab = 0
    @drinks = [
      {
        name: "Beer",
        price: 5
      },
      {
        name: "Wine",
        price: 15
      },
      {
        name: "Pan-galactic Gargle Blaster",
        price: 200
      }
    ]
  end


  def increase_tab(amount)
    @tab += amount
  end

  

end