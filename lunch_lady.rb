# Lunch Lady Pseudocode:
# Basic Objectives:
#   - user chooses from a list of main dishes
#   - user chooses 2 side dish items
#   - computer repeats users order
#   - computer totals lunch items and displays total
#
# Bonus Objectives:
#   - user can choose as many "add-on" items as they want before getting total
#   - user can clear their choices and start over
#   - user has a wallet total they start with and their choices cannot exceed what they can pay for

# make class initialize item number, food, price
# put instances in an array
# iterate through array and call each instance in interpolation in menu def
# get user input
# add user input to user choices array
# do you want to add another?

class Food
  attr_accessor :item_number, :food, :price

  def initialize(item_number, food, price)
    @item_number = item_number
    @food = food
    @price = price
  end
end

steak = Food.new(1, "Bourbon Street Steak", 5.75)
chicken = Food.new(2, "Fiesta Lime Chicken", 3.95)
salmon = Food.new(3, "Savory Cedar Salmon", 4.55)
lamb = Food.new(4, "Grilled Lamb Chops", 5.25)
potatoes = Food.new(1, "Mashed Potatoes", 1.25)
vegetables = Food.new(2, "Steamed Vegetables", 1.75)
salad = Food.new(3, "Caesar Salad", 2.55)
soup = Food.new(4, "Tomato Basil Soup", 3.05)

@main_array = [steak, chicken, salmon, lamb]

@side_array = [potatoes, vegetables, salad, soup]

@user_choices_array = []

def welcome
  puts `clear`
  puts "Welcome to Lunch Lady"
end

def main_menu
  puts "Main Menu"
  @main_array.each do |item|
    puts "#{item.item_number}. #{item.food}- $#{item.price}"
  end
  puts "Please make a selection(1-4): "
  main_choice = gets.to_i
  main_menu_item = @main_array.find {|food_item| food_item.item_number == main_choice}
  @user_choices_array << main_menu_item
end

def side_menu
  puts "Side Dishes"
  @side_array.each do |item|
    puts "#{item.item_number}. #{item.food}- $#{item.price}"
  end
  puts "Please make a selection(1-4): "
  side_choice = gets.to_i
  side_menu_item = @side_array.find {|food_item| food_item.item_number == side_choice}
  @user_choices_array << side_menu_item
end

def user_order
  puts "Your order is: "
  @user_choices_array.each {|food_item| puts "#{food_item.food}"}
end

def total
  @sum = 0
  @user_choices_array.each {|item_price| @sum += item_price.price}
  puts "Your total is: #{@sum.round(2)}"
end

def add_on
  puts "Would you like to add another?(y/n)"
  @user_add = gets.strip.downcase
end

def reset_order
  puts "If you are not satisfied with this order, you can restart."
  puts "Would you like to restart your order?(y/n)"
  @user_reset = gets.strip.downcase
end

# def wallet
#   puts "Please enter the amount you have to spend(i.e. 10.50): "
#   @max = gets.to_f.round(2)
#   puts "You have $#{@max} to spend."
# end

# def check_wallet
#   if @sum > @max
#     puts "Sorry, you do not have enough money for this item."
#     return false
#   else
#     puts "The item has been added to your order."
#     return true
#   end
# end

def take_order(menu)
  menu
  user_order
  total
end

def lunch_lady
  welcome
  # wallet
  take_order(main_menu)
  # while something is true, run this code
  var = 1
  while var <= 2
    var += 1
    take_order(side_menu)
  end
  add_on
  while @user_add == "y"
    take_order(side_menu)
    add_on
  end
end

lunch_lady
reset_order

if @user_reset == "y"
  @user_choices_array.clear
  lunch_lady
  reset_order
end

user_order
total
