class Site::Profile::MemberController < Site::ProfileController
  before_action :set_member
  def edit;end

  def update
    if @member.update(member_params)
      redirect_to site_profile_dashboard_index_path, notice: 'Usuário editado com sucesso!'
    else
      render :edit, notice: 'Falha ao salvar usuário'
    end
  end


  private
  def set_member
    @member = Member.find(current_member.id)
  end

  def member_params
    params.require(:member).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
