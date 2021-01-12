class Event
  attr_reader :event_name,
              :food_trucks

  def initialize(event_name)
    @event_name = event_name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    names = @food_trucks.map do |truck|
      truck.name
    end
  end

  def item
    @food_truck.map do |truck|
      truck.inventory.keys.each do |key|
        item_array << key
      end
    end
  end


  def food_trucks_that_sell(item)
    answer = []
    require'pry'; binding.pry
    @food_trucks.each do |truck|
      if truck.check_stock(item) == item
        answer << truck
      end
    end
    answer
  end


end
