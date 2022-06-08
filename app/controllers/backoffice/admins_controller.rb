class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: %i[edit update]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to backoffice_admins_path, notice: "A Administrador  #{@admin.email} foi cadastrado com sucesso!"
    else
      render :new, notice: 'Erro ao salvar administrador'
    end
  end

  def edit
  end

  def update
    pass = params[:admin][:password]
    pass_confirmation = params[:admin][:password_confirmation]

    if pass.blank? && pass_confirmation.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end

    if @admin.update(admin_params)
      redirect_to backoffice_admins_path, notice: "A Administrador #{@admin.email} foi atualizado com sucesso!"
    else
      render :edit, notice: 'Erro ao atualizar administrador'
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
