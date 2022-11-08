class PriceChangeValue < ActiveRecord::Migration[7.0]
  def change
    change_column(:product, :price, :decimal, precision: 9, scale: 2)
  end
end
