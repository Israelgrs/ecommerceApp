class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :member

  # validates
  validates_presence_of :member, :category, :picture, :price, :description, :title

  # Scopes
  scope :descending_order, ->(quantity = 8) { limit(quantity).order(created_at: :desc) }
  scope :member_ads, ->(current_member) { where(member: current_member).order(created_at: :desc) }

  # Active storage image
  has_one_attached :picture do |attached|
    attached.variant :thumb, resize_to_limit: [100, 100]
  end

  # gem money_rails
  monetize :price_cents
end
