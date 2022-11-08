class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :member

  # Active storage image
  has_one_attached :picture do |attached|
    attached.variant :thumb, resize_to_limit: [100, 100]
  end

  # gem money_rails 
  monetize :price_cents
end
