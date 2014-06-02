
class Array
  # If +number+ is greater than the size of the array, the method
  # will simply return the array itself sorted randomly
  # defaults to picking one item
  def pick(number = 1)
    if (number == 1)
      sort_by{ rand }[0]
    else
      sort_by{ rand }.slice(0...number)
    end
  end
end


namespace :db do
  namespace :sample_data do

    desc "Fill the database with sample data for demo purposes"
    task :load => [
      :environment,
      :clear_all,
      :populate_yogurts,
      :populate_discount_coupons,
      ]

    task :clear_all => :environment do
      Yogurt.delete_all
      DiscountCoupon.delete_all
    end

    task :populate_yogurts => :environment do
      10.times do
        Yogurt.create!(:flavor => FLAVORS.pick,
          :topping => TOPPINGS.pick,
          :quantity => rand(12).to_f )
      end
    end

    task :populate_discount_coupons => :environment do
      Yogurt.all.each do |y|
        rand(3).times do
          DiscountCoupon.create!(:amount => rand * 2,
            :yogurt => y)
        end
      end
    end
  end
end

FLAVORS = ["Chocolate",
  "Vanilla", "Strawberry",
  "Banana", "Cookies & Cream",
  "Cheesecake", "Mint" ]

TOPPINGS = [ "Sprinkles",
  "Reices Pieces", "Brownie Crumbs",
  "Strawberry", "Chocolate Chips",
  "Banana", "Kiwi" ]