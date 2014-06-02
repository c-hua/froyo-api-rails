class CreateDiscountCoupons < ActiveRecord::Migration
  def change
    create_table :discount_coupons do |t|
      t.float :amount
      t.references :yogurt, index: true

      t.timestamps
    end
  end
end
