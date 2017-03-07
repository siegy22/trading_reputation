module LoginRequired
  extend ActiveSupport::Concern

  included do
    before_action :require_login!
  end

  def require_login!
    unless user_signed_in?
      raise ActionController::RoutingError, "Login is required"
    end
  end
end
