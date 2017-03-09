class ConnectionsController < ApplicationController
  include LoginRequired

  def index
    @connections = current_user.connections
  end
end
