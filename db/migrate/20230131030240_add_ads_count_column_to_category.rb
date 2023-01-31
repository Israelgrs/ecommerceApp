class AddAdsCountColumnToCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :ads_count, :integer, default: 0
  end
end
