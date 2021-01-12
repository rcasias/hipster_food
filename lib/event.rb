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


  def food_trucks_that_sell(item)
    answer = @food_trucks.find_all do |truck|
      if truck.check_stock(item) == item
        truck.name
      end
    end
  end
end
