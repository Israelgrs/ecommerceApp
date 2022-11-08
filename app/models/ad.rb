class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :member

  # Active storage image
  has_one_attached :picture

  # gem money_rails 
  monetize :price_cents
end
