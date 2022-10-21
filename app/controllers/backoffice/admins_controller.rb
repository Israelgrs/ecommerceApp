class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: %i[edit update destroy]
  after_action :verify_authorized, only: :new
  after_action :verify_policy_scoped, only: :index

  def index
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to backoffice_admins_path, notice: I18n.t('messages.created_with', item: @admin.first_name)
    else
      render :new, notice: 'Erro ao salvar administrador'
    end
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to backoffice_admins_path, notice: "A Administrador #{@admin.first_name} foi atualizado com sucesso!"
    else
      render :edit, notice: 'Erro ao atualizar administrador'
    end
  end

  def destroy
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: 'Administador excluído com sucesso.'
    else
      redirect_to backoffice_admins_path, notice: 'Erro ao excluir administrador'
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    pass = params[:admin][:password]
    pass_confirmation = params[:admin][:password_confirmation]

    if pass.blank? && pass_confirmation.blank?
      params[:admin].extract!(:password, :password_confirmation)
    end

    params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end