class AddPriceToAds < ActiveRecord::Migration
  def change
    add_column :ads, :price, :decimal, :precision => 8, :scale => 2
  end
end
