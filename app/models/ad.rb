class Ad < ApplicationRecord
  # Callbacks
  before_save :md_to_html

  # Relationships
  belongs_to :category, counter_cache: true
  belongs_to :member
  has_many :comments

  # validates
  validates :member, :category, :picture, :finish_date, presence: true
  validates :description_md, :description_short, :title, presence: true
  validates :price, numericality: { greater_than: 0 }

  # Scopes
  scope :descending_order, ->(quantity = 8, page) { order(created_at: :desc).page(page).per(quantity) }
  scope :member_ads, ->(current_member) { where(member: current_member).order(created_at: :desc) }
  scope :where_category, ->(id) { where(category_id: id).order(title: :asc) }
  scope :search, ->(q, page) { where("lower(title) LIKE ?", "%#{q.downcase}%").page(page).per(8) }

  # Active storage image
  has_one_attached :picture do |attached|
    attached.variant :thumb, resize_to_limit: [100, 100]
  end

  # gem money_rails
  monetize :price_cents

  private
  def md_to_html
    options = {
      filter_html: true,
      link_attributes: {
        rel: "nofollow",
        target: "_blank"
      }
    }

    extensions = {
      space_after_headers: true,
      autolink: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    self.description = markdown.render(self.description_md).html_safe
  end
end
