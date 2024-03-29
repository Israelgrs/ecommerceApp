class Backoffice::SendEmailController < ApplicationController
  def edit
    @admin = Admin.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def create
    begin
      AdminMailer.send_message(current_admin, params[:'recipient-email'], params[:'subject-text'], params[:'message-text']).deliver_now
      @notify_message = 'E-mail enviado com sucesso!'
      @notify_flag = 'success'
    rescue StandardError => e
      @notify_message = 'Erro ao enviar e-mail. Tente novamente'
      @notify_flag = 'error'
    end

    respond_to do |format|
      format.js
    end
  end
end
