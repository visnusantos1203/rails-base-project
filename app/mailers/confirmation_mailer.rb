class ConfirmationMailer < ApplicationMailer
  def account_approval_email(email)
    mail(to: email, subject: 'Yaay! Your account has been approved!')
  end
end
