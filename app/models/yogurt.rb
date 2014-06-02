class Yogurt < ActiveRecord::Base

	has_many :discount_coupons

	validates_presence_of :flavor, :topping, :quantity
	validates_numericality_of :quantity, greater_than: 0, less_than_or_equal_to: 12

	scope :starts_with_c, -> { where("flavor LIKE ?", "c%") }
	scope :starts_with_s, -> { where("flavor LIKE ?", "s%") }

	def price
		0.15 * quantity
	end

	def name
		"#{quantity} oz of #{flavor} yogurt with #{topping}"
	end
end
