class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: %i[edit update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to backoffice_categories_path, notice: "A Categoria  #{@category.description} foi cadastrada com sucesso!"
    else
      render :new, notice: 'Erro ao salvar categoria'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to backoffice_categories_path, notice: "A Categoria #{@category.description} foi atualizada com sucesso!"
    else
      render :edit, notice: 'Erro ao atualizar categoria'
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:description)
  end
end
