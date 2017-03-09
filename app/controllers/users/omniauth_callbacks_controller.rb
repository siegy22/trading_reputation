class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include LoginRequired

  skip_before_action :require_login!, only: :reddit
  skip_before_action :verify_authenticity_token

  # reddit provider is only used for login
  def reddit
    @user = User.from_reddit_omniauth(omniauth_info)
    @user.remember_me!
    sign_in_and_redirect @user
  end

  # Will define callback methods for every supported provider
  User.linkable_providers.each do |provider|
    define_method(provider) do
      current_user.link_connection_from_omniauth!(omniauth_info)
      redirect_to :me
    end
  end

  def after_omniauth_failure_path_for(_scope)
    if user_signed_in?
      me_path
    else
      root_path
    end
  end

  private
  def omniauth_info
    Rails.logger.info request.env["omniauth.auth"]
    request.env["omniauth.auth"]
  end
end
