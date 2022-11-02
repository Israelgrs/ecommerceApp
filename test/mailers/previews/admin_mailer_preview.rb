class AdminMailerPreview < ActionMailer::Preview
  def update_email
    AdminMailer.update_email(Admin.first, Admin.last)
  end

  def send_message
    AdminMailer.send_message(Admin.first, Admin.last.email, 'subject-text', 'message-text').deliver_now
  end
end