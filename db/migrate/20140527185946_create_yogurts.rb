class CreateYogurts < ActiveRecord::Migration
  def change
    create_table :yogurts do |t|
      t.string :flavor
      t.string :topping
      t.float :quantity

      t.timestamps
    end
  end
end
