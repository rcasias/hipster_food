class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory == {}
      0
    end
  end

  def stock(item, amount)
    @inventory[item] = amount
    @inventory
  end

  def check_stock(item)
    @inventory[item]
    # require 'pry'; binding.pry
  end
end
