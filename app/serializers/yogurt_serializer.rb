class YogurtSerializer < ActiveModel::Serializer
  attributes :id, :flavor, :quantity
  has_many :discount_coupons
end
