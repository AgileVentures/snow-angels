class AdminMailer < ApplicationMailer

  def welcome_email(admin)
    @admin = admin
    @url  = 'http://localhost:3000/admins/sign_in'
    mail(to: @admin.email, subject: 'Welcome to My Awesome Site')
  end
end
