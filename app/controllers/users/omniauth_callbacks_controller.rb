class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    authenticate('Github')
  end

  def google_oauth2
    authenticate('Google')
  end

  private

  def authenticate(kind)
    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: kind)
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = I18n.t(
        'devise.omniauth_callbacks.failure',
        kind: kind,
        reason: 'authentication error'
      )

      redirect_to root_path
    end
  end
end
