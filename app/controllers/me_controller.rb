class MeController < ApplicationController
  include LoginRequired

  def show
    @me = current_user
  end

  def edit
    @me = current_user
  end

  def update
    # clone to prevent that current_user
    # changes (would affect the navigation)
    @me = current_user.clone
    if @me.update(me_params)
      redirect_to me_path, notice: "Profile updated"
    else
      render :edit
    end
  end

  private
  def me_params
    params.require(:user).permit(:name, :avatar, :old_rep_comment)
  end
end
