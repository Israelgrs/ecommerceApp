class CategoryService
  attr_accessor :category

  def self.create(category_params)
    @category = Category.new(category_params)

    @category.save if @category.valid?

    @category
  end
end