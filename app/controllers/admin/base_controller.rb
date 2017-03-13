module Admin
  class BaseController < ApplicationController
    include LoginRequired
    before_action :require_admin_role!

    def require_admin_role!
      unless current_user.roles.include?(Role.admin)
        raise ActionController::RoutingError, "Admin role is required"
      end
    end
  end
end
