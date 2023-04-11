class AdStatusToAd < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :status, :integer, default: 0
  end
end
