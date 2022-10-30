class AdminMailer < ApplicationMailer

  def update_email(current_admin, admin)
    @current_admin = current_admin
    @admin = admin
    mail(to: @admin.email, subject: 'Seus dados foram alterados!')
  end

  def send_message(current_admin, recipient_email, subject, message)
    @current_admin = current_admin
    @recipient_email = recipient_email
    @subject = subject
    @message = message
    mail(to: @recipient_email, subject: @subject.to_s)
  end
end
