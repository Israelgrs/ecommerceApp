class AddDescriptionsToToAds < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :description_md, :text
    add_column :ads, :description_short, :text
  end
end
