class Guest

  attr_reader :name, :cash

  def initialize(name, cash)
    @name = name
    @cash = cash
  end

  def remove_cash(amount)
    @cash -= amount
  end

end
