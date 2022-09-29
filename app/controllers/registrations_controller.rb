# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    super
    UserMailer.registration(@user).deliver_now if @user.persisted?
  end
end
