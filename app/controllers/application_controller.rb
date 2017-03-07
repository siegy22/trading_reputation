class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    if user.sign_in_count == 1
      flash[:notice] = "Nice to have you here! You can now complete your profile"
      edit_me_path
    else
      flash[:notice] = "You've been logged in, welcome back!"
      me_path
    end
  end
end
