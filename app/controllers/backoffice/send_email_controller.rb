class Backoffice::SendEmailController < ApplicationController
  def edit
    @admin = Admin.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def create
    AdminMailer.send_message(current_admin, params[:'recipient-email'], params[:'subject-text'], params[:'message-text']).deliver_now

    respond_to do |format|
      format.js
    end
  end
end
