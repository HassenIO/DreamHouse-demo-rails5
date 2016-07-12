class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @properties = current_user.properties
    render 'properties/index'
  end

end
