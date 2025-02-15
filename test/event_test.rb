require 'minitest/autorun'
require './lib/item'
require './lib/food_truck'
require './lib/event'


class EventTest < Minitest::Test

  def test_it_exists
    event = Event.new("South Pearl Street Farmers Market")

    assert_instance_of Event, event
  end

  def test_it_has_attributes
    event = Event.new("South Pearl Street Farmers Market")

    assert_equal "South Pearl Street Farmers Market", event.event_name
    assert_equal [], event.food_trucks
  end

  def test_add_food_truck
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expects = [food_truck1, food_truck2, food_truck3]

    assert_equal event.food_trucks, expects
  end

  def test_food_truck_names
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expects = ["Rocky Mountain Pies","Ba-Nom-a-Nom","Palisade Peach Shack"]

    assert_equal event.food_truck_names, expects
  end

  def test_food_trucks_that_sell
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3.stock(item1, 65)

    expects = [food_truck1, food_truck3]

    assert_equal event.food_trucks_that_sell(item1), expects
  end
end
