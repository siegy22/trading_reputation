class PagesController < ApplicationController
  def show
    public_send(params[:page]) if action_methods.include?(params[:page])
    page_path = "pages/#{params[:page]}"
    if template_exists?(page_path)
      render page_path
    else
      render_404
    end
  end
end
