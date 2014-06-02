require 'spec_helper'

describe Yogurt do
  it "is valid with a flavor, topping, and quantity" do
  	froyo = Yogurt.new(flavor: "plain", topping: "blueberries", quantity: 6.0)
  	expect(froyo).to be_valid
  end

  it "is not valid without a flavor" do
  	froyo = Yogurt.new(topping: "blueberries", quantity: 6.0)
  	expect(froyo).to be_invalid  	
  end  

  it "is not valid without a topping" do
  	froyo = Yogurt.new(flavor: "plain", quantity: 6.0)
  	expect(froyo).to be_invalid  	
  end  

  it "is not valid without a quantity" do
  	froyo = Yogurt.new(flavor: "plain", topping: "blueberries")
  	expect(froyo).to be_invalid  	
  end

  it "is not valid if the quantity is not a number" do
	froyo = Yogurt.new(flavor: "plain", topping: "blueberries", quantity: "six ounces")
  	expect(froyo).to be_invalid 
  end

  it "is not valid if the quantity is zero" do
  	froyo = Yogurt.new(flavor: "plain", topping: "blueberries", quantity: 0)
  	expect(froyo).to be_invalid 
  end

  it "is not valid if the quantity is less than zero (negative)" do
  	froyo = Yogurt.new(flavor: "plain", topping: "blueberries", quantity: -6.5)
  	expect(froyo).to be_invalid 
  end  

  it "is not valid if the quantity is greater than 12" do
  	froyo = Yogurt.new(flavor: "plain", topping: "blueberries", quantity: 16.0)
  	expect(froyo).to be_invalid 
  end

  describe "#price" do
  	it "returns the price of yogurt at 0.15 x quantity" do
  		froyo = Yogurt.new(flavor: "plain", topping: "blueberries", quantity: 10.0)
  		expect(froyo.price).to eq 1.50
  	end
  end

  describe "#name" do
  	it "returns a string in the format of 'QUANTITY oz of FLAVOR yogurt with TOPPING'" do
  		froyo = Yogurt.new(flavor: "plain", topping: "blueberries", quantity: 10.0)
  		expect(froyo.name).to eq "10.0 oz of plain yogurt with blueberries"
  	end
  end

  describe "flavor scopes" do
  	before do
      @coffee_yogurt = Yogurt.create!(flavor: "coffee", topping: "blueberries", quantity: 10.0)
      @chocolate_yogurt = Yogurt.create!(flavor: "chocolate", topping: "blueberries", quantity: 10.0)
      @strawberry_yogurt = Yogurt.create!(flavor: "strawberry", topping: "blueberries", quantity: 10.0)
  	end

  	describe "starts_with_c" do
  		it "should only include coffee and chocolate" do
  			expect(Yogurt.starts_with_c).to include(@coffee_yogurt)
  			expect(Yogurt.starts_with_c).to include(@chocolate_yogurt)
  			expect(Yogurt.starts_with_c).to_not include(@strawberry_yogurt)
  		end
  	end

  	describe "starts_with_s" do
  		it "should only include strawberry" do
  			expect(Yogurt.starts_with_s).to_not include(@coffee_yogurt)
  			expect(Yogurt.starts_with_s).to_not include(@chocolate_yogurt)
  			expect(Yogurt.starts_with_s).to include(@strawberry_yogurt)
  		end
  	end

  end


end
