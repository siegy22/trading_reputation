class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def reddit
    @user = User.from_reddit_omniauth(request.env["omniauth.auth"])
    @user.remember_me!
    sign_in_and_redirect @user
  end
end
