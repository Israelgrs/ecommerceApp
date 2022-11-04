class AddPriceCentsToAds < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :price_cents, :integer, default: 0
  end
end
