class UserMailer < ApplicationMailer
  def registration(registration)
    @name = registration.name
    @email = registration.email

    mail to: @email, subject: default_i18n_subject(name: @name)
  end
end
