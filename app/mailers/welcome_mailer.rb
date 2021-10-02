class WelcomeMailer < ApplicationMailer
  def welcome_email(email)
    mail(to: email, subject: 'Welome to StocksCrowd, #{email}!')
  end
end
